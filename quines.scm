(test "(run 1 (q) quine1) => (list (quote quine1))"
  (run 1 (q)
       (fresh (x)
         (== q `(fresh (x) (== q (,'quasiquote ,x)) (== x ',x)))
         (== x '(fresh (x) (== q (,'quasiquote ,x)) (== x ',x)))))
  (list
    '(fresh (x)
       (== q `(fresh (x) (== q (,'quasiquote ,x)) (== x ',x)))
       (== x '(fresh (x) (== q (,'quasiquote ,x)) (== x ',x))))))


(test "(run 1 (q) quine2) => (list (quote quine2))"
  (run 1 (q)
       (fresh (x)
         (== q
             (list 'fresh '(x) (list '== 'q x)
                   (list '== 'x (list 'quote x))))
         (== x
             '(list 'fresh '(x) (list '== 'q x)
                    (list '== 'x (list 'quote x))))))
  (list
    '(fresh (x)
       (== q
           (list 'fresh '(x) (list '== 'q x)
                 (list '== 'x (list 'quote x))))
       (== x
           '(list 'fresh '(x) (list '== 'q x)
                  (list '== 'x (list 'quote x)))))))

(test "quine3 => (list (quote quine3))"
  (run* (q)
    (fresh (x)
      (== q
          `(run* (q)
             (fresh (x) (== q (,'quasiquote ,x)) (== x ',x))))
      (== x
          '(run* (q)
             (fresh (x) (== q (,'quasiquote ,x)) (== x ',x))))))
  (list
    '(run* (q)
       (fresh (x)
         (== q
             `(run* (q)
                (fresh (x) (== q (,'quasiquote ,x)) (== x ',x))))
         (== x
             '(run* (q)
                (fresh (x) (== q (,'quasiquote ,x)) (== x ',x))))))))


(test "quine4 => quine4"
  (run* (q)
    (conde ((== q 'run*)) ((== q '(q)))
      ((fresh (x)
         (== q
             `(conde ((== q 'run*)) ((== q '(q)))
                ((fresh (x) (== q (,'quasiquote ,x)) (== x ',x)))))
         (== x
             '(conde ((== q 'run*)) ((== q '(q)))
                ((fresh (x) (== q (,'quasiquote ,x)) (== x ',x)))))))))
  '(run* (q)
     (conde ((== q 'run*)) ((== q '(q)))
       ((fresh (x)
          (== q
              `(conde ((== q 'run*)) ((== q '(q)))
                 ((fresh (x) (== q (,'quasiquote ,x)) (== x ',x)))))
          (== x
              '(conde ((== q 'run*)) ((== q '(q)))
                 ((fresh (x) (== q (,'quasiquote ,x)) (== x ',x))))))))))
