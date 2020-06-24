Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C1207211
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 13:30:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sLXk71mvzDqkj
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 21:29:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=4372650d3=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (unknown [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49sLX01S1KzDqfb
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 21:29:11 +1000 (AEST)
IronPort-SDR: if9SeyYgfI31wSQoeTQJVpXZEOsYqmeHJPQ4VPSfFtE6icQJz8iZE3y0TpW/C2Ar5nuREjkzyZ
 bIulNYLuoZHA==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 24 Jun 2020 19:28:59 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 24 Jun
 2020 19:28:58 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Wed, 24 Jun 2020 19:28:58 +0800
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question about some ipmi commands
Thread-Topic: Question about some ipmi commands
Thread-Index: AdZKGmlNH2iSMF1RSwiw0F/UzVaR9w==
Date: Wed, 24 Jun 2020 11:28:57 +0000
Message-ID: <20e77de6d7d14be88052e0158989b9bc@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 02389C41170B4CBA3234E6D835458BB832057F6B158DD0F79521CB4EC16A3C142000:8
Content-Type: multipart/alternative;
 boundary="_000_20e77de6d7d14be88052e0158989b9bcquantatwcom_"
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

--_000_20e77de6d7d14be88052e0158989b9bcquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgRXZlcnlvbmUsDQoNCkkgaGF2ZSBzb21lIHF1ZXN0aW9uIGFib3V0IHRoYXQgc29tZSBpcG1p
IGNvbW1hbmRzIGNhbqGmdCB3b3JrIG5vcm1hbGx5Og0KU2V0L0dldCBBQ1BJIFBvd2VyIFN0YXRl
DQpHZXQgQ2hhc3NpcyBDYXBhYmlsaXRpZXMNCkdldCBQT0ggQ291bnRlcg0KDQpJIHRoaW5rIHRo
ZSBxdWVzdGlvbnMgaGFzIGJlZW4gb2NjdXJyZWQgc2luY2UgdGhhdCBpdCBsb3N0IHRoZSByZWxh
dGl2ZSBEYnVzIGluIG91ciBzeXN0ZW0sDQphbmQgaGVyZSBpcyB0aGUgbGlzdDoNCg0KDQpBQ1BJ
Og0KDQp4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuUG93ZXIuQUNQSVBvd2VyU3RhdGUNCg0K
DQoNCkNoYXNzaXMgQ2FwYWJpbGl0aWVzOg0KDQp4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wu
Q2hhc3Npc0NhcGFiaWxpdGllcw0KDQpQT0g6DQp4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLlBv
d2VyT25Ib3Vycw0KDQoNCkFyZSB0aGVyZSBzb21lIHNldHRpbmdzIEkgZm9yZ2V0dGluZyB0byBh
ZGQgaW50byBvdXIgc3lzdGVtPw0KDQpUaGFuayB5b3UuDQoNCg0KDQpTaW5jZXJlbHksDQoNClNw
ZW5jZXIgS3UNCg0K

--_000_20e77de6d7d14be88052e0158989b9bcquantatwcom_
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
p
	{mso-style-priority:99;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"=B7s=B2=D3=A9=FA=C5=E9",serif;}
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
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Hi Everyone,<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">I have some question about that some ipmi commands can=A1=A6t=
 work normally:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Set/Get ACPI Power State<o:p=
></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Get Chassis Capabilities<o:p=
></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Get POH Counter<o:p></o:p></=
span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I think the questions has been =
occurred since that it lost the relative Dbus in our system,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">and here is the list:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p><b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-se=
rif;color:black">ACPI:</span></b><span lang=3D"EN-US" style=3D"font-family:=
&quot;Calibri&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">xyz.openbmc_project.Control.Power.ACPIPowerState<o:p></o:p></=
span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black"><o:p>&nbsp;</o:p></span></p>
<p><b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-se=
rif;color:black">Chassis Capabilities:</span></b><span lang=3D"EN-US" style=
=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><o:p></o:p></sp=
an></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">xyz.openbmc_project.Control.ChassisCapabilities<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">POH:<o:p></o:p></span></b></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">xyz.openb=
mc_project.State.PowerOnHours<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Are there some settings I forgetting to add into our system?<=
o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Thank you.<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black"><o:p>&nbsp;</o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Sincerely,<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Spencer Ku<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_20e77de6d7d14be88052e0158989b9bcquantatwcom_--
