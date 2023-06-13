#!/usr/bin/env bash

# Check if a package name argument was provided
if [ -z "$1" ]; then
  echo "Usage: ./create-package.sh <PackageName>"
  exit 1
fi

# Directory to store the packages
PACKAGES_DIR="packages"

# Extract the package name argument
PACKAGE_NAME="$1"
PACKAGE_DIR="$PACKAGES_DIR/$PACKAGE_NAME"
COMPONENT_PATH="$PACKAGE_DIR/src/$PACKAGE_NAME.tsx"
TEST_PATH="$PACKAGE_DIR/src/$PACKAGE_NAME.test.tsx"

# Create package directory and src directory
mkdir -p "$PACKAGE_DIR/src"

# Generate package.json
echo "{
  \"name\": \"$PACKAGE_NAME\",
  \"version\": \"1.0.0\",
  \"main\": \"src/$PACKAGE_NAME.tsx\",
  \"scripts\": {
    \"test\": \"jest\"
  },
  \"peerDependencies\": {
    \"react\": \"^18.0.0\",
    \"react-dom\": \"^18.0.0\"
  }
}" > "$PACKAGE_DIR/package.json"

# Generate basic React component in TypeScript
echo "import React from 'react';

interface $PACKAGE_NAMEProps {
  // Define component props here
}

export const $PACKAGE_NAME: React.FC<$PACKAGE_NAMEProps> = (props) => {
  // Component logic here
  return (
    <div>
      $PACKAGE_NAME Component
    </div>
  );
};" > "$COMPONENT_PATH"

# Generate basic test file using Jest and React Testing Library
echo "import React from 'react';
import { render, screen } from '@testing-library/react';
import { $PACKAGE_NAME } from './$PACKAGE_NAME';

describe('$PACKAGE_NAME', () => {
  test('renders $PACKAGE_NAME component', () => {
    render(<$PACKAGE_NAME />);
    expect(screen.getByText('$PACKAGE_NAME Component')).toBeInTheDocument();
  });
});" > "$TEST_PATH"

# Notify the user that the package was created
echo "Created package: $PACKAGE_DIR"
