# 📡 BlueskyPostTerminalZSH

Post directly to [Bluesky](https://bsky.app) from your Linux terminal using `zsh` (or similar).

## ⚙️ Setup Steps

1. **Copy the script** (`blu.sh`) to any folder on your system.

2. **Edit the script** and replace the following:
   - `APP_PASSWORD` – your [App Password](https://staging.bsky.app/settings/app-passwords)
   - `HANDLE` – your Bluesky handle (e.g., `yourname.bsky.social`)

3. **(Optional)** If you don't have an App Password yet, generate one [here](https://staging.bsky.app/settings/app-passwords).

4. **Add an alias** to your terminal config (`~/.zshrc` or similar):
   ```zsh
   alias bluesky='/home/yourusername/path/to/blu.sh'
