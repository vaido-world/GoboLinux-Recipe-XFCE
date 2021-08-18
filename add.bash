# Before we introduce our XFCE Recipe to the local Recipe repository that is /Data/Compile/Recipe
# We need to fetch the Recipes from https://github.com/gobolinux/Recipes 
Compile "." # It will say that the Recipe is not found. What is important is that Recipes Repository will be downloaded.

# Prerequitsites

# 4.14.1 version of XFConf does not exist in the offical Recipes Repository. 
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/XFConf.tar.gz" -O
tar --extract --file="XFConf.tar.gz" --gzip --verbose
mv "XFConf/" "/Data/Compile/Recipes/"

# 0.12.8 version of EXO does not exist in the offical Recipes Repository. 
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/EXO.tar.gz" -O
tar --extract --file="EXO.tar.gz" --gzip --verbose
mv "EXO/" "/Data/Compile/Recipes/"

# 4.14.0 version of XFCE4-Panel does not exist in the offical Recipes Repository. 
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/XFCE4-Panel.tar.gz" -O
tar --extract --file="XFCE4-Panel.tar.gz" --gzip --verbose
mv "XFCE4-Panel/" "/Data/Compile/Recipes/"

# Required before XFCE4-Panel 4.14.0 Compilation
Compile LibWNCK 3.36.0 

# 4.14.0 version of XFCE4-Settings does not exist in the offical Recipes Repository. 
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/XFCE4-Settings.tar.gz" -O
tar --extract --file="XFCE4-Settings.tar.gz" --gzip --verbose
mv "XFCE4-Settings/" "/Data/Compile/Recipes/"

# 4.14.0 version of XFCE4-Session does not exist in the offical Recipes Repository. 
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/XFCE4-Session.tar.gz" -O
tar --extract --file="XFCE4-Session.tar.gz" --gzip --verbose
mv "XFCE4-Session/" "/Data/Compile/Recipes/"


# 4.14.1 version of XFDesktop does not exist in the offical Recipes Repository. 
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/XFDesktop.tar.gz" -O
tar --extract --file="XFDesktop.tar.gz" --gzip --verbose
mv "XFDesktop/" "/Data/Compile/Recipes/"




# If Recipe will not go smoothly without prompts, Compiling it before the Recipe is what should resolve it. 
# Compile LibXFCE4UI 4.14.1





# The Recipe Part


# Downloading the Recipe
curl -L "https://github.com/vaido-world/GoboLinux-Recipe-XFCE/raw/main/XFCE-Meta-Stable.tar.gz" -O

# Extracting the Recipe from the Archive
# unzip "XFCE-Meta-Stable.zip"
tar --extract --file="XFCE-Meta-Stable.tar.gz" --gzip --verbose

# Move our XFCE Recipe to the Local Recipes Repository
mv "XFCE-Meta-Stable/" "/Data/Compile/Recipes/"

# Install UnionFS
InstallPackage https://gobolinux.org/packages/017/Fuse--2.9.7--x86_64.tar.bz2
InstallPackage https://gobolinux.org/packages/017/UnionFS-Fuse--2.1--x86_64.tar.bz2

# Fix docbook for GoboLinux 17 release
sed -i '/delegatePublic/c\' /Data/Variable/lib/xml/catalog  
sed -i '/delegateSystem/c\' /Data/Variable/lib/xml/catalog  
sed -i '/delegateURI/c\' /Data/Variable/lib/xml/catalog
Compile Docbook-xml-dtd --no-dependencies --batch

# Install util-linux
Compile PCRE2  
Compile util-linux


# Compile the XFCE Desktop Environment using XFCE Meta Recipe
Compile "XFCE-Meta-Stable"
