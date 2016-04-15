#!/bin/bash

#edit these locations to the new locations in the lab

SDK=http://192.168.10.101/dl/jdk-8u45-linux-x64.gz
PY2=http://192.168.10.101/dl/Python-2.7.9.tgz
PY3=http://192.168.10.101/dl/Python-3.4.3.tgz

SUBL=http://192.168.10.101/dl/Sublime%20Text%202.0.2%20x64.tar.bz2
ECLIPSE=http://192.168.10.101/dl/eclipse-java-mars-2-linux-gtk-x86_64.tar.gz

cd /tmp/
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.d                                                                                        eb
dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb

apt-get update
apt-get upgrade -y
apt-get install -y gcc build-essential libreadline-gplv2-dev libncursesw5-dev li                                                                                        bssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev vim geany drjava

cd /tmp/
wget $SUBL
tar xf Sublime\ Text\ 2.0.2\ x64.tar.bz2
mv Sublime\ Text\ 2 /opt/
ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime
echo "[Desktop Entry]
Version=1.0
Name=Sublime Text 2
GenericName=Text Editor

Exec=sublime
Terminal=false
Icon=/opt/Sublime Text 2/Icon/48x48/sublime_text.png
Type=Application
Categories=TextEditor;IDE;Development
X-Ayatana-Desktop-Shortcuts=NewWindow" > /usr/share/applications/sublime.desktop
desktop-file-install /usr/share/applications/sublime.desktop

cd /tmp/
wget $PY2
tar -xvf Python-2.7.9.tgz
cd Python-2.7.9
./configure
make
make install
cd /tmp
rm -rf Python-2.7.9*

cd /tmp/
wget $PY3
tar -xvf Python-3.4.3.tgz
cd Python-3.4.3
./configure
make
make install
cd /tmp/
rm -rf Python-3.4.3*

cd /tmp/
wget $SDK
tar -xvf jdk-8u45-linux-x64.gz
mkdir -p /usr/lib/jvm
mv ./jdk1.8.0_45 /usr/lib/jvm/
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_45/b                                                                                        in/java" 2000
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_45                                                                                        /bin/javac" 2000
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0_                                                                                        45/bin/javaws" 2000
chmod a+x /usr/bin/java
chmod a+x /usr/bin/javac
chmod a+x /usr/bin/javaws
chown -R root:root /usr/lib/jvm/jdk1.8.0_45

#update-alternatives --config java
#update-alternatives --config javac
#update-alternatives --config javaws

cd /tmp
wget $ECLIPSE
tar -xvf eclipse-java-mars-2-linux-gtk-x86_64.tar.gz
mv ./eclipse /opt/
echo "[Desktop Entry]
Name=Eclipse
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=eclipse.desktop" > /usr/share/applications/eclipse.desktop
desktop-file-install /usr/share/applications/eclipse.desktop
ln -s /opt/eclipse/eclipse /usr/local/bin/
