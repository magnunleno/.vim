"#### Vtr Functions ###################################################### {{{
fun! VtrCallDjangoShell()
	execute "VtrKillRunner"
	execute "VtrOpenRunner"
	execute "VtrSendCommandToRunner pipenv run ./manage.py shell"
endfunction

fun! VtrCallDjangoShellPlus()
	execute "VtrKillRunner"
	execute "VtrOpenRunner"
	execute "VtrSendCommandToRunner pipenv run ./manage.py shell_plus"
endfunction

fun! VtrCallPythonShell()
	execute "VtrKillRunner"
	execute "VtrOpenRunner"
	execute "VtrSendCommandToRunner python"
endfunction
"}}}

"#### AsyncRun Functions ################################################# {{{
function! s:_AR_Django_MakeMigrations()
    execute "AsyncRun pipenv run ./manage.py makemigrations"
endfunction

function! s:_AR_Django_Migrate()
    execute "AsyncRun pipenv run ./manage.py migrate"
endfunction

function! s:_AR_Django_App(appname)
	let a:app_path = "./" . g:DjangoAppsDir . "/" . a:appname
	execute 'silent !mkdir -p ' . a:app_path
	execute "AsyncRun pipenv run ./manage.py startapp " . a:appname . " " . a:app_path
endfunction

function! s:_AR_Flake8()
    execute "AsyncRun flake8"
endfunction

let g:DjangoAppsDir = 'modules'

command! DjangoMakeMigrations call s:_AR_Django_MakeMigrations()
command! DjangoMigrate call s:_AR_Django_Migrate()
command! -nargs=1 DjangoApp call s:_AR_Django_App(<f-args>)
command! Flake8 call s:_AR_Flake8()
"}}}

