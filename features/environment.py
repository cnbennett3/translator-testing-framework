import os
import time

def before_all(context):
    context.target = 'http://127.0.0.1:9999'

    tranql_conf = {
        'local': "http://localhost:8001/tranql/query?dynamic_id_resolution=true",
        'dev' : "https://tranql-dev.renci.org/tranql/query?dynamic_id_resolution=true",
        'prod' : "https://tranql.renci.org/tranql/query?dynamic_id_resolution=true"
    };
    environment = os.getenv('ENV', "local")
    print (f" Environment: {environment}")
    context.tranql_url = tranql_conf[environment]
    print (f"TranQL URL ({environment}): {context.tranql_url}")

def after_all(context):
    pass
