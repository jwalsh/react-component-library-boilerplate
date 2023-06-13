#!/usr/bin/env bash

# Directory to store the packages
PACKAGES_DIR="packages"

# Sample packages to create
declare -A PACKAGES=(
  ["button"]="Button"
  ["input"]="Input"
  ["modal"]="Modal"
)

# Create the packages directory if it doesn't exist
mkdir -p "$PACKAGES_DIR"

# Scaffold each package
for PACKAGE_DIR in "${!PACKAGES[@]}"; do
  COMPONENT_NAME="${PACKAGES[$PACKAGE_DIR]}"
  PACKAGE_PATH="$PACKAGES_DIR/$PACKAGE_DIR"
  COMPONENT_PATH="$PACKAGE_PATH/src/$COMPONENT_NAME.tsx"
  TEST_PATH="$PACKAGE_PATH/src/$COMPONENT_NAME.test.tsx"

  # Create package directory and src directory
  mkdir -p "$PACKAGE_PATH/src"

  # Generate package.json
  echo "{
  \"name\": \"$PACKAGE_DIR\",
  \"version\": \"1.0.0\",
  \"main\": \"src/$COMPONENT_NAME.tsx\",
  \"scripts\": {
    \"test\": \"jest\"
  },
  \"peerDependencies\": {
    \"react\": \"^18.0.0\",
    \"react-dom\": \"^18.0.0\"
  }
}" > "$PACKAGE_PATH/package.json"

  # Generate basic React component in TypeScript
  echo "import React from 'react';

interface $COMPONENT_NAMEProps {
  // Define component props here
}

export const $COMPONENT_NAME: React.FC<$COMPONENT_NAMEProps> = (props) => {
  // Component logic here
  return (
    <div>
      $COMPONENT_NAME Component
    </div>
  );
};" > "$COMPONENT_PATH"

  # Generate basic test file using Jest and React Testing Library
  echo "import React from 'react';
import { render, screen } from '@testing-library/react';
import { $COMPONENT_NAME } from './$COMPONENT_NAME';

describe('$COMPONENT_NAME', () => {
  test('renders $COMPONENT_NAME component', () => {
    render(<$COMPONENT_NAME />);
    expect(screen.getByText('$COMPONENT_NAME Component')).toBeInTheDocument();
  });
});" > "$TEST_PATH"

  # Notify the user that the package was scaffolded
  echo "Scaffolded package: $PACKAGE_PATH"
done

# Notify the user that all packages were scaffolded
echo "All packages have been successfully scaffolded in the '$PACKAGES_DIR/' directory."
