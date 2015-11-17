;;; mynumber.el --- Validate my number

;; Copyright (C) 2015 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/
;; Version: 0.01
;; Package-Requires: ((cl-lib "0.5"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun mynumber--validate (mynumber)
  (cl-loop with digits = (cl-loop for c across (reverse mynumber)
                                  for i from 0 below 12
                                  collect
                                  (cons i (- c ?0)))
           with check-digit = (cdar digits)
           for (i . c) in (cdr digits)
           for q = (if (<= i 6) (1+ i) (- i 5))
           sum (* c q) into s
           finally
           return (cl-case s
                    ((0 1) (= check-digit 0))
                    (otherwise (= check-digit (- 11 (mod s 11)))))))

;;;###autoload
(defun mynumber-validate (mynumber)
  (interactive
   (list (read-string "MyNumber: ")))
  (unless (= (length mynumber) 12)
    (error "Error: MyNumber must be 12 digits."))
  (message "Your MyNumber '%s' is %s."
           mynumber (if (mynumber--validate mynumber) "valid" "invalid")))

(provide 'mynumber)

;;; mynumber.el ends here
