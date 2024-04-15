#!/bin/bash

# Function to clone the CMS repository and rename it for the new project
clone_and_rename_cms() {
    # Clone the CMS repository
    git clone (add your URL) "$1"
    cd "$1" || exit

    # Rename occurrences of "cms" with the project name in necessary files
    find . -type f -exec sed -i "s/cms/$1/g" {} +

    # Rename the project folder
    mv cms "$1"

    # Update the artifactId and name in the pom.xml file
    sed -i "s/cms/$1/g" pom.xml

}

# Function to set up a new frontend template repository
setup_frontend_template() {
    # Clone the frontend template repository
    git clone (add your URL) "$1-frontend-template"
    cd "$1-frontend-template" || exit

    # Rename occurrences of "myproject" with the project name in necessary files
    find . -type f -exec sed -i "s/myproject/$1/g" {} +


    # Run npm install
    npm install
}

# Main script
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

# Clone and rename the CMS repository for the new project
clone_and_rename_cms "$1"

# Set up a new frontend template repository
setup_frontend_template "$1"
