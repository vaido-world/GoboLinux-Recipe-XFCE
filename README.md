# GoboLinux-Recipe-XFCE
A Recipe for compiling XFCE on GoboLinux

### Compilation and Installation | Bash script
```
# Before we introduce our XFCE Recipe to the local Recipe repository that is /Data/Compile/Recipe
# We need to fetch the Recipes from https://github.com/gobolinux/Recipes 
Compile

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

# Compile the XFCE Desktop Environment using XFCE Meta Recipe
Compile "XFCE-Meta-Stable"

```


Source: http://vaido.world/gobo/#updated-with-dependencies




### Current Errors

```
hecking pkg-config is at least version 0.9.0... yes
checking for gio-2.0 >= 2.42.0... 2.63.5
checking GIO_CFLAGS... -pthread -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
checking GIO_LIBS... -lgio-2.0 -lgobject-2.0 -lglib-2.0
checking for GIO_UNIX... yes
checking for pkg-config... (cached) /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for gmodule-2.0 >= 2.42.0... 2.63.5
checking GMODULE_CFLAGS... -pthread -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
checking GMODULE_LIBS... -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
checking for pkg-config... (cached) /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for cairo >= 1.0.0... 1.17.3
checking CAIRO_CFLAGS... -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/local/include/freetype2 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libpng16
checking CAIRO_LIBS... -lcairo
checking for pkg-config... (cached) /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for libwnck-3.0 >= 3.0... not found
*** The required package libwnck-3.0 was not found on your system.
*** Please install libwnck-3.0 (atleast version 3.0) or adjust
*** the PKG_CONFIG_PATH environment variable if you
*** installed the package in a nonstandard prefix so that
*** pkg-config is able to find it.
PrepareProgram: configure failed.
Compile: XFCE-Meta-Stable 4.14 - Configuration failed.
Compile: Compilation of XFCE4-Panel 4.14.0 failed.
root@LiveCD ~]

```
