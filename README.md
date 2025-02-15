# Bashrc Environment Updater

This is a simple Bash project that lets you update your environment by commenting and uncommenting environment variable definitions (e.g., `export JAVA_HOME`).

## Project Components

- **`bashrc`**
  - A custom bashrc file that includes environment variable definitions and useful functions.
  - Can be used for testing environment variable switching.

- **`switch_variables.sh`**
  - Uncomments a line if exactly one match is found and comments out all other lines.
  - Displays matching lines and prompts you to refine your search if multiple matches are found.
  - Automatically updates your current shell environment by sourcing the modified `bashrc`.

## Requirements

- Bash shell (version 4 or above is recommended)
- Standard Unix utilities: `grep` and `sed`

## Usage

To uncomment the line in `bashrc` containing `export JAVA_HOME` that matches `11` and comment out every other line with `export JAVA_HOME`, you can use:

### Sourcing the Script Directly

```bash
source ./switch_variables.sh ./bashrc JAVA_HOME 11
```

### Using the Functions

```bash
source switch-variables/bashrc
```

After sourcing the provided `bashrc`, you will have access to two functions that serve as shortcuts for the current shell:

```bash
switch_variable JAVA_HOME 11
```

Or the shortcut:

```bash
switch_java 11
```


## Installation

You can install this script by sourcing the custom `bashrc` in your actual `~/.bashrc`:

```bash
source <your_path>/switch-variables/bashrc
```

If you want to use a different file to manage your environment variables (e.g., your actual `~/.bashrc`), edit the `BASHRC_FILE` accordingly.



## Contributing

Contributions are welcome! If you find any errors in the scripts or documentation, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
