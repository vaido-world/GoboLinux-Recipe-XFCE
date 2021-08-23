# curl --location -O https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/Package-latest/Dependencies/DocBook-XML-DTD--4.5--x86_64.tar.bz2
# curl --location -O https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/Package-latest/Dependencies/GTK-Doc--1.33.0--x86_64.tar.bz2
curl --location -O https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/Package-latest/Dependencies/LibGUdev--234--x86_64.tar.bz2
curl --location -O https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/Package-latest/Dependencies/LibWNCK--3.36.0--x86_64.tar.bz2
curl --location -O https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/Package-latest/Dependencies/UPower--0.99.11--x86_64.tar.bz2
curl --location -O https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/Package-latest/XFCE-Meta-Stable--4.14--x86_64.tar.bz2

InstallPackage XFCE-Meta-Stable--4.14--x86_64.tar.bz2
InstallPackage LibWNCK--3.36.0--x86_64.tar.bz2
InstallPackage LibGUdev--234--x86_64.tar.bz2
InstallPackage UPower--0.99.11--x86_64.tar.bz2
startxfce4
