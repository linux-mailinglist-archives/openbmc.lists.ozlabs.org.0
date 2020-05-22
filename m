Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E31DE4F3
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 12:59:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T3RC3cw0zDqxc
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 20:59:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=andy_yf_wang@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 49T3QF3Wp2zDqvT
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 20:58:57 +1000 (AEST)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by 
 TWNHUMSW2.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdf4a29579fc0a81670195c@TWNHUMSW2.wistron.com>; Fri, 22 May 2020 
 18:58:50 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Fri, 22 May 2020 18:58:47 +0800
Received: from EXCHAPP01.whq.wistron ([fe80::bd29:5a96:46fd:7d55]) by 
 EXCHAPP01.whq.wistron ([fe80::bd29:5a96:46fd:7d55%10]) with mapi id 
 15.01.1913.007; Fri, 22 May 2020 18:58:47 +0800
From: <Andy_YF_Wang@wistron.com>
To: <openbmc@lists.ozlabs.org>
Subject: Implement a tool of flashing EEPROM to update the VPD data
Thread-Topic: Implement a tool of flashing EEPROM to update the VPD data
Thread-Index: AdYwI7wu+V2UgGzTQASxIDHO1K+NkA==
Date: Fri, 22 May 2020 10:58:47 +0000
Message-ID: <51a2ff58a34b423d94520f6703ecdaee@wistron.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.230]
x-tm-snts-smtp: 4A086E6F94F41890C3E147B5C1F7735087E2CEB69B5B38C182778C71C6A4C3152000:8
Content-Type: multipart/alternative; 
 boundary="_000_51a2ff58a34b423d94520f6703ecdaeewistroncom_"
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
Cc: andrewg@us.ibm.com, santosh.puranik.ibm@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_51a2ff58a34b423d94520f6703ecdaeewistroncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Santosh,

> Which VPD format are you interested in updating?
I'm interested in OpenPower VPD format update.

> Assuming you are using the OpenPower VPD format, there is a tool being im=
plemented in the series of patches here:
https://gerrit.openbmc-project.xyz/c/openbmc/openpower-vpd-parser/ /30239

Ok, that's great!
I'll study this repository.
My initial idea is using this tool (API) to update the MAC, BMC's PartNumbe=
r, BMC's SerialNumber and BMC's PrettyName of the VPD data on EEPROM.
Then update the VPD data by filling in the Json file.
The API reads the data in Json and writes to the EEPROM to update the VPD.
The above is my initial idea, I would like to ask you whether this is feasi=
ble?
Or do you have any concern for this idea?
Thanks


Andy YF Wang+

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

--_000_51a2ff58a34b423d94520f6703ecdaeewistroncom_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	margin-bottom:.0001pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	mso-para-margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Santosh,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Which VPD format are you i=
nterested in updating?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;m interested in OpenPow=
er VPD format update.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Assuming you are using the=
 OpenPower VPD format, there is a tool being implemented in the series of p=
atches here:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">https://gerrit.openbmc-project.=
xyz/c/openbmc/openpower-vpd-parser/ /30239<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ok, that's great!<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I'll study this repository.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My initial idea is using this t=
ool (API) to update the MAC, BMC's PartNumber, BMC's SerialNumber and BMC's=
 PrettyName of the VPD data on EEPROM.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Then update the VPD data by fil=
ling in the Json file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The API reads the data in Json =
and writes to the EEPROM to update the VPD.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The above is my initial idea, I=
 would like to ask you whether this is feasible?<br>
Or do you have any concern for this idea?<br>
Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Andy YF Wang&#43;<o:p></o:p></s=
pan></p>
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

--_000_51a2ff58a34b423d94520f6703ecdaeewistroncom_--
