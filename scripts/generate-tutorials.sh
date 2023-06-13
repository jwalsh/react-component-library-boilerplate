#!/usr/bin/env bash

# Directory to store the tutorial files
DOCS_DIR="docs"

# Create the docs directory if it doesn't exist
mkdir -p "$DOCS_DIR"

# Tutorial titles and corresponding filenames
declare -A TUTORIALS=(
  ["Setting Up the Development Environment"]="setting-up-dev-environment"
  ["Getting Started with React Component Library"]="getting-started"
  ["Introduction to TypeScript for React Development"]="intro-to-typescript"
  ["Creating and Styling a Button Component"]="creating-button-component"
  ["Building an Input Component with Validation"]="building-input-component"
  ["Designing a Modal Component"]="designing-modal-component"
  ["Writing Tests for React Components"]="writing-tests"
  ["Documenting Components with Storybook"]="documenting-components"
  ["Organizing and Managing Packages with Yarn Workspaces"]="organizing-packages-yarn-workspaces"
  ["Best Practices for Component Development"]="best-practices"
  ["Automating Releases with GitHub Actions"]="automating-releases"
  ["Publishing Components to the Package Registry"]="publishing-components"
)

# Generate tutorial files in Org mode format
for TITLE in "${!TUTORIALS[@]}"; do
  FILENAME="${TUTORIALS[$TITLE]}"
  FILEPATH="$DOCS_DIR/$FILENAME.org"

  # Write the Org mode header and title to the file
  echo "#+TITLE: $TITLE" > "$FILEPATH"
  echo "" >> "$FILEPATH"
  echo "* $TITLE" >> "$FILEPATH"
  echo "" >> "$FILEPATH"
  echo "Content coming soon..." >> "$FILEPATH"

  # Notify the user that the file was generated
  echo "Generated tutorial: $FILEPATH"
done

# Notify the user that all tutorials were generated
echo "All tutorials have been successfully generated in the '$DOCS_DIR/' directory."
