---
title: "Command: Destroy"
menu:
  main:
    parent: 'remote-development'
    weight: 130

weight: 130

aliases:
    - /remote-development/destroy-command/
---
## Using the Destroy Command

```
cp-remote destroy
```

The `destroy` command will delete the remote branch used for your remote environment. ContinuousPipe will then remove the environment.

***

{{< figure src="/docs/images/remote-development/cp-remote-development-destroy.svg" class="remote-development" >}}

## Command Reference

### Options:

Option | Alias | Default | Description
-------|-------|---------|------------
`--config` | | | Local config file. Default is `.cp-remote-settings.yml` within working directory.
