FROM qzkc/python2.7:v2

RUN mkdir -p /u01/work
COPY ./bin /u01/work/bin

RUN chmod -R 777 /u01/work/bin

ENV WAS_CELL_NAME DefaultCell01
ENV PERF_SERVLET_URL http://localhost:9080/wasPerfTool/servlet/perfservlet?node=DefaultNode01&server=server1&module=connectionPoolModule+jvmRuntimeModule
ENV REFRESH_INTERVAL 5
ENV INFLUXDB_URL http://localhost:9122

ENTRYPOINT /u01/work/bin/was-metrics-exporter.py -c $WAS_CELL_NAME -u $PERF_SERVLET_URL -s $REFRESH_INTERVAL -i $INFLUXDB_URL -d demo
