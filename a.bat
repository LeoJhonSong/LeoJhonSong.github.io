@echo off

set hexo=node_modules\hexo\node_modules\.bin\hexo.cmd

if "%1"=="" goto generateDeployAll
if "%1"=="g" goto generateAll
if "%1"=="d" goto deployAll
if "%1"=="e" goto english
if "%1"=="c" goto chinese
if "%1"=="ne" %hexo% new %2
if "%1"=="nc" %hexo% new %2 --config _config.yml,_config.zh-CN.yml
if "%1"=="na" %hexo% new %2 && %hexo% new %3 --config _config.yml,_config.zh-CN.yml && python\python.exe multi-language.py %2 %3
if "%1"=="clean" %hexo% clean
goto end

:generateDeployAll
%hexo% clean && %hexo% d -g && %hexo% clean --config _config.yml,_config.zh-CN.yml && %hexo% d -g --config _config.yml,_config.zh-CN.yml
goto end

:generateAll
%hexo% clean && %hexo% g && %hexo% clean --config _config.yml,_config.zh-CN.yml && %hexo% g --config _config.yml,_config.zh-CN.yml
goto end

:deployAll
%hexo% d && %hexo% d --config _config.yml,_config.zh-CN.yml%hexo%
goto end

:english
if "%2"=="" goto generateDeployEnglish
if "%2"=="g" goto generateEnglish
if "%2"=="d" goto deployEnglish
if "%2"=="s" goto serverEnglish
goto end

:generateDeployEnglish
%hexo% clean && %hexo% d -g
goto end

:generateEnglish
%hexo% clean && %hexo% g
goto end

:deployEnglish
%hexo% d
goto end

:serverEnglish
start %hexo% server
start http://localhost:4000
goto end

:chinese
if "%2"=="" goto generateDeployChinese
if "%2"=="g" goto generateChinese
if "%2"=="d" goto deployChinese
if "%2"=="s" goto serverChinese
goto end

:generateDeployChinese
%hexo% clean --config _config.yml,_config.zh-CN.yml && %hexo% d -g --config _config.yml,_config.zh-CN.yml
goto end

:generateChinese
%hexo% clean --config _config.yml,_config.zh-CN.yml && %hexo% g --config _config.yml,_config.zh-CN.yml
goto end

:deployChinese
%hexo% d --config _config.yml,_config.zh-CN.yml
goto end

:serverChinese
start %hexo% server --config _config.yml,_config.zh-CN.yml
start http://localhost:4000

goto end

:end