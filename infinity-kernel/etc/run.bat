@echo off
cd @app.baseDir@\@app.region@\bin
set path=@app.baseDir@\@app.region@\@NODEAGENT_PORT_PREFIX@x;@app.baseDir@\@app.region@\bin;@app.baseDir@\@app.region@\dll;%PATH%
@app.baseDir@\@app.region@\bin\wrapper -c @app.baseDir@\@app.region@\etc\nodeagent-@NODEAGENT_PORT_PREFIX@x.conf >> @app.baseDir@\@app.region@\log\run-@NODEAGENT_PORT_PREFIX@x.log 2>>&1