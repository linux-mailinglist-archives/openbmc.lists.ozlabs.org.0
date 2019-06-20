Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09A4C7E4
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 09:10:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TtHq1sj9zDr8N
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 17:10:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=067d939f4=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45TrHQ5HvkzDqyZ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 15:39:44 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 20 Jun 2019 13:39:41 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 20 Jun
 2019 13:39:39 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 20 Jun 2019 13:39:39 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Some questions about recipes-phosphor/inventory 
Thread-Topic: Some questions about recipes-phosphor/inventory 
Thread-Index: AdUnKa3h9J8i5hGQQW+rLloQ3HF/QQ==
Date: Thu, 20 Jun 2019 05:39:39 +0000
Message-ID: <63fc9eff383a40149fc8037b54844e1c@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24696.000
x-tm-as-result: No--16.199100-0.000000-31
x-tm-as-matchedid: 140026-155741-150588-139704-113220-780058-111604-702962-7
 01816-704534-701751-702881-704318-700000-704114-700926-704915-701719-111605
 -700570-702612-703734-303242-102356-700537-703325-703688-139705-703674-7052
 53-701424-111610-188124-702395-701919-700010-704381-702965-700069-701162-70
 1878-703117-700224-701432-702874-703676-701317-704720-704563-704706-188093-
 899168-190077-148004-148054-20020-29106-42000-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: multipart/alternative;
 boundary="_000_63fc9eff383a40149fc8037b54844e1cquantatwcom_"
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

--_000_63fc9eff383a40149fc8037b54844e1cquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCg0KQXMgb3VyIHBob3NwaG9yLW52bWUgcHJvcG9zYWwsIGh0dHBzOi8vZ2Vycml0
Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy8xOTA2MQ0KaXQgd2lsbCBzZXQg
cHJvcGVydGllcyB0byBELWJ1cyAieHl6Lm9wZW5ibWNfcHJvamVjdC5JbnZlbnRvcnkuTWFuYWdl
ciIgYW5kIG9iamVjdCBwYXRocyBhcmUNCiIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkv
c3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvbnZtZShpbmRleCkiDQoNCkkgaGF2ZSBmb3VuZCB0
d28gd2F5cyB0byBhY2hpZXZlIHRoZSBhYm92ZSBnb2FscywgYnV0IEkgaGF2ZSBzb21lIHByb2Js
ZW1zIHdpdGggdGhlc2UgdHdvIG1ldGhvZHMuDQoNCjEuQWRkIGEgeWFtbCBmaWxlIHRvIG9wZW5i
bWMvbWV0YS1waG9zcGhvci9yZWNpcGVzLXBob3NwaG9yL2ludmVudG9yeSB0byBjcmVhdGUgdGhv
c2Ugb2JqZWN0IHBhdGhzLg0KDQpDcmVhdGluZyBhIGJiIGZpbGUgbmFtZWQgoadwaG9zcGhvci1p
bnZlbnRvcnktbWFuYWdlci1udm1lLmJioaggYW5kIGZvbGxvdyB0aGUgd2F5IGxpa2UgoadwaG9z
cGhvci1pbnZlbnRvcnktbWFuYWdlci1hc3NldHRhZy5iYqGoLg0KDQpPbmUgb2YgdGhlIHByb2Js
ZW1zIGlzIHRoYXQgbm90IGV2ZXJ5IGRldmVsb3BlciBuZWVkcyB0aGVzZSBwYXRocy4NCkFub3Ro
ZXIgcXVlc3Rpb24gaXMgdGhhdCBpdCBkb2Vzbid0IGtub3cgaG93IG1hbnkgTlZNZSBkcml2ZXMg
d2VyZSB1c2VkIGZvciBvdGhlciBwcm9qZWN0cy4NCg0KMi5BZGQgYSBkZXNjcmlwdGlvbiBvZiBo
b3cgdG8gY3JlYXRlIG9iamVjdCBwYXRocyB0byBELWJ1cyAieHl6Lm9wZW5ibWNfcHJvamVjdC5J
bnZlbnRvcnkuTWFuYWdlciIgYW5kIGdpdmUgYW4gZXhhbXBsZSBpbiBSRUFETUUgZmlsZS4NCg0K
V2hpY2ggYXBwcm9hY2ggZG8geW91IHRoaW5rIGlzIGJldHRlciBvciBkbyB5b3UgaGF2ZSBhbnkg
b3RoZXIgc3VnZ2VzdGlvbnM/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQo=

--_000_63fc9eff383a40149fc8037b54844e1cquantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Brad,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">As our ph=
osphor-nvme proposal,
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/&#43;/19061">h=
ttps://gerrit.openbmc-project.xyz/c/openbmc/docs/&#43;/19061</a></span><spa=
n lang=3D"EN-US" style=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">it will s=
et properties to D-bus &quot;xyz.openbmc_project.Inventory.Manager&quot; an=
d object paths are<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">&quot;/xy=
z/openbmc_project/inventory/system/chassis/motherboard/nvme(index)&quot;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">I have fo=
und two ways to achieve the above goals, but I have some problems with thes=
e two methods.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">1.Add a y=
aml file to openbmc/meta-phosphor/recipes-phosphor/inventory to create thos=
e object paths.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Creating =
a bb file named =A1=A7phosphor-inventory-manager-nvme.bb=A1=A8 and follow t=
he way like =A1=A7phosphor-inventory-manager-assettag.bb=A1=A8.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">One of th=
e problems is that not every developer needs these paths.&nbsp;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Another q=
uestion is that it doesn't know how many NVMe drives were used for other pr=
ojects.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">2.Add a d=
escription of how to create object paths to D-bus &quot;xyz.openbmc_project=
.Inventory.Manager&quot; and give an example in README file.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Which app=
roach do you think is better or do you have any other suggestions?<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tony<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_63fc9eff383a40149fc8037b54844e1cquantatwcom_--
