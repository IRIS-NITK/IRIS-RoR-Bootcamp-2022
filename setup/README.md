# Installation

One of the following ways can used to install Ruby and RoR
- [Dev Container](./dev_container.md)
- [GitHub codespaces](./github_codespaces.md)
- [Local Setup](./local_setup.md)


**Note** - If you are unable to install Ruby due to some reason, you can still
participate in bootcamp with the help of [GitHub codespaces](./github_codespaces.md).


Once you have setup a development environment using one of the above methods, you should have `rvm`, `node` and `yarn` installed. You can verify your installation with the following commands.
```bash
rvm --version
node --version # >= v16
yarn --version  # >= 1.22.19
```

## RVM

> RVM allows you to easily install, manage and work with multiple ruby
> environments.
- Install Ruby (3.0.5)
```bash
rvm install ruby-3.0.5
rvm --default use 3.0.5
```

- Create and use a [gemset](https://codecabulary.launchacademy.com/learn-ruby/gemsets) `week<n>` where `n` is the session number.

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

