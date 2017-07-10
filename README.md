# docker-SeisGram2K

SeisGram2K in a Docker container

## Quickstart
SeisGram2K Seismogram Viewer is an easy-to-use, platform-independent, Java software package for interactive visualization and analysis of earthquake seismograms developed by Anthony Lomax anthony[at]alomax.net.   
More info here:
- http://alomax.free.fr/seisgram/SeisGram2K.html

### Build docker
```
$ git clone git@gitlab.rm.ingv.it:uf/docker_SeisGram2K.git
$ cd docker_SeisGram2K
$ docker build --tag seisgram2k70 . 
```

### Run docker (Mac OSX)
#### XQuartz
Download and install **XQuartz**:
- https://www.xquartz.org

Enable flag: **Preferences** -> **Security** -> **Allow connections from network clients**.

#### Docker
Get your IP address and use it to start docker below:
```
$ ifconfig | grep "inet"
    . . .
	inet 10.180.3.98 netmask 0xfffc0000 broadcast 10.183.255.255
	. . .
[valentino@albus 15:15:07 ~/Downloads/SeisGram2K]$
```

Start docker:
```
$ docker run -it --rm -e DISPLAY=<your_ip_address>:0 -v /tmp/.X11-unix:/tmp/.X11-unix seisgram2k70
```

Check **SeisGram2K** version:
```
$ docker run -it --rm -e DISPLAY=<your_ip_address>:0 -v /tmp/.X11-unix:/tmp/.X11-unix seisgram2k70 -version
```

View real-time waveforms:
```
$ docker run -it --rm -e DISPLAY=<your_ip_address>:0 -v /tmp/.X11-unix:/tmp/.X11-unix seisgram2k70 -seedlink "eida-internal.int.ingv.it:18000#IV_ACER:HH?#1200" -seedlink.groupchannels YES -commands.onread rmean
```

### Run docker (Linux)

# Contribute
Please, feel free to contribute.

# Credit
The SeisGram2K software was developed to Anthony Lomax anthony[at]alomax.net