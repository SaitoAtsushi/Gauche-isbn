;;;
;;; Test Gauche-isbn
;;;
(import (scheme base)
        (scheme write)
        (gauche test)
        (book ndl)
        (book isbn))

(test-start "book.isbn")
(test-module 'book.isbn)

(test* "Make isbn13 object" "9784101092058"
       (isbn->string (string->isbn "978-4-10-109205-8")))

(test* "Make isbn10 object" "479732743X"
       (isbn->string (string->isbn "4-7973-2743-X")))

(test* "Convert from isbn10 to isbn 13" "9784797327434"
       (isbn->string (isbn10->isbn13 (string->isbn "4-7973-2743-x"))))

(test* "Invalid checksum: isbn13" #f
       (isbn->string (string->isbn "978-4-10-109205-9")))

(test* "Invalid checksum: isbn10" #f
       (isbn->string (string->isbn "4-7973-2743-0")))

(test* "Invalid format: too long" #f
       (isbn->string (string->isbn "978-4-10-109205-80")))

(test* "Invalid format: illegal character" #f
       (isbn->string (string->isbn "978a4-10-109205-8")))

(test-end :exit-on-failure #t)

(test-start "book.ndl")
(test-module 'book.ndl)

(define bi-obj
  (guard  (e (else #f))
    (isbn->book-information (string->isbn "4-7973-2743-X"))))

(test* "Get a book-information object" #t
       (book-information? bi-obj))

(when bi-obj
  (test* "book-title" "詳説C++ : 標準C++完全理解" (book-title bi-obj))
  (test* "book-authors" "大城正典 著," (book-authors bi-obj))
  (test* "book-publisher" "ソフトバンクパブリッシング" (book-publisher bi-obj))
  (test* "book-date" "Fri, 24 Jun 2005 09:00:00 +0900" (book-date bi-obj)))

(test-end :exit-on-failure #t)
