call setenvironment.bat
e:
cd \data\java\tour
set classpath=%classpath%;./WEB-INF/classes/
java com.tourgeek.Main local=Ejb remote=Ejb background=backgrounds/worldmapalpha.gif backgroundcolor=#FFFFCC menu=MainDon 