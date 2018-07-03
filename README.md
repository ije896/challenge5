# Automatic Rotoscoping

For this challenge, we created a program that automatically rotoscopes a video, and saves the rotoscoped video as a gif.

Rotoscoping is an animation technique in which the animator traces each frame of a video in order to create a very lifelike animation.

# Process
- For each frame, detect the edges in the image
- Apply a Gaussian filter (blur) to the original image
- Subtract the edges from the blurred image
- Add the frame to a .gif file 


You can also produce a rotoscoped gif that has a 'sketched' quality, or a color-corrected aspect to add another artistic element to the final rotoscoped gif.
