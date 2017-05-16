---
title: "Concepts: Tasks"
menu:
  main:
    parent: 'basics'
    weight: 16

weight: 16
---

## Tasks

Tasks are the central element of ContinuousPipe configuration. By breaking down the configuration into smaller tasks, they can be composed together to create a flexible workflow. The primary tasks handle the configuration of the Docker image build and Kubernetes cluster deployment, however additional tasks can be added to do the following:

- Run arbitrary setup commands
- Wait for the results of other GitHub integrations (e.g. Scrutinizer)
- Require manual approval prior to deployment
- Trigger a webhook
- Trigger notifications of build state to Slack

Tasks can also be conditional so only trigger in response to certain branch name formats or certain pull request labels. By default, tasks will run in declaration sequence, but for more powerful task control pipelines can be defined. These allow different tide execution plans, running only specified tasks in a specified order.

### Tide Triggers with Task Filters

The following diagram shows how a tide can be triggered. Additionally, it shows how [task filters]({{< relref "configuration/tasks.md#filters" >}}) can affect the execution of the tide:

{{< figure src="/images/basics/cp-tide-triggers-default.svg" class="diagram concepts" >}}

### Tide Triggers with Pipeline Filters

The following diagram shows an alternative configuration using [pipeline filters]({{< relref "configuration/pipelines.md" >}}):

{{< figure src="/images/basics/cp-tide-triggers-pipeline.svg" class="diagram concepts" >}}

{{< note title="Note" >}}
It is also possible to add filters to tasks when using pipelines. This creates unnecessary complexity however, so is not recommended.
{{< /note >}}
