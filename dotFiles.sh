set -e
source ./help.sh

vimVersion=$(vim --version | grep 'VIM - Vi IMproved' | cut -d ' ' -f 5)
print_status "version of vim found: ${vimVersion}"
if [[ $vimVersion -lt 7.4 ]];then
	print_status "vim version is less then 7.4... compiling from source"
	./compileVimFromSource.sh
fi
mkdir -p ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~
git clone --recursive https://github.com/theSha1chemist/dotfiles.git &&\
cd dotfiles &&\
./sync.sh -f

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
          ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cd ~/.vim/bundle/YouCompleteMe
./install.sh

chsh -s $(which zsh) 
