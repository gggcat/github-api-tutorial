REPO_NAME=test_repo
SECRET_KEY=testkey
SECRET_VALUE=valval
PUBLIC_KEY=$(shell curl --silent -H "Authorization: token ${GITHUB_TOKEN}" "https://api.github.com/repos/${GITHUB_USER}/${REPO_NAME}/actions/secrets/public-key" | jq '.key')
PUBLIC_KEYID=$(shell curl --silent -H "Authorization: token ${GITHUB_TOKEN}" "https://api.github.com/repos/${GITHUB_USER}/${REPO_NAME}/actions/secrets/public-key" | jq '.key_id')
ENCRYPTED_VALUE=$(shell python secret_value.py $(PUBLIC_KEY) $(SECRET_VALUE))

list:
	# /repos/:owner/:repo/actions/secrets
	curl -H "Authorization: token $(GITHUB_TOKEN)" -i "https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)/actions/secrets"

get:
	# GET /repos/:owner/:repo/readme
	curl -H "Authorization: token $(GITHUB_TOKEN)" -i "https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)/actions/secrets/$(SECRET_KEY)"

update:
	# PUT /repos/:owner/:repo/actions/secrets/:secret_name
	curl -H "Authorization: token $(GITHUB_TOKEN)" -X PUT -d "{ \"encrypted_value\": \"$(ENCRYPTED_VALUE)\", \"key_id\": \"$(PUBLIC_KEYID)\" }" -i "https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)/actions/secrets/$(SECRET_KEY)"

delete:
	curl -H "Authorization: token $(GITHUB_TOKEN)" -X DELETE -i "https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)/actions/secrets/$(SECRET_KEY)"
