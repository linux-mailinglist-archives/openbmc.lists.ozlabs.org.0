Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D75A44DBFF5
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 08:06:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJyqh5q5Mz30Qg
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 18:06:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sysmate.com (client-ip=58.224.160.96; helo=sysmate.com;
 envelope-from=pooky@sysmate.com; receiver=<UNKNOWN>)
Received: from sysmate.com (mail.sysmate.com [58.224.160.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJNGl0Jt3z2xMQ
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 19:09:34 +1100 (AEDT)
From: <pooky@sysmate.com>
To: <openbmc@lists.ozlabs.org>
Subject: [Help] I want to know how to import u-boot v2016.07 version locally
Date: Wed, 16 Mar 2022 17:09:27 +0900
Organization: SYSMATE
Message-ID: <000601d8390d$28330520$78990f60$@sysmate.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0007_01D83958.981AFB40"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adg5DSdMwb2AQ1ePTIGS6/qS7gm5Tw==
Content-Language: ko
X-Mailman-Approved-At: Thu, 17 Mar 2022 18:06:08 +1100
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
Reply-To: pooky@sysmate.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0007_01D83958.981AFB40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

To whom it may concern,

 

My name is Hounjoung, Software engineer for Sysmate in South Korea.

I found your email address on website.

 

I am a complete beginner to openbmc.

I am developing a motherboard using AST2500 chip using openbmc. 

 

I am setting up the development environment based on  Asrock's e3c246d4i
target.

I need to modify the u-boot source code, so I tried to import the u-boot
source code to local with devtool.

 

$ devtool modify u-boot myLocalU-Boot/


An error occurred while importing locally.

Asrock uses u-boot v2016.07  version, but the version does not match, so the
error seems to occur.

Is there a way to download and use u-boot v2016.07 version locally?

 

Best regards, 

Houn-Joung


------=_NextPart_000_0007_01D83958.981AFB40
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
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:GulimChe;
	panose-1:2 11 6 9 0 1 1 1 1 1;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:GulimChe;
	panose-1:2 11 6 9 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"Malgun Gothic";}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Malgun Gothic";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DKO =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>To whom it =
may concern,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>My name is Hounjoung, Software engineer for Sysmate in =
South Korea.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I found your email address on =
website.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I am a complete beginner to =
openbmc.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>I =
am developing a motherboard using AST2500 chip using openbmc. =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I am setting up the development environment based on =
&nbsp;Asrock&#8217;s e3c246d4i target.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>I need to modify the u-boot source =
code, so I tried to import the u-boot source code to local with =
devtool.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><i><span =
lang=3DEN-US>$ devtool modify u-boot =
myLocalU-Boot/<o:p></o:p></span></i></p><p class=3DMsoNormal><span =
lang=3DEN-US><br>An error occurred while importing =
locally.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Asrock uses u-boot v2016.07 &nbsp;version, but the version =
does not match, so the error seems to occur.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Is there a way to download and use =
u-boot v2016.07 version locally?<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Best regards, =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Houn-Joung<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0007_01D83958.981AFB40--

