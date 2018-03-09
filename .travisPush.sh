export GIT_SSH_COMMAND="ssh -i ./deploy.key"

setup_git() {
  git config --global user.email "build@travis-ci.org"
  git config --global user.name "build"
}

commit_website_files() {
  git add . *
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git push --quiet --set-upstream
}

setup_git
commit_website_files
upload_files
