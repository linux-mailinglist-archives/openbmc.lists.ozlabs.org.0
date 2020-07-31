Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF0234B45
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 20:39:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJGKc12CHzDqcl
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 04:39:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=conniey@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 903 seconds by postgrey-1.36 at bilbo;
 Sat, 01 Aug 2020 04:37:06 AEST
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJGGV75CWzDqgj
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 04:37:06 +1000 (AEST)
X-AuditID: ac1060b2-ed1ff70000003d78-e7-5f246144f53c
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 62.F7.15736.441642F5; Fri, 31 Jul 2020 14:21:57 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0468.000; Fri, 31 Jul 2020 14:21:56 -0400
From: Connie Yin <ConnieY@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Query regarding the host LPC address in phosphor-ipmi-flash
Thread-Topic: Query regarding the host LPC address in phosphor-ipmi-flash
Thread-Index: AdZnZ3h/CNq2Rn5VTSCbzdKI9r8vTg==
Date: Fri, 31 Jul 2020 18:21:55 +0000
Message-ID: <E27B8EFBB1796B4A8CF2A20BF59146F901AB3E@atlms1.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.97.166]
Content-Type: multipart/alternative;
 boundary="_000_E27B8EFBB1796B4A8CF2A20BF59146F901AB3Eatlms1usmegatrend_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42JZI5AwQ9c1USXeoHExk8WplhcsFnsPbGRx
 YPJYsKnU4/yMhYwBTFENjDaJeXn5JYklqQopqcXJtkoBRZllicmVSgqZKbZKhkoKBTmJyam5
 qXkltkqJBQWpeSlKdlwKGMAGqCwzTyE1Lzk/JTMv3VbJM9hf18LC1FLXUMkuJCNVITMvLb8o
 N7EkMz9PITk/rwSoOjUFKKqQ0M2Z0flrNmtBr3TFl+42xgbGteJdjBwcEgImEsvecXQxcnEI
 CexikrhwpYsVwjnMKLFtyXq2LkZODjYBJYmvtz4ygdgiApYSSx60g8WZBXQlXl99D2YLC7hI
 LDj0nhGixlOidfkedghbD6hmPTOIzSKgKrH/8T1WEJtXwFdi1c8WsBpGATGJ76fWMEHMFJe4
 9WQ+mC0hICCxZM95ZghbVOLl43+sELaixKo9V5lAHmAWyJfY8K8IYqSgxMmZT1gmMArNQjJp
 FkLVLCRVECU6Egt2f2KDsLUlli18zQxjnznwmAlZfAEj+ypGocSSnNzEzJz0ckO9xNxMveT8
 3E2MkFSwaQdjy0XzQ4xMHIyHGCU4mJVEeP/+U44X4k1JrKxKLcqPLyrNSS0+xOgEDIaJzFLc
 oOgBxne8sYGBlCiMY2hiZmJuZG5oaWJubKwkzjt57Zo4IYF0YLrJTk0tSC2CGcLEwSnVwKjw
 NH6i37QEA0WJz+fnfy9SZ+FOvfNS4uCUDVEJj5dYpX71uLOgk2Oq+JqdO10U1jbZObc9bq/N
 +iykkOmnZWW1kDGy5ebTzk9PK05OXFJ6dpbyJol3Vy3+3Z989OeWTdZl7vuuTjybIWjzJaf0
 34HL5g8+nlNj0p7t81867JUUa3Dwg+S5N7mUWIozEg21mIuKEwGawSmPGgMAAA==
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
Cc: "venture@google.com" <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_E27B8EFBB1796B4A8CF2A20BF59146F901AB3Eatlms1usmegatrend_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Team,

I am checking this OpemBMC firmware update interface on an x86 system, and w=
ondering how to construct this host LPC address at which the chunk is to be=
 mapped.
I saw once when test on some platform,  0xfedc1000 was used as host LPC addr=
ess.

Would anyone please elaborate a little bit more?  To get this host LPC addre=
ss,  should I add/modify some drivers in BMC? What about host side?


Thanks a lot.
Connie

Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends (AMI).  This communication is intended to be read o=
nly by the individual or entity to whom it is addressed or by their designee=
. If the reader of this message is not the intended recipient, you are on no=
tice that any distribution of this message, in any form, is strictly prohibi=
ted.  Please promptly notify the sender by reply e-mail or by telephone at 7=
70-246-8600, and then delete or destroy all copies of the transmission.

--_000_E27B8EFBB1796B4A8CF2A20BF59146F901AB3Eatlms1usmegatrend_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micro=
soft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" xm=
lns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://w=
ww.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal">Hi, Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am checking this OpemBMC firmware update interface=
 on an x86 system, and wondering how to construct this host LPC address at w=
hich the chunk is to be mapped.<o:p></o:p></p>
<p class=3D"MsoNormal">I saw once when test on some platform, &nbsp;0xfedc10=
00 was used as host LPC address.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Would anyone please elaborate a little bit more? &nbs=
p;To get this host LPC address, &nbsp;should I add/modify some drivers in BM=
C? What about host side?&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks a lot.<o:p></o:p></p>
<p class=3D"MsoNormal">Connie<o:p></o:p></p>
</div>
<!-- --><font color=3D"#009900" face=3D"Webdings" size=3D"4">P</font><font
  color=3D"#009900" face=3D"verdana,arial,helvetica" size=3D"2"> <strong>Ple=
ase
consider the environment before printing this email</strong></font>
<!-- --><p>The information contained in this message may be confidential and=
 proprietary to American Megatrends (AMI).  This communication is intended t=
o be read only by the individual or entity to whom it is addressed or by the=
ir designee. If the reader of this message is not the intended recipient, yo=
u are on notice that any distribution of this message, in any form, is stric=
tly prohibited.  Please promptly notify the sender by reply e-mail or by tel=
ephone at 770-246-8600, and then delete or destroy all copies of the transmi=
ssion.</p>
</body>
</html>

--_000_E27B8EFBB1796B4A8CF2A20BF59146F901AB3Eatlms1usmegatrend_--
