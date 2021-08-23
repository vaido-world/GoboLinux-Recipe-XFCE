# GoboLinux-Recipe-XFCE
A Recipe for compiling XFCE on GoboLinux

Tested using GoboLinux 17 Live CD on at least 2 computers: Laptop and a Desktop.

**Preinstalled Dependencies:**
```
root@LiveCD ~]cd /Programs/GCC 
root@LiveCD /Programs/GCC]ls
9.2.0  Current

root@LiveCD /Programs/GCC]cd /Programs/GLib
root@LiveCD /Programs/GLib]ls
2.63.5  Current

root@LiveCD /Programs/GLib]cd /Programs/Glibc
root@LiveCD /Programs/Glibc]ls
2.30  Current  Settings
root@LiveCD /Programs/Glibc]

```


## GitHub Pages are enabled on this Repository
**Note:** HTTPS protocol enforcement has been disabled for simplicity.  

`curl vaido.world/GoboLinux-Recipe-XFCE/add.bash | bash`

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


Panel
```
Compile LibWNCK 3.36.0 

```


```
wnckprop.c:1703:3: warning: ‘gdk_error_trap_pop’ is deprecated: Use 'gdk_x11_display_error_trap_pop' instead [-Wdeprecated-declarations]
 1703 |   if (gdk_error_trap_pop () || !result)
      |   ^~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:50,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkmain.h:73:32: note: declared here
   73 | G_GNUC_WARN_UNUSED_RESULT gint gdk_error_trap_pop         (void);
      |                                ^~~~~~~~~~~~~~~~~~
wnckprop.c: In function ‘get_target’:
wnckprop.c:1774:3: warning: ‘gdk_cursor_new’ is deprecated: Use 'gdk_cursor_new_for_display' instead [-Wdeprecated-declarations]
 1774 |   cross = gdk_cursor_new (GDK_CROSS);
      |   ^~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:34,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkcursor.h:228:12: note: declared here
  228 | GdkCursor* gdk_cursor_new   (GdkCursorType    cursor_type);
      |            ^~~~~~~~~~~~~~
wnckprop.c:1775:3: warning: ‘gdk_pointer_grab’ is deprecated: Use 'gdk_device_grab' instead [-Wdeprecated-declarations]
 1775 |   status = gdk_pointer_grab (root, FALSE, GDK_BUTTON_PRESS_MASK,
      |   ^~~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:50,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkmain.h:86:15: note: declared here
   86 | GdkGrabStatus gdk_pointer_grab       (GdkWindow    *window,
      |               ^~~~~~~~~~~~~~~~
wnckprop.c:1777:3: warning: ‘gdk_cursor_unref’ is deprecated: Use 'g_object_unref' instead [-Wdeprecated-declarations]
 1777 |   gdk_cursor_unref (cross);
      |   ^~~~~~~~~~~~~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:34,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkcursor.h:247:13: note: declared here
  247 | void        gdk_cursor_unref             (GdkCursor       *cursor);
      |             ^~~~~~~~~~~~~~~~
wnckprop.c:1786:3: warning: ‘gdk_keyboard_grab’ is deprecated: Use 'gdk_device_grab' instead [-Wdeprecated-declarations]
 1786 |   status = gdk_keyboard_grab (root, FALSE, GDK_CURRENT_TIME);
      |   ^~~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:50,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkmain.h:93:15: note: declared here
   93 | GdkGrabStatus gdk_keyboard_grab      (GdkWindow    *window,
      |               ^~~~~~~~~~~~~~~~~
wnckprop.c:1794:3: warning: ‘gdk_flush’ is deprecated: Use 'gdk_display_flush' instead [-Wdeprecated-declarations]
 1794 |   gdk_flush ();
      |   ^~~~~~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:50,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkmain.h:124:6: note: declared here
  124 | void gdk_flush (void);
      |      ^~~~~~~~~
wnckprop.c: In function ‘clean_up’:
wnckprop.c:1807:3: warning: ‘gdk_pointer_ungrab’ is deprecated: Use 'gdk_device_ungrab' instead [-Wdeprecated-declarations]
 1807 |   gdk_pointer_ungrab (GDK_CURRENT_TIME);
      |   ^~~~~~~~~~~~~~~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:50,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkmain.h:100:15: note: declared here
  100 | void          gdk_pointer_ungrab     (guint32       time_);
      |               ^~~~~~~~~~~~~~~~~~
wnckprop.c:1808:3: warning: ‘gdk_keyboard_ungrab’ is deprecated: Use 'gdk_device_ungrab' instead [-Wdeprecated-declarations]
 1808 |   gdk_keyboard_ungrab (GDK_CURRENT_TIME);
      |   ^~~~~~~~~~~~~~~~~~~
In file included from /usr/include/gtk-3.0/gdk/gdk.h:50,
                 from /usr/include/gtk-3.0/gtk/gtk.h:30,
                 from wnckprop.c:42:
/usr/include/gtk-3.0/gdk/gdkmain.h:102:15: note: declared here
  102 | void          gdk_keyboard_ungrab    (guint32       time_);
      |               ^~~~~~~~~~~~~~~~~~~
  CCLD   wnckprop
./.libs/libwnck-3.so: error: undefined reference to 'cos'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:619: wnckprop] Error 1
make[2]: Leaving directory '/Data/Compile/Sources/libwnck-3.0.2/libwnck'
make[1]: *** [Makefile:441: all-recursive] Error 1
make[1]: Leaving directory '/Data/Compile/Sources/libwnck-3.0.2'
make: *** [Makefile:346: all] Error 2
Compile: LibWNCK 3.0 - Build process failed.
root@LiveCD ~]Compile LibWNCK 3.0LibWNCK
root@LiveCD ~]Compile LibWNCK 3.0

```


### Relevant error resolution
https://bbs.archlinux.org/viewtopic.php?id=118425

https://www.google.com/search?q=startxfce4+error&client=firefox-b-d&ei=U1cdYYPpEeKnrgT_tZaQBA&oq=startxfce4+error&gs_lcp=Cgdnd3Mtd2l6EAMyBggAEBYQHjIGCAAQFhAeMgYIABAWEB46BwgAEEcQsAM6BQghEKABOggIIRAWEB0QHjoECAAQEzoICAAQFhAKEB46BggAEA0QHjoICAAQDRAFEB46CAgAEAgQDRAeSgQIQRgAULNiWMx3YMN4aANwAngAgAF-iAHiC5IBBDE0LjOYAQCgAQHIAQjAAQE&sclient=gws-wiz&ved=0ahUKEwjD3uqtn7vyAhXik4sKHf-aBUIQ4dUDCA0&uact=5



### Multiple things pointing at dbus problem with startxfce4

```
root@LiveCD ~]startxfce4
/usr/bin/startxfce4: X server already running on display :0
/bin/sh: /System/Settings/xdg/xfce4/xinitrc: No such file or directory

```

https://forums.freebsd.org/threads/doesnt-start.62071/

```
root@LiveCD ~]xfce4-session
xfce4-session: No GPG agent found

(xfce4-session:10294): xfce4-session-WARNING **: 19:05:38.789: xfsm_manager_load_session: Something wrong with /Users/root/.cache/sessions/xfce4-session-LiveCD:0, Does it exist? Permissions issue?

```
![image](https://user-images.githubusercontent.com/21064622/129957521-02abfb00-dcaf-4d09-8728-a7af54842248.png)


https://www.linuxquestions.org/questions/linux-from-scratch-13/xfce4-session-permission-problem-4175451170/#post4897152



https://forums.freebsd.org/threads/xfce-says-x-server-already-running.30863/#post-171548


https://docs.xfce.org/xfce/xfce4-session/advanced

Maybe XFCE4-Session can be reinstalled or installed as a separate package

This happens because one of the Meta Recipe failed to compile. It can happen when any one of the Meta Recipe recipes fail with compilation.
```
/bin/sh: /System/Settings/xdg/xfce4/xinitrc: No such file or directory
```
