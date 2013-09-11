#lang slideshow

(require slideshow/play
         slideshow/code
         slideshow/latex
         (for-syntax syntax/stx)
	"slideshow-macros.rkt")

(title-slide
 (colorize (large-text "Symmetric Cryptography") "black")
 (colorize (medium-text "Leif Andersen") "blue")
 (colorize (medium-text "Michael Bradshaw") "blue")
 (colorize (t "University of Utah") "red"))

(pretty->flip-slide
 (large-text "What is Encryption?"))

(flip->pretty-slide
 (large-text "Pithy Responce"))

(section
 #:title ""
 (start-pretty-slide
  (large-text "Symmetric")
  (large-text "Vs.")
  (large-text "Asymmetric"))

 (transition-slide
  #:reversed #t
  #:distance 25
  #:header (large-text "Symmetric")
  (large-text "Vs.")
  (large-text "Asymmetric"))

 (header-slide
  #:header (large-text "Symmetric")
  #:fade-in #f
  #:fade-out #f
  (hbl-append (medium-text "Message  →  ")
              (colorize (medium-text "Key") "blue")
              (medium-text "  →  af23c2..."))
  (medium-text "↑")
  (medium-text "Same key")
  (medium-text "↓")
  (hbl-append (medium-text "af23c2...  →  ")
              (colorize (medium-text "Key") "blue")
              (medium-text "  →  Message")))

 (transition-slide
  #:header (large-text "Symmetric")
  #:reversed #t
  (hbl-append (medium-text "Message  →  ")
              (colorize (medium-text "Key") "blue")
              (medium-text "  →  af23c2..."))
  (medium-text "↑")
  (medium-text "Same key")
  (medium-text "↓")
  (hbl-append (medium-text "af23c2...  →  ")
              (colorize (medium-text "Key") "blue")
              (medium-text "  →  Message")))

 (transition-slide
  #:distance 25
  #:header (large-text "Symmetric")
  (large-text "Vs.")
  (large-text "Asymmetric"))

 (slide
  (large-text "Symmetric")
  (large-text "Vs.")
  (large-text "Asymmetric"))

 (transition-slide
  #:append "bottom"
  #:distance 25
  #:reversed #t
  (large-text "Symmetric")
  (large-text "Vs.")
  #:header (large-text "Asymmetric"))

 (header-slide
  #:fade-in #f
  #:header (colorize (large-text "Asymmetric") "black")
  (hbl-append (medium-text "Message  →  ")
              (colorize (medium-text "Key #1") "blue")
              (medium-text "  →  af23c2..."))
  (medium-text "↑")
  (medium-text "Different keys")
  (medium-text "↓")
  (hbl-append (medium-text "af23c2...  →  ")
              (colorize (medium-text "Key #2") "red")
              (medium-text "  →  Message"))))

(pretty-slide
 (massive-text "Advanteges"))

(pretty-slide
 #:title "Advantages"
 (item "Relatively Fast")
 'next
 (item "An Advantage")
 'next
 (item "Another Advantage"))

(pretty-slide
 (massive-text "Disadvanteges"))

(pretty-slide
 #:title "Disadvantages"
 (item "Shared Key")
 'next
 (item "Another disadvantage"))

(pretty-slide
 (large-text "Common Algorithms"))

(pretty-slide
 #:title "Common Algorithms"
 (item "AES")
 'next
 (item "DES")
 'next
 (item "3DES")
 'next
 (item "Blowfish")
 'next
 (item "Twofish")
 'next
 (item "Serpent"))

(pretty-slide
 (massive-text "Hashing"))

(pretty-slide
 (massive-text "What is hashing?"))

(pretty-slide
 (massive-text "Rainbow Tables"))

(header-slide
 #:append "left"
 #:header (massive-text "Hashing")
 (massive-text " with Salt"))

(pretty-slide
 (massive-text "What is Salt?"))

(picture-slide
 (scale (bitmap "SLCPD.jpg") 2.5)
 (scale (bitmap "SLCPDdump.png") 0.65)
 (bitmap "google.png")
 (bitmap "RainbowCracked.png")
 (colorize (double-massive-text "FAIL!") "red"))

(pretty-slide
 (massive-text "Questions?"))
