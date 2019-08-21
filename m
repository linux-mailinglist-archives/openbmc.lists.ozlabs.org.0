Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB397464
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:11:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D0jq5xljzDr0f
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 18:11:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=129f09e87=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 46D0j82x7fzDqsJ
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:10:47 +1000 (AEST)
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx01.quantatw.com with ESMTP; 21 Aug 2019 16:10:43 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 21 Aug
 2019 16:10:43 +0800
Received: from mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81]) by
 mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81%6]) with mapi id
 15.01.1713.004; Wed, 21 Aug 2019 16:10:43 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHVV/XbtwEoqXVk+kGbiKtv2uj0Ug==
Date: Wed, 21 Aug 2019 08:10:43 +0000
Message-ID: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_ce541dfc04cd4b879648c214efc74635quantatwcom_"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_ce541dfc04cd4b879648c214efc74635quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQoNCkFmdGVyIGNvbW1pdCBbMV0sIEkgZm91bmQgbXkgdGVtcCBzZW5zb3IgcmVh
ZGluZyB3b3VsZCBiZSByZS1zY2FsZWQgYnkgbXVsdGlwbHlpbmcgMSBvdmVyIDI1NSwgbWFraW5n
IHRlbXBlcmF0dXJlIGludG8gdW5mYW1pbGlhciB1bml0LiBBbHNvIHRoZSBmYW4gcnBtIHJlYWRp
bmcgd291bGQgbGllIGluIFswLDFdIGludGVydmFsLCBsZXR0aW5nIHRoZSBmYW4gaW5wdXQgdG8g
YmUgMCAoc2luY2UgdGhlIGlucHV0IHZhbHVlIG9mIGZhbiBpcyBmcm9tIGFuIGludGVnZXIgYXJy
YXkgWzJdKS4gQXJlIHRoZXNlIG5vcm1hbCBiZWhhdmlvcnM/IE9yIGRvIEkgbWlzcyBzb21ldGhp
bmc/DQoNCg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250
cm9sL2NvbW1pdC9mYzJlODAzZjVkOTI1Njk0NGUxOGM3Yzg3OGE0NDE2MDZiMWYxMjFjDQoNClsy
XSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1waWQtY29udHJvbC9ibG9iL2E3
ZWM4MzUwZDE3YjcwMTUzY2ViZTY2NmQzZmJlODhiZGRkMDJhMWEvcGlkL2ZhbmNvbnRyb2xsZXIu
Y3BwI0w4Ng0KDQoNClRoYW5rcywNCg0KDQpIYW5rIExpb3UNCg0KUXVhbnRhIENvbXB1dGVyIElu
Yy4NCg0K

--_000_ce541dfc04cd4b879648c214efc74635quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p>Hi All,</p>
<p><br>
</p>
<p>After commit [1], I found my temp sensor reading would be re-scaled by m=
ultiplying 1 over 255, making temperature&nbsp;into unfamiliar unit. Also t=
he fan rpm reading would lie in [0,1] interval, letting the fan input to be=
 0 (since the input value of fan is from
 an integer array [2]). Are these normal behaviors? Or do I miss something?=
</p>
<p><br>
</p>
<p>[1]&nbsp;<a href=3D"https://github.com/openbmc/phosphor-pid-control/comm=
it/fc2e803f5d9256944e18c7c878a441606b1f121c" class=3D"OWAAutoLink" id=3D"LP=
lnk457214" style=3D"font-size:12pt" previewremoved=3D"true">https://github.=
com/openbmc/phosphor-pid-control/commit/fc2e803f5d9256944e18c7c878a441606b1=
f121c</a></p>
<p>[2]&nbsp;<a href=3D"https://github.com/openbmc/phosphor-pid-control/blob=
/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86" class=
=3D"OWAAutoLink" id=3D"LPlnk413188" previewremoved=3D"true">https://github.=
com/openbmc/phosphor-pid-control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02=
a1a/pid/fancontroller.cpp#L86</a></p>
<p><br>
</p>
<p><span style=3D"font-family: Calibri, sans-serif, serif, EmojiFont; font-=
size: 16px;">Thanks</span>,</p>
<p><br>
</p>
<p>Hank Liou</p>
<p>Quanta Computer Inc.</p>
<br>
</div>
</body>
</html>

--_000_ce541dfc04cd4b879648c214efc74635quantatwcom_--
