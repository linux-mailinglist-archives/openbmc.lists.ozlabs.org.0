Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331D1CF130
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 11:10:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LsV061yrzDqpR
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 19:10:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 49LsT60c5FzDql6
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 19:09:57 +1000 (AEST)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdf1645fb09c0a816721a1c@TWNHUMSW4.wistron.com>; Tue, 12 May 2020 
 17:09:52 +0800
Received: from EXCHAPP02.whq.wistron (10.37.38.25) by EXCHAPP02.whq.wistron 
 (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Tue, 12 May 2020 17:09:50 +0800
Received: from EXCHAPP02.whq.wistron ([fe80::cddc:5806:56d5:6e30]) by 
 EXCHAPP02.whq.wistron ([fe80::cddc:5806:56d5:6e30%7]) with mapi id 
 15.01.1913.007; Tue, 12 May 2020 17:09:50 +0800
From: <Ben_Pai@wistron.com>
To: <patrick@stwcx.xyz>
Subject: phosphor-bittware repository
Thread-Topic: phosphor-bittware repository
Thread-Index: AdYoOA7H2kBN2vABR5GWCd2jybLNAw==
Date: Tue, 12 May 2020 09:09:50 +0000
Message-ID: <822cfe8a5ec94973903534f7932d9049@wistron.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.230]
x-tm-snts-smtp: 6931A8F414C5C9592067C66BB06AF0856FFA29CFD46642D0B18911104917317B2000:8
Content-Type: multipart/alternative; 
 boundary="_000_822cfe8a5ec94973903534f7932d9049wistroncom_"
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

--_000_822cfe8a5ec94973903534f7932d9049wistroncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Patrick


On Thu, May 07, 2020 at 06:07:44AM +0000, Ben_Pai at wistron.com<https://li=
sts.ozlabs.org/listinfo/openbmc> wrote:

> Could you please help to create a new repository for phosphor-bittware?



Out of curiousity for others who aren't aware of what 'bittware' is,

could you describe a little about this repository?  It seems to be a

hardware vendor, so it would be interesting to know what the BMC will be

doing with it.



Examples:

  * What is the overall purpose of the code in this repository?

  * Is there an existing architecture that this code will be following

    or is there some new design that you are persuing (and needs to be

    document)?

  * Are there existing phosphor-dbus-interfaces that you will be

    implementing?  Are there new dbus interfaces you are proposing to

    implement the functionality you want from this repository?



--


I want to implement related functions for the bittware 250-SoC card.
For example: Sensor reading, VPD information, led control and Brick Protect=
ion mechanism.

We don't need to modify phosphor-dbus-interfaces.

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

--_000_822cfe8a5ec94973903534f7932d9049wistroncom_
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
	{font-family:Dotum;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
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
	{font-family:"\@Dotum";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTML
	{mso-style-name:"HTML \9810\8A2D\683C\5F0F \5B57\5143";
	mso-style-priority:99;
	mso-style-link:"HTML \9810\8A2D\683C\5F0F";
	font-family:MingLiU;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello Patrick<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US" style=3D"color:black">On Thu, May 07, 2020 at 06:=
07:44AM &#43;0000, <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">Be=
n_Pai at wistron.com</a> wrote:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&gt;<i> Could you please he=
lp to create a new repository for phosphor-bittware?<o:p></o:p></i></span><=
/pre>
<pre><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbsp;</o:p></span></p=
re>
<pre><span lang=3D"EN-US" style=3D"color:black">Out of curiousity for other=
s who aren't aware of what 'bittware' is,<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">could you describe a little=
 about this repository?&nbsp; It seems to be a<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">hardware vendor, so it woul=
d be interesting to know what the BMC will be<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">doing with it.<o:p></o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbsp;</o:p></span></p=
re>
<pre><span lang=3D"EN-US" style=3D"color:black">Examples:<o:p></o:p></span>=
</pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp; * What is the overal=
l purpose of the code in this repository?<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp; * Is there an existi=
ng architecture that this code will be following<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp;&nbsp;&nbsp; or is th=
ere some new design that you are persuing (and needs to be<o:p></o:p></span=
></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp;&nbsp;&nbsp; document=
)?<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp; * Are there existing=
 phosphor-dbus-interfaces that you will be<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp;&nbsp;&nbsp; implemen=
ting?&nbsp; Are there new dbus interfaces you are proposing to<o:p></o:p></=
span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black">&nbsp;&nbsp;&nbsp; implemen=
t the functionality you want from this repository?<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbsp;</o:p></span></p=
re>
<pre><span lang=3D"EN-US" style=3D"color:black">-- <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbsp;</o:p></span></p=
re>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I want to implement related fun=
ctions for the bittware 250-SoC card.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For example: Sensor reading, VP=
D information, led control and Brick Protection mechanism.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We don&#8217;t need to modify p=
hosphor-dbus-interfaces.<o:p></o:p></span></p>
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

--_000_822cfe8a5ec94973903534f7932d9049wistroncom_--
