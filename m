Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C424322944D
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 11:01:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBTwM69ZhzDr6L
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 19:01:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=465f16df2=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BBTvQ0lPPzDqQZ
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 19:00:25 +1000 (AEST)
IronPort-SDR: PGAnCBJvjGEL7zK5A621QCm+ldvtmrNxvHY/x31O9QHHcBXj7K97A28xAy5d7u/uANF/G0OT2s
 r5iepFPDlZaw==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 22 Jul 2020 17:00:22 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 22 Jul
 2020 17:00:19 +0800
Received: from mailbx12.quanta.corp ([192.168.57.12]) by mailbx12.quanta.corp
 ([192.168.57.12]) with mapi id 15.01.2044.004;
 Wed, 22 Jul 2020 17:00:19 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Hwmon scale timing issue
Thread-Topic: Hwmon scale timing issue
Thread-Index: AdZgBbqu9AOTYqxsRwKjfSZ6PyCHmw==
Date: Wed, 22 Jul 2020 09:00:19 +0000
Message-ID: <e44cf80b68864cba9db6c71d23a5c5fb@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 8F4BE6400617BCC0EA7180CECD78F65FABE002288E1B5F12E9BA983964D445AA2000:8
Content-Type: multipart/alternative;
 boundary="_000_e44cf80b68864cba9db6c71d23a5c5fbquantatwcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?RWRkaWUgTHUgKLOwpnSpoyk=?= <Eddie.Lu@quantatw.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_e44cf80b68864cba9db6c71d23a5c5fbquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgTWF0dCwNCiAgIFRoYW5rcyBmb3Igc29sdmluZyBzZW5zb3IgdHlwZSBpc3N1ZSwgYnV0IEkg
Zm91bmQgYW5vdGhlciBpc3N1ZSwgdGhlIHNjYWxlIHdvdWxkIG5vdCBhcHBseSB3aGVuDQpod21v
biB1cGRhdGVkIHZhbHVlIGluIGZpcnN0IHRpbWUuIEZvciBleGFtcGxlLCBteSBiYXR0ZXJ5IDMu
MDUxIHZvbHRhZ2Ugd291bGQgcmVjb3JkIDMwNTEgb24gZGJ1cw0KaW5zdGVhZCBvZiAzLjA1MSB1
bnRpbCBod21vbiB1cGRhdGUgYWdhaW4uIEkgdGhpbmsgdGhpcyBpcyBzY2FsZSB0aW1pbmcgaXNz
dWUgZm9yIGh3bW9uIHVwZGF0ZSB2YWx1ZQ0KaW4gZmlyc3QgdGltZS4gU29tZSBzZW5zb3JzIGlu
dGVydmFsIGNvbmZpZ3VyYXRpb24gaXMgc28gbG9uZyBzdWNoIGFzIG9uZSBkYXkgdGhhdCB3b3Vs
ZCBsZWFkIHRvDQpyZWNvcmQgd3JvbmcgdmFsdWUgZm9yIGEgbG9uZyB0aW1lLg0KDQpJIGFtIG5v
dCBzdXJlIHRoaXMgbGluZSB3b3VsZCBsZWFkIHRvIGh3bW9uIHVwZGF0ZSB2YWx1ZSB3aXRoIGlu
Y29ycmVjdCBzY2FsZSBpbiBmaXJzdCB0aW1lLg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3ItaHdtb24vYmxvYi9tYXN0ZXIvc2Vuc29yLmNwcCNMMTcwDQoNClRoYW5rcw0KRHVr
ZQ0K

--_000_e44cf80b68864cba9db6c71d23a5c5fbquantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Matt,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; Thanks for solving=
 sensor type issue, but I found another issue, the scale would not apply wh=
en
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">hwmon updated value in first ti=
me. For example, my battery 3.051 voltage would record 3051 on dbus
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">instead of 3.051 until hwmon up=
date again. I think this is scale timing issue for hwmon update value
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">in first time. Some sensors int=
erval configuration is so long such as one day that would lead to
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">record wrong value for a long t=
ime. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am not sure this line would l=
ead to hwmon update value with incorrect scale in first time.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">https://github.com/openbmc/phos=
phor-hwmon/blob/master/sensor.cpp#L170<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Duke<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_e44cf80b68864cba9db6c71d23a5c5fbquantatwcom_--
