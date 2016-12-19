" Match (only 'bar') in function calls like: 'foo.bar()' or 'bar()'
syn match pythonFunction /\(^\s*\(def\|class\)\s*\w*\)\@<!\w\{1,}\ze(/
" Match under methods/attributes
syn match pythonIdentifier "\<_\w*\>"
" Match dunder methods/attributes
syn match pythonBuiltin "\<__\w*\>"
" Match self (not in function declarations)
syn match pythonCoding /\(^\s*def \s*\w*\s*(\)\@<!self/
" Match self in function declarations
syn match pythonIgnore /\(^\s*def \s*\w*\s*(\)\@<=self\ze\s*[,)]/
" Match kls in function declarations
syn match pythonIgnore /\(^\s*def \s*\w*\s*(\)\@<=kls\ze\s*[,)]/
" Pseudo-constants in python (Capital letters variables)
syn match pythonConstant /\<[A-Z_][A-Z_0-9]*\>/

hi link pythonIgnore NonText
hi link pythonIdentifier Identifier
hi link pythonConstant Constant
hi link pythonCoding Special
