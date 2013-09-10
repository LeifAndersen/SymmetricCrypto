#lang slideshow

(require slideshow/play
         slideshow/code
         ;slideshow/latex
         (for-syntax syntax/stx))

; Library
(define (medium-text txt)
  (text txt (current-main-font) 50))

(define (large-text txt)
  (text txt (current-main-font) 62))

(define (massive-text txt)
  (text txt (current-main-font) 120))

;(define (medium-$$ txt)
;  (scale ($$ txt) 1.5))

;(define (large-$$ txt)
;  (scale ($$ txt) 2))

;(define (massive-$$ txt)
;  (scale ($$ txt) 3))

(define (title-slide . data)
  (play-n
   #:skip-last? #t
   (animate-slide
    'next
    'alts
    `(,data ()))))



(define (pretty-slide #:title [title ""] . data)
  (play-n
   #:skip-first? #t
   #:skip-last? #t
   #:title title
   (animate-slide
    'next
    'alts
    `(,data ()))))

(define (start-pretty-slide #:title [title ""] . data)
  (play-n
   #:skip-first? #t
   #:skip-last? #f
   #:title title
   (apply animate-slide `(next ,@data))))

(define (header-slide #:title [title ""] #:reversed [reversed #f]
                      #:append [append "top"] #:distance [distance 0]
                      #:fade-in [fade-in #t] #:fade-out [fade-out #t]
                      #:header [header ""] . data)
  (play-n
   #:title title
   #:skip-first? #t
   #:skip-last? #t
   (λ (n1 n2 n3)
     (fade-pict
      (if fade-out n3 0)
      (fade-pict
          (if fade-in n1 1)
          (t "")
          (fade-around-pict
           (if reversed
               (- 1 n2)
               n2)
           header (λ (x)
                       (match append
                         ["top"    (apply vc-append `(,distance ,x ,@data))]
                         ["bottom" (apply vc-append `(,distance ,@data ,x))]
                         ["left"   (apply hc-append `(,distance ,x ,@data))]
                         ["right"  (apply hc-append `(,distance ,@data ,x))]
                         [else     (apply vc-append `(,distance ,x ,@data))]))))
      (t "")))))

(define (transition-slide #:title [title ""] #:reversed [reversed #f]
                      #:append [append "top"] #:distance [distance 0]
                      #:header [header ""] . data)
  (play-n
   #:title title
   #:skip-first? #t
   #:skip-last? #t
   (λ (n)
      (fade-around-pict
       (if reversed
           (- 1 n)
           n)
       header (λ (x)
                 (match append
                   ["top"    (apply vc-append `(,distance ,x ,@data))]
                   ["bottom" (apply vc-append `(,distance ,@data ,x))]
                   ["left"   (apply hc-append `(,distance ,x ,@data))]
                   ["right"  (apply hc-append `(,distance ,@data ,x))]
                   [else     (apply vc-append `(,distance ,x ,@data))]))))))

(define-syntax (picture-slide stx)
  (syntax-case stx ()
    [(k #:title title first-pic pic ...)
     ; =>
     #'(picture-slide* title first-pic pic ...)]

    [(k first-pic pic ...)
     ; =>
     #'(picture-slide* "" first-pic pic ...)]))

(define-syntax (picture-slide* stx)
  (define (build-transitions pic id acc)
    (cond [(stx-null? pic) acc]
          [(stx-null? (stx-cdr pic))
           ; =>
           #`(fade-pict #,(stx-car id) #,acc
                        (scale #,(stx-car pic) #,(stx-car id)))]

          [else
           ; =>
           (build-transitions (stx-cdr pic) (stx-cdr id)
                              #`(fade-pict #,(stx-car id) #,acc
                                           (scale #,(stx-car pic) (+ #,(stx-car id) #,(stx-car (stx-cdr id))))))]))
  (syntax-case stx ()
    [(k title first-pic pic ...)
     ; =>
     (with-syntax ([(first-id) (generate-temporaries #'(first-pic))]
                   [(id ...) (generate-temporaries #'(pic ...))]
                   [(last-id) (generate-temporaries #'(1))])
       (with-syntax ([body (build-transitions #'(pic ...) #'(id ...)
                                              #`(cellophane (scale first-pic (+ 1 #,(stx-car #'(id ...))))
                                                            first-id))])
         #'(play-n
            #:skip-first? #t
            #:skip-last? #t
            #:title title
            (λ (first-id id ... last-id)
              (cellophane body (- 1 last-id))))))]))

(define-syntax (section stx)
  (syntax-case stx ()
    [(k #:title section-title slides ...)
     ; =>
     (with-syntax ([pretty-slide (datum->syntax #'k 'pretty-slide)]
                   [start-pretty-slide (datum->syntax #'k 'start-pretty-slide)]
                   [header-slide (datum->syntax #'k 'header-slide)]
                   [picture-slide (datum->syntax #'k 'picture-slide)])
       #'(let ()
           (define (pretty-slide #:title [title #f] . data)
             (unless title
               (set! title section-title))
             (play-n
              #:skip-first? #t
              #:skip-last? #t
              #:title title
              (animate-slide
               'next
               'alts

               `(,data ()))))

           (define (start-pretty-slide #:title [title ""] . data)
             (unless title
               (set! title section-title))
             (play-n
              #:skip-first? #t
              #:skip-last? #f
              #:title title
              (apply animate-slide `(next ,@data))))

           (define (header-slide #:title [title ""] #:reversed [reversed #f]
                                 #:append [append "top"] #:distance [distance 0]
                                 #:fade-in [fade-in #t] #:fade-out [fade-out #t]
                                 #:header [header ""] . data)
             (unless title
               (set! title section-title))
             (play-n
              #:title title
              #:skip-first? #t
              #:skip-last? #t
              (λ (n1 n2 n3)
                 (fade-pict
                  (if fade-out n3 0)
                  (fade-pict
                   (if fade-in n1 1)
                   (t "")
                   (fade-around-pict
                    (if reversed
                        (- 1 n2)
                        n2)
                    header (λ (x)
                              (match append
                                ["top"    (apply vc-append `(,distance ,x ,@data))]
                                ["bottom" (apply vc-append `(,distance ,@data ,x))]
                                ["left"   (apply hc-append `(,distance ,x ,@data))]
                                ["right"  (apply hc-append `(,distance ,@data ,x))]
                                [else     (apply vc-append `(,distance ,x ,@data))]))))
                  (t "")))))

           (define-syntax (picture-slide stx)
             (syntax-case stx ()
               [(k #:title title first-pic pic (... ...))
                ; =>
                #'(picture-slide* title first-pic pic (... ...))]

               [(k first-pic pic (... ...))
                ; =>
                #'(picture-slide* section-title first-pic pic (... ...))]))

           slides ...))]))

; Slideshow
(title-slide
 (colorize (large-text "Symmetric Cryptography") "black")
 (colorize (medium-text "Leif Andersen") "blue")
 (colorize (medium-text "Michael Bradshaw") "blue")
 (colorize (t "University of Utah") "red"))

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
 (massive-text "Questions?"))
