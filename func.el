(defun new-post ()
  (interactive)
  (let ((content (shell-command-to-string
		  (concat "cd /home/song/Projects/blog &&"
			  "rake new_post["
			  (read-string "Post Topic: ")
			  "]"))))
    (find-file (concat  "/home/song/Projects/blog/"
			(substring content
				   (string-match "source/_posts/" 
						 content)
				   (string-match ".markdown"
						 content))
			".markdown"))))

(defun update-config ()
  (interactive)
  (load-file "~/.emacs"))

(global-set-key "\C-cu" 'update-config)

(defun my-org-insert-template ()
  (interactive)
  (org-goto-calendar)
  (let ((cal-date (org-get-date-from-calendar)))
    (kill-buffer-and-window)
    (switch-to-buffer (car (org-buffer-list 'files)))
    (insert (format
	     (concat
	      "#+TITLE:\n"
	      "#+DATE: <%d-%02d-%02d>\n")
	     (nth 2 cal-date)
	     (car cal-date)
	     (nth 1 cal-date)))))

(add-hook 'org-mode-hook
	  (lambda () 
	    (defun org-insert-export-options-template()
	      (interactive)
		  (my-org-insert-template))))

(add-hook 'org-mode-hook
	  (lambda ()
	    (setq truncate-lines nil)))

     
(defun try nil
  (interactive)
(let ((re (concat "^\\(\\*+\\)[ \t]\\|^[ \t]*"
		  org-clock-string
		  "[ \t]*\\(?:\\(\\[.*?\\]\\)-+\\(\\[.*?\\]\\)\\|=>[ \t]+\\([0-9]+\\):\\([0-9]+\\)\\)"))
      (final-string ""))
  (save-excursion
   (while (setq spos (re-search-backward re nil t))
     (if (match-string 2)
	 (and (setq ts (match-string 2))
	     (setq te (match-string 3))
	     (setq final-string (concat final-string "\n"
					(nth 4 (org-heading-components)) "\n"
					"CLOCK: " ts "--" te))))))
  (message final-string)))
