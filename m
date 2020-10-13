Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C41928CB23
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 11:45:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9VzL5vRJzDqg9
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 20:45:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.27;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ttsn8AOg; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253027.outbound.protection.outlook.com [40.92.253.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9VyW4956zDqbf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 20:45:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luEAiA4AKBWCpA1XT12hRTUNKt5DcuEGVClkdieeMdrOCHV92/cj4CDMgDYdlXAaXWg5f9P18JPQaO1hO+NNWG7X3cCc1af489LP++W1rPZSN5MtBBl8sDPZLymOuZegWiuxccqS3v6WHeG2cSLBhNpU2DF/vdkUgf49TYjevpSy/or2katai5/brILCpnjO65lg5CQH69gpBaIwdlSjsnEpa2/vI15fHdpby2Kaw1b+Q3pVyhXcU/o0ciYlFSNlKfKQ9e8H4WhpplQhBx17HwQQkgUyKF2tlK8T237Xih6lLqTJ/BFSfHbXuzoMn84snMaIPCKCRW8XHlgauEOX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmAtzJ3jxoiktFkBh3u4PRKhmsaC7gcCmoEBuM39BWQ=;
 b=D2l/Trf7oNpiIdnl2vmrd70bDV5MQ8uP+7931oVTjBqk8vgsCruIZJrZjcfOYlPa7ZdEePdk4AwkUSfidsNm9h+mJ8j4aY6aimBSG5kxtTog0J8R3sP0+11rbqnJxqA9ilKQ2gtpKszF/FE6Q0BfxGWwWnVOk3PgAPitqpSxG7Fy3eQyxbIwpP5NWkJULrxXTjb1V6FyWq/nmRvdHqp0YpZIUBsxpMgR3ZXFwvwDP7TmgpG3OYbe77AXzuvdgpu45aoJfiptTyUSt0ZSqY5/GvNXOcuBAdHnJiAQZSTd2UENu2UYFruFYFPRbf6V7dm4FZLs0sTMOhQ2Tb+O/pqmCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmAtzJ3jxoiktFkBh3u4PRKhmsaC7gcCmoEBuM39BWQ=;
 b=ttsn8AOg7Ou1LMuFpEgiOVIRVVJZsHs7cGmn2H7Rgi+iwphHxhVCxOWpSKa3XL6j6Uf+qv7thVzx2uanOLmbNwlavOeENwYu/b/Oo9gd6xdS3i+4ANNBsHUW5FTzWgnfwy2EP2auFeDsnmPeqhixfG3QG/NcMEr06rFcSk0LMyfvnnNYsLD/1YwYkGkwW1btrEiNBS7K1bleIoDWsUJtgLA/EXJyszpGx0EneLORonCg6w7t/uJVUDYxxQ3AENW3ytuiCVLAsn1ahGLJI6AmWxzOqP4gouAwjxzyN7yVFbZ9bzjaT1ekl+K4T/kVtB24qzZESadpZXauZ8pLhnkirQ==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::50) by
 HK2APC01HT098.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::372)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 09:45:01 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::4d) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Tue, 13 Oct 2020 09:45:01 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639]) by HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639%4]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:45:01 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogVGhlIGxhdGVzdCBjb2RlIG9mIG9wZW5ibWMtbWFzdGVyIGZhaWxl?=
 =?gb2312?Q?d_to_compile,_please_take_a_look,_thank_you.?=
Thread-Topic: The latest code of openbmc-master failed to compile, please take
 a look, thank you.
Thread-Index: AQHWoTri8Y04pEMsaESWljNQT0sD/amVQiEAgAAFq4w=
Date: Tue, 13 Oct 2020 09:45:01 +0000
Message-ID: <HK0PR04MB2883978E91A7D175DCEB831FFE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
References: <HK0PR04MB28839DFD113446F4DE202799FE040@HK0PR04MB2883.apcprd04.prod.outlook.com>,
 <581621fd-2e12-40fe-9a79-1d1575c7920b@www.fastmail.com>
In-Reply-To: <581621fd-2e12-40fe-9a79-1d1575c7920b@www.fastmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:90FFD4F3DBC0CDD535F8ECD85D78A66C03386E133E2F6A5B7E6373CE23E2899C;
 UpperCasedChecksum:5757DB57B785F081303DD762FE6F28F22D643CE97FE07A95D67D980B7D1DE32A;
 SizeAsReceived:7092; Count:44
x-tmn: [eqeQ5Bh+7OK18bA2eYHtgt7odYk/oYAG]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 6ecdce77-fea6-46d8-0626-08d86f5ca807
x-ms-traffictypediagnostic: HK2APC01HT098:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGzYhzBRhjGFg+puYGmGFCao9an79xPy+H62Rvu09htAvzcQjaBeoCrgpknh6wJ5RL2SHoeqETmLCSk7EWHTp7fSP1UTS+NXosW01cJGjwQJBfgituEnRo5Vfb69K/Z+pIcMBH/dhBk52TIOeAx9X2VH2v9hjtooyuvC9XM+/RIlh95cB0Id8sQB6Db1Ts/88K8ijj9NMpvxUeha7DoiSw==
x-ms-exchange-antispam-messagedata: QeIHXcohl/RIgB5i5BUcV8Cxg799msbGX+ap3yYpQVe6mfnruZyUwHEffF/MBO+vhKgJ8/scKKNIagodxwykH5+BncL0bksITE0dfmAGi3UvxsFoQy34MF/16RbsEZI4w+WfuG7o1CvCp0AkQW+2Eg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2883978E91A7D175DCEB831FFE040HK0PR04MB2883apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecdce77-fea6-46d8-0626-08d86f5ca807
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 09:45:01.9202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT098
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2883978E91A7D175DCEB831FFE040HK0PR04MB2883apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCiAgIEkgbW9kaWZpZWQgdGhlIFJBTSBzcGFjZSB0byAxM0csIGFuZCBJIHRyaWVkIHRo
ZSBzYW1lIGVycm9yLiBBbmQgSSBoYXZlIGFsd2F5cyB1c2VkIDhHIFJBTSBzcGFjZSB0byBjb21w
aWxlLg0KDQpoYXJsZXkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6
IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQq3osvNyrG85DogMjAyMMTqMTDUwjEz
yNUgMTc6MjENCsrVvP7IyzogemhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbSA8emhvdXl1YW5xaW5n
OEBvdXRsb29rLmNvbT47IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCrOty806
IHVwZXJpY0AxNjMuY29tIDx1cGVyaWNAMTYzLmNvbT4NCtb3zOI6IFJlOiBUaGUgbGF0ZXN0IGNv
ZGUgb2Ygb3BlbmJtYy1tYXN0ZXIgZmFpbGVkIHRvIGNvbXBpbGUsIHBsZWFzZSB0YWtlIGEgbG9v
aywgdGhhbmsgeW91Lg0KDQoNCg0KT24gVHVlLCAxMyBPY3QgMjAyMCwgYXQgMTk6MDUsINbcINS2
x+Ugd3JvdGU6DQoNCi4uLg0KDQo+DQo+IHRoZSBlcnJvciBhcyBmb2xsb3c6DQo+IHptYTogTWVt
b3J5IGFsbG9jYXRpb24gZmFpbGVkZXJyb3I6IGxpYmx6bWE6IE1lbW9yeSBhbGxvY2F0aW9uDQo+
IGZhaWxlZGVycm9yOiBsaWJsem1hOiBNZW1vcnkgYWxsb2NhdGlvbiBmYWlsZWRlcnJvcjogbGli
bHptYTogTWVtb3J5DQo+IGFsbG9jYXRpb24gZmFpbGVkZXJyb3I6IGxpYmx6bWE6IE1lbW9yeSBh
bGxvY2F0aW9uIGZhaWxlZGVycm9yOg0KPiBsaWJsem1hOiBNZW1vcnkgYWxsb2NhdGlvbiBmYWls
ZWRlcnJvcjogbGlibHptYTogTWVtb3J5IGFsbG9jYXRpb24NCj4gZmFpbGVkZXJyb3I6IGxpYmx6
bWE6IE1lbW9yeSBhbGxvY2F0aW9uIGZhaWxlZGVycm9yOiBsaWJsem1hOiBNZW1vcnkNCj4gYWxs
b2NhdGlvbiBmYWlsZWRXcm90ZToNCg0KLi4uDQoNCj4gL2hvbWUvenlxL21hc3Rlci1vcGVuYm1j
L29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkv
Ym1jd2ViLzEuMCtnaXRBVVRPSU5DK2U0MzYwMDgzNzctcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2lu
Y2x1ZGUvc2RidXNwbHVzL2FzaW8vY29ubmVjdGlvbi5ocHA6MjgsDQo+ICAgICAgICAgICAgICAg
ICAgZnJvbSAuLi9naXQvaW5jbHVkZS9kYnVzX3NpbmdsZXRvbi5ocHA6MiwNCj4gICAgICAgICAg
ICAgICAgICBmcm9tIC4uL2dpdC9pbmNsdWRlL3Nlc3Npb25zLmhwcDoxMiwNCj4gICAgICAgICAg
ICAgICAgICBmcm9tIC4uL2dpdC9odHRwL2h0dHBfcmVxdWVzdC5oOjUsDQo+ICAgICAgICAgICAg
ICAgICAgZnJvbSAuLi9naXQvaHR0cC9hcHAuaDozLA0KPiAgICAgICAgICAgICAgICAgIGZyb20g
Li4vZ2l0L3NyYy93ZWJzZXJ2ZXJfbWFpbi5jcHA6MToNCj4gL2hvbWUvenlxL21hc3Rlci1vcGVu
Ym1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVh
YmkvYm1jd2ViLzEuMCtnaXRBVVRPSU5DK2U0MzYwMDgzNzctcjAvcmVjaXBlLXN5c3Jvb3QvdXNy
L2luY2x1ZGUvYm9vc3QvZGV0YWlsL3Njb3BlZF9lbnVtX2VtdWxhdGlvbi5ocHA6MTc6MTogbm90
ZTogJyNwcmFnbWEgbWVzc2FnZTogVGhpcyBoZWFkZXIgaXMgZGVwcmVjYXRlZC4gVXNlIDxib29z
dC9jb3JlL3Njb3BlZF9lbnVtLmhwcD4gaW5zdGVhZC4nDQo+ICAgIDE3IHwgQk9PU1RfSEVBREVS
X0RFUFJFQ0FURUQoIjxib29zdC9jb3JlL3Njb3BlZF9lbnVtLmhwcD4iKQ0KPiAgICAgICB8IF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IHZpcnR1YWwgbWVtb3J5IGV4aGF1c3RlZDogQ2Fubm90
IGFsbG9jYXRlIG1lbW9yeQ0KDQpMb29rcyBsaWtlIHlvdSBuZWVkIG1vcmUgUkFNIGZvciB5b3Vy
IGJ1aWxkIG1hY2hpbmUuDQoNCkFuZHJldw0K

--_000_HK0PR04MB2883978E91A7D175DCEB831FFE040HK0PR04MB2883apcp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;I modified the RAM space to 13G, and I tried the same error. A=
nd I have always used 8G RAM space to compile.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Andrew =
Jeffery &lt;andrew@aj.id.au&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA10=D4=C213=C8=D5 17:21<br>
<b>=CA=D5=BC=FE=C8=CB:</b> zhouyuanqing8@outlook.com &lt;zhouyuanqing8@outl=
ook.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=B3=AD=CB=CD:</b> uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: The latest code of openbmc-master failed to compil=
e, please take a look, thank you.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On Tue, 13 Oct 2020, at 19:05, =D6=DC =D4=B6=C7=E5 wrote:<br>
<br>
...<br>
<br>
&gt; <br>
&gt; the error as follow:<br>
&gt; zma: Memory allocation failederror: liblzma: Memory allocation <br>
&gt; failederror: liblzma: Memory allocation failederror: liblzma: Memory <=
br>
&gt; allocation failederror: liblzma: Memory allocation failederror: <br>
&gt; liblzma: Memory allocation failederror: liblzma: Memory allocation <br=
>
&gt; failederror: liblzma: Memory allocation failederror: liblzma: Memory <=
br>
&gt; allocation failedWrote: <br>
<br>
...<br>
<br>
&gt; /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/s=
dbusplus/asio/connection.hpp:28,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../git/include/dbus_singleton.hpp:2,<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../git/include/sessions.hpp:12,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../git/http/http_request.h:5,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../git/http/app.h:3,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../git/src/webserver_main.cpp:1:<br>
&gt; /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/include/b=
oost/detail/scoped_enum_emulation.hpp:17:1: note: '#pragma message: This he=
ader is deprecated. Use &lt;boost/core/scoped_enum.hpp&gt;
 instead.'<br>
&gt;&nbsp;&nbsp;&nbsp; 17 | BOOST_HEADER_DEPRECATED(&quot;&lt;boost/core/sc=
oped_enum.hpp&gt;&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ^~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; virtual memory exhausted: Cannot allocate memory<br>
<br>
Looks like you need more RAM for your build machine.<br>
<br>
Andrew<br>
</div>
</span></font></div>
</body>
</html>

--_000_HK0PR04MB2883978E91A7D175DCEB831FFE040HK0PR04MB2883apcp_--
