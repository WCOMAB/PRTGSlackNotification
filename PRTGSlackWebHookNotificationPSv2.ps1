# ----------------------------------------------------------------------------------------------
# Copyright (c) WCOM AB 2016.
# ----------------------------------------------------------------------------------------------
# This source code is subject to terms and conditions of the The MIT License (MIT)
# copy of the license can be found in the LICENSE file at the root of this distribution.
# ----------------------------------------------------------------------------------------------
# You must not remove this notice, or any other, from this software.
# ----------------------------------------------------------------------------------------------
Param(
    [string]$SlackWebHook,
    [string]$SlackChannel,
    [string]$SiteName,
    [string]$Device,
    [string]$Name,
    [string]$Status,
    [string]$Down,
    [string]$DateTime,
    [string]$LinkDevice,
    [string]$Message
)

Add-Type -AssemblyName System.Web.Extensions
function ConvertTo-Json ([Object] $value)
{
    [System.Web.Script.Serialization.JavaScriptSerializer] $jsSerializer = New-Object 'System.Web.Script.Serialization.JavaScriptSerializer'
    $jsSerializer.Serialize($value)
}

$postSlackMessage = ConvertTo-Json(@{
    channel      = $SlackChannel;
    unfurl_links = "true";
    username     = "PRTG";
    icon_url     = "http://www.paessler.com/static/banner_1s_80x80.png"
    text         = "*$($sitename)*
<$($LinkDevice)|$($Device) $($Name)>
Status $($Status) $($Down) on $($DateTime)
``````$($Message)``````";
    })

$postSlackMessage | Out-File -FilePath slack.log

[System.Net.WebClient] $webclient = New-Object 'System.Net.WebClient'
$webclient.UploadData($SlackWebHook, [System.Text.Encoding]::UTF8.GetBytes($postSlackMessage)) | Out-File -FilePath slack.log -Append