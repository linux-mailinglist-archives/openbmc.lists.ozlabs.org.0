Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5DC1D2EE9
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 13:56:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N9386tLNzDqTk
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 21:55:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=39665d7fe=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Thu, 14 May 2020 21:33:50 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49N8Z65syBzDql9
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 21:33:48 +1000 (AEST)
IronPort-SDR: g009D+c6M6xqkUEcSmTsQamoXjWvu1F9OMDBdawG5bQewnH9CxJpzvNptggjqG3ZW9SV6xW6be
 ALTvkxCwf9aw==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 14 May 2020 19:32:35 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 14 May
 2020 19:32:33 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 14 May 2020 19:32:33 +0800
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: "gkeishin@in.ibm.com" <gkeishin@in.ibm.com>
Subject: Openbmc-test-automation checking service root URL "/"
Thread-Topic: Openbmc-test-automation checking service root URL "/"
Thread-Index: AdYp4qgyJHxzOCQnQC+Zg+5dnQ7fJg==
Date: Thu, 14 May 2020 11:32:33 +0000
Message-ID: <a8c9861001b14bf7ba2bd6cba832d2f5@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 1FF197BEB95ED73B613D68321AFCA2345B1BDB686989AA47F0E02DEE75FA24B32000:8
Content-Type: multipart/alternative;
 boundary="_000_a8c9861001b14bf7ba2bd6cba832d2f5quantatwcom_"
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

--_000_a8c9861001b14bf7ba2bd6cba832d2f5quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGVsbG8gR2VvcmdlOg0KDQpJoaZtIHRyeWluZyB0byB0ZXN0IEJNQyB3aXRoIHRlc3Rfc2Vydmlj
ZV9yb290LnJvYm90IGluIG9wZW5ibWMtdGVzdC1hdXRvbWF0aW9uLg0KSG93ZXZlciB0aGVyZaGm
cyBhIHByb2JsZW0gdGhhdCByb2JvdCB0cmllZCB0byBjaGVjayAgoacvoagsICChpy9yZWRmaXNo
oagsICChpy9yZWRmaXNoL3YxoaggIFVSTCBpbiByZWRmaXNoLA0KYnV0IGl0IHNlZW1zIHRoZXJl
oaZzIG5vIKGnL6GoIGFzIGEgc2VydmljZSByb290IG5vZGUgaW4gYm1jd2ViLg0KU2hvdWxkIGl0
IGV4aXN0PyBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCB0aGlzPw0KDQpUaGFua3MN
CkJlc3QgUmVnYXJkcywNCkRhdmlkDQoNCg==

--_000_a8c9861001b14bf7ba2bd6cba832d2f5quantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello George:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=A1=A6m trying to test BMC wit=
h test_service_root.robot in openbmc-test-automation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However there=A1=A6s a problem =
that robot tried to check &nbsp;=A1=A7/=A1=A8, &nbsp;=A1=A7/redfish=A1=A8, =
&nbsp;=A1=A7/redfish/v1=A1=A8 &nbsp;URL in redfish,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">but it seems there=A1=A6s no =
=A1=A7/=A1=A8 as a service root node in bmcweb.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Should it exist? Do you have an=
y suggestion about this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">David<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_a8c9861001b14bf7ba2bd6cba832d2f5quantatwcom_--
