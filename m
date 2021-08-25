Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D13F74D4
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 14:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvlFJ5Qyrz2yR7
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 22:11:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=61.220.76.156; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 905 seconds by postgrey-1.36 at boromir;
 Wed, 25 Aug 2021 17:49:42 AEST
Received: from mail.inventec.com (61-220-76-156.HINET-IP.hinet.net
 [61.220.76.156])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvdRV5TG9z2yJC
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 17:49:42 +1000 (AEST)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 25 Aug 2021 15:34:27 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 25 Aug 2021 15:34:27 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE2.inventec.com with ESMTP id 17P7YKlD085971
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 15:34:20 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 25 Aug 2021 15:34:20 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::d5d8:f435:eb2c:676b]) by
 IEC1-EX2016-01.iec.inventec ([fe80::d5d8:f435:eb2c:676b%8]) with mapi id
 15.01.2176.014; Wed, 25 Aug 2021 15:34:20 +0800
From: =?big5?B?TGluLlRvbW15U0MgqkylQLTcIFRBTw==?= <Lin.TommySC@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AdeZffCe3FTiFR09TPmVfTNzFwE6kA==
Date: Wed, 25 Aug 2021 07:34:20 +0000
Message-ID: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.177.156]
Content-Type: multipart/mixed;
 boundary="_004_aab1dd3f9c034bc3a1eef34306149833inventeccom_"
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 17P7YKlD085971
X-TM-SNTS-SMTP: E9EFEE520A3D8DD17C48AFC8657B59170D0624D0BE3A91C533F621BE04F447F72000:8
X-Mailman-Approved-At: Wed, 25 Aug 2021 22:11:03 +1000
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
Cc: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 =?big5?B?S3VvLk1hcmNlbCCzoqRovHcgSVNW?= <kuo.marcel@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_aab1dd3f9c034bc3a1eef34306149833inventeccom_
Content-Type: multipart/alternative;
	boundary="_000_aab1dd3f9c034bc3a1eef34306149833inventeccom_"

--_000_aab1dd3f9c034bc3a1eef34306149833inventeccom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

QXMgdGl0bGVkLg0KDQpCUg0KVG9tbXkNCg==

--_000_aab1dd3f9c034bc3a1eef34306149833inventeccom_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"=B7s=B2=D3=A9=FA=C5=E9",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:18.0pt">As t=
itled.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:18.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:18.0pt">BR<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:18.0pt">Tomm=
y<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_aab1dd3f9c034bc3a1eef34306149833inventeccom_--

--_004_aab1dd3f9c034bc3a1eef34306149833inventeccom_
Content-Type: application/octet-stream;
	name="0001-Linux-add-Transformers-machine-config.patch"
Content-Description: 0001-Linux-add-Transformers-machine-config.patch
Content-Disposition: attachment;
	filename="0001-Linux-add-Transformers-machine-config.patch"; size=8414;
	creation-date="Wed, 25 Aug 2021 06:52:07 GMT";
	modification-date="Wed, 25 Aug 2021 06:52:07 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjNTBmZWIzMGIwMzEzMjUwMzM5ZTkxNDk0MTBlYmRkODEzOWM1ZjgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiTGluLlRvbW15U0MiIDxsaW4udG9tbXlzY0BpbnZlbnRlYy5j
b20+CkRhdGU6IFR1ZSwgMjQgQXVnIDIwMjEgMDU6NDQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENI
XSBMaW51eCBhZGQgVHJhbnNmb3JtZXJzIG1hY2hpbmUgY29uZmlnCgpJbml0aWFsIGludHJvZHVj
dGlvbiBvZiBJbnZlbnRlYyBUcmFuc2Zvcm1lcnMgZmFtaWx5IGVxdWlwcGVkIHdpdGggQXNwZWVk
IDI2MDAgQk1DIFNvQy4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4
ZXMueWFtbCAgfCAgIDIgKwogYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKIC4uLi9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMu
ZHRzICB8IDM2MiArKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzY1IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1j
LWludmVudGVjLXRyYW5zZm9ybWVycy5kdHMKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggMzU1YjgxMTQ4Yjg1
Li4yOGMwNjhlZDBhNzUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTUwNyw2ICs1MDcsOCBAQCBwYXR0ZXJu
UHJvcGVydGllczoKICAgICBkZXNjcmlwdGlvbjogSW50ZXIgQ29udHJvbCBHcm91cAogICAiXmlu
dmVuc2Vuc2UsLioiOgogICAgIGRlc2NyaXB0aW9uOiBJbnZlblNlbnNlIEluYy4KKyAgIl5pbnZl
bnRlYywuKiI6CisgICAgZGVzY3JpcHRpb246IEludmVudGVjIENvcnBvcmF0aW9uCiAgICJeaW52
ZXJzZXBhdGgsLioiOgogICAgIGRlc2NyaXB0aW9uOiBJbnZlcnNlIFBhdGgKICAgIl5pb20sLioi
OgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290
L2R0cy9NYWtlZmlsZQppbmRleCA0OGQ0OGM4NWRlOWUuLjkzMGI4YmE2YzNjNSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFr
ZWZpbGUKQEAgLTE0MDcsNiArMTQwNyw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX0FTUEVFRCkgKz0g
XAogCWFzcGVlZC1ibWMtaW50ZWwtczI2MDB3Zi5kdGIgXAogCWFzcGVlZC1ibWMtaW5zcHVyLWZw
NTI4MGcyLmR0YiBcCiAJYXNwZWVkLWJtYy1pbnNwdXItbmY1MjgwbTYuZHRiIFwKKwlhc3BlZWQt
Ym1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdGIgXAogCWFzcGVlZC1ibWMtbGVub3ZvLWhyNjMw
LmR0YiBcCiAJYXNwZWVkLWJtYy1sZW5vdm8taHI4NTV4ZzIuZHRiIFwKIAlhc3BlZWQtYm1jLW1p
Y3Jvc29mdC1vbHltcHVzLmR0YiBcCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi5lNzg2NmM3ZGJhN2YKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHMKQEAgLTAsMCAr
MSwzNjIgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisv
LyBDb3B5cmlnaHQgMjAyMSBJbnZlbnRlYyBDb3JwLgorCisvZHRzLXYxLzsKKworI2luY2x1ZGUg
ImFzcGVlZC1nNi5kdHNpIgorI2luY2x1ZGUgImFzcGVlZC1nNi1waW5jdHJsLmR0c2kiCisjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaTJjL2kyYy5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8v
YXNwZWVkLWdwaW8uaD4KKworLyB7CisJbW9kZWwgPSAiVFJBTlNGT1JNRVJTIEJNQyI7CisJY29t
cGF0aWJsZSA9ICJpbnZlbnRlYyx0cmFuc2Zvcm1lci1ibWMiLCAiYXNwZWVkLGFzdDI2MDAiOwor
CisJYWxpYXNlcyB7CisJCXNlcmlhbDQgPSAmdWFydDU7CisJfTsKKworCWNob3NlbiB7CisJCXN0
ZG91dC1wYXRoID0gJnVhcnQ1OworCQlib290YXJncyA9ICJjb25zb2xlPXR0eTAgY29uc29sZT10
dHlTNCwxMTUyMDBuOCByb290PS9kZXYvcmFtIHJ3IGluaXQ9L2xpbnV4cmMiOworCX07CisKKwlt
ZW1vcnlAODAwMDAwMDAgeworCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOworCQlyZWcgPSA8MHg4
MDAwMDAwMCAweDgwMDAwMDAwPjsKKwl9OworCisJcmVzZXJ2ZWQtbWVtb3J5IHsKKwkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDE+OworCQlyYW5nZXM7CisKKwkJZ2Z4
X21lbW9yeTogZnJhbWVidWZmZXIgeworCQkJc2l6ZSA9IDwweDAxMDAwMDAwPjsKKwkJCWFsaWdu
bWVudCA9IDwweDAxMDAwMDAwPjsKKwkJCWNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsK
KwkJCXJldXNhYmxlOworCQl9OworCisJCXZpZGVvX2VuZ2luZV9tZW1vcnk6IHZpZGVvIHsKKwkJ
CXNpemUgPSA8MHgwNDAwMDAwMD47CisJCQlhbGlnbm1lbnQgPSA8MHgwMTAwMDAwMD47CisJCQlj
b21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CisJCQlyZXVzYWJsZTsKKwkJfTsKKworCQlz
c3BfbWVtb3J5OiBzc3BfbWVtb3J5IHsKKwkJCXNpemUgPSA8MHgwMDIwMDAwMD47CisJCQlhbGln
bm1lbnQgPSA8MHgwMDEwMDAwMD47CisJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7
CisJCQluby1tYXA7CisJCX07CisJfTsKKworCWlpby1od21vbiB7CisJCWNvbXBhdGlibGUgPSAi
aWlvLWh3bW9uIjsKKwl9OworCisJbGVkcyB7CisJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsK
KworCQkvLyBVSUQgbGVkCisJCXVpZCB7CisJCQlsYWJlbCA9ICJVSURfTEVEIjsKKwkJCWdwaW9z
ID0gPCZncGlvMCBBU1BFRURfR1BJTyhYLCAwKSBHUElPX0FDVElWRV9MT1c+OworCQl9OworCisJ
CS8vIEhlYXJ0IGJlYXQgbGVkCisJCWhlYXJ0YmVhdCB7CisJCQlsYWJlbCA9ICJIQl9MRUQiOwor
CQkJZ3Bpb3MgPSA8JmdwaW8wIEFTUEVFRF9HUElPKFAsIDcpIEdQSU9fQUNUSVZFX0xPVz47CisJ
CX07CisJfTsKK307CisKKyZtZGlvMCB7CisJc3RhdHVzID0gIm9rYXkiOworCisJZXRocGh5MDog
ZXRoZXJuZXQtcGh5QDAgeworCQljb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZWVlODAyLjMt
YzIyIjsKKwkJcmVnID0gPDE+OworCX07Cit9OworCismbWFjMyB7CisJc3RhdHVzID0gIm9rYXki
OworCXBoeS1tb2RlID0gInJnbWlpIjsKKwlwaHktaGFuZGxlID0gPCZldGhwaHkwPjsKKwlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmcGluY3RybF9yZ21paTRfZGVm
YXVsdD47Cit9OworCismZm1jIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwlmbGFzaEAwIHsKKwkJ
c3RhdHVzID0gIm9rYXkiOworCQltMjVwLGZhc3QtcmVhZDsKKwkJbGFiZWwgPSAiYm1jIjsKKwkJ
c3BpLW1heC1mcmVxdWVuY3kgPSA8MzMwMDAwMDA+OworCQlzcGktdHgtYnVzLXdpZHRoID0gPDI+
OworCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OworI2luY2x1ZGUgIm9wZW5ibWMtZmxhc2gtbGF5
b3V0LmR0c2kiCisJfTsKKworCWZsYXNoQDEgeworCQlzdGF0dXMgPSAib2theSI7CisJCW0yNXAs
ZmFzdC1yZWFkOworCQlsYWJlbCA9ICJibWMyIjsKKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MzMw
MDAwMDA+OworCQlzcGktdHgtYnVzLXdpZHRoID0gPDI+OworCQlzcGktcngtYnVzLXdpZHRoID0g
PDI+OworCX07Cit9OworCismc3BpMSB7CisJc3RhdHVzID0gIm9rYXkiOworCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZwaW5jdHJsX3NwaTFfZGVmYXVsdD47CisK
KwlmbGFzaEAwIHsKKwkJc3RhdHVzID0gIm9rYXkiOworCQltMjVwLGZhc3QtcmVhZDsKKwkJbGFi
ZWwgPSAiYmlvcyI7CisJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDMzMDAwMDAwPjsKKwkJc3BpLXR4
LWJ1cy13aWR0aCA9IDwxPjsKKwkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwxPjsKKwl9OworfTsKKwor
JndkdDEgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZ1YXJ0MSB7CisJc3RhdHVzID0gIm9r
YXkiOworfTsKKworJnVhcnQ1IHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismaTJjMCB7CisJ
c3RhdHVzID0gIm9rYXkiOworCisJLy9TZXQgYm1jJyBzbGF2ZSBhZGRyZXNzOworCWJtY19zbGF2
ZUAxMCB7CisJCWNvbXBhdGlibGUgPSAiaXBtYi1kZXYiOworCQlyZWcgPSA8KDB4MTAgfCBJMkNf
T1dOX1NMQVZFX0FERFJFU1MpPjsKKwkJaTJjLXByb3RvY29sOworCX07Cit9OworCismaTJjMiB7
CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmkyYzMgeworCS8vIEZSVSBBVDI0QzUxMkMtU1NI
TS1UCisJc3RhdHVzID0gIm9rYXkiOworCWVlcHJvbUA1MCB7CisJCWNvbXBhdGlibGUgPSAiYXRt
ZWwsMjRjNTEyIjsKKwkJcmVnID0gPDB4NTA+OworCQlwYWdlc2l6ZSA9IDwxMjg+OworCX07Cit9
OworCismaTJjNSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmkyYzYgeworCXN0YXR1cyA9
ICJva2F5IjsKKworCXRtcDc1QDQ5IHsKKwkJY29tcGF0aWJsZSA9ICJ0aSx0bXA3NSI7CisJCXJl
ZyA9IDwweDQ5PjsKKwl9OworCisJdG1wNzVANGYgeworCQljb21wYXRpYmxlID0gInRpLHRtcDc1
IjsKKwkJcmVnID0gPDB4NGY+OworCX07CisKKwl0bXA0NjhANDggeworCQljb21wYXRpYmxlID0g
InRpLHRtcDQ2OCI7CisJCXJlZyA9IDwweDQ4PjsKKwl9OworfTsKKworJmkyYzcgeworCXN0YXR1
cyA9ICJva2F5IjsKKwlhZG0xMjc4QDQwIHsKKwkJY29tcGF0aWJsZSA9ICJhZGksYWRtMTI3OCI7
CisJCXJlZyA9IDwweDQwPjsKKwl9OworfTsKKworCismaTJjOCB7CisJLy8gRlJVIEFUMjRDNTEy
Qy1TU0hNLVQKKwlzdGF0dXMgPSAib2theSI7CisKKwllZXByb21ANTEgeworCQljb21wYXRpYmxl
ID0gImF0bWVsLDI0YzUxMiI7CisJCXJlZyA9IDwweDUxPjsKKwkJcGFnZXNpemUgPSA8MTI4PjsK
Kwl9OworCisJZWVwcm9tQDUzIHsKKwkJY29tcGF0aWJsZSA9ICJhdG1lbCwyNGM1MTIiOworCQly
ZWcgPSA8MHg1Mz47CisJCXBhZ2VzaXplID0gPDEyOD47CisJfTsKK307CisKKyZpMmM5IHsKKwkv
LyBNLjIKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismaTJjMTAgeworCS8vIEkyQyBFWFBBTkRF
UgorCXN0YXR1cyA9ICJva2F5IjsKKworCWkyYy1zd2l0Y2hANzEgeworCQljb21wYXRpYmxlID0g
Im54cCxwY2E5NTQ0IjsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0g
PDA+OworCQlyZWcgPSA8MHg3MT47CisJfTsKKworCWkyYy1zd2l0Y2hANzMgeworCQljb21wYXRp
YmxlID0gIm54cCxwY2E5NTQ0IjsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNl
bGxzID0gPDA+OworCQlyZWcgPSA8MHg3Mz47CisJfTsKK307CisKKyZpMmMxMSB7CisJLy8gSTJD
IEVYUEFOREVSCisJc3RhdHVzID0gIm9rYXkiOworCisJaTJjLXN3aXRjaEA3MCB7CisJCWNvbXBh
dGlibGUgPSAibnhwLHBjYTk1NDQiOworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUt
Y2VsbHMgPSA8MD47CisJCXJlZyA9IDwweDcwPjsKKworCQlwY2llX2VlcHJvbV9yaXNlcjE6IGky
Y0AwIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisJ
CQlyZWcgPSA8MD47CisKKwkJCWVlcHJvbUA1NSB7CisJCQkJY29tcGF0aWJsZSA9ICJhdG1lbCwy
NGM1MTIiOworCQkJCXJlZyA9IDwweDU1PjsKKwkJCQlwYWdlc2l6ZSA9IDwxMjg+OworCQkJfTsK
KwkJfTsKKworCQlwY2llX2VlcHJvbV9yaXNlcjI6IGkyY0AxIHsKKwkJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQlyZWcgPSA8MT47CisKKwkJCWVlcHJv
bUA1NSB7CisJCQkJY29tcGF0aWJsZSA9ICJhdG1lbCwyNGM1MTIiOworCQkJCXJlZyA9IDwweDU1
PjsKKwkJCQlwYWdlc2l6ZSA9IDwxMjg+OworCQkJfTsKKwkJfTsKKworCQlwY2llX2VlcHJvbV9y
aXNlcjM6IGkyY0AyIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMg
PSA8MD47CisJCQlyZWcgPSA8Mj47CisKKwkJCWVlcHJvbUA1NSB7CisJCQkJY29tcGF0aWJsZSA9
ICJhdG1lbCwyNGM1MTIiOworCQkJCXJlZyA9IDwweDU1PjsKKwkJCQlwYWdlc2l6ZSA9IDwxMjg+
OworCQkJfTsKKwkJfTsKKwl9OworfTsKKworJmkyYzEyIHsKKwlzdGF0dXMgPSAib2theSI7CisK
Kwlwc3UwOnBzdTBANTggeworCQljb21wYXRpYmxlID0gInBtYnVzIjsKKwkJcmVnID0gPDB4NTg+
OworCX07Cit9OworCismZ3BpbzAgeworCXN0YXR1cyA9ICJva2F5IjsKKwlncGlvLWxpbmUtbmFt
ZXMgPQorCS8qQTAtQTcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLAorCS8qQjAtQjcqLyAg
ICJJMkNfSFNDX0FMRVJUIiwiQk1DX1JFQURZIiwiIiwiIiwiIiwiIiwiUFNVMV9BTEVSVCIsIiIs
CisJLypDMC1DNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsCisJLypEMC1ENyovICAgIiIs
IiIsIiIsIiIsIiIsIiIsIiIsIiIsCisJLypFMC1FNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIs
IiIsCisJLypGMC1GNyovICAgIiIsIiIsIiIsIiIsIlJTVF9CTUNfU0dQSU8iLCIiLCIiLCIiLAor
CS8qRzAtRzcqLyAgICIiLCIiLCJKVEFHX01VWF9TRUwiLCIiLCIiLCIiLCIiLCIiLAorCS8qSDAt
SDcqLyAgICIiLCIiLCIiLCIiLCJSRVNFVF9PVVQiLCJQT1dFUl9PVVQiLCIiLCIiLAorCS8qSTAt
STcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCJOTUlfT1VUIiwiIiwKKwkvKkowLUo3Ki8gICAiIiwi
IiwiIiwiIiwiIiwiIiwiIiwiIiwKKwkvKkswLUs3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwi
IiwKKwkvKkwwLUw3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwKKwkvKk0wLU03Ki8gICAi
IiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwKKwkvKk4wLU43Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwi
IiwiIiwKKwkvKk8wLU83Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwKKwkvKlAwLVA3Ki8g
ICAiIiwiIiwiIiwiVENLX01VWF9TRUwiLCJCTUNfQVNEX0pUQUdfRU4iLCIiLCJQUkVRX04iLCIi
LAorCS8qUTAtUTcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLAorCS8qUjAtUjcqLyAgICIi
LCIiLCIiLCIiLCIiLCIiLCIiLCIiLAorCS8qUzAtUzcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCJQ
Q0hfVEhFUk1UUklQIiwiIiwKKwkvKlQwLVQ3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwK
KwkvKlUwLVU3Ki8gICAiIiwiTk1JX0JVVFRPTiIsIiIsIiIsIiIsIiIsIiIsIiIsCisJLypWMC1W
NyovICAgIiIsIiIsIiIsIiIsIlBTX1BXUk9LIiwiIiwiIiwiUFJEWV9OIiwKKwkvKlcwLVc3Ki8g
ICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwKKwkvKlgwLVg3Ki8gICAiIiwiIiwiIiwiQ1BMRF9D
QVRFUlIiLCIiLCIiLCIiLCIiLAorCS8qWTAtWTcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIi
LAorCS8qWjAtWjcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLAorCS8qQUEwLUFBNyovICIi
LCIiLCIiLCIiLCIiLCIiLCIiLCIiLAorCS8qQUIwLUFCNyovICIiLCIiLCIiLCIiLCIiLCIiLCIi
LCIiLAorCS8qQUMwLUFDNyovICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiOworfTsKKworJmxwY19z
bm9vcCB7CisJc3RhdHVzID0gIm9rYXkiOworCXNub29wLXBvcnRzID0gPDB4ODA+OworfTsKKwor
JmVtbWNfY29udHJvbGxlciB7CisJc3RhdHVzID0gIm9rYXkiOworCXRpbWluZy1waGFzZSA9IDww
eDcwMEZGPjsKK307CisKKyZlbW1jIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwlub24tcmVtb3Zh
YmxlOworCW1heC1mcmVxdWVuY3kgPSA8NTIwMDAwMDA+OworCXNkaGNpLWRyaXZlLXR5cGUgPSAv
Yml0cy8gOCA8Mz47CisJYnVzLXdpZHRoID0gPDg+OworfTsKKworJnZodWIgeworCXN0YXR1cyA9
ICJva2F5IjsKKwlhc3BlZWQsdmh1Yi1kb3duc3RyZWFtLXBvcnRzID0gPDc+OworCWFzcGVlZCx2
aHViLWdlbmVyaWMtZW5kcG9pbnRzID0gPDIxPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OworCXBpbmN0cmwtMCA9IDwmcGluY3RybF91c2IyYWRfZGVmYXVsdD47Cit9OworCismcnRjIHsK
KwlzdGF0dXMgPSAib2theSI7Cit9OwotLSAKMi4xNy4xCgo=

--_004_aab1dd3f9c034bc3a1eef34306149833inventeccom_--
