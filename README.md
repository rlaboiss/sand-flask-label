Automatic generation of labels for sand flasks
==============================================


Introduction
------------

This repository contains code that I use for the automatic generation of labels that I can stick on my collection of sand flasks, like in the picture below (click on it for an enlarged version of the image):

<img src="sand-flask-example.jpg" width=40% height=40%>

The QR codes on the top of the cork plugs contain the URLs for Google Maps indicating the precise location where the sand was collected.


Prerequisites
-------------

The code included in this repository is intended to be run on a Unix-like system. In particular, for a Debian-based system, the necessary software can be installed with the following commands:

```shell
sudo apt install make
sudo apt install inkscape
sudo apt install qrencode
```


How it words
------------

### The SVG template file

The appearance of the labels is controlled via the file [template.svg](template.svg). This SVG file can be edited with vector graphic editors, like [Inkscape](https://inkscape.org/). It must contain, at least, three objects:

1. one text object with the rendered text “#TEXT1#”,
2. one text object with the rendered text “#TEXT2#”, and
3. an image object for inclusion of the PNG image of the QR code.

The two text will be rendered in the final PDF files with the same font, style and size, as seen in the SVG file.

For the image object, the associated SVG element `<image>` must have the following properties:

```
sodipodi:absref="#DIR#/#STEM#.png"
xlink:href="#STEM#.png"
```

### The info files

To each desired label, a corresponding `.info` file must be created, containing a single line, with three fields, separated by semicolons, like this:

```
AMED;BALI;https://goo.gl/maps/oiXzww134QXGw1wa9
```

The first two fields will appear in the place of the two text objects, replacing the texts “#TEXT1#” and “#TEXT2#”, respectively. The URL in the third field will be converted into a PNG file contained 

### The resulting PDF files

Once the `.info` files are created, the associated PDF files are generated with the following command:

```shell
make
```

For the example shown above, a PDF file will be generated, which will contain the following (actually, A4 PDF files are generated; the image below is a cropped version of the file):

![figure](label-example.png)

The directory can be cleaned, with this command:

```shell
make clean
```


Author
------

Copyright © 2023  Rafael Laboissière <rafael@laboissiere.net>


License
-------

This project is licensed under the terms of the GNU GPL version 3.0 license.

<!---
Local Variables:
ispell-local-dictionary: "american"
eval: (auto-fill-mode -1)
eval: (visual-line-mode)
eval: (flyspell-mode)
End:
--->

<!--  LocalWords:  SVG PNG GPL
 -->
