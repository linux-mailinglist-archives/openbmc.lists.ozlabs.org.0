Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4508F2E48
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 13:42:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47832C3yzMzF6Fv
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 23:42:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vOvkFR+D"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47830V2BCWzF6Fc
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 23:40:39 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id r22so2224110qtt.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2019 04:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0s/jO7G9stDk33uDT1cXAjqyQwJUXSRSXEFSAfbf+lQ=;
 b=vOvkFR+DTzwQQroL/7FfAE41EIPFN+7WjSuuAckRJyybzYtk8lDjs61GQBuO88lGEx
 r5vsQCCI1kRJAwL9yX1jlE7MtFj/GUbWGQSO1PkEW0E2O4ugd3QLg4gcU/CRAE+nqpu0
 yZGfTAdi41jHRonkVCQCD1gv5W/dgcDqxFlmGFGqSPM1LBC9rOtYrOQOKAfSfwznHzW4
 4CAU+0ppkf2pFVbAYso1Awb7mhlVi7DYILlSJIe5Qnyga23MNriL5sbJnIOF7N+0BFX6
 aOFoSL+kdniAHOGfm85wd8vWCkFxuB/erGLJnhbyQGk5ydzKsBGL+IA9LE618K93sy2y
 WpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0s/jO7G9stDk33uDT1cXAjqyQwJUXSRSXEFSAfbf+lQ=;
 b=WlXR7p/dDOL0vx69RhD1csJNaY7WcJK6ofOpzCXXV1hWimemsWsEg73fTikQW0Q77r
 ksrrae7/BMd0/+4iKyGZGLugOLsyjm+ON5GgSbp8D2Xd3E9xoW97ErTSdW6cL55BpLDO
 0Oy4mpEyisSD9d6qGmSoyLV8Pjnzctoo9XUJX8VLvwlmppHyXA9fSfroTpzaCYC0Csxj
 oL4bdxyLJK16FHtLTIdo9uYAHnRwe0Cyw+2tp8/azZUJ6b+DDktxyraJcTrxduE56bgF
 fubtj+Suc89pe0VU38RB4jQlU8sn4rIOl7FigjAOAb3sznqzNd0WByPazgkk3GEaEOE1
 s0Cg==
X-Gm-Message-State: APjAAAUEL+bwCaLaLafr03jZyssY0TUrnxZmXzdcoBl7eX6xlH/lJPpI
 Lmr3n+MURdlYhKsy2qMd3dEF49X68qjU6ctuA1E=
X-Google-Smtp-Source: APXvYqx+jDMGNB4Y79bCAArCKDaELmMvk8HrMzWLAYpJAs0L0A2MA6pxypIbZtI4FxAdhvAvNAVyHC3BFfnnG6tXsn0=
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr3605515qti.380.1573130436433; 
 Thu, 07 Nov 2019 04:40:36 -0800 (PST)
MIME-Version: 1.0
References: <139bf9c3.6e26.16e44e2c237.Coremail.ouyangxuan10@163.com>
 <OF65345083.058B21A2-ON002584AB.003CA681-002584AB.003CA687@notes.na.collabserv.com>
 <4b98545f.940d.16e45a4ed2f.Coremail.ouyangxuan10@163.com>
In-Reply-To: <4b98545f.940d.16e45a4ed2f.Coremail.ouyangxuan10@163.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 7 Nov 2019 20:40:25 +0800
Message-ID: <CANFuQ7Dga46G2nXgEq4cZKNFacKXHM8UsOPjfqngLcj-z=ARtg@mail.gmail.com>
Subject: Re: Re: why the object cannot list in rest api?
To: www <ouyangxuan10@163.com>
Content-Type: multipart/alternative; boundary="000000000000d95c5c0596c0f8df"
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d95c5c0596c0f8df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

www <ouyangxuan10@163.com> =E4=BA=8E2019=E5=B9=B411=E6=9C=887=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:35=E5=86=99=E9=81=93=EF=BC=9A

>
> The problem is not the command. If you restart mapperx, it will appear. I=
t
> should be the problem of mapperx?
>
> {
>     "data": [
>         "/xyz/openbmc_project/dump/entry",        restart mapperx, the ob=
ject can be  display in rest-api
>
> Maybe your `mapper` is a bit problem, here is my configuration, see:

/etc/default/obmc
MAPPER_SERVICES=3D"org.open_power xyz.openbmc_project org.openbmc"
MAPPER_INTERFACES=3D"org.freedesktop.DBus.ObjectManager org.open_power
xyz.openbmc_project org.openbmc"
MAPPER_SERVICEBLACKLISTS=3D""

>
>         "/xyz/openbmc_project/dump/entry/1",
>         "/xyz/openbmc_project/dump/internal",
>         "/xyz/openbmc_project/dump/internal/manager"
>     ],
>     "message": "200 OK",
>     "status": "ok"
> }
>
>
> thanks,
> Byron
>
>
>
> At 2019-11-07 19:02:27, "Devender Rao" <devenrao@in.ibm.com> wrote:
>
> Do check out this readme document for the commands
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-debug-collector/+/2=
5357
>
>
> ----- Original message -----
> From: www <ouyangxuan10@163.com>
> Sent by: "openbmc" <openbmc-bounces+devenrao=3Din.ibm.com@lists.ozlabs.or=
g>
> To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Cc:
> Subject: [EXTERNAL] why the object cannot list in rest api?
> Date: Thu, Nov 7, 2019 1:56 PM
>
> Dear all,
>
> There are some objects on DBUS that can be displayed with busctl command,
> but can't be displayed with rest API. Is there any reason for this?
> =E2=94=94=E2=94=80/xyz
>   =E2=94=94=E2=94=80/xyz/openbmc_project
>     =E2=94=94=E2=94=80/xyz/openbmc_project/dump
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/dump/entry
>       =E2=94=82 =E2=94=94=E2=94=80/xyz/openbmc_project/dump/entry/1
>       =E2=94=94=E2=94=80/xyz/openbmc_project/dump/internal
>         =E2=94=94=E2=94=80/xyz/openbmc_project/dump/internal/manager
>
> curl -k -H "X-Auth-Token: $token" https://
> ${bmc}/xyz/openbmc_project/dump/list
> {
>   "data": [
>     "/xyz/openbmc_project/dump/internal",
>     "/xyz/openbmc_project/dump/internal/manager"
>   ],
>   "message": "200 OK",
>   "status": "ok"
> }
>
> thanks=EF=BC=8C
> Byron
>
>
>
>
>
>
>
>
>
>
>

--000000000000d95c5c0596c0f8df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:simhei,sans-serif"><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">www &lt;<a href=3D"mailto:ouyangxuan1=
0@163.com">ouyangxuan10@163.com</a>&gt; =E4=BA=8E2019=E5=B9=B411=E6=9C=887=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:35=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=
=3D"line-height:1.7;color:rgb(0,0,0);font-size:14px;font-family:Arial"><div=
><br></div><div>The problem is not the command. If you restart mapperx, it =
will appear. It should be the problem of <span style=3D"background-color:rg=
b(255,204,0)">mapperx</span>?</div><div><br></div><div><pre>{
    &quot;data&quot;: [
        <span style=3D"background-color:rgb(255,204,0)">&quot;/xyz/openbmc_=
project/dump/entry&quot;,        restart mapperx, the object can be  displa=
y in rest-api</span></pre></div></div></blockquote><div><span class=3D"gmai=
l_default" style=3D"font-family:simhei,sans-serif"></span>Maybe your `mappe=
r` is a bit problem, here is my configuration, see:</div><br>/etc/default/o=
bmc<br>MAPPER_SERVICES=3D&quot;org.open_power xyz.openbmc_project org.openb=
mc&quot;<br>MAPPER_INTERFACES=3D&quot;org.freedesktop.DBus.ObjectManager or=
g.open_power xyz.openbmc_project org.openbmc&quot;<br><div><span class=3D"g=
mail_default" style=3D"font-family:simhei,sans-serif"><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif">MAPPER_SERVICEBLACKLISTS=3D&quot;&quot;</=
span></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div style=3D"line-height:1.7;color:rgb(0,0,0);font-size:14px;font-family:Ar=
ial"><div><pre><span style=3D"background-color:rgb(255,204,0)">
        &quot;/xyz/openbmc_project/dump/entry/1&quot;,</span>
        &quot;/xyz/openbmc_project/dump/internal&quot;,
        &quot;/xyz/openbmc_project/dump/internal/manager&quot;
    ],
    &quot;message&quot;: &quot;200 OK&quot;,
    &quot;status&quot;: &quot;ok&quot;
}</pre></div><div><br></div><div>thanks,</div><div>Byron</div><br><br><div =
style=3D"zoom:1"></div><div id=3D"gmail-m_8754409728253516380divNeteaseMail=
Card"></div><br>At 2019-11-07 19:02:27, &quot;Devender Rao&quot; &lt;<a hre=
f=3D"mailto:devenrao@in.ibm.com" target=3D"_blank">devenrao@in.ibm.com</a>&=
gt; wrote:<br> <blockquote id=3D"gmail-m_8754409728253516380isReplyContent"=
 style=3D"padding-left:1ex;margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204)"><div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans=
-serif;font-size:10pt"><div dir=3D"ltr">Do check out this readme document f=
or the commands<br><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/=
phosphor-debug-collector/+/25357" target=3D"_blank">https://gerrit.openbmc-=
project.xyz/c/openbmc/phosphor-debug-collector/+/25357</a></div>
<div dir=3D"ltr">=C2=A0</div>
<blockquote dir=3D"ltr" style=3D"border-left:2px solid rgb(170,170,170);mar=
gin-left:5px;padding-left:5px;direction:ltr;margin-right:0px">----- Origina=
l message -----<br>From: www &lt;<a href=3D"mailto:ouyangxuan10@163.com" ta=
rget=3D"_blank">ouyangxuan10@163.com</a>&gt;<br>Sent by: &quot;openbmc&quot=
; &lt;openbmc-bounces+devenrao=3D<a href=3D"mailto:in.ibm.com@lists.ozlabs.=
org" target=3D"_blank">in.ibm.com@lists.ozlabs.org</a>&gt;<br>To: &quot;<a =
href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.oz=
labs.org</a>&quot; &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>Cc:<br>Subject: [EXTERNAL] =
why the object cannot list in rest api?<br>Date: Thu, Nov 7, 2019 1:56 PM<b=
r>=C2=A0
<div style=3D"line-height:1.7;color:rgb(0,0,0);font-size:14px;font-family:A=
rial"><div>Dear all,</div>
<div>=C2=A0</div>
<div>There are some objects on DBUS that can be displayed with busctl comma=
nd, but can&#39;t be displayed with rest API. Is there any reason for this?=
</div>
<div><div>=E2=94=94=E2=94=80/xyz</div>
<div>=C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project</div>
<div>=C2=A0 =C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project/dump</div>
<div><span style=3D"background-color:rgb(255,204,0)">=C2=A0 =C2=A0 =C2=A0 =
=E2=94=9C=E2=94=80/xyz/openbmc_project/dump/entry</span></div>
<div><span style=3D"background-color:rgb(255,204,0)">=C2=A0 =C2=A0 =C2=A0 =
=E2=94=82 =E2=94=94=E2=94=80/xyz/openbmc_project/dump/entry/1</span></div>
<div>=C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project/dump/inter=
nal</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80/xyz/openbmc_project/dum=
p/internal/manager</div></div>
<div>=C2=A0</div>
<div><div>curl -k -H &quot;X-Auth-Token: $token&quot; https://${bmc}/xyz/op=
enbmc_project/dump/list</div>
<div>{</div>
<div>=C2=A0 &quot;data&quot;: [</div>
<div>=C2=A0 =C2=A0 &quot;/xyz/openbmc_project/dump/internal&quot;,</div>
<div>=C2=A0 =C2=A0 &quot;/xyz/openbmc_project/dump/internal/manager&quot;</=
div>
<div>=C2=A0 ],</div>
<div>=C2=A0 &quot;message&quot;: &quot;200 OK&quot;,</div>
<div>=C2=A0 &quot;status&quot;: &quot;ok&quot;</div>
<div>}</div></div>
<div>=C2=A0</div>
<div>thanks=EF=BC=8C</div>
<div>Byron</div>
<div>=C2=A0</div></div>=C2=A0

<p><span title=3D"neteasefooter">=C2=A0</span></p></blockquote>
<div dir=3D"ltr">=C2=A0</div></div><br>
</blockquote></div><br><br><span title=3D"neteasefooter"><p>=C2=A0</p></spa=
n></blockquote></div></div>

--000000000000d95c5c0596c0f8df--
