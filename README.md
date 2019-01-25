# xenial-config
System configuration scripts for Ubuntu 16.04 (Xenial)

## Instructions

1. Install Virtualbox
2. Download Ubuntu iso image and install with virtualbox
3. Run the command below (32bit if you have 32bit Ubuntu or 64bit version otherwise)


### Ubuntu 32bit 
For the 32bit version, run the command below

~~~ .shell


wget https://raw.githubusercontent.com/BitSails/xenial-config/master/setup.sh && sh $(basename !#:1) 32

~~~

### Ubuntu 64bit
For the 64bit version, run the command below **instead**

~~~ .shell


wget https://raw.githubusercontent.com/BitSails/xenial-config/master/setup.sh && sh $(basename !#:1) 64

~~~
