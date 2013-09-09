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


(define (header-slide #:title [title ""] #:header [header ""] . data)
  (play-n
   #:title title
   #:skip-first? #t
   #:skip-last? #t
   (λ (n1 n2 n3)
     (fade-pict
      n3 (fade-pict 
          n1 (t "")
          (fade-around-pict
           n2 header (λ (x)
                       (apply vc-append `(0 ,x ,@data)))))
      (t "")))))

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
           
           (define (header-slide #:title [title #f] #:header [header ""] . data)
             (unless title
               (set! title section-title))
             (play-n
              #:skip-first? #t
              #:skip-last? #t
              #:title title
              (λ (n1 n2 n3)
                (fade-pict n3
                           (fade-pict n1
                                      (t "")
                                      (fade-around-pict n2 header (λ (x)
                                                                    (apply vc-append `(0 ,x ,@data)))))
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
 (colorize (large-text "Machine Learning Tools") "black")
 (colorize (medium-text "Leif Andersen") "blue")
 (colorize (medium-text "Michael Bradshaw") "blue")
 (colorize (t "University of Utah") "red"))

(pretty-slide
 (massive-text "Questions?"))