    ###################################################################
    #    Cleaned-up script and merged the 32bit and 64bit versions    #
    #    Also, added some basic error checking                        # 
    ###################################################################



if [ "$1" = "32" ]; then
 targetF="of_v0.9.3_linux_release"            # 32 bit target file
 ChkSUM="5b9a6cf3e8ba372eba59a13cb403ea00"    # check sum of 32bit file
else
 targetF="of_v0.9.3_linux64_release"          # 64bit
 ChkSUM="95c5f436a66489ed1ca460bf593bdbe1"
fi

target="$HOME"


### Update package database before installing software
sudo apt update
sudo apt upgrade


### Install doxygen, geany terminator, vim, ctags, graphviz, git  
 
sudo apt install -y curl doxygen geany vim ctags graphviz git terminator





### Get openframeworks (32/64bit version)    

cd /tmp
if [ ! -f "$targetF".tar.gz ]; then
wget http://www.openframeworks.cc/versions/v0.9.3/"$targetF".tar.gz
else
  MD5=$(md5sum "$targetF".tar.gz | cut -d ' ' -f 1)
  if [ "$MD5" != "$ChkSUM" ] ;then
     echo -n "\n\n--------------------------------------------------------\n"
     echo  Error: "$targetF".tar.gz is either corrupt or incomplete.
     echo  Delete the file and re-run the script
     exit 1
  else
     echo Skipping download of "$targetF".tar.gz
  fi
fi



### Extract (32/64bit) oF to target    

tar -C "$target" -xzf "$targetF".tar.gz 
mv -i "$target/$targetF" "$target"/oFv093/ 


cd "$target"/oFv093/scripts/linux/ubuntu

### Fix 'error installing libgl1-mesa-dev-hwe-16.04'
sed -i '115s/.*/XTAG=""/' ./install_dependencies.sh

### Run dependencies script (for openframeworks)
sudo ./install_dependencies.sh


### Run an example project to see if previous steps worked
cd "$target"/oFv093/examples/graphics/polygonExample
make
make run

### Run projectGenerator script (for openframeworks)
cd $target/oFv093/scripts/linux
./compilePG.sh


### This will compile the GUI version of the project generator which will be placed
### in the root of the OF folder. When it's done compiling it will ask you if you
### also want to install the optional command line version of the tool which allow
### you to create projects from anywhere on your system. If you installed the 
### command line tool and want to change the OF path it uses, you can change the 
### value of PG_OF_PATH in ~/.profile.


### run the projectgenerator to see if it works

### Look in oFv093/projectGenerator-linux32/


### Make sure git has coloured output
sudo printf '\n[color]\n\tui = auto\n' >> "$target"/.gitconfig

echo "done"
