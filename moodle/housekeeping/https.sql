-- Labels
SELECT * FROM mdl5_label WHERE  mdl5_label.intro LIKE '%http://www.youtube/embed%'; -- 0
SELECT * FROM mdl5_label WHERE  mdl5_label.intro LIKE '%http://player.vimeo%'; -- 0
SELECT * FROM mdl5_label WHERE  mdl5_label.intro LIKE '%http://bobnational.net%'; -- 0
SELECT * FROM mdl5_label WHERE intro LIKE '%http://uniofbath.cloud.panopto.eu%'; -- 0
SELECT * FROM mdl5_label WHERE intro LIKE '%https://people.bath.ac.uk%' ; -- 0
SELECT * FROM mdl5_label WHERE intro LIKE '%bath.ac.uk/lmf%' ; -- 4

SELECT * FROM mdl5_url WHERE mdl5_url.externalurl LIKE '%http://bath.ac.uk%' ;
SELECT * FROM mdl5_url WHERE mdl5_url.externalurl LIKE '%bath.ac.uk/lmf%' ; -- 217
-- Pages
SELECT * FROM mdl5_page WHERE content LIKE '%http://player.vimeo%'; -- 0
SELECT * FROM mdl5_page WHERE content LIKE '%http://www.youtube.com/embed%'; -- 26
SELECT * FROM mdl5_page WHERE content LIKE '%http://prezi%'; -- 0
SELECT * FROM mdl5_page WHERE content LIKE '%bath.ac.uk/lmf%'; -- 65
SELECT * FROM mdl5_page WHERE content LIKE '%http://bobnational.net%'; -- 0
SELECT * FROM mdl5_page WHERE content LIKE '%http://uniofbath.cloud.panopto.eu%' AND
                              mdl5_page.content LIKE '%iframe%' AND mdl5_page.content LIKE '%embed%'; -- 18
SELECT * FROM mdl5_page WHERE content LIKE '%http://people.bath.ac.uk%' AND mdl5_page.content LIKE '%<iframe%'; -- 0
SELECT * FROM mdl5_assign WHERE intro LIKE '%bath.ac.uk/lmf%';

-- Book
SELECT * FROM mdl5_book WHERE mdl5_book.intro LIKE '%http://player.vimeo%'; -- 0
SELECT * FROM mdl5_book WHERE  intro LIKE '%http://prezi%'; -- 0
SELECT * FROM mdl5_book WHERE intro LIKE '%http://www.youtube.com/embed%'; -- 0
SELECT * FROM mdl5_book WHERE intro LIKE '%http://uniofbath.cloud.panopto.eu%'; -- 0
SELECT * FROM mdl5_book WHERE mdl5_book.intro LIKE '%http://bobnational.net%'; -- 0
SELECT * FROM mdl5_book WHERE intro LIKE '%http://uniofbath.cloud.panopto.eu%'; -- 0
SELECT * FROM mdl5_book WHERE intro LIKE '%bath.ac.uk/lmf%'; -- 0


-- Book Chapters
SELECT b.course,b.name AS 'bookname',bc.title, bc.content AS 'book chapter content'  FROM mdl5_book_chapters bc
  JOIN mdl5_book b ON bc.bookid = b.id
WHERE bc.content LIKE '%http://player.vimeo%'; -- 0

SELECT b.course,b.name AS 'bookname',bc.title, bc.content AS 'book chapter content'  FROM mdl5_book_chapters bc
  JOIN mdl5_book b ON bc.bookid = b.id
WHERE bc.content LIKE '%http://uniofbath.cloud.panopto.eu%'; -- 0
SELECT b.course,b.name AS 'bookname',bc.title, bc.content AS 'book chapter content'  FROM mdl5_book_chapters bc
  JOIN mdl5_book b ON bc.bookid = b.id
WHERE bc.content LIKE '%http://uniofbath.cloud.panopto.com%'; -- 0
SELECT b.course,b.name AS 'bookname',bc.title, bc.content AS 'book chapter content'  FROM mdl5_book_chapters bc
  JOIN mdl5_book b ON bc.bookid = b.id
WHERE bc.content LIKE '%http://prezi%'; -- 0
SELECT b.course,b.name AS 'bookname',bc.title, bc.content AS 'book chapter content'  FROM mdl5_book_chapters bc
  JOIN mdl5_book b ON bc.bookid = b.id
WHERE bc.content LIKE '%http://www.youtube.com/embed%'; -- 1
SELECT b.course,b.name AS 'bookname',bc.title, bc.content AS 'book chapter content'  FROM mdl5_book_chapters bc
  JOIN mdl5_book b ON bc.bookid = b.id
WHERE bc.content LIKE '%bath.ac.uk/lmf%'; -- 1

-- Lesson Intro
SELECT * FROM mdl5_lesson WHERE intro LIKE '%https://uniofbath.cloud.panopto.com%'; -- 0
-- Lesson Pages
SELECT * FROM mdl5_lesson_pages WHERE mdl5_lesson_pages.contents LIKE '%http://player.vimeo%'; -- 0
SELECT * FROM mdl5_lesson_pages WHERE mdl5_lesson_pages.contents LIKE '%http://uniofbath.cloud.panopto.eu%'; -- 0
SELECT * FROM mdl5_lesson_pages WHERE mdl5_lesson_pages.contents LIKE '%http://uniofbath.hosted.panopto.com%'; -- 0
SELECT * FROM mdl5_lesson_pages WHERE mdl5_lesson_pages.contents LIKE '%bath.ac.uk/lmf%'; -- 0

SELECT * FROM mdl5_lesson_pages WHERE mdl5_lesson_pages.contents LIKE '%http://bobnational.net%'; -- 0