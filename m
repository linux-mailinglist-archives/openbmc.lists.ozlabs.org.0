Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C16791B454F
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 14:44:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496gB25mH1zDqlr
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 22:44:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.87;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=E3gCsGM0; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254087.outbound.protection.outlook.com [40.92.254.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496g3S6SG6zDqfS
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 22:38:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfWNSdk3uq0oxyT6wALNf9IOwIssLtdFmPG9Ydnlsq6mnq31U/IiI9CDB6DnZy7PUiKCkMgjf3CIVu5kkDgl7PtOdfkEyLNCuY/s4LVR8oDMHMR/nrH+rat7XRyUuLP4tC5oAwrBJmai0tqQmXRwgjxEM1QjTgrFbFINB9jO9Tg9MjcoaZWYGk6w63xOB6b0d6TO1nIwsZi3cqk+p8A1J7vqKzKiU03mMo4Mcf0KauQfPsI/lmQTThunr8ZIuHjqDhr2J0gp8WQnlsoS+pb1aO8J1ShFGZ47aoXjZ9S9KttPg4WgktiLsnLi/SjWm4KJHHmZfFQER4RFIemZfdqjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf36EC6oWs1uQhnTFJsT5n9DP1CfzWey+hxOexjl5qU=;
 b=dBG33zzQpI+gBPfY7fg4parDPrMWkvbQnv4R+MqpaKzL9VhZF+4SLgbw7SHTyfEg8+KrMxUbxQaJ/JKLOvw+VEqQ0UAAgsftisOePHTvjp1n5gcp6jgjqm1wMv6MlJWlqvgEMAe5Dr2YMqd4SlZ3Dx7i3h97Uyut8Q6J4GQq59ZVXtCraVoRGYYZQ/4BtwnKSCtfdMFWBVTIpf97yYNrr+iihue7YnpOxs7J4Nc8hpM+yriaNKJGsprduGp288DQQGXeF52AboaaFQ8m3octxO+EtlS2xG7TenghxEZrrx6EWcvxak12nQzt3xSM8TMbO5RpzopXTIJU8rkeFn7GSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf36EC6oWs1uQhnTFJsT5n9DP1CfzWey+hxOexjl5qU=;
 b=E3gCsGM0q4hLoFaktv0VlK3lhXLCavXinbVyvU/pVlElKy4KTXEMIHtVtufEvM7FwaddGI8cHxuvlttwowTKF4Ya6CfvapLvNUkJXDgDfmEMsVYCcwjfG6xrOgV1Ymj8cdZxtKzgiBoOeGXDLkgusEj+zXAb9S58h3ZVMxxZeWMO7c4WfB5uRMp09kkyPS4y6YPrJvTZGcRrkoUkraebhpmADM4B/CnLgivjds+xH2WXVMIgPE5BbkBj99FdsAb+HxQoY5FOH9Yg5/RMLz+r5lffTCPOgz1nj1XtrISK5kMLXSj8o8ixJcv0g+KwaHvSZWI8EuKkYotKMHQEqzFiqQ==
Received: from SG2APC01FT112.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT161.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::343)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 22 Apr
 2020 12:38:52 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com (10.152.250.52) by
 SG2APC01FT112.mail.protection.outlook.com (10.152.250.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.15 via Frontend Transport; Wed, 22 Apr 2020 12:38:52 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 12:38:52 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Li, Yong" <yong.b.li@linux.intel.com>
Subject: =?gb2312?B?u9i4tDogYWJvdXQgcG93ZXIgY29udHJvbC672Li0OiBDYWxsIGZvciBHYXJk?=
 =?gb2312?Q?ening_Tasks?=
Thread-Topic: =?gb2312?B?u9i4tDogYWJvdXQgcG93ZXIgY29udHJvbC672Li0OiBDYWxsIGZvciBHYXJk?=
 =?gb2312?Q?ening_Tasks?=
Thread-Index: AQHWFzfNy6/e3WsCnUKvq29Gt2WgdqiDk+GAgAEr/gCAAFcK5A==
Date: Wed, 22 Apr 2020 12:38:52 +0000
Message-ID: <HK2PR04MB3826D8BD926FE991F3764912FED20@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
 <PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com>,
 <51921587538931@mail.yandex-team.ru>
In-Reply-To: <51921587538931@mail.yandex-team.ru>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A5B45D6A36B0668E1493EBCBBC36F1B258C2110154F7621BEAC3A990A5FFDE15;
 UpperCasedChecksum:907018F4C01AD143DE83DFB5515D98E45AFD2B662588D77096973B37A7DDDDA6;
 SizeAsReceived:7274; Count:45
x-tmn: [CIXR7HVbDhb1MCUPB/sdWACLBjE8vAf+]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 74d0f721-34fc-456a-a889-08d7e6ba1d1a
x-ms-traffictypediagnostic: SG2APC01HT161:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 099uSVuDsPq+SoF0Lj9QB0LdXhaCDlPyEJV8KwARe0ybdVEAsDH3UkfQBSBN2qg2E5R98GvUYSfkaSp/EhGnwIUcPMgLWnQihaqvtwpTFKOMDXC/1t2tNVX+lkun9gWR2lrW3k1tyEsGCDJE+UEL5heqJfGlaDdsQgO+vXxUuRpRVHegj7gx/wFPnRStNqIxASGlMGWbtk6Yd/DwUoc/g7rwFCe41JQqrYTSZfSntc2MzG6tBwCl2JPdCPpM8u16
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: +iT38tXj9tRiHeSLNrhgEk1OXFetG3bt0nIvOt36H67hAXIWgF6cpKzPp6CG3etHQsrp8wZGkokf49pcLkLSIR2E1VfnUC716KE8mHEatRPX4J+EgIhWnFIfhPx9uabERar2JVji0LO9JpcVItr4+Q==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826D8BD926FE991F3764912FED20HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d0f721-34fc-456a-a889-08d7e6ba1d1a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 12:38:52.2056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT161
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

--_000_HK2PR04MB3826D8BD926FE991F3764912FED20HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91IGZvciB0aGUgaGVscCwgSSB3aWxsIHRlc3QgaXQuDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEtvbnN0YW50aW4gS2x1Ym5pY2hraW4gPGtpdHNv
a0B5YW5kZXgtdGVhbS5ydT4NCreiy83KsbzkOiAyMDIwxOo01MIyMsjVIDE1OjI1DQrK1bz+yMs6
IHpob3V5dWFucWluZzhAb3V0bG9vay5jb20gPHpob3V5dWFucWluZzhAb3V0bG9vay5jb20+OyBT
dWkgQ2hlbiA8c3VpY2hlbjZAZ21haWwuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqzrcvNOiB1cGVyaWNAMTYzLmNvbSA8dXBlcmljQDE2
My5jb20+OyBzaGluZXJvY2t5QHlhaG9vLmNvbSA8c2hpbmVyb2NreUB5YWhvby5jb20+DQrW98zi
OiBSZTogYWJvdXQgcG93ZXIgY29udHJvbC672Li0OiBDYWxsIGZvciBHYXJkZW5pbmcgVGFza3MN
Cg0KSGVsbG8hDQoNCkknbGwgdHJ5IHRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uIGFib3V0IHJ3ZnMg
aW1hZ2UuDQpJIGhhZCB0aGUgc2FtZSBpc3N1ZSBwbHVzIEkgd2FudGVkIHRvIGJlIGFibGUgdG8g
Y3JlYXRlIHNvbWUgZGF0YSBpbiByd2ZzIHNlZ21lbnQuDQpUaHVzIEkndmUgY3JlYXRlZCBvYm1j
LXBob3NwaG9yLWltYWdlLmJiYXBwZW5kIHdoZXJlIEkgZG8gdGhlIGZvbGxvd2luZzoNCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NClJXRlNfU0laRSA/PSAiNDE5NDMwNCINCk9WRVJMQVlfTUtGU19PUFRTID0gIiAt
LXBhZD0ke1JXRlNfU0laRX0iDQoNCiMgT3ZlcnJpZGUgSkZGUyBpbWFnZSBjcmVhdGlvbg0KZG9f
Z2VuZXJhdGVfcndmc19zdGF0aWMoKSB7DQpyd2Rpcj0kKHB3ZCkNCnJ3ZGlyPSR7cndkaXJ9L2pm
ZnMyDQppbWFnZT1yd2ZzLmpmZnMyDQoNCnJtIC1yZiAkcndkaXIgJGltYWdlID4gL2Rldi9udWxs
IDI+JjENCm1rZGlyIC1wICR7cndkaXJ9L2Nvdw0KcndkaXI9JHtyd2Rpcn0vY293DQoNCmJicGxh
aW4gIkRFQlVHOiBDcmVhdGluZyBSV0ZTIGltYWdlICINCg0KbXYgJHtJTUFHRV9ST09URlN9L3J3
ZnMvKiAke3J3ZGlyfS8NCnJtIC1yZiAke0lNQUdFX1JPT1RGU30vcndmcw0KDQojIENyZWF0ZSBu
ZWNlc3NhcnkgZmlsZXMsIGRpcmVjdG9yaWVzLCBldGMgaW4gJHtyd2Rpcn0NCiR7SkZGUzJfUldG
U19DTUR9ICR7T1ZFUkxBWV9NS0ZTX09QVFN9ICR7T1ZFUkxBWV9NS0ZTX09QVFN9IC0tc3F1YXNo
LXVpZHMNCn0NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCg0KQXQgdGhlIGVuZCBJIGhhdmUgdGhlIG5vcm1hbCBK
RkZTMiBpbWFnZSBpbnN0ZWFkIG9mIGVtcHR5Lg0KDQpIb3BlIHRoaXMgY2FuIGhlbHAuDQoNCjIx
LjA0LjIwMjAsIDE4OjI0LCAiemhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbSIgPHpob3V5dWFucWlu
ZzhAb3V0bG9vay5jb20+Og0KSGkNCg0KICAgIFRoaXMgaXMgYSB2ZXJ5IGdvb2QgaWRlYS4gQXMg
dGhlIGZpcnN0IHRpbWUgdG8gZG8gb3BlbmJtYywgSSBsb29rIGZvcndhcmQgdG8gaXQuIEN1cnJl
bnRseSwgSSBhbSBiZWluZyB0cm91YmxlZCBieSB0aGUgcHJvYmxlbXMgeW91IGRlc2NyaWJlLg0K
DQogICAgVGhlIGZvbGxvd2luZyBxdWVzdGlvbnMsIHBsZWFzZSBhbHNvIGhlbHAgeW91IGFuc3dl
ciBpdCwgdGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KICAgIDEuSSBtb2RpZmllZCB0aGUgZHRzIGZp
bGUsIGhvdyB0byB1c2UgdGhlIGNvbW1hbmQgImJpdGJha2UgLWYgbGludXgtYXNwZWVkIiB0byBH
ZW5lcmF0ZSBmaXRpbWFnZSBhbmQgZHVio78NCiAgICAgTm93LCBJIG1vZGlmeSB0aGUgZHRzIGZp
bGUgaW4gdGhlIGtlcm5lbCBzb3VyY2UgZGlyZWN0b3J5LiBXaGVuIEkgY29tcGlsZSwgYml0YmFr
ZSB3aWxsIHJlLWZldGNoIHRoZSBzb3VyY2UgY29kZSwgZGVjb21wcmVzcywgcGF0Y2gsIGNvbmZp
Z3VyZSwgYW5kIGNvbXBpbGUsIGNhdXNpbmcgbXkgY2hhbmdlcyB0byBiZSBvdmVyd3JpdHRlbi4g
SSBjdXJyZW50bHkgdXNlIG1hbnVhbCBjYWxsIHNjcmlwdHMgdG8gY29tcGlsZSBkdHMgZmlsZXMg
YW5kIG1ha2UgaW1hZ2VzIGZvciBkZWJ1Z2dpbmcuSXMgdGhlcmUgYSB3YXkgdG8gbWFrZSBiaXRi
YWtlIHNraXAgdGhlIHByZXZpb3VzIHN0ZXBzIGFuZCBjb21waWxlIGRpcmVjdGx5o78NCg0KDQog
ICAgIDIuVGhlIHNpemUgb2YgaW1hZ2UtcndmcyBpcyAwLCBJIHdhbnQgdG8gdXNlIHJ3ZnMgZGVi
dWdnaW5nLCBob3cgdG8gY29uZmlndXJlIHRvIGdlbmVyYXRlIGEgbm9ybWFsIGltYWdlLXJ3ZnM/
DQogICAgIC1ydy1yLS1yLS0uIDIgaGFybGV5emhvdSBoYXJsZXl6aG91ICAgICA5NDQzICAgICAg
ICAgICAgIDTUwiAgICAgICAgNyAxNzoyNyBvYm1jLXBob3NwaG9yLWltYWdlLXh4aC0yMDIwMDQw
NzA5MjU1OC5yb290ZnMubWFuaWZlc3QNCiAgICAgLXJ3LXItLXItLS4gMiBoYXJsZXl6aG91IGhh
cmxleXpob3UgMTgyMTQ5MTIgICAgICAgICA01MIgICAgNyAxNzoyNyBvYm1jLXBob3NwaG9yLWlt
YWdlLXh4aC0yMDIwMDQwNzA5MjU1OC5yb290ZnMuc3F1YXNoZnMteHoNCiAgICAgLXJ3LXJ3LXIt
LS4gMiBoYXJsZXl6aG91IGhhcmxleXpob3UgMzM1NTQ0MzIgICAgICAgIDTUwiAgIDcgMTc6Mjcg
b2JtYy1waG9zcGhvci1pbWFnZS14eGgtMjAyMDA0MDcwOTI1NTguc3RhdGljLm10ZA0KICAgICAt
cnctcnctci0tLiAyIGhhcmxleXpob3UgaGFybGV5emhvdSAzMzU2NjcyMCAgICAgICAgNNTCICAg
NyAxNzoyOCBvYm1jLXBob3NwaG9yLWltYWdlLXh4aC0yMDIwMDQwNzA5MjU1OC5zdGF0aWMubXRk
LmFsbC50YXINCiAgICAgLXJ3LXJ3LXItLS4gMiBoYXJsZXl6aG91IGhhcmxleXpob3UgMjIzODQ2
NDAgICAgICAgIDTUwiAgIDcgMTc6Mjggb2JtYy1waG9zcGhvci1pbWFnZS14eGgtMjAyMDA0MDcw
OTI1NTguc3RhdGljLm10ZC50YXINCiAgICAgLXJ3LXItLXItLS4gMiBoYXJsZXl6aG91IGhhcmxl
eXpob3UgICAzMDgyMTggICAgICAgICAgICA01MIgICAgICA3IDE3OjI3IG9ibWMtcGhvc3Bob3It
aW1hZ2UteHhoLTIwMjAwNDA3MDkyNTU4LnRlc3RkYXRhLmpzb24NCiAgICAgLXJ3LXItLXItLS4g
MiBoYXJsZXl6aG91IGhhcmxleXpob3UgICAgICAgICAgIDAgICAgICAgICAgICAgICA01MIgICA3
IDE3OjI3IG9ibWMtcGhvc3Bob3ItaW1hZ2UteHhoLmpmZnMyDQoNCg0KICAgIDMuIEkgZGlkIG5v
dCBmaW5kIHRoZSBzb3VyY2UgY29kZSBvZiAicGdvb2Rfd2FpdCIgYW5kICJwb3dlcl9jb250cm9s
LmV4ZSIgaW4gb2JtYy1vcC1jb250cm9sLXBvd2VyPyB3aGVyZSBjYW4gSSBnZXQgaXQgPw0KDQoN
CiAgICA0Lk9wZW5CTUMgdXNlcyBzeXN0ZW1kPGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93
aWtpL1NvZnR3YXJlL3N5c3RlbWQvPiB0byBtYW5hZ2UgYWxsIHByb2Nlc3NlcywgU28gaSBhbmFs
eXplZCB0aGUgcHJvY2VzcyBvZiBzeXN0ZW1kIHN0YXJ0aW5nIHByb2Nlc3MgYW5kIHNhdyAiZGVm
YXVsdC50YXJnZXQtPiBiYXNpYy50YXJnZXQtPiBzeXNpbml0LnRhcmdldC0+IGxvY2FsLWZzLnRh
cmdldCIsIHRoZXJlIGlzIG5vIGNvbnRlbnQgYmVoaW5kLnBsZWFzZSBoZWxwIHRvIHByb3ZpZGUg
Y2x1ZXMgb2Ygc3lzdGVtZCBzdGFydGluZyBwcm9jZXNzLg0KDQogICAgNS5JIHVuZGVyc3RhbmQg
dGhlIGZvbGxvd2luZyBleGVjdXRpb24gcHJvY2VzcyBvZiBwb3dlci1vbiAsIGhlbHAgY2hlY2sg
aWYgaXQgaXMgY29ycmVjdC4NCiAgICAgICBhKS5yZXN0IG9yIGJ1c2N0bCBzZW5kIHBvd2VyLW9u
IGNvbW1hbmRzIHRvIHN5c3RlbWQgdGhyb3VnaCBkLWJ1cyBtZXNzYWdlcy4NCiAgICAgICBiKS5z
eXN0ZW1kIGZpbmQgdGhlIG9ibWMtY2hhc3Npcy1wb3dlcm9uQC50YXJnZXQNCiAgICAgICAgYyku
c3lzdGVtZCBmaW5kIHRoZSBvYm1jLXBvd2VyLXN0YXJ0QC50YXJnZXQNCiAgICAgICAgZCkuc3lz
dGVtZCBmaW5kIHRoZSBvcC1wb3dlci1zdGFydEAwLnNlcnZpY2U8bWFpbHRvOm9wLXBvd2VyLXN0
YXJ0QDAuc2VydmljZT4NCiAgICAgICAgZSkuc3lzdGVtZCBzdGFydCBhIHRocmVhZCBhbmQgZXhl
Y3V0ZSAiYnVzY3RsIGNhbGwgYG1hcHBlciBnZXQtc2VydmljZSAvb3JnL29wZW5ibWMvY29udHJv
bC9wb3dlciVpYCAvb3JnL29wZW5ibWMvY29udHJvbC9wb3dlciVpIG9yZy5vcGVuYm1jLmNvbnRy
b2wuUG93ZXIgc2V0UG93ZXJTdGF0ZSBJIDEiDQoNCmFwcGVuZGl4o7oNCg0KbHMgb2JtYy1jaGFz
c2lzLXBvd2Vyb25AMC50YXJnZXQucmVxdWlyZXM8bWFpbHRvOm9ibWMtY2hhc3Npcy1wb3dlcm9u
QDAudGFyZ2V0LnJlcXVpcmVzPg0KDQpvcC1wb3dlci1zdGFydEAwLnNlcnZpYzxtYWlsdG86b3At
cG93ZXItc3RhcnRAMC5zZXJ2aWM+ZSAgb3Atd2FpdC1wb3dlci1vbkAwLnNlcnZpY2U8bWFpbHRv
Om9wLXdhaXQtcG93ZXItb25AMC5zZXJ2aWNlPg0KDQoNCg0KY2F0IG9ibWMtY2hhc3Npcy1wb3dl
cm9uQC50YXJnZXQNCg0KW1VuaXRdDQoNCkRlc2NyaXB0aW9uPUNoYXNzaXMlaSAoUG93ZXIgT24p
DQoNCldhbnRzPW11bHRpLXVzZXIudGFyZ2V0DQoNCkFmdGVyPW11bHRpLXVzZXIudGFyZ2V0DQoN
CldhbnRzPW1hcHBlci13YWl0QC14eXotb3BlbmJtY19wcm9qZWN0LXN0YXRlLWNoYXNzaXMlaS5z
ZXJ2aWNlPG1haWx0bzpXYW50cz1tYXBwZXItd2FpdEAteHl6LW9wZW5ibWNfcHJvamVjdC1zdGF0
ZS1jaGFzc2lzJWkuc2VydmljZT4NCg0KQWZ0ZXI9bWFwcGVyLXdhaXRALXh5ei1vcGVuYm1jX3By
b2plY3Qtc3RhdGUtY2hhc3NpcyVpLnNlcnZpY2U8bWFpbHRvOkFmdGVyPW1hcHBlci13YWl0QC14
eXotb3BlbmJtY19wcm9qZWN0LXN0YXRlLWNoYXNzaXMlaS5zZXJ2aWNlPg0KDQpXYW50cz1tYXBw
ZXItc3VidHJlZS1yZW1vdmVALXh5ei1vcGVuYm1jXHg1ZnByb2plY3Qtc29mdHdhcmVceDNBeHl6
Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5BY3RpdmF0aW9uQmxvY2tzVHJhbnNpdGlvbi5zZXJ2
aWNlDQoNCkFmdGVyPW1hcHBlci1zdWJ0cmVlLXJlbW92ZUAteHl6LW9wZW5ibWNceDVmcHJvamVj
dC1zb2Z0d2FyZVx4M0F4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkFjdGl2YXRpb25CbG9j
a3NUcmFuc2l0aW9uLnNlcnZpY2UNCg0KDQoNCmNhdCBvcC1wb3dlci1zdGFydEAwLnNlcnZpYzxt
YWlsdG86b3AtcG93ZXItc3RhcnRAMC5zZXJ2aWM+ZQ0KDQpbVW5pdF0NCg0KRGVzY3JpcHRpb249
U3RhcnQgUG93ZXIlaQ0KDQpXYW50cz1vYm1jLXBvd2VyLXN0YXJ0QCVpLnRhcmdldDxtYWlsdG86
V2FudHM9b2JtYy1wb3dlci1zdGFydEAlaS50YXJnZXQ+DQoNCkJlZm9yZT1vYm1jLXBvd2VyLXN0
YXJ0QCVpLnRhcmdldDxtYWlsdG86QmVmb3JlPW9ibWMtcG93ZXItc3RhcnRAJWkudGFyZ2V0Pg0K
DQpBZnRlcj1vYm1jLXBvd2VyLXN0YXJ0LXByZUAlaS50YXJnZXQ8bWFpbHRvOkFmdGVyPW9ibWMt
cG93ZXItc3RhcnQtcHJlQCVpLnRhcmdldD4NCg0KQWZ0ZXI9b2JtYy1mYW4tY29udHJvbC50YXJn
ZXQNCg0KV2FudHM9bWFwcGVyLXdhaXRALW9yZy1vcGVuYm1jLWNvbnRyb2wtcG93ZXIlaS5zZXJ2
aWNlPG1haWx0bzpXYW50cz1tYXBwZXItd2FpdEAtb3JnLW9wZW5ibWMtY29udHJvbC1wb3dlciVp
LnNlcnZpY2U+DQoNCkFmdGVyPW1hcHBlci13YWl0QC1vcmctb3BlbmJtYy1jb250cm9sLXBvd2Vy
JWkuc2VydmljZTxtYWlsdG86QWZ0ZXI9bWFwcGVyLXdhaXRALW9yZy1vcGVuYm1jLWNvbnRyb2wt
cG93ZXIlaS5zZXJ2aWNlPg0KDQpbU2VydmljZV0NCg0KUmVtYWluQWZ0ZXJFeGl0PXllcw0KDQpU
eXBlPW9uZXNob3QNCg0KRXhlY1N0YXJ0PS9iaW4vc2ggLWMgImJ1c2N0bCBjYWxsIGBtYXBwZXIg
Z2V0LXNlcnZpY2UgL29yZy9vcGVuYm1jL2NvbnRyb2wvcG93ZXIlaWAgL29yZy9vcGVuYm1jL2Nv
bnRyb2wvcG93ZXIlaSBvcmcub3BlbmJtYy5jb250cm9sLlBvd2VyIHNldFBvd2VyU3RhdGUgaSAx
Ig0KDQpTeXNsb2dJZGVudGlmaWVyPW9wLXBvd2VyLXN0YXJ0DQoNCltJbnN0YWxsXQ0KDQpXYW50
ZWRCeT1vYm1jLWhvc3Qtc3RhcnRAJWkudGFyZ2V0PG1haWx0bzpXYW50ZWRCeT1vYm1jLWhvc3Qt
c3RhcnRAJWkudGFyZ2V0Pg0KDQoNCg0KY2F0IG9ibWMtcG93ZXItc3RhcnRALnRhcmdldA0KDQpb
VW5pdF0NCg0KRGVzY3JpcHRpb249UG93ZXIlaSBPbg0KDQpBZnRlcj1vYm1jLXBvd2VyLXN0YXJ0
LXByZUAlaS50YXJnZXQ8bWFpbHRvOkFmdGVyPW9ibWMtcG93ZXItc3RhcnQtcHJlQCVpLnRhcmdl
dD4NCg0KV2FudHM9bXVsdGktdXNlci50YXJnZXQNCg0KQ29uZmxpY3RzPW9ibWMtY2hhc3Npcy1w
b3dlcm9mZkAlaS50YXJnZXQ8bWFpbHRvOkNvbmZsaWN0cz1vYm1jLWNoYXNzaXMtcG93ZXJvZmZA
JWkudGFyZ2V0Pg0KDQpSZWZ1c2VNYW51YWxTdGFydD15ZXMNCg0KUmVmdXNlTWFudWFsU3RvcD15
ZXMNCg0KDQpUaGFua3MNCkhhcmxleQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CreivP7Iyzogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3pob3V5dWFucWluZzg9b3V0bG9vay5j
b21AbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJtYy1ib3VuY2VzK3pob3V5dWFucWluZzg9
b3V0bG9vay5jb21AbGlzdHMub3psYWJzLm9yZz4+ILT6se0gU3VpIENoZW4gPHN1aWNoZW42QGdt
YWlsLmNvbTxtYWlsdG86c3VpY2hlbjZAZ21haWwuY29tPj4NCreiy83KsbzkOiAyMDIwxOo01MIy
McjVIDE6MDUNCsrVvP7Iyzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmc+IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8bWFpbHRvOm9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4+DQrW98ziOiBSZTogQ2FsbCBmb3IgR2FyZGVuaW5nIFRhc2tz
DQoNCg0KPiBPbiBBcHIgMTEsIDIwMjAsIGF0IDg6MTUgQU0sIEFuZHJldyBHZWlzc2xlciA8Z2Vp
c3NvbmF0b3IgYXQgZ21haWwuY29tPiB3cm90ZToNCg0KPiBTeXN0ZW1kIFZpc3VhbGl6YXRpb24N
Cg0KPiBBbm90aGVyIGNvbXBsaWNhdGVkIGFyZWEgb2YgT3BlbkJNQyBpcyBvdXIgc3lzdGVtZCB0
YXJnZXRzIGFuZCBzZXJ2aWNlcy4gQnVpbGRpbmcgb24gdGhlIHVwc3RyZWFtIHRvb2xzIHRvIHZp
c3VhbGl6ZSBvdXIgc3lzdGVtZCB0YXJnZXRzIGFuZCBzZXJ2aWNlcyB3b3VsZCBiZSB1c2VmdWwg
dG8gbmV3IHBlb3BsZS4NCg0KDQoNCisxIHRvIHZpc3VhbGl6YXRpb24sIGFuZCBJIGhhdmUgYSBm
ZXcgdGhvdWdodHMgb24gdGhpcyAtLS0NCg0KTXkgbGFja2luZyBhIG1lbnRhbCBtb2RlbCBvZiBo
b3cgYW4gT3BlbkJNQyBzeXN0ZW0gd29ya3MgaGFkIGJlZW4gbXkgcGFpbiBwb2ludCBpbiB0aGUg
Zmlyc3QgZmV3IG1vbnRocyB3b3JraW5nIHdpdGggT3BlbkJNQyAoSaGvbSBhIGJpdCBuZXcgdG8g
dGhpcyBhcmVhKSwgc28gYWZ0ZXIgbGVhcm5pbmcgdGhlIG1pbmltYWwgc2V0IG9mIHN1cnZpdmFs
IHNraWxscyBJIGRpZCBzb21ldGhpbmcgc2ltaWxhciB0byB3aGF0IHlvdSBtZW50aW9uZWQgQyB2
aXN1YWxpemluZyB0aGUgbWVzc2FnZXMgcGFzc2VkIGJldHdlZW4gZGlmZmVyZW50IGRidXMgcGVl
cnMgKGFuZCBjb252ZW5pZW50bHksIElQTUkgdHJhZmZpYywgYXMgSVBNSS1yZWxhdGVkIGRidXMg
bWVzc2FnZXMgZXhwb3NpbmcgYWxsIElQTUkgcGF5bG9hZCBjb21wcmlzZSBtb3N0IG9mIHRoZSBk
YnVzIHRyYWZmaWMgb24gdGhhdCBwYXJ0aWN1bGFyIHN5c3RlbSBJIHdhcyB3b3JraW5nIG9uLikN
Cg0KDQoNCkkgdGhpbmsgcGFja2V0IGFuYWx5c2lzIHRvb2xzIHN1Y2ggYXMgV2lyZXNoYXJrIGFu
ZCBncmFwaGljcyBmcmFtZSBhbmFseXNpcyB0b29scyBzdWNoIGFzIFJlbmRlckRvYywgb3Igc3lz
dGVtIGV2ZW50LWJhc2VkIFdpbmRvd3MgUGVyZm9ybWFuY2UgdG9vbCBsaWtlIEdQVVZpZXcgcHJv
dmlkZSBncmVhdCBleGFtcGxlcyBvZiB3aGF0IHBlb3BsZSBtaWdodCBleHBlY3QgdG8gYWNoaWV2
ZSB3aXRoIGEgdmlzdWFsaXphdGlvbiB0b29sOiBjYXB0dXJlLCBpbnNwZWN0IGFuZCAoc29tZXRp
bWVzKSBwbGF5YmFjaywgYWNyb3NzIG11bHRpcGxlIGxheWVycyBpbiB0aGUgc29mdHdhcmUvaGFy
ZHdhcmUgc3RhY2suIE1hbnkgc2ltaWxhciBleGlzdGluZyB0b29scyBwcm9jZXNzIHNlcXVlbmNl
cyBvZiBldmVudHMsIGFuZCBpbiB0aGlzIGNhc2Ugb2YgQk1DcywgdGhlIGV2ZW50cyBjb3VsZCBi
ZSBkYnVzIG1lc3NhZ2VzLiBJIGZvdW5kIGEgcHJvdG90eXBlIHZpc3VhbGl6ZXIgbWFkZSBhdCB3
b3JrIGdyZWF0bHkgaGVscGZ1bCBpbiBleHBsYWluaW5nIHRvIG5ldyB0ZWFtIG1lbWJlcnMgc29t
ZSBiYXNpYyBjb25jZXB0cyBhbmQgdGhlIElQTUkgc3RhY2sgb24gdGhlIEJNQy4NCg0KDQoNClRo
ZSBJUE1JIHN0YWNrIGlzIGludGVyZXN0aW5nIGJlY2F1c2UgaXShr3Mgb25lIG5vdGljZWFibGUg
d29ya2xvYWQgb24gdGhlIHBhcnRpY3VsYXIgQk1DIHN5c3RlbSBJIGhhZCBiZWVuIHdvcmtpbmcg
b247IGluIG15IGN1cnJlbnQgbGltaXRlZCB1bmRlcnN0YW5kaW5nLCBoYXZpbmcgbG90cyBvZiBJ
L08gY2FwYWJpbGl0eSB0byBjb25uZWN0IHRvIGh1bmRyZWRzIG9mIHNlbnNvcnMgaXMgb25lIG9m
IHRoZSBtYW55IGZlYXR1cmVzIHRoYXQgc2V0IGFwYXJ0IGEgQk1DIGNoaXAgYW5kIGEgc2ltaWxh
cmx5IHBvd2VyZnVsIHNtYXJ0cGhvbmUgY2hpcCwgYW5kIHRoZSBicm9hZCB1c2Ugb2YgZGJ1cyBp
cyB3aGF0IHNldHMgYXBhcnQgT3BlbkJNQyBhbmQgdGhlIGRlc2t0b3AgTGludXggZGlzdHJvIEkg
aGFkIGJlZW4gdXNpbmcuIEkgaGVhcmQgb3B0aW1pemF0aW9uIGlzIGJlc3QgZG9uZSB3b3JrbG9h
ZCBieSB3b3JrbG9hZCwgcGVyaGFwcyB0aGlzIHJhdGlvbmFsZSBhcHBsaWVzIHRvIHZpc3VhbGl6
YXRpb24gdG9vPw0KDQoNCg0KSSByZWFsaXplIEkgd2FzIG1vc3RseSB0YWxraW5nIGFib3V0IHZp
c3VhbGl6aW5nIHRoZSBydW4tdGltZSBzdGF0ZSBvZiB0aGUgc3lzdGVtIHJhdGhlciB0aGFuIGJ1
aWxkLXRpbWUsIGJ1dCB3ZSBjb3VsZCB2aXN1YWxpemUgdGhlIHJ1bi10aW1lIGFzcGVjdCBvZiBz
eXN0ZW1kIHVuaXRzIHRvbyBzaW5jZSBJIGhhdmUgc2VlbiBtYW55IHRpbWVzIGEgZGJ1cyBtZXNz
YWdlIGV2ZW50dWFsbHkgdHJpZ2dlcmluZyBhIHN5c3RlbWQgdGFyZ2V0IHRvIGFjdXRhdGUgdGhl
IHN5c3RlbSwgc28gaXQgd291bGQgYmUgZ29vZCB0byBjb25zaWRlciBib3RoIGRidXMgYW5kIHN5
c3RlbWQgKGFuZCBtYXliZSBvdGhlciBwYXJ0cyBvZiB0aGUgc3lzdGVtPykgdG8gaGF2ZSBhIG1v
cmUgaG9saXN0aWMgdmlldyBvZiB0aGUgQk1Doa9zIG9wZXJhdGlvbnMuDQoNCg0KDQpUaGFua3MN
Cg0KU3VpDQoNCg0KDQotLQ0KQmVzdCByZWdhcmRzLA0KS29uc3RhbnRpbiBLbHVibmljaGtpbiwN
CmxlYWQgZmlybXdhcmUgZW5naW5lZXIsDQpzZXJ2ZXIgaGFyZHdhcmUgUiZEIGdyb3VwLA0KWWFu
ZGV4IE1vc2NvdyBvZmZpY2UuDQp0ZWw6ICs3LTkwMy01MTAtMzMtMzMNCg0K

--_000_HK2PR04MB3826D8BD926FE991F3764912FED20HK2PR04MB3826apcp_
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
Thank you for the help, I will test it.</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Konstan=
tin Klubnichkin &lt;kitsok@yandex-team.ru&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA4=D4=C222=C8=D5 15:25<br>
<b>=CA=D5=BC=FE=C8=CB:</b> zhouyuanqing8@outlook.com &lt;zhouyuanqing8@outl=
ook.com&gt;; Sui Chen &lt;suichen6@gmail.com&gt;; openbmc@lists.ozlabs.org =
&lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=B3=AD=CB=CD:</b> uperic@163.com &lt;uperic@163.com&gt;; shinerocky@yaho=
o.com &lt;shinerocky@yahoo.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: about power control.=BB=D8=B8=B4: Call for Gardeni=
ng Tasks</font>
<div>&nbsp;</div>
</div>
<div>
<div>Hello!</div>
<div>&nbsp;</div>
<div>I'll try to answer your question about rwfs image.</div>
<div>I had the same issue plus I wanted to be able to create some data in r=
wfs segment.</div>
<div>Thus I've created obmc-phosphor-image.bbappend where I do the followin=
g:</div>
<div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>RWFS_SIZE ?=3D &quot;4194304&quot;</div>
<div>OVERLAY_MKFS_OPTS =3D &quot; --pad=3D${RWFS_SIZE}&quot;</div>
</div>
<div>
<div>&nbsp;</div>
<div># Override JFFS image creation</div>
<div>do_generate_rwfs_static() {</div>
<div>rwdir=3D$(pwd)</div>
<div>rwdir=3D${rwdir}/jffs2</div>
<div>image=3Drwfs.jffs2</div>
<div>&nbsp;</div>
<div>rm -rf $rwdir $image &gt; /dev/null 2&gt;&amp;1</div>
<div>mkdir -p ${rwdir}/cow</div>
<div>rwdir=3D${rwdir}/cow</div>
<div>&nbsp;</div>
<div>bbplain &quot;DEBUG: Creating RWFS image &quot;</div>
<div>&nbsp;</div>
<div>mv ${IMAGE_ROOTFS}/rwfs/* ${rwdir}/</div>
<div>rm -rf ${IMAGE_ROOTFS}/rwfs</div>
<div>&nbsp;</div>
<div># Create necessary files, directories, etc in ${rwdir}</div>
<div>${JFFS2_RWFS_CMD} ${OVERLAY_MKFS_OPTS} ${OVERLAY_MKFS_OPTS} --squash-u=
ids</div>
<div>}</div>
</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>&nbsp;</div>
<div>At the end I have the normal JFFS2 image instead of empty.</div>
<div>&nbsp;</div>
<div>Hope this can help.</div>
<div>&nbsp;</div>
<div>21.04.2020, 18:24, &quot;zhouyuanqing8@outlook.com&quot; &lt;zhouyuanq=
ing8@outlook.com&gt;:</div>
<blockquote>
<div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
Hi&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; This is a very good idea. As the first time to do openbmc, I =
look forward to it. Currently, I am being troubled by the problems you desc=
ribe.</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp;&nbsp;The following questions, please also help you answer it,=
 thank you very much.</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; 1.I modified the dts file, how to use the command &quot;bitba=
ke -f linux-aspeed&quot; to Generate fitimage and dub=A3=BF</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; &nbsp;Now,&nbsp;I modify the dts file in the kernel source di=
rectory. When I compile, bitbake will re-fetch the source code, decompress,=
 patch, configure, and compile, causing my changes to be overwritten. I cur=
rently use manual call scripts to compile dts files
 and make images for debugging.Is there a way to make bitbake skip the prev=
ious steps and compile directly=A3=BF</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; &nbsp;2.The size of image-rwfs is 0, I want to use rwfs debug=
ging, how to configure to generate a normal image-rwfs?&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou &nbsp; &nbsp; 9443 =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4=D4=C2 &nbsp; &nbsp; &nbsp; &nbs=
p;7 17:27 obmc-phosphor-image-xxh-20200407092558.rootfs.manifest
<div>&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou 18214912 &nbsp=
; &nbsp; &nbsp; &nbsp; 4=D4=C2 &nbsp; &nbsp;7 17:27 obmc-phosphor-image-<sp=
an style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'helv=
etica' ,sans-serif">xxh</span>-20200407092558.rootfs.squashfs-xz</div>
<div>&nbsp; &nbsp; &nbsp;-rw-rw-r--. 2 harleyzhou harleyzhou 33554432 &nbsp=
; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; 7 17:27 obmc-phosphor-image-<span styl=
e=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'helvetica' =
,sans-serif">xxh</span>-20200407092558.static.mtd</div>
<div>&nbsp; &nbsp; &nbsp;-rw-rw-r--. 2 harleyzhou harleyzhou 33566720 &nbsp=
; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; 7 17:28 obmc-phosphor-image-<span styl=
e=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'helvetica' =
,sans-serif">xxh</span>-20200407092558.static.mtd.all.tar</div>
<div>&nbsp; &nbsp; &nbsp;-rw-rw-r--. 2 harleyzhou harleyzhou 22384640 &nbsp=
; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; 7 17:28 obmc-phosphor-image-<span styl=
e=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'helvetica' =
,sans-serif">xxh</span>-20200407092558.static.mtd.tar</div>
<div>&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou &nbsp; 308218 =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4=D4=C2 &nbsp; &nbsp; &nbsp;7 17:2=
7 obmc-phosphor-image-<span style=3D"background-color:#ffffff; font-family:=
'calibri' ,'arial' ,'helvetica' ,sans-serif">xxh</span>-20200407092558.test=
data.json</div>
<div>&nbsp; &nbsp; &nbsp;-rw-r--r--. 2 harleyzhou harleyzhou &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<spa=
n style=3D"background-color:#00ff00">&nbsp;4=D4=C2 &nbsp; 7 17:27 obmc-phos=
phor-image-</span><span style=3D"background-color:#00ff00; font-family:'cal=
ibri' ,'arial' ,'helvetica' ,sans-serif">xxh</span><span style=3D"backgroun=
d-color:#00ff00">.jffs2</span></div>
</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; 3. I did not find the source code of &quot;pgood_wait&quot; a=
nd &quot;power_control.exe&quot; in obmc-op-control-power? where can I get =
it ?</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; 4.<span style=3D"background-color:#ffffff; color:#24292e">Ope=
nBMC uses&nbsp;</span><a href=3D"https://www.freedesktop.org/wiki/Software/=
systemd/" style=3D"box-sizing:border-box; color:rgb(3 ,102 ,214)">systemd</=
a><span style=3D"background-color:#ffffff; color:#24292e">&nbsp;to
 manage all processes, So i&nbsp;analyzed the process of systemd starting p=
rocess and saw &quot;default.target-&gt; basic.target-&gt; sysinit.target-&=
gt; local-fs.target&quot;, there is no content behind.please help to provid=
e clues of systemd starting process.</span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; color:#24292e">&nbsp; &nbsp; 5.I u=
nderstand the following execution process of power-on , help check if it is=
 correct.</span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; &nbsp; &nbsp;a).rest or busctl send power-on commands to syst=
emd through d-bus messages.</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp; &nbsp; &nbsp; &nbsp;b).systemd find the <span style=3D"background-co=
lor:#ffffff; color:#24292e; font-family:'pingfang sc'; font-size:12px">
obmc-chassis-poweron@.target</span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; color:#24292e; font-family:'pingfa=
ng sc'; font-size:12px">&nbsp; &nbsp; &nbsp;
<span style=3D"background-color:#ffffff; color:#000000; font-family:'calibr=
i' ,'arial' ,'helvetica' ,sans-serif; font-size:16px">
&nbsp; c).systemd find the&nbsp;<span style=3D"background-color:#ffffff; co=
lor:#24292e; font-family:'pingfang sc'; font-size:12px">obmc-power-start@.t=
arget</span></span></span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; color:#24292e; font-family:'pingfa=
ng sc'; font-size:12px"><span style=3D"background-color:#ffffff; color:#000=
000; font-family:'calibri' ,'arial' ,'helvetica' ,sans-serif; font-size:16p=
x"><span style=3D"background-color:#ffffff; color:#24292e; font-family:'pin=
gfang sc'; font-size:12px">&nbsp;
 &nbsp; &nbsp; &nbsp; <span style=3D"background-color:#ffffff; color:#00000=
0; font-family:'calibri' ,'arial' ,'helvetica' ,sans-serif; font-size:16px"=
>
d).systemd find the&nbsp;<span style=3D"background-color:#ffffff; color:#24=
292e; font-family:'pingfang sc'; font-size:12px"><a href=3D"mailto:op-power=
-start@0.service">op-power-start@0.service</a></span><span style=3D"color:#=
24292e; font-family:'pingfang sc'; font-size:12px; margin:0px">&nbsp;</span=
></span></span></span></span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; color:#24292e; font-family:'pingfa=
ng sc'; font-size:12px"><span style=3D"background-color:#ffffff; color:#000=
000; font-family:'calibri' ,'arial' ,'helvetica' ,sans-serif; font-size:16p=
x"><span style=3D"background-color:#ffffff; color:#24292e; font-family:'pin=
gfang sc'; font-size:12px"><span style=3D"background-color:#ffffff; color:#=
000000; font-family:'calibri' ,'arial' ,'helvetica' ,sans-serif; font-size:=
16px"><span style=3D"color:#24292e; font-family:'pingfang sc'; font-size:12=
px; margin:0px">&nbsp;
 &nbsp; &nbsp; &nbsp;&nbsp;<span style=3D"background-color:#ffffff; color:#=
000000; font-family:'calibri' ,'arial' ,'helvetica' ,sans-serif; font-size:=
16px; margin:0px">e).<span style=3D"background-color:#ffffff; font-family:'=
calibri' ,'arial' ,'helvetica' ,sans-serif">systemd start
 a thread and execute&nbsp;&quot;<span style=3D"background-color:#ffffff; c=
olor:#24292e; font-family:'pingfang sc'; font-size:12px">busctl call `mappe=
r get-service /org/openbmc/control/power%i` /org/openbmc/control/power%i or=
g.openbmc.control.Power setPowerState I 1&quot;</span></span></span></span>=
</span></span></span></span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
appendix=A3=BA</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">ls
<a href=3D"mailto:obmc-chassis-poweron@0.target.requires">obmc-chassis-powe=
ron@0.target.requires</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:op-power-start@0.servic">op=
-power-start@0.servic</a>e&nbsp;
<a href=3D"mailto:op-wait-power-on@0.service">op-wait-power-on@0.service</a=
></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px; min-height:17px">&nbsp;</p=
>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">cat obmc-chassis-poweron@.target&nbsp;</span>=
</p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">[Unit]</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Description=3DChassis%i (Power On)</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Wants=3Dmulti-user.target</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">After=3Dmulti-user.target</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:Wants=3Dmapper-wait@-xyz-op=
enbmc_project-state-chassis%i.service">Wants=3Dmapper-wait@-xyz-openbmc_pro=
ject-state-chassis%i.service</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:After=3Dmapper-wait@-xyz-op=
enbmc_project-state-chassis%i.service">After=3Dmapper-wait@-xyz-openbmc_pro=
ject-state-chassis%i.service</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Wants=3Dmapper-subtree-remove@-xyz-openbmc\x5=
fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransitio=
n.service</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">After=3Dmapper-subtree-remove@-xyz-openbmc\x5=
fproject-software\x3Axyz.openbmc_project.Software.ActivationBlocksTransitio=
n.service</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px; min-height:17px">&nbsp;</p=
>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">cat
<a href=3D"mailto:op-power-start@0.servic">op-power-start@0.servic</a>e&nbs=
p;</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">[Unit]</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Description=3DStart Power%i</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:Wants=3Dobmc-power-start@%i=
.target">Wants=3Dobmc-power-start@%i.target</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:Before=3Dobmc-power-start@%=
i.target">Before=3Dobmc-power-start@%i.target</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:After=3Dobmc-power-start-pr=
e@%i.target">After=3Dobmc-power-start-pre@%i.target</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">After=3Dobmc-fan-control.target</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:Wants=3Dmapper-wait@-org-op=
enbmc-control-power%i.service">Wants=3Dmapper-wait@-org-openbmc-control-pow=
er%i.service</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:After=3Dmapper-wait@-org-op=
enbmc-control-power%i.service">After=3Dmapper-wait@-org-openbmc-control-pow=
er%i.service</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">[Service]</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">RemainAfterExit=3Dyes</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Type=3Doneshot</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">ExecStart=3D/bin/sh -c &quot;busctl call `map=
per get-service /org/openbmc/control/power%i` /org/openbmc/control/power%i =
org.openbmc.control.Power setPowerState i 1&quot;</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">SyslogIdentifier=3Dop-power-start</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">[Install]</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:WantedBy=3Dobmc-host-start@=
%i.target">WantedBy=3Dobmc-host-start@%i.target</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px; min-height:17px">&nbsp;</p=
>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">cat obmc-power-start@.target&nbsp;</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">[Unit]</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Description=3DPower%i On</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:After=3Dobmc-power-start-pr=
e@%i.target">After=3Dobmc-power-start-pre@%i.target</a></span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">Wants=3Dmulti-user.target</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e"><a href=3D"mailto:Conflicts=3Dobmc-chassis-po=
weroff@%i.target">Conflicts=3Dobmc-chassis-poweroff@%i.target</a></span></p=
>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">RefuseManualStart=3Dyes</span></p>
<p style=3D"font:12px 'pingfang sc'; margin:0px"><span style=3D"background-=
color:#ffffff; color:#24292e">RefuseManualStop=3Dyes</span></p>
</div>
<div>
<div>&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; color:#323130; font-family:'dengxi=
an'; text-align:justify">Thanks</span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; color:#323130; font-family:'dengxi=
an'; text-align:justify">Harley</span></div>
<hr style=3D"width:98%">
<div><font color=3D"#000000" face=3D"Calibri, sans-serif" style=3D"font-siz=
e:11pt"><strong>=B7=A2=BC=FE=C8=CB:</strong> openbmc &lt;<a href=3D"mailto:=
openbmc-bounces&#43;zhouyuanqing8=3Doutlook.com@lists.ozlabs.org">openbmc-b=
ounces&#43;zhouyuanqing8=3Doutlook.com@lists.ozlabs.org</a>&gt; =B4=FA=B1=
=ED Sui Chen
 &lt;<a href=3D"mailto:suichen6@gmail.com">suichen6@gmail.com</a>&gt;<br>
<strong>=B7=A2=CB=CD=CA=B1=BC=E4:</strong> 2020=C4=EA4=D4=C221=C8=D5 1:05<b=
r>
<strong>=CA=D5=BC=FE=C8=CB:</strong> <a href=3D"mailto:openbmc@lists.ozlabs=
.org">openbmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:openbmc@lists.ozla=
bs.org">openbmc@lists.ozlabs.org</a>&gt;<br>
<strong>=D6=F7=CC=E2:</strong> Re: Call for Gardening Tasks</font>
<div>&nbsp;</div>
</div>
<div lang=3D"ZH-CN">
<div>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US">&gt; On Apr 11, 2020, at 8:15 AM, Andrew Geissler &lt;=
geissonator at gmail.com&gt; wrote:</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US">&gt; Systemd Visualization</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US">&gt; Another complicated area of OpenBMC is our system=
d targets and services. Building on the upstream tools to visualize our sys=
temd targets and services would be useful to new people.</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">&nbsp;</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">&#43;1 to visualization, and =
I have a few thoughts on this ---</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">My lacking a mental model of =
how an OpenBMC system works had been my pain point in the first few months =
working with OpenBMC (I=A1=AFm a bit new to this area), so after learning t=
he minimal set of survival skills I did something
 similar to what you mentioned C visualizing the messages passed between di=
fferent dbus peers (and conveniently, IPMI traffic, as IPMI-related dbus me=
ssages exposing all IPMI payload comprise most of the dbus traffic on that =
particular system I was working
 on.)</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">&nbsp;</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">I think packet analysis tools=
 such as Wireshark and graphics frame analysis tools such as RenderDoc, or =
system event-based Windows Performance tool like GPUView provide great exam=
ples of what people might expect to
 achieve with a visualization tool: capture, inspect and (sometimes) playba=
ck, across multiple layers in the software/hardware stack. Many similar exi=
sting tools process sequences of events, and in this case of BMCs, the even=
ts could be dbus messages. I found
 a prototype visualizer made at work greatly helpful in explaining to new t=
eam members some basic concepts and the IPMI stack on the BMC.</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">&nbsp;</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">The IPMI stack is interesting=
 because it=A1=AFs one noticeable workload on the particular BMC system I h=
ad been working on; in my current limited understanding, having lots of I/O=
 capability to connect to hundreds of sensors
 is one of the many features that set apart a BMC chip and a similarly powe=
rful smartphone chip, and the broad use of dbus is what sets apart OpenBMC =
and the desktop Linux distro I had been using. I heard optimization is best=
 done workload by workload, perhaps
 this rationale applies to visualization too?</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">&nbsp;</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">I realize I was mostly talkin=
g about visualizing the run-time state of the system rather than build-time=
, but we could visualize the run-time aspect of systemd units too since I h=
ave seen many times a dbus message eventually
 triggering a systemd target to acutate the system, so it would be good to =
consider both dbus and systemd (and maybe other parts of the system?) to ha=
ve a more holistic view of the BMC=A1=AFs operations.</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">&nbsp;</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">Thanks</span></p>
<p style=3D"font-family:'dengxian'; font-size:10.5pt; margin:0cm 0cm 0.0001=
pt 0cm; text-align:justify">
<span lang=3D"EN-US" style=3D"font-size:12pt">Sui</span></p>
</div>
</div>
</div>
</div>
</blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>Best regards,</div>
<div>Konstantin Klubnichkin,</div>
<div>lead firmware engineer,</div>
<div>server hardware R&amp;D group,</div>
<div>Yandex Moscow office.</div>
<div>tel: &#43;7-903-510-33-33</div>
<div>&nbsp;</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB3826D8BD926FE991F3764912FED20HK2PR04MB3826apcp_--
