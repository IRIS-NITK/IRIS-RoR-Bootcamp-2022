It is suggested to use a system running on Linux or MacOS for the Bootcamp. We understand that most of you may be using a Windows system and have therefore provided a set of instructions to install Linux.

### [Installation Guide for Linux](./install_linux.md)

Once done, you will have to install Ruby and Rails on your system. 

> We recommend sticking to the versions mentioned in the Installation Guide and run commands exactly as instructed, as all assignments in this Bootcamp are tested with these versions.

# Install Ruby & Rails

## In case you are using Mac OS, follow below commands
### Install Xcode tools

Install Xcode from the MacApp Store if you haven't already.
[Refer this in case of any issues](https://stackoverflow.com/questions/9329243/xcode-install-command-line-tools)

### Install HomeBrew

HomeBrew is a package manager for Mac and helps organise the packages you install.

Enter the following command in the terminal to install HomeBrew if you haven't already -
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install `gnupg`

```bash
brew install gnupg
```

## Below steps are common to Linux and MacOS

Install [Ruby Version Manager (RVM)](http://rvm.io/rvm/install).
You can install RVM by running the following commands:

```bash
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

> In case you encounter any issues please check this [link](https://rvm.io/rvm/security)
```bash
# Import and mark the GPG keys as trusted
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
# Install stable version of RVM
curl -sSL https://get.rvm.io | bash -s stable
```
You can also install the [ubuntu apt package](https://github.com/rvm/ubuntu_rvm), but the _process is quite complex if messed up_. 
**We recommend you to install it by following the commands mentioned above**.

> RVM allows you to easily install, manage and work with multiple ruby
> environments.
- Install Ruby (3.0.5)
```bash
rvm install ruby-3.0.5
rvm --default use 3.0.5
```

- Create and use a [gemset](https://codecabulary.launchacademy.com/learn-ruby/gemsets) `week_<n>` where `n` is the session number.

```bash
rvm gemset create week_2
rvm use 3.0.5@week_2
```

> A `gemset` is an isolated ruby setup. For example, you can isolate two
> projects using Rails 5 and Rails 6 from each other using a gemset.
> NOTE: Always switch to the appropriate gemset when working on a
> project. You can use a [project rvmrc](https://rvm.io/workflow/rvmrc)
> to automate this process.
- Install Bundler (2.2.33) and Rails (7.0.4)
```bash
gem install bundler --version 2.2.33
gem install rails --version 7.0.4
```

> While you can use different version of Ruby, Bundler and Rails - we
> recommend using the provided versions as all exercies are created and
> tested with these particular versions.
- Check if the above steps worked correctly.
```bash
rvm --version
ruby --version    # 3.0.5
bundler --version # 2.2.33
rails --version   # 7.0.4
```
* Finally, you'll need `Node.js` and `Yarn` installed to manage your application's JavaScript. So you can install `nodejs` by running the following command:
```bash
sudo apt install nodejs
```
* We need `yarn` for `esbuild`. To [install yarn](https://classic.yarnpkg.com/en/docs/install/#debian-stable) run the following commands:
```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```

- Check and verify your installation
```bash
yarn --version
```
