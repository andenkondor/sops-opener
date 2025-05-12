# SOPS Opener

A simple Zsh script that automatically detects and decrypts SOPS-encrypted files, making them easy to view and work with.

## What is SOPS?

[SOPS (Secrets OPerationS)](https://github.com/mozilla/sops) is Mozilla's tool for encrypting and decrypting files. It's particularly useful for managing secrets in configuration files and other sensitive data.

## Features

- Automatically detects if a file is SOPS-encrypted
- Seamlessly decrypts and displays SOPS-encrypted files
- Falls back to normal file display for non-SOPS files
- Can be used to check if a file is SOPS-encrypted without displaying its contents

## Installation

```bash
brew tap andenkondor/zapfhahn
brew install andenkondor/zapfhahn/sops-opener
```

## Prerequisites

- [SOPS](https://github.com/mozilla/sops) must be installed on your system
- Zsh shell

## Usage

### View a file

```bash
./sops-opener.zsh path/to/file
```

This will:
- Automatically detect if the file is SOPS-encrypted
- If it is encrypted, decrypt and display the contents
- If it's not encrypted, display the file normally

### Check if a file is SOPS-encrypted

```bash
./sops-opener.zsh --check-only path/to/file
```

This will:
- Return exit code 0 if the file is SOPS-encrypted
- Return exit code 1 if the file is not SOPS-encrypted

## Examples

```bash
# View a SOPS-encrypted file
./sops-opener.zsh secrets.yaml

# View a regular file
./sops-opener.zsh config.yaml

# Check if a file is SOPS-encrypted
./sops-opener.zsh --check-only secrets.yaml
```

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 