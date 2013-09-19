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
  #:append 'bottom
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
 (item "Password Based Encryption")
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

(header-slide
 #:header (massive-text "rot13")
 (large-text "M-x dunnet"))

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
 (massive-text "AES"))

(pretty-slide
 (massive-text "Hashing"))

(pretty->flip-slide
 (massive-text "What is hashing?"))

(flip->pretty-slide
 (large-text "A one way function"))

(pretty-slide
 (massive-text "Common Hash Functions"))

(pretty-slide
 #:title "Common Hash Functions"
 (item "MD5")
 'next
 (item "SHA--1")
 'next
 (item "SHA-256"))

(pretty-slide
 (massive-text "Rainbow Tables"))

(header-slide
 #:append 'left
 #:header (massive-text "Hashing")
 (massive-text " with Salt"))

(pretty->flip-slide
 (massive-text "What is Salt?"))

(flip-slide
 (scale (bitmap "saltshaker.jpg") 2))

(flip->pretty-slide
 (massive-text "<hash>:<salt>"))

(pretty-slide
 (large-text "Reasons to Salt"))

(pretty-slide
 #:title "Reasons to Salt"
 (item "Reason")
 'next
 (item "Aother Reason"))

#;(picture-slide
 (scale (bitmap "SLCPD.jpg") 2.5)
 (scale (bitmap "SLCPDdump.png") 0.65)
 (bitmap "google.png")
 (bitmap "RainbowCracked.png")
 (colorize (double-massive-text "FAIL!") "red"))

(pretty-slide
 (massive-text "Asymmetric Cryptography"))

(pretty-slide
 #:title "Common Algorithms"
 (item "RSA")
 'next
 (item "ECC"))

(pretty->flip-slide
 (massive-text "RSA"))

(flip->pretty-slide
 (massive-text "Key Generation"))

#;(section
 #:title "RSA Key Generation"
 (picture-slide
  (hc-append 0
             (medium-text "Choose to numbers ")
             (medium-$$ "p")
             (medium-text " and ")
             (medium-$$ "q"))
  (massive-$$ "n = pq"))
 )

(pretty-slide
 (massive-text "ECC"))

(pretty-slide
 (massive-text "Questions?"))
