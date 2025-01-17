#!/bin/bash

# MongoDB Connection String
MONGO_URI=$1

# MongoDB Shell Command to Create Collection and Schema
mongosh "$MONGO_URI" <<EOF
use test

// Create a collection
db.createCollection("myCollection")

// Define a schema using JSON Schema validation
db.runCommand({
  collMod: "myCollection",
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "age"],
      properties: {
        name: {
          bsonType: "string",
          description: "must be a string and is required"
        },
        age: {
          bsonType: "int",
          minimum: 0,
          description: "must be an integer greater than or equal to 0 and is required"
        }
      }
    }
  },
  validationLevel: "strict"
})
EOF
