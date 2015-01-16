# yum-autodown

 CentOS5.x救済  
 yum-cronに似た、自動update検知とdownloadonlyを行うスクリプト。  

 このスクリプトは、CentOS 5.xでメールの通知などがなされない yum-cron の代替となるものです。

## インストール方法

     $ sudo install yum-autodown.sh /usr/local/bin
     $ sudo crontab -e
       すきなタイミングで自動実行するように記述する。

/etc/sysconfig/yum-cron と同じ書式で設定を書きます。  
ただし、有効なのは、MAILTOだけです。後はどんだけ書いても無視されます。

## 略歴

+ 1.00 初版
