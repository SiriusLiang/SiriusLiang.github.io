# 在asp中订阅dapr的消息队列

ASP有植入式的SDK.
1. 在`Program.cs`中, `app.MapControllers()`之前:
```csharp
app.UseCloudEvents();
app.MapSubscribeHandler();
```
如果不加`UseCloudEvents()`也会订阅成功, 但在`Controller`中解不出参数.

2. 在`Controller`中的方法上添加`[Topic("{消息borker名称}", "{Topic/Channel}")]`

其中消息broker名称是组件描述`pubsub.yaml`文件中指定的那个
```yaml
metadata:
  name: {消息borker名称}
```
跟配置状态存储的名称类似

3. 方法跟ASP的正常API方法一样, 同一个方法可以既作为API方法又作为订阅方法
```csharp
[Topic("{消息borker名称}", "{Topic/Channel}")]
[HttpPost]
public async Task ServerPost([FromBody] 参数类型 参数名)
{
}
```