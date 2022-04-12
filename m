Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA04FEBBB
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 02:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdN9C0gPrz3bYb
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 10:03:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sysmate.com (client-ip=58.224.160.96; helo=sysmate.com;
 envelope-from=pooky@sysmate.com; receiver=<UNKNOWN>)
Received: from sysmate.com (mail.sysmate.com [58.224.160.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcynM4YBTz2xCC
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 18:00:04 +1000 (AEST)
From: <pooky@sysmate.com>
To: <openbmc@lists.ozlabs.org>
Subject: [Help] I want to run may application at start up with openBmc.
Date: Tue, 12 Apr 2022 16:59:58 +0900
Organization: SYSMATE
Message-ID: <000301d84e43$4de77760$e9b66620$@sysmate.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0004_01D84E8E.BDCF9490"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdhOQziKSKkA1fVKR/KQXyTGbOGMqw==
Content-Language: ko
X-Mailman-Approved-At: Wed, 13 Apr 2022 10:03:31 +1000
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

------=_NextPart_000_0004_01D84E8E.BDCF9490
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

 

I create my application comply with
"https://stackoverflow.com/questions/63723563/run-application-at-start-up-wi
th-yocto-dunfell"

 

During boot, I see the warning message. And my application did not run.

[   12.963889] systemd-sysv-generator[103]: SysV service
'/etc/init.d/start-sysmate' lacks a native systemd unit file. Automatically
generating a unit file for compatibility. Please update package to include a
native systemd unit file, in order to make it more safe and robust.


How can I run may application at start up with openBmc ?

 

Best regards, 

Houn-Joung


------=_NextPart_000_0004_01D84E8E.BDCF9490
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
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"Malgun Gothic";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
&nbsp;Asrock</span>&#8217;<span lang=3DEN-US>s e3c246d4i =
target.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I create my application comply with &#8220;<a =
href=3D"https://stackoverflow.com/questions/63723563/run-application-at-s=
tart-up-with-yocto-dunfell">https://stackoverflow.com/questions/63723563/=
run-application-at-start-up-with-yocto-dunfell</a>&#8221;<o:p></o:p></spa=
n></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>During boot, I see the warning message. And my application =
did not run.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'color:red'>[&nbsp;&nbsp; 12.963889] =
systemd-sysv-generator[103]: SysV service '/etc/init.d/start-sysmate' =
lacks a native systemd unit file. Automatically generating a unit file =
for compatibility. Please update package to include a native systemd =
unit file, in order to make it more safe and =
robust.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><br>How can I run may application at start up with openBmc =
?<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Best regards, <o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>Houn-Joung<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0004_01D84E8E.BDCF9490--

