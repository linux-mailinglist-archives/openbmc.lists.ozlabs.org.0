Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD01C4CB2
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 05:38:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GQRR3qXtzDqbm
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 13:38:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=387f094da=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Tue, 05 May 2020 13:37:38 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49GQQp3VHJzDqWS
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 13:37:36 +1000 (AEST)
IronPort-SDR: Z9kQlzBcue4AejheEGBtrW2Ky6PvNkOX5Ua8Pn2ABirxJFdp+Sb45caoZxFvuKW4Q7zPcwuiNU
 6y9G9n6NOXpQ==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 05 May 2020 11:36:25 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 5 May 2020
 11:36:23 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 5 May 2020 11:36:23 +0800
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: "gkeishin@in.ibm.com" <gkeishin@in.ibm.com>
Subject: Runing openbmc-test-automation with latest DMTF tool
Thread-Topic: Runing openbmc-test-automation with latest DMTF tool
Thread-Index: AdYijliOoppu2H5nRfGbNNknDCph2g==
Date: Tue, 5 May 2020 03:36:23 +0000
Message-ID: <9ca3227c0a18406da062b22b9581bb96@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 6C780FDCD75A299EC7A5EBA8042D2ED7D4709DFD98F83D3554630C4F372B15302000:8
Content-Type: multipart/alternative;
 boundary="_000_9ca3227c0a18406da062b22b9581bb96quantatwcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_9ca3227c0a18406da062b22b9581bb96quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgR2VvcmdlOg0KDQpJoaZtIHRlc3RpbmcgbXkgQk1DcyB3aXRoIFJlZGZpc2hfVXNlY2FzZV9D
aGVja2Vycy5yb2JvdCB3aGljaCBpcyB1c2luZyBETVRGIHRvb2wgY2xvbmUgZnJvbSBnaXRodWIu
Y29tL0RNVEYvUmVkZmlzaC1Vc2VjYXNlLUNoZWNrZXJzLmdpdA0KDQpUaGUgcmVhc29uIGZvciB0
aGUgZmFpbHVyZSBpcyB0aGF0IHRoZSBsYXRlc3QgRE1URiB0b29sIGNhbqGmdCByZWNvZ25pemUg
LXYgYXJndW1lbnQgaW4gYWNjb3VudF9tYW5hZ2VtZW50LnB5LCBhbmQgoVZGIGluIHBvd2VyX2Nv
bnRyb2wucHkuDQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uPyBJcyBpdCBmaW5lIGlmIEkg
b25seSByZXN0b3JlIHRoZSBETVRGIHRvb2wgd2l0aCBwcmV2aW91cyByZXZpc2lvbiBhbmQgdGVz
dCBteSBCTUNzPw0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcywNCkRhdmlkDQoNCg==

--_000_9ca3227c0a18406da062b22b9581bb96quantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi George:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=A1=A6m testing my BMCs with R=
edfish_Usecase_Checkers.robot which is using DMTF tool clone from github.co=
m/DMTF/Redfish-Usecase-Checkers.git<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The reason for the failure is t=
hat the latest DMTF tool can=A1=A6t recognize -v argument in account_manage=
ment.py, and =A1VF in power_control.py.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you have any suggestion? Is =
it fine if I only restore the DMTF tool with previous revision and test my =
BMCs?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">David<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_9ca3227c0a18406da062b22b9581bb96quantatwcom_--
