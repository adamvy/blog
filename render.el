(package-initialize)

(require 'org)
(require 'htmlize)

(let ((org-html-postamble-format '(("en" "<p class=\"updated\">Last updated: %C</p>")))
      (org-html-preamble-format '(("en" "<h4>Software Engineering Periodical</h4><a href=\"index.html\">Index</a>")))
      (org-publish-project-alist `(("blog"
				    :base-directory ,(concat default-directory "/blog")
				    :publishing-directory ,(concat default-directory ".publish")
				    :publishing-function org-html-publish-to-html
				    :html-preamble t
				    :html-postamble t
                                    :html-head-include-default-style nil
                                    :html-head-include-scripts nil
				    :with-toc nil
				    :section-numbers nil
				    :html-head "<link rel=\"stylesheet\" href=\"style.css\">"
				    :auto-sitemap t
                                    :sitemap-title "Software Engineering Periodical"
                                    :sitemap-sort-files 'anti-chronologically
                                    :sitemap-filename "index.org"
                                    )))
      (org-html-doctype "html5"))
  (org-publish-all t))
