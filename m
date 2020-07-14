Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 336EA21E52E
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 03:34:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5NNS4gpczDqZm
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 11:34:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.40;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Hqic9SNC; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255040.outbound.protection.outlook.com [40.92.255.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5NMn209XzDqTb
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 11:33:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFBaC5PExiJCDTDeEJRmuQCvkEsdr6ocR3oM1Vc9E6SQ/3Foasb9svDiFKIhFDtNUV16jEq0gg5ZwAVDPhC/T4PBaIpIctSXSPXSbzbRxxbgqifsQgHP98GT3QbzBceRN+txmH7vFwpXXGgQevhfXoi5l6sDSH7Rl8HHx1cIUVrD+gs9RvblbOuNWvNmwYLbfuI3/AMKrAumbEFq9Y6I4W92OcRcbXgyIVKU/iaZ+NMErLTLr9IWLX2XZFpNEaeZPREe7ViM4Jl4wTBGgfwPrWMqniiinWhJb9eseHHpxU6JOSEQQtUW93C1EQvZmiFnU3hlFjOqoX4rlElIiN1z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKLWuAI/35Dak3oKq65uFjzN4euYuX+jth9z1ROVdos=;
 b=OvqV3ZN9g9TjFsF6igPgB975c3l/dnTa/gjarXT2ZGW2Px+CYVueRMGUU45BUqO3tPw+TUVnd/hbHNfmhfPTqBtqT79bTU44zdULrgKSNeCfEgIXQ+m1SSWrWV9Nci0xAPNebmOVdpcE0StJhXzYhhNiEbamdFLbXbHrKtPMQOHWyX1C0HBBBIY2VHTCqgmQ/miLuOLbN3jR73HEpqWYdsKa+1CBb61QHS7nEXq958W8PLkg9WTxS137e1PIwBYSpYSNpNZye7Vx9WM5nMXRcMlQ9VnR+alxMaZRCrFREnuEngnPIBVzhNeBAELeASfZ4KS3g+tWIPBc7URVyBBZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKLWuAI/35Dak3oKq65uFjzN4euYuX+jth9z1ROVdos=;
 b=Hqic9SNCc5gJmHoER8mUpWY67daGW4JLTUNIafdA7Cbjp1qAsxXM1wIkaW4S9Qhuq5gb4fo5me93oFlL204d7R8TSwaJAqEqW8N4E0fDI0utDCHV4dpp6F4gJCa/C5ZHWMulm216N7Y1WISf2CNmsFMIxNU6Z+aQ9n9fDTckr1uI1nmpV0m6F4eCB80O83dzdkrezxRJDP2GqsrazsTj2ewt2dnySiT+fylnzdE8N5z/DV1+IzoxVj3DgFDsSWNzlE+v1Ka53DgkccysvVAWF+7RilxgBIKZszAJwUvPkcWF5fxUWDL2BrqOh7N+9CnE2SGmDrOoI1jDUstF1vODQw==
Received: from HK2APC01FT041.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::52) by
 HK2APC01HT133.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::388)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Tue, 14 Jul
 2020 01:33:49 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT041.mail.protection.outlook.com
 (2a01:111:e400:7ebc::303) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Tue, 14 Jul 2020 01:33:49 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 01:33:49 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "uperic@163.com"
 <uperic@163.com>
Subject: How to let openbmc's kernel load jffs2 file system
Thread-Topic: How to let openbmc's kernel load jffs2 file system
Thread-Index: AQHWWX5bl/t9YvklQk+Oe6m9zJNBuQ==
Date: Tue, 14 Jul 2020 01:33:49 +0000
Message-ID: <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C54215814682849A6800979D79BE1AE24004848F14C956F4AF2559AA794A478F;
 UpperCasedChecksum:72CFA3F3C153327F79919F7938603265C2E82B26EBE5D5DFF8CD9B16EB9BCED5;
 SizeAsReceived:6722; Count:41
x-tmn: [ivyOE5bzIa0qJpxRZYdWaAFW2tcAsGtu]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 4fefe960-ba39-41da-2ce9-08d82795f595
x-ms-traffictypediagnostic: HK2APC01HT133:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ynWMDi1yylVPCNsLvFGutxB3IF65jt+cdRGzDH+a0k57VTkJf2NJweCxE6Z7QyMq7DhN/AWv/9tjpxVREZxt9kRY5ZMnuHlWYj8Ekj2KLxFwiAC5aCQoF5BQiue/arJPY1FNJkZacmeOxR7Poxj0TEF1xT6N433WOmciQJ1fLA3nmFPPbqsI/DdcZaLOR+l1FVIwFmbKp9ELPbwEbfk2IQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: F81bRyB+CqPgMoPuoBZGH+8xohr6zCYyadvBEx0N7FA3j4nWBFcVILjxugUv9NVmDt+IlvmubG02jP0BR6jlD2sCnrjpFZwRitMzxsH3dDSdbLpxuDiEy4KLq039gkD7bM5I47Iv+uVsKPwwr7MzDA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fefe960-ba39-41da-2ce9-08d82795f595
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 01:33:49.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT133
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

--_000_HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNClRoZSByb2ZzIHNxdWFzaGZzIGN1cnJlbnRseSBsb2FkZWQgYnkg
dGhlIGtlcm5lbCBvZiBvcGVuYm1jIGlzIHZlcnkgaW5jb252ZW5pZW50IHRvIGRlYnVnIGJlY2F1
c2Ugc3F1YXNoZnMgaXMgYSByZWFkLW9ubHkgZmlsZSBzeXN0ZW0uIEkgbWFkZSBhIGpmZnMyIGZp
bGUgc3lzdGVtLCBhZnRlciBtb2RpZnlpbmcgdGhlIGJvb3RhcmcgcGFyYW1ldGVycyBvZiB1Ym9v
dCwgdGhlIGtlcm5lbCBzdGlsbCBsb2FkcyBzcXVhc2hmcy4NCg0KSG93IHRvIGxldCBvcGVuYm1j
J3Mga2VybmVsIGxvYWQgamZmczIgZmlsZSBzeXN0ZW0/DQoNCmJvb3RhcmcgcGFyYW1ldGVyIGFz
IGZvbGxvdzoNCg0KYm9vdGFyZ3M9oa5jb25zb2xlPXR0eVM0LDExNTIwMG44IG5vaW5pdHJkICBy
b290PS9kZXYvbXRkYmxvY2s0IHJ3IHJvb3Rmc3R5cGU9amZmczKhrw0KDQpoYXJsZXkNCg==

--_000_HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610HK2PR04MB3826apcp_
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
Hello everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The rofs squashfs currently loaded by the kernel of openbmc is very inconve=
nient to debug because squashfs is a read-only file system. I made a jffs2 =
file system, after modifying the bootarg parameters of uboot, the kernel st=
ill loads squashfs.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
How to let openbmc's kernel load jffs2 file system?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
bootarg parameter as follow:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica"></p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">bootar=
gs=3D<span style=3D"font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; color: rgb(0, 0, 0); background: var(--whi=
te);">=A1=AEconsole=3DttyS4,115200n8
</span><span style=3D"font-style: normal; font-variant-caps: normal; font-s=
tretch: normal; font-size: 14px; line-height: normal; font-family: &quot;He=
lvetica Neue&quot;; -webkit-font-kerning: none; color: rgb(38, 38, 38);">no=
initrd&nbsp;
</span><span style=3D"font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; color: rgb(0, 0, 0); background: var(--w=
hite);">root=3D/dev/mtdblock4 rw rootfstype=3Djffs2=A1=AF</span></p>
<p></p>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
</body>
</html>

--_000_HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610HK2PR04MB3826apcp_--
