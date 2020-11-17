#lang racket

;task 19
(display "Задача 19")
(newline)

(define spisok_nesort (list 1 2 1 4 5))
(define spisok_sort (list 5 6 7 8))

(define (checkIncrease spisok)
  (define answer true)
  (if (empty? spisok)
      (display "Список пуст")
      (if (empty? (cdr spisok))
          answer
          (if (< (car spisok) (car (cdr spisok)))
              (set! answer (checkIncrease (cdr spisok)))
              (set! answer false)
               ) 
      )
  )
  answer)

(define (checkSort spisok)
  (display spisok)
  (if (checkIncrease spisok)
    (display "Список отсортирован по возрастанию")
    (display "Список не отсортирован по возрастанию")
    )
  (newline)
  )


(checkSort spisok_nesort)
(checkSort spisok_sort)


;task 4
(newline)
(display "Задача 4")
(newline)

(define (append list1 list2)
(if (null? list1)
list2
(cons (car list1) (append (cdr list1) list2))))

(define (enumerate-tree tree)
(cond ((null? tree) '())
((not (pair? tree)) (list tree))
(else (append (enumerate-tree (car tree))
(enumerate-tree (cdr tree))))))

(define (count spisok sum)
(if(null? spisok)
sum
(count(cdr spisok) (+ sum (car spisok)))))



(define spisok (list 1 (list (list 2 3) 4) 5 6))
(enumerate-tree spisok)
(define add spisok)
(display "Сумма элементов списка равна: ")
(count (enumerate-tree spisok) 0)

;task 3
(newline)
(display "Задача 3")

(define obj1 5)
(define obj2 10)
(define test_spisok (list 1 5 3 4 5 10))


(define (changeValue spisok)
  (if (empty? spisok)
      (display "Список пуст!")
      (begin
        (if (empty? (cdr spisok))
            (if (= (car spisok) obj1)
          (set! spisok (list obj2))
          (display "")
             )
            (begin
             (if (= (car spisok) obj1)
          (set! spisok (cons obj2 (cdr spisok)))
          (display "")
              )
              (set! spisok (cons (car spisok) (changeValue(cdr spisok))))
             )
         )
       )
    )
  spisok)

(newline)
(display "Изначальный список: ")
(display test_spisok)
(newline)
(display "Новый список: ")
(display (changeValue test_spisok))
