import os
from jinja2 import Environment, FileSystemLoader

env = Environment(
        loader=FileSystemLoader('./templates'),
    )
nginx_template = env.get_template('nginx.conf')


def render():

    SERVICE_ENABLED = ""
    SERVICE_A_ENABLED = os.getenv("SERVICE_A_ENABLED", None)
    SERVICE_B_ENABLED = os.getenv("SERVICE_B_ENABLED", None)
    SERVICE_IP = ""
    SERVICE_PORT = ""
    schema = "http"
    common_locations = []
    locations = []

    if SERVICE_A_ENABLED:
        SERVICE_ENABLED = "A"
        SERVICE_IP = "127.0.0.1"
        SERVICE_PORT = "8080"
        schema = "http"
        locations = ['/service/a', '/service/a/version', 'service/a/events']

    elif SERVICE_B_ENABLED:
        SERVICE_ENABLED = "B"
        SERVICE_IP = "127.0.0.1"
        SERVICE_PORT = "9000"
        schema = "https"
        locations = ['/service/b', '/service/b/version', 'service/b/events']

    for location in locations:
        common_locations.append(location)

    environ = {
        "SERVICE_ENABLED": SERVICE_ENABLED,
        "SERVICE_IP": SERVICE_IP,
        "SERVICE_PORT": SERVICE_PORT,
        "schema": schema,
        "common_locations": common_locations
    }

    file = "/etc/nginx/nginx.conf"
    with open(file, "w+") as file:
        rendered = nginx_template.render(environ)
        file.write(rendered)


if __name__ == "__main__":
    render()
