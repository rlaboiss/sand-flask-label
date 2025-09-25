Automatic generation of labels for sand flasks
==============================================


Introduction
------------

This repository contains the code that I use to automatically generate labels that I stick on the sand flasks in my collection, shown in the picture below (click on it for to see an enlarged version):

<img src="sand-flask-example.jpg" width=40% height=40%>

The QR code on the top of each cork plug leads to a Google Maps URL that shows the exact location where the sand in the flask was collected.


Prerequisites
-------------

The code in this repository is intended to be run on a Unix-like system. For a Debian-based system, the necessary software can be installed using these commands:

```shell
sudo apt install make
sudo apt install inkscape
sudo apt install qrencode
```


How it works
------------

### The SVG template file

The appearance of the labels is controlled by the [template.svg](template.svg) file. This file can be edited with any vector graphics editor, such as [Inkscape](https://inkscape.org/). It must contain at least three objects:

1. one text object with the rendered text “#TEXT1#”,
2. one text object with the rendered text “#TEXT2#”, and
3. an image object for inclusion of the PNG image of the QR code.

The two text objects will appear in the final PDF file with the same font, style, and size, as seen in the SVG file.

The associated SVG element (`<image>`) of the image object must have the following properties:

```
sodipodi:absref="#DIR#/#STEM#.png"
xlink:href="#STEM#.png"
```

### The info files

A corresponding .info file must be created for each desired label. This file should contain a single line with three fields separated by semicolons, like this:

```
AMED;BALI;https://goo.gl/maps/oiXzww134QXGw1wa9
```

The text in the first two fields will replace the text objects "#TEXT1#" and "#TEXT2#," respectively. The URL in the third field will be converted into a PNG file containing a QR code for that URL. 

### The resulting PDF files

Once the `.info` files are created, the associated PDF files are generated with the following command:

```shell
make
```

For the example shown above, a PDF file will be generated, which will contain the following content (actually, A4 PDF files are generated; the image below is a cropped version of the actual file):

![figure](label-example.png)

Print the file, cut out the labels, attach them to the flask, and you are done!

### Tidying up

Finally, the directory can be cleaned with this command:

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

<!--  LocalWords:  SVG PNG GPL Inkscape
 -->
