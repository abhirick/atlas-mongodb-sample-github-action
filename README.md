# Numbers to Words CLI

## Overview
A command-line interface (CLI) tool that converts integers (0–100000) into words.

---
## Features
- Converts numbers between **0 and 100000** into words
- Handles grammar correctly (e.g., `"one hundred and one"`, `"twelve thousand, three hundred and forty-five"`)
- Rejects invalid or out-of-range inputs
- Follows standard exit codes:
  - `0` → Success
  - `1` → Error (invalid input)

---

## Requirements
- Java 17+ installed
- Bash shell

---

## Setup & Compilation
Extract the package, then compile:
```bash
javac -d bin $(find src/main/java -name "*.java")
```
This will generate the compiled classes inside the bin/ directory.

---

## Setup CLI Script
Create the CLI runner script:
```bash
touch bin/numbers-to-words
chmod +x bin/numbers-to-words
```
Edit bin/numbers-to-words and add the following:
```bash

# Get the directory of the script
DIR="$(cd "$(dirname "$0")" && pwd)"

# Run the Java CLI, passing all arguments
java -cp "$DIR" com.challenge.numbertowords.Application "$@"
```
---

## Running the CLI
Run the CLI using the provided script:
```bash
./bin/numbers-to-words [number]
```
---

## Example Usage
```bash
./bin/numbers-to-words 52
# fifty-two

./bin/numbers-to-words 1000
# one thousand

./bin/numbers-to-words 101
# one hundred and one

./bin/numbers-to-words 352
# three hundred and fifty-two

./bin/numbers-to-words 12300
# twelve thousand, three hundred

./bin/numbers-to-words 12055
# twelve thousand and fifty-five

./bin/numbers-to-words 12345
# twelve thousand, three hundred and forty-five
```
---
## Validation
The CLI validates input to ensure it is a valid integer within the range of 0 to 100,000.
If the input is invalid, it will return an error message and exit with code `1`.

Accepts only integers in the range 0–100,000
Rejects:
    Negative numbers
    Numbers > 100,000
    Non-numeric input
On invalid input:
    Prints an error message
    Exits with status code 1

---

## Testing
You can run quick tests using:
```bash
./bin/numbers-to-words 1
./bin/numbers-to-words 101
./bin/numbers-to-words 1111
```
---

## Error Handling
This CLI has clear error handling for invalid scenarios:

Missing argument
```bash
./bin/numbers-to-words
# Error: Please provide a number to convert.
# Exit code: 1
```

Non-numeric input
```bash
./bin/numbers-to-words Test
# Error: Invalid input. Please enter a valid integer.
# Exit code: 1
```

Out of range (< 0 or > 100000)
```bash
./bin/numbers-to-words 200000
# Error: Number out of supported range (0–100,000).
# Exit code: 1
```
---

## Assumptions

    -Input is always provided as a command-line argument.
    -Output must strictly match expected grammar and formatting.
    -Numbers outside the allowed range are rejected gracefully.

## Exit Codes
- **Exit Codes**:
  - `0` → Successful conversion
  - `1` → Error (invalid input, missing argument, out-of-range number)

## Author Notes

   Developed as part of a coding challenge
   Designed for clarity, correctness, and ease of execution

---
