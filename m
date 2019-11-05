Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC364EF7A5
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 09:59:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476kB71LFJzF395
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 19:59:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=2050a2899=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 476k9J0ZMVzF30y
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 19:58:39 +1100 (AEDT)
IronPort-SDR: RnOjqdJT/4Alf3JJbBItc9TtL9z4mpTxn/Xu9NWiMa8woexr39NYO5pbS9HqOvwpBzuthg9RGM
 SBwtfHw5Ov+A==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 05 Nov 2019 16:58:37 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 5 Nov 2019
 16:58:35 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 5 Nov 2019 16:58:35 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: Questions about openbmc-test-automation
Thread-Topic: Questions about openbmc-test-automation
Thread-Index: AdWTti27hCt8Gg0PRByoyfDQiVK6aw==
Date: Tue, 5 Nov 2019 08:58:35 +0000
Message-ID: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25022.005
x-tm-as-result: No-10--17.202000-5.000000
x-tmase-matchedrid: oMBNC5/fKrUYcyu6gJU0i/0peXGEEBlvmHAp2UJ8+TxXG3yI9k2vbIfN
 L7D/HMEOxCW4LIIVzgLZPU+b5RcHaHzrWhwAg+mwydRP56yRRA/QTttTsZbKLwNPGPNKJEnBevR
 Ae5P8R94/+RSNQ9LGXlDQ43dkW3a5LDC3FGTHI3eJnby99YW5ri1EqEtV44uyIW0Uk+MayvKUDJ
 fmougLGkROup+YwYJBMX22bwzVsftkHsVpDopD3zVUc/h8Ki+ClW5IpDb7CXSISI683skDCoS96
 wkOlNPki+Nq8zYdAzS85VVIv5bxZlIeiyfGop1wcTela9PpnnxDfut2Lc1Yh7xgMf9QE2ebc3wu
 qc+4Wow8MwCgiSCug3lySYZqUQo4lhYxVCTK0uMOsNNBnlgRWuuLFZZYlisfJojUXLQhKQ5MWNy
 akMqo3PsbBVtZQfO5fqlkMvBQuzIUqjS1vZmflHMSlLDES54jOIDptNW79f18iUrfE0YbHtjt2T
 ZsWo0o
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--17.202000-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25022.005
x-tm-snts-smtp: 46E381FEAB1A5FAAD703C7BB704A2172D25592D8AB7D5B0F9BDB6F8E800A79712000:B
Content-Type: multipart/alternative;
 boundary="_000_937d3cf0ee5b42559e145fbf87c5c9b3quantatwcom_"
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

--_000_937d3cf0ee5b42559e145fbf87c5c9b3quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgUmFodWwsDQoNCkknbSB3b25kZXJpbmcgdGhhdCB3aHkgIlJFREZJU0hfTldfRVRIMCIgaXMg
aGFyZGNvZGUgYXMgIk1hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMvZXRoMC8iIGluIC9k
YXRhL3ZhcmlhYmxlcy5weQ0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy10ZXN0
LWF1dG9tYXRpb24vYmxvYi9tYXN0ZXIvZGF0YS92YXJpYWJsZXMucHkjTDE1NQ0KRnVydGhlcm1v
cmUsIHRoZSBjb21tYW5kICJsYW4gcHJpbnQiIGRpZG4ndCBzcGVjaWZ5IHRoZSBjaGFubmVsIG51
bWJlciBpbiAvaXBtaS90ZXN0X2lwbWlfbmV0d29yay5yb2JvdC4NClRoZXJlZm9yZSwgdGhlIGRl
ZmF1bHQgd2lsbCBwcmludCBpbmZvcm1hdGlvbiBvbiB0aGUgZmlyc3QgZm91bmQgTEFOIGNoYW5u
ZWwuDQoNCklzbid0IGl0IG1vcmUgcmVhc29uYWJsZSB0byBzZXQgdGhlIGludGVyZmFjZSBhbmQg
dGhlIGNoYW5uZWwgbnVtYmVyIGFzIGVudmlyb25tZW50IHZhcmlhYmxlcyBhbmQgZ2l2ZSB0aGVt
IGRlZmF1bHQgdmFsdWVzPw0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcywNClRvbnkNCg0K

--_000_937d3cf0ee5b42559e145fbf87c5c9b3quantatwcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Rahul,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I'm wondering that why &quot;RE=
DFISH_NW_ETH0&quot; is hardcode as &quot;Managers/bmc/EthernetInterfaces/et=
h0/&quot; in /data/variables.py<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/openbmc-test-automation/blob/master/data/variables.py#L155">https://=
github.com/openbmc/openbmc-test-automation/blob/master/data/variables.py#L1=
55</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Furthermore, the command &quot;=
lan print&quot; didn't specify the channel number in /ipmi/test_ipmi_networ=
k.robot.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Therefore, the default will pri=
nt information on the first found LAN channel.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Isn't it more reasonable to set=
 the interface and the channel number as environment variables and give the=
m default values?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tony<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_937d3cf0ee5b42559e145fbf87c5c9b3quantatwcom_--
