# Gauche-isbn

## Introduction
Gauche-isbn provides several procedures for handling international standard book numbers.
The Gauche-isbn consists of two libraries: (book isbn) for making isbn object and (book ndl) for querying the Japanese National Diet Library at http://iss.ndl.go.jp/.

## Install
At first, take clone from github.

```console
git clone git@github.com:SaitoAtsushi/Gauche-isbn.git
```
And then, please run the following command.

```console
./configure
make install
```

## Requirements
- Gauche 0.9.5_pre1 or later.

## Usage
You can import the library optionally.

```scheme
(import (book isbn))
(import (book ndl))
```

## Document for procedures

### Library (book isbn)
This library provide procedures for conversion between isbn object and string.
It is R7RS portable, you can use this library on other than Gauche.

#### (string->isbn string)
This procedure will convert from string to isbn object.
At the same time as conversion, this procedure validate format and checksum.
If string is invalid as isbn, it return #f.
Note that there are two kind of isbn object, it is isbn10 and isbn13.

#### (isbn->string isbn)
This procedure will convert from isbn object to string.

#### (isbn-type isbn)
This procedure will return a integer 13 or 10 representing the type of the isbn.

#### (isbn10->isbn13 isbn)
This procedure will convert from isbn10 objects to isbn13 object.

### Library (book ndl)
This library provide procedures for access to Japanese National Diet Library.

#### (isbn->book-information isbn)
This procedure will get a book information from NDL, and return it as book-information object.

#### (book-title isbn)
#### (book-authors isbn)
#### (book-publisher isbn)
#### (isbn book-date)
These procedures take out the item from the book-information object, respectively.

## Author
SAITO Atsushi (maldikulo@gmail.com)

## License
Copyright (c) 2014 SAITO Atsushi

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
3. Neither the name of the authors nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

