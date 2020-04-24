Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFE1B6A61
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:39:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497b0r5N5bzDr5T
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 10:39:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.100;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=FcRpFzZl; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254100.outbound.protection.outlook.com [40.92.254.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497b054kYRzDqcR
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 10:39:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCTmDdYqZ2Gn9XiZD3geZyVCz/67GPI0BER40pciS7GL/Zg2OKMvHNE7ezDzqQGC3gDpDiCIzrR21Sl22R3Cp4P+FpTZATTjmDU0mU6BRNqBeh/r02dzZpUV05U7aL9QSAuspBJJx+qC+S8zGS3gsiPdqdn/ZW25bGS2EMnabyHm4H4vetO0W21MbcMkV8ZDVFAv7A8ckkWshQ2K6wZ8Cgb80Rj9YquyrsivOnICfzkB0AGoqnYrtRKwe+j5e9wv+ZicifMfpzOGdBKX35RhUXRUUQjiBYyfL02YvBzx3c8z0ahpu4Ft0bWFYpwZdRnETfWCtSqKL8FWvazjRkzZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkPPVg1WcRZzaaNuQ5DakWIdy4YyelYlJT/MwlBHNws=;
 b=EVUZ85wwXpByU3DETrST+VL66DSK9itYG9jAakpJPxLACCawo5zlwsWQ6E1f4aywrrznnomol49n0tZ1kMGdLva0BR75dgkeRWvxHs0dU8VTxpypN+nWMlmEODSnDCwQeL5Ni/NIS1uELthadr5rB1mYnuLtS8778lspEZoBfCZgM207Mzy1pLEDN6K02NFmKCgNoFWNV4BWTN6CgmOei//OexmsFDYwvDWqosQnrXSdaKhqZVxsuTZXvFqVn94rQYXFvEwNOte7yvEmPY/alR/VnT1iUg9fY/1IRATWDZEGbldbqi4Az1J4oTcFk2CIiS8pcqmgjHHDIHHRIbmoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkPPVg1WcRZzaaNuQ5DakWIdy4YyelYlJT/MwlBHNws=;
 b=FcRpFzZla42pkXIpUlERIhwS7YB4GcAIrQhfgDGU+q3+uMSCnmUVaq7s/8VSXcsK9irQuGiASfyny0SzbOD+Af8cWzA2jZUZj/yNadymW2FcKjFTLzcUa7K+2HTZ8sNutgRBW1NKMNSLm15Q2NicxUnLPfliIipoT3GKu7+kUP9zr6XpkijQIKNwZe3sjy3E1Ral68d0I7ewLkZYIwieud3+iIBOo0eLsjdmiiU7rwfcP8dDcba2rL3s/QovnUzxlWjRRPJOh4eH6C7KfveONrNJ0h5+WgOXiId/t+xVXUc911KyaMmQdiTHMtQUNWYdYPS/05AWBgHquOKlaSGUjg==
Received: from SG2APC01FT052.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::50) by
 SG2APC01HT053.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::375)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Fri, 24 Apr
 2020 00:39:11 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::4f) by SG2APC01FT052.mail.protection.outlook.com
 (2a01:111:e400:7ebd::270) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Fri, 24 Apr 2020 00:39:11 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2937.012; Fri, 24 Apr 2020
 00:39:11 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Brandon Wyman <bjwyman@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogYWJvdXQgb2JtYy1jaGFzc2lzLXBvd2Vyb2ZmQDAudGFyZ2V0IGFu?=
 =?gb2312?Q?d_obmc-host-start@0.target?=
Thread-Topic: =?gb2312?B?u9i4tDogYWJvdXQgb2JtYy1jaGFzc2lzLXBvd2Vyb2ZmQDAudGFyZ2V0IGFu?=
 =?gb2312?Q?d_obmc-host-start@0.target?=
Thread-Index: AQHWGX2mf7RFsVH2AUWbfHlv2bgIUqiHD7gAgABcL7o=
Date: Fri, 24 Apr 2020 00:39:11 +0000
Message-ID: <HK2PR04MB3826D854F723A17E5D8279D5FED00@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826B62C70CC3C90D4F8E452FED30@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <f4d0755f-4eda-34cb-fb86-1ba2c36c1858@gmail.com>
In-Reply-To: <f4d0755f-4eda-34cb-fb86-1ba2c36c1858@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:E983C66A424F9F204DF4B83040A161E1C2F16EFEF9B85D47D4C4EC9083ECD6A3;
 UpperCasedChecksum:51AD027162400FC4E3F5168665D6CCE27D1D98AAA02A92FA9DE097F0CDF8690A;
 SizeAsReceived:7131; Count:44
x-tmn: [Qnn9P47pH9morLwfOhWtlNJXYO6y4A8e]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 03cdcfa8-b566-43dc-dbd9-08d7e7e7e7ff
x-ms-traffictypediagnostic: SG2APC01HT053:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EyBxacQIjxXoEeHsU/MF5rYpgq/Rl/PUL1zXYRqHc5HpDATGABw9EIolQQDx13IolBZW8A2CAArwjZ4JuXnMDAA72JUapprLx9/wnnUehHFI4hCdv77mthRQHZyMyxPWgZkUWAshAp+fmjxNVfBwN2aB/7imu0m0cOk4mcBmztsvpFJQINvkr2gUKdLewPYF2p679E6bAs5afuy0pJqQmMj3cO8cfBdEVNuVgR8h4SAYuYSZPUa9ZiyyN+rf3/gn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: ZtZjgKVHZJHZbQEzJpIPwZ9ccVGrfXAvVLQ/r71DWda3te/snPCFQy0SOsCTOf35iyiKEW09SjrO0YDRsbya2tkOB2jHlMDcqNBnVFoV9yMsMs+31bqXUDL4aXkXMRty35Q72QuRfUL+QJoFjdh6Jg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826D854F723A17E5D8279D5FED00HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cdcfa8-b566-43dc-dbd9-08d7e7e7e7ff
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 00:39:11.1371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT053
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

--_000_HK2PR04MB3826D854F723A17E5D8279D5FED00HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCiAgICBJIGhhdmUgcmVhZCB0aGlzIGRvY3VtZW50IG9wZW5ibWMtc3lzdGVtZC5tZCwg
d2hpY2ggbWFpbmx5IGZvY3VzZXMgb24gaG93IHRvIG9wZXJhdGUgcG93ZXIgb24gYW5kIG9mZi4g
SSB3YW50IHRvIHVuZGVyc3RhbmQgdGhlIGltcGxlbWVudGF0aW9uIG1lY2hhbmlzbSBhbmQgbWF5
IG5lZWQgdG8gZGVsdmUgaW50byB0aGUgY29kZSBkZXRhaWxzLg0KDQogICAgRm9yIGV4YW1wbGUs
IGF0IHRoZSBsZXZlbCBvZiBjb2RlIGltcGxlbWVudGF0aW9uLCB0aHJvdWdoIHJlc3RmdWwgc2Vu
ZGluZyBhIHBvd2VyLW9uIGFuZCBwb3dlci1vZmYgY29tbWFuZCB0byBCTUMsIHdoYXQgaXMgdGhl
IGZsb3cgb2YgQk1DIHRvIGltcGxlbWVudCBwb3dlci1vbiBhbmQgcG93ZXItb2ZmIGFjdGlvbnM/
DQoNCiAgICBUaGFua3MNCg0KICAgIEhhcmxleQ0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQq3orz+yMs6IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt6aG91eXVhbnFpbmc4
PW91dGxvb2suY29tQGxpc3RzLm96bGFicy5vcmc+ILT6se0gQnJhbmRvbiBXeW1hbiA8Ymp3eW1h
bkBnbWFpbC5jb20+DQq3osvNyrG85DogMjAyMMTqNNTCMjTI1SAyOjU5DQrK1bz+yMs6IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K1vfM4jogUmU6
IGFib3V0IG9ibWMtY2hhc3Npcy1wb3dlcm9mZkAwLnRhcmdldCBhbmQgb2JtYy1ob3N0LXN0YXJ0
QDAudGFyZ2V0DQoNCg0KRG9lcyB0aGlzIGhlbHAgdW5kZXJzdGFuZCBpdCBiZXR0ZXI/DQoNCg0K
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9hcmNoaXRlY3R1cmUv
b3BlbmJtYy1zeXN0ZW1kLm1kDQoNCg0KT24gMjAyMC0wNC0yMyAwOTo0NywgemhvdXl1YW5xaW5n
OEBvdXRsb29rLmNvbTxtYWlsdG86emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbT4gd3JvdGU6DQpI
aaOsDQoNCiAgICAgICBBYm91dCAib2JtYy1jaGFzc2lzLXBvd2Vyb2ZmQDAudGFyZ2V0IjxtYWls
dG86b2JtYy1jaGFzc2lzLXBvd2Vyb2ZmQDAudGFyZ2V0PiBhbmQgIm9ibWMtaG9zdC1zdGFydEAw
LnRhcmdldCI8bWFpbHRvOm9ibWMtaG9zdC1zdGFydEAwLnRhcmdldD4gaG93IHRoZXNlIHR3byB0
YXJnZXRzIGFyZSBjYWxsZWQsIHBsZWFzZSBoZWxwIHRvIGFuc3dlciwgdGhhbmsgeW91Lg0KICAg
ICAgSSB1c2UgdGhlIHN5c3RlbWN0bCBsaXN0LWRlcGVuZGVuY2llcyBjb21tYW5kIGFuZCBJIGNh
bqGvdCBzZWUgd2hvIGlzIGNhbGxpbmcgdGhlbS4NCg0KVGhhbmtzDQpoYXJsZXkNCg0K

--_000_HK2PR04MB3826D854F723A17E5D8279D5FED00HK2PR04MB3826apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; I have read this document openbmc-systemd.md, which mainly fo=
cuses on how to operate power on and off. I want to understand the implemen=
tation mechanism and may need to delve into the code details.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;&nbsp;For example, at the level of code implementation, throug=
h restful sending a power-on and power-off command to BMC, what is the flow=
 of BMC to implement power-on and power-off actions?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);">&nbsp; &nbsp; Than=
ks</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);">&nbsp; &nbsp; Harl=
ey</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> openbmc=
 &lt;openbmc-bounces&#43;zhouyuanqing8=3Doutlook.com@lists.ozlabs.org&gt; =
=B4=FA=B1=ED Brandon Wyman &lt;bjwyman@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA4=D4=C224=C8=D5 2:59<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: about obmc-chassis-poweroff@0.target and obmc-host=
-start@0.target</font>
<div>&nbsp;</div>
</div>
<div>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Does this help understand=
 it better?</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><a class=3D"x_moz-txt-lin=
k-freetext" href=3D"https://github.com/openbmc/docs/blob/master/architectur=
e/openbmc-systemd.md">https://github.com/openbmc/docs/blob/master/architect=
ure/openbmc-systemd.md</a></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><br>
</p>
<div class=3D"x_moz-cite-prefix">On 2020-04-23 09:47, <a class=3D"x_moz-txt=
-link-abbreviated" href=3D"mailto:zhouyuanqing8@outlook.com">
zhouyuanqing8@outlook.com</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi=A3=AC&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp;About <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:obmc-chassis-poweroff@0.target">
&quot;obmc-chassis-poweroff@0.target&quot;</a> and <a class=3D"x_moz-txt-li=
nk-rfc2396E" href=3D"mailto:obmc-host-start@0.target">
&quot;obmc-host-start@0.target&quot;</a> how these two targets are called, =
please help to answer, thank you.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;&nbsp;I use the systemctl list-dependencies command and=
 I can=A1=AFt see who is calling them.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
harley</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB3826D854F723A17E5D8279D5FED00HK2PR04MB3826apcp_--
