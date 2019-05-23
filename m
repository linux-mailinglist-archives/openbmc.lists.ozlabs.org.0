Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09FF27943
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 11:31:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458kmC65TxzDqQH
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 19:31:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.208; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458klh367szDqZl
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 19:31:27 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-c.us-west-2.aws.symcld.net id 03/0A-06167-C6866EC5;
 Thu, 23 May 2019 09:31:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRWlGSWpSXmKPExsWS8eIhj252xrM
 Yg9l3dSxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8bb5/PZC45KV2xorW9g3CnZxcjFISSwjEni
 7bRjjBDONEaJ18uesnYxcnKwCWhJLPy/hwnEFhGwlFjyoJ0NpIhZYCOjxPMTcxlBEsIC5hILv
 qxlgSiykXjXfIYNwtaTuNewGqiGg4NFQFXi2Wo/kDCvgI/EguN9YK2MAmIS30+tAZvPLCAuMX
 faLLC9EgICEkv2nGeGsEUlXj7+xwoyRkJAXmLLLEGI8jyJ5Z3/2CBGCkqcnPmEZQKj4Cwkk2Y
 hKZuFpAwiriOxYPcnNghbW2LZwtfMMPaZA4+ZkMUXMLKvYjRPKspMzyjJTczM0TU0MNA1NDTS
 NTQ20zU30Eus0k3WKy3WLU8tLtE10kssL9YrrsxNzknRy0st2cQIjJmUgg63HYyzjrzWO8Qoy
 cGkJMpb7PYsRogvKT+lMiOxOCO+qDQntfgQowwHh5IE74R0oJxgUWp6akVaZg4wfmHSEhw8Si
 K86SBp3uKCxNzizHSI1ClGS44Dix7OZebYcv8ZkNwFIoVY8vLzUqXEebeBNAiANGSU5sGNg6W
 YS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeWtApvBk5pXAbX0FdBAT0EGy7I9BDipJREhJ
 NTBxZKeb/PjDXKScpXBPlrntnz6fle8FJd9LUxU3SBUKxf12tVaoZWQoUeFyy04+qvdJufXmA
 5EJiQJMVS+XWOYdmPli3pY9/xbvETaZYBT1NeTK8gfHVtuebGR9I7vzwYZrTyfLX//6sOCx/3
 OTi59Tk5eqHmHqkYv+xhERw3KKZcmTRe1xlQtC+R52PuCv2s4/0yM0pXqFWEbu50k+r2QlmEX
 uX2cRcJ71LfOLfcUZpjOfJ7xvUp+htUSYLzeXJ28l95vASTnfEzcuFutYwP/hUj6/9nYlsx0s
 mze+XHfwuq2vxPoDLhNfqlmq+1zb/athQq3USuWSGVfTfdPWd9o51m4Q5HtpnJBYukwmsUCJp
 Tgj0VCLuag4EQAsx1flrAMAAA==
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-9.tower-366.messagelabs.com!1558603878!4232304!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19931 invoked from network); 23 May 2019 09:31:23 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-9.tower-366.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 23 May 2019 09:31:23 -0000
Received: from CNMAILCH02.lenovo.com (unknown [10.96.97.130])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 1792E27FE68FC92BBC72
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 05:31:17 -0400 (EDT)
Received: from CNMAILEX01.lenovo.com ([169.254.9.149]) by
 CNMAILCH02.lenovo.com ([::1]) with mapi id 14.03.0415.000; Thu, 23 May 2019
 17:31:15 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Could we implement new features by C language?
Thread-Topic: Could we implement new features by C language?
Thread-Index: AdURSYPKmRJh8PnjQgabK/NJMCiDpg==
Date: Thu, 23 May 2019 09:31:14 +0000
Message-ID: <264283F7338E734E863366C752FEABBC41CB0452@CNMAILEX01.lenovo.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.19.89]
Content-Type: multipart/alternative;
 boundary="_000_264283F7338E734E863366C752FEABBC41CB0452CNMAILEX01lenov_"
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
Cc: Duke KH Du <dukh@lenovo.com>, Harry Sung1 <hsung1@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>,
 Derek Lin23 <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_264283F7338E734E863366C752FEABBC41CB0452CNMAILEX01lenov_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

If we need to implement some features for project specific purpose. Is it n=
ecessary to implemented by C++?

Thanks.
Andrew Peng


--_000_264283F7338E734E863366C752FEABBC41CB0452CNMAILEX01lenov_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
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
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi Team,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">If we need to implement some feature=
s for project specific purpose. Is it necessary to implemented by C&#43;&#4=
3;?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Andrew Peng</span><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_264283F7338E734E863366C752FEABBC41CB0452CNMAILEX01lenov_--
