## new-ubuntu-setup

# Configuration scripts

1) __golang_setup_1.sh__
    * installs various useful deb packages
    * sets up Go including
        * gRPC compiler and plugins
    * installs Visual Studio
    * installs ripgrep
    * adds useful bash aliases
    * sets up vim
        * runs vim_setup.sh to install various vim plugins
	        * vim-go
	        * NERDTree
	        * vim-airline
	        * vim-airline-themes
	        * vim-project (started optionally)
	        * badwolf colour scheme

2) __linuxbrew_install_2.sh__
    * installs Homebrew
    * installs fzf (fuzzy finder)
    * installs bash-git-prompt

3) __cluster_tools_setup_3.sh__
    * sets up docker
    * google SDK
    * kubernetes related tools:
        * kubectl
        * helm + helm-diff plugin
        * kubectx

3b) __cluster_tools_GCP_3b.sh__
    * GCP - google SDK

4) __clone_github_repos_4.sh__
    * cloning of desired repos

5) __other_utilities_5.sh__
    * Dropbox
    * CherryTree

NOTE

The *alternative_configuration* directory contains scripts that can be used if the particular
functionality installation does not work/needs more customization. The scripts are then used in the
relevant ubuntu configuration scripts as needed (.bashrc etc)

