import json

import requests

groupUrl = "https://gitlab.com/api/v4/groups/{group}/projects?private_token={token}"
labelsUrl = "https://gitlab.com/api/v4/projects/{project_id}/labels?private_token={token}"


def main():
    print("Enter GitLab Private Token:")
    key = input()
    key = key.strip()

    print("Enter GitLab Group Name:")
    group = input()

    if (not group):
        print("group should not be empty")
        return

    url = groupUrl.replace("{group}", group)
    url = url.replace("{token}", key)

    answer = requests.get(url)

    if (answer.status_code != 200):
        print(answer.json()['message'] + " for group: " + group)
        return

    projects = answer.json()

    ids = []
    for count, project in enumerate(projects):
        name = "%2d %20s: %8d" % (count + 1, project['name'], project['id'])
        ids.append(project['id'])
        print(name)

    if (len(ids) < 1):
        print("No Repository found for group: " + group)

    print("Choose Repository:")
    choosedId = int(input()) - 1
    repositoryId = ids[choosedId]
    url = labelsUrl.replace('{project_id}', str(repositoryId))
    url = url.replace("{token}", key)
    answer = requests.get(url)
    if (answer.status_code == 200):
        with open('labels.json') as file:
            labels = json.load(file)
        for label in labels:
            answer = requests.post(url, {"name": label[0], "color": label[1]}).json()
            if ('name' in answer or 'color' in answer):
                print("Label %10s with color %10s created" % (answer['name'], answer['color']))
            elif ('message' in answer):
                print(answer['message'] + ": " + label[0])
            else:
                print(answer)


if __name__ == "__main__":
    main()
