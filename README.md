# OAC Trip Calendar

Browse and subscribe to the trip calendar for great justice


## 1. Platform & build environment

Written in [Ruby](http://ruby-lang.org/). **Version 2.0.x**

[RVM](https://rvm.io/) provides a mechanism for managing multiple versions of Ruby and project-specific dependency sets (gemsets). The `.rvmrc` file in the project directory specifies the version of the ruby interpreter and the name of the gemset to use for this project.

```sh
# Install RVM
$ \curl -#L https://get.rvm.io | bash -s stable --ruby

# Load RVM in your current shell (not needed if you close the shell and open a new one)
$ source ~/.rvm/scripts/rvm

# If you did not follow the instructions provided in the output of the installation script, run these commands and do what they say
$ rvm requirements
$ rvm notes

# Install Ruby 2.0
$ rvm install 2.0.0

# Load the project-specific RVM configuration
$ source .rvmrc
Using /Users/bcm/.rvm/gems/ruby-2.0.0-p0 with gemset oac

# Ensure rvm is using the right ruby and gemset
$ rvm info

ruby-2.0.0-p0@oac:
...
```

[Bundler](http://gembundler.com/) is used to manage dependencies.

```sh
# Install bundler
$ gem install bundler

# Install dependencies
$ bundle
```

A project-specific Bash script provides a number of utility functions.

```sh
# Load bash script
$ source etc/bashrc
```


## 2. Services

The system is expected to provide services for data storage etc, including Postgres and Redis. See below for how to install them.

```sh
# Start services
$ oac-start-services

# Stop services
$ oac-stop-services
```


## 3. Heroku Toolbelt

Our deployment platform is [Heroku](http://heroku.com).

You'll need to install the [Heroku Toolbelt](https://toolbelt.heroku.com/) which provides a command line application for communicating with Heroku. Note that this installs a self-contained package including Ruby and Git and it ignores your RVM ruby and gemset. Don't worry about any of that; just use the `heroku` script that it provides.

Next you'll need to set up a Heroku account if you don't already have one and have it added to the staging application as a collaborator.


## 3. Development environment configuration

### Environment variables

Configuration items specific to the host environment are configured in the `.env` file. This file is read when the server starts up and its contents are made available to the server process as environment variables. The file is ignored by git and must be created by hand.

### Development environment

```sh
# yes, "none" is correct for RACK_ENV in development due to how Unicorn works
$ cat .env
RACK_ENV=none
RAILS_ENV=development
```

## 4. Database

Data is stored in [PostgreSQL](http://www.postgresql.org/).

### 4.1 Database connection

Database connection information is the one exception we don't put in the `.env` files (due to incomplete support in Active Record). This information for all environments is provided in `config/database.yml`.

### 4.2 Database setup

Use these commands to install Postgres and set up the database:

```sh
# Install Postgres
$ brew install postgres

# Create the database user (role) with a password and permission to create databases
$ createuser -P -d oac
Enter password for new role: oac
Enter it again: oac
```

### 4.3 Database migration

Use these commands to create and migrate the database:

```sh
# Creates the database
$ rake db:create

# Applies migrations to arrive at the final schema
$ rake db:migrate
```


## 5. Run the tests

Ruby tests are run using the [RSpec](https://www.relishapp.com/rspec) framework.

```sh
$ rake spec
..................

Finished in 2.2 seconds
18 examples, 0 failures

Randomized with seed 45111
```

## 6. Run the server

The server runs on port 5000 using the [Unicorn](http://unicorn.bogomips.org/) web server. [Foreman](https://github.com/ddollar/foreman) is used to launch the web server and Sidekiq worker processes.

```sh
$ foreman start
10:47:07 web.1  | started with pid 52646
10:47:08 web.1  | I, [2014-07-14T10:47:08.075013 #52646]  INFO -- : Refreshing Gem list
10:47:09 web.1  | I, [2014-07-14T10:47:09.283276 #52646]  INFO -- : listening on addr=0.0.0.0:5000 fd=10
10:47:09 web.1  | I, [2014-07-14T10:47:09.437697 #52646]  INFO -- : master process ready
10:47:09 web.1  | I, [2014-07-14T10:47:09.442695 #52649]  INFO -- : worker=0 ready
10:47:09 web.1  | I, [2014-07-14T10:47:09.445419 #52650]  INFO -- : worker=1 ready
10:47:09 web.1  | I, [2014-07-14T10:47:09.447653 #52651]  INFO -- : worker=2 ready

```

The web server is now running at http://localhost:5000.
