
(man John) 
(man Tim)
(married Tim)



; last of list
(last $x (Cons $x Nil))
((last $x (Cons $_ $rest)) :- ( (last $x $rest) ) )

;; length list
(length Nil 0)
((length (Cons $x $rest) $out) :- (
    (length $rest $out2) 
    (is $out (+ $out2 1))
)
)

;; sum from 0 to n
(sum 0 0)
; ((sum $n $s) :- (
(= (sum $n $s) (
    (bool (> $n 0))
    (is $n1 (- $n 1))
    (sum $n1 $s1)
    (is $s (+ $n $s1))
))

;; list append
(append Nil $L $L)
((append (Cons $H $T) $L (Cons $H $R)) :- (
    (append $T $L $R)
))

;; negation as failure test
((bachelor $x) :- (
    (man $x)
    (naf (married $x))
))

((woman $x) :- (
    (naf (man $x))
))

; First-order logic backward chainer using match

;; TODO: this is inefficient, we just need at least 1 match
(= (has-match $space $g)
    (let $m (collapse (match $space $g True))
        (if (== $m ())
            False
            True
        )
    )
)

;; Base case
(= (backward-chain $goal $kb $rb)
    (case $goal (
        ((is $a $b) (let $a $b (is $a $b))) 
		;; prolog eval & assign
        ((bool $expr) (if $expr $goal (empty))) 
		;; if predicate is a boolean. This might be unnecessary
        ((naf $expr) (if (has-match $kb $expr) (empty) $goal)) 
		;; negation-as-failure
        ($_ (match $kb $goal $goal))
    )) 
)


;; Recursive Case
(= (backward-chain $goal $kb $rb)
    (match $rb ($goal :- $body)
        (match-body $body $kb $rb $goal)
    )
)

;; do matching for each atom in the body, then returns goal
(= (match-body $body $kb $rb $goal)
    (if (== $body ())
        $goal
        (let* (
            (($cur $rest) (decons-atom $body))
            ; (() (println! (IN $cur $goal)))
            ($cur (backward-chain $cur $kb $rb))  ;; chain on cur & unify back to propagate vars to $goal
            ; (() (println! (OUT $cur $goal)))
        ) 
            (match-body $rest $kb $rb $goal)
        )
    )
)


;!(import! &self fol-bc)
; !(bind! &baseall (new-space))
;!(import! &baseall fol-bc-kb)


(= (query $goal)
    (backward-chain $goal &baseall &baseall)
)

;;;;;;;;;;;;;;;;;
;; TEST query ;;;
;;;;;;;;;;;;;;;;;;

; !(println "xx 67 ") 
; ready works 
;!(assertEqualToResult ( factorial 5 ) ( 120 ) ) 

;!(println "xx 671 ") 
; last element of list
;!(query (last $x (Cons 1 (Cons 2 (Cons 3 Nil)))))

;; length of list
;!(println "xx 672 ") 
;!(query (length (Cons 1 (Cons 2 (Cons 3 Nil))) $out))

;; sum up to 3
; !(println "xx 673 ") 
; !( sum 3 $x )
;!(query (sum 3 $x))

;; append (multi-directional)
;!(println "xx 674 ") 
;!(query (append (Cons 1 (Cons 2 Nil)) (Cons 3 (Cons 4 Nil)) $x))
;;!(println "xx 675 ") 
;!(query  (append (Cons 1 (Cons 2 Nil)) $Out (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))))
;!(println "xx 676 ") 
;!(query (append $What $Out (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))))

;; Negation as failure test
;!(println "xx 677 ") 
;!(query (bachelor $x))
;!(println $x) 
; !(assertEqualToResult ( query (woman Tim) ) ( no ) ) 
!(assertEqualToResult ( query (is woman Jane) ) ( yes ) ) 
;!(assertEqualToResult ( query (woman $as) ) ( $as ) ) 
;!(query (woman Tim)) ;; should be no
;!(println "xx 679 ") 

;!(query (woman Jane)) ;; should succeed
;!(println "xx 680 ") 
;!(query (woman $x)) ;; should be no
