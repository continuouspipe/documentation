---
title: Creating a Tide
menu:
  main:
    parent: 'quick-start'
    weight: 70

weight: 70
---
The flow is now ready to run. An execution of a flow is called a tide.

![](/images/quick-start/flow-overview-no-tide.png)

The easiest way to create the tide is to run it manually. To do this click the "START MANUALLY" button in the top right of the interface.

You will need to enter a branch from your code repository e.g. `master` in the Branch field. 

Then click "CREATE" to start the tide.

You will initially be shown the "Tides" tab. If you return to the "Overview" tab you will be able to see updates on the tide as it progresses.

![](/images/quick-start/flow-overview-tide-success.png)

If you click on the tide it will give you more information. Each of the sections is expandable and will show more detail on the processes the tide ran.

![](/images/quick-start/flow-info-expanded.png)

If you then go to the "Environments" tab, you will see an entry representing the Kubernetes cluster associated with the tide that was just run. 

![](/images/quick-start/flow-environments-overview.png)

If you click the "OPEN" button you will see a confirm message to let you know that you are being redirected outside ContinuousPipe to the deployed environment. Click "OPEN IT" to proceed. Finally, you should see your deployed site in a new tab.

![](/images/quick-start/flow-environments-view-endpoint.png)


