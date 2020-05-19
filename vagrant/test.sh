set -e

START_DIR=$(pwd)
TEST_DIR="$START_DIR/vagrant-test"
mkdir "$TEST_DIR"

# create box
cd "$TEST_DIR" || exit 1

echo 'Vagrant.configure("2") do |config|
    config.vm.box = "laravel/homestead"
    config.vm.synced_folder ".", "/home/vagrant/code"
end' > Vagrantfile

vagrant up
vagrant ssh -c "cd /home/vagrant/code && echo '<?php echo \"Success\";' | php > vagrant.md"

# Test
if [ "$(cat "$TEST_DIR/vagrant.md")" != "Success" ]; then
    exit 1
fi

# tidy up
vagrant destroy -f
cd "$START_DIR" || exit 1
rm -rf "$TEST_DIR"

# if we get here, everything has worked
printf "\e[32m

==============================

          Success!!

==============================
\e[39m
"
