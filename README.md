# README - `docker-stub`

The intent of this repo is to provide a template for making it simple to build a container
based command line application from python, ruby or even c-language.

It also helps you with the run-time of your container based application by hiding the container
launch and command line parameter hand-off.

This template presumes you are creating a CLI style application.  No reason it won't work for
a web app but this is to make it quick and simple to "pull" a copy and modify it for your app.

Files in this repository:

* `docker/` - this is the primary folder you would copy into your application project.  The premise
  is that the docker portion is a sub-folder within your own git repo and you don't want the docker
  funky-ness to be mixed in with your application source.
* `docker/build.sh` - this is the main build script, no arguments required by default.
* `docker/drun.sh` - this is an internal container run script to launch your application and hand-off
  command-line input parameters.
* `docker/run.sh` - this is the external container launch script.  Command line inputs are mirrored
  to your application command line.
  
This was tested in Linux and MacOS.  There are windows limitations that can easily be corrected with
a quick google search and some unit testing; such as the $(PWD) conversion for power-shell or CMD
shells.  I'll do so once I get around to needing it...

# Using this Template

You will want to modify the code in this template to 1) copy your application files, 2) run your
application script(s) and 3) name your container appropriately.

Before we go into what to modify, I want to explain the thought process behind the scripts, the workflow
and the values that get propagated via command line and environment.

Workflow:

1. `build.sh` will run `copy.sh` to copy your application files to a local `tmp/` folder.
1. `build.sh` will then launch docker to build the container image described by `Dockerfile`.
1. The `Dockerfile` will create a CMOUNT (container mount) folder and define it as a volume
   for attaching at container run-time.  Typically this is run from a "working folder" for
   the container to read and write files to and from (if desired).
1. The `Dockerfile` will copy the `drun.sh` script to the container root file system.
1. The `run.sh` script launches the container, takes the current working folder $(PWD) and 
   maps it to the volume name (default mount volume is `/mnt/outside`).
1. When the container launches it will launch the ENTRYPOINT (from the `Dockerfile`) which
   is the `/drun.sh` script (inside the container).
   
What you need to do to modify this template is as follows:

1. Modify default container name `dhelper:latest` to your container name; in `run.sh` and `build.sh`.
1. Modify the `copy.sh` script to copy your application files to a temporary folder input parameter.
1. Modify the `Dockerfile` to contain your application dependencies, and any application specific
   configuration.  Your application files will be located in the container at `/app`.
1. Last, modify the `drun.sh` script to launch your application.

# Troubleshooting

To learn the structure of this container helper, try modifying the container name and `Dockerfile`
just to get your container built and the work flow executing all the way through.  Then incrementally
add more functionality until you eventually launch your application from the command line.