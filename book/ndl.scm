(define-library (book ndl)
  (export
   isbn->book-information book-information?
   book-title book-authors book-publisher book-date)
  (import (scheme base)
          (sxml sxpath)
          (sxml ssax)
          (book isbn)
          (srfi 8)
          (rfc http))
  (begin

    (define-record-type <book-information>
      (book-information title authors publisher date)
      book-information?
      (title book-title)
      (authors book-authors)
      (publisher book-publisher)
      (date book-date))

    (define query-title
      (if-car-sxpath  '(rss channel item title *text*)))

    (define query-authors
      (if-car-sxpath '(rss channel item author *text*)))

    (define query-publisher
      (if-car-sxpath '(rss channel item dc:publisher *text*)))

    (define query-date
      (if-car-sxpath '(rss channel item pubDate *text*)))

    (define namespace
      '((xmlns . "http://purl.org/rss/1.0/")
        (dcterms . "http://purl.org/dc/terms/")
        (dcmitype . "http://purl.org/dc/dcmitype/")
        (xsi . "http://www.w3.org/2001/XMLSchema-instance")
        (openSearch . "http://a9.com/-/spec/opensearchrss/1.0/")
        (rdf . "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
        (rdfs . "http://www.w3.org/2000/01/rdf-schema#")
        (dcndl . "http://ndl.go.jp/dcndl/terms/")
        (dc . "http://purl.org/dc/elements/1.1/")))

    (define (isbn->book-information x)
      (let ((isbn-str (isbn->string x)))
        (let-values
            (((status header body)
              (http-get "iss.ndl.go.jp"
                        `("/api/opensearch" (isbn ,isbn-str)))))
          (apply
           book-information
           (map
            (lambda(q)
              (q (ssax:xml->sxml (open-input-string body) namespace)))
            (list query-title query-authors query-publisher query-date))))))
    ))
