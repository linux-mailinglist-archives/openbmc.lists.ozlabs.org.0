Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64E23D583
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 04:36:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMXfh2DFHzDqM1
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 12:35:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zhaoxin.com (client-ip=203.148.12.81; helo=zxshcas1.zhaoxin.com;
 envelope-from=tigerliu@zhaoxin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zhaoxin.com
X-Greylist: delayed 918 seconds by postgrey-1.36 at bilbo;
 Thu, 06 Aug 2020 12:35:06 AEST
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMXdk3F4ZzDq72
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 12:35:02 +1000 (AEST)
Received: from zxbjmbx2.zhaoxin.com (10.29.252.164) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 10:19:36 +0800
Received: from zxbjmbx2.zhaoxin.com (10.29.252.164) by zxbjmbx2.zhaoxin.com
 (10.29.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 10:19:35 +0800
Received: from zxbjmbx2.zhaoxin.com ([fe80::4d77:9dba:64a8:8ec3]) by
 zxbjmbx2.zhaoxin.com ([fe80::4d77:9dba:64a8:8ec3%4]) with mapi id
 15.01.1979.003; Thu, 6 Aug 2020 10:19:35 +0800
From: "Tiger Liu(BJ-RD)" <TigerLiu@zhaoxin.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [OpenBMC] ADD SEL Command , support or not
Thread-Topic: [OpenBMC] ADD SEL Command , support or not
Thread-Index: AdZrl45x8sHpPvIIS4qSPaAQF0nYxw==
Date: Thu, 6 Aug 2020 02:19:35 +0000
Message-ID: <07e7b91809d3425aa5b3b41e5a63d834@zhaoxin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.29.28.153]
Content-Type: multipart/alternative;
 boundary="_000_07e7b91809d3425aa5b3b41e5a63d834zhaoxincom_"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_07e7b91809d3425aa5b3b41e5a63d834zhaoxincom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Experts:
I have a question about "ADD SEL" command.

I am trying OpenBMC Code with a motherboard(with AST2500 chip).

I tried to send an ADD SEL command to BMC FW, but failed.
The response data's record ID is all FF, it seemed not a normal record ID.

So, my question is:
Current OpenBMC Firmware supports "ADD SEL" command?

Thanks


?????
?????????????????????????????????????????????????????
CONFIDENTIAL NOTE:
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. Any unauthorized review, use, co=
pying or forwarding of this email or the content of this email is strictly =
prohibited.

--_000_07e7b91809d3425aa5b3b41e5a63d834zhaoxincom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:\7B49\7EBF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:\7B49\7EBF;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi, Experts:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a question about &#8220;=
ADD SEL&#8221; command.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am trying OpenBMC Code with a=
 motherboard(with AST2500 chip).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I tried to send an ADD SEL comm=
and to BMC FW, but failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The response data&#8217;s recor=
d ID is all FF, it seemed not a normal record ID.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">So, my question is:<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Current OpenBMC Firmware suppor=
ts &#8220;ADD SEL&#8221; command?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
</div>
<p></p>
<br>
<br>
<div style=3D"font-size:10pt; line-height:10pt; font-family: '&#23435;&#203=
07;';color:#595959;">&#20445;&#23494;&#22768;&#26126;&#65306;</div>
<div style=3D"font-size:10pt; line-height:10pt; font-family: '&#23435;&#203=
07;';color:#595959;">&#26412;&#37038;&#20214;&#21547;&#26377;&#20445;&#2349=
4;&#25110;&#19987;&#26377;&#20449;&#24687;&#65292;&#20165;&#20379;&#25351;&=
#23450;&#25910;&#20214;&#20154;&#20351;&#29992;&#12290;&#20005;&#31105;&#23=
545;&#26412;&#37038;&#20214;&#25110;&#20854;&#20869;&#23481;&#20570;&#20219=
;&#20309;&#26410;&#32463;&#25480;&#26435;&#30340;&#26597;&#38405;&#12289;&#=
20351;&#29992;&#12289;&#22797;&#21046;&#25110;&#36716;&#21457;&#12290;</div=
>
<div style=3D"font-size:10pt; line-height:10pt; font-family: 'Times New Rom=
an';color:#595959;">
<i>CONFIDENTIAL NOTE: </i></div>
<div style=3D"font-size:10pt; line-height:10pt; font-family: 'Times New Rom=
an';color:#595959;">
<i>This email contains confidential or legally privileged information and i=
s for the sole use of its intended recipient. Any unauthorized review, use,=
 copying or forwarding of this email or the content of this email is strict=
ly prohibited.</i></div>
</body>
</html>

--_000_07e7b91809d3425aa5b3b41e5a63d834zhaoxincom_--
