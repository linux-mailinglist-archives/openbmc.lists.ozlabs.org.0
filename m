Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2051BEDF8
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 03:59:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CJV54w9QzDrB4
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 11:59:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.52;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=unhTPSuH; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253052.outbound.protection.outlook.com [40.92.253.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CJTN6b3xzDqBM
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 11:59:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b++ifLXLV99o16IvdyFZ61RGGUV9B6jiGtubib8L0shM3bwNA00aO6iVmCpJL6C9gyhZGUKNV4ohDIjNrTvVegglOK4GTAGdepD8pTV98RRVV/73GkaCSmw0c6bFy0WKKrOxLmR7qkdkdNnEkZyhpmOlfq5PcM7tdgEcGELl8TGxaZeXhLRSXVuLfjkoGsBXtoeH+LzcHd4tIUpD2R6rQKVEqoTScrhMqxxyr8vgVHLGElxyT/caWGaxcg4IPN4E52E3D1zTSxrT9mlZ2k2zQqULap/HYTEM/sKUXpUUqOwqjLo2apFbdO2Tmu8/GOAqQQmwe91bczaosoyWlGsCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqR0NfY9AC+K6oBmB+eNpoA/QgEYNOB/eAHfw5QK4jE=;
 b=cBl9g/KxXlXOe7prE7eWVnpWLBITRo7S95suSwv0cBO/jE9eYd4AB9gp1FuHOLiXOKmCy+JxMfR684vADDL3P+zrm94nQoZMyozqGb7tshhwyo3wahOOtRfizljvDgECsEPiITzYXvJEtT6W3/9FP9znXzzfadbRwaRwGGRyvke1R44HJ7fL+EoqCnqOAj38ZotjwbPIRJqGyh9XRPqGMu3aDyLyffu/GzYYq8HmfEdfKe8+vPUXXan19BUv9ke3e0XVDW6awaqcoDUn0ZRZhF9qqp2ChrOPANKBtYIcSAz6jb6FszT1Yj2kHY3OSIpz7IFs5LILyMaheu4a5uP3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqR0NfY9AC+K6oBmB+eNpoA/QgEYNOB/eAHfw5QK4jE=;
 b=unhTPSuHJdvrofmVF0pnzupGnIG2zwZaJVxBPmIecnFHb63LtvWZQxtX2BXD50of67s9AW5t6mgyH5qwnRrcr7vEoT7HqXgv3VDTFcliXAbktFcb+zB3E7yI/Jjia7utL/T1ShQNF9HlapC0E8Xf7q1eeZczvdvkUnuKrwk8+lSEKYZTo2t+8CnXgS5uFaPEgUMceFl5PLc7C7BUwfN1Wguh9tTr5uiuWYs1xznFyw/O11mjJ2dXKs7pF9xKoHxWN5DCyes04DF+7rutFct3S2el2pYy4juDF6spFqMkkQbxIKYQFG2qdiecAQegNvLl1nmM1l2olrGf3LXSvdru7A==
Received: from HK2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::52) by
 HK2APC01HT165.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::439)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 01:58:58 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::4d) by HK2APC01FT053.mail.protection.outlook.com
 (2a01:111:e400:7ebc::264) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Thu, 30 Apr 2020 01:58:58 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 01:58:58 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: =?gb2312?B?u9i4tDogUmVnYXJkaW5nIHBvd2VyIGNvbnRyb2w=?=
Thread-Topic: =?gb2312?B?u9i4tDogUmVnYXJkaW5nIHBvd2VyIGNvbnRyb2w=?=
Thread-Index: AQHWHpEAeH+WPuILk0SxjFqpsNUQLw==
Date: Thu, 30 Apr 2020 01:58:58 +0000
Message-ID: <HK2PR04MB38261661F9BD9194120C795CFEAA0@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:5E82F7B8FDF46CE7CC0F7969490363A437B78DE77BE7DC2B2E930B85E2F38902;
 UpperCasedChecksum:29E5CB6739E6F99F1C751A56DD566D6A8E61B89B4BE5AF4B7E34993DB32193D3;
 SizeAsReceived:6804; Count:43
x-tmn: [eZow+CgevRkETQ3RscL8c0XMHj3xl2oR]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c0964cba-bced-42d6-3680-08d7ecaa0c19
x-ms-traffictypediagnostic: HK2APC01HT165:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ahLPKbP78ipbW2Es5MCCJCx57NbVt2y2NMM5yG6NwiuWq8QXDEuxokVml6JjvE63w5uMQ6Mis1yYg2jeZPVf2Skq/ORoex//G0uR6dQivVCDJvaqsMXgj2y0aFxNVQKDx9ar/bmYQod7LCaQo563V9UrnvQhu1W/3ttRcefH1Hsfqhs4Vhc1vCXJ4LfsuOR+PYybcvKII+AqtUNTCwDQpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: h6SZZq9aqMtVgKq4k8zUR2rmqPyyoIADY2dc63u/fBUMCtm9HS6eYwxYyUDJ2SwTifmpd1hHhMfH5uX6j26wCiz4dJQqTYTjPqr/I6YoOgKyqgyc//NHSra3zr7A9S+EdbL+tfS2nMUXgNcavkjuMg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38261661F9BD9194120C795CFEAA0HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c0964cba-bced-42d6-3680-08d7ecaa0c19
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 01:58:58.7029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT165
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB38261661F9BD9194120C795CFEAA0HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUGF0cmljayBXaWxsaWFtc6OsDQoNCiAgICAgTXkgYm9hcmQgaGFyZHdhcmUgaXMgY29ubmVj
dGVkIHRvIENQTEQgdGhyb3VnaCBJMkMgb2YgQVNUMjUwMCwgQk1DIHJlYWRzIGFuZCB3cml0ZXMg
Q1BMRCByZWdpc3RlciB0aHJvdWdoIEkyQywgYW5kIHRoZW4gQ1BMRCBjb250cm9scyBwb3dlciBv
biBhbmQgb2ZmLg0KDQogICAgU28sIEkgdGhpbmsgVGhlIHg4Ni1wb3dlci1jb250cm9sIGltcGxl
bWVudGF0aW9uIGNhbm5vdCBiZSBkaXJlY3RseSBhZGFwdGVkIHRvIG15IGJvYXJkLg0KDQogICAg
IFBsZWFzZSBoZWxwIG1lIHRvIHN1Z2dlc3Qgd2hhdCB0byBkbyBuZXh0LCB3aGljaCBjYW4gc29s
dmUgdGhpcyBwcm9ibGVtIGFuZCBhZGFwdCB3ZWxsIHRvIHRoZSBjb2RlIG9mIG9wZW5ibWMgY29t
bXVuaXR5Lg0KDQpUaGFua3MNCkhhcmxleQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCreivP7IyzogUGF0cmljayBXaWxsaWFtcw0K0tG3osvNOiAyMDIwIMTqIDQg1MIgMzAgyNUg
0MfG2svEIDA6MDQNCsrVvP7IyzogemhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbQ0Ks63LzTogb3Bl
bmJtYzsgdXBlcmljQDE2My5jb20NCtb3zOI6IFJlOiBSZWdhcmRpbmcgcG93ZXIgY29udHJvbA0K
DQpPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCAwMTo1MDowOVBNICswMDAwLCB6aG91eXVhbnFpbmc4
QG91dGxvb2suY29tIHdyb3RlOg0KDQo+IFJlZ2FyZGluZyBwb3dlciBjb250cm9sLCBJIHJlYWQg
dGhlIGNvZGVzIGluIHRoZSBmb2xsb3dpbmcgdHdvIGRpcmVjdG9yaWVzKGdpdGh1Yi5jb20vb3Bl
bmJtYy94ODYtcG93ZXItY29udHJvbC5naXQgJiBnaXRodWIuY29tL29wZW5ibWMvc2tlbGV0b24v
dHJlZS9tYXN0ZXIvb3AtcHdyY3RsKS4gVGhlIHBvd2VyIGNvbnRyb2wgaXMgY29udHJvbGxlZCBi
eSBHUElPLCBidXQgdGhlIHBvd2VyIG9mIG15IGJvYXJkIGlzIGNvbnRyb2xsZWQgYnkgQ1BMRC4N
Cg0KVGhlIHg4Ni1wb3dlci1jb250cm9sIGltcGxlbWVudGF0aW9uIHVzZXMgR1BJT3MgZnJvbSB0
aGUgQk1DLCBidXQgdGhvc2UNCkdQSU9zIGFyZSB3aXJlZCB0byBhIENQTEQgZm9yIHRoZSBzaWdu
YWxsaW5nLiAgVGhlIENQTEQgbW9uaXRvcnMgdGhlDQpHUElPcyB0byBrbm93IHdoZW4gdG8gYmVn
aW4gdGhlIHBvd2VyIHNlcXVlbmNlLiAgVGhpcyBpcyB3aGF0IHdlIHVzZSBvbg0KVGlvZ2FwYXNz
Lg0KDQotLQ0KUGF0cmljayBXaWxsaWFtcw0K

--_000_HK2PR04MB38261661F9BD9194120C795CFEAA0HK2PR04MB3826apcp_
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
Hi <span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); fon=
t-family: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&q=
uot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;=
, sans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 2=
55, 255); display: inline !important">
Patrick Williams</span>=A3=AC</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;My board hardware is connected to CPLD through I2C of A=
ST2500, BMC reads and writes CPLD register through I2C, and then CPLD contr=
ols power on and off.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div>&nbsp; &nbsp; So, I think&nbsp;<span style=3D"caret-color: rgb(50, 49,=
 48); font-family: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;S=
egoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica N=
eue&quot;, sans-serif; font-size: 14.666666984558105px; background-color: r=
gb(255, 255, 255); display: inline !important">The
 x86-power-control implementation</span> cannot be directly adapted to my b=
oard.</div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
&nbsp; &nbsp; &nbsp;Please help me to suggest what to do next, which can so=
lve this problem and adapt well to the code of openbmc community.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
Thanks</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
Harley<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>=B7=A2=BC=FE=C8=CB:</b> Patrick Williams<br>
<b>=D2=D1=B7=A2=CB=CD:</b> 2020 =C4=EA 4 =D4=C2 30 =C8=D5 =D0=C7=C6=DA=CB=
=C4 0:04<br>
<b>=CA=D5=BC=FE=C8=CB:</b> zhouyuanqing8@outlook.com<br>
<b>=B3=AD=CB=CD:</b> openbmc; uperic@163.com<br>
<b>=D6=F7=CC=E2:</b> Re: Regarding power control
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Apr 29, 2020 at 01:50:09PM &#43;0000, zhou=
yuanqing8@outlook.com wrote:<br>
<br>
&gt; Regarding power control, I read the codes in the following two directo=
ries(github.com/openbmc/x86-power-control.git &amp; github.com/openbmc/skel=
eton/tree/master/op-pwrctl). The power control is controlled by GPIO, but t=
he power of my board is controlled by CPLD.
<br>
<br>
The x86-power-control implementation uses GPIOs from the BMC, but those<br>
GPIOs are wired to a CPLD for the signalling.&nbsp; The CPLD monitors the<b=
r>
GPIOs to know when to begin the power sequence.&nbsp; This is what we use o=
n<br>
Tiogapass.<br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_HK2PR04MB38261661F9BD9194120C795CFEAA0HK2PR04MB3826apcp_--
