Trigrid
=================

#### Challenge - create a graphical interface using [ProcessingJS](http://processingjs.org/)

The interface can be found [here](https://ckpantelides.github.io/trigrid/)

* The challenge was to build a grid of equilateral triangles positioned as the picture below shows
* When each triangle is clicked, it cycles between three colours

> First the grid of triangles is drawn, with the x & y coordinates of each triangle corner pushed to an array

> When the mouse is clicked, the distance between the x & y coordinates of the cursor is checked against the coordinates of each triangles' corners

> If the cursor is within the distance a (the triangles height) of each corner, it's inside the triangle, and the colour will change

![img1]

[img1]: https://github.com/ckpantelides/trigrid/blob/master/cubes.PNG
