#lang slideshow

(require slideshow/play
         slideshow/code
         slideshow/latex
         (for-syntax syntax/stx)
	"slideshow-macros.rkt")

(title-slide
 (colorize (large-text "Cryptography") "black")
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
 (large-text "Symmetric Cryptography"))

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
 (large-text "Common Hash Functions"))

(pretty-slide
 #:title "Common Hash Functions"
 (item "MD5")
 'next
 (item "SHA--1")
 'next
 (item "SHA-256"))

(start-pretty-slide
 (bitmap "rainbow.jpg"))

(shrink-transition-slide
 #:start-size 1
 #:end-size 0.75
 (bitmap "rainbow.jpg"))

(transition-slide
 #:header (scale (bitmap "rainbow.jpg") 0.75)
 (massive-text "Rainbow Tables"))

(end-pretty-slide
 (scale (bitmap "rainbow.jpg") 0.75)
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

(pretty->flip-slide
 (large-text "Asymmetric Cryptography"))

(flip->pretty-slide
 (large-text "Common Algorithms"))

(pretty-slide
 #:title "Common Algorithms"
 (item "RSA")
 'next
 (item "ECC"))

(pretty->flip-slide
 (massive-text "RSA"))

(flip->pretty-slide
 (massive-text "Key Generation"))

(section
 #:title "RSA Key Generation"
 (picture-slide
  #:fade-in #t
  #:fade-out #f
  (hc-append 0
             (medium-text "Choose two numbers ")
             (medium-$$ "p")
             (medium-text " and ")
             (medium-$$ "q"))
  (massive-$$ "n = pq")
  (large-$$ "\\varphi(n) = \\varphi(pq)"))
 (transition-slide
  #:append 'left
  #:distance 25
  #:header (large-$$ "\\varphi(n) = \\varphi(pq)")
  (large-$$ "=\\varphi(p)\\varphi(q)"))
 (slide
  #:title "RSA Key Generation"
  (hc-append 25 (large-$$ "\\varphi(n) = \\varphi(pq)")
             (large-$$ "=\\varphi(p)\\varphi(q)")))
 (transition-slide
  #:distance 25
  #:header (hc-append 25 (large-$$ "\\varphi(n) = \\varphi(pq)")
                      (large-$$ "=\\varphi(p)\\varphi(q)"))
  (large-$$ "=(p-1)(q-1)"))

 (picture-slide
  #:fade-in #f
  #:fade-out #t
  (vc-append 25
             (hc-append 25
                        (large-$$ "\\varphi(n) = \\varphi(pq)")
                        (large-$$ "=\\varphi(p)\\varphi(q)"))
             (large-$$ "=(p-1)(q-1)"))
  (vc-append 0
             (hc-append 25
                        (large-text "Choose ")
                        (large-$$ "e : 1 < e < \\varphi(n)"))
             (hc-append 25
                        (large-text "and ")
                        (large-$$ "\\gcd(e, \\varphi(n)) = 1")))
  (hc-append 25
             (medium-text "Determine ")
             (medium-$$ "d : d^{-1} \\equiv e\\ (\\textrm{mod}\\ \\varphi(n))"))
  (vc-append 0
             (hc-append 25
                        (large-$$ "d")
                        (large-text " is the private key."))
             (hc-append 25
                        (large-$$ "e")
                        (large-text " is the public key.")))))

(pretty-slide
 (massive-text "Encryption"))

(section
 #:title "Encryption"
 (picture-slide
  #:fade-in #t
  #:fade-out #f
  (vc-append 0
             (hc-append 0
                        (large-text "Convert message text ")
                        (large-$$ "M")
                        (large-text " into some "))
             (large-$$ "m : 0 \\leq m < n"))
  (massive-$$ "c \\equiv m^{e}\\ (\\textrm{mod}\\ n)"))
 (transition-slide
  #:header (massive-$$ "c \\equiv m^{e}\\ (\\textrm{mod}\\ n)")
  #:distance 25
  (hc-append 0
             (medium-text "Where ")
             (medium-$$ "c")
             (medium-text " is your encrypted text")))
 (end-pretty-slide
  (massive-$$ "c \\equiv m^{e}\\ (\\textrm{mod}\\ n)")
  (hc-append 0
             (medium-text "Where ")
             (medium-$$ "c")
             (medium-text " is your encrypted text"))))

(pretty-slide
 (massive-text "Decryption"))

(section
 #:title "Decryption"
 (pretty-slide
  (massive-$$ "e \\equiv c^{d}\\ (\\textrm{mod}\\ n)")))

(pretty->flip-slide
 (large-text "Why is this secure?"))

(flip->pretty-slide
 #:fade-out #f
 (double-massive-$$ "\\varphi"))

(shrink-transition-slide
 #:start-size double-massive-$$-size
 #:end-size large-$$-size
 ;($$ "\\varphi"))
 (t "\\varphi"))


(transition-slide
 #:append 'left
 #:header (large-$$ "\\varphi")
 #:distance 0
 (large-$$ "(n) = n \\prod_{p|n}\\left(1-\\frac{1}{p}\\right)"))

(pretty->rotate-slide
 #:fade-in #f
 (large-$$ "\\varphi(n) = n \\prod_{p|n}\\left(1-\\frac{1}{p}\\right)"))

(rotate->pretty-slide
 (scale (bitmap "EulerPhi.PNG") 1.5))

(pretty-slide
 (massive-text "ECC"))

(pretty-slide
 (massive-$$ "y^2 = x^3 + ax + b"))

(pretty-slide
 (massive-text "Questions?"))
