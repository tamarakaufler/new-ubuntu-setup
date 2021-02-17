# new-ubuntu-configuration

# Configuration scripts

1) golang_setup_1.sh
    * installs various useful deb packages
    * sets up Go including
        * gRPC compiler and plugins
    * installs Visual Studio
    * adds useful basl aliases
    * sets up vim
        * runs ./vim_setup.sh to install various vim plugins
	        * vim-go
	        * NERDTree
	        * vim-airline
	        * vim-airline-themes
	        * vim-project (started optionally)
	        * badwolf colour scheme

2) linuxbrew_install_2.sh
    * installs Homebrew
    * installs fzf (fuzzy finder)
    * installs bash-git-prompt

3) cluster_tools_setup_3.sh
    * sets up docker
    * google SDK
    * kubernetes related tools:
        * kubectl
        * helm + helm-diff plugin
        * kubectx

4) clone_github_repos_4.sh
    * cloning of desired repos

NOTE

The alternative_configuration directory contains scripts that can be used if the particular
functionality installation is not wanted/does not work. The scripts are then used in the
relevant ubuntu configuration scripts as needed (.bashrc etc)

