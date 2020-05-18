set -e

TEST_DIR="$(pwd)/vagrant-tests"

test_files=(
    "$TEST_DIR/scotch-box/whisky.test"
    "$TEST_DIR/laravel/app/Http/Controllers/Wombat.php"
)

# Scotch Box
cd "$TEST_DIR" || exit 1
git clone https://github.com/scotch-io/scotch-box
cd "$TEST_DIR/scotch-box" || exit 1
vagrant up
vagrant ssh -c "cd /var/www && touch whisky.test"

# Homestead
cd "$TEST_DIR" || exit 1
composer global require laravel/installer
laravel new laravel
cd "$TEST_DIR/laravel" || exit 1

composer require laravel/homestead
vendor/bin/homestead make
vagrant up
vagrant ssh -c "cd code && artisan make:controller Wombat"

# Test
for i in "${test_files[@]}"
do
    if [ ! -f "$i" ]; then
        exit 1
    fi
done

# tidy up
cd "$TEST_DIR/scotch-box" || exit 1
vagrant destroy -f

cd "$TEST_DIR/laravel" || exit 1
vagrant destroy -f

rm -rf "$TEST_DIR/scotch-box"
rm -rf "$TEST_DIR/laravel"

# if we get here, everything has worked
printf "\e[34m

==============================

          Success!!

==============================

 \e[39m
"
