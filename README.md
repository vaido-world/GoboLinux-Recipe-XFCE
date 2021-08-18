# GoboLinux-Recipe-XFCE
A Recipe for compiling XFCE on GoboLinux

### Installation | Bash script
```
# Before we introduce our XFCE Recipe to the local Recipe repository that is /Data/Compile/Recipe
# We need to fetch the Recipes from https://github.com/gobolinux/Recipes 
Compile

# Downloading the Recipe
curl -L ""

# Extracting the Recipe from the Archive
unzip "XFCE-Meta-Stable.zip"

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

# Compile the XFCE Desktop Environment using XFCE Meta Recipe
Compile "XFCE-Meta-Stable"

```


Source: http://vaido.world/gobo/#updated-with-dependencies

