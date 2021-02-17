repoowner=${REPO_OWNER:-tamarakaufler}
echo $repoowner
echo "alias goprojt='cd ~/go_projects/$repoowner'"

mkdir -p ~/go_projects/${repoowner}
if [ $? == 0 ]; then    # this is 0 even if the directories exist
    echo "alias goproj='cd ~/go_projects'" >> ~/.bash_aliases
    echo "alias goprojt='cd ~/go_projects/$repoowner'" >> ~/.bash_aliases
fi

