# Grafana

Alloy：日志收集
Loki：日志聚合
Grafana：查询日志

MinIO：对象存储，存储经过Loki过滤后的日志文件

Loki会把日志分成两部分存储在MinIO  
一部分是index，另一部分是chunk  
检索的时候就是根据index去检索的  
chunk一般是日志的具体内容