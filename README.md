# Bank Transfer Script

Secure and efficient bank transfers for FiveM servers

## Features

- Player-to-player bank transfers
- Transaction logging to a database
- Configurable command name and amount limits

## Requirements

- FiveM server with ESX Legacy framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your server's resources folder
3. Add `ensure bank-transfer-script` to your server.cfg

## Usage

### Command

`/pay [playerId] [amount]`

### Permissions

- Players need to have sufficient funds in their bank account

## Configuration

Edit the `config.lua` file to customize:

- Command name
- Minimum and maximum transfer amounts

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=bank-transfer-script&utm_content=bottom) — describe it in one sentence and get the full source code.