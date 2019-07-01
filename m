Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F298C5BFD5
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 17:29:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45crs05LFqzDqXv
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 01:29:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="apcQsAuu"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45crp958SlzDqX3
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 01:27:13 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id i14so107357ybp.7
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vGUraizocXYY6KcOAYpN0DbNetOZ/3Akld+jfnl5y1o=;
 b=apcQsAuuH7ymitlYILhrbDZwu3iA5RMf/HGU3MU8/UOHRP2w0pn6uh27HpVgMF7lny
 Ln/tDBb+Expqze5pmBb0l/v+s9lcAskTo6ke3d2AbVSkwpfBxtdEEnhyVcwWJk6++Shc
 UbEFdnVliShEsOrBQqwJ7NYjYbGcjmtxdSKUKxd1RToLq1z8hETD2xxqwCcJwuzGAh+a
 dv9Nt4Ug6VYUyzhRkNUOSBlpdE99DPw5PHgTrnaMWtSQjApDi3gPnmNd7PZTYz51mrLc
 t6tE7JxM3W2IXwvW5SQa9/dzJJMJu1cYOv2Tp+ldHszdr6mwnGcEtlY/z8p2vhY2YIFI
 +w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vGUraizocXYY6KcOAYpN0DbNetOZ/3Akld+jfnl5y1o=;
 b=o/nPNS3JoPPx4Ciuvu2NWUXuaS73CHMfLfOKvqqvUpdkDaE0W0JnoBXZ0BKRouMpPZ
 MHY2yLNQDv/7tI4rDFYxopPsG3TH4T/d9sSq3C8XbZMG9qR00Sdadjg0+FIOfOvocFIk
 cUEJAkgJnedoiVaQWvKwh1Z0i7Rcu/6fXvrH1tJgX6oEYS7Ne3dyK1AY8QI6QCbLi/ZY
 TKs+CU3P7+lI2fs7RzxVIcOFYAQDuU+RZNiQo2sjFqMbF/ZsDoMDd/er3bUA8UCVcf3J
 7JcDrdb8ZVQj+ci9QdFY+I8tUnE89l2Aai8Kvh2XpvoRvdxaPFEE+ZBtfu1nBdoVnl+Z
 6jLA==
X-Gm-Message-State: APjAAAXkdFBiFVDgofyCOll1Bx2MBCxv1qyjkOqigvbUt5TLENMws/zf
 NAZAjx3QG5fNrtIu7LROrVzv+dpcgNfGxxJ+Lko=
X-Google-Smtp-Source: APXvYqxd6JnTyNn8GrJM1eL6e7DH6QZr3nrbngBADpsQjhsoIhfgQY0izf1fxdjzre4j5mq3ywtklEkgo2wH99cYuSg=
X-Received: by 2002:a25:b52:: with SMTP id 79mr4436146ybl.6.1561994829033;
 Mon, 01 Jul 2019 08:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
 <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
 <CAMTupoTUFv3TCY=D8OatOTCeoBdCsbqXVep5ZM6vXdJ1EGgr-A@mail.gmail.com>
 <181ab467.6aa8.16b8d45bb45.Coremail.rxsun@zd-tech.com.cn>
 <CAMTupoT26K4x4RB+=DiEphFfKZWhBm-ysb17J+thmuxkTVJodQ@mail.gmail.com>
 <14DDB6E3-8F8F-4536-835A-35B7D2AD3A76@zd-tech.com.cn>
In-Reply-To: <14DDB6E3-8F8F-4536-835A-35B7D2AD3A76@zd-tech.com.cn>
From: Jandra A <jandraara@gmail.com>
Date: Mon, 1 Jul 2019 10:26:57 -0500
Message-ID: <CAMTupoQuwmjkpfF-f7CS7XNw1bT-bzZ5xqW2deVPqT7hPHe6dA@mail.gmail.com>
Subject: Re: Network Settings GUI
To: =?UTF-8?B?5a2Z55Ge6Zye?= <rxsun@zd-tech.com.cn>, 
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000ecf332058ca04234"
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

--000000000000ecf332058ca04234
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ruixia -- I am waiting on a couple of responses from our backend team to be
able to provide a design that aligns with how the functionality is
developed.

Ratan -- I'm helping create the design mockup for including IPV6 in the
Network settings panel so that Lenovo can do the front-end implementation.
Do you know if the work your team was doing for this will be merged to the
master soon?

I have some questions I am hoping you can help answer for this IPV6 design:
- What happens to zeroconf when both IPV4 and IPV6 are enabled? Does it try
to assign an IP address to both (in the case that DHCP doesn't give either)
or does it only assign either an IPV4 IP address or an IPV6 IP address?
- What is the format of IPV6 DNS servers? Is that also in the format of an
IPV6 IP address?

I have built the latest openbmc project image by adding the option "ipv6"
> in the term DISTRO_FEATURES_DEFAULT in the file
> /meta-phosphor/conf/distro/include/phosphor-base.inc. I can ping the
> openbmc  IPV6 IP successfully, but cannot login to it by openssh command.
> It seemed that there are some works on openbmc embedded OS to support IPV=
6.
> Another issue from Ruixia is the IPV6 Dbus Interfaces design, I found
> there are some IPV6 rest-Dbus or Redfish interfaces on yaml files
> available. I don' t know is it enough to the IPV6 webui.


Ratan, would you be able to help Ruixia and Xiuzhi with this?

Regards,
Jandra Aranguren


On Mon, Jul 1, 2019 at 9:27 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-tech.c=
om.cn> wrote:

> hi=EF=BC=8C
> After the meeting of last week=EF=BC=8CI was expecting the email about ip=
v6 ui
> designing and ipv6 interface with web server =EF=BC=8Cwhen will I receive=
 it=EF=BC=9FShould
> we have another meeting this week=EF=BC=9F
> best regard=EF=BC=81
>
> ruixia=EF=BC=8Csun
>
>
> =E5=AD=99=E7=91=9E=E9=9C=9E
> =E9=82=AE=E7=AE=B1=EF=BC=9Arxsun@zd-tech.com.cn
>
> <https://maas.mail.163.com/dashi-web-extend/html/proSignature.html?iconUr=
l=3Dhttps%3A%2F%2Fmail-online.nosdn.127.net%2Fqiyelogo%2FdefaultAvatar.png&=
name=3D%E5%AD%99%E7%91%9E%E9%9C%9E&uid=3Dexample%40163.com&ftlId=3D3&items=
=3D%5B%22%E9%82%AE%E7%AE%B1%EF%BC%9Arxsun%40zd-tech.com.cn%22%5D>
>
> =E7=AD=BE=E5=90=8D=E7=94=B1 =E7=BD=91=E6=98=93=E9=82=AE=E7=AE=B1=E5=A4=A7=
=E5=B8=88 <https://mail.163.com/dashi/dlpro.html?from=3Dmail88> =E5=AE=9A=
=E5=88=B6
> On 06/25/2019 23:25, Jandra A <jandraara@gmail.com> wrote:
>
> Great, let's meet using my webex
> https://ibm.webex.com/meet/jandra.aranguren I will send you an invite as
> well.
>
> On Tue, Jun 25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-tec=
h.com.cn> wrote:
>
>> Hi,all,
>> I will be glad to meet at 7:00AM Central time this Wednesday (June 26th)=
.
>>
>> Ruixia,Sun
>>
>>
>>
>> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A"Jandra A" <jandraara@gmail.com>
>> =E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2019-06-25 00:51:39
>> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi <1450335857@qq.com>
>> =E6=8A=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick <derick.montague@gmail.com>,o=
penbmc <openbmc@lists.ozlabs.org>,rxsun
>> <rxsun@zd-tech.com.cn>
>> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: Re: Network Settings GUI
>>
>> Hi Xiuzhi and Ruixia,
>>
>> It would be great to set some time to align on the requirements from
>> design and how to work together so that your team can start on the so
>> front-end development.
>>
>> Like Derick said, we meet every other Wednesday at 10:00 Central time to
>> discuss GUI issues, with the next one being next Wednesday (July 3rd).
>> Hopefully you can make that.
>>
>> If you cannot, I am happy to meet at 7:00 or 8:00 AM Central time this
>> Wednesday (June 26th) or Friday (June 28th). Please let me know.
>>
>> Regards,
>>
>> On Wed, Jun 19, 2019 at 8:30 PM xiuzhi <1450335857@qq.com> wrote:
>>
>>> Hi Derick,
>>> >> The IPV6 webui should support both IPV4 and IPV6 on a single
>>> interface at the same time and users can set IPV4 and IPV6 on the same
>>> network webpage from Lenovo test cases.
>>>
>>> >Thank you!
>>>
>>> >>  Ruixia (her email: rxsun@zd-tech.com.cn;), form my team can do
>>> front-end  to implement your design .  It would be best if the IPV6 fea=
ture
>>> could be achieved in one to two months.
>>>
>>> >It would be great if she were able to join our GUI Community
>>> workgroup. It's every other Wednesday at 10:00 Central Time. We use
>>> these to discuss all the GUI issues. Where are you located?
>>>   I am in BeiJing  UTC+8. The meeting time is  Wednesday  23:00 Beijing
>>> Time (Wednesday 10:00 am Central Daylight Time),isn't it?
>>> >GUI Community Workgroup Wiki:
>>> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>>>
>>> Best,
>>> Xiuzhi
>>>
>>

--000000000000ecf332058ca04234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ruixia -- I am waiting on a couple of responses from =
our backend team to be able to provide a design that aligns with how the fu=
nctionality is developed.=C2=A0</div><div><br></div><div>Ratan -- I&#39;m h=
elping create the design mockup for including IPV6 in the Network settings =
panel so that Lenovo can do the front-end implementation. Do you know if th=
e work your team was doing for this will be merged to the master soon?</div=
><br>I have some questions I am hoping you can help answer for this IPV6 de=
sign:=C2=A0<div>- What happens to zeroconf when both IPV4 and IPV6 are enab=
led? Does it try to assign an IP address to both (in the case that DHCP doe=
sn&#39;t give either) or does it only assign either an IPV4 IP address or a=
n IPV6 IP address?<div>- What is the format of IPV6 DNS servers? Is that al=
so in the format of an IPV6 IP address?<br><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"=
>I have built the latest openbmc project image by adding the option &quot;i=
pv6&quot; in the term DISTRO_FEATURES_DEFAULT in the file /meta-phosphor/co=
nf/distro/include/phosphor-base.inc. I can ping the openbmc=C2=A0 IPV6 IP s=
uccessfully, but cannot login to it by openssh command.<br>It seemed that t=
here are some works on openbmc embedded OS to support IPV6.<br>Another issu=
e from Ruixia is the IPV6 Dbus Interfaces design, I found there are some IP=
V6 rest-Dbus or Redfish interfaces on yaml files available. I don&#39; t kn=
ow is it enough to the IPV6 webui.</span></blockquote><div><br></div>Ratan,=
 would you be able to help Ruixia and Xiuzhi with this?</div><div><br></div=
><div>Regards,</div><div>Jandra Aranguren=C2=A0</div><div class=3D"gmail-yj=
6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px=
 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jul 1, 2019 at 9:27 AM =E5=AD=99=E7=91=9E=E9=9C=9E &lt;<a href=3D"mailto:r=
xsun@zd-tech.com.cn">rxsun@zd-tech.com.cn</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div><div id=3D"gmail-m_1619914329=
257948851contentDescription" style=3D"line-height:1.5;text-align:justify">
<div id=3D"gmail-m_1619914329257948851imail_extraContent">hi=EF=BC=8C
<br>After the meeting of last week=EF=BC=8CI was expecting the email about =
ipv6 ui designing and ipv6 interface with web server =EF=BC=8Cwhen will I r=
eceive it=EF=BC=9FShould we have another meeting this week=EF=BC=9F
<br>best regard=EF=BC=81
<br>
<br>ruixia=EF=BC=8Csun</div>
<div><br></div>
<div><br></div>

<div class=3D"gmail-m_1619914329257948851NETEASEMAILMASTERLOCALSIGNATURE">
    <div id=3D"gmail-m_1619914329257948851imail_signature"><u></u>



   =20
   =20
   =20


<div style=3D"margin:0px;padding:0px">
    <a href=3D"https://maas.mail.163.com/dashi-web-extend/html/proSignature=
.html?iconUrl=3Dhttps%3A%2F%2Fmail-online.nosdn.127.net%2Fqiyelogo%2Fdefaul=
tAvatar.png&amp;name=3D%E5%AD%99%E7%91%9E%E9%9C%9E&amp;uid=3Dexample%40163.=
com&amp;ftlId=3D3&amp;items=3D%5B%22%E9%82%AE%E7%AE%B1%EF%BC%9Arxsun%40zd-t=
ech.com.cn%22%5D" width=3D"400" style=3D"display:block;max-width:400px;back=
ground:rgb(255,255,255);padding:15px 0px 10px;text-decoration:none;outline:=
none" target=3D"_blank">
        <table cellpadding=3D"0" style=3D"width:100%;max-width:100%;table-l=
ayout:fixed;border-collapse:collapse;border-spacing:0px;line-height:1.3;col=
or:rgb(155,158,161);font-size:14px">
            <tbody style=3D"word-break:break-all;font-family:&quot;PingFang=
 SC&quot;,&quot;Hiragino Sans GB&quot;,&quot;WenQuanYi Micro Hei&quot;,&quo=
t;Microsoft Yahei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,verdana">
                <tr>
                    <td width=3D"45" style=3D"padding:0px 7px 0px 0px;box-s=
izing:border-box;width:45px">
                        <img width=3D"38" height=3D"38" style=3D"width: 38p=
x; height: 38px; border-radius: 50%;" src=3D"https://mail-online.nosdn.127.=
net/qiyelogo/defaultAvatar.png">
                    </td>
                    <td style=3D"padding:0px 0px 0px 7px">
                        <div style=3D"max-width:380px">
                            <div style=3D"box-sizing:border-box;padding-rig=
ht:35px;font-size:16px;margin-bottom:5px;color:rgb(49,53,59);font-weight:bo=
ld;width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis">=
=E5=AD=99=E7=91=9E=E9=9C=9E</div>
                            <div style=3D"font-size:0px;line-height:0">
                            </div>
                                <div style=3D"word-break:break-all">
                                    =E9=82=AE=E7=AE=B1=EF=BC=9Arxsun@zd-tec=
h.com.cn
                                </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </a>
</div>

<div><p style=3D"border-top:1px solid rgb(229,229,229);padding-top:8px;font=
-size:12px;color:rgb(182,184,187);line-height:1.833">=E7=AD=BE=E5=90=8D=E7=
=94=B1 <a href=3D"https://mail.163.com/dashi/dlpro.html?from=3Dmail88" styl=
e=3D"color:rgb(106,168,246);text-decoration:none" target=3D"_blank">=E7=BD=
=91=E6=98=93=E9=82=AE=E7=AE=B1=E5=A4=A7=E5=B8=88</a> =E5=AE=9A=E5=88=B6</p>=
</div></div>
</div>

<div class=3D"gmail-m_1619914329257948851J-reply" style=3D"background-color=
:rgb(242,242,242);color:black;padding-top:6px;padding-bottom:6px;border-rad=
ius:3px;margin-top:45px;margin-bottom:20px"><div style=3D"font-size:14px;li=
ne-height:1.5;word-break:break-all;margin-left:10px;margin-right:10px">On <=
span class=3D"gmail-m_1619914329257948851mail-date">06/25/2019 23:25</span>=
, <a class=3D"gmail-m_1619914329257948851mail-to" style=3D"text-decoration:=
none;color:rgb(42,151,255)" href=3D"mailto:jandraara@gmail.com" target=3D"_=
blank">Jandra A</a> wrote: </div></div><blockquote id=3D"gmail-m_1619914329=
257948851ntes-iosmail-quote" style=3D"margin:0px"><div dir=3D"ltr">Great, l=
et&#39;s meet using my webex=C2=A0<a href=3D"https://ibm.webex.com/meet/jan=
dra.aranguren" style=3D"box-sizing:inherit;text-decoration-line:none;outlin=
e:0px;color:rgb(16,92,182);font-family:&quot;Helvetica Neue&quot;,Helvetica=
,Arial,sans-serif;font-size:12px" target=3D"_blank">https://ibm.webex.com/m=
eet/jandra.aranguren</a>=C2=A0I will send you an invite as well.=C2=A0</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Jun 25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=9C=9E &lt;<a href=3D"mailt=
o:rxsun@zd-tech.com.cn" target=3D"_blank">rxsun@zd-tech.com.cn</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D=
"line-height:1.7;color:rgb(0,0,0);font-size:14px;font-family:Arial"><div>Hi=
,all,</div><div>I will be glad to meet at 7:00AM Central time this Wednesda=
y (June 26th).</div><div><br></div><div>Ruixia,Sun</div><br><br><div style=
=3D"zoom:1"></div><br>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A&quot;Jandra A&qu=
ot; &lt;<a href=3D"mailto:jandraara@gmail.com" target=3D"_blank">jandraara@=
gmail.com</a>&gt;<br>=E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2019-06-2=
5 00:51:39<br>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi &lt;<a href=3D"mai=
lto:1450335857@qq.com" target=3D"_blank">1450335857@qq.com</a>&gt;<br>=E6=
=8A=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick &lt;<a href=3D"mailto:derick.montag=
ue@gmail.com" target=3D"_blank">derick.montague@gmail.com</a>&gt;,openbmc &=
lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@li=
sts.ozlabs.org</a>&gt;,rxsun &lt;<a href=3D"mailto:rxsun@zd-tech.com.cn" ta=
rget=3D"_blank">rxsun@zd-tech.com.cn</a>&gt;<br>=E4=B8=BB=E9=A2=98=EF=BC=9A=
Re: Re: Network Settings GUI<br><blockquote id=3D"gmail-m_16199143292579488=
51gmail-m_-8231268627540647716isReplyContent" style=3D"padding-left:1ex;mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)"><div dir=3D"l=
tr">Hi=C2=A0Xiuzhi and Ruixia,=C2=A0<div><br></div><div>It would be great t=
o set some time to align on the requirements from design and how to work to=
gether so that your team can start on the so front-end development.=C2=A0=
=C2=A0<br><br>Like Derick said, we meet every other Wednesday at 10:00 Cent=
ral time to discuss GUI issues, with the next one being next Wednesday (Jul=
y 3rd). Hopefully you can make that.=C2=A0</div><div><br></div><div>If you =
cannot, I am happy to meet at 7:00 or 8:00 AM Central time this Wednesday (=
June 26th) or Friday (June 28th). Please let me know.=C2=A0</div><div><br><=
/div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 19, 2019 at 8:30 PM xiuzhi &lt;<a href=
=3D"mailto:1450335857@qq.com" target=3D"_blank">1450335857@qq.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi De=
rick,</div><div>&gt;&gt; The IPV6 webui should support both IPV4 and IPV6 o=
n a single interface at the same time and users can set IPV4 and IPV6 on th=
e same network webpage from Lenovo test cases.</div><div><br>&gt;Thank you!=
<br><br>&gt;&gt;=C2=A0 Ruixia (her email: <a href=3D"mailto:rxsun@zd-tech.c=
om.cn" target=3D"_blank">rxsun@zd-tech.com.cn</a>;), form my team can do=C2=
=A0 front-end=C2=A0 to implement your design .=C2=A0 It would be best if th=
e IPV6 feature could be achieved in one to two months.<br><br>&gt;It would =
be great if she were able to join our GUI Community<br>workgroup. It&#39;s =
every other Wednesday at 10:00 Central Time. We use<br>these to discuss all=
 the GUI issues. Where are you located?<br>=C2=A0 I am in BeiJing=C2=A0 UTC=
+8. The meeting time is=C2=A0=C2=A0Wednesday=C2=A0 23:00 Beijing Time (Wedn=
esday 10:00 am=C2=A0<span style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:17px">Central Daylight Time</span>),isn&#39;t it?</div><div>&gt;GU=
I Community Workgroup Wiki:<br><a href=3D"https://github.com/openbmc/openbm=
c/wiki/GUI-Design-work-group" target=3D"_blank">https://github.com/openbmc/=
openbmc/wiki/GUI-Design-work-group</a><br></div><div><br></div><div>Best,</=
div><div>Xiuzhi</div></blockquote></div>
</blockquote></div></blockquote></div>

</blockquote>
</div></div>

</blockquote></div>

--000000000000ecf332058ca04234--
