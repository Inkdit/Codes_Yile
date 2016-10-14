...

launch the ECS instance to the InkditStats cluster by using the following script in Advanced Details under User data


```bash
#!/bin/bash
echo ECS_CLUSTER=InkditStats >> /etc/ecs/ecs.config
```