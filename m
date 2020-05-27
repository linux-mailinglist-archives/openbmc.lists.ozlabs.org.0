Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A37841E3CF5
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 11:00:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X4YT48yZzDqRy
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 19:00:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X4XV64GdzDqPk
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 18:59:45 +1000 (AEST)
IronPort-SDR: ag6o1R18aryl39fPA6e6HHW+AyhnYhnMoy9nvG48PFvAmy53yJCqIdIyxnRzLKJEA9MSlmKTCQ
 2C0gpZ5IDLmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 01:59:42 -0700
IronPort-SDR: mlIRLsrMtfCZMot+fwxJNzMgzi026NjJ6js0RI3/b/BUpI6yXezn/2q2Qmvjm2ivD8AutI+PU5
 IVy0pd+uxhBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
 d="scan'208,217";a="256710108"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 27 May 2020 01:59:42 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 01:59:41 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 16:59:39 +0800
Received: from shsmsx602.ccr.corp.intel.com ([10.109.6.142]) by
 SHSMSX602.ccr.corp.intel.com ([10.109.6.142]) with mapi id 15.01.1713.004;
 Wed, 27 May 2020 16:59:39 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: ? ?? <zhouyuanqing8@outlook.com>, Vijay Khemka <vijaykhemka@fb.com>
Subject: RE: About FRU
Thread-Topic: About FRU
Thread-Index: AdYz/Jgsd22LDGcdRYWJMXa/QfCfZwAAWgr8AAGgPQA=
Date: Wed, 27 May 2020 08:59:39 +0000
Message-ID: <246516f0376a44259dad1d0a037f0d4f@intel.com>
References: <29eb06b1954a4aac802d69ee7e667ae2@intel.com>
 <HK2PR04MB3826F292E77DB3333854C473FEB10@HK2PR04MB3826.apcprd04.prod.outlook.com>
In-Reply-To: <HK2PR04MB3826F292E77DB3333854C473FEB10@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.36]
Content-Type: multipart/alternative;
 boundary="_000_246516f0376a44259dad1d0a037f0d4fintelcom_"
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

--_000_246516f0376a44259dad1d0a037f0d4fintelcom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RW50aXR5LW1hbmFnZSBleHBvc2VkIEZSVSBpbnRvIGRidXMuDQpDb3VsZCBnZXQgdGhlbSBmcm9t
IGRidXMgcHJvcGVydGllcyBsaWtlIGJlbG93Og0KDQpyb290QGludGVsLW9ibWM6fiMgYnVzY3Rs
IHRyZWUgLS1uby1wYWdlciB4eXoub3BlbmJtY19wcm9qZWN0LkZydURldmljZQ0KYC0veHl6DQog
IGAtL3h5ei9vcGVuYm1jX3Byb2plY3QNCiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURl
dmljZQ0KICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvUFNTRjEzMjIwMkEN
CiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlL1MyNjAwV0ZUDQoNCnJvb3RA
aW50ZWwtb2JtYzp+IyBidXNjdGwgaW50cm9zcGVjdCAtLW5vLXBhZ2VyIHh5ei5vcGVuYm1jX3By
b2plY3QuRnJ1RGV2aWNlIC94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS9QU1NGMTMyMjAy
QQ0KTkFNRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRSAgICAgIFNJR05BVFVS
RSBSRVNVTFQvVkFMVUUgICAgICAgICAgICAgICAgICAgICAgICBGTEFHUw0KLkNvbW1vbl9Gb3Jt
YXRfVmVyc2lvbiAgICAgICAgICAgICAgcHJvcGVydHkgIHMgICAgICAgICAiMSIgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBlbWl0cy1jaGFuZ2UNCi5QUk9EVUNUX0xBTkdVQUdFX0NP
REUgICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgIjI1IiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZW1pdHMtY2hhbmdlDQouUFJPRFVDVF9NQU5VRkFDVFVSRVIgICAgICAg
ICAgICAgICBwcm9wZXJ0eSAgcyAgICAgICAgICJ4eHh4eC4sIExURC4gICAgICAgICAgICAgICAg
ICAiIGVtaXRzLWNoYW5nZQ0KLlBST0RVQ1RfUEFSVF9OVU1CRVIgICAgICAgICAgICAgICAgcHJv
cGVydHkgIHMgICAgICAgICAieHh4eHh4eHgiICAgICAgICAgICAgICAgICAgICAgICAgZW1pdHMt
Y2hhbmdlDQouUFJPRFVDVF9QUk9EVUNUX05BTUUgICAgICAgICAgICAgICBwcm9wZXJ0eSAgcyAg
ICAgICAgICJQeHh4eHgwMkEiICAgICAgICAgICAgICAgICAgICAgICBlbWl0cy1jaGFuZ2UNCi5Q
Uk9EVUNUX1NFUklBTF9OVU1CRVIgICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgIkNO
U3h4eHh4MDI3OSIgICAgICAgICAgICAgICAgIGVtaXRzLWNoYW5nZQ0KLlBST0RVQ1RfVkVSU0lP
TiAgICAgICAgICAgICAgICAgICAgcHJvcGVydHkgIHMgICAgICAgICAiMDBBIiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbWl0cy1jaGFuZ2UNCg0KDQpUaGFua3MsDQpLd2luLg0KDQoN
CkZyb206INbcINS2x+UgW21haWx0bzp6aG91eXVhbnFpbmc4QG91dGxvb2suY29tXQ0KU2VudDog
V2VkbmVzZGF5LCBNYXkgMjcsIDIwMjAgNDozMyBQTQ0KVG86IFdhbmcsIEt1aXlpbmcgPGt1aXlp
bmcud2FuZ0BpbnRlbC5jb20+OyBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCkNj
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6ILvYuLQ6IEFib3V0IEZSVQ0KDQpI
aQ0KDQogICAgIE15IHByb2plY3QgdXNlcyBwaG9zcGhvci1mcnUsIGFuZCBhIHBob3NwaG9yLXJl
YWQtZWVwcm9tIGlzIGdlbmVyYXRlZCBkdXJpbmcgY29tcGlsYXRpb24uIEkgdGhpbmsgd2hlbiBv
cGVuYm1jIHN0YXJ0cywgcGhvc3Bob3ItcmVhZC1lZXByb20gd2lsbCByZWFkIHRoZSBjb25maWd1
cmF0aW9uIGluZm9ybWF0aW9uIG9mIGVlcHJvbSBmcm9tIGEgY29uZmlndXJhdGlvbiBmaWxlIChz
dWNoIGFzIGkyYyBjaGFubmVsIG51bWJlciwgaTJjIGFkZHJlc3MpLCBhbmQgdGhlbiByZWFkIEZS
VSBpbmZvcm1hdGlvbiBmcm9tIGVlcHJvbS4NCiAgICAgSWYgdGhlIGVudGl0eS1tYW5hZ2VyIG1v
ZHVsZSBpcyB1c2Vko6xhZGQganNvbiBjb25maWd1cmF0aW9uIGZpbGUgZm9yIG15IGRldmljZSBp
bnRvIGVudGl0eS1tYW5hZ2VyLiB0aGVuIEkgdXNlIHRoZSBwaG9zaG9yLWZydSBtZXRob2QsIGlu
IHdoaWNoIGNvbmZpZ3VyYXRpb24gZmlsZSBzaG91bGQgSSBjb25maWd1cmUgdGhlIGVlcHJvbSBp
bmZvcm1hdGlvbj8NCg0KICAgICBwaG9zcGhvci1yZWFkLWVlcHJvbSB3aWxsIGV4aXRzIGFmdGVy
IHJlYWRpbmcgdGhlIGVlcHJvbSBpbmZvcm1hdGlvbiwgc28gaG93IGlzIHRoZSBGUlUgaW5mb3Jt
YXRpb24gcmVhZCB0byB0aGUgSVBNSSBwcm9jZXNzo78NCg0KVGhhbmtzDQpIYXJsZXkNCg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBXYW5nLCBLdWl5aW5nIDxr
dWl5aW5nLndhbmdAaW50ZWwuY29tPG1haWx0bzprdWl5aW5nLndhbmdAaW50ZWwuY29tPj4NCrei
y83KsbzkOiAyMDIwxOo11MIyN8jVIDE1OjU4DQrK1bz+yMs6IHpob3V5dWFucWluZzhAb3V0bG9v
ay5jb208bWFpbHRvOnpob3V5dWFucWluZzhAb3V0bG9vay5jb20+IDx6aG91eXVhbnFpbmc4QG91
dGxvb2suY29tPG1haWx0bzp6aG91eXVhbnFpbmc4QG91dGxvb2suY29tPj4NCrOty806IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPiA8b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+Pg0K
1vfM4jogUkU6IEFib3V0IEZSVQ0KDQoNCkhpIEhhcmxleSwNCg0KWW91IGNvdWxkIGFkZCBqc29u
IGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgeW91ciBkZXZpY2UgaW50byBlbnRpdHktbWFuYWdlciBh
cyBiZWxvdzoNCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvdHJl
ZS9tYXN0ZXIvY29uZmlndXJhdGlvbnMNCg0KDQoNCg0KDQpUaGFua3MsDQoNCkt3aW4uDQoNCg0K
DQoNCg0KSGVsbG8gZXZlcnlvbmUsDQoNCg0KDQogICAgICAgTXkgbW90aGVyYm9hcmQgaGFzIGFu
IEVFUFJPTSBkZXZpY2UgdG8gc3RvcmUgRlJVIHJlbGF0ZWQgaW5mb3JtYXRpb24uIEhvdyBjYW4g
SSBjb25maWd1cmUgaXQgaW4gdGhlIG9wZW5ibWMgY29uZmlndXJhdGlvbiBmaWxlIHRvIHNlZSB0
aGlzIEZSVSBpbmZvcm1hdGlvbiB0aHJvdWdoIHRoZSBpcG1pdG9vbCBmcnUgcHJpbnQgY29tbWFu
ZD8NCg0KDQoNCkFyZSB0aGVyZSBzb21lIGV4YW1wbGVzIHRvIHByb3ZpZGUgcmVmZXJlbmNlLCBJ
IGRpZCBub3QgZmluZCBhIHBsYWNlIHRvIGNvbmZpZ3VyZSB0aGUgZWVwcm9tIGRldmljZSBpbiB0
aGUgb3BlbmJtYyBwcm9qZWN0Pw0KDQoNCg0KSXMgdGhlcmUgYW55IGRvY3VtZW50YXRpb24gYWJv
dXQgRlJVIGluZGljYXRpbmcgdGhhdCB0aGUgbW9kdWxlIHJlYWRzIGFuZCBwYXJzZXMgaW5mb3Jt
YXRpb24gZnJvbSBlZXByb20sIGFuZCB0aGVuIGl0IGNhbiBiZSByZWFkIGJ5IHRoZSBpcG1pdG9v
bCBmcnUgcHJpbnQgY29tbWFuZD8gV2hhdCBpcyB0aGUgcHJvY2VzcyBsaWtlPw0KDQoNCg0KVGhh
bmtzDQoNCkhhcmxleQ0KDQoNCg0KDQo=

--_000_246516f0376a44259dad1d0a037f0d4fintelcom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Entity-manage exposed FRU into dbus.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Could get them from dbus properties l=
ike below:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">root@intel-obmc:~# busctl tree --no-pager xyz.op=
enbmc_project.FruDevice<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">`-/xyz<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">&nbsp; `-/xyz/openbmc_project<o:p></o:p></span><=
/i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">&nbsp;&nbsp;&nbsp; `-/xyz/openbmc_project/FruDev=
ice<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |-/xyz/openbmc_pr=
oject/FruDevice/PSSF132202A<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-/xyz/openbmc_pr=
oject/FruDevice/S2600WFT<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">root@intel-obmc:~# busctl introspect --no-pager =
xyz.openbmc_project.FruDevice /xyz/openbmc_project/FruDevice/PSSF132202A<o:=
p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; SIGNATURE RESULT/VALUE&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FLAGS<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.Common_Format_Version&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; property&nbsp; s&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;1&quot;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; emits-change<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.PRODUCT_LANGUAGE_CODE&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; property&nbsp; s&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;25&quot;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp;emits-change<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.PRODUCT_MANUFACTURER&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; property&nbsp; s&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;xxxxx., LTD.&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot; emits-change<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.PRODUCT_PART_NUMBER&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; property&nbs=
p; s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;xxxxxxxx&quot;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emits-change<=
o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.PRODUCT_PRODUCT_NAME&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property&nbsp; s&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Pxxxxx02A&quot;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emits-change<o:p></o:p>=
</span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.PRODUCT_SERIAL_NUMBER&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; property&nbsp; s&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CNSxxxxx0279&quot;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; emits-change<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">.PRODUCT_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; property&nbsp; s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;00A&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change<o:p></o:p></span><=
/i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Kwin.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif">
</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt">=D6=DC</span><span l=
ang=3D"ZH-CN" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,san=
s-serif">
</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt">=D4=B6=C7=E5</span><=
span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">=
 [mailto:zhouyuanqing8@outlook.com]
<br>
<b>Sent:</b> Wednesday, May 27, 2020 4:33 PM<br>
<b>To:</b> Wang, Kuiying &lt;kuiying.wang@intel.com&gt;; Vijay Khemka &lt;v=
ijaykhemka@fb.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> </span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt">=BB=
=D8=B8=B4</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&q=
uot;,sans-serif">: About FRU<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Hi&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp;My project uses phosphor-fru, and a =
phosphor-read-eeprom is generated during compilation. I think when openbmc =
starts, phosphor-read-eeprom will read the configuration information
 of eeprom from a configuration file (such as i2c channel number, i2c addre=
ss), and then read FRU information from eeprom.<br>
&nbsp; &nbsp; &nbsp;</span>If the entity-manager module is used<span lang=
=3D"ZH-CN" style=3D"font-size:13.5pt;color:black;background:white">=A3=AC</=
span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"=
>add json configuration file for my device into entity-manager. then I
 use the phoshor-fru method, in which configuration file should I configure=
 the eeprom information?</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp; &nbsp;phosphor-read-eeprom will exits
<span style=3D"background:white">after reading the eeprom information</span=
>, so how is the FRU information read to the IPMI process</span><span lang=
=3D"ZH-CN" style=3D"color:black">=A3=BF</span><span style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Thanks<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Harley<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp; &nbsp;<o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;co=
lor:black">=B7=A2=BC=FE=C8=CB</span></b><b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif;color:black">:</span></b><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack">
 Wang, Kuiying &lt;<a href=3D"mailto:kuiying.wang@intel.com">kuiying.wang@i=
ntel.com</a>&gt;<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=B7=
=A2=CB=CD=CA=B1=BC=E4</span></b><b><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Calibri&quot;,sans-serif;color:black">:</span></b><span style=3D"=
font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> 2=
020</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=C4=
=EA</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif;color:black">5</span><span lang=3D"ZH-CN" style=3D"font-size:11.0=
pt;color:black">=D4=C2</span><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:black">27</span><span lang=3D"ZH-CN" sty=
le=3D"font-size:11.0pt;color:black">=C8=D5</span><span style=3D"font-size:1=
1.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">
 15:58<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=CA=
=D5=BC=FE=C8=CB</span></b><b><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:black">:</span></b><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">
<a href=3D"mailto:zhouyuanqing8@outlook.com">zhouyuanqing8@outlook.com</a> =
&lt;<a href=3D"mailto:zhouyuanqing8@outlook.com">zhouyuanqing8@outlook.com<=
/a>&gt;<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=B3=
=AD=CB=CD</span></b><b><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">:</span></b><span style=3D"font-size:11=
.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a> &l=
t;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&=
gt;<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=D6=
=F7=CC=E2</span></b><b><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">:</span></b><span style=3D"font-size:11=
.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> RE: About
 FRU</span> <o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">Hi Harley,<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">You could add json configuration file for your dev=
ice into entity-manager as below:<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif"><a href=3D"https://github.com/openbmc/entity-manag=
er/tree/master/configurations">https://github.com/openbmc/entity-manager/tr=
ee/master/configurations</a>
<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">Kwin.<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">Hello everyone,</span><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">&nbsp;</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;My mothe=
rboard has an EEPROM device to store FRU related information. How can I con=
figure it in the openbmc configuration file to see this FRU information thr=
ough
 the ipmitool fru print command?</span><span style=3D"font-size:11.0pt;font=
-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">&nbsp;</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">Are there some examples to provide reference,=
 I did not find a place to configure the eeprom device in the openbmc proje=
ct?</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">&nbsp;</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">Is there any documentation about FRU indicati=
ng that the module reads and parses information from eeprom, and then it ca=
n be read by the ipmitool fru print command? What
 is the process like?</span><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">&nbsp;</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">Thanks</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:10.0pt;font-family:&quot;C=
ourier New&quot;;color:black">Harley</span><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_246516f0376a44259dad1d0a037f0d4fintelcom_--
