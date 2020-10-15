Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D678528FCB1
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 05:22:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCBKt07x8zDqYW
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 14:22:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sanmina.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=james.hatt@sanmina.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=sanmina.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sanmina-com.20150623.gappssmtp.com
 header.i=@sanmina-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZVrACeoy; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBqC95YmrzDqDs
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 00:00:32 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 65so2763473otu.9
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sanmina-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=UOxWv2xxCYMxJzZAdXJ0XFKu5pgnWo2kCQTwXMDvx5Y=;
 b=ZVrACeoySje88MJj6PDMhAxs6vhhALTL/oiCWjEkFL1XYEOQNFiErwqgKqsmMp/8O9
 jOGu+INgtd8+q2GpvfU1EzZBf981gJkvlbIz/Ft0kOPApfzWeA14ypBAOitwEGjpqSIM
 FIxehPlT2wVBNgaQ416ZH9q9Ss/Yw5VBGp7AZLi9qSeSo2vVzgE1lwEsGHfNFAit9zBE
 hl4wMToGcneGbkDYWYzhWAVhsi4gX37lk8NYCuccd/nPeJHIMbR7uEREZz015j22oGdu
 SE95AP0o3eWNvyLFfG3aO06VtxWBc/A0hSy/6ew1ak6z34jKuZb6tpmSumeOjWaiQr7T
 1iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UOxWv2xxCYMxJzZAdXJ0XFKu5pgnWo2kCQTwXMDvx5Y=;
 b=B3C9+ck5Q08JUGZ3gVphhaLGYJy6tTcHT2RxkfUoY05hTpyF3pKcuFipYjer4w/xY9
 Urnutlu6TcNRCpL4pYQihZ+qamq/GPaTyjwwHnFbYVS5EsKh0WtNs73z2rnonPp3KDgN
 dEF9tdmFSkuBA3qqn2xRzOVhiK3ywkg6cjS1gKGNpQ6l8GJA/4B3PPKefh68NzQJZQcl
 l9i3N9vFJWcXc+onTj8Jv03VDtsvgpRytlVcFSimrwNuQWuCHBZO5DxYDP71JWOnmTI6
 KVoj2h/EzOiaA0EqALB5X8cm5IgWporGdsJ82Ob3JtubLc2HluCjcAMv8FQsk8Wa4kBq
 X2cA==
X-Gm-Message-State: AOAM532KEkNMbaQbH4zWz1S2l0jAVY4U+Gk/KA5FzMwyzeu1m64MCBzf
 wDqLNVjLHWD4oxaGWTR2E9GIi3pI6ieZ49Ij0tMJqFD4tGaHUJyqkhWPmPc0I9E9dAJ41HPWXN0
 gI2aYfPKPw+qWLiBrt8h2Cw1at1uNe4RkYVo=
X-Google-Smtp-Source: ABdhPJyLQ3jNr2sUSCU4HkZQB1dXUn5RtH0cWidDi55UrotGnJV3QFwxKN/xvcmsRfndV+8mOCIaWnr5nnED0ECHFOE=
X-Received: by 2002:a9d:77d4:: with SMTP id w20mr2639012otl.310.1602766825390; 
 Thu, 15 Oct 2020 06:00:25 -0700 (PDT)
MIME-Version: 1.0
From: James Hatt <james.hatt@sanmina.com>
Date: Thu, 15 Oct 2020 08:00:14 -0500
Message-ID: <CAABA6JmNH=AfzCE4aE_NuYCv126fCXOcexSq6O1C8+DdT6K1Jg@mail.gmail.com>
Subject: I need to build an OpenBMC image for a Portwell Neptune card ...
To: openbmc@lists.ozlabs.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000004f751c05b1b53b23"
X-Mailman-Approved-At: Fri, 16 Oct 2020 14:20:54 +1100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004f751c05b1b53b23
Content-Type: multipart/alternative; boundary="00000000000049402305b1b53b30"

--00000000000049402305b1b53b30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenBMC,
I=E2=80=99ve been handed the *opportunity* of building OpenBMC for the Port=
well
Neptune circuit card. Of course, Portwell is no help whatever.

I am new to OpenBMC. I=E2=80=99ve built Yocto Petalinux machines before. So=
 I have
a little knowledge of Yocto. I=E2=80=99ve lots of experience with Linux and
embedded systems.

Where would I start?

BTW, I was able to clone the OpenBMC repository and build the phosphor
target without error. When I attempt to build meta-portwell/meta-neptune, I
get errors early with bitbake. Since the Portwell literature boasts of
Facebook OpenBMC, I tried their branch and that failed to build also.

Help!
---jjh

*James Hatt |* *Sr. Software Developer*
RF, Optical, and Microelectronics Division
A Division of Sanmina Corporation
Telephone: +1.972.512.5605
email: james.hatt@sanmina.com
1201 W. Crosby Rd., Carrollton, TX 75006
www.sanmina.com |  <http://www.twitter.com/vikinology>*t
<http://www.twitter.com/vikinology>*  <http://www.twitter.com/vikinology>|
<http://www.facebook.com/pages/Viking-Technology/106725999413927>*f
<http://www.facebook.com/pages/Viking-Technology/106725999413927>*
<http://www.facebook.com/pages/Viking-Technology/106725999413927>|
<http://www.linkedin.com/company/86313?trk=3Dtyah>*l
<http://www.linkedin.com/company/86313?trk=3Dtyah>*
<http://www.linkedin.com/company/86313?trk=3Dtyah>|
<http://vimeo.com/vikingtechnology>*v* <http://vimeo.com/vikingtechnology>

--=20
CONFIDENTIALITY
This e-mail message and any attachments thereto, is=20
intended only for use by the addressee(s) named herein and may contain=20
legally privileged and/or confidential information. If you are not the=20
intended recipient of this e-mail message, you are hereby notified that any=
=20
dissemination, distribution or copying of this e-mail message, and any=20
attachments thereto, is strictly prohibited.  If you have received this=20
e-mail message in error, please immediately notify the sender and=20
permanently delete the original and any copies of this email and any prints=
=20
thereof.
ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS=20
E-MAIL IS NOT INTENDED AS A SUBSTITUTE FOR A WRITING.  Notwithstanding the=
=20
Uniform Electronic Transactions Act or the applicability of any other law=
=20
of similar substance and effect, absent an express statement to the=20
contrary hereinabove, this e-mail message its contents, and any attachments=
=20
hereto are not intended to represent an offer or acceptance to enter into a=
=20
contract and are not otherwise intended to bind the sender, Sanmina=20
Corporation (or any of its subsidiaries), or any other person or entity.

--00000000000049402305b1b53b30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-famil=
y:Helvetica;font-size:12px"><font color=3D"#000000">Dear OpenBMC,</font></d=
iv><div style=3D"font-family:Helvetica;font-size:12px"><font color=3D"#0000=
00">I=E2=80=99ve been handed the <i>opportunity</i> of building OpenBMC for=
 the Portwell Neptune circuit card. Of course, Portwell is no help whatever=
.</font></div><div style=3D"font-family:Helvetica;font-size:12px"><font col=
or=3D"#000000"><br></font></div><div style=3D"font-family:Helvetica;font-si=
ze:12px"><font color=3D"#000000">I am new to OpenBMC. I=E2=80=99ve built Yo=
cto Petalinux machines before. So I have a little knowledge of Yocto. I=E2=
=80=99ve lots of experience with Linux and embedded systems.</font></div><d=
iv style=3D"font-family:Helvetica;font-size:12px"><font color=3D"#000000"><=
br></font></div><div style=3D"font-family:Helvetica;font-size:12px"><font c=
olor=3D"#000000">Where would I start?</font></div><div><font color=3D"#0000=
00"><br></font></div><div><font color=3D"#000000">BTW, I was able to clone =
the OpenBMC repository=C2=A0and build the phosphor target without error. Wh=
en I attempt to build meta-portwell/meta-neptune, I get errors early with b=
itbake. Since the Portwell literature boasts of Facebook OpenBMC, I tried t=
heir branch and that failed to build also.</font></div><div><font color=3D"=
#000000"><br></font></div><div><font color=3D"#000000">Help!</font></div><d=
iv><font color=3D"#000000">---jjh=C2=A0</font></div><br clear=3D"all"><div>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><span style=3D"color:rgb=
(80,0,80)"><b style=3D"font-size:small;font-family:arial"><span style=3D"fo=
nt-size:12pt;font-family:Calibri,sans-serif"><font color=3D"#cc0000">James =
Hatt</font></span><font color=3D"#000000">=C2=A0</font><font color=3D"#4444=
44">|</font></b><font color=3D"#444444"><span style=3D"font-family:arial"><=
font size=3D"2">=C2=A0</font><b><font size=3D"2">Sr. Software Developer</fo=
nt></b></span></font><b style=3D"font-size:small;font-family:arial"><span s=
tyle=3D"font-size:12pt;font-family:Calibri,sans-serif"><br></span></b></spa=
n><div style=3D"font-size:12.8px;color:rgb(80,0,80)"><font color=3D"#595959=
" face=3D"Calibri, sans-serif"><span style=3D"font-size:14.6667px">RF, Opti=
cal, and Microelectronics Division</span></font></div><div style=3D"font-si=
ze:12.8px;color:rgb(80,0,80)"><font color=3D"#595959" face=3D"Calibri, sans=
-serif"><span style=3D"font-size:14.6667px">A Division of Sanmina Corporati=
on</span></font></div><div style=3D"font-size:12.8px;color:rgb(0,0,0);font-=
family:arial"><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(89,89,89)">Telephone:=C2=A0+1.972.512.5605=C2=A0</span></div><div=
 style=3D"font-size:12.8px;color:rgb(0,0,0);font-family:arial"><span style=
=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(89,89,89)">emai=
l: <a href=3D"mailto:james.hatt@sanmina.com" target=3D"_blank">james.hatt@s=
anmina.com</a></span></div></div><div style=3D"font-size:12.8px;color:rgb(0=
,0,0);font-family:arial"><span style=3D"font-size:11pt;font-family:Calibri,=
sans-serif;color:rgb(89,89,89)">1201 W. Crosby Rd., Carrollton, TX 75006</s=
pan><span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:rgb(10=
2,102,102)">=C2=A0</span></div><div style=3D"font-size:12.8px;color:rgb(0,0=
,0);font-family:arial"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(89,89,89)"><a href=3D"http://www.sanmina.com/" style=3D"=
color:rgb(17,85,204)" target=3D"_blank"><span style=3D"color:rgb(89,89,89)"=
>www.sanmina.com</span></a></span><span style=3D"font-size:10pt;font-family=
:Arial,sans-serif;color:rgb(89,89,89)">=C2=A0|<a href=3D"http://www.twitter=
.com/vikinology" style=3D"color:rgb(17,85,204)" target=3D"_blank">=C2=A0</a=
></span><b style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px"><span style=3D"font-family:Calibri,sans-serif"><a href=3D"http:=
//www.twitter.com/vikinology" style=3D"color:rgb(17,85,204)" target=3D"_bla=
nk"><span style=3D"color:rgb(204,0,0)">t</span></a></span></b><span style=
=3D"font-size:10pt;font-family:Arial,sans-serif;color:rgb(89,89,89)"><a hre=
f=3D"http://www.twitter.com/vikinology" style=3D"color:rgb(17,85,204)" targ=
et=3D"_blank">=C2=A0</a>|<a href=3D"http://www.facebook.com/pages/Viking-Te=
chnology/106725999413927" style=3D"color:rgb(17,85,204)" target=3D"_blank">=
=C2=A0</a></span><b style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px"><span style=3D"font-family:Calibri,sans-serif"><a href=
=3D"http://www.facebook.com/pages/Viking-Technology/106725999413927" style=
=3D"color:rgb(17,85,204)" target=3D"_blank"><span style=3D"color:rgb(204,0,=
0)">f</span></a></span></b><span style=3D"font-size:10pt;font-family:Arial,=
sans-serif;color:rgb(89,89,89)"><a href=3D"http://www.facebook.com/pages/Vi=
king-Technology/106725999413927" style=3D"color:rgb(17,85,204)" target=3D"_=
blank">=C2=A0</a>|<a href=3D"http://www.linkedin.com/company/86313?trk=3Dty=
ah" style=3D"color:rgb(17,85,204)" target=3D"_blank">=C2=A0</a></span><b st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px"><=
span style=3D"font-family:Calibri,sans-serif"><a href=3D"http://www.linkedi=
n.com/company/86313?trk=3Dtyah" style=3D"color:rgb(17,85,204)" target=3D"_b=
lank"><span style=3D"color:rgb(204,0,0)">l</span></a></span></b><span style=
=3D"font-size:10pt;font-family:Arial,sans-serif;color:rgb(89,89,89)"><a hre=
f=3D"http://www.linkedin.com/company/86313?trk=3Dtyah" style=3D"color:rgb(1=
7,85,204)" target=3D"_blank">=C2=A0</a>|<a href=3D"http://vimeo.com/vikingt=
echnology" style=3D"color:rgb(17,85,204)" target=3D"_blank">=C2=A0</a></spa=
n><span style=3D"color:rgb(34,34,34);font-size:12.8px;font-family:Arial,san=
s-serif"><a href=3D"http://vimeo.com/vikingtechnology" style=3D"color:rgb(1=
7,85,204)" target=3D"_blank"><b><span style=3D"font-family:Calibri,sans-ser=
if;color:rgb(204,0,0)">v</span></b></a></span></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div>

<br>
CONFIDENTIALITY<br>This e-mail message and any attachments thereto, is inte=
nded only for use by the addressee(s) named herein and may contain legally =
privileged and/or confidential information. If you are not the intended rec=
ipient of this e-mail message, you are hereby notified that any disseminati=
on, distribution or copying of this e-mail message, and any attachments the=
reto, is strictly prohibited.  If you have received this e-mail message in =
error, please immediately notify the sender and permanently delete the orig=
inal and any copies of this email and any prints thereof.<br>ABSENT AN EXPR=
ESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL IS NOT INTENDED AS A=
 SUBSTITUTE FOR A WRITING.  Notwithstanding the Uniform Electronic Transact=
ions Act or the applicability of any other law of similar substance and eff=
ect, absent an express statement to the contrary hereinabove, this e-mail m=
essage its contents, and any attachments hereto are not intended to represe=
nt an offer or acceptance to enter into a contract and are not otherwise in=
tended to bind the sender, Sanmina Corporation (or any of its subsidiaries)=
, or any other person or entity.<br>
--00000000000049402305b1b53b30--

--0000000000004f751c05b1b53b23
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQWwYJKoZIhvcNAQcCoIIQTDCCEEgCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg2wMIIE6DCCA9CgAwIBAgIOSBtqCRO9gCTKXSLwFPMwDQYJKoZIhvcNAQELBQAwTDEgMB4GA1UE
CxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMT
Ckdsb2JhbFNpZ24wHhcNMTYwNjE1MDAwMDAwWhcNMjQwNjE1MDAwMDAwWjBdMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
tpZok2X9LAHsYqMNVL+Ly6RDkaKar7GD8rVtb9nw6tzPFnvXGeOEA4X5xh9wjx9sScVpGR5wkTg1
fgJIXTlrGESmaqXIdPRd9YQ+Yx9xRIIIPu3Jp/bpbiZBKYDJSbr/2Xago7sb9nnfSyjTSnucUcIP
ZVChn6hKneVGBI2DT9yyyD3PmCEJmEzA8Y96qT83JmVH2GaPSSbCw0C+Zj1s/zqtKUbwE5zh8uuZ
p4vC019QbaIOb8cGlzgvTqGORwK0gwDYpOO6QQdg5d03WvIHwTunnJdoLrfvqUg2vOlpqJmqR+nH
9lHS+bEstsVJtZieU1Pa+3LzfA/4cT7XA/pnwwIDAQABo4IBtTCCAbEwDgYDVR0PAQH/BAQDAgEG
MGoGA1UdJQRjMGEGCCsGAQUFBwMCBggrBgEFBQcDBAYIKwYBBQUHAwkGCisGAQQBgjcUAgIGCisG
AQQBgjcKAwQGCSsGAQQBgjcVBgYKKwYBBAGCNwoDDAYIKwYBBQUHAwcGCCsGAQUFBwMRMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFGlygmIxZ5VEhXeRgMQENkmdewthMB8GA1UdIwQYMBaA
FI/wS3+oLkUkrk1Q+mOai97i3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDov
L29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL3Jvb3QtcjMuY3JsMGcGA1UdIARgMF4wCwYJKwYBBAGgMgEoMAwGCisG
AQQBoDIBKAowQQYJKwYBBAGgMgFfMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNp
Z24uY29tL3JlcG9zaXRvcnkvMA0GCSqGSIb3DQEBCwUAA4IBAQConc0yzHxn4gtQ16VccKNm4iXv
6rS2UzBuhxI3XDPiwihW45O9RZXzWNgVcUzz5IKJFL7+pcxHvesGVII+5r++9eqI9XnEKCILjHr2
DgvjKq5Jmg6bwifybLYbVUoBthnhaFB0WLwSRRhPrt5eGxMw51UmNICi/hSKBKsHhGFSEaJQALZy
4HL0EWduE6ILYAjX6BSXRDtHFeUPddb46f5Hf5rzITGLsn9BIpoOVrgS878O4JnfUWQi29yBfn75
HajifFvPC+uqn+rcVnvrpLgsLOYG/64kWX/FRH8+mhVe+mcSX3xsUpcxK9q9vLTVtroU/yJUmEC4
OcH5dQsbHBqjMIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G
A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNV
BAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4MTAwMDAwWjBMMSAwHgYDVQQL
ExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMK
R2xvYmFsU2lnbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aE
yiie/QV2EcWtiHL8RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5
uzsTgHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmmKPZpO/bL
yCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zdQQ4gOsC0p6Hpsk+QLjJg
6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZXriX7613t2Saer9fwRPvm2L7DWzgVGkW
qQPabumDk3F2xmmFghcCAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFI/wS3+oLkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+
yAzv95ZURUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMpjjM5
RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK6fBdRoyV3XpYKBov
Hd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQXmcIfeg7jLQitChws/zyrVQ4PkX42
68NXSb7hLi18YIvDQVETI53O9zJrlAGomecsMx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o
2HLO02JQZR7rkpeDMdmztcpHWD9fMIIFXTCCBEWgAwIBAgIMMNEtWkXNXahCTKjtMA0GCSqGSIb3
DQEBCwUAMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMwHhcNMTkwNjI4MDk0
ODI1WhcNMjIwNjI4MDk0ODI1WjCBqjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWEx
ETAPBgNVBAcTCFNhbiBKb3NlMRwwGgYDVQQKExNTYW5taW5hIENvcnBvcmF0aW9uMQ0wCwYDVQQL
EwRJLlQuMR8wHQYDVQQDDBZqYW1lcy5oYXR0QHNhbm1pbmEuY29tMSUwIwYJKoZIhvcNAQkBFhZq
YW1lcy5oYXR0QHNhbm1pbmEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp9FU
NleiVOYvFXPHpY8jR17to37UgxdBSaRkVSMVybC7pm1eG2/c23U3+5txMq9KkXK1ApevWeuAu311
VwY8+AS6fyAcSLc/IiHWHOb/Ibv0kx8VA0Q2uVZuylSeoF4QkXcMNrXwBdclET0WnZHb4KbPqf5p
7rX+5JE8NORvjAcHQq8aOdor0nVPL363kjwjsyvrM4H5ojCoV+nBJkrUiP/HB1BCSI9WLA0eM3e0
Eg2rwtzThWaPyNy9iGIwyf1ydCWumX6PXfjAD+pQEICb2xQWnC+FujMVK7OhoSjt7qkHGydPP38z
EtRMd0xrBR4ESTlyhKo06lbnoNjjK4gFgQIDAQABo4IBzTCCAckwDgYDVR0PAQH/BAQDAgWgMIGe
BggrBgEFBQcBAQSBkTCBjjBNBggrBgEFBQcwAoZBaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNv
bS9jYWNlcnQvZ3NwZXJzb25hbHNpZ24yc2hhMmczb2NzcC5jcnQwPQYIKwYBBQUHMAGGMWh0dHA6
Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9nc3BlcnNvbmFsc2lnbjJzaGEyZzMwTQYDVR0gBEYwRDBC
BgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3Jl
cG9zaXRvcnkvMAkGA1UdEwQCMAAwRAYDVR0fBD0wOzA5oDegNYYzaHR0cDovL2NybC5nbG9iYWxz
aWduLmNvbS9nc3BlcnNvbmFsc2lnbjJzaGEyZzMuY3JsMCEGA1UdEQQaMBiBFmphbWVzLmhhdHRA
c2FubWluYS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUaXKCYjFnlUSFd5GA
xAQ2SZ17C2EwHQYDVR0OBBYEFKbuJMGJGcIdyqM3MXogkZRKHrOqMA0GCSqGSIb3DQEBCwUAA4IB
AQBjTc8Ck85fstKt7oztNmSkBDQUnTue9N11IISOGEqtWL45C77AyYBgBwvRcwkE7FbstGii/fme
VMzTimV99ckZlZbfwxUGK6nupP4cheZGIcwnkUocfDBFye7lo4mbWBmwir4HZpvhpKT42yYYGXYQ
q1zCn6JAjQqSuBxw9LCZ/ie2dG6ZbpoS6c7PKE7CABCZWz72IWmJn6zJ8lACNIyjkGGk5FKsxgYS
sCcoo65fdCf4GuJmmSg5OU5QyO/hkAiMkdfhYyH+5GftcVeiYfRzMUYZiSPWMltdz6iZ8lTojUiC
DaLbPJEgXDPfUocEUQLj1XJv9ln1T/scLnt/O7OqMYICbzCCAmsCAQEwbTBdMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczAgww0S1aRc1dqEJMqO0wDQYJYIZIAWUDBAIBBQCggdQw
LwYJKoZIhvcNAQkEMSIEIBhbEC6+RoJ2vANGUmrw9xPbxdW3RSNRbjKyVLMZbnFLMBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMTAxNTEzMDAyNVowaQYJKoZIhvcN
AQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0D
BzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASC
AQAdjVv9NiQlJhgCAVbdyI3b6PtqNlL6OWy7p2TdFz0NA8yCIBMBIdGYAd7F8Pk3f9CY+ctvKh4P
85ZQAb7AEOz6uKcwaHOIOLy+yfYmMGbdhKCHCW3E9Pj9KswE5cuG+N1zVMI9m64BrsHqY8hhflCl
3/p42NEgZRnH0OP5CXXgY41eYd7rc55//AgpSJY15w31fonhBc95XUGwfJrfG0+zUSlVFoF7NIHj
vBjkSsJPIK8FA+pJ8jKJ39CzSiV4qccu+cJ0clGTYqhwGeDuDl81i7GRdpoYPDySBpLT9ReoEDu0
d9ujaXA7ROPvQQyQ8FztcWxLNjOiJs1T2hAFj/72
--0000000000004f751c05b1b53b23--
