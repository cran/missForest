(TeX-add-style-hook "missForest_1.0"
 (lambda ()
    (LaTeX-add-bibliographies
     "myBib")
    (LaTeX-add-labels
     "nutshell"
     "verbose"
     "ntreemtry"
     "xtrue")
    (TeX-add-symbols
     "Rp"
     "mF")
    (TeX-run-style-hooks
     "geometry"
     "natbib"
     "url"
     "amssymb"
     "amsmath"
     "graphicx"
     "Sweave"
     "babel"
     "english"
     "latex2e"
     "art11"
     "article"
     "11pt")))

