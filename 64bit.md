#update package database
sudo apt-get update
sudo apt-get upgrade

#install doxygen, geany terminator, vim, ctags, graphviz, git
target=$HOME
sudo apt-get install -y doxygen geany vim ctags graphviz git terminator

# get openframeworks (64bit version)
cd /tmp 
wget http://www.openframeworks.cc/versions/v0.9.3/of_v0.9.3_linux64_release.tar.gz

#extract (32bit) oF to target
tar -C $target -xzf of_v0.9.3_linux_release.tar.gz 
mv -i $target/of_v0.9.3_linux_release $target/oFv093/ 


#run dependencies script (for openframeworks)
cd $target/oFv093/scripts/linux/ubuntu
sudo ./install_dependencies.sh



#run an example project to see if previous steps worked
cd $target/oFv093/examples/graphics/polygonExample
make
make run

#run projectGenerator script (for openframeworks)
cd $target/oFv093/scripts/linux
./compilePG.sh


### This will compile the GUI version of the project generator which will be placed
### in the root of the OF folder. When it's done compiling it will ask you if you
### also want to install the optional command line version of the tool which allow
### you to create projects from anywhere on your system. If you installed the 
### command line tool and want to change the OF path it uses, you can change the 
### value of PG_OF_PATH in ~/.profile.


#run the projectgenerator to see if it works

#### Look in oFv093/projectGenerator-linux32/


# make sure git has coloured output
sudo printf '\n[color]\n\tui = auto\n' >> $target/.gitconfig

echo "if your project does not run, try"
echo "MESA_GL_VERSION_OVERRIDE=2.1 make run"
echo "done"
