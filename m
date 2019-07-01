Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B00945C8F0
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 07:45:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCrl1LlNzDqT6
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:45:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zd-tech.com.cn
 (client-ip=220.181.97.139; helo=m97139.mail.qiye.163.com;
 envelope-from=rxsun@zd-tech.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=zd-tech.com.cn
Received: from m97139.mail.qiye.163.com (m97139.mail.qiye.163.com
 [220.181.97.139])
 by lists.ozlabs.org (Postfix) with ESMTP id 45cqTN5k10zDqYV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 00:27:18 +1000 (AEST)
Received: from 192.168.2.100 (unknown [114.246.165.87])
 by smtp10 (Coremail) with SMTP id vOCowADXapUvGBpdkHfuAA--.1864S2;
 Mon, 01 Jul 2019 22:26:56 +0800 (CST)
From: =?UTF-8?B?5a2Z55Ge6Zye?= <rxsun@zd-tech.com.cn>
Subject: Re: Network Settings GUI
Message-ID: <14DDB6E3-8F8F-4536-835A-35B7D2AD3A76@zd-tech.com.cn>
Date: Mon, 1 Jul 2019 22:26:54 +0800
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
 <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
 <CAMTupoTUFv3TCY=D8OatOTCeoBdCsbqXVep5ZM6vXdJ1EGgr-A@mail.gmail.com>
 <181ab467.6aa8.16b8d45bb45.Coremail.rxsun@zd-tech.com.cn>
In-Reply-To: <CAMTupoT26K4x4RB+=DiEphFfKZWhBm-ysb17J+thmuxkTVJodQ@mail.gmail.com>
To: Jandra A <jandraara@gmail.com>
X-Mailer: NetEase iOS Mail 6.14.4.1456 [iPhone 7 iOS12.3.1]
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: vOCowADXapUvGBpdkHfuAA--.1864S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUU7KVUUUUU
X-Originating-IP: [114.246.165.87]
X-CM-SenderInfo: pu0v30o62gg3xhfkhulrpou0/1tbibhjkhVlZupaQlQAAs+
X-Mailman-Approved-At: Tue, 02 Jul 2019 15:42:20 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 Derick <derick.montague@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<html><head><meta http-equiv=3D=22Content-Type=22 content=3D=22text/html;=
 charset=3Dutf-8=22 /></head><body><div id=3D=22contentDescription=22 sty=
le=3D=22line-height:1.5;text-align:justify;text-justify:inter-ideograph=22=
>
<div id=3D=22imail=5FextraContent=22>hi=EF=BC=8C
<br/>After the meeting of last week=EF=BC=8CI was expecting the email abo=
ut ipv6 ui designing and ipv6 interface with web server =EF=BC=8Cwhen wil=
l I receive it=EF=BC=9FShould we have another meeting this week=EF=BC=9F
<br/>best regard=EF=BC=81
<br/>
<br/>ruixia=EF=BC=8Csun</div>
<div><br/></div>
<div><br/></div>

<div class=3D=22NETEASEMAILMASTERLOCALSIGNATURE=22 contenteditable=3D=22f=
alse=22>
    <div id=3D=22imail=5Fsignature=22><=21DOCTYPE html>
<html lang=3D=22en=22 style=3D=22height:100%=22>

<head>
    <meta charset=3D=22UT=46-8=22>
    <meta name=3D=22viewport=22 content=3D=22width=3Ddevice-width, initia=
l-scale=3D1.0, maximum-scale=3D1.0, minimum-scale=3D1.0,user-scalable=3Dn=
o=22>
    <meta http-equiv=3D=22X-UA-Compatible=22 content=3D=22ie=3Dedge=22>
</head>

<body style=3D=22margin:0;padding:0=22>
    <a href=3D=22https://maas.mail.163.com/dashi-web-extend/html/proSigna=
ture.html=3FiconUrl=3Dhttps%3A%2=46%2=46mail-online.nosdn.127.net%2=46qiy=
elogo%2=46defaultAvatar.png&name=3D%E5%AD%99%E7%91%9E%E9%9C%9E&uid=3Dexam=
ple%40163.com&ftlId=3D3&items=3D%5B%22%E9%82%AE%E7%AE%B1%E=46%BC%9Arxsun%=
40zd-tech.com.cn%22%5D=22 width=3D=22400=22 style=3D=22display:block; max=
-width: 400px; =5Fwidth: 400px; background:=23fff;padding:15px 0 10px 0;t=
ext-decoration: none; outline:none;-webkit-tap-highlight-color:transparen=
t;=22>
        <table cellpadding=3D=220=22 style=3D=22width:100%; max-width: 10=
0%; table-layout: fixed; border-collapse: collapse; border-spacing: 0; li=
ne-height: 1.3; color: =239b9ea1;font-size: 14px;=22>
            <tbody style=3D=22font-family: 'Ping=46ang SC', 'Hiragino San=
s GB','WenQuanYi Micro Hei', 'Microsoft Yahei', '=E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91', verdana =21important; word-wrap:break-word; word-break:bre=
ak-all;=22>
                <tr>
                    <td width=3D=2245=22 style=3D=22padding:0 7px 0 0; bo=
x-sizing: border-box; width: 45px;=22>
                        <img width=3D=2238=22 height=3D=2238=22 style=3D=22=
width: 38px; height: 38px; border-radius:50%;=22 src=3D=22https://mail-on=
line.nosdn.127.net/qiyelogo/defaultAvatar.png=22 />
                    </td>
                    <td style=3D=22padding: 0 0 0 7px;=22>
                        <div style=3D=22max-width: 380px;  =5Fwidth: 380p=
x;=22>
                            <div style=3D=22box-sizing: border-box; paddi=
ng-right: 35px; font-size: 16px; margin-bottom: 5px; color:=2331353b;font=
-weight:bold;width: 100%; white-space: nowrap;overflow: hidden;text-overf=
low: ellipsis;=22>=E5=AD=99=E7=91=9E=E9=9C=9E</div>
                            <div style=3D=22font-size:0;line-height: 0;=22=
>
                            </div>
                                <div style=3D=22word-wrap:break-word;word=
-break:break-all=22>
                                    =E9=82=AE=E7=AE=B1=EF=BC=9Arxsun=40zd=
-tech.com.cn
                                </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </a>
</body>

</html><html><body><p style=3D=22border-top:1px solid =23e5e5e5;padding-t=
op: 8px; font-size: 12px; color:=23b6b8bb;line-height: 1.833;=22>=E7=AD=BE=
=E5=90=8D=E7=94=B1 <a href=3D=22https://mail.163.com/dashi/dlpro.html=3Ff=
rom=3Dmail88=22 style=3D=22color:=236aa8f6;text-decoration: none=22>=E7=BD=
=91=E6=98=93=E9=82=AE=E7=AE=B1=E5=A4=A7=E5=B8=88</a> =E5=AE=9A=E5=88=B6</=
p></body></html></div>
</div>

<div class=3D=22J-reply=22 style=3D=22background-color:=23f2f2f2;color:bl=
ack;padding-top:6px;padding-bottom:6px;border-radius:3px;-moz-border-radi=
us:3px;-webkit-border-radius:3px;margin-top:45px;margin-bottom:20px;=22><=
div style=3D=22font-size:14px;line-height:1.5;word-break:break-all;margin=
-left:10px;margin-right:10px=22>On <span class=3D=22mail-date=22>06/25/20=
19 23:25</span>, <a class=3D=22mail-to=22 style=3D=22text-decoration:none=
;color:=232a97ff;=22 href=3D=22mailto:jandraara=40gmail.com=22>Jandra A</=
a> wrote: </div></div><blockquote id=3D=22ntes-iosmail-quote=22 style =3D=
 =22margin:0=22><div dir=3D=22ltr=22>Great, let&=2339;s meet using my web=
ex=C2=A0<a href=3D=22https://ibm.webex.com/meet/jandra.aranguren=22 targe=
t=3D=22=5Fblank=22 style=3D=22box-sizing:inherit;text-decoration-line:non=
e;outline:0px;color:rgb(16,92,182);font-family:&quot;Helvetica Neue&quot;=
,Helvetica,Arial,sans-serif;font-size:12px=22>https://ibm.webex.com/meet/=
jandra.aranguren</a>=C2=A0I will send you an invite as well.=C2=A0</div><=
br><div class=3D=22gmail=5Fquote=22><div dir=3D=22ltr=22 class=3D=22gmail=
=5Fattr=22>On Tue, Jun 25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=9C=9E &l=
t;<a href=3D=22mailto:rxsun=40zd-tech.com.cn=22>rxsun=40zd-tech.com.cn</a=
>&gt; wrote:<br></div><blockquote class=3D=22gmail=5Fquote=22 style=3D=22=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-l=
eft:1ex=22><div style=3D=22line-height:1.7;color:rgb(0,0,0);font-size:14p=
x;font-family:Arial=22><div>Hi,all,</div><div>I will be glad to meet at 7=
:00AM Central time this Wednesday (June 26th).</div><div><br></div><div>R=
uixia,Sun</div><br><br><div style=3D=22zoom:1=22></div><br>=E5=8F=91=E4=BB=
=B6=E4=BA=BA=EF=BC=9A&quot;Jandra A&quot; &lt;<a href=3D=22mailto:jandraa=
ra=40gmail.com=22 target=3D=22=5Fblank=22>jandraara=40gmail.com</a>&gt;<b=
r>=E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2019-06-25 00:51:39<br>=E6=
=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi &lt;<a href=3D=22mailto:145033585=
7=40qq.com=22 target=3D=22=5Fblank=22>1450335857=40qq.com</a>&gt;<br>=E6=8A=
=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick &lt;<a href=3D=22mailto:derick.monta=
gue=40gmail.com=22 target=3D=22=5Fblank=22>derick.montague=40gmail.com</a=
>&gt;,openbmc &lt;<a href=3D=22mailto:openbmc=40lists.ozlabs.org=22 targe=
t=3D=22=5Fblank=22>openbmc=40lists.ozlabs.org</a>&gt;,rxsun &lt;<a href=3D=
=22mailto:rxsun=40zd-tech.com.cn=22 target=3D=22=5Fblank=22>rxsun=40zd-te=
ch.com.cn</a>&gt;<br>=E4=B8=BB=E9=A2=98=EF=BC=9ARe: Re: Network Settings =
GUI<br><blockquote id=3D=22gmail-m=5F-8231268627540647716isReplyContent=22=
 style=3D=22padding-left:1ex;margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204)=22><div dir=3D=22ltr=22>Hi=C2=A0Xiuzhi and Ruixia,=C2=
=A0<div><br></div><div>It would be great to set some time to align on the=
 requirements from design and how to work together so that your team can =
start on the so front-end development.=C2=A0=C2=A0<br><br>Like Derick sai=
d, we meet every other Wednesday at 10:00 Central time to discuss GUI iss=
ues, with the next one being next Wednesday (July 3rd). Hopefully you can=
 make that.=C2=A0</div><div><br></div><div>If you cannot, I am happy to m=
eet at 7:00 or 8:00 AM Central time this Wednesday (June 26th) or =46rida=
y (June 28th). Please let me know.=C2=A0</div><div><br></div><div>Regards=
,</div></div><br><div class=3D=22gmail=5Fquote=22><div dir=3D=22ltr=22 cl=
ass=3D=22gmail=5Fattr=22>On Wed, Jun 19, 2019 at 8:30 PM xiuzhi &lt;<a hr=
ef=3D=22mailto:1450335857=40qq.com=22 target=3D=22=5Fblank=22>1450335857=40=
qq.com</a>&gt; wrote:<br></div><blockquote class=3D=22gmail=5Fquote=22 st=
yle=3D=22margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex=22><div>Hi Derick,</div><div>&gt;&gt; The IPV6 webui sho=
uld support both IPV4 and IPV6 on a single interface at the same time and=
 users can set IPV4 and IPV6 on the same network webpage from Lenovo test=
 cases.</div><div><br>&gt;Thank you=21<br><br>&gt;&gt;=C2=A0 Ruixia (her =
email: <a href=3D=22mailto:rxsun=40zd-tech.com.cn=22 target=3D=22=5Fblank=
=22>rxsun=40zd-tech.com.cn</a>;), form my team can do=C2=A0 front-end=C2=A0=
 to implement your design .=C2=A0 It would be best if the IPV6 feature co=
uld be achieved in one to two months.<br><br>&gt;It would be great if she=
 were able to join our GUI Community<br>workgroup. It&=2339;s every other=
 Wednesday at 10:00 Central Time. We use<br>these to discuss all the GUI =
issues. Where are you located=3F<br>=C2=A0 I am in BeiJing=C2=A0 UTC+8. T=
he meeting time is=C2=A0=C2=A0Wednesday=C2=A0 23:00 Beijing Time (Wednesd=
ay 10:00 am=C2=A0<span style=3D=22font-family:Arial,Helvetica,sans-serif;=
font-size:17px=22>Central Daylight Time</span>),isn&=2339;t it=3F</div><d=
iv>&gt;GUI Community Workgroup Wiki:<br><a href=3D=22https://github.com/o=
penbmc/openbmc/wiki/GUI-Design-work-group=22 target=3D=22=5Fblank=22>http=
s://github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a><br></div><d=
iv><br></div><div>Best,</div><div>Xiuzhi</div></blockquote></div>
</blockquote></div></blockquote></div>

</blockquote>
</div></body></html>

