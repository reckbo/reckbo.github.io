---
layout: post
title: Information Theory, Inference, and Learning Algorithms in J - Repetition Code
---

Here's a [J implementation](https://github.com/reckbo/Mackay03) of the
repetition code in section 1.2 of 
[Information Theory, Inference, and Learning Algorithms (Mackay 2003)](http://www.inference.phy.cam.ac.uk/mackay/itila/).




    require'jpeg viewmat'

    NB. binarize an image
    binarize=: (0.5 < (% >./^:_)) 

    NB. binary matrix with shape of y and probability of 1 = x, default 0.10
    noise=: 0.1&$: : [ > ?.@:($&0)@:$@:]

    NB. a bit is flipped if the corresponding noise vector bit is 1, which is
    NB. equivalent to add mod 2, or XOR 
    addnoise=: ~:  

    NB. repetition code - makes x copies of image y (default 3)
    rep=: 3&$: : ([ # ,:@])  

    NB. majority vote decoder - returns 0 or 1.  For 3 bits, the function table is:
    NB. (; vote)"1 #: i.8
    vote=:+/ > +/@:-.  

    NB. define the encoder as the repetition code and the majority vote as it's
    NB. inverse
    enc=: rep :. (vote@:])

    NB. verb to simulate a transmission of image y with repetition x
    transmit=: dyad : '(addnoise noise)&.(x&enc) y'  "0 _

    NB. Compare results of transmitting an image with repetition codes 1 thru 6
    img=: readjpeg'cat.jpg'
    result=: ,/ (1+i.6) transmit binarize img
    viewmat result

And the result, starting with no encoding, ending with a repetition code of 6:

<img src="https://raw.githubusercontent.com/reckbo/Mackay03/master/cat_decoded.png" height="600" width="300"/>


<i><b>References</b></i>

* MacKay, David 2003, **'Information Theory, Inference, and Learning Algorithms'**. [[pdf](http://www.inference.phy.cam.ac.uk/itprnn/book.pdf)]
