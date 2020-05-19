Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 868851D9127
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 09:35:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R72D0Kx8zDqLv
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 17:35:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 49R5zz0tPjzDqQq
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 16:47:55 +1000 (AEST)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by 
 TWNHUMSW5.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdf39d078cec0a816731248@TWNHUMSW5.wistron.com>; Tue, 19 May 2020 
 14:47:50 +0800
Received: from EXCHAPP02.whq.wistron (10.37.38.25) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Tue, 19 May 2020 14:47:48 +0800
Received: from EXCHAPP02.whq.wistron ([fe80::cddc:5806:56d5:6e30]) by 
 EXCHAPP02.whq.wistron ([fe80::cddc:5806:56d5:6e30%7]) with mapi id 
 15.01.1913.007; Tue, 19 May 2020 14:47:48 +0800
From: <Ben_Pai@wistron.com>
To: <patrick@stwcx.xyz>
Subject: phosphor-bittware repository
Thread-Topic: phosphor-bittware repository
Thread-Index: AdYoOA7H2kBN2vABR5GWCd2jybLNAwEr6Iyw
Date: Tue, 19 May 2020 06:47:48 +0000
Message-ID: <5c119dd93cff41c993e0a16a3717f5a4@wistron.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.230]
x-tm-snts-smtp: 1D86CC67351C1B05CA407F4751D82519AA57FB18A7DC61F463E754BB3807B6242000:8
Content-Type: multipart/alternative; 
 boundary="_000_5c119dd93cff41c993e0a16a3717f5a4wistroncom_"
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
 Claire_Ku@wistron.com, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_5c119dd93cff41c993e0a16a3717f5a4wistroncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick



> I looked briefly at the datasheet for this hardware [1].  It appears to

> expose an SMBus interface for the features you mentioned.  The most

> straight-forward way to get this implemented is to create a kernel

> driver for most of the features you mentioned.  If you implement a

> driver for this hardware that interacts with the hwmon, eeprom, and LED/G=
PIO

> subsystems in the kernel(*), you'll be able to reuse a lot of existing

> OpenBMC functionality without rewriting any userspace code.

>

> - Sensor

>     - Kernel: hwmon

>     - Userspace: phosphor-hwmon or dbus-sensors

> - VPD

>     - Kernel: eeprom

>     - Userspace: entity-manager (I think)

> - LED control

>     - Kernel: LED / GPIO

>     - Userspace: phosphor-led-manager

>

> The only part that wouldn't be covered would be the "Brick Protection".

> We'd need to see some more information on how this is exposed but you

> might be able to work it into the existing phosphor-bmc-code-mgmt

> repository.  For power supplies, they did create a separate repository

> (phosphor-psu-code-mgmt) but I think they relied on some kernel APIs for

> doing part of the work.

>

> (*) Depending on how the bittware hardware is implemented at an SMBus

>     level you may end up with multiple smaller drivers (this is better).

>     If there is a single SMBus address for all these functions, you'll

>     likely end up with one big driver.

>

> 1. https://www.bittware.com/wp-content/uploads/datasheets/ds-250-soc.pdf


Sorry for late reply.



Because the 250-soc card needs to adjust the io expander to get the relevan=
t information (e.g. temperature, VPD ...).

I think a dynamic detection function may be needed to handle the presence o=
f the card and dynamically adjust the io expander.

On the other hand, I just want to be able to integrate all the functions.

Best Regards,
Ben



---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

--_000_5c119dd93cff41c993e0a16a3717f5a4wistroncom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:MingLiU;
	panose-1:2 2 5 9 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:MingLiU;
	panose-1:2 1 6 9 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML \9810\8A2D\683C\5F0F \5B57\5143";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:MingLiU;}
span.HTML
	{mso-style-name:"HTML \9810\8A2D\683C\5F0F \5B57\5143";
	mso-style-priority:99;
	mso-style-link:"HTML \9810\8A2D\683C\5F0F";
	font-family:MingLiU;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle22
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<pre><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if;color:black">Hi </span><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif;color:black">Patrick<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbsp;</o:p></span></p=
re>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; I looked briefly at=
 the datasheet for this hardware [1].&nbsp; It appears to<o:p></o:p></span>=
</i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; expose an SMBus int=
erface for the features you mentioned.&nbsp; The most<o:p></o:p></span></i>=
</pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; straight-forward wa=
y to get this implemented is to create a kernel<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; driver for most of =
the features you mentioned.&nbsp; If you implement a<o:p></o:p></span></i><=
/pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; driver for this har=
dware that interacts with the hwmon, eeprom, and LED/GPIO<o:p></o:p></span>=
</i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; subsystems in the k=
ernel(*), you'll be able to reuse a lot of existing<o:p></o:p></span></i></=
pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; OpenBMC functionali=
ty without rewriting any userspace code.<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></s=
pan></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; - Sensor<o:p></o:p>=
</span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; - Kernel: hwmon<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; - Userspace: phosphor-hwmon or dbus-sensors<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; - VPD<o:p></o:p></s=
pan></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; - Kernel: eeprom<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; - Userspace: entity-manager (I think)<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; - LED control<o:p><=
/o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; - Kernel: LED / GPIO<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; - Userspace: phosphor-led-manager<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></s=
pan></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; The only part that =
wouldn't be covered would be the &quot;Brick Protection&quot;.<o:p></o:p></=
span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; We'd need to see so=
me more information on how this is exposed but you<o:p></o:p></span></i></p=
re>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; might be able to wo=
rk it into the existing phosphor-bmc-code-mgmt<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; repository.&nbsp; F=
or power supplies, they did create a separate repository<o:p></o:p></span><=
/i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; (phosphor-psu-code-=
mgmt) but I think they relied on some kernel APIs for<o:p></o:p></span></i>=
</pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; doing part of the w=
ork.<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></s=
pan></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; (*) Depending on ho=
w the bittware hardware is implemented at an SMBus<o:p></o:p></span></i></p=
re>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; level you may end up with multiple smaller drivers (this is better).<o=
:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; If there is a single SMBus address for all these functions, you'll<o:p=
></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; likely end up with one big driver.<o:p></o:p></span></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt;<o:p>&nbsp;</o:p></s=
pan></i></pre>
<pre><i><span lang=3D"EN-US" style=3D"color:black">&gt; 1. </span></i><span=
 lang=3D"EN-US"><a href=3D"https://www.bittware.com/wp-content/uploads/data=
sheets/ds-250-soc.pdf"><i>https://www.bittware.com/wp-content/uploads/datas=
heets/ds-250-soc.pdf</i></a><i><span style=3D"color:black"><o:p></o:p></spa=
n></i></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if;color:black">Sorry for late reply.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if;color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if;color:black">Because the 250-soc card needs to adjust the io expander to=
 get the relevant information (e.g. temperature, VPD ...).<o:p></o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if;color:black">I think a dynamic detection function may be needed to handl=
e the presence of the card and dynamically adjust the io expander.<o:p></o:=
p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-ser=
if;color:black">On the other hand, I just want to be able to integrate all =
the functions.<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ben<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>

<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p></body>
</html>

--_000_5c119dd93cff41c993e0a16a3717f5a4wistroncom_--
