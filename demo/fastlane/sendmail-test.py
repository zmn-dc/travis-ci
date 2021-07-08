#!/usr/bin/env python3
# coding=utf-8

# sendEmail title content
import sys
import time
import smtplib

from email.mime.text import MIMEText
from email.header import Header
from email.utils import parseaddr, formataddr

#配置发送的邮箱
sender = 'daichao@xiaoma.cn;'
#配置接收的邮箱
#receiver = '965524749@qq.com;'
#receivers = ['daichao@xiaoma.cn','965524749@qq.com']
receivers = ['daichao@xiaoma.cn']

#SMTP邮件服务器 以QQ邮箱配置的
#smtpserver = 'smtp.qq.com'
smtpserver = 'smtp.exmail.qq.com'
#配置SMTP开启服务的账号和授权密码密码
username = 'daichao@xiaoma.cn'
password = 'V7gvsYV8fTNC4TAr'

#App信息
app_name = "小码宝贝"   #App名
from_name = "iOS开发组"
#与开发环境有关
debug_str = "【xx环境】"
pgyer_appQRCodeURL = "https://www.baidu.com"   # 下载地址

# 邮件内容
def _mail_content(con, isRelease):
    
    if (int(isRelease) == 1) :
        debug_str = "【生产环境】"
        pgyer_appQRCodeURL = "https://www.pgyer.com/Mgfr"
    else :
        debug_str = "【测试环境】"
        pgyer_appQRCodeURL = "https://www.pgyer.com/CsJA"
    
    #return (app_name + debug_str + " iOS客户端已经打包完毕，请扫描附件中的二维码或前往 " + pgyer_appQRCodeURL + " 下载测试！如有问题，请联系iOS相关人员，我们会及时解决，谢谢! \n本次修改的内容：" + con)
    return (app_name + debug_str + " iOS客户端已经打包完毕，请前往 " + pgyer_appQRCodeURL + " 下载测试！如有问题，请联系iOS相关人员，我们会及时解决，谢谢! \n本次修改的内容：" + con)

# 地址格式化
def _format_addr(s):
    name, addr = parseaddr(s)
    return formataddr((Header(name, 'utf-8').encode(), addr))

#这是配置发送邮件的python代码
def send_mail(title, content, isRelease):
    #title代表标题 content代表邮件内容
    try:
        #msg = MIMEText(content,'plain','utf-8')
        msg = MIMEText(_mail_content(content, isRelease),'plain','utf-8')
        if not isinstance(title,unicode):
            title = unicode(title, 'utf-8')
        #msg['Subject'] = title
        msg['Subject'] = Header(app_name + " iOS 客户端版本构建完成, 构建时间:" + time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), 'utf-8').encode()
        msg['From'] = sender
        #msg['To'] = receiver
        msg['To'] = ",".join(_format_addr('%s' % receivers))
        
        msg["Accept-Language"]="zh-CN"
        msg["Accept-Charset"]="ISO-8859-1,utf-8"

        smtp = smtplib.SMTP_SSL(smtpserver,465)
        smtp.login(username, password)
        smtp.sendmail(sender, receivers, msg.as_string())
        smtp.quit()
        return True
    except Exception, e:
        print str(e)
        return False

if send_mail(sys.argv[1], sys.argv[2], sys.argv[3]):
    print "发送done!"
else:
    print "发送failed!"

