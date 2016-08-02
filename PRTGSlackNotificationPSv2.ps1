# ----------------------------------------------------------------------------------------------
# Copyright (c) WCOM AB 2015.
# ----------------------------------------------------------------------------------------------
# This source code is subject to terms and conditions of the The MIT License (MIT)
# copy of the license can be found in the LICENSE file at the root of this distribution.
# ----------------------------------------------------------------------------------------------
# You must not remove this notice, or any other, from this software.
# ----------------------------------------------------------------------------------------------
Param(
    [string]$SlackToken,
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

[System.Collections.Specialized.NameValueCollection] $values = New-Object 'System.Collections.Specialized.NameValueCollection'
$values.Add('token', $SlackToken)
$values.Add('channel', $SlackChannel)
$values.Add('unfurl_links','true')
$values.Add('username','PRTG')
$values.Add('icon_url','http://www.paessler.com/static/banner_1s_80x80.png')
$values.Add('text', "*$($sitename)*
<$($LinkDevice)|$($Device) $($Name)>
Status $($Status) $($Down) on $($DateTime)
``````$($Message)``````")

[System.Net.WebClient] $webclient = New-Object 'System.Net.WebClient'
$webclient.UploadValues('https://slack.com/api/chat.postMessage', $values)