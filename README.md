# s3cmd Container

## Usage

```
#setup
docker run -it --rm -v $(pwd):/root frew/s3cmd  --configure

#syncing
docker run -it --rm -v $(pwd):/root -v $(pwd)/public:/public frew/s3cmd  sync public/ s3://mah-bukkit
```

## Description

The packaged versions of [s3cmd](http://s3tools.org/) tend to be a little out of date.  This image contains everything you need to use `s3cmd` without installing python modules system-wide.

## Volumes

The usage sample above, assumes you're storing your `.s3cfg` file in the current working directory. This allows you to easily have different `.s3cfg` files for different projects. To use a shared `.s3cfg` file from your home directory, just change the volume mapping from `-v $(pwd):/root` to `-v ~/:/root`.

It also assumes the files you want to move are in a sub-directory called "public".

NOTE: Be careful not to synch the current working directory or you could end up pushing your `.s3cfg` (including your AWS credentials) to a public s3 bucket. Yikes!  

## Shortcut Usage

I recommend putting the following script in your path to make usage of this
container easier:

```
#!/bin/dash

exec docker run -it --rm          \
  -v $(pwd)/public:/public  \
  -v $(pwd):/root            \
  frew/s3cmd                      \
  "$@"
```
