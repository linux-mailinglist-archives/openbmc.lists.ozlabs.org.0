Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD12738F5
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:56:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwQtS134zzDqXs
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 12:56:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=52614246a=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Mon, 21 Sep 2020 19:43:47 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bvzz70Qh0zDqW9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 19:43:45 +1000 (AEST)
IronPort-SDR: s4dqtl5aHyPlen+aR6Yr/Y9kveaUIL483SkhoabbbY8j2CjcMfezs1xyUg2H70ASE9ALW03PNv
 0pBtV10C2xHg==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 21 Sep 2020 17:42:33 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 21 Sep
 2020 17:42:32 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.2044.004;
 Mon, 21 Sep 2020 17:42:32 +0800
From: =?big5?B?QnJ1Y2UgTGVlICin9an7rm0p?= <Bruce_Lee@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>
Subject: openbmc/phosphor-health-monitor issues, please help check.
Thread-Topic: openbmc/phosphor-health-monitor issues, please help check.
Thread-Index: AdaP+qAU19qmxe8iRreIUeV0xTABgg==
Date: Mon, 21 Sep 2020 09:42:32 +0000
Message-ID: <bcec42e287d64978a3c648745b8b4322@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/related;
 boundary="_005_bcec42e287d64978a3c648745b8b4322quantatwcom_";
 type="multipart/alternative"
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Sep 2020 12:55:29 +1000
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

--_005_bcec42e287d64978a3c648745b8b4322quantatwcom_
Content-Type: multipart/alternative;
	boundary="_000_bcec42e287d64978a3c648745b8b4322quantatwcom_"

--_000_bcec42e287d64978a3c648745b8b4322quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgVmlqYXksDQoNCkkgZm91bmQgb25lIHF1ZXN0aW9uIGluIG9wZW5ibWMvcGhvc3Bob3ItaGVh
bHRoLW1vbml0b3INClRoZSBzZXJ2aWNlIGhlYWx0aE1vbiB2aWEgYWJvdmUgZnVuY3Rpb25zIGNy
ZWF0ZWQgaGFzIG5vdCB0aGUgb3JnLmZyZWVkZXNrdG9wLkRCdXMuT2JqZWN0TWFuYWdlciBvbiB0
aGUgcm9vdCwNCmFuZCB0aGlzIHdpbGwgY2F1c2UgdGhlIHNlbnNvciBub3QgYmUgZ2VuZXJhdGVk
IGNvcnJlY3RseSB2aWEgcmVkZmlzaCB1cmwgL3JlZGZpc2gvdjEvQ2hhc3Npcy9jaGFzc2lzL1Nl
bnNvcnMvQ1BVLCAvcmVkZmlzaC92MS9DaGFzc2lzL2NoYXNzaXMvU2Vuc29ycy9NZW1vcnkNCkJl
Y2F1c2UgcmVkZmlzaCB3aWxsIG1ldGhvZCBHZXRTdWJUcmVlIHRvIGNvbGxlY3Qgc2Vuc29ycyB2
aWEgb3JnLmZyZWVkZXNrdG9wLkRCdXMuT2JqZWN0TWFuYWdlcg0KSSBmb3VuZCBhIHNvbHV0aW9u
IGZvciB5b3VyIHJlZmVyZW5jZSBhbmQgc2hvdyBhdCBiZWxsb3csIHlvdSBjYW4gdXNlIHNkYnVz
cGx1cy9zZXJ2ZXIvbWFuYWdlci5ocHAgd2hpY2ggcHJvdmlkZSBhIGZ1bmN0aW9uIHRvIGFkZCBP
YmplY3RNYW5hZ2VyIG9uIHRoZSByb290Lg0KSGVuY2UsIEkgY2FuIGdldCBDUFUsIE1lbW9yeSBp
bmZvcm1hdGlvbiBjb3JyZWN0bHkgdmlhIHJlZGZpc2ggdXJsIC9yZWRmaXNoL3YxL0NoYXNzaXMv
Y2hhc3Npcy9TZW5zb3JzL0NQVSwgL3JlZGZpc2gvdjEvQ2hhc3Npcy9jaGFzc2lzL1NlbnNvcnMv
TWVtb3J5DQoNCiNpbmNsdWRlIDxzZGJ1c3BsdXMvc2VydmVyL21hbmFnZXIuaHBwPg0KDQpjbGFz
cyBIZWFsdGhNb24NCnsNCiAgcHVibGljOg0KICAgIEhlYWx0aE1vbigpID0gZGVsZXRlOw0KICAg
IEhlYWx0aE1vbihjb25zdCBIZWFsdGhNb24mKSA9IGRlbGV0ZTsNCiAgICBIZWFsdGhNb24mIG9w
ZXJhdG9yPShjb25zdCBIZWFsdGhNb24mKSA9IGRlbGV0ZTsNCiAgICBIZWFsdGhNb24oSGVhbHRo
TW9uJiYpID0gZGVsZXRlOw0KICAgIEhlYWx0aE1vbiYgb3BlcmF0b3I9KEhlYWx0aE1vbiYmKSA9
IGRlbGV0ZTsNCiAgICB2aXJ0dWFsIH5IZWFsdGhNb24oKSA9IGRlZmF1bHQ7DQoNCiAgICAvKiog
QGJyaWVmIENvbnN0cnVjdHMgSGVhbHRoTW9uDQogICAgICoNCiAgICAgKiBAcGFyYW1baW5dIGJ1
cyAgICAgLSBIYW5kbGUgdG8gc3lzdGVtIGRidXMNCiAgICAgKi8NCiAgICBIZWFsdGhNb24oc2Ri
dXNwbHVzOjpidXM6OmJ1cyYgYnVzKSA6IGJ1cyhidXMpDQogICAgew0KICAgICAgICAvLyByZWFk
IGpzb24gZmlsZQ0KICAgICAgICBzZW5zb3JDb25maWdzID0gZ2V0SGVhbHRoQ29uZmlnKCk7DQog
ICAgICAgIGNyZWF0ZUhlYWx0aFNlbnNvcnMoKTsNCiAgICAgICAgYWRkX21hbmFnZXIoIi8iKTsN
CiAgICB9DQoNCiAgICAvKiogQGJyaWVmIFBhcnNpbmcgSGVhbHRoIGNvbmZpZyBKU09OIGZpbGUg
ICovDQogICAgSnNvbiBwYXJzZUNvbmZpZ0ZpbGUoc3RkOjpzdHJpbmcgY29uZmlnRmlsZSk7DQoN
CiAgICAvKiogQGJyaWVmIHJlYWRpbmcgY29uZmlnIGZvciBlYWNoIGhlYWx0aCBzZW5zb3IgY29t
cG9uZW50ICovDQogICAgdm9pZCBnZXRDb25maWdEYXRhKEpzb24mIGRhdGEsIEhlYWx0aENvbmZp
ZyYgY2ZnKTsNCg0KICAgIC8qKiBAYnJpZWYgTWFwIG9mIHRoZSBvYmplY3QgSGVhbHRoU2Vuc29y
ICovDQogICAgc3RkOjp1bm9yZGVyZWRfbWFwPHN0ZDo6c3RyaW5nLCBzdGQ6OnNoYXJlZF9wdHI8
SGVhbHRoU2Vuc29yPj4NCiAgICAgICAgaGVhbHRoU2Vuc29yczsNCg0KICAgIC8qKiBAYnJpZWYg
Q3JlYXRlIHNlbnNvcnMgZm9yIGhlYWx0aCBtb25pdG9yaW5nICovDQogICAgdm9pZCBjcmVhdGVI
ZWFsdGhTZW5zb3JzKCk7DQoNCiAgICB2b2lkIGFkZF9tYW5hZ2VyKGNvbnN0IHN0ZDo6c3RyaW5n
JiBwYXRoKQ0KICAgIHsNCiAgICAgICAgbWFuYWdlcnNfLmVtcGxhY2VfYmFjaygNCiAgICAgICAg
ICAgIHN0ZDo6bWFrZV91bmlxdWU8c2RidXNwbHVzOjpzZXJ2ZXI6Om1hbmFnZXI6Om1hbmFnZXI+
KA0KICAgICAgICAgICAgICAgIHNkYnVzcGx1czo6c2VydmVyOjptYW5hZ2VyOjptYW5hZ2VyKA0K
ICAgICAgICAgICAgICAgIGJ1cywgcGF0aC5jX3N0cigpKSkpOw0KICAgIH0NCiAgcHJpdmF0ZToN
CiAgICBzZGJ1c3BsdXM6OmJ1czo6YnVzJiBidXM7DQogICAgc3RkOjp2ZWN0b3I8SGVhbHRoQ29u
ZmlnPiBzZW5zb3JDb25maWdzOw0KICAgIHN0ZDo6dmVjdG9yPEhlYWx0aENvbmZpZz4gZ2V0SGVh
bHRoQ29uZmlnKCk7DQogICAgc3RkOjp2ZWN0b3I8c3RkOjp1bmlxdWVfcHRyPHNkYnVzcGx1czo6
c2VydmVyOjptYW5hZ2VyOjptYW5hZ2VyPj4gbWFuYWdlcnNfOw0KfTsNCg0KVGhpcyBwaWMgaXMg
dGhlIGFkZCBvcmcuZnJlZWRlc2t0b3AuREJ1cy5PYmplY3RNYW5hZ2VyIG9uIHRoZSByb290IGZv
ciByZWZlcmVuY2UuDQpbY2lkOmltYWdlMDAzLmpwZ0AwMUQ2OTAzRS45NEI2MzZGMF0NCg0KW2Np
ZDppbWFnZTAwNC5qcGdAMDFENjkwM0UuOTRCNjM2RjBdDQoNCkJlc3QgUmVnYXJkcywNCkJydWNl
DQoNCg==

--_000_bcec42e287d64978a3c648745b8b4322quantatwcom_
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
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:Roboto;}
@font-face
	{font-family:=B7L=B3n=A5=BF=B6=C2=C5=E9;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@=B7L=B3n=A5=BF=B6=C2=C5=E9";}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif">Hi
<span style=3D"color:#212121;background:white">Vijay,<o:p></o:p></span></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Roboto;col=
or:#212121;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif">I found one question in
</span><u><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri Light&quo=
t;,sans-serif;color:#2A66D9;background:white">openbmc/phosphor-health-monit=
or<o:p></o:p></span></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif">The service healthMon via above functions creat=
ed<b> has not the org.freedesktop.DBus.ObjectManager on the root</b>,<br>
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri Light&quot;,=
sans-serif;background:white">and this will
<u>cause the sensor not be generated correctly</u> via redfish url <i>/redf=
ish/v1/Chassis/chassis/Sensors/CPU</i>,
<i>/redfish/v1/Chassis/chassis/Sensors/Memory<o:p></o:p></i></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif;background:white">Because redfish will method Ge=
tSubTree to collect sensors via
</span><b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri Light&quo=
t;,sans-serif">org.freedesktop.DBus.ObjectManager</span></b><span lang=3D"E=
N-US" style=3D"font-family:&quot;Calibri Light&quot;,sans-serif;background:=
white"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif;background:white">I found a solution for your re=
ference and show at bellow, you can use sdbusplus/server/manager.hpp which =
provide a function to add ObjectManager on the root.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif;background:white">Hence, I can get CPU, Memory i=
nformation correctly via redfish url
<i>/redfish/v1/Chassis/chassis/Sensors/CPU</i>, <i>/redfish/v1/Chassis/chas=
sis/Sensors/Memory</i><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">#include &lt;sdbusplus=
/server/manager.hpp&gt;</span><span lang=3D"EN-US" style=3D"font-size:8.0pt=
;font-family:Roboto;background:white"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Roboto;bac=
kground:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">class HealthMon<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp; public:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; HealthMon() =3D delete;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; HealthMon(const HealthMon=
&amp;) =3D delete;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; HealthMon&amp; operator=
=3D(const HealthMon&amp;) =3D delete;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; HealthMon(HealthMon&amp;&=
amp;) =3D delete;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; HealthMon&amp; operator=
=3D(HealthMon&amp;&amp;) =3D delete;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; virtual ~HealthMon() =3D =
default;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; /** @brief Constructs Hea=
lthMon<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp; *<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp; * @param[in] bus&nb=
sp;&nbsp;&nbsp;&nbsp; - Handle to system dbus<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; HealthMon(sdbusplus::bus:=
:bus&amp; bus) : bus(bus)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
/ read json file<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
ensorConfigs =3D getHealthConfig();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
reateHealthSensors();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">add_manager(&quot;/&=
quot;);</span><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; /** @brief Parsing Health=
 config JSON file&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; Json parseConfigFile(std:=
:string configFile);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; /** @brief reading config=
 for each health sensor component */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp; &nbsp;void getConfigData(Json&a=
mp; data, HealthConfig&amp; cfg);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; /** @brief Map of the obj=
ect HealthSensor */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; std::unordered_map&lt;std=
::string, std::shared_ptr&lt;HealthSensor&gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h=
ealthSensors;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; /** @brief Create sensors=
 for health monitoring */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; void createHealthSensors(=
);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">void add_manager(con=
st std::string&amp; path)<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">&nbsp;&nbsp;&nbsp; {<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; managers_.emplace_back(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; std::make_unique&lt;sdbusplus:=
:server::manager::manager&gt;(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sdbusp=
lus::server::manager::manager(<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus, p=
ath.c_str())));<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:yellow;mso-highlight:yellow">&nbsp;&nbsp;&nbsp; }</=
span><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:Roboto;backg=
round:white"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp; private:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; sdbusplus::bus::bus&amp; =
bus;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; std::vector&lt;HealthConf=
ig&gt; sensorConfigs;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp; std::vector&lt;HealthConf=
ig&gt; getHealthConfig();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">std::vector&lt;std::=
unique_ptr&lt;sdbusplus::server::manager::manager&gt;&gt; managers_;</span>=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:Roboto;background:white">};<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Roboto;bac=
kground:white"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"background:white">This=
 pic is the add
</span><span lang=3D"EN-US">org.freedesktop.DBus.ObjectManager on the root =
for reference.</span><span lang=3D"EN-US" style=3D"background:white"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><img width=3D"526" height=3D"21=
2" style=3D"width:5.4791in;height:2.2083in" id=3D"=B9=CF=A4=F9_x0020_1" src=
=3D"cid:image003.jpg@01D6903E.94B636F0"></span><u><span lang=3D"EN-US" styl=
e=3D"font-family:Roboto;color:#2A66D9;background:white"><o:p></o:p></span><=
/u></p>
<p class=3D"MsoNormal"><u><span lang=3D"EN-US" style=3D"font-family:Roboto;=
color:#2A66D9;background:white"><o:p><span style=3D"text-decoration:none">&=
nbsp;</span></o:p></span></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><img width=3D"529" height=3D"36=
2" style=3D"width:5.5104in;height:3.7708in" id=3D"=B9=CF=A4=F9_x0020_2" src=
=3D"cid:image004.jpg@01D6903E.94B636F0"></span><u><span lang=3D"EN-US" styl=
e=3D"font-family:Roboto;color:#2A66D9;background:white"><o:p></o:p></span><=
/u></p>
<p class=3D"MsoNormal"><u><span lang=3D"EN-US" style=3D"font-family:Roboto;=
color:#2A66D9;background:white"><o:p><span style=3D"text-decoration:none">&=
nbsp;</span></o:p></span></u></p>
<p class=3D"MsoNormal"><strong><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri Light&quot;,sans-serif;background:white;font-weight:normal">Bes=
t Regards</span></strong><span lang=3D"EN-US" style=3D"font-family:&quot;Ca=
libri Light&quot;,sans-serif;background:white">,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri Light&quot;,sans-serif;background:white">Bruce<o:p></o:p></span></p>
<p class=3D"MsoNormal"><u><span lang=3D"EN-US" style=3D"font-family:Roboto;=
color:#2A66D9;background:white"><o:p><span style=3D"text-decoration:none">&=
nbsp;</span></o:p></span></u></p>
</div>
</body>
</html>

--_000_bcec42e287d64978a3c648745b8b4322quantatwcom_--

--_005_bcec42e287d64978a3c648745b8b4322quantatwcom_
Content-Type: image/jpeg; name="image003.jpg"
Content-Description: image003.jpg
Content-Disposition: inline; filename="image003.jpg"; size=26229;
	creation-date="Mon, 21 Sep 2020 09:42:32 GMT";
	modification-date="Mon, 21 Sep 2020 09:42:32 GMT"
Content-ID: <image003.jpg@01D6903E.94B636F0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCADUAg4DASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDyiPQ7
+TSxqIhUWh3BZHlRdxX7wAJySM9BUlx4c1W0ghlms3CzMqKAQzBmGVBUHKkjoCBmo7rUxcaLp9iI
yptGlYvnht5B6dsYrdn8aRCc3lpZMl5PcwXVyZJNyFougUYyAScnJPpQBmL4U1JdUs7G5jjga7k8
tJGlQpkHDDIOMjPTOafH4Uun1S5s2mhC27bWlRvMBJJCgBMkscHjrwc4qW88R2wexXTbOSOG1u2v
Ss8odmcleMgDCgKBVvT/ABDp0Wo3xVZreC7fzQZjv2sQ4ZSVGdpVyAQMg44NAGbP4R1SLULq1SFZ
DbIsskhcIqo2NrHdjHUdagj8OapLaS3MdtuiiLgkSL82z7xUZywHcrkVe1DxDFJHqFrDCPKmt4La
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
oooAKKKKAP/Z

--_005_bcec42e287d64978a3c648745b8b4322quantatwcom_
Content-Type: image/jpeg; name="image004.jpg"
Content-Description: image004.jpg
Content-Disposition: inline; filename="image004.jpg"; size=25741;
	creation-date="Mon, 21 Sep 2020 09:42:32 GMT";
	modification-date="Mon, 21 Sep 2020 09:42:32 GMT"
Content-ID: <image004.jpg@01D6903E.94B636F0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAFqAhEDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2aiuN
/wCFs+Ef+gm3/fiT/wCJqaL4m+F5hGY9QdhIxVcQSckDJHT0oA6yiuPi+KvhOaRI49SZncgKBBJy
T/wGpv8AhZXhkNIragV8vG8tC4AzyOcd6AOqorj2+KnhRYw7ahIEPAY20uD9DtqVfiZ4afdtu58o
oYj7JLnBOAcbaAOrrkfifPeW3ge6k06WeK58yII0BIf746Y5pv8AwtXwoYzJ/aEmwHBb7NLgH0zt
rm/HnjfQ/FPhO60zRr3zrtyjgNG0ahVYFiWYAAADvQBwFnr3iC40O4uF8Q6zLexF90Ed7tMKqAdz
KTuYdfu9NpzQt74zNxBEfE92v2iURwub2QCQbA+4eowR75OK5qO71HT4LqC3EZjXckk8cSOVDDBA
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
ACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA
KKKKACvbvg5/yJs3/X4//oKV4jXt3wc/5E2b/r8f/wBBSgDvaKKKAPlSiiigAooooAKKK1PDtlDq
WpmzmjDedDII237djhCynPTGRznjBNAGXRQwKsQcZBxwc0UAXLfVbq10+eyikAgn++u0HPTv+Art
9R1rRNV1BFubrzbeK6dtszlwS0QCMvAxGGXlfp2rzyigDtrQeHXvrz7QLNIn2oys4wv7s5dCAer/
AMK4x64qtPcWA8Nx29k+nq0klqyqf9YzBH8wyZ4wHPfsRjiuSooA7OWbR4df1GWY2FxFNcweUxJd
REWPmY9OPxFNnsrAeDZ7m2gttqIoSZlbzTN5xBwehGzH+c1x1KXYoELHaDkDPFC0A1V1ObWNZhm1
JrWQhWX/AEjKR4+Y87eepP44rKU7WBwDg5we9JRQB6JJr+nSXlu0l0PtMouZFc3BK23mKoWNXC/I
MhgMfdzXK+Int9R1nULu2uYdiCPqTmZsKrFeOecnJxxzWLRQB1/ifVbC78PwRW0yOS8LQxByTCqx
bXG0jCc44HXGa5CiigOgUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF
FABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFe3fBz/AJE2b/r8
f/0FK8Rr274Of8ibN/1+P/6ClAHe0UUUAfKlFOlikgfZNG8bYB2sMHB6U2gCS2iWe5jiaRYldgpd
gSFz3OOade2sljez2s23zIJGjbacjIODj8qS1ERuohO5ji3DewXOB9Ks65qP9ra3d3ozsllZkBAB
C5+UHHfGKAKNWbC/k06WSWFI2keJ4gzgnaGBUkc9cEjn1qtRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXt3wc/5E2b/AK/H/wDQUrxG
vbvg5/yJs3/X4/8A6ClAHe0UUUAfOHiXAh0hJA/2pLFBLuPQbmKjHUHaR19ulYdFFABRRRQAUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA
UUUUAFFFFABRRRQAUUUUAFFFFABRXX+DIkksrkuisRKOoz2rmtUAGrXYAwBM/A+prGFbmqShbY56
dfnqyp22KtFFFbHQFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV7d8HP+RNm/6/H/8A
QUrxGvXfhs7J4DYoxU/2g3Q4/gWgD06ioNzf3j+dFAH/2Q==

--_005_bcec42e287d64978a3c648745b8b4322quantatwcom_--
