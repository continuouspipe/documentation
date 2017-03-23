---
title: Notifications
menu:
  main:
    parent: 'configuration'
    weight: 70

weight: 70
---
ContinuousPipe can send notifications about the tide statuses. This will help the development, QA or product team to have information about the deployments and the available feature branches.

The notifications are configured in the `notifications` section. All of them can be filtered by event, as in the following example.

``` yaml
notifications:
    default:
        github_pull_request: false

    pull_request_on_success:
        github_pull_request: true
        when:
            - success

    slack_everything:
        slack:
            webhook_url: https://...
        when:
            - pending
            - running
            - success
            - failure
```

## GitHub
When using a GitHub repository, two notification types are by default enabled: the commit status and the pull-request comments.

If you feel too overloaded, you can disable them with the following configuration:

``` yaml
notifications:
    default:
        github_commit_status: false
        github_pull_request: false
```

## Slack
You can send a Slack notification in a Slack webhook. You just have to create a webhook integration into your Slack channel and configure the webhook URL as in the following example:

``` yaml
notifications:
    slack_to_my_organisation:
        slack:
            webhook_url: https://hooks.slack.com/services/[...]/[...]/[...]
```

Again, if this creates too much noise, you can filter the notices according to status:

``` yaml
notifications:
    slack_to_my_organisation:
        slack:
            webhook_url: https://hooks.slack.com/services/[...]/[...]/[...]
        when:
            - success
            - failure
```