Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E006440B
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 11:01:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kCph58d7zDqdS
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 19:01:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=087778c05=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45kCnc29ypzDqcM
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 19:00:14 +1000 (AEST)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 10 Jul 2019 16:59:54 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 10 Jul
 2019 16:59:53 +0800
Received: from mailbx05.quanta.corp ([192.168.0.5]) by mailbx05.quanta.corp
 ([192.168.0.5]) with mapi id 15.01.1713.004; Wed, 10 Jul 2019 16:59:53 +0800
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "Patrick Venture (venture@google.com)" <venture@google.com>
Subject: phosphor-ipmi-flash in-band update question
Thread-Topic: phosphor-ipmi-flash in-band update question
Thread-Index: AdU2+0XsgRHJ+dogQrmlYPJ+JiFMyw==
Date: Wed, 10 Jul 2019 08:59:53 +0000
Message-ID: <aca67083725a43149c4571df9f13e9f1@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24750.004
x-tm-as-result: No--22.524600-0.000000-31
x-tm-as-matchedid: 140026-155797-139704-113220-780058-111604-702962-701816-7
 04534-701751-702881-704318-700000-704114-700926-700558-704915-264792-701719
 -111605-700570-702612-703734-303242-102356-704959-780016-703080-703712-7042
 92-705018-704559-704714-703117-701030-703967-703878-700069-701029-701342-70
 4841-188124-704706-188093-148004-148054-20020-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_aca67083725a43149c4571df9f13e9f1quantatwcom_"
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
Cc: "OpenBMC Maillist \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_aca67083725a43149c4571df9f13e9f1quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgUGF0cmljaywNCg0KV2WhpmQgbGlrZSB0byBkbyBpbi1iYW5kIGZpcm13YXJlIHVwZGF0ZSBi
eSBwaG9zcGhvci1pcG1pLWZsYXNoLCBidXQgaXQgbXVzdCBwcm92aWRlIHRoZSBzaWduYXR1cmUg
ZmlsZSBvdGhlcndpc2UgaXQgZXhpdGVkIGRpcmVjdGx5Lg0KDQpIb3cgZG8gd2UgbWFrZSB0aGUg
YXBwcm9wcmlhdGUgc2lnbmF0dXJlIGZpbGUgZm9yIHBob3NwaG9yLWlwbWktZmxhc2ggYW5kIGFs
c28gdmVyaWZ5IGl0IHN1Y2Nlc3NmdWxseSA/DQoNCk9yIGlzIHRoZXJlIGEgd2F5IHRvIGRvIEZX
IHVwZGF0ZSB3aXRob3V0IGEgc2lnbmF0dXJlIGZpbGU/DQoNCkJlc2lkZXMsIHNpbmNlIHdlIHVz
ZSBOdXZvdG9uIEJNQyB0byB1cGRhdGUgYnkgTFBDIGJyaWRnZSwgaXQgbmVlZHMgdG8gY29uZmln
dXJlIHRoZSBNQVBQRURfQUREUkVTUyBhcyB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbi4NCg0K
RG9lcyBpdCBoYXZlIHRvIGFkZCB0aGUgc2ltaWxhciBjb25maWd1cmF0aW9uIHRvIGRldmljZSB0
cmVlIGxpa2UgQXNwZWVkID8NCg0KDQpUaGFua3MuDQo=

--_000_aca67083725a43149c4571df9f13e9f1quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
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
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.a
	{mso-style-name:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	mso-style-priority:99;
	mso-style-link:=AF=C2=A4=E5=A6r;
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Patrick,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We=A1=A6d like to do in-band fi=
rmware update by phosphor-ipmi-flash, but it must provide the signature fil=
e otherwise it exited directly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How do we make the appropriate =
signature file for phosphor-ipmi-flash and also verify it successfully ? &n=
bsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Or is there a way to do FW upda=
te without a signature file?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Besides, since we use Nuvoton B=
MC to update by LPC bridge, it needs to configure the MAPPED_ADDRESS as the=
 reserved memory region.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does it have to add the similar=
 configuration to device tree like Aspeed ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_aca67083725a43149c4571df9f13e9f1quantatwcom_--
