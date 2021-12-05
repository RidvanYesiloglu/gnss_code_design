proj_name="GNSS_Code_Design_Project"
git init
git reset --hard # ignore sherlock changes
chmod +x pull_main_and_runset_train.sh #make this runnable after reset
read -p "Do you want Tara pull or Ridvan pull (tara:T, ridvan:R)? : " ssh_request
if (( ${ssh_request} == R )); then
  ssh_key_file="../git_ssh_keys/id_ed25519"
  eval "$(ssh-agent -s)" # start ssh-agent
  chmod 400 $ssh_key_file # give yourself read permission for the ssh-key
  ssh-add $ssh_key_file # add the key to authorize you for cloning
  git pull git@github.com:RidvanYesiloglu/${proj_name}.git #clone
elif (( ${ssh_request} == R )); then
  echo "You can put some git pull https code here"
  exit 1
  # Tara's pull command with git pull https here.
fi

chmod +x pull_main_and_runset_train.sh #make this runnable again after pulling
cd ..
chmod +x ./GNSS_Code_Design_Project/neural_networks/runset_train.sh
./GNSS_Code_Design_Project/neural_networks/runset_train.sh #run runset_train.sh bash fil
