# s3cmd Container

## Usage

```
mkdir ~/.s3cfg

docker run -it --rm         \
  --volume ~/.s3cfg:/.s3cfg \
  --user $(id -u)           \
  frew/s3cmd                \
  configure

docker run -it --rm         \
  --volume ~/.s3cfg:/.s3cfg \
  --volume $(pwd):/pwd      \
  --user $(id -u)           \
  frew/s3cmd                \
  sync /pwd/ s3://mah-bukkit
```

## Description

The packaged versions of [s3cmd](http://s3tools.org/) tend to be a little out of
date.  This image contains everything you need to use `s3cmd` without installing
python modules system-wide.

## Volumes

There is only a single volume, used for configuration: `/.s3cfg`.  It is
absolutely required and almost any usage without it is likely to fail.

I recommend a volume, aptly named `/pwd/` as the directory to sync.

## Shortcut Usage

I recommend putting the following script in your path to make usage of this
container easier:

```
#!/bin/dash

exec docker run -it --rm          \
  --volume ~/.blog-s3cmd:/.s3cfg  \
  --volume $(pwd):/pwd            \
  --user $(id -u)                 \
  frew/s3cmd                      \
  "$@"
```

