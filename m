Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B71B2B1E
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 17:24:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4966n74x2nzDqQK
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 01:24:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.107;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Ziqt4ks5; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254107.outbound.protection.outlook.com [40.92.254.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49661z4NDQzDqM5
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 00:50:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IykTvFANiU9Jm/NRpA2PAjsSMz3xt4TVTCMeXPVjwbhA07GHpRDItml6RbdwKwTpahNGRnyFUscEh7ENTSVy2OV6stPmfBh7yY3t0z7xjXb/46zCmwvJ4mMCxPKUcng19Y958eb+posH6cjWqAcQt/WIJYpnjLqrjXZqQqfGKGpd8DqFftirm4qBa9XtlOzbL+DxYZTpT8pUJBcvNvjAcMR7p4LYvSPwTEVpsVZeUxGjrtd4AV96Yhxca1A/w/1BrTLfvG3cwqVXJrDwAoyZ3BaCHhkPsQWovR5mc36mcnmnL5g1XilkTJWAUy8lZgdpFakzZ8ow9eZVdWOYVBvZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN4yk/074AxJVKnV4K3GsXVkfamseZkhkL2JzVaz1c4=;
 b=aBWdoOE9gUPrU0Fstx9p0dWRHGytRnnsr1AlQ4CL0R9H1kZFHV/RbmOFD1vY+oIjSIqZIluTqVTw24zXnSQNOuvRNuHrt2YKXRVzqLh2+jNlSfwJSHlSYbL4rBWBFbxrEmuBOOAtomTZ6xhyqnyrqvRzx6r5GixWM8W+Jz1Gscan7Mehlhr1D6uwlKdU7UMZbcFaktajJTHnc+x8JRsmJfoacDtQQJdYCPIZvKOXGUbhVGWEl0HFa5SvmRXf1M4ojg1qqPVnC4dhLAxho8RFRJKwqb7/Pt/KNrpxGvfZF3ONwrM+mxmliOl/fzw6REwMAGF18HLIMs7exmKGLx0fJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN4yk/074AxJVKnV4K3GsXVkfamseZkhkL2JzVaz1c4=;
 b=Ziqt4ks5uW57VyURMdq7DjEfqmVrIZbJMeDprTCG1cYa/WHd6lV79oH+SzOKP+mu/A7gZ0nn885W3WI3s8ca0Tg3ZUb3JwzdPHUOBRJLZfSfXKbywkJBgSmKrM7Q6j3sfXM8C+s6tdgjO5X+Y7nqNvmUA+0e3eS9UKy9OICCd5NS0I4EsRGybgjHIJeVJ6sqf0y1wMCBli+9GGqjonXfotKve+d+DvxaeFyjCBRLd6HO2eZaDnBfkWgbz2q3dPD2yVxqbzEjl69MViWkaBiKcC3ypvP08VjE3fgxZeMmGmkThiT46QVSH9wu5cm7G927m1h51jKqt1bEdRoAMFu56g==
Received: from PU1APC01FT019.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::40) by
 PU1APC01HT062.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::351)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 14:50:40 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::44) by PU1APC01FT019.mail.protection.outlook.com
 (2a01:111:e400:7ebe::222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 14:50:40 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 14:50:39 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Sui Chen <suichen6@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?YWJvdXQgcG93ZXIgY29udHJvbC672Li0OiBDYWxsIGZvciBHYXJkZW5pbmcg?=
 =?gb2312?Q?Tasks?=
Thread-Topic: =?gb2312?B?YWJvdXQgcG93ZXIgY29udHJvbC672Li0OiBDYWxsIGZvciBHYXJkZW5pbmcg?=
 =?gb2312?Q?Tasks?=
Thread-Index: AQHWFzfNy6/e3WsCnUKvq29Gt2WgdqiDk+GA
Date: Tue, 21 Apr 2020 14:50:39 +0000
Message-ID: <PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com>
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
In-Reply-To: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:7AD0E2135AD3268CC43E3885D07C0A1A11D617A949B484D0E5DFE28EFD92D7A4;
 UpperCasedChecksum:59CCC510679833BC979DD318FA955EF7E7C2AEE7BDCBA8294888AD20A85FF030;
 SizeAsReceived:7075; Count:45
x-tmn: [i7GMU7c5LH0BJCCfSo3mRgVUoEMtpoac]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a61200a5-02ec-4638-67d9-08d7e6035c0a
x-ms-traffictypediagnostic: PU1APC01HT062:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PJ/gFjQkfLUQ0X9zIb0qToG201NHdzC8wjgWjVcm0aCt24lMlOa0M3ryyhDDMcki5aApS2jfUmizp6hPlR9dQCoBd1+nW/L9kqHGMHhlRp8lnlIvAZ4hFd9S7C3k8+9XZzSnxek+UN+kSao2zvdKYgHU21xwzHqObMVwVe+vQsVVL/bCOIUy3JUb2IIf4evPxdCpyEh5AiGZTgY1qfiqKGcdJsO7ctF63BtO21Wgd+OYJYlrv6g5B3b7RJPc5XKs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: WVHqPBm7nM8jWt3gsw3r/W4md+3Yaz8Pkwuz1IMeXe8VA+NXRN1gIO5fICbEVxTskkOaHibLTqkbqbnv4d7+q2LpvqjlSbgMwq48/N0DKFBRab1XNX28/mmGm918czYE3UMB+L4s/ZxOTMKeaRmoyQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR04MB383294A0D7402F9204C46C97FED50PS2PR04MB3832apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a61200a5-02ec-4638-67d9-08d7e6035c0a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 14:50:39.9001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT062
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

--_000_PS2PR04MB383294A0D7402F9204C46C97FED50PS2PR04MB3832apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KICAgIFRoaXMgaXMgYSB2ZXJ5IGdvb2QgaWRlYS4gQXMgdGhlIGZpcnN0IHRpbWUgdG8g
ZG8gb3BlbmJtYywgSSBsb29rIGZvcndhcmQgdG8gaXQuIEN1cnJlbnRseSwgSSBhbSBiZWluZyB0
cm91YmxlZCBieSB0aGUgcHJvYmxlbXMgeW91IGRlc2NyaWJlLg0KDQogICAgVGhlIGZvbGxvd2lu
ZyBxdWVzdGlvbnMsIHBsZWFzZSBhbHNvIGhlbHAgeW91IGFuc3dlciBpdCwgdGhhbmsgeW91IHZl
cnkgbXVjaC4NCg0KICAgIDEuSSBtb2RpZmllZCB0aGUgZHRzIGZpbGUsIGhvdyB0byB1c2UgdGhl
IGNvbW1hbmQgImJpdGJha2UgLWYgbGludXgtYXNwZWVkIiB0byBHZW5lcmF0ZSBmaXRpbWFnZSBh
bmQgZHVio78NCiAgICAgTm93LCBJIG1vZGlmeSB0aGUgZHRzIGZpbGUgaW4gdGhlIGtlcm5lbCBz
b3VyY2UgZGlyZWN0b3J5LiBXaGVuIEkgY29tcGlsZSwgYml0YmFrZSB3aWxsIHJlLWZldGNoIHRo
ZSBzb3VyY2UgY29kZSwgZGVjb21wcmVzcywgcGF0Y2gsIGNvbmZpZ3VyZSwgYW5kIGNvbXBpbGUs
IGNhdXNpbmcgbXkgY2hhbmdlcyB0byBiZSBvdmVyd3JpdHRlbi4gSSBjdXJyZW50bHkgdXNlIG1h
bnVhbCBjYWxsIHNjcmlwdHMgdG8gY29tcGlsZSBkdHMgZmlsZXMgYW5kIG1ha2UgaW1hZ2VzIGZv
ciBkZWJ1Z2dpbmcuSXMgdGhlcmUgYSB3YXkgdG8gbWFrZSBiaXRiYWtlIHNraXAgdGhlIHByZXZp
b3VzIHN0ZXBzIGFuZCBjb21waWxlIGRpcmVjdGx5o78NCg0KDQogICAgIDIuVGhlIHNpemUgb2Yg
aW1hZ2UtcndmcyBpcyAwLCBJIHdhbnQgdG8gdXNlIHJ3ZnMgZGVidWdnaW5nLCBob3cgdG8gY29u
ZmlndXJlIHRvIGdlbmVyYXRlIGEgbm9ybWFsIGltYWdlLXJ3ZnM/DQogICAgIC1ydy1yLS1yLS0u
IDIgaGFybGV5emhvdSBoYXJsZXl6aG91ICAgICA5NDQzICAgICAgICAgICAgIDTUwiAgICAgICAg
NyAxNzoyNyBvYm1jLXBob3NwaG9yLWltYWdlLXh4aC0yMDIwMDQwNzA5MjU1OC5yb290ZnMubWFu
aWZlc3QNCiAgICAgLXJ3LXItLXItLS4gMiBoYXJsZXl6aG91IGhhcmxleXpob3UgMTgyMTQ5MTIg
ICAgICAgICA01MIgICAgNyAxNzoyNyBvYm1jLXBob3NwaG9yLWltYWdlLXh4aC0yMDIwMDQwNzA5
MjU1OC5yb290ZnMuc3F1YXNoZnMteHoNCiAgICAgLXJ3LXJ3LXItLS4gMiBoYXJsZXl6aG91IGhh
cmxleXpob3UgMzM1NTQ0MzIgICAgICAgIDTUwiAgIDcgMTc6Mjcgb2JtYy1waG9zcGhvci1pbWFn
ZS14eGgtMjAyMDA0MDcwOTI1NTguc3RhdGljLm10ZA0KICAgICAtcnctcnctci0tLiAyIGhhcmxl
eXpob3UgaGFybGV5emhvdSAzMzU2NjcyMCAgICAgICAgNNTCICAgNyAxNzoyOCBvYm1jLXBob3Nw
aG9yLWltYWdlLXh4aC0yMDIwMDQwNzA5MjU1OC5zdGF0aWMubXRkLmFsbC50YXINCiAgICAgLXJ3
LXJ3LXItLS4gMiBoYXJsZXl6aG91IGhhcmxleXpob3UgMjIzODQ2NDAgICAgICAgIDTUwiAgIDcg
MTc6Mjggb2JtYy1waG9zcGhvci1pbWFnZS14eGgtMjAyMDA0MDcwOTI1NTguc3RhdGljLm10ZC50
YXINCiAgICAgLXJ3LXItLXItLS4gMiBoYXJsZXl6aG91IGhhcmxleXpob3UgICAzMDgyMTggICAg
ICAgICAgICA01MIgICAgICA3IDE3OjI3IG9ibWMtcGhvc3Bob3ItaW1hZ2UteHhoLTIwMjAwNDA3
MDkyNTU4LnRlc3RkYXRhLmpzb24NCiAgICAgLXJ3LXItLXItLS4gMiBoYXJsZXl6aG91IGhhcmxl
eXpob3UgICAgICAgICAgIDAgICAgICAgICAgICAgICA01MIgICA3IDE3OjI3IG9ibWMtcGhvc3Bo
b3ItaW1hZ2UteHhoLmpmZnMyDQoNCg0KICAgIDMuIEkgZGlkIG5vdCBmaW5kIHRoZSBzb3VyY2Ug
Y29kZSBvZiAicGdvb2Rfd2FpdCIgYW5kICJwb3dlcl9jb250cm9sLmV4ZSIgaW4gb2JtYy1vcC1j
b250cm9sLXBvd2VyPyB3aGVyZSBjYW4gSSBnZXQgaXQgPw0KDQoNCiAgICA0Lk9wZW5CTUMgdXNl
cyBzeXN0ZW1kPGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL1NvZnR3YXJlL3N5c3Rl
bWQvPiB0byBtYW5hZ2UgYWxsIHByb2Nlc3NlcywgU28gaSBhbmFseXplZCB0aGUgcHJvY2VzcyBv
ZiBzeXN0ZW1kIHN0YXJ0aW5nIHByb2Nlc3MgYW5kIHNhdyAiZGVmYXVsdC50YXJnZXQtPiBiYXNp
Yy50YXJnZXQtPiBzeXNpbml0LnRhcmdldC0+IGxvY2FsLWZzLnRhcmdldCIsIHRoZXJlIGlzIG5v
IGNvbnRlbnQgYmVoaW5kLnBsZWFzZSBoZWxwIHRvIHByb3ZpZGUgY2x1ZXMgb2Ygc3lzdGVtZCBz
dGFydGluZyBwcm9jZXNzLg0KDQogICAgNS5JIHVuZGVyc3RhbmQgdGhlIGZvbGxvd2luZyBleGVj
dXRpb24gcHJvY2VzcyBvZiBwb3dlci1vbiAsIGhlbHAgY2hlY2sgaWYgaXQgaXMgY29ycmVjdC4N
CiAgICAgICBhKS5yZXN0IG9yIGJ1c2N0bCBzZW5kIHBvd2VyLW9uIGNvbW1hbmRzIHRvIHN5c3Rl
bWQgdGhyb3VnaCBkLWJ1cyBtZXNzYWdlcy4NCiAgICAgICBiKS5zeXN0ZW1kIGZpbmQgdGhlIG9i
bWMtY2hhc3Npcy1wb3dlcm9uQC50YXJnZXQNCiAgICAgICAgYykuc3lzdGVtZCBmaW5kIHRoZSBv
Ym1jLXBvd2VyLXN0YXJ0QC50YXJnZXQNCiAgICAgICAgZCkuc3lzdGVtZCBmaW5kIHRoZSBvcC1w
b3dlci1zdGFydEAwLnNlcnZpY2UNCiAgICAgICAgZSkuc3lzdGVtZCBzdGFydCBhIHRocmVhZCBh
bmQgZXhlY3V0ZSAiYnVzY3RsIGNhbGwgYG1hcHBlciBnZXQtc2VydmljZSAvb3JnL29wZW5ibWMv
Y29udHJvbC9wb3dlciVpYCAvb3JnL29wZW5ibWMvY29udHJvbC9wb3dlciVpIG9yZy5vcGVuYm1j
LmNvbnRyb2wuUG93ZXIgc2V0UG93ZXJTdGF0ZSBJIDEiDQoNCmFwcGVuZGl4o7oNCg0KbHMgb2Jt
Yy1jaGFzc2lzLXBvd2Vyb25AMC50YXJnZXQucmVxdWlyZXMNCg0Kb3AtcG93ZXItc3RhcnRAMC5z
ZXJ2aWNlICBvcC13YWl0LXBvd2VyLW9uQDAuc2VydmljZQ0KDQoNCmNhdCBvYm1jLWNoYXNzaXMt
cG93ZXJvbkAudGFyZ2V0DQoNCltVbml0XQ0KDQpEZXNjcmlwdGlvbj1DaGFzc2lzJWkgKFBvd2Vy
IE9uKQ0KDQpXYW50cz1tdWx0aS11c2VyLnRhcmdldA0KDQpBZnRlcj1tdWx0aS11c2VyLnRhcmdl
dA0KDQpXYW50cz1tYXBwZXItd2FpdEAteHl6LW9wZW5ibWNfcHJvamVjdC1zdGF0ZS1jaGFzc2lz
JWkuc2VydmljZQ0KDQpBZnRlcj1tYXBwZXItd2FpdEAteHl6LW9wZW5ibWNfcHJvamVjdC1zdGF0
ZS1jaGFzc2lzJWkuc2VydmljZQ0KDQpXYW50cz1tYXBwZXItc3VidHJlZS1yZW1vdmVALXh5ei1v
cGVuYm1jXHg1ZnByb2plY3Qtc29mdHdhcmVceDNBeHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2Fy
ZS5BY3RpdmF0aW9uQmxvY2tzVHJhbnNpdGlvbi5zZXJ2aWNlDQoNCkFmdGVyPW1hcHBlci1zdWJ0
cmVlLXJlbW92ZUAteHl6LW9wZW5ibWNceDVmcHJvamVjdC1zb2Z0d2FyZVx4M0F4eXoub3BlbmJt
Y19wcm9qZWN0LlNvZnR3YXJlLkFjdGl2YXRpb25CbG9ja3NUcmFuc2l0aW9uLnNlcnZpY2UNCg0K
DQpjYXQgb3AtcG93ZXItc3RhcnRAMC5zZXJ2aWNlDQoNCltVbml0XQ0KDQpEZXNjcmlwdGlvbj1T
dGFydCBQb3dlciVpDQoNCldhbnRzPW9ibWMtcG93ZXItc3RhcnRAJWkudGFyZ2V0DQoNCkJlZm9y
ZT1vYm1jLXBvd2VyLXN0YXJ0QCVpLnRhcmdldA0KDQpBZnRlcj1vYm1jLXBvd2VyLXN0YXJ0LXBy
ZUAlaS50YXJnZXQNCg0KQWZ0ZXI9b2JtYy1mYW4tY29udHJvbC50YXJnZXQNCg0KV2FudHM9bWFw
cGVyLXdhaXRALW9yZy1vcGVuYm1jLWNvbnRyb2wtcG93ZXIlaS5zZXJ2aWNlDQoNCkFmdGVyPW1h
cHBlci13YWl0QC1vcmctb3BlbmJtYy1jb250cm9sLXBvd2VyJWkuc2VydmljZQ0KDQpbU2Vydmlj
ZV0NCg0KUmVtYWluQWZ0ZXJFeGl0PXllcw0KDQpUeXBlPW9uZXNob3QNCg0KRXhlY1N0YXJ0PS9i
aW4vc2ggLWMgImJ1c2N0bCBjYWxsIGBtYXBwZXIgZ2V0LXNlcnZpY2UgL29yZy9vcGVuYm1jL2Nv
bnRyb2wvcG93ZXIlaWAgL29yZy9vcGVuYm1jL2NvbnRyb2wvcG93ZXIlaSBvcmcub3BlbmJtYy5j
b250cm9sLlBvd2VyIHNldFBvd2VyU3RhdGUgaSAxIg0KDQpTeXNsb2dJZGVudGlmaWVyPW9wLXBv
d2VyLXN0YXJ0DQoNCltJbnN0YWxsXQ0KDQpXYW50ZWRCeT1vYm1jLWhvc3Qtc3RhcnRAJWkudGFy
Z2V0DQoNCg0KY2F0IG9ibWMtcG93ZXItc3RhcnRALnRhcmdldA0KDQpbVW5pdF0NCg0KRGVzY3Jp
cHRpb249UG93ZXIlaSBPbg0KDQpBZnRlcj1vYm1jLXBvd2VyLXN0YXJ0LXByZUAlaS50YXJnZXQN
Cg0KV2FudHM9bXVsdGktdXNlci50YXJnZXQNCg0KQ29uZmxpY3RzPW9ibWMtY2hhc3Npcy1wb3dl
cm9mZkAlaS50YXJnZXQNCg0KUmVmdXNlTWFudWFsU3RhcnQ9eWVzDQoNClJlZnVzZU1hbnVhbFN0
b3A9eWVzDQoNClRoYW5rcw0KSGFybGV5DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0Kt6K8/sjLOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMremhvdXl1YW5xaW5nOD1vdXRsb29r
LmNvbUBsaXN0cy5vemxhYnMub3JnPiC0+rHtIFN1aSBDaGVuIDxzdWljaGVuNkBnbWFpbC5jb20+
DQq3osvNyrG85DogMjAyMMTqNNTCMjHI1SAxOjA1DQrK1bz+yMs6IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K1vfM4jogUmU6IENhbGwgZm9yIEdh
cmRlbmluZyBUYXNrcw0KDQoNCj4gT24gQXByIDExLCAyMDIwLCBhdCA4OjE1IEFNLCBBbmRyZXcg
R2Vpc3NsZXIgPGdlaXNzb25hdG9yIGF0IGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gU3lzdGVtZCBW
aXN1YWxpemF0aW9uDQoNCj4gQW5vdGhlciBjb21wbGljYXRlZCBhcmVhIG9mIE9wZW5CTUMgaXMg
b3VyIHN5c3RlbWQgdGFyZ2V0cyBhbmQgc2VydmljZXMuIEJ1aWxkaW5nIG9uIHRoZSB1cHN0cmVh
bSB0b29scyB0byB2aXN1YWxpemUgb3VyIHN5c3RlbWQgdGFyZ2V0cyBhbmQgc2VydmljZXMgd291
bGQgYmUgdXNlZnVsIHRvIG5ldyBwZW9wbGUuDQoNCg0KDQorMSB0byB2aXN1YWxpemF0aW9uLCBh
bmQgSSBoYXZlIGEgZmV3IHRob3VnaHRzIG9uIHRoaXMgLS0tDQoNCk15IGxhY2tpbmcgYSBtZW50
YWwgbW9kZWwgb2YgaG93IGFuIE9wZW5CTUMgc3lzdGVtIHdvcmtzIGhhZCBiZWVuIG15IHBhaW4g
cG9pbnQgaW4gdGhlIGZpcnN0IGZldyBtb250aHMgd29ya2luZyB3aXRoIE9wZW5CTUMgKEmhr20g
YSBiaXQgbmV3IHRvIHRoaXMgYXJlYSksIHNvIGFmdGVyIGxlYXJuaW5nIHRoZSBtaW5pbWFsIHNl
dCBvZiBzdXJ2aXZhbCBza2lsbHMgSSBkaWQgc29tZXRoaW5nIHNpbWlsYXIgdG8gd2hhdCB5b3Ug
bWVudGlvbmVkIKhDIHZpc3VhbGl6aW5nIHRoZSBtZXNzYWdlcyBwYXNzZWQgYmV0d2VlbiBkaWZm
ZXJlbnQgZGJ1cyBwZWVycyAoYW5kIGNvbnZlbmllbnRseSwgSVBNSSB0cmFmZmljLCBhcyBJUE1J
LXJlbGF0ZWQgZGJ1cyBtZXNzYWdlcyBleHBvc2luZyBhbGwgSVBNSSBwYXlsb2FkIGNvbXByaXNl
IG1vc3Qgb2YgdGhlIGRidXMgdHJhZmZpYyBvbiB0aGF0IHBhcnRpY3VsYXIgc3lzdGVtIEkgd2Fz
IHdvcmtpbmcgb24uKQ0KDQoNCg0KSSB0aGluayBwYWNrZXQgYW5hbHlzaXMgdG9vbHMgc3VjaCBh
cyBXaXJlc2hhcmsgYW5kIGdyYXBoaWNzIGZyYW1lIGFuYWx5c2lzIHRvb2xzIHN1Y2ggYXMgUmVu
ZGVyRG9jLCBvciBzeXN0ZW0gZXZlbnQtYmFzZWQgV2luZG93cyBQZXJmb3JtYW5jZSB0b29sIGxp
a2UgR1BVVmlldyBwcm92aWRlIGdyZWF0IGV4YW1wbGVzIG9mIHdoYXQgcGVvcGxlIG1pZ2h0IGV4
cGVjdCB0byBhY2hpZXZlIHdpdGggYSB2aXN1YWxpemF0aW9uIHRvb2w6IGNhcHR1cmUsIGluc3Bl
Y3QgYW5kIChzb21ldGltZXMpIHBsYXliYWNrLCBhY3Jvc3MgbXVsdGlwbGUgbGF5ZXJzIGluIHRo
ZSBzb2Z0d2FyZS9oYXJkd2FyZSBzdGFjay4gTWFueSBzaW1pbGFyIGV4aXN0aW5nIHRvb2xzIHBy
b2Nlc3Mgc2VxdWVuY2VzIG9mIGV2ZW50cywgYW5kIGluIHRoaXMgY2FzZSBvZiBCTUNzLCB0aGUg
ZXZlbnRzIGNvdWxkIGJlIGRidXMgbWVzc2FnZXMuIEkgZm91bmQgYSBwcm90b3R5cGUgdmlzdWFs
aXplciBtYWRlIGF0IHdvcmsgZ3JlYXRseSBoZWxwZnVsIGluIGV4cGxhaW5pbmcgdG8gbmV3IHRl
YW0gbWVtYmVycyBzb21lIGJhc2ljIGNvbmNlcHRzIGFuZCB0aGUgSVBNSSBzdGFjayBvbiB0aGUg
Qk1DLg0KDQoNCg0KVGhlIElQTUkgc3RhY2sgaXMgaW50ZXJlc3RpbmcgYmVjYXVzZSBpdKGvcyBv
bmUgbm90aWNlYWJsZSB3b3JrbG9hZCBvbiB0aGUgcGFydGljdWxhciBCTUMgc3lzdGVtIEkgaGFk
IGJlZW4gd29ya2luZyBvbjsgaW4gbXkgY3VycmVudCBsaW1pdGVkIHVuZGVyc3RhbmRpbmcsIGhh
dmluZyBsb3RzIG9mIEkvTyBjYXBhYmlsaXR5IHRvIGNvbm5lY3QgdG8gaHVuZHJlZHMgb2Ygc2Vu
c29ycyBpcyBvbmUgb2YgdGhlIG1hbnkgZmVhdHVyZXMgdGhhdCBzZXQgYXBhcnQgYSBCTUMgY2hp
cCBhbmQgYSBzaW1pbGFybHkgcG93ZXJmdWwgc21hcnRwaG9uZSBjaGlwLCBhbmQgdGhlIGJyb2Fk
IHVzZSBvZiBkYnVzIGlzIHdoYXQgc2V0cyBhcGFydCBPcGVuQk1DIGFuZCB0aGUgZGVza3RvcCBM
aW51eCBkaXN0cm8gSSBoYWQgYmVlbiB1c2luZy4gSSBoZWFyZCBvcHRpbWl6YXRpb24gaXMgYmVz
dCBkb25lIHdvcmtsb2FkIGJ5IHdvcmtsb2FkLCBwZXJoYXBzIHRoaXMgcmF0aW9uYWxlIGFwcGxp
ZXMgdG8gdmlzdWFsaXphdGlvbiB0b28/DQoNCg0KDQpJIHJlYWxpemUgSSB3YXMgbW9zdGx5IHRh
bGtpbmcgYWJvdXQgdmlzdWFsaXppbmcgdGhlIHJ1bi10aW1lIHN0YXRlIG9mIHRoZSBzeXN0ZW0g
cmF0aGVyIHRoYW4gYnVpbGQtdGltZSwgYnV0IHdlIGNvdWxkIHZpc3VhbGl6ZSB0aGUgcnVuLXRp
bWUgYXNwZWN0IG9mIHN5c3RlbWQgdW5pdHMgdG9vIHNpbmNlIEkgaGF2ZSBzZWVuIG1hbnkgdGlt
ZXMgYSBkYnVzIG1lc3NhZ2UgZXZlbnR1YWxseSB0cmlnZ2VyaW5nIGEgc3lzdGVtZCB0YXJnZXQg
dG8gYWN1dGF0ZSB0aGUgc3lzdGVtLCBzbyBpdCB3b3VsZCBiZSBnb29kIHRvIGNvbnNpZGVyIGJv
dGggZGJ1cyBhbmQgc3lzdGVtZCAoYW5kIG1heWJlIG90aGVyIHBhcnRzIG9mIHRoZSBzeXN0ZW0/
KSB0byBoYXZlIGEgbW9yZSBob2xpc3RpYyB2aWV3IG9mIHRoZSBCTUOhr3Mgb3BlcmF0aW9ucy4N
Cg0KDQoNClRoYW5rcw0KDQpTdWkNCg==

--_000_PS2PR04MB383294A0D7402F9204C46C97FED50PS2PR04MB3832apcp_
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
Hi&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; This is a very good idea. As the first time to do openbmc, I =
look forward to it. Currently, I am being troubled by the problems you desc=
ribe.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;&nbsp;The following questions, please also help you answer it,=
 thank you very much.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; 1.I modified the dts file, how to use the command &quot;bitba=
ke -f linux-aspeed&quot; to Generate fitimage and dub=A3=BF</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;Now,&nbsp;I modify the dts file in the kernel source di=
rectory. When I compile, bitbake will re-fetch the source code, decompress,=
 patch, configure, and compile, causing my changes to be overwritten. I cur=
rently use manual call scripts to compile dts files
 and make images for debugging.Is there a way to make bitbake skip the prev=
ious steps and compile directly=A3=BF</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;2.The size of image-rwfs is 0, I want to use rwfs debug=
ging, how to configure to generate a normal image-rwfs?&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;<span>-rw-r--r--. 2 harleyzhou harleyzhou &nbsp; &nbsp;=
 9443 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4=D4=C2 &nbsp; &nbsp; &nbsp=
; &nbsp;7 17:27 obmc-phosphor-image-xxh-20200407092558.rootfs.manifest<br>
</span>
<div>&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou 18214912 &nbsp=
; &nbsp; &nbsp; &nbsp; 4=D4=C2 &nbsp; &nbsp;7 17:27 obmc-phosphor-image-<sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helveti=
ca, sans-serif; background-color: rgb(255, 255, 255); display: inline !impo=
rtant">xxh</span>-20200407092558.rootfs.squashfs-xz<br>
</div>
<div>&nbsp; &nbsp; &nbsp;-rw-rw-r--. 2 harleyzhou harleyzhou 33554432 &nbsp=
; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; 7 17:27 obmc-phosphor-image-<span styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, san=
s-serif; background-color: rgb(255, 255, 255); display: inline !important">=
xxh</span>-20200407092558.static.mtd<br>
</div>
<div>&nbsp; &nbsp; &nbsp;-rw-rw-r--. 2 harleyzhou harleyzhou 33566720 &nbsp=
; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; 7 17:28 obmc-phosphor-image-<span styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, san=
s-serif; background-color: rgb(255, 255, 255); display: inline !important">=
xxh</span>-20200407092558.static.mtd.all.tar<br>
</div>
<div>&nbsp; &nbsp; &nbsp;-rw-rw-r--. 2 harleyzhou harleyzhou 22384640 &nbsp=
; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; 7 17:28 obmc-phosphor-image-<span styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, san=
s-serif; background-color: rgb(255, 255, 255); display: inline !important">=
xxh</span>-20200407092558.static.mtd.tar<br>
</div>
<div>&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou &nbsp; 308218 =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; &nbsp; &nbsp;7 17:2=
7 obmc-phosphor-image-<span style=3D"caret-color: rgb(0, 0, 0); font-family=
: Calibri, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 25=
5); display: inline !important">xxh</span>-20200407092558.testdata.json<br>
</div>
<div>&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<spa=
n style=3D"background-color: rgb(0, 255, 0);">&nbsp;4=D4=C2 &nbsp; 7 17:27 =
obmc-phosphor-image-</span><span style=3D"caret-color: rgb(0, 0, 0); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; background-color: rgb(0, 255,=
 0); display: inline !important;">xxh</span><span style=3D"background-color=
: rgb(0, 255, 0);">.jffs2</span><br>
</div>
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; 3. I did not find the source code of &quot;pgood_wait&quot; a=
nd &quot;power_control.exe&quot; in obmc-op-control-power? where can I get =
it ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; 4.<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36,=
 41, 46); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&qu=
ot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Seg=
oe UI Emoji&quot;; background-color: rgb(255, 255, 255); display: inline !i=
mportant">OpenBMC
 uses<span>&nbsp;</span></span><a href=3D"https://www.freedesktop.org/wiki/=
Software/systemd/" rel=3D"nofollow" style=3D"box-sizing: border-box; color:=
 rgb(3, 102, 214); font-family: -apple-system, BlinkMacSystemFont, &quot;Se=
goe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, =
&quot;Segoe UI Emoji&quot;">systemd</a><span style=3D"caret-color: rgb(36, =
41, 46); color: rgb(36, 41, 46); font-family: -apple-system, BlinkMacSystem=
Font, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color=
 Emoji&quot;, &quot;Segoe UI Emoji&quot;; background-color: rgb(255, 255, 2=
55); display: inline !important"><span>&nbsp;</span>to
 manage all processes, So i&nbsp;analyzed the process of systemd starting p=
rocess and saw &quot;default.target-&gt; basic.target-&gt; sysinit.target-&=
gt; local-fs.target&quot;, there is no content behind.please help to provid=
e clues of systemd starting process.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); font-f=
amily: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, =
Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot=
;; background-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); font-f=
amily: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, =
Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot=
;; background-color: rgb(255, 255, 255); display: inline !important">&nbsp;
 &nbsp; 5.I understand the following execution process of power-on , help c=
heck if it is correct.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp;a).rest or busctl send power-on commands to syst=
emd through d-bus messages.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp;b).systemd find the <span style=3D"caret-color: =
rgb(36, 41, 46); color: rgb(36, 41, 46); font-family: &quot;PingFang SC&quo=
t;; font-size: 12px; background-color: rgb(255, 255, 255); display: inline =
!important">
obmc-chassis-poweron@.target</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); font-f=
amily: &quot;PingFang SC&quot;; font-size: 12px; background-color: rgb(255,=
 255, 255); display: inline !important">&nbsp; &nbsp; &nbsp;
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-size: 16px; background-color: =
rgb(255, 255, 255); display: inline !important">
&nbsp; c).systemd find the&nbsp;<span style=3D"caret-color: rgb(36, 41, 46)=
; color: rgb(36, 41, 46); font-family: &quot;PingFang SC&quot;; font-size: =
12px; background-color: rgb(255, 255, 255); display: inline !important">obm=
c-power-start@.target</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); font-f=
amily: &quot;PingFang SC&quot;; font-size: 12px; background-color: rgb(255,=
 255, 255); display: inline !important"><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 16px; background-color: rgb(255, 255, 255); display: inline=
 !important"><span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41=
, 46); font-family: &quot;PingFang SC&quot;; font-size: 12px; background-co=
lor: rgb(255, 255, 255); display: inline !important">&nbsp;
 &nbsp; &nbsp; &nbsp; <span style=3D"caret-color: rgb(0, 0, 0); color: rgb(=
0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 16=
px; background-color: rgb(255, 255, 255); display: inline !important">
d</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font=
-family: Calibri, Arial, Helvetica, sans-serif; font-size: 16px; background=
-color: rgb(255, 255, 255); display: inline !important">).systemd find the&=
nbsp;<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); f=
ont-family: &quot;PingFang SC&quot;; font-size: 12px; background-color: rgb=
(255, 255, 255); display: inline !important">op-power-start@0.service</span=
><span style=3D"margin: 0px; font-family: &quot;PingFang SC&quot;; font-siz=
e: 12px; color: rgb(36, 41, 46); caret-color: rgb(36, 41, 46)">&nbsp;</span=
></span></span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); font-f=
amily: &quot;PingFang SC&quot;; font-size: 12px; background-color: rgb(255,=
 255, 255); display: inline !important"><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 16px; background-color: rgb(255, 255, 255); display: inline=
 !important"><span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41=
, 46); font-family: &quot;PingFang SC&quot;; font-size: 12px; background-co=
lor: rgb(255, 255, 255); display: inline !important"><span style=3D"caret-c=
olor: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255); di=
splay: inline !important"><span style=3D"margin: 0px; font-family: &quot;Pi=
ngFang SC&quot;; font-size: 12px; color: rgb(36, 41, 46); caret-color: rgb(=
36, 41, 46)">&nbsp;
 &nbsp; &nbsp; &nbsp;&nbsp;<span style=3D"margin: 0px; font-family: Calibri=
, Arial, Helvetica, sans-serif; font-size: 16px; color: rgb(0, 0, 0); backg=
round-color: rgb(255, 255, 255); caret-color: rgb(0, 0, 0); display: inline=
 !important">e</span><span style=3D"margin: 0px; font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 16px; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255); caret-color: rgb(0, 0, 0); display: inline !impo=
rtant">).<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Ar=
ial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: =
inline !important">systemd
 start a thread and execute&nbsp;&quot;<span style=3D"caret-color: rgb(36, =
41, 46); color: rgb(36, 41, 46); font-family: &quot;PingFang SC&quot;; font=
-size: 12px; background-color: rgb(255, 255, 255); display: inline !importa=
nt">busctl call `mapper get-service /org/openbmc/control/power%i`
 /org/openbmc/control/power%i org.openbmc.control.Power setPowerState I 1&q=
uot;</span></span></span></span></span></span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
appendix=A3=BA<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); font-f=
amily: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, =
Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot=
;; background-color: rgb(255, 255, 255); display: inline !important">
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">ls=
 obmc-chassis-poweron@0.target.requires</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">op=
-power-start@0.service<span>&nbsp;
</span>op-wait-power-on@0.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'; mi=
n-height: 17.0px">
<br>
</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">ca=
t obmc-chassis-poweron@.target<span>&nbsp;</span></p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">[U=
nit]</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">De=
scription=3DChassis%i (Power On)</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
nts=3Dmulti-user.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dmulti-user.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
nts=3Dmapper-wait@-xyz-openbmc_project-state-chassis%i.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dmapper-wait@-xyz-openbmc_project-state-chassis%i.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
nts=3Dmapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc=
_project.Software.ActivationBlocksTransition.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dmapper-subtree-remove@-xyz-openbmc\x5fproject-software\x3Axyz.openbmc=
_project.Software.ActivationBlocksTransition.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'; mi=
n-height: 17.0px">
<br>
</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">ca=
t op-power-start@0.service<span>&nbsp;</span></p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">[U=
nit]</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">De=
scription=3DStart Power%i</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
nts=3Dobmc-power-start@%i.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Be=
fore=3Dobmc-power-start@%i.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dobmc-power-start-pre@%i.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dobmc-fan-control.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
nts=3Dmapper-wait@-org-openbmc-control-power%i.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dmapper-wait@-org-openbmc-control-power%i.service</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">[S=
ervice]</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Re=
mainAfterExit=3Dyes</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Ty=
pe=3Doneshot</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Ex=
ecStart=3D/bin/sh -c &quot;busctl call `mapper get-service /org/openbmc/con=
trol/power%i` /org/openbmc/control/power%i org.openbmc.control.Power setPow=
erState i 1&quot;</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Sy=
slogIdentifier=3Dop-power-start</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">[I=
nstall]</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
ntedBy=3Dobmc-host-start@%i.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'; mi=
n-height: 17.0px">
<br>
</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">ca=
t obmc-power-start@.target<span>&nbsp;</span></p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">[U=
nit]</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">De=
scription=3DPower%i On</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Af=
ter=3Dobmc-power-start-pre@%i.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Wa=
nts=3Dmulti-user.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Co=
nflicts=3Dobmc-chassis-poweroff@%i.target</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Re=
fuseManualStart=3Dyes</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'PingFang SC'">Re=
fuseManualStop=3Dyes</p>
<br>
</span></div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: DengXian; text-align: justify; background-color: rgb(255, 255, 255);=
 display: inline !important">Thanks</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: DengXian; text-align: justify; background-color: rgb(255, 255, 255);=
 display: inline !important">Harley</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> openbmc=
 &lt;openbmc-bounces&#43;zhouyuanqing8=3Doutlook.com@lists.ozlabs.org&gt; =
=B4=FA=B1=ED Sui Chen &lt;suichen6@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA4=D4=C221=C8=D5 1:05<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: Call for Gardening Tasks</font>
<div>&nbsp;</div>
</div>
<div lang=3D"ZH-CN">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US">&gt; On Apr 11, 2020, at 8:15 AM, Andrew Geissler &lt;=
geissonator at gmail.com&gt; wrote:</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US">&gt; Systemd Visualization</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US">&gt; Another complicated area of OpenBMC is our system=
d targets and services. Building on the upstream tools to visualize our sys=
temd targets and services would be useful to new people.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">&#43;1 to visualization, an=
d I have a few thoughts on this ---</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">My lacking a mental model o=
f how an OpenBMC system works had been my pain point in the first few month=
s working with OpenBMC (I=A1=AFm a bit new to this area), so after learning=
 the minimal set of survival skills I did
 something similar to what you mentioned =A8C visualizing the messages pass=
ed between different dbus peers (and conveniently, IPMI traffic, as IPMI-re=
lated dbus messages exposing all IPMI payload comprise most of the dbus tra=
ffic on that particular system I was
 working on.)</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">I think packet analysis too=
ls such as Wireshark and graphics frame analysis tools such as RenderDoc, o=
r system event-based Windows Performance tool like GPUView provide great ex=
amples of what people might expect to
 achieve with a visualization tool: capture, inspect and (sometimes) playba=
ck, across multiple layers in the software/hardware stack. Many similar exi=
sting tools process sequences of events, and in this case of BMCs, the even=
ts could be dbus messages. I found
 a prototype visualizer made at work greatly helpful in explaining to new t=
eam members some basic concepts and the IPMI stack on the BMC.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">The IPMI stack is interesti=
ng because it=A1=AFs one noticeable workload on the particular BMC system I=
 had been working on; in my current limited understanding, having lots of I=
/O capability to connect to hundreds of sensors
 is one of the many features that set apart a BMC chip and a similarly powe=
rful smartphone chip, and the broad use of dbus is what sets apart OpenBMC =
and the desktop Linux distro I had been using. I heard optimization is best=
 done workload by workload, perhaps
 this rationale applies to visualization too?</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">I realize I was mostly talk=
ing about visualizing the run-time state of the system rather than build-ti=
me, but we could visualize the run-time aspect of systemd units too since I=
 have seen many times a dbus message
 eventually triggering a systemd target to acutate the system, so it would =
be good to consider both dbus and systemd (and maybe other parts of the sys=
tem?) to have a more holistic view of the BMC=A1=AFs operations.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">Thanks</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: jus=
tify; font-size: 10.5pt; font-family: DengXian;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt">Sui</span></p>
</div>
</div>
</div>
</body>
</html>

--_000_PS2PR04MB383294A0D7402F9204C46C97FED50PS2PR04MB3832apcp_--
