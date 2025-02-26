(lang dune 3.17)

(name Lambda-Interpreter)

(generate_opam_files true)

(source
 (github DisguisedPigeon/Lambda-Interpreter))

(authors "DisguisedPigeon <rubcessis.unofficial@gmail.com>")

(license GPLv3)

(package
 (name Lambda-Interpreter)
 (synopsis "Lambda calculus interpreter")
 (description "A Lambda calculus interpreter based on Benjamin C. Pierce's book (Types and Programming Languages)")
 (depends ocaml)
 (tags
  ("interpreter" "functional" "lambda-calculus")
  )
)
