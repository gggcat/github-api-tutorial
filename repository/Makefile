REPO_NAME=test_repo

list:
	curl -H "Authorization: token $(GITHUB_TOKEN)" -i "https://api.github.com/users/$(GITHUB_USER)/repos"

get:
	# GET /repos/:owner/:repo/readme
	curl -H "Authorization: token $(GITHUB_TOKEN)" -i "https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)"

create:
	bash create.sh $(REPO_NAME)

delete:
	curl -H "Authorization: token $(GITHUB_TOKEN)" -X DELETE -i "https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)"
