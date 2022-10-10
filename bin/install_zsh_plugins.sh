echo "Installing ZSH plugins"
ZSH_CUSTOM_DIR="~/.oh-my-zsh/custom"

if [ ! -d "${ZSH_CUSTOM_DIR}/themes/spaceship-prompt" ]
then
  echo "Installing Spaceship theme"
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM_DIR}/themes/spaceship-prompt" --depth=1
  ln -s "${ZSH_CUSTOM_DIR}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM_DIR}/themes/spaceship.zsh-theme"
fi
