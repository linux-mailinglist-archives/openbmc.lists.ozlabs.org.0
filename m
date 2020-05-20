Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6D1DB2C5
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 14:11:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rs6H00przDqYh
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 22:11:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.35;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ZQTIwseZ; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254035.outbound.protection.outlook.com [40.92.254.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rs5J13vpzDqXw
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 22:10:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlTvtxIfAogX0fpdxclPAZRubgyEmGzqkr1SVdaNLGBlF5leAWA627QwSA2mkmUVkkJdBkDjCUc2ftL6XHErsoKlBg7ox8Cxb0zNzuPrFUVP4flQyMKPdvEYj1Sj+bRSXDbf2ou9GJ2FtES3Fg/fU+wXPnU/nSboRl9R32zGMEEdT7rWh4uHffWFo+8s/Shf/DSrnXuXSHSLhxtQwebaTZyE08j1/43XsiG2LK9sw2VJdLpvjIi/goyJcgw+aeHso/7ekcj1ezxSBbSpTp5n2X6Cs1jsEBpdiTmYiruydtVncr8V9bb160vIp7t1FuZowMWHMEovG39GirnxG+8dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP+3ovX4pgoCXFkAYip2KORjv1SCskxQqVxLrRNYOA4=;
 b=CGGQzY7/i7wtfMVvGj+RmfB50P8DDKyadhadiQVDJTkZuKubTLrZQZxvhulLIse40oUKVwxKOo5ccogxzmDpVYIi8WpXCppZp4xZxF2lbt+0zg1cDlaLs7vQlwxY4k8N+PL809a5eqox62Y4uS8liiUDLDZimX6Nr68mknn6EAbz9Z2yhxgSOWv9hsK+P1f8D7P+W+GqY5fkdUdZrm2H4gukg+7h4MSsO9UZrjRMK77Lt9bSpfTWyOO7HY8rFShDNpaWDlKFNY9HXGKgnClWMLOM/oC1ul6lyJPM3Szlk6+H0Knr1WxRkgpI72DWnqDnt+5e9/G80VrfYImY9/Ksog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP+3ovX4pgoCXFkAYip2KORjv1SCskxQqVxLrRNYOA4=;
 b=ZQTIwseZolcg9sWU8dniyg4oZqMb4aDdGO651HnZco7bwQkRhP7aKP51bxBuIYKkxRFw7C/y3q8wAKnhVrO+FWEiKp/xLPPiN8KVDcrRQ+RskZ62/FDzyVybrn3r7YoReFsPBhqqZkm2M1wwVzb5yyZ/XMiuAwyj9n369hilauevm2Ltsab0iLFffyLoVWUKsapilAomsQORoP6QYCvIEFiBc1J69hqg/B1jt6J5spve01m4/CKFJXaLg+kRgkA3SGdeB/24JUPU2R66o52o6AqEV68clv8D/wGh3FytRrAlvv8R4ZYfAyHWl48P0BQgzBw/17ZZHqTeF9gAdEmzTA==
Received: from HK2APC01FT042.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4e) by
 HK2APC01HT190.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::390)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 12:10:03 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::48) by HK2APC01FT042.mail.protection.outlook.com
 (2a01:111:e400:7ebc::322) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 12:10:03 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 12:10:03 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Brandon Wyman <bjwyman@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogYWJvdXQgaTJjc2V0IHRvb2w=?=
Thread-Topic: about i2cset tool
Thread-Index: AQHWLa7MbAvo7dLSNkS2YWkgRula2qivyvOAgABjYbqAALQnSQ==
Date: Wed, 20 May 2020 12:10:03 +0000
Message-ID: <HK2PR04MB382665AC5110434F0987D493FEB60@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <28c93e52-3e69-79b4-69f0-c30d2422dbc2@gmail.com>,
 <HK2PR04MB38264DE2EBB55794E2913D3FFEB60@HK2PR04MB3826.apcprd04.prod.outlook.com>
In-Reply-To: <HK2PR04MB38264DE2EBB55794E2913D3FFEB60@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3F03BFCF538D4B4F17BB028FBA012AED9170DF6667CAC8EB508D44FD3A12F350;
 UpperCasedChecksum:8CA0E757F6C1E22FCE745B4690DC181D5BAA54ECC8DC340ECFEA9018ACE71577;
 SizeAsReceived:7122; Count:45
x-tmn: [99sRV4jfbYYty51UiBHfLk8v32YW1u7H]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: aba1b6ac-beb5-43fe-d96d-08d7fcb6ba2a
x-ms-traffictypediagnostic: HK2APC01HT190:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pHHNUU8Ssy9eQCVRcSy9VM633rivIjr2eibtmMVIODrP6XJ2zucoTw66PKk5UOElSNNgPBmArqvd77d9/4XOxTSyPF4ZMKeRH431+aFkLR5gjkmMzi/lGewirZzzk5IFzmYhMtxsxCcYokjWKMxkN3e0i5vy5tx/FAJkNbHdSv+fS7ZQ+qMP/EfNNb0f4a0HZm+j1YVP/mML1Ni6Ie0iV29CRRDjdtVNWiZcDg2ja1qoGVWje8mypuLNsNNA26r8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: Op4eNPA/BRwxS/6fz50MVu/DwUC2qGgdApH2rGo0+lHoJnz7XEmD3Ax+Ty4JwpSN6nIicCGwVyJYY5Zi+7d9a3XTRJq9T4xzJOspXQquDKyB+K2/QRA9tyFoWJYkZtmlyLUEBAydA2+5IiEmapHrNA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB382665AC5110434F0987D493FEB60HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: aba1b6ac-beb5-43fe-d96d-08d7fcb6ba2a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 12:10:03.2702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT190
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

--_000_HK2PR04MB382665AC5110434F0987D493FEB60HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJhbmRvbqOsDQoNCiAgICBUaGlzIGlzc3VlIGhhcyBiZWVuIHJlc29sdmVkLCB0aGUgb2xk
IENQTEQgdmVyc2lvbiBkb2VzIG5vdCBzdXBwb3J0IHdyaXRpbmcgdG8gdGhpcyByZWdpc3Rlci4N
Cg0KVGhhbmtzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IHpo
b3V5dWFucWluZzhAb3V0bG9vay5jb20gPHpob3V5dWFucWluZzhAb3V0bG9vay5jb20+DQq3osvN
yrG85DogMjAyMMTqNdTCMjDI1SA5OjUyDQrK1bz+yMs6IEJyYW5kb24gV3ltYW4gPGJqd3ltYW5A
Z21haWwuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQrW98ziOiC72Li0OiBhYm91dCBpMmNzZXQgdG9vbA0KDQpIaSBCcmFuZG9uLA0KDQog
ICBTb3JyeSwgSSBkaWQgbm90IHJldGFpbiB0aGUgb3V0cHV0IGluZm9ybWF0aW9uIG9mIHRoZSBp
MmNzZXQgY29tbWFuZCBiZWZvcmUsIEkgY29waWVkIHRoZSBvdXRwdXQgaW5mb3JtYXRpb24gZnJv
bSB0aGUgaTJjZ2V0IGNvbW1hbmQuDQoNCiAgIEkgdHJpZWQgdGhlIGZvbGxvd2luZyBjb21tYW5k
LCB0aGUgcmVnaXN0ZXIgc3RpbGwgY2Fubm90IGJlIHdyaXR0ZW4sIGFuZCB0aGVyZSB3YXMgbm8g
ZXJyb3IgbWVzc2FnZS5UaGlzIGNvbW1hbmQgaXMgdG8gdHVybiBvbiB0aGUgTEVEIGxpZ2h0Lg0K
DQovdXNyL3NiaW4jIGkyY3NldCAtZiA5IDB4MTAgMHg4MiAweGZmZmYgdw0KV0FSTklORyEgVGhp
cyBwcm9ncmFtIGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0YSBsb3NzIGFuZCB3
b3JzZSENCkkgd2lsbCB3cml0ZSB0byBkZXZpY2UgZmlsZSAvZGV2L2kyYy05LCBjaGlwIGFkZHJl
c3MgMHgxMCwgZGF0YSBhZGRyZXNzDQoweDgyLCBkYXRhIDB4MTAyLCBtb2RlIHdvcmQuDQpDb250
aW51ZT8gW1kvbl0gWQ0KDQogICAgaTJjZ2V0IGNvbW1hbmQgd29ya3MganVzdCBmaW5lLg0KL3Vz
ci9zYmluIyBpMmNnZXQgOSAweDEwIDB4MDIgaSAzDQpXQVJOSU5HISBUaGlzIHByb2dyYW0gY2Fu
IGNvbmZ1c2UgeW91ciBJMkMgYnVzLCBjYXVzZSBkYXRhIGxvc3MgYW5kIHdvcnNlIQ0KSSB3aWxs
IHJlYWQgZnJvbSBkZXZpY2UgZmlsZSAvZGV2L2kyYy05LCBjaGlwIGFkZHJlc3MgMHgxMCwgZGF0
YSBhZGRyZXNzDQoweDAyLCAzIGJ5dGVzIHVzaW5nIHJlYWQgSTJDIGJsb2NrIGRhdGEuDQpDb250
aW51ZT8gW1kvbl0gWQ0KMzogMHgwMyAweDAwIDB4MDANCg0KL3Vzci9zYmluIyBpMmNnZXQgOSAw
eDEwIDB4MDIgaSAzDQpXQVJOSU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMg
YnVzLCBjYXVzZSBkYXRhIGxvc3MgYW5kIHdvcnNlIQ0KSSB3aWxsIHJlYWQgZnJvbSBkZXZpY2Ug
ZmlsZSAvZGV2L2kyYy05LCBjaGlwIGFkZHJlc3MgMHgxMCwgZGF0YSBhZGRyZXNzDQoweDAyLCAz
IGJ5dGVzIHVzaW5nIHJlYWQgSTJDIGJsb2NrIGRhdGEuDQpDb250aW51ZT8gW1kvbl0gWQ0KMzog
MHgwMyAweGZmIDB4MDANCg0KL3Vzci9zYmluIyBpMmNnZXQgOSAweDEwIDB4MDIgaSAzDQpXQVJO
SU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMgYnVzLCBjYXVzZSBkYXRhIGxv
c3MgYW5kIHdvcnNlIQ0KSSB3aWxsIHJlYWQgZnJvbSBkZXZpY2UgZmlsZSAvZGV2L2kyYy05LCBj
aGlwIGFkZHJlc3MgMHgxMCwgZGF0YSBhZGRyZXNzDQoweDAyLCAzIGJ5dGVzIHVzaW5nIHJlYWQg
STJDIGJsb2NrIGRhdGEuDQpDb250aW51ZT8gW1kvbl0geQ0KMzogMHgwMyAweDAwIDB4MDANCg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBvcGVuYm1jIDxvcGVu
Ym1jLWJvdW5jZXMremhvdXl1YW5xaW5nOD1vdXRsb29rLmNvbUBsaXN0cy5vemxhYnMub3JnPiC0
+rHtIEJyYW5kb24gV3ltYW4gPGJqd3ltYW5AZ21haWwuY29tPg0Kt6LLzcqxvOQ6IDIwMjDE6jXU
wjIwyNUgMzoyNA0KytW8/sjLOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZz4NCtb3zOI6IFJlOiBhYm91dCBpMmNzZXQgdG9vbA0KDQoNCg0KT24gMjAy
MC0wNS0xOSAwMjo0MCwgemhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbTxtYWlsdG86emhvdXl1YW5x
aW5nOEBvdXRsb29rLmNvbT4gd3JvdGU6DQpIaSBBbGwNCg0KICAgIEkgdXNlIHRoZSBpMmNnZXQg
dG8gcmVhZCB0aGUgZGV2aWNlIGRhdGEsIGJ1dCB0aGUgaTJjc2V0IGRpZCBub3Qgd3JpdGUgdGhl
IGRhdGEgdG8gdGhlIGRldmljZSwgYW5kIHRoZSBvcGVyYXRpb24gb2YgaTJjc2V0IGRpZCBub3Qg
cmVwb3J0IGFueSBlcnJvcnMuDQoNCmZvciBleGFtcGxlOg0KDQo6L3Vzci9zYmluIyBpMmNnZXQg
OSAweDEwIDB4MDAgaSAzDQpXQVJOSU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJ
MkMgYnVzLCBjYXVzZSBkYXRhIGxvc3MgYW5kIHdvcnNlIQ0KSSB3aWxsIHJlYWQgZnJvbSBkZXZp
Y2UgZmlsZSAvZGV2L2kyYy05LCBjaGlwIGFkZHJlc3MgMHgxMCwgZGF0YSBhZGRyZXNzDQoweDAw
LCAzIGJ5dGVzIHVzaW5nIHJlYWQgSTJDIGJsb2NrIGRhdGEuDQpDb250aW51ZT8gW1kvbl0NCjM6
IDB4MDIgMHgzMiAweGNjDQoNCjovdXNyL3NiaW4jIGkyY3NldCA5IDB4MTAgMHg4MiAweDAxMDEg
Mg0KV0FSTklORyEgVGhpcyBwcm9ncmFtIGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2Ug
ZGF0YSBsb3NzIGFuZCB3b3JzZSENCkkgd2lsbCByZWFkIGZyb20gZGV2aWNlIGZpbGUgL2Rldi9p
MmMtOSwgY2hpcCBhZGRyZXNzIDB4MTAsIGRhdGEgYWRkcmVzcw0KMHgwMCwgdXNpbmcgcmVhZCB3
b3JkIGRhdGEuDQoNCldlbGwsIHRoYXQgaXMgYSBiaXQgb2RkLiBJdCBsb29rcyBsaWtlIHRoYXQg
anVzdCBkaWQgYSByZWFkLCBub3QgYSB3cml0ZS4NCg0KDQpEbyB5b3UgbmVlZCB0byB1c2UgdGhl
IGZvcmNlIGFjY2VzcyBvcHRpb24/IFdoYXQgaXMgdGhhdCAyPyBTaG91bGQgaXQgYmUgYSB3b3Jk
ICh3KT8NCg0KaHR0cHM6Ly9saW51eC5kaWUubmV0L21hbi84L2kyY3NldA0KDQppMmNzZXQgLWYg
OSAweDEwIDB4ODIgMHgwMTAxIHcNCg0Kd2hlbiBJIGNoZWNrIHRoZSAweDgyIHJlZ6OsdGhlIHZh
bHVlIGlzIG5vdCBjaGFuZ2VkLg0KDQpUaGFua3MNCmhhcmxleQ0KDQo=

--_000_HK2PR04MB382665AC5110434F0987D493FEB60HK2PR04MB3826apcp_
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
Hi&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Ari=
al, Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: i=
nline !important">Brandon=A3=AC</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">&nbsp; &nbsp; This issue has been resolved, the old CPLD version =
does not support writing to this register.<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> zhouyua=
nqing8@outlook.com &lt;zhouyuanqing8@outlook.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA5=D4=C220=C8=D5 9:52<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Brandon Wyman &lt;bjwyman@gmail.com&gt;; openbmc=
@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=D6=F7=CC=E2:</b> =BB=D8=B8=B4: about i2cset tool</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Brandon,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;Sorry, I did not retain the output information of the i2cset c=
ommand before, I copied the output information from the i2cget command.</di=
v>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>&nbsp; &nbsp;I tried the following command, the register still cannot=
 be written,&nbsp;and there was no error message.This command is to turn on=
 the LED light.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><span><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; =
background-color:rgb(255,255,255); display:inline!important">/usr/sbin#<spa=
n>&nbsp;</span></span>i2cset -f 9 0x10 0x82 0xffff w<br>
</span>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will write to device file /dev/i2c-9, chip address 0x10, data addres=
s<br>
</div>
<div>0x82, data 0x102, mode word.<br>
</div>
<div>Continue? [Y/n] Y<br>
</div>
<span></span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>&nbsp; &nbsp;&nbsp;i2cget command works just fine.<span style=3D"font=
-family:Calibri,Arial,Helvetica,sans-serif; background-color:rgb(255,255,25=
5); display:inline!important"></span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>/usr/sbin# i2cget 9 0x10 0x02 i 3<br>
</span>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x02, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n] Y<br>
</div>
<div>3: 0x03 0x00 0x00<br>
</div>
<div><br>
</div>
<div>/usr/sbin# i2cget 9 0x10 0x02 i 3<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x02, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n] Y<br>
</div>
<div>3: 0x03 0xff 0x00<br>
</div>
<div><br>
</div>
<div>/usr/sbin# i2cget 9 0x10 0x02 i 3<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x02, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n] y<br>
</div>
<div>3: 0x03 0x00 0x00</div>
<div><br>
</div>
<span></span></div>
<div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> openb=
mc &lt;openbmc-bounces&#43;zhouyuanqing8=3Doutlook.com@lists.ozlabs.org&gt;=
 =B4=FA=B1=ED Brandon Wyman &lt;bjwyman@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA5=D4=C220=C8=D5 3:24<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: about i2cset tool</font>
<div>&nbsp;</div>
</div>
<div>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
<br>
</p>
<div class=3D"x_x_moz-cite-prefix">On 2020-05-19 02:40, <a class=3D"x_x_moz=
-txt-link-abbreviated" href=3D"mailto:zhouyuanqing8@outlook.com">
zhouyuanqing8@outlook.com</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi All</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; I use the i2cget to read the device data, but the i2cset did =
not write the data to the device, and the operation of i2cset did not repor=
t any errors.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
for example:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>:/usr/sbin# i2cget 9 0x10 0x00 i 3<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x00, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n]<br>
</div>
<div>3: 0x02 0x32 0xcc<br>
</div>
<div><br>
</div>
<div>:/usr/sbin# i2cset 9 0x10 0x82 0x0101 2<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<span>0x00, using read word data.</span></div>
</blockquote>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
Well, that is a bit odd. It looks like that just did a read, not a write.</=
p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
<br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
Do you need to use the force access option? What is that 2? Should it be a =
word (w)?<br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
<a class=3D"x_x_moz-txt-link-freetext" href=3D"https://linux.die.net/man/8/=
i2cset">https://linux.die.net/man/8/i2cset</a></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
i2cset -f 9 0x10 0x82 0x0101 w<br>
</p>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000">when&nbsp;</font><font face=3D"Calibri, Arial,=0A=
          Helvetica, sans-serif" color=3D"#000000"><span style=3D"">I</span=
></font><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" col=
or=3D"#000000">&nbsp;check
 the 0x82 reg=A3=ACthe value is not changed.</font></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000"><br>
</font></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000">Thanks</font></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000">harley</font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB382665AC5110434F0987D493FEB60HK2PR04MB3826apcp_--
