Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D21DD1B5E5F
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 16:53:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Kzl17X4zDqNS
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 00:53:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:febd::809;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=S2JHsgL3; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01olkn0809.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::809])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Ksy3YCxzDqyc
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 00:48:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWsBEzV4CrbC5i8CRUDzhNe/4HMpMcZIa5mpq6pq2dtDBn2VU+dNKFGMdMNmrCQw3P3WvNXYj/WW/LsNx5EfSDzLsts0/kgSgXG5pGTSdoT1MqM70xfLMY3oRxoSahvFsQawyNHPdn5c9CCot04NPK6jnf0D1wfClKBR56UVMcDL8L1VyL4ZAITimGioVbluy2oUsXGfwhlpmgKtipKjsHnXv/G15jr2M/k466JpHERk1psEZPEdGGAI96lhvzSL1xSPb+WHeNx8NpxsaMA/75VN2V4Pylb7FJS83MUqCr/woVZVOAu/nYrc/LoodA9GbH/eXWS/dfy64d3iFzy8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0bZcEN5+U6GjpjcLda8Bbj+UYykL1s3ceMsNTI/uu0=;
 b=FsG+l1mCybTZiXxiG+rV4oe9rs6PNhfqOmJIvknhxLKBBJotymrE57uiBG8FRvG5VgsCSgDFpF1isq+7IO5dKGF6Psr6Ed6I0IZQah3K6Hw0rHLQbl2nxWP1B2s/F+AgwCOYhJhGRc6PrsY02w9CA2tz9PRXilxYhrJ8u4Rgi4PhG3Cw0xUIZ9YL5Azwk8uMkwdcLuIrXqUDkH8Y1uBCiNqBo4u47zlXM+tDDDMoujjqrHexnIYVBViowBd5RnWWIck5njG5zXaaXecNkNu26XZC7lhDGIBx8j2XRMsFqLKmeiEGSfgZbPY88ddhyoqXaLw+nZUeo9VIThmatY9erA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0bZcEN5+U6GjpjcLda8Bbj+UYykL1s3ceMsNTI/uu0=;
 b=S2JHsgL3ZIjwUf7xFGm2lMfL4QLgIXaIE8LWN5lXmmy4dl9O2TZYz6Dw3vFG2G3C76I6qVyTh39o4uwxhi6xp+7FNppg5m2Qwy+8bQn531gnsUlBP1fvgF5oO98ha5zzKytThEiAlYALDub+oqED0xv1YkAeKdPXJVxvS0iQtZEJwE3EBaN/wmwoNuYCzSvOGgD/cnnv+3uH+yOLFSCpt5IkZUPVZYBQ+YeZqCJaqlFL2S66Kwl1BAWtbtgDli/7sjVjpjPjtvKUlDjc+IKa0HNxuj6LdjmPp38JyepxxdrG7iKKt14G6TX/rua3m8VcLlfFKs7TKu67gdnQcrVYbQ==
Received: from PU1APC01FT023.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4c) by
 PU1APC01HT198.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::441)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Thu, 23 Apr
 2020 14:47:58 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::41) by PU1APC01FT023.mail.protection.outlook.com
 (2a01:111:e400:7ebe::260) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Thu, 23 Apr 2020 14:47:58 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 14:47:58 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "uperic@163.com"
 <uperic@163.com>
Subject: about obmc-chassis-poweroff@0.target and obmc-host-start@0.target
Thread-Topic: about obmc-chassis-poweroff@0.target and obmc-host-start@0.target
Thread-Index: AQHWGX2mf7RFsVH2AUWbfHlv2bgIUg==
Date: Thu, 23 Apr 2020 14:47:58 +0000
Message-ID: <HK2PR04MB3826B62C70CC3C90D4F8E452FED30@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:69A587EEC880BB92081D8E44706C281FC4F2E5DA2D01A4227E3A1B0F2259BDE0;
 UpperCasedChecksum:E167DAFD7DCB8FFAE70D507B3276E3EB4746AE243ADF2CE40482BC02AE40E84F;
 SizeAsReceived:6809; Count:42
x-tmn: [TkpN5T/KkVmIsvliWdwm3eeGLTYPjJlB]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1222a742-f678-4ff8-76bf-08d7e795507d
x-ms-traffictypediagnostic: PU1APC01HT198:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n6pTz2A8OUSrkTxlHggxFC471MGsdIoaQb5QQVfYkbDZvycnocdGqK1rCSqEIMHpiUUcAMElaNUYiExtdE/zIw9qr7uW0/yg/vMficezLrDUS7xE7DkNWQOLKm6Y7IEZde1k4s3P7tASKyqmv/YltvhwR7y4agF3RUV22pyYLuSL/Q184xh36Qsd1Slxauv0o6cJSPvzkl+4aJbJiN9xgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: fglOId6GhsfG+JdyNpdQHlu5Olii+rhD44LpcDqorqUk791vxTp9oWAkOtiGKhN3IUDhCHWlH6awoiqHE/XE+TCXw5HGUlAsXmMrd4hePyXvbSBC7tFy3kBi2kEwj2NGiftsImkNg+I/ctum5BcPVw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826B62C70CC3C90D4F8E452FED30HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1222a742-f678-4ff8-76bf-08d7e795507d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 14:47:58.1708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT198
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

--_000_HK2PR04MB3826B62C70CC3C90D4F8E452FED30HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGmjrA0KDQogICAgICAgQWJvdXQgIm9ibWMtY2hhc3Npcy1wb3dlcm9mZkAwLnRhcmdldCIgYW5k
ICJvYm1jLWhvc3Qtc3RhcnRAMC50YXJnZXQiIGhvdyB0aGVzZSB0d28gdGFyZ2V0cyBhcmUgY2Fs
bGVkLCBwbGVhc2UgaGVscCB0byBhbnN3ZXIsIHRoYW5rIHlvdS4NCiAgICAgIEkgdXNlIHRoZSBz
eXN0ZW1jdGwgbGlzdC1kZXBlbmRlbmNpZXMgY29tbWFuZCBhbmQgSSBjYW6hr3Qgc2VlIHdobyBp
cyBjYWxsaW5nIHRoZW0uDQoNClRoYW5rcw0KaGFybGV5DQoNCg==

--_000_HK2PR04MB3826B62C70CC3C90D4F8E452FED30HK2PR04MB3826apcp_
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
Hi=A3=AC&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp;About &quot;obmc-chassis-poweroff@0.target&quot;=
 and &quot;obmc-host-start@0.target&quot; how these two targets are called,=
 please help to answer, thank you.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;&nbsp;I use the systemctl list-dependencies command and=
 I can=A1=AFt see who is calling them.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_HK2PR04MB3826B62C70CC3C90D4F8E452FED30HK2PR04MB3826apcp_--
