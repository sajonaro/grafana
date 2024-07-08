

# this small POC explores how to
 -  build visualizations in grafana based on data stored in postgresdb
 -  store that visualization in a json file so that every time we rebuild grafana container - the dashboard gets reloaded from the file 

# steps involved
- run grafana with a database via docker compose
    ```
    docker compose up
    ``` 
- create (manually for the first time) the dashboard, and then
    - click SHARE:EXPORT:View JSON 
    - save the contents of .json file in ./provisioning/dashboards/home.json file  (or any other path)
- create as well ./provisioning/datasources/datasources.yaml file (with connection parameters corresponding to connection details defined for database, check docker-compose.yaml service name db)
- in docker compose give grafana container following parameters:
    ```
     environment:
        GF_DASHBOARDS_DEFAULT_HOME_DASHBOARD_PATH: /etc/grafana/provisioning/dashboards/home.json
     volumes:
        - ./provisioning:/etc/grafana/provisioning 
    ```
- now every time you re-run specified docker compose stack: the dashboard will be reloaded from the .json file                    