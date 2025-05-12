#!/bin/bash
set -e

# List of modules to build
modules=("configserver" "eurekaserver" "accounts" "cards" "loans")

echo "🔧 Building and preparing JARs for: ${modules[*]}"

for module in "${modules[@]}"; do
  echo "➡️  Building $module"
  cd "$module"

  # Clean and build the Spring Boot app
  ./mvnw clean package -DskipTests

  # Copy resulting JAR to a standard name
  jar_file=$(ls target/*.jar | grep -v 'original' || true)

  if [[ -f $jar_file ]]; then
    echo "✅ Found JAR: $jar_file"
    cp "$jar_file" target/app.jar
  else
    echo "❌ No JAR file found in $module/target/"
    exit 1
  fi

  cd ..
done

echo "✅ All modules built and renamed to app.jar"
