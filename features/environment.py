import os
import time

def before_all(context):
    context.target = 'http://127.0.0.1:9999'

    tranql_conf = {
        'dev' : "http://localhost:8001/tranql/query",
        'prod' : "https://tranql.renci.org/tranql/query"
    };
    environment = os.getenv('ENV', "prod")
    print (f" Environment: {environment}")
    context.tranql_url = tranql_conf[environment]
    print (f"TranQL URL ({environment}): {context.tranql_url}")

def after_all(context):
    pass


def after_scenario(context, scenario):
    # For ICEES test cases, we need a delay before starting the next
    # test because behave is sending queries to the server too fast,
    # causing it to return bad response codes.
    if scenario.name == "Test TranQL's answer when querying only ICEES":
        time.sleep(10)
