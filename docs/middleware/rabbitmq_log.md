# RabbitMq开启消息追踪 查看

1. docker中启用插件, 默认不开启.

```bash
docker exec -it rabbitmq_name bash

```
```bash
rabbitmq-plugins enable rabbitmq_tracing
rabbitmqctl trace_on

```

2. 新建追踪
在浏览器管理中, admin页签中会多出一个Tracing. 添加追踪. 

3. 查看
页面内会多出个日志文件, 点击可以查看
