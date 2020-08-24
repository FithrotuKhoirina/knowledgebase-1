#!/bin/sh -l

echo "Start"

# Get data from github action
SRC_DIR="$1"
DEST_GITHUB_USERNAME="$2"
USER_EMAIL="$3"
DEST_BRANCH="$4"

SOURCE_TABLE="list_system.csv" # get list of system
SYSTEM_NAME=$(git log -1 --pretty=%B) # get which system from git commit

# Get REPO URL to push
OLDIFS=$IFS
IFS=',' # separate line with comma
[ ! -f $SOURCE_TABLE ] && { echo "$SOURCE_TABLE file not found"; exit 99; } # check if file is available

while read Repo URL # will read $SOURCE_TABLE 
do
    if [ $SYSTEM_NAME == $Repo ];
    then
      DEST_GITHUB_REPO=$URL
      break
    fi 
done < $SOURCE_TABLE
IFS=$OLDIFS

if [ -z "$DEST_GITHUB_REPO" ]; # check if commit msg is valid
then
  echo "Should exit"
  exit 1
fi 


CLONE_DIR=$(mktemp -d)

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$DEST_GITHUB_USERNAME"
git clone --single-branch -b $DEST_BRANCH "https://$API_TOKEN_GITHUB@$DEST_GITHUB_REPO.git" "$CLONE_DIR"

echo 'Copying from '"$SRC_DIR"'/*' "to $CLONE_DIR/$SYSTEM_NAME"
mkdir -p "$CLONE_DIR/$SYSTEM_NAME"
cp -R "$SRC_DIR"/* "$CLONE_DIR/$SYSTEM_NAME" || (rm -Rf "$CLONE_DIR" && exit 1)

cd "$CLONE_DIR"
git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA"
git push origin $DEST_BRANCH
