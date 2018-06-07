# challenge5

In this challenge problem, you will create an automatic rotoscoping system for creating short gif-style animations based on the analysis and processing of short videos.

Rotoscoping is an animation technique that is used to convert live-action movie images into animation.  The technique was developed before 1920 by Max Fleischer, an animator and inventor who saw a need for methods for producing more realistic animations.  The technique has been used in numerous animated films from the 1920s until the present, including several early Disney films, the Lord of the Rings (1978), the Secret of NIMH (1982), Titan AE (2000), Through a Scanner Darkly (2006), and many others.

The technique can be performed manually in software (e.g. https://theblog.adobe.com/moving-art-how-to-create-a-rotoscope-animation-in-photoshop-cc/ (Links to an external site.)Links to an external site. ), but your task here will be to write a Matlab program to perform the task automatically.  Your program will accept an argument, in the form of a filename of a video, and will save an a GIF-style animation with a “cartooned” look.  The output should not look photographic, like a video, but should instead look like an illustrated animation.

While you are free to use any algorithm of your design, some recommended steps would include the following: in some order, and in combination with other operations:

Contrast adjustment
Adaptive filtering to equalize the image intensity and/or colors
Quantization of the luminance or color values to “flatten” the image
Edge processing: Extraction, morphological expansion, binarization, and compositing with the original image
We will provide some examples of the approach.

As usual, you must take the initiative to explore and evaluate methods for solving this problem.

This challenge problem must be completed in groups of two. 

Please upload one .pdf file with your report, and one .m file or files with your code.
