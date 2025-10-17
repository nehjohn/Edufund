;; -----------------------------------------------------
;; DONORS - CONTRIBUTE TO THE SCHOLARSHIP FUND
;; -----------------------------------------------------
(define-public (contribute (amount uint))
  (begin
    ;; Added try! to check stx-transfer? response
    (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
    (let ((existing (map-get? donors { donor: tx-sender })))
      (match existing
        d (map-set donors { donor: tx-sender } (merge d { amount: (+ (get amount d) amount) }))
        (map-set donors { donor: tx-sender } { amount: amount })
      )
    )
    (var-set total-fund (+ (var-get total-fund) amount))
    (ok "Donation successfully added to scholarship pool")
  )
)


;; -----------------------------------------------------
;; ADMIN - APPROVE AND PAY VERIFIED STUDENTS
;; -----------------------------------------------------
(define-public (disburse-scholarship (student principal))
  (begin
    (asserts! (is-eq tx-sender ADMIN) ERR_UNAUTHORIZED)
    (let ((s (map-get? students { student: student })))
      (match s
        applicant
        (if (and (get verified applicant) (not (get paid applicant)))
            (let ((amount (get amount applicant)))
              (if (>= (var-get total-fund) amount)
                  (begin
                    ;; Added try! to check stx-transfer? response and fixed as-contract usage
                    (try! (as-contract (stx-transfer? amount tx-sender student)))
                    (map-set students { student: student } (merge applicant { paid: true }))
                    (var-set total-fund (- (var-get total-fund) amount))
                    (ok { message: "Scholarship disbursed", amount: amount })
                  )
                  ERR_NO_FUNDS
              )
            )
            ERR_NOT_VERIFIED
        )
        ERR_NOT_APPLIED
      )
    )
  )
)

;; Added missing constants and data variables
(define-constant ADMIN tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_NO_FUNDS (err u101))
(define-constant ERR_NOT_VERIFIED (err u102))
(define-constant ERR_NOT_APPLIED (err u103))

(define-data-var total-fund uint u0)

;; Added missing students map
(define-map students
  { student: principal }
  { amount: uint, verified: bool, paid: bool }
)

;; Define the donors map
(define-map donors
  { donor: principal }
  { amount: uint }
)
