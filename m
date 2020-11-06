Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD32A8D18
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 03:44:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS4Tg1cMRzDr8s
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 13:44:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=572cfcbd0=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CS4Sp0Y69zDqMW
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 13:43:17 +1100 (AEDT)
IronPort-SDR: 609PNmCn2nw0ni5kBrUIlAjyhoQ0L7jpMw0YCbJPbmBMWbcg5VD+rfzmAbRhdwtlzKF8/Uf72B
 VgSYAzIjN5MA==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 06 Nov 2020 10:43:15 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 6 Nov 2020
 10:43:14 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.2044.004;
 Fri, 6 Nov 2020 10:43:14 +0800
From: =?big5?B?QnJ1Y2UgTGVlICin9an7rm0p?= <Bruce_Lee@quantatw.com>
To: Yong Li <yong.b.li@linux.intel.com>, "cheng.c.yang@linux.intel.com"
 <cheng.c.yang@linux.intel.com>, "yugang.chen@linux.intel.com"
 <yugang.chen@linux.intel.com>, "kuiying.wang@intel.com"
 <kuiying.wang@intel.com>
Subject: RE: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Thread-Topic: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Thread-Index: AdazPL6EMls5bWeYTdWBCftty23oqQAW/YMAABJR7KA=
Date: Fri, 6 Nov 2020 02:43:14 +0000
Message-ID: <a283f7ff49df470095e138aeda7d5fbc@quantatw.com>
References: <da65b69b77144a94ad9e278b0fe72b5d@quantatw.com>
 <003f01d6b3db$c4440490$4ccc0db0$@linux.intel.com>
In-Reply-To: <003f01d6b3db$c4440490$4ccc0db0$@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_a283f7ff49df470095e138aeda7d5fbcquantatwcom_"
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

--_000_a283f7ff49df470095e138aeda7d5fbcquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

WWVzLCBtYXkgSSBrbm93IHRoZSBmdWxsIGRldGFpbHMgdG8gc2VuZCBhIHNtYmlvcyBmaWxlIHRv
IHN0b3JlIHZpYSBpbnRlbC1pcG1pLW9lbQ0Kb3IgZGV0YWlscyBhcmUgbm90IHB1YmxpYyB0byBv
dGhlcnMgbmVlZCB0byBwdWJsaXNoIGEgcmVxdWlyZW1lbnQgdG8gaW50ZWwgSVBTPw0KDQpUaGFu
a3MsDQpCcnVjZQ0KRnJvbTogWW9uZyBMaSA8eW9uZy5iLmxpQGxpbnV4LmludGVsLmNvbT4NClNl
bnQ6IEZyaWRheSwgTm92ZW1iZXIgNiwgMjAyMCA5OjI2IEFNDQpUbzogQnJ1Y2UgTGVlICin9an7
rm0pIDxCcnVjZV9MZWVAcXVhbnRhdHcuY29tPjsgY2hlbmcuYy55YW5nQGxpbnV4LmludGVsLmNv
bTsgeXVnYW5nLmNoZW5AbGludXguaW50ZWwuY29tOyBrdWl5aW5nLndhbmdAaW50ZWwuY29tDQpD
Yzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSRTogUGxlYXNlIGhlbHAgcHJv
dmlkZSBzb21lIGV4YW1wbGVzIGZvciBob3cgdG8gdXNlIHNtYmlvcy1tZHIgdmlhIGludGVsLWlw
bWktb2VtDQoNClRoZSBiZWxvdyBleGFtcGxlPw0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
aW50ZWwtaXBtaS1vZW0vYmxvYi9tYXN0ZXIvc3JjL3NtYmlvc21kcnYyaGFuZGxlci5jcHAjTDEy
MTENCg0KVGhhbmtzLA0KWW9uZw0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3lvbmcu
Yi5saT1saW51eC5pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJtYy1ib3Vu
Y2VzK3lvbmcuYi5saT1saW51eC5pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZz4+IE9uIEJlaGFs
ZiBPZiBCcnVjZSBMZWUgKD8/PykNClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA1LCAyMDIwIDI6
MzAgUE0NClRvOiBjaGVuZy5jLnlhbmdAbGludXguaW50ZWwuY29tPG1haWx0bzpjaGVuZy5jLnlh
bmdAbGludXguaW50ZWwuY29tPjsgeXVnYW5nLmNoZW5AbGludXguaW50ZWwuY29tPG1haWx0bzp5
dWdhbmcuY2hlbkBsaW51eC5pbnRlbC5jb20+OyBrdWl5aW5nLndhbmdAaW50ZWwuY29tPG1haWx0
bzprdWl5aW5nLndhbmdAaW50ZWwuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzxt
YWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUGxlYXNlIGhlbHAgcHJv
dmlkZSBzb21lIGV4YW1wbGVzIGZvciBob3cgdG8gdXNlIHNtYmlvcy1tZHIgdmlhIGludGVsLWlw
bWktb2VtDQoNCkhpIGFsbCwNCg0KUGxlYXNlIGhlbHAgcHJvdmlkZSBzb21lIGV4YW1wbGVzIGZv
ciBob3cgdG8gdXNlIHNtYmlvcy1tZHIgdmlhIGludGVsLWlwbWktb2VtLA0KbWF5YmUgaXShpnMg
YSBsb3RzIHNlcmllcyBpbnRlbC1pcG1pLW9lbSwNCkkgd2FudCB0byBrbm93IGhvdyB0byBzZW5k
IGEgc21iaW9zIGZpbGUgdmlhIGZ1bmN0aW9uIKGlc3RvcmVEYXRhdG9GbGFzaKGmDQphbmQgdGhl
biBzbWJpb3MtbWRyIGZ1bmN0aW9ucyB3aWxsIHRvIHJlYWQgc21iaW9zIGZpbGUgdmlhIGZ1bmN0
aW9uIKGlcmVhZERhdGFGcm9tRmxhc2ihpg0KDQpiZWxvdyBsaW5rcyBpcyByZWZlcmVuY2UgZnJv
bSB1cHN0cmVhbSwNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3NtYmlvcy1tZHINCmh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL2ludGVsLWlwbWktb2VtDQoNCnRoYW5rcywNCkJydWNlLg0K

--_000_a283f7ff49df470095e138aeda7d5fbcquantatwcom_
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
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";}
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
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Yes, ma=
y I know the full details to send a smbios file to store via intel-ipmi-oem=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">or deta=
ils are not public to others need to publish a requirement to intel IPS?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Thanks,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Bruce<o=
:p></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> Yong Li &lt=
;yong.b.li@linux.intel.com&gt;
<br>
<b>Sent:</b> Friday, November 6, 2020 9:26 AM<br>
<b>To:</b> Bruce Lee (</span><span style=3D"font-size:11.0pt;font-family:&q=
uot;MS PGothic&quot;,sans-serif">=A7=F5=A9=FB=AEm</span><span lang=3D"EN-US=
" style=3D"font-size:11.0pt">) &lt;Bruce_Lee@quantatw.com&gt;; cheng.c.yang=
@linux.intel.com; yugang.chen@linux.intel.com; kuiying.wang@intel.com<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> RE: Please help provide some examples for how to use smbios=
-mdr via intel-ipmi-oem<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-CN">The below example?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp#L1211"><span s=
tyle=3D"font-size:11.0pt;mso-fareast-language:ZH-CN">https://github.com/ope=
nbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp#L1211</span></a>=
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-language:=
ZH-CN"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-CN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-CN">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:ZH-CN">Yong<o:p></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> openbmc &lt=
;</span><span lang=3D"EN-US"><a href=3D"mailto:openbmc-bounces&#43;yong.b.l=
i=3Dlinux.intel.com@lists.ozlabs.org"><span style=3D"font-size:11.0pt">open=
bmc-bounces&#43;yong.b.li=3Dlinux.intel.com@lists.ozlabs.org</span></a></sp=
an><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt;
<b>On Behalf Of </b>Bruce Lee (???)<br>
<b>Sent:</b> Thursday, November 5, 2020 2:30 PM<br>
<b>To:</b> </span><span lang=3D"EN-US"><a href=3D"mailto:cheng.c.yang@linux=
.intel.com"><span style=3D"font-size:11.0pt">cheng.c.yang@linux.intel.com</=
span></a></span><span lang=3D"EN-US" style=3D"font-size:11.0pt">;
</span><span lang=3D"EN-US"><a href=3D"mailto:yugang.chen@linux.intel.com">=
<span style=3D"font-size:11.0pt">yugang.chen@linux.intel.com</span></a></sp=
an><span lang=3D"EN-US" style=3D"font-size:11.0pt">;
</span><span lang=3D"EN-US"><a href=3D"mailto:kuiying.wang@intel.com"><span=
 style=3D"font-size:11.0pt">kuiying.wang@intel.com</span></a></span><span l=
ang=3D"EN-US" style=3D"font-size:11.0pt"><br>
<b>Cc:</b> </span><span lang=3D"EN-US"><a href=3D"mailto:openbmc@lists.ozla=
bs.org"><span style=3D"font-size:11.0pt">openbmc@lists.ozlabs.org</span></a=
></span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><br>
<b>Subject:</b> Please help provide some examples for how to use smbios-mdr=
 via intel-ipmi-oem<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please help provide some exampl=
es for how to use smbios-mdr via intel-ipmi-oem,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">maybe it=A1=A6s a lots series i=
ntel-ipmi-oem, <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I want to know how to send a sm=
bios file via function =A1=A5storeDatatoFlash=A1=A6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">and then smbios-mdr functions w=
ill to read smbios file via function =A1=A5readDataFromFlash=A1=A6<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">below links is reference from u=
pstream,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/smbios-mdr">https://github.com/openbmc/smbios-mdr</a><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/intel-ipmi-oem">https://github.com/openbmc/intel-ipmi-oem</a><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Bruce.<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_a283f7ff49df470095e138aeda7d5fbcquantatwcom_--
