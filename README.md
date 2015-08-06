# PRTGSlackNotification
PowerShell script for sending [PRTG Network Monitoring](http://www.paessler.com/prtg) notifications to [Slack](https://slack.com/) channel

## Example
![PRTG Slack Sample Notification](https://raw.githubusercontent.com/WCOMAB/PRTGSlackNotification/master/images/prtgslacksamplenotification.jpg)

## Notifications using user token

### Installation
Copy the [PRTGSlackNotification.ps1](https://github.com/WCOMAB/PRTGSlackNotification/blob/master/PRTGSlackNotification.ps1) to your `PRTG` installations `Notifications\EXE` folder i.e. `C:\Program Files (x86)\PRTG Network Monitor\Notifications\EXE` on your monitoring server.

### Configuration
The notification is configured as an `EXECUTE PROGRAM` notifcation with following parameters
```powershell
-SlackToken '<your slack token>' -SlackChannel '#prtg' -SiteName '%sitename' -Device '%device' -Name '%name' -Status '%status' -Down '%down' -DateTime '%datetime' -LinkDevice '%linkdevice' -Message '%message'
```
Replace `-SlackToken` parameter value `<your slack token>` with your `API token` you can find it on the [Slack Web API](https://api.slack.com/web) page.
If you want to post to another channel than `#PRTG`, then just replace `-SlackChannel` parameter value with the channel of your choice.

![PRTG Notifications](https://raw.githubusercontent.com/WCOMAB/PRTGSlackNotification/master/images/prtgslacknotificationsettings.png)

## Notifications using incoming web hook
Using an incoming web hook is probably the prefered way

### Installation
Copy the [PRTGSlackWebHookNotification.ps1](https://github.com/WCOMAB/PRTGSlackNotification/blob/master/PRTGSlackWebHookNotification.ps1) to your `PRTG` installations `Notifications\EXE` folder i.e. `C:\Program Files (x86)\PRTG Network Monitor\Notifications\EXE` on your monitoring server.

### Configuration
The notification is configured as an `EXECUTE PROGRAM` notifcation with following parameters
```powershell
-SlackWebHook '<your slack web hook url>' -SlackChannel '#prtg' -SiteName '%sitename' -Device '%device' -Name '%name' -Status '%status' -Down '%down' -DateTime '%datetime' -LinkDevice '%linkdevice' -Message '%message'
```
Replace `-SlackWebHook` parameter value `<your slack web hook url>` with your `Webhook URL` you can setup a new one the [New Slack Incoming WebHook](https://my.slack.com/services/new/incoming-webhook/) page or pick one existing on the [Integrations](https://my.slack.com/services) page by chosing one of the existing `Incoming WebHooks`.
If you want to post to another channel than `#PRTG`, then just replace `-SlackChannel` parameter value with the channel of your choice.

![PRTG Notifications](https://raw.githubusercontent.com/WCOMAB/PRTGSlackNotification/master/images/prtgslackwebhooknotificationsettings.png)