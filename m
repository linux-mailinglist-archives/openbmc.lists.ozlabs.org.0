Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB648B373
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 18:17:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYHST1NSJz30Jh
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 04:17:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P6QccqsF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P6QccqsF; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYHS26h03z2ymb
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 04:17:04 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id w188so2336613oiw.13
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=Ka32h4Qt6vOef9AKsvKKPMIe6MvxOipANIMxdIq1HUw=;
 b=P6QccqsFHnMRur3tcNKAPP2J/RVClHSjY6iJBYmlEePCjbe2wtcYbRH4j1gPwrF8g4
 yeyCDX5Z4H5OYiKTNnreF23p5F54d2P5EpQJMtyKaUK0wayG2QRH8eYVcS4rL9drSMPV
 QU0ka4arhRRxOkufq1nr6YuDlCFC3yrnBO15TA9xuCmRYutvYD1/NPKAfU9Ny0nWDyrP
 U0j/FIO4l1yxeOwL51AMCQS9HfSAv5RNzWMVVVL5Mq5+RP8oTK2IexdUJEP8gXiSPSwn
 mp4eArQg7Oj36+cC3dp5LFvPA+RkEFbybxDMQX9bBFnUZpL1VpfE198IW89Xdh+XUWsC
 3J/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=Ka32h4Qt6vOef9AKsvKKPMIe6MvxOipANIMxdIq1HUw=;
 b=YqToFcrU0CjzDun9skM8tEApoWHK13NY833bjkkFIxOT1y34Xzje+03zJv7/m5aAJy
 vGfXNIyqY2s1TfBd/eDCyNh/Tu+TzlcW+aN9Cvpx+B4U3wQwumWbc9eRwyhoo6FrduLB
 FCAPkZLzbivEKT2gxvSyXy79kLOp4uDnFwiRwRUK7GviUb9268eagTdamymjXk4XO1Zr
 rtzFfJMCTwuSMamHmEqo4EWSPYjZeg93H/AjfaXGKwG9xwL31OughAUlQoJEcDvgRWrK
 cgwIkQEIxz1Xd7K2mpfe0u0/DXOWj3xOIFO5z+ng5Ylg2rdGwLyaMpPGDfc1y+Pn/KcV
 9prg==
X-Gm-Message-State: AOAM5324FoJz+TjLxGZ63Wz42md90Eg0l0deOqtd4/nbO90OWK4yC3Wh
 SPjSq1QCq+reyjAH/B2aTYvfyUvEN/U=
X-Google-Smtp-Source: ABdhPJzarl7wTd4iYppEasKdVriH+TbEqvfj2Cy7l5oguNHpZI66e7j9JTQSxmQvfPpkXU/DToJ47Q==
X-Received: by 2002:a05:6808:1444:: with SMTP id
 x4mr2511629oiv.171.1641921419766; 
 Tue, 11 Jan 2022 09:16:59 -0800 (PST)
Received: from smtpclient.apple (229.sub-174-198-128.myvzw.com.
 [174.198.128.229])
 by smtp.gmail.com with ESMTPSA id 23sm2123878oty.6.2022.01.11.09.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 09:16:59 -0800 (PST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-CF607D50-0CB7-4E44-B4D4-D25315D6D8B2
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Query Sensor
Message-Id: <9049D645-3D91-4302-881A-E5FD287FE22C@gmail.com>
Date: Tue, 11 Jan 2022 10:16:58 -0700
To: Ed Tanous <edtanous@google.com>
X-Mailer: iPad Mail (19C56)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-CF607D50-0CB7-4E44-B4D4-D25315D6D8B2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFThis is how to do it:

dbus-send --system --print-reply \
--dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b71e=
b7a1f29187594c05bb8fd9a.Hwmon1 \
/xyz/openbmc_project/sensors/temperature/lm75temp \
org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sensor.Value s=
tring:Value \
double:

It is not clear to me why the second parameter string:Value

I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is the Prop=
erty name, and properties have values, so the second parameter says get the V=
alue of a property whose name ends in .Value.

To test that, I tried string:MaxValue, and that works.

I confirmed with this:

busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a1=
87a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sensors/tempera=
ture/lm75temp

A very useful command.

Also useful:

dbus-send --system --print-reply \
--dest=3Dxyz.openbmc_project.ObjectMapper /\
xyz/openbmc_project/object_mapper \
xyz.openbmc_project.ObjectMapper.GetSubTree \
string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"


Mike

Sent from my iPad

> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.com> w=
rote:
>>=20
>> Hi,
>>=20
>> I could not find an example of a sensor query in the docs. I assume somet=
hing like this:
>>=20
>> dbus-send --system --print-reply \
>>=20
>> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>>=20
>> /xyz/openbmc_project/sensors/temperature/lm75temp
>>=20
>> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value \=

>>=20
>> double:
>=20
> I don't have an example offhand, but the interface you're looking for
> in the bolded area is
> org.freedesktop.DBus.Properties.Get
>=20
> Stack overflow for essentially the same question with an example:
> https://stackoverflow.com/questions/48648952/set-get-property-using-dbus-s=
end
>=20
>>=20
>> With the bold interface replaced with something correct.
>>=20
>> Can some one give me an example, and a url about how to query properties?=

>>=20
>> Mike
>>=20
>> Sent from my iPad

--Apple-Mail-CF607D50-0CB7-4E44-B4D4-D25315D6D8B2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BFThis is how to do=
 it:<div dir=3D"ltr"><div><br></div><div><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Cali=
bri, sans-serif;">dbus-send --system --print-reply \<o:p></o:p></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size:=
 11pt; font-family: Calibri, sans-serif;">--dest=3Dxyz.openbmc_project.Hwmon=
-5a446562b1a2e55ef11da905907088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \<o=
:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;=
 margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">/xyz/openb=
mc_project/sensors/temperature/lm75temp \<o:p></o:p></p><p class=3D"MsoNorma=
l" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; fo=
nt-family: Calibri, sans-serif;">org.freedesktop.DBus.Properties.Get string:=
xyz.openbmc_project.Sensor.Value string:Value \<o:p></o:p></p><p class=3D"Ms=
oNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11=
pt; font-family: Calibri, sans-serif;">double:</p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;"><br></p><p class=3D"MsoNormal" style=3D"-webkit-t=
ext-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, s=
ans-serif;">It is not clear to me why the second parameter string:Value</p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; f=
ont-size: 11pt; font-family: Calibri, sans-serif;"><br></p><p class=3D"MsoNo=
rmal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt;=
 font-family: Calibri, sans-serif;">I guessed on that and it works. Perhaps x=
yz=E2=80=A6Sensor.Value is the Property name, and properties have values, so=
 the second parameter says get the Value of a property whose name ends in .V=
alue.</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; mar=
gin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><br></p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-=
size: 11pt; font-family: Calibri, sans-serif;">To test that, I tried string:=
MaxValue, and that works.</p><p class=3D"MsoNormal" style=3D"-webkit-text-si=
ze-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-se=
rif;"><br></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">I confirm=
ed with this:</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><br></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0i=
n; font-size: 11pt; font-family: Calibri, sans-serif;"><span style=3D"backgr=
ound-color: rgb(255, 255, 255);">busctl introspect xyz.openbmc_project.Hwmon=
-5a446562b1a2e55ef11da905907088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xy=
z/openbmc_project/sensors/temperature/lm75temp</span></p><p class=3D"MsoNorm=
al" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; f=
ont-family: Calibri, sans-serif;"><span style=3D"background-color: rgb(255, 2=
55, 255);"><br></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-=
adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif=
;"><span style=3D"background-color: rgb(255, 255, 255);">A very useful comma=
nd.</span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><br></p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; f=
ont-size: 11pt; font-family: Calibri, sans-serif;">Also useful:</p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size:=
 11pt; font-family: Calibri, sans-serif;"><br></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;">dbus-send --system --print-reply \<o:p></o:p></p>=
<p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in;=
 font-size: 11pt; font-family: Calibri, sans-serif;">--dest=3Dxyz.openbmc_pr=
oject.ObjectMapper /\<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-=
text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, s=
ans-serif;">xyz/openbmc_project/object_mapper \<o:p></o:p></p><p class=3D"Ms=
oNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11=
pt; font-family: Calibri, sans-serif;">xyz.openbmc_project.ObjectMapper.GetS=
ubTree \<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adj=
ust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">=
string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"</p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-=
size: 11pt; font-family: Calibri, sans-serif;"><br></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; fon=
t-family: Calibri, sans-serif;"><br></p><p class=3D"MsoNormal" style=3D"-web=
kit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calib=
ri, sans-serif;">Mike</p><br><div dir=3D"ltr">Sent from my iPad</div><div di=
r=3D"ltr"><br><blockquote type=3D"cite">On Jan 10, 2022, at 4:50 PM, Ed Tano=
us &lt;edtanous@google.com&gt; wrote:<br><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Mon, Jan 10, 2022 at 3:47 PM=
 Mike Jones &lt;proclivis@gmail.com&gt; wrote:</span><br><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Hi,</sp=
an><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote>=
<blockquote type=3D"cite"><span>I could not find an example of a sensor quer=
y in the docs. I assume something like this:</span><br></blockquote><blockqu=
ote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><s=
pan>dbus-send --system --print-reply \</span><br></blockquote><blockquote ty=
pe=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>--=
dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b71eb7=
a1f29187594c05bb8fd9a.Hwmon1 \</span><br></blockquote><blockquote type=3D"ci=
te"><span></span><br></blockquote><blockquote type=3D"cite"><span>/xyz/openb=
mc_project/sensors/temperature/lm75temp</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>x=
yz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value \</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span>double:</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><span></span><br><span>I don't ha=
ve an example offhand, but the interface you're looking for</span><br><span>=
in the bolded area is</span><br><span>org.freedesktop.DBus.Properties.Get</s=
pan><br><span></span><br><span>Stack overflow for essentially the same quest=
ion with an example:</span><br><span>https://stackoverflow.com/questions/486=
48952/set-get-property-using-dbus-send</span><br><span></span><br><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>With the bold interface replaced with something correct.</span><br></block=
quote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote ty=
pe=3D"cite"><span>Can some one give me an example, and a url about how to qu=
ery properties?</span><br></blockquote><blockquote type=3D"cite"><span></spa=
n><br></blockquote><blockquote type=3D"cite"><span>Mike</span><br></blockquo=
te><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>Sent from my iPad</span><br></blockquote></div></blockquote></d=
iv></div></div></body></html>=

--Apple-Mail-CF607D50-0CB7-4E44-B4D4-D25315D6D8B2--
