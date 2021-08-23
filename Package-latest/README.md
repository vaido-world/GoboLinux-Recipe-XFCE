First backup is raw archive of installed package  
tar -czvf XFCE-Meta-Stable.tar.gz XFCE-Meta-Stable  

Second backup is the actual InstallPackage archive  
CreatePackage XFCE-Meta-Stable



Requires:
```
Compile LibWNCK 3.36


    # needs configuration of DocBook before this
    sed -i '/delegatePublic/c\' /Data/Variable/lib/xml/catalog  
    sed -i '/delegateSystem/c\' /Data/Variable/lib/xml/catalog  
    sed -i '/delegateURI/c\' /Data/Variable/lib/xml/catalog
    Compile Docbook-xml-dtd --no-dependencies --batch
   Compile GTK-Doc 1.33.0
  Compile LibGUdev 234
# Required before XFCE4-Power-Manager 1.6.5
Compile UPower 0.99.11
```
