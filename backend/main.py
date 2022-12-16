import argparse
import json

parser = argparse.ArgumentParser(description="Create Dockerrun.aws.json")
parser.add_argument("--image_uri", required=True, type=str, help="docker image uri")

args = parser.parse_args()
image_uri = args.image_uri

with open("Dockerrun.aws.template.json") as f:
    config = json.load(f)

config["Image"]["Name"] = image_uri

with open("Dockerrun.aws.json", "w") as f:
    json.dump(config, f, indent=2)

