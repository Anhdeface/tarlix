# Tarlix

Tarlix is a lightweight, browser-accessible Ubuntu Linux terminal built on GitHub Codespaces and `ttyd`. It gives you a ready-to-use cloud shell on desktop or mobile without installing a local IDE or terminal app.

## How It Works

When a Codespace starts from this repository, `.devcontainer/devcontainer.json` sets up a minimal Ubuntu LTS container, installs `ttyd`, and starts a private web terminal on port `7681`. Custom pure-Bash utilities in `bin/` and modular shortcuts in `config/aliases.sh` are loaded automatically on startup.

## Usage

1. Select **Code -> Codespaces -> Create codespace on main**.
2. Open the forwarded port **7681 (Tarlix Web Terminal)** in your browser.
3. Bookmark the `...-7681.app.github.dev` link for direct access next time.

On mobile browsers, turn off **Desktop site** on the port `7681` tab for proper screen scaling.

Once inside the terminal, run `allcmd` to browse available commands or `alitarlix` to view registered shortcuts.
