;;; ertx.el --- extensions for ert

;; Copyright (C) 2014  Nic Ferrier

;; Author: Nic Ferrier <nferrier@ferrier.me.uk>
;; Keywords: lisp

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

;; Extra useful testing functions.

;;; Code:

(require 'ert)

(defun ertx-this-defun ()
  "Run the tests for the ERT test where point rests."
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-defun)
      (if (looking-at "(ert-deftest[ \t]\\([^ (]+\\)")
          (let* ((test-name (match-string-no-properties 1)))
            (unless (equal test-name (car ert--selector-history))
              (push test-name ert--selector-history))
            (ert test-name))
          (error "Not in an ert test?")))))

(defun ertx-run-last ()
  "Re-run the last test that you ran."
  (interactive)
  (ert (car ert--selector-history)))


(provide 'ertx)

;;; ertx.el ends here
