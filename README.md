# ansible_host
host.temp是模版文件，如果需要调整安装的流程时，需要修改此文件，正常县融安装时不需要调整此文件;
set.ini 是县融安装配置文件，每个县融安装前需要首先设定此文件内容，根据实际情况进行调整；
mkhost.sh 是生成县融ansible安装文件的生成程序

使用方法：
bash mkhost.sh set.ini

注意，需要使用bash来运行，否则会出错；
