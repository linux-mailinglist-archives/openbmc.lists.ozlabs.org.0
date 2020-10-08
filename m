Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF22871BE
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 11:42:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6R785SSVzDqCX
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 20:41:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mic.com.tw (client-ip=220.130.36.7; helo=micmsefe01.mic.com.tw;
 envelope-from=john.chung@mic.com.tw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mic.com.tw
X-Greylist: delayed 2863 seconds by postgrey-1.36 at bilbo;
 Thu, 08 Oct 2020 20:41:09 AEDT
Received: from MICMSEFE01.mic.com.tw (mail22.mic.com.tw [220.130.36.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6R6F70wZzDqFB
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 20:41:09 +1100 (AEDT)
Received: from MICMSEFE01.mic.com.tw (localhost [127.0.0.2] (may be forged))
 by MICMSEFE01.mic.com.tw with ESMTP id 0988rR2s026568
 for <openbmc@lists.ozlabs.org>; Thu, 8 Oct 2020 16:53:27 +0800 (GMT-8)
 (envelope-from john.chung@mic.com.tw)
Received: from MICEXCH02.mitacad.com (micexch02.mitacad.com [10.88.25.250])
 by MICMSEFE01.mic.com.tw with ESMTP id 0988rDva026545
 for <openbmc@lists.ozlabs.org>; Thu, 8 Oct 2020 16:53:13 +0800 (GMT-8)
 (envelope-from john.chung@mic.com.tw)
Received: from MICEXCH01.mitacad.com (10.88.25.249) by MICEXCH02.mitacad.com
 (10.88.25.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 8 Oct 2020
 16:53:15 +0800
Received: from MICEXCH01.mitacad.com ([fe80::7512:93eb:1586:1977]) by
 MICEXCH01.mitacad.com ([fe80::7512:93eb:1586:1977%3]) with mapi id
 15.01.1913.007; Thu, 8 Oct 2020 16:53:15 +0800
From: <john.chung@mic.com.tw>
To: <openbmc@lists.ozlabs.org>
Subject: Get inventory FRU from inventory system path
Thread-Topic: Get inventory FRU from inventory system path
Thread-Index: AdadT8UT5a4aOJlKQ2qFUrwNl4OrxQ==
Date: Thu, 8 Oct 2020 08:53:14 +0000
Message-ID: <270220206437441ba7ba4eb39336f9e4@mic.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.25.29]
Content-Type: multipart/alternative;
 boundary="_000_270220206437441ba7ba4eb39336f9e4miccomtw_"
MIME-Version: 1.0
X-MAIL: MICMSEFE01.mic.com.tw 0988rDva026545
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

--_000_270220206437441ba7ba4eb39336f9e4miccomtw_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64


SGksDQoNCkkgYW0gdHJ5aW5nIHRvIGdldCB0aGUgZGF0YSBmcm9tIHRoaXMgcGF0aCChp2h0dHBz
Oi8vPGJtY2lwPi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW08aHR0cHM6Ly8l
M2NibWNpcCUzZS94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0+oaguDQpCdXQg
b25seSBnZXQgdGhlIGZvbGxvd2luZyBkYXRhIGZyb20gdGhpcyBwYXRoLg0KDQoiL3h5ei9vcGVu
Ym1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3RlbSI6IHsNCiJBc3NldFRhZyI6ICIiDQp9LA0KDQpI
ZXJlIGlzIGFuIGV4YW1wbGUgZm9yIHRoaXMgcGF0aCB3aGljaCBJIGV4cGVjdGVkIHRvIGdldC4N
Cg0KICAgICIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtIjogew0KICAgICAg
ICAiQnVpbGREYXRlIjogIiIsDQogICAgICAgICJDYWNoZWQiOiAwLA0KICAgICAgICAiRmllbGRS
ZXBsYWNlYWJsZSI6IDAsDQogICAgICAgICJNYW51ZmFjdHVyZXIiOiAiIiwNCiAgICAgICAgIk1v
ZGVsIjogIjIiLA0KICAgICAgICAiUGFydE51bWJlciI6ICIwMDAwMDAwMDAwMDAwMDAwIiwNCiAg
ICAgICAgIlByZXNlbnQiOiAxLA0KICAgICAgICAiUHJldHR5TmFtZSI6ICIiLA0KICAgICAgICAi
U2VyaWFsTnVtYmVyIjogIjAwMDAwMDAwMDAwMDAwMDAiDQogICAgfSwNCg0KDQoNCk9ubHkgdXNp
bmcgZW50aXR5LW1hbmFnZXIgaW4gbXkgcHJvamVjdCBmb3IgaW52ZW50b3J5IEZSVS4NCkkgY291
bGQgZ2V0IHRoZSBGUlUgZGF0YSBmcm9tIHRoaXMgcGF0aCChp2h0dHBzOi8vPGJtY2lwPi94eXov
b3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vYm9hcmQvPG5hbWU+oagNCkJ1dCB0aGUg
aW52ZW50b3J5IHN5c3RlbSBwYXRoIGlzIG51bGwuDQoNCkFueSBzZXR0aW5nIEkgc2hvdWxkIHNl
dCBmb3IgZ2V0dGluZyBGUlUgZnJvbSB0aGlzIHBhdGg/DQoNClJlZ2FyZHMsDQpKb2huIENodW5n
DQoNCg0KDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpUaGlzIGVtYWlsIG1lc3NhZ2UgYW5kIGFsbCBh
dHRhY2htZW50cyB0cmFuc21pdHRlZCB3aXRoIGl0IGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9yIHRo
ZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBhbmQgbWF5IGNvbnRhaW4gbGVnYWxs
eSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlbWFpbCwgeW91IGFyZSBoZXJlYnkgbm90
aWZpZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwgZGlzc2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9uLCBj
b3B5aW5nLCBvciBvdGhlciB1c2Ugb2YgdGhpcyBtZXNzYWdlLCBpdHMgYXR0YWNobWVudHMgb3Ig
YW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCB0aGVyZWluIGlzIHN0cmljdGx5IHByb2hpYml0ZWQu
IElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBjb250YWN0
IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIHBsZWFzZSBkZWxldGUgaXQgYW5kIGFueSBhdHRh
Y2htZW50cyBmcm9tIHlvdXIgc3lzdGVtLiBDb21wdXRlciB2aXJ1c2VzIGNhbiBiZSB0cmFuc21p
dHRlZCB2aWEgZW1haWwuIFRoZSBzZW5kZXIgYWNjZXB0cyBubyBsaWFiaWxpdHkgZm9yIGFueSBk
YW1hZ2UgY2F1c2VkIGJ5IGFueSB2aXJ1cyB0cmFuc21pdHRlZCBieSB0aGlzIGVtYWlsLiBUaGFu
ayB5b3UuDQo=

--_000_270220206437441ba7ba4eb39336f9e4miccomtw_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE=20html=20PUBLIC=20"-//W3C//DTD=20XHTML=201.0=20Transitional//EN">=
=0A<html=20xmlns:v=3D"urn:schemas-microsoft-com:vml"=20xmlns:o=3D"urn:schem=
as-microsoft-com:office:office"=20xmlns:w=3D"urn:schemas-microsoft-com:offi=
ce:word"=20xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml">=0A=
<head>=0A<meta=20http-equiv=3D"Content-Type"=20content=3D"text/html;=20char=
set=3Dbig5">=0A<meta=20name=3D"Generator"=20content=3D"Microsoft=20Word=201=
5=20(filtered=20medium)">=0A<style=20type=3D"text/css">=0A<!--=0A/*=20Font=
=20Definitions=20*/=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:=B7=
s=B2=D3=A9=FA=C5=E9;=0A=20=20=20=20=20=20=20=20panose-1:2=202=205=200=200=
=200=200=200=200=200;}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:=
=B2=D3=A9=FA=C5=E9;=0A=20=20=20=20=20=20=20=20panose-1:2=202=205=209=200=20=
0=200=200=200=200;}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:"Ca=
mbria=20Math";=0A=20=20=20=20=20=20=20=20panose-1:2=204=205=203=205=204=206=
=203=202=204;}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:Calibri;=
=0A=20=20=20=20=20=20=20=20panose-1:2=2015=205=202=202=202=204=203=202=204;=
}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:=B7L=B3n=A5=BF=B6=C2=
=C5=E9;=0A=20=20=20=20=20=20=20=20panose-1:2=2011=206=204=203=205=204=204=
=202=204;}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:Consolas;=0A=
=20=20=20=20=20=20=20=20panose-1:2=2011=206=209=202=202=204=203=202=204;}=
=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:"\@=B7L=B3n=A5=BF=B6=
=C2=C5=E9";=0A=20=20=20=20=20=20=20=20panose-1:2=2011=206=204=203=205=204=
=204=202=204;}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:"\@=B2=
=D3=A9=FA=C5=E9";=0A=20=20=20=20=20=20=20=20panose-1:2=202=205=209=200=200=
=200=200=200=200;}=0A@font-face=0A=20=20=20=20=20=20=20=20{font-family:"\@=
=B7s=B2=D3=A9=FA=C5=E9";=0A=20=20=20=20=20=20=20=20panose-1:2=202=205=200=
=200=200=200=200=200=200;}=0A/*=20Style=20Definitions=20*/=0Ap.MsoNormal,=
=20li.MsoNormal,=20div.MsoNormal=0A=20=20=20=20=20=20=20=20{margin:0cm;=0A=
=20=20=20=20=20=20=20=20margin-bottom:.0001pt;=0A=20=20=20=20=20=20=20=20fo=
nt-size:12.0pt;=0A=20=20=20=20=20=20=20=20font-family:"Calibri",sans-serif;=
}=0Aa:link,=20span.MsoHyperlink=0A=20=20=20=20=20=20=20=20{mso-style-priori=
ty:99;=0A=20=20=20=20=20=20=20=20color:#0563C1;=0A=20=20=20=20=20=20=20=20t=
ext-decoration:underline;}=0Aa:visited,=20span.MsoHyperlinkFollowed=0A=20=
=20=20=20=20=20=20=20{mso-style-priority:99;=0A=20=20=20=20=20=20=20=20colo=
r:#954F72;=0A=20=20=20=20=20=20=20=20text-decoration:underline;}=0Acode=0A=
=20=20=20=20=20=20=20=20{mso-style-priority:99;=0A=20=20=20=20=20=20=20=20f=
ont-family:=B2=D3=A9=FA=C5=E9;}=0Apre=0A=20=20=20=20=20=20=20=20{mso-style-=
priority:99;=0A=20=20=20=20=20=20=20=20mso-style-link:"HTML=20=B9w=B3]=AE=
=E6=A6=A1=20=A6r=A4=B8";=0A=20=20=20=20=20=20=20=20margin:0cm;=0A=20=20=20=
=20=20=20=20=20margin-bottom:.0001pt;=0A=20=20=20=20=20=20=20=20font-size:1=
2.0pt;=0A=20=20=20=20=20=20=20=20font-family:=B2=D3=A9=FA=C5=E9;}=0Aspan.Em=
ailStyle17=0A=20=20=20=20=20=20=20=20{mso-style-type:personal-compose;=0A=
=20=20=20=20=20=20=20=20font-family:"Calibri",sans-serif;=0A=20=20=20=20=20=
=20=20=20color:windowtext;}=0Aspan.HTML=0A=20=20=20=20=20=20=20=20{mso-styl=
e-name:"HTML=20=B9w=B3]=AE=E6=A6=A1=20=A6r=A4=B8";=0A=20=20=20=20=20=20=20=
=20mso-style-priority:99;=0A=20=20=20=20=20=20=20=20mso-style-link:"HTML=20=
=B9w=B3]=AE=E6=A6=A1";=0A=20=20=20=20=20=20=20=20font-family:=B2=D3=A9=FA=
=C5=E9;}=0A.MsoChpDefault=0A=20=20=20=20=20=20=20=20{mso-style-type:export-=
only;}=0A/*=20Page=20Definitions=20*/=0A@page=20WordSection1=0A=20=20=20=20=
=20=20=20=20{size:612.0pt=20792.0pt;=0A=20=20=20=20=20=20=20=20margin:72.0p=
t=2090.0pt=2072.0pt=2090.0pt;}=0Adiv.WordSection1=0A=20=20=20=20=20=20=20=
=20{page:WordSection1;}=0A-->=0A</style>=0A<!--[if=20gte=20mso=209]><xml>=
=0A<o:shapedefaults=20v:ext=3D"edit"=20spidmax=3D"1026"=20/>=0A</xml><![end=
if]--><!--[if=20gte=20mso=209]><xml>=0A<o:shapelayout=20v:ext=3D"edit">=0A<=
o:idmap=20v:ext=3D"edit"=20data=3D"1"=20/>=0A</o:shapelayout></xml><![endif=
]-->=0A<title></title>=0A</head>=0A<body=20lang=3D"ZH-TW"=20link=3D"#0563C1=
"=20vlink=3D"#954F72"=20style=3D"text-justify-trim:punctuation">=0A<div=20c=
lass=3D"WordSection1">=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">Hi=
,</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">&nbsp;</span=
></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">I=20am=20trying=20t=
o=20get=20the=20data=20from=20this=20path=20=A1=A7<a=20href=3D"https://%3cb=
mcip%3e/xyz/openbmc_project/inventory/system">https://&lt;bmcip&gt;/xyz/ope=
nbmc_project/inventory/system</a>=A1=A8.</span></p>=0A<p=20class=3D"MsoNorm=
al"><span=20lang=3D"EN-US">But=20only=20get=20the=20following=20data=20from=
=20this=20path.</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US=
">&nbsp;</span></p>=0A<p=20class=3D"MsoNormal"=20style=3D"text-indent:24.0p=
t"><span=20lang=3D"EN-US"=20style=3D"font-size:9.0pt;font-family:Consolas">=
"/xyz/openbmc_project/inventory/system":=20{</span></p>=0A<p=20class=3D"Mso=
Normal"=20style=3D"margin-left:21.0pt;text-indent:27.0pt"><span=20lang=3D"E=
N-US"=20style=3D"font-size:9.0pt;font-family:Consolas">"AssetTag":=20""</sp=
an></p>=0A<p=20class=3D"MsoNormal"=20style=3D"text-indent:21.0pt"><span=20l=
ang=3D"EN-US"=20style=3D"font-size:9.0pt;font-family:Consolas">},</span></p=
>=0A<p=20class=3D"MsoNormal"=20style=3D"text-indent:21.0pt"><span=20lang=3D=
"EN-US"=20style=3D"font-size:9.0pt;font-family:Consolas">&nbsp;</span></p>=
=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">Here=20is=20an=20example=
=20for=20this=20path=20which=20I=20expected=20to=20get.</span></p>=0A<p=20c=
lass=3D"MsoNormal"><span=20lang=3D"EN-US">&nbsp;</span></p>=0A<p=20class=3D=
"MsoNormal"=20style=3D"background:#F6F8FA"><span=20lang=3D"EN-US"=20style=
=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;border:none=20window=
text=201.0pt;padding:0cm">&nbsp;&nbsp;&nbsp;=20"/xyz/openbmc_project/invent=
ory/system":=20{</span></p>=0A<p=20class=3D"MsoNormal"=20style=3D"backgroun=
d:#F6F8FA"><span=20lang=3D"EN-US"=20style=3D"font-size:9.0pt;font-family:Co=
nsolas;color:#24292E;border:none=20windowtext=201.0pt;padding:0cm">&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20"BuildDate":=20"",</span></p>=0A<p=20c=
lass=3D"MsoNormal"=20style=3D"background:#F6F8FA"><span=20lang=3D"EN-US"=20=
style=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;border:none=20w=
indowtext=201.0pt;padding:0cm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20"Cached":=200,</span></p>=0A<p=20class=3D"MsoNormal"=20style=3D"backgrou=
nd:#F6F8FA"><span=20lang=3D"EN-US"=20style=3D"font-size:9.0pt;font-family:C=
onsolas;color:#24292E;border:none=20windowtext=201.0pt;padding:0cm">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20"FieldReplaceable":=200,</span></p>=
=0A<p=20class=3D"MsoNormal"=20style=3D"background:#F6F8FA"><span=20lang=3D"=
EN-US"=20style=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;border=
:none=20windowtext=201.0pt;padding:0cm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20"Manufacturer":=20"",</span></p>=0A<p=20class=3D"MsoNormal"=20sty=
le=3D"background:#F6F8FA"><span=20lang=3D"EN-US"=20style=3D"font-size:9.0pt=
;font-family:Consolas;color:#24292E;border:none=20windowtext=201.0pt;paddin=
g:0cm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20"Model":=20"2",</span><=
/p>=0A<p=20class=3D"MsoNormal"=20style=3D"background:#F6F8FA"><span=20lang=
=3D"EN-US"=20style=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;bo=
rder:none=20windowtext=201.0pt;padding:0cm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20"PartNumber":=20"0000000000000000",</span></p>=0A<p=20class=
=3D"MsoNormal"=20style=3D"background:#F6F8FA"><span=20lang=3D"EN-US"=20styl=
e=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;border:none=20windo=
wtext=201.0pt;padding:0cm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20"Pr=
esent":=201,</span></p>=0A<p=20class=3D"MsoNormal"=20style=3D"background:#F=
6F8FA"><span=20lang=3D"EN-US"=20style=3D"font-size:9.0pt;font-family:Consol=
as;color:#24292E;border:none=20windowtext=201.0pt;padding:0cm">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20"PrettyName":=20"",</span></p>=0A<p=20clas=
s=3D"MsoNormal"=20style=3D"background:#F6F8FA"><span=20lang=3D"EN-US"=20sty=
le=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;border:none=20wind=
owtext=201.0pt;padding:0cm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20"S=
erialNumber":=20"0000000000000000"</span></p>=0A<p=20class=3D"MsoNormal"=20=
style=3D"background:#F6F8FA"><span=20lang=3D"EN-US"=20style=3D"font-size:9.=
0pt;font-family:Consolas;color:#24292E;border:none=20windowtext=201.0pt;pad=
ding:0cm">&nbsp;&nbsp;&nbsp;=20},</span></p>=0A<p=20class=3D"MsoNormal"><sp=
an=20lang=3D"EN-US">&nbsp;</span></p>=0A<p=20class=3D"MsoNormal"><span=20la=
ng=3D"EN-US">&nbsp;</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"E=
N-US">&nbsp;</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">O=
nly=20using=20entity-manager=20in=20my=20project=20for=20inventory=20FRU.</=
span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">I=20could=20get=
=20the=20FRU=20data=20from=20this=20path=20=A1=A7https://&lt;bmcip&gt;/xyz/=
openbmc_project/inventory/system/board/&lt;name&gt;=A1=A8</span></p>=0A<p=
=20class=3D"MsoNormal"><span=20lang=3D"EN-US">But=20the=20inventory=20syste=
m=20path=20is=20null.</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D=
"EN-US">&nbsp;</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US"=
>Any=20setting=20I=20should=20set=20for=20getting=20FRU=20from=20this=20pat=
h?</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US">&nbsp;</spa=
n></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US"=20style=3D"font-si=
ze:10.0pt;font-family:&quot;=B7L=B3n=A5=BF=B6=C2=C5=E9&quot;,sans-serif">Re=
gards,</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D"EN-US"=20style=
=3D"font-size:10.0pt;font-family:&quot;=B7L=B3n=A5=BF=B6=C2=C5=E9&quot;,san=
s-serif">John=20Chung</span></p>=0A<p=20class=3D"MsoNormal"><span=20lang=3D=
"EN-US">&nbsp;</span></p>=0A</div>=0A</body>=0A</html>This=20email=20messag=
e=20and=20all=20attachments=20transmitted=20with=20it=20are=20intended=20so=
lely=20for=20the=20use=20of=20the=20intended=20recipient(s)=20and=20may=20c=
ontain=20legally=20privileged=20and=20confidential=20information.=20If=20yo=
u=20are=20not=20the=20intended=20recipient=20of=20this=20email,=20you=20are=
=20hereby=20notified=20that=20any=20disclosure,=20dissemination,=20distribu=
tion,=20copying,=20or=20other=20use=20of=20this=20message,=20its=20attachme=
nts=20or=20any=20information=20contained=20therein=20is=20strictly=20prohib=
ited.=20If=20you=20have=20received=20this=20email=20in=20error,=20please=20=
contact=20the=20sender=20immediately=20and=20please=20delete=20it=20and=20a=
ny=20attachments=20from=20your=20system.=20Computer=20viruses=20can=20be=20=
transmitted=20via=20email.=20The=20sender=20accepts=20no=20liability=20for=
=20any=20damage=20caused=20by=20any=20virus=20transmitted=20by=20this=20ema=
il.=20Thank=20you.

--_000_270220206437441ba7ba4eb39336f9e4miccomtw_--
