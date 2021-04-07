Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AAA3569C5
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 12:37:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFgnp5Cg9z30GV
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 20:37:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=of56hp61;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=gapps.ntust.edu.tw (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=m10902803@gapps.ntust.edu.tw;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com
 header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=of56hp61; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFVnH0jp5z2yYj
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 13:51:31 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id bg21so6009709pjb.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 20:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gapps-ntust-edu-tw.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=aiwDQgEz7HPWpl+v0g89lSQWh3AOVDXfVCCPQQGqNwA=;
 b=of56hp61MrtOvMRZo57Juqdft6K8orv+bMGuMHCWR4DEb8oRu3wmA5a3JbhFNTVvwA
 Yn8wnleg05Msl/sFPhiKmmrsFtxeyb5YnSe5lwFVJypVJnLi31uG+XpGhCy0AQtSYAvD
 PAWQ7gFOmGPss7IVXkPTEb0AOWowHyx405SoqMigxb1Vkh8izx9X4cX6dAqbQX1/sYys
 oXXgQQuU1gQ76FOd8utbT9NLr5pdayl7RcN0LgGM/7hit8bsqDBwSwvhxfIexXDX1ib5
 QjQykphz0m5yYA7QTX9rfbgigudE+g58KFQlfcE/jSLK95uwtCa/ahriklupIEHheESu
 0Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=aiwDQgEz7HPWpl+v0g89lSQWh3AOVDXfVCCPQQGqNwA=;
 b=MoivC9Ymd6EICtj+qL3A5HMmnwzvAxmRSXbSA0rb/yQK/XUOFLMTyhhdQoU1K/kuMr
 gngTHwVsAJgs1yXhK0DyqyuOoD7PaqZgf6Fv2eQEigPxzz48jLyh+3VHvPJ3XVuLnMZS
 Fqv+WAvwSyzbCuNeFfUOnN5alF5TLfpA7ht1pAbGOLb6WWFE3VE6EneyWxrY7W71B4ek
 v3bs5+qtb8dLQ69GgXVBGc1iVtSsJHBrvnGvXrz6IUOY97/UxdEAIwXoj0bYxoR1Dkc7
 CFwchGtRcNsefqP/MKFK6vU2H4g175DsKAtEHkJMjcEjw8wKK3DvmDQk9p1GqjAmxBaO
 txvQ==
X-Gm-Message-State: AOAM533Kd+ke+K4Fe1hYlXAW7Zbwuizh9xQYeKhoKPolb3bz8TqjAC6e
 ryz3rfSC58pHOzcsico2MNF01DTeu7lEZg==
X-Google-Smtp-Source: ABdhPJz45yREefvSSH7eEG+NK6lg1RKj0pJy2jQVnTKj5fOh4psbuEy3/MkG8rFEcUa2OGtKJtIH2A==
X-Received: by 2002:a17:90a:8b07:: with SMTP id
 y7mr1309889pjn.78.1617767487561; 
 Tue, 06 Apr 2021 20:51:27 -0700 (PDT)
Received: from LuthfiMufadelLaptop (220-128-110-82.HINET-IP.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id b84sm20500033pfb.162.2021.04.06.20.51.26
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Apr 2021 20:51:27 -0700 (PDT)
From: <m10902803@gapps.ntust.edu.tw>
To: <openbmc@lists.ozlabs.org>
Subject: Error in SDK Installation
Date: Wed, 7 Apr 2021 11:51:21 +0800
Message-ID: <001e01d72b61$482ab720$d8802560$@gapps.ntust.edu.tw>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_001F_01D72BA4.564E9360"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcrYKgC6mKYPYvXSOiYN/E7/0CU8A==
Content-Language: en-id
X-Mailman-Approved-At: Wed, 07 Apr 2021 20:37:22 +1000
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

------=_NextPart_000_001F_01D72BA4.564E9360
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I followed the steps from
https://github.com/openbmc/docs/blob/master/development/dev-environment.md .
And in SDK part, there is an error when I tried to wget the file andit said:

get: write error: No space left on device

wget: write error: Connection reset by peer

 

I use VM to run the Ubuntu. My disk space still has a lot of empty space,
but when I ran it in Romulus machine, it said that no space left.

 

Sincerely,

Muhamad Luthfi Mufadel

Master's Student of Department of Electronic and Computer Engineering 

National Taiwan University of Science and Technology

 


------=_NextPart_000_001F_01D72BA4.564E9360
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
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
class=3DMsoPlainText>Hello,<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>I =
followed the steps from <a =
href=3D"https://github.com/openbmc/docs/blob/master/development/dev-">htt=
ps://github.com/openbmc/docs/blob/master/development/dev-</a>environment.=
md&nbsp;. And in SDK part, there is an error when I tried to wget the =
file andit said:<o:p></o:p></p><p class=3DMsoPlainText>get: write error: =
No space left on device<o:p></o:p></p><p class=3DMsoPlainText>wget: =
write error: Connection reset by peer<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>I use =
VM to run the Ubuntu. My disk space still has a lot of empty space, but =
when I ran it in Romulus machine, it said that no space =
left.<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Sincerely,<o:p></o:p></p><p =
class=3DMsoPlainText>Muhamad Luthfi Mufadel<o:p></o:p></p><p =
class=3DMsoPlainText>Master's Student of Department of Electronic and =
Computer Engineering <o:p></o:p></p><p class=3DMsoPlainText>National =
Taiwan University of Science and Technology<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_001F_01D72BA4.564E9360--

