# Macbook Setup Stuff

## Prerequisites
- [Install Homebrew](https://github.com/Homebrew/install)
    - There will be some post-install scripts to run next that look a little bit like
        ```sh
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/yourusername/.zprofile
        
        eval "$(/opt/homebrew/bin/brew shellenv)"
        ```

- Fix permissions on script files for execution
    - `chmod +x ./ScriptFile.sh`

- If you are on Apple Silicon run the following to install `Rosetta 2`
    - `sudo softwareupdate --install-rosetta`
    - Note, this may need to be rerun after OS updates.

## Post-Script Steps

### iTerm & zsh

iTerm is a great alternative to the built-in Terminal app of MacOS, but __OhMyZsh__ and __Powerlevel10k__ can make it even better.

- See https://ohmyz.sh/ and follow the installation via the curl command

- See https://github.com/romkatv/powerlevel10k and follow the installation via the git repo
    - Then you can use `p10k configure` to configure it

### NVM

You should create NVM's working directory if it doesn't exist:
```sh
mkdir ~/.nvm
```

Add the following to ~/.zshrc or your desired shell
configuration file:
```sh
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```
