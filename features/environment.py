import os
import time

def before_all(context):
    context.target = 'http://127.0.0.1:9999'

    tranql_conf = {
        'dev' : "https://tranql-dev.renci.org/tranql/query",
        'prod' : "https://tranql.renci.org/tranql/query"
    };
    environment = os.getenv('ENV', "dev")
    print (f" Environment: {environment}")
    context.tranql_url = tranql_conf[environment]
    print (f"TranQL URL ({environment}): {context.tranql_url}")

def after_all(context):
    pass
