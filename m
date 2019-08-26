Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ADCA4CF2
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:56:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBVt0NgpzDqHh
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:56:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=13417f499=corey.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 73 seconds by postgrey-1.36 at bilbo;
 Mon, 26 Aug 2019 12:32:37 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46GwyY2X1KzDqTY
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 12:32:34 +1000 (AEST)
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 26 Aug 2019 10:31:19 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 26 Aug
 2019 10:31:18 +0800
Received: from mailbx11.quanta.corp ([fe80::a472:fa8f:6234:6aab]) by
 mailbx11.quanta.corp ([fe80::a472:fa8f:6234:6aab%7]) with mapi id
 15.01.1713.004; Mon, 26 Aug 2019 10:31:18 +0800
From: =?big5?B?Q29yZXkgQ2hlbiAos6+n07vKKQ==?= <Corey.Chen@quantatw.com>
To: CS20 KWLiu <KWLIU@nuvoton.com>, Patrick Venture <venture@google.com>
Subject: RE: phosphor-ipmi-flash: A problem in BMC FW update over LPC 
Thread-Topic: phosphor-ipmi-flash: A problem in BMC FW update over LPC 
Thread-Index: AdVZo6Jl7YalvxqwR/SsXogzldHHZQCD+F3Q
Date: Mon, 26 Aug 2019 02:31:18 +0000
Message-ID: <18877aefdb8f47ddbba54c36c0abfd14@quantatw.com>
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_18877aefdb8f47ddbba54c36c0abfd14quantatwcom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: =?big5?B?UnliYWNrIEh1bmcgKKx4qfqnuyk=?= <Ryback.Hung@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 =?big5?B?U2FtdWVsIEppYW5nICimv/Gvpf0p?= <Samuel.Jiang@quantatw.com>,
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_18877aefdb8f47ddbba54c36c0abfd14quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksDQoNCkN1cnJlbnRseSwgSaGmbSBkb2luZyBmb2xsb3dpbmcgc3RlcHMsDQoNCiAgMS4gR2V0
IGEgTU1JTyBzcGFjZSB2aWEgR0NEIHNlcnZpY2UuDQogIDIuIFByb2dyYW0gTFBDL2VTUEkgUENJ
IE9mZnNldCA5OGggWzBdIHRvIFswXSB0byBkaXNhYmxlIG1lbW9yeSBkZWNvZGluZyBmaXJzdCBi
ZWZvcmUgY2hhbmdpbmcgYmFzZSBhZGRyZXNzLg0KICAzLiBQcm9ncmFtIExQQy9lU1BJIFBDSSBP
ZmZzZXQgOThoIFszMToxNiwgMF0gdG8gW0FkZHJlc3MsIDFdLg0KICA0LiBQcm9ncmFtIExQQy9l
U1BJIE1lbW9yeSBSYW5nZSwgUENSW0RNSV0gKyAyNzQwaCB0byB0aGUgc2FtZSB2YWx1ZSBwcm9n
cmFtbWVkIGluIExQQy9lU1BJIFBDSSBPZmZzZXQgOThoLg0KDQpCdXQgYWZ0ZXIgZGlzY3Vzc2lu
ZyB3aXRoIEludGVsLA0KcGVyaGFwcyBJIGhhdmUgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIE1NSU8g
c3BhY2UgSaGmbSB1c2luZyBpcyBjbGFpbWVkIGluIE1NSU9fUlVMRV9DRkdfWCBhcyBTa3lsYWtl
IEJJT1Mgd3JpdGVyIGd1aWRlIG1lbnRpb25zLg0KDQpCUiwNCkNvcmV5DQoNCkZyb206IENTMjAg
S1dMaXUgW21haWx0bzpLV0xJVUBudXZvdG9uLmNvbV0NClNlbnQ6IEZyaWRheSwgQXVndXN0IDIz
LCAyMDE5IDc6MTMgUE0NClRvOiBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4N
CkNjOiBDUzIwIENUQ2NoaWVuIDxDVENDSElFTkBudXZvdG9uLmNvbT47IENvcmV5IENoZW4gKLOv
p9O7yikgPENvcmV5LkNoZW5AcXVhbnRhdHcuY29tPjsgRnJhbiBIc3UgKK59u3jBvikgPEZyYW4u
SHN1QHF1YW50YXR3LmNvbT47IFNhbXVlbCBKaWFuZyAopr/xr6X9KSA8U2FtdWVsLkppYW5nQHF1
YW50YXR3LmNvbT47IEdlb3JnZSBIdW5nICiseKm+t3EpIDxHZW9yZ2UuSHVuZ0BxdWFudGF0dy5j
b20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IHBob3NwaG9yLWlwbWktZmxh
c2g6IEEgcHJvYmxlbSBpbiBCTUMgRlcgdXBkYXRlIG92ZXIgTFBDDQoNCkhlbGxvIFBhdHJpY2s6
DQoNCldlIGFyZSBjdXJyZW50bHkgdHJ5aW5nIHRvIGVuYWJsZSB0aGUgQk1DIEZXIHVwZGF0ZSBv
dmVyIExQQyBvbiBvdXIgcGxhdGZvcm0gKG51dm90b24gQk1DKSwgYnV0IHdlIGVuY291bnRlciBh
IHByb2JsZW0gd2l0aCBCSU9TLg0KDQpUaGUgQklPUyBlbmdpbmVlciBoYXMgcmVzZXJ2ZWQgbWVt
b3J5IHJlZ2lvbiBhcyBtbWlvIHNwYWNlLCBidXQgd2UgY291bGRuJ3Qgc2VlIGFueSBkYXRhIGNo
YW5nZSBpbiB0aGlzIHJlZ2lvbiBkdXJpbmcgcnVuIGJ1cm5fbXlfYm1jLg0KDQpXZSBoYXZlIGNo
ZWNrZWQgdGhlIEJNQyBzZXR0aW5nKGluIGxwY19udXZvdG9uLmMgYW5kIExETiBTSE0pIGJ1dCB3
ZSBjb3VsZG4ndCBpZGVudGlmeSB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzIHByb2JsZW0uDQoNCklz
IHRoZXJlIGFueSBzZXR0aW5ncyB3ZSBsb3N0Pw0KDQpUaGFua3MsDQpKb3NlcGgNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUgcHJpdmlsZWdlZCBjb25maWRlbnRpYWwgaW5m
b3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9yIHVzZSBvbmx5
IGJ5IHRoZSBhZGRyZXNzZWVzIGFzIGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwgc2VuZGVyIG9m
IHRoaXMgZW1haWwuIElmIHlvdSBhcmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNhdGVkIGluIHRo
aXMgZW1haWwgb3IgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2YgdGhlIGVtYWls
IHRvIHN1Y2ggYSBwZXJzb24sIHBsZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNlbmRlciBpbmRp
Y2F0aW5nIHRoaXMgZmFjdCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJvbSB5b3VyIGNv
bXB1dGVyIGFuZCBuZXR3b3JrIHNlcnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29wZXJhdGlvbiBp
cyBoaWdobHkgYXBwcmVjaWF0ZWQuIEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3JpemVk
IHVzZSBvZiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkOyBhbmQgYW55IGluZm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJyZWxldmFudCB0
byB0aGUgb2ZmaWNpYWwgYnVzaW5lc3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVtZWQgYXMgbmVp
dGhlciBnaXZlbiBub3IgZW5kb3JzZWQgYnkgTnV2b3Rvbi4NCg==

--_000_18877aefdb8f47ddbba54c36c0abfd14quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Hi,<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Current=
ly, I=A1=A6m doing following steps,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp; =
1. Get a MMIO space via GCD service.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp; =
2. Program LPC/eSPI PCI Offset 98h [0] to [0] to disable memory decoding fi=
rst before changing base address.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp; =
3. Program LPC/eSPI PCI Offset 98h [31:16, 0] to [Address, 1].<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp; =
4. Program LPC/eSPI Memory Range, PCR[DMI] &#43; 2740h to the same value pr=
ogrammed in LPC/eSPI PCI Offset 98h.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">But aft=
er discussing with Intel,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">perhaps=
 I have to make sure that the MMIO space I=A1=A6m using is claimed in MMIO_=
RULE_CFG_X as Skylake BIOS writer guide mentions.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">BR,<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Corey<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> CS20 KWLiu =
[mailto:KWLIU@nuvoton.com]
<br>
<b>Sent:</b> Friday, August 23, 2019 7:13 PM<br>
<b>To:</b> Patrick Venture &lt;venture@google.com&gt;<br>
<b>Cc:</b> CS20 CTCchien &lt;CTCCHIEN@nuvoton.com&gt;; Corey Chen (</span><=
span style=3D"font-size:11.0pt;font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quo=
t;,serif">=B3=AF=A7=D3=BB=CA</span><span lang=3D"EN-US" style=3D"font-size:=
11.0pt">) &lt;Corey.Chen@quantatw.com&gt;; Fran Hsu (</span><span style=3D"=
font-size:11.0pt;font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=AE}=
=BBx=C1=BE</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">)
 &lt;Fran.Hsu@quantatw.com&gt;; Samuel Jiang (</span><span style=3D"font-si=
ze:11.0pt;font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=A6=BF=F1=
=AF=A5=FD</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">) &lt;Samue=
l.Jiang@quantatw.com&gt;; George Hung (</span><span style=3D"font-size:11.0=
pt;font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=ACx=A9=BE=B7q</sp=
an><span lang=3D"EN-US" style=3D"font-size:11.0pt">)
 &lt;George.Hung@quantatw.com&gt;; openbmc@lists.ozlabs.org<br>
<b>Subject:</b> phosphor-ipmi-flash: A problem in BMC FW update over LPC <o=
:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello Patrick:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are currently trying to enab=
le the BMC FW update over LPC on our platform (nuvoton&nbsp;BMC), but we en=
counter a problem with BIOS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The BIOS engineer has reserved =
memory region as mmio space, but we couldn't see any data change in this re=
gion during run burn_my_bmc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We have checked the BMC setting=
(in lpc_nuvoton.c and LDN SHM) but we couldn't identify the root cause of t=
his problem.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there any settings we lost?<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Joseph<o:p></o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 lang=3D"EN-US" style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,ser=
if">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:gray">The privileged confidential information cont=
ained in this email is intended for use only by the addressees as indicated=
 by the original sender of this email. If you are
 not the addressee indicated in this email or are not responsible for deliv=
ery of the email to such a person, please kindly reply to the sender indica=
ting this fact and delete all copies of it from your computer and network s=
erver immediately. Your cooperation
 is highly appreciated. It is advised that any unauthorized use of confiden=
tial information of Nuvoton is strictly prohibited; and any information in =
this email irrelevant to the official business of Nuvoton shall be deemed a=
s neither given nor endorsed by
 Nuvoton. </span><span lang=3D"EN-US" style=3D"font-family:&quot;=B7s=B2=D3=
=A9=FA=C5=E9&quot;,serif"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_18877aefdb8f47ddbba54c36c0abfd14quantatwcom_--
