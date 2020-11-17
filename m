Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4892BA206
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 06:47:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccltv5nywzDqy1
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 16:47:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=5833891c6=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cb2V000X3zDqR7
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 21:38:27 +1100 (AEDT)
IronPort-SDR: Nd2iUQOIHhzm99L8NWhr0jgb663zYtnz6MdokuXRbt98pE0ak1zFf2qET+T2yhj9ZdZEwAXpBv
 2ancm5S4lgKQ==
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 17 Nov 2020 18:38:25 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 17 Nov
 2020 18:38:24 +0800
Received: from mailbx09.quanta.corp ([192.168.57.9]) by mailbx09.quanta.corp
 ([192.168.57.9]) with mapi id 15.01.2044.004; Tue, 17 Nov 2020 18:38:24 +0800
From: =?big5?B?SnVuLUxpbiBDaGVuICizr6tUwE0p?= <Jun-Lin.Chen@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: The Subscription will disappear and config of EventService restore
 initial value after reboot
Thread-Topic: The Subscription will disappear and config of EventService
 restore initial value after reboot
Thread-Index: Ada8zTtwo1eSvSPzTqi+6szJ11/xAA==
Date: Tue, 17 Nov 2020 10:38:24 +0000
Message-ID: <94a84c0d54f94193be2f21212e3749a7@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_94a84c0d54f94193be2f21212e3749a7quantatwcom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:41:40 +1100
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

--_000_94a84c0d54f94193be2f21212e3749a7quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksDQpJIGhhdmUgYW4gaXNzdWUgYWJvdXQgRXZlbnRTZXJ2aWNlOiBhZnRlciByZWJvb3QsIFN1
YnNjcmlwdGlvbiBkaXNhcHBlYXIgYW5kIGNvbmZpZyBvZiBFdmVudFNlcnZpY2UgcmVzdG9yZSBp
bml0aWFsIHZhbHVlLg0KSSBsb29rIHVwIHRoZSBjb2RlcyBpbiBldmVudF9zZXJ2aWNlX21hbmFn
ZXIuaHBwIGFuZCBmb3VuZCBTdWJzY3JpcHRpb24gYW5kIEV2ZW50U2VydmljZSBjb25maWcgd2ls
bCBzdG9yZSBpbiAvdmFyL2xpYi9ibWN3ZWIvZXZlbnRzZXJ2aWNlX2NvbmZpZy5qc29uLg0KQnV0
IElmIEJNQyBoYXMgbm8gYm1jd2ViIGZvbGRlciBpbiAvdmFyL2xpYi8gLCBJdCBub3Qgc2F2ZSBl
dmVudHNlcnZpY2VfY29uZmlnLmpzb24uDQoNCkkgdHJ5IGNyZWF0ZSBibWN3ZWIgZm9sZGVyIG1h
bnVhbGx5IGFuZCBQT1NUIGEgbmV3IFN1YnNjcmlwdGlvbiB0aGVuIHJlYm9vdCwgdGhlIFN1YnNj
cmlwdGlvbiB3aWxsIGJlIHNhdmVkIGFuZCBub3QgZGlzYXBwZWFyIHRoaXMgdGltZS4NClRoaXMg
cGVyZm9ybWFuY2Ugc2VlbXMgdG8gYmUgaW5jb25zaXN0ZW50IHdpdGggdGhlIGRlc2lnbiBjb25j
ZXB0IGlmIHRoZXJlIGlzIG5vIGJtY3dlYiBmb2xkZXIgYXQgdGhlIGJlZ2lubmluZy4gRG9lcyBu
ZWVkIHRvIGFkZCB0byB0aGUgY29kZSB0aGF0IGRldGVjdCB0aGUgcGF0aCBpcyB2YWxpZD8NCg0K
SmltDQoNCg==

--_000_94a84c0d54f94193be2f21212e3749a7quantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have an issue about EventServ=
ice: after reboot, Subscription disappear and config of EventService restor=
e initial value.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I look up the codes in event_se=
rvice_manager.hpp and found Subscription and EventService config will store=
 in /var/lib/bmcweb/eventservice_config.json.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But If BMC has no bmcweb folder=
 in /var/lib/ , It not save eventservice_config.json.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I try create bmcweb folder manu=
ally and POST a new Subscription then reboot, the Subscription will be save=
d and not disappear this time.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This performance seems to be in=
consistent with the design concept if there is no bmcweb folder at the begi=
nning. Does need to add to the code that detect the path is valid?<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jim</span><i><span lang=3D"EN-U=
S" style=3D"font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></spa=
n></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_94a84c0d54f94193be2f21212e3749a7quantatwcom_--
