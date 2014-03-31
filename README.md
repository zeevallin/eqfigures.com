# EqFigures
An application to determine best pony using Elo's rating sytem.

### Install
These install steps are for Mac OSX.

#### Before Installing

You need to have ruby 2.0.0 working on your machine. I reccomend
using rbenv and ruby-build to manage your ruby versions.

- [sstephenson/rbenv](https://github.com/sstephenson/rbenv)
- [sstephenson/ruby-build](https://github.com/sstephenson/ruby-build)

#### PostgreSQL

We use Postgres as a our database, make sure it's installed
and running correctly. If you use brew, make sure to follow
the post install messages.

```bash
brew install postgresql
```

#### ImageMagick

ImageMagick is required for the image resizing in the application
to properly work. This can take some time since imagemagick has
a lot of dependencies.

```bash
brew install imagemagick
```

#### Rails Application

To get up and running you will have to clone the application from
GitHub and bundle the gems. This might take a while, kick back and
open a bottle of beer.

```bash
git clone git@github.com:zeeraw/eqfigures.git && cd eqfigures && bundle install
```

There are some configuration files that needs to be copied before
you can start. After they are copied go in to each of them and make
sure all the configuration keys are set to their appropirate values.

You might have to [https://apps.twitter.com/app/new](set up a new Twitter application)
to set the correct oAuth values for authentication to work.

```bash
cp config/application.yml.example config/application.yml && cp config/database.yml.example config/database.yml
```

If you have installed postgres through brew you will be able to
run this command to set up your database user. The same user will
be used for both testing and development environment.

```bash
createuser --createdb pony
```
