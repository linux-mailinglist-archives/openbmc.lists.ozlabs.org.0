Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6735FE6F
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 01:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLJYw4Jw4z30KF
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 09:28:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=QseRT2k4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=gapps.ntust.edu.tw (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=m10902803@gapps.ntust.edu.tw;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com
 header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QseRT2k4; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKwbF1knqz300C
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 18:28:06 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id w8so9770695pfn.9
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gapps-ntust-edu-tw.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=G8ytCANrY/TryBIkShwSJ+CycoApIFXtWjWcevbAQy8=;
 b=QseRT2k4d4Bv32LfZPbyjU0SxMfiZ/Kp8S17v4q2LhQFfW0GJ9w/rgNMvl2Db4M6Tn
 jugbMgNy6RETiQyHvFVJSDYJmCYij3aA4niiaUoLRZ9QvlCTb1O05jL7Aq0IthqdJNxo
 iuZ0l2/zg7DaWHpvVGAkBYyq4sIniREw6qbdO9eUQLShH+F8R584GSibuxYfJuhSG58J
 uT+fssgo9T6Y5VzQsz4sGYbwPtN5Ydwh6Wa+qQtZyfGMZBboEzsIBDFrATT5r16FC1Qx
 lfM0Ox6+zYiLcJMma6L0K3RJEPBrgA2XXizaxByAOMVk+0YzsbkkA2pmOcJPW5bXdXWK
 EOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=G8ytCANrY/TryBIkShwSJ+CycoApIFXtWjWcevbAQy8=;
 b=gFTlPBpkYPWfmfxjLJ0Dts0C5QDMMRCFhFWYaCJCEbWkCqS0Kh538y9lUs1YiVKgCd
 QO9SF/GJcSZBMlQLdx4rJiz0Fk4cAcRmQiF5MX9xkudPLAmBC+58hccdt5jTerXviQ8/
 dOiZ2S9AL+KxQI4I2R/jn3UOcnmnV/IWbxV00NFvlVP8dD+aMDGEmTV0LoMml0PPT3q4
 sYGsmoFXijselR0whAIqQdSh12sw8QHoqj7ln0btUp8W8i3SrIWGhoJGjCXi7iy6TL0O
 QftUeU9849gyIGl0Fc7hF8cA0BVrtJxntHhJvqgmVe2LVLo1R8SRnuvRdVcnAikfAsyn
 3c7g==
X-Gm-Message-State: AOAM532pJXRr8yFkOxBgtVYCHAycSUC04+7+SdtmlQGd7inQvFvbVXJz
 vAux7hoojSnPuMS5Z7OtUlkFB5GEoSPFMg==
X-Google-Smtp-Source: ABdhPJwjLso7sK0VuVSpyzVHb1ssVWKvD1otY570QLeUvGRVh/SlL2TjK0UWUxbvwaOuf4CXm/0LtA==
X-Received: by 2002:a63:91c4:: with SMTP id l187mr4054321pge.35.1618388882190; 
 Wed, 14 Apr 2021 01:28:02 -0700 (PDT)
Received: from LuthfiMufadelLaptop (220-128-110-82.HINET-IP.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id i10sm5274422pjm.1.2021.04.14.01.28.00
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Apr 2021 01:28:01 -0700 (PDT)
From: <m10902803@gapps.ntust.edu.tw>
To: <openbmc@lists.ozlabs.org>
Subject: OpenBMC Installation
Date: Wed, 14 Apr 2021 16:27:59 +0800
Message-ID: <000a01d73108$15144bb0$3f3ce310$@gapps.ntust.edu.tw>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_000B_01D7314B.23387610"
X-Mailer: Microsoft Outlook 16.0
thread-index: AdcxB2WRD7Wdr/xGSTqJYRZnTjHJag==
Content-Language: en-id
X-Mailman-Approved-At: Thu, 15 Apr 2021 09:28:06 +1000
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

This is a multipart message in MIME format.

------=_NextPart_000_000B_01D7314B.23387610
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I want to ask about the program. Are there still some bugs in it? I tried to
clone the repository and run it in QEMU.

I found that firmware update and network change using GUI always shown error
message.

 

My laptop is running in windows 10. And to run the OpenBMC, I'm using VM
with ubuntu 20.04.

 

Sincerely,

Muhamad Luthfi Mufadel

Department of Electronic and Computer Engineering

National Taiwan University of Science and Technology

 

 


------=_NextPart_000_000B_01D7314B.23387610
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-ID =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-US>Hello,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>I want to ask about the program. =
Are there still some bugs in it? I tried to clone the repository and run =
it in QEMU.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I found that firmware update and network change using GUI =
always shown error message.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>My laptop is running in windows 10. =
And to run the OpenBMC, I&#8217;m using VM with ubuntu =
20.04.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal>Sincerely,<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'mso-fareast-language:EN-ID'>Muhamad Luthfi =
Mufadel<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-ID'>Department of Electronic and =
Computer Engineering<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'mso-fareast-language:EN-ID'>National Taiwan =
University of Science and Technology<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_000_000B_01D7314B.23387610--

