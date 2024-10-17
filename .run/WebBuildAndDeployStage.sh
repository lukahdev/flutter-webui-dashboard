#!/bin/bash



# Set script to exit immediately if any command fails
set -e


# Define variables
SOURCE_BRANCH="stage"      # or your main development branch
DEPLOY_BRANCH="stage"      # the branch you want to use for deployment
REPO_URL="git@github.com:cheil-vendor-portal/VendorPortal_APP.git"  # replace with your actual repository URL

#====================================================================================
# Build the Flutter web app
echo "Building Flutter web app..."
OUTPUT_DIR="C:\xampp\htdocs\vendorportal.cheil.rocks\app"

# Default base href
DEFAULT_HREF="/"

# Desired base href
BASE_HREF="./"

# Modify the base href in index.html
sed -i "s|<base href=\".*\">|<base href=\"$BASE_HREF\">|" web/index.html

# Build Flutter web app
flutter build web --output="$OUTPUT_DIR"

# Revert the default base href in index.html
sed -i "s|<base href=\".*\">|<base href=\"$DEFAULT_HREF\">|" web/index.html

#====================================================================================

# Echo the current directory
cd "$OUTPUT_DIR"
echo "Current directory is: $(pwd)"

eval $("ssh-agent")
ssh-add ~/.ssh/id_gitcheilrainne

git status

## Checkout to the source branch and pull the latest changes
#echo "Checking out to source branch: $SOURCE_BRANCH"
#git checkout $SOURCE_BRANCH
#git pull $REPO_URL $SOURCE_BRANCH
#
## Checkout to the deploy branch, create it if it doesn't exist
#if git show-ref --verify --quiet "refs/heads/$DEPLOY_BRANCH"; then
#  echo "Existing deployment branch found. Checking out..."
#  git checkout $DEPLOY_BRANCH
#else
#  echo "Creating new deployment branch: $DEPLOY_BRANCH"
#  git checkout -b $DEPLOY_BRANCH
#fi
#
## Pull latest changes on the deploy branch
#echo "Pull branch with rebase: $DEPLOY_BRANCH"
#git pull origin $DEPLOY_BRANCH --rebase


# Add all files and commit
echo "Committing build files with message: $COMMIT_MESSAGE"
git add .

# Check for commit message argument
echo "Please enter commit message"
read COMMIT_MESSAGE
if [ -z "$COMMIT_MESSAGE" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 \"Your commit message here\""
  exit 1
fi

# Retrieve commit message
git commit -m "$COMMIT_MESSAGE"

# Push to the remote repo deploy branch
echo "Pushing to remote repository..."
git push $REPO_URL $DEPLOY_BRANCH

## Return to the source branch
#echo "Returning to source branch..."
#git checkout $SOURCE_BRANCH

# Pull latest changes on the deploy branch
echo "Pull branch with rebase: $DEPLOY_BRANCH"
git pull origin $DEPLOY_BRANCH --rebase

echo "Deployment complete."
