Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB132A8A6B
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 00:09:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRzjy4JxnzDr1c
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 10:09:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=57116f761=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 66 seconds by postgrey-1.36 at bilbo;
 Thu, 05 Nov 2020 17:31:11 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CRYZ76Db3zDql8
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 17:31:10 +1100 (AEDT)
IronPort-SDR: v1PQ2MdwDPFUYeji2QVqbhcj8Oziy8VeS2jqd9amx7uwW9mYa3MDmViQ3UdyilPzdGQwG9WTZI
 /Olp6K8s+MMw==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 05 Nov 2020 14:30:01 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 5 Nov 2020
 14:30:00 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.2044.004;
 Thu, 5 Nov 2020 14:30:00 +0800
From: =?big5?B?QnJ1Y2UgTGVlICin9an7rm0p?= <Bruce_Lee@quantatw.com>
To: "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>,
 "yugang.chen@linux.intel.com" <yugang.chen@linux.intel.com>,
 "kuiying.wang@intel.com" <kuiying.wang@intel.com>
Subject: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Thread-Topic: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Thread-Index: AdazPL6EMls5bWeYTdWBCftty23oqQ==
Date: Thu, 5 Nov 2020 06:30:00 +0000
Message-ID: <da65b69b77144a94ad9e278b0fe72b5d@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_da65b69b77144a94ad9e278b0fe72b5dquantatwcom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 10:08:48 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_da65b69b77144a94ad9e278b0fe72b5dquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpQbGVhc2UgaGVscCBwcm92aWRlIHNvbWUgZXhhbXBsZXMgZm9yIGhvdyB0byB1
c2Ugc21iaW9zLW1kciB2aWEgaW50ZWwtaXBtaS1vZW0sDQptYXliZSBpdKGmcyBhIGxvdHMgc2Vy
aWVzIGludGVsLWlwbWktb2VtLA0KSSB3YW50IHRvIGtub3cgaG93IHRvIHNlbmQgYSBzbWJpb3Mg
ZmlsZSB2aWEgZnVuY3Rpb24goaVzdG9yZURhdGF0b0ZsYXNooaYNCmFuZCB0aGVuIHNtYmlvcy1t
ZHIgZnVuY3Rpb25zIHdpbGwgdG8gcmVhZCBzbWJpb3MgZmlsZSB2aWEgZnVuY3Rpb24goaVyZWFk
RGF0YUZyb21GbGFzaKGmDQoNCmJlbG93IGxpbmtzIGlzIHJlZmVyZW5jZSBmcm9tIHVwc3RyZWFt
LA0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvc21iaW9zLW1kcg0KaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvaW50ZWwtaXBtaS1vZW0NCg0KdGhhbmtzLA0KQnJ1Y2UuDQo=

--_000_da65b69b77144a94ad9e278b0fe72b5dquantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please help provide some exampl=
es for how to use smbios-mdr via intel-ipmi-oem,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">maybe it=A1=A6s a lots series i=
ntel-ipmi-oem, <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I want to know how to send a sm=
bios file via function =A1=A5storeDatatoFlash=A1=A6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">and then smbios-mdr functions w=
ill to read smbios file via function =A1=A5readDataFromFlash=A1=A6<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">below links is reference from u=
pstream,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/smbios-mdr">https://github.com/openbmc/smbios-mdr</a><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/intel-ipmi-oem">https://github.com/openbmc/intel-ipmi-oem</a><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Bruce.<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_da65b69b77144a94ad9e278b0fe72b5dquantatwcom_--
