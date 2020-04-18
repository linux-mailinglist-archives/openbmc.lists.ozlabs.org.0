Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DB1AEC0B
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 13:15:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4949PB71kTzDrj1
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 21:15:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.29;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=GKoXXIQI; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255029.outbound.protection.outlook.com [40.92.255.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4949NS3nc1zDrTQ
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 21:15:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnGnZhqEOWo1t8wM3NN0/kZcz6oMJ60Z+If5/8XySEiOzMs95efVvIHjPYwri1mZGrfOZITRRIngNUQV1mKnOOVs+xkocfpG4aHgDopUDvS0LIkOnoUdzyulUCySq01k2mHUyR1Y4lCsOObkDpUCRYz4pAz40zJ7F8lIjLWsrqKJ1GOlifVkKU/qJVONMFHcY8WvX7a9Y0wegFqDYfd8SW5MZYMoNyipt7DHULcESnQTi3kH5WQ0dtPaUlKYK1Ho/GFbXP5ZoN+m32a/dieA5a3UjsbRxIam64BDlilicd7OkXnMBCEhtq6BdATiBLTjnFLHxvjyQOWp0Jct689npQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94MhwaDF+QpJZhce65oYhBEbddtpvL0yqvahkO8n/m4=;
 b=M574zdbQ+s2xTbDUp1V1r+GAKxb+mjVRaUSHLnroNuHq5TIhkAlCV4/CYbCHMIbSE6DAJC84pCSejp9wvLj6BrJj0y2MDG4ydQyH04dLNgvLZ9kYvC+OMqtnS06LKbp94lsJRjZnlz4Juku5Ub7W+t/UwO4Rjqgf7nFYshz5d+kV6dmLn9+Y7+vCuIebgXPXJOvQPqXd+m013Psjt+F4y0BhDx9IOJi2bt1QzV1jtTrMp//hQRTC1iiEKrJ7d9LyxtQcDYF/cZuZzWkvVJU+r706qc94NfAMzeTuN154OphnXRnw6T4Qg1c6QqyvZbxHyVfRvB3DvqNeuCmiCekpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94MhwaDF+QpJZhce65oYhBEbddtpvL0yqvahkO8n/m4=;
 b=GKoXXIQII305klVCkHSjabhpxtAtj+8rTwQ1ki4D52Mi5uGPYH2Kdnq+kku/9oBp8gBM18QONREsBxHTxT4y3PJIDcCIjaiQtQA/rK2HCSe/sEpSGxIX7EhQTEQVfSkm8YN/SMXF44cpjQTYYBIsLGEYfdoTxKNJTQP1B2xsAI/13sasRInE8q+t6NKzvYupzcDd3/TpQWURCYUevlc5vTqKbg1K2GwsmLDnnQzeJd17vpqVjnluqlNriJTlcsN2DoKaY2XlP/kYDTUJl6KIoPN+Lj21g/idoiZe6gLa89Sj7P4FeQXRZB8RwwFQHdjFP4m4IZpgXYr6imUd8cRbgA==
Received: from PU1APC01FT038.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::44) by
 PU1APC01HT039.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::282)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sat, 18 Apr
 2020 11:14:55 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::53) by PU1APC01FT038.mail.protection.outlook.com
 (2a01:111:e400:7ebe::392) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Sat, 18 Apr 2020 11:14:55 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 11:14:54 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: About RGMII mode setting of MAC0
Thread-Topic: About RGMII mode setting of MAC0
Thread-Index: AQHWFXAwowlVvDbP102O33VLLGtv8w==
Date: Sat, 18 Apr 2020 11:14:54 +0000
Message-ID: <HK2PR04MB3826A2AAD55E77655BDFB558FED60@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:AF17ECB7F65EF56669C0902979AA75EFCEFBE6536BA3F92D68C118D0A450C473;
 UpperCasedChecksum:54A1C939C4F28156753AC92B63710E8615E06F1C696F889D28BC61160C50853A;
 SizeAsReceived:6795; Count:43
x-tmn: [sSp2doj4SJBPgiGF5RQfNAcRah5nXu8b]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 6d56e72c-89ff-4738-af20-08d7e389b8ff
x-ms-traffictypediagnostic: PU1APC01HT039:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VKCPOX0dLPizldfsg1UnkI2GmCfEW3+kP4xIz48Eo0uGy2c3ZtjJgXTEar/V37SG/YafHRzLW4DWkS+td1BktEeuZNtjBkdtnlm3WaWawg2leBA6HK0LVACKoT5+Sz1KhGv0jbdE8hI/gDp10OwIAEjG4+1+pWThcYq3GgBILR/Bv2O/aTNmb8fIiHhTX765rWTGu/2QAWDGUy6y/yiV5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: ISX90CZ+phpUohFnq2UvrVRY7a4jXMB2SnK5gI4Mqid+ah1t662LkMtztdn2J2p4wYi12j0MKejBpmq1lhNgJWjAaaKsp20AneYUn/UcrlADq7U0kGBvbE/C/kC5h2AFPtQoAIZwNRfqnV92ZxGlPg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826A2AAD55E77655BDFB558FED60HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d56e72c-89ff-4738-af20-08d7e389b8ff
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 11:14:54.9363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT039
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
Cc: "uperic@163.com" <uperic@163.com>,
 "shinerocky@yahoo.com" <shinerocky@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826A2AAD55E77655BDFB558FED60HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCiAgICBNeSBuYW1lIGlzIEhhcmxleSwgSSBhbSBjdXJyZW50bHkgZGV2ZWxvcGluZyBh
biBvcGVuYm1jIHByb2plY3QgYmFzZWQgb24gdGhlIEFTVDI1MDAgY2hpcC4gVGhlcmUgYXJlIGEg
ZmV3IHF1ZXN0aW9ucyB0aGF0IG5lZWQgdG8gYmUgY29uc3VsdGVkLiBQbGVhc2UgaGVscCBtZSB0
byBhbnN3ZXIgdGhlbS4gVGhhbmsgeW91IHZlcnkgbXVjaCENCg0KICAgIDGhokFib3V0IFJHTUlJ
IG1vZGUgc2V0dGluZyBvZiBNQUMwDQogICAgVGhlIGN1cnJlbnQgb3BlbmJtYyBwcm9qZWN0IGFu
ZCB1Ym9vdCBjb2RlIHN1cHBvcnQgMiBtb2RlczogTUFDMCB1c2VzIE5DU0ksIE1BQzIgdXNlcyBS
R01JSSwgYnV0IG15IGJvYXJkIHVzZXMgTUFDMCBSR01JSS4gSG93IGNhbiBJIHNpbXBseSBjb25m
aWd1cmUgdGhpcyB0byBjb21wbGV0ZSB0aGlzIHdvcmssIG9yIGRvIEkgaGF2ZSB0byBtb2RpZnkg
YXNwZWVkbmljLmMgYW5kIGFkZCB0aGUgbmV3IHBhdGNoIGZpbGUgdW5kZXIgdGhlIGRpcmVjdG9y
eSBtZXRhLXBob3NwaG9yL2FzcGVlZC1sYXllci9yZWNpcGVzLWJzcC91LWJvb3QvZmlsZXMgPw0K
DQogICAgMqGiVGhlcmUgYXJlIGxvdCBvZiByZWNpcGVzIHVuZGVyIGRpcmVjdG9yeSBtZXRhLXBo
b3NwaG9yLCBIb3cgZG9lcyBiaXRiYWtlIGNob29zZSBzcGVjaWZpYyByZWNpcGVzPyBJIHJlYWQg
dGhlIG1hbnVhbCBvZiBiaXRiYWtlIGFuZCB0aGUgcHJvamVjdCBvZiBvcGVuYm1jLCBhbmQgSSBk
aWRuJ3QgZmluZCBhIHdheSB0byBjaG9vc2UuIG9wZW5ibWMgaGFzIG1hbnkgcmVjaXBlcywgd2Ug
Y2FuJ3QgdXNlIHRoZW0gYWxsoaMNCg0KICAgIDOholRoZXJlIGFyZSBtYW55IGNvbW1vbiByZWNp
cGVzIHVuZGVyIG9wZW5ibWMgLyBtZXRhLXBob3NwaG9yLCBpcyB0aGVyZSBhbnkgZG9jdW1lbnRh
dGlvbiBhYm91dCB0aGUgYXJjaGl0ZWN0dXJlIGFuZCBkZXRhaWxlZCBpbXBsZW1lbnRhdGlvbiBw
cmluY2lwbGVzIG9mIGVhY2ggcmVjaXBlPyBGb3IgZXhhbXBsZSwgY2hhc3NpcyBwb3dlciBjb250
cm9sLg0KDQoNCkhhcmxleQ0KDQo=

--_000_HK2PR04MB3826A2AAD55E77655BDFB558FED60HK2PR04MB3826apcp_
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
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
Hi,&nbsp;</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
&nbsp; &nbsp;&nbsp;My name is Harley, I am currently developing an openbmc =
project based on the AST2500 chip.&nbsp;There are a few questions that need=
 to be consulted. Please help me to answer them. Thank you very much!</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
&nbsp; &nbsp; 1=A1=A2About RGMII mode setting of MAC0</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
&nbsp; &nbsp; The current openbmc project and uboot code support 2 modes: M=
AC0 uses NCSI, MAC2 uses RGMII, but my board uses MAC0 RGMII. How can I sim=
ply configure this to complete this work, or do I have to modify aspeednic.=
c and add the new patch file under the directory&nbsp;meta-phosphor/aspeed-=
layer/recipes-bsp/u-boot/files
 ?</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
&nbsp; &nbsp; 2=A1=A2<span style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Calibri, Arial, Helvetica, sans-serif, serif, EmojiFont; background-color:=
 rgb(255, 255, 255); display: inline !important">There are lot of recipes u=
nder
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif, serif, EmojiFont; background-color: rgb(255, 255, 255); =
display: inline !important">
directory&nbsp;</span><span style=3D"caret-color: rgb(0, 0, 0); font-family=
: Calibri, Arial, Helvetica, sans-serif, serif, EmojiFont; background-color=
: rgb(255, 255, 255); display: inline !important">meta-phosphor</span>, How=
 does bitbake choose specific recipes?
 I read the manual of bitbake and the project of openbmc, and I didn't find=
 a way to choose. openbmc has many recipes, we can't use them all=A1=A3</sp=
an></div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif, serif, EmojiFont; background-color: rgb(255, 255, 255); =
display: inline !important"><br>
</span></div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif, serif, EmojiFont; background-color: rgb(255, 255, 255); =
display: inline !important">&nbsp; &nbsp;
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif, serif, EmojiFont; background-color: rgb(255, 255, 255); =
display: inline !important">
3=A1=A2There are many common recipes under openbmc / meta-phosphor, is ther=
e any documentation about the architecture and detailed implementation prin=
ciples of each recipe? For example, chassis power control.</span></span></d=
iv>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif, serif, EmojiFont; background-color: rgb(255, 255, 255); =
display: inline !important"><span style=3D"caret-color: rgb(0, 0, 0); font-=
family: Calibri, Arial, Helvetica, sans-serif, serif, EmojiFont; background=
-color: rgb(255, 255, 255); display: inline !important"><br>
</span></span></div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif, serif, EmojiFont; background-color: rgb(255, 255, 255); =
display: inline !important"><span style=3D"caret-color: rgb(0, 0, 0); font-=
family: Calibri, Arial, Helvetica, sans-serif, serif, EmojiFont; background=
-color: rgb(255, 255, 255); display: inline !important"><br>
</span></span></div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if, serif, EmojiFont; font-size: 12pt">
Harley</div>
<br>
</div>
</body>
</html>

--_000_HK2PR04MB3826A2AAD55E77655BDFB558FED60HK2PR04MB3826apcp_--
