Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA11E53BA
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 04:12:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XWSF2SSrzDqK1
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 12:12:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.24;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Azl35RTc; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255024.outbound.protection.outlook.com [40.92.255.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XWQq6jJPzDqVT
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 12:11:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVX6z5wB9OqceiY3ewwoNLGT3dthRRFFMhtoogdVWCGI8BkjEJMVj192FjADwLbEBWJdWE4/uNAmIduqZ6UK5j+wuaNrfWz2gIZ2pc1Vcu6tDbOmW0DEwLpdp+Eca4dgrtSQ0gI0IjW18Hlf06VEFWq8xVj4W1ZktJ4tEK6/3FKWQ10niBQ1093TNMIdCnaJshDFftsFazYTxD4zvXxC/yUMWnzWLZNKjw/a0qYB61a4RRtYzAjSGPZIELKlT+7xeclvDV0ys11dtzicZ9EuKiiryXbcnsX2/JCrbZaGW7lYkml+IX9EQxBZ8kF3KvNoLar03PXO3M3lBv+R7EYecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+kRnaAhz38vmJ+3zWh7gf25qp8u+NjFEJ5juLCppWs=;
 b=lK3rp29q58hl3jeqN38rBdUFFMwaRLD1DnxJpCML1jLwkWBlXFzBLKY33lGEWxQOVaPB+oDqWKeq9fysONxW9mkbdCjS5lsMHg1xrOMZeb/ravoqWVtL6KztR+kCWlB0uVnVELmNuk8qOwSB5Qf29XwtwNlxRcRc+jDevwsUZZM8SfFCyNqC/A0jzjmNnY7qso+DIKfrwCiEnwTRng/z64BVLReuNVCNRBPDf7V6jLe9rqGAlZVWLYCQUE1ZMCjT5Az/DGpPqA9f4P6w4sVqsmsMYwIVF8huEEP5WEJUolf0ZYIaFYvsWzHLTcr6rHBXezhbtru20dQStC/GrMMq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+kRnaAhz38vmJ+3zWh7gf25qp8u+NjFEJ5juLCppWs=;
 b=Azl35RTcSFePgbQlrEcIqfRYZx7mO15rijsLNTFcFu0bxRPGsiix6Wgc7pwkUSC9nIkQU7vmRdUY8TTsLMBLFJDyIIf2S13DXIRbWRIS9Qp3DW9LxKm69ArHlga8GNCVmNW+o2mv+b2ktS/ecRnFOfRTsYdQqP7ACa/ikyyLK4K+FjcVt1L8uMNMjpy3DCvpOGBbBKOdnhXnDATkxjx2NvbHl7WrUTUcwe48jlMsmEtfyfo2O5PHZkaGwGcC88voe8BwilAXekH7vvp7IJjpo7lAYTvklzP4TCspwN2hyXcRTkV8JMnhj2q/T9oxlpTNM46oHIhgbI9M6RCujGH3LQ==
Received: from SG2APC01FT006.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::46) by
 SG2APC01HT128.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::486)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 28 May
 2020 02:11:24 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::47) by SG2APC01FT006.mail.protection.outlook.com
 (2a01:111:e400:7ebd::165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 02:11:24 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 02:11:24 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "Wang, Kuiying" <kuiying.wang@intel.com>
Subject: =?gb2312?B?u9i4tDogu9i4tDogQWJvdXQgRlJV?=
Thread-Topic: =?gb2312?B?u9i4tDogQWJvdXQgRlJV?=
Thread-Index: AQHWNGvnxEG4rUz0eEGs7cDZzKoAzai8wHNy
Date: Thu, 28 May 2020 02:11:24 +0000
Message-ID: <HK2PR04MB3826B0D0E48930B9F907B1B4FE8E0@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <0FA5C43C-DEBB-4671-84A1-EFA79FABF777@fb.com>
In-Reply-To: <0FA5C43C-DEBB-4671-84A1-EFA79FABF777@fb.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:BF1F6732D75ECBC7B62D1D5FCC0D486E908D7B7B2BD10F1E96CA4B0713ACA2F8;
 UpperCasedChecksum:3DB0122D36222453A70F89B25A558B5E8B76998ACBF41713C0D6402CE2CB6F2C;
 SizeAsReceived:6927; Count:45
x-tmn: [0ccIEav38bF9/Ts1zw+zRIcWYUHghGto]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 8bfbb5f7-92d4-498e-bb6f-08d802ac6c58
x-ms-traffictypediagnostic: SG2APC01HT128:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MSLPcTvZu9irNZQbXte+nDqIg/oduboihK5eIbyZDmwuCI3jZK9coRVHHIVIYRXSbiGLgx0QlQfq8o0LYOKRyj8y18hOKXhRq7sJsX+OCXDebRCnfYGMd6UQnprP6m9W6id8OLXTXyImV2m9Zp1bf8CQGtOgzPtMZUh73120QssT3C2V1lzlMwYTOIUQyh4SSGCsxlPXFQ7DfUvA5UXudIO/aLRJZnG67qzWrz6nebNR/uOszZBufy9NkISQRurX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: jgY88y5mIWVJlYD7DhR71nQKgdM8gqDObs8eEU7oBzu1jECdE+nnCsgVLxutajTBBWhcJn9UaYPp/8zzdkCsYF6i/WuzlLxtjbNw2XZol2jXu6kSBqgcNAEKSepl4jsopA2FU02OPEM6RhyZg6xnJA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826B0D0E48930B9F907B1B4FE8E0HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfbb5f7-92d4-498e-bb6f-08d802ac6c58
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 02:11:24.7410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT128
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826B0D0E48930B9F907B1B4FE8E0HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgVmlqYXkgYW5kIEt3aW4sDQoNCiAgICBJIHdpbGwgdXNlIGVudGl0eSBtYW5hZ2VyIHBhY2th
Z2UgYW5kIHRlc3QgaXQsIHRoYW5rIHlvdSB2ZXJ5IG11Y2ghDQoNClRoYW5rcywNCkhhcmxleS4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IFZpamF5IEtoZW1rYSA8
dmlqYXlraGVta2FAZmIuY29tPg0Kt6LLzcqxvOQ6IDIwMjDE6jXUwjI4yNUgNToxNQ0KytW8/sjL
OiDW3CDUtsflIDx6aG91eXVhbnFpbmc4QG91dGxvb2suY29tPjsgV2FuZywgS3VpeWluZyA8a3Vp
eWluZy53YW5nQGludGVsLmNvbT4NCrOty806IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPg0K1vfM4jogUmU6ILvYuLQ6IEFib3V0IEZSVQ0KDQoNCkhp
IEhhcmxleSwNCg0KWW91IGRvbqGvdCBuZWVkIGFueSBjb25maWd1cmF0aW9uIGZvciBlZXByb20g
aWYgeW91IGFyZSB1c2luZyBlbnRpdHkgbWFuYWdlciBwYWNrYWdlLiBKdXN0IGFkZCB0aGlzIHBh
Y2thZ2UgaW4geW91ciBpbWFnZSBhbmQgYXQgdGhlIHN0YXJ0IC91c3IvYmluL2ZydS1kZXZpY2Ug
cHJvY2VzcyB3aWxsIHN0YXJ0IHdoaWNoIHdpbGwgZW51bWVyYXRlIGFsbCBlZXByb20gZXhpc3Rl
ZCBpbiB0aGUgc3lzdGVtIGFuZCBjcmVhdGUgYSBkYnVzIGludGVyZmFjZSBmb3IgZWFjaCBmcnUg
ZGV2aWNlIGZvdW5kLiBJbiBteSBzeXN0ZW0sIGl0IHNob3dzIGxpa2UgYmVsb3cuDQoNClNlcnZp
Y2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5GcnVEZXZpY2U6DQoNCiAgICCpuKmkL3h5ei9vcGVuYm1j
X3Byb2plY3QvRnJ1RGV2aWNlDQoNCiAgICAgIKnAqaQveHl6L29wZW5ibWNfcHJvamVjdC9GcnVE
ZXZpY2UvMF84MA0KDQogICAgICCpwKmkL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzBf
ODENCg0KICAgICAgqcCppC94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS8xXzExMw0KDQog
ICAgICCpwKmkL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzJfMTEyDQoNCiAgICAgIKnA
qaQveHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvMl8xNg0KDQogICAgICCpwKmkL3h5ei9v
cGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzJfMjINCg0KICAgICAgqcCppC94eXovb3BlbmJtY19w
cm9qZWN0L0ZydURldmljZS8zXzEwNA0KDQogICAgICCpwKmkL3h5ei9vcGVuYm1jX3Byb2plY3Qv
RnJ1RGV2aWNlLzNfMTA4DQoNCiAgICAgIKnAqaQveHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZp
Y2UvM18xMTMNCg0KICAgICAgqcCppC94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS8zXzM2
DQoNCiAgICAgIKnAqaQveHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvM182OA0KDQogICAg
ICCpwKmkL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzNfODENCg0KICAgICAgqcCppC94
eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS82XzMyDQoNCiAgICAgIKnAqaQveHl6L29wZW5i
bWNfcHJvamVjdC9GcnVEZXZpY2UvNl8zMw0KDQogICAgICCpwKmkL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvRnJ1RGV2aWNlLzZfNzgNCg0KICAgICAgqcCppC94eXovb3BlbmJtY19wcm9qZWN0L0ZydURl
dmljZS82Xzc5DQoNCiAgICAgIKnAqaQveHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvNl84
MA0KDQogICAgICCpwKmkL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzdfNjkNCg0KICAg
ICAgqcCppC94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS84XzMxDQoNCiAgICAgIKnAqaQv
eHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvOV8zOQ0KDQogICAgICCpwKmkL3h5ei9vcGVu
Ym1jX3Byb2plY3QvRnJ1RGV2aWNlLzlfODQNCg0KICAgICAgqcCppC94eXovb3BlbmJtY19wcm9q
ZWN0L0ZydURldmljZS9BdmFfTV8yX1NTRF9BZGFwdGVyDQoNCiAgICAgIKm4qaQveHl6L29wZW5i
bWNfcHJvamVjdC9GcnVEZXZpY2UvVGlvZ2FfUGFzc19TaW5nbGVfU2lkZQ0KDQoNCg0KUmVnYXJk
cw0KDQotVmlqYXkNCg0KDQoNCkZyb206INbcINS2x+UgPHpob3V5dWFucWluZzhAb3V0bG9vay5j
b20+DQpEYXRlOiBXZWRuZXNkYXksIE1heSAyNywgMjAyMCBhdCAxOjMzIEFNDQpUbzogIldhbmcs
IEt1aXlpbmciIDxrdWl5aW5nLndhbmdAaW50ZWwuY29tPiwgVmlqYXkgS2hlbWthIDx2aWpheWto
ZW1rYUBmYi5jb20+DQpDYzogIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZz4NClN1YmplY3Q6ILvYuLQ6IEFib3V0IEZSVQ0KDQoNCg0KSGkNCg0KDQoN
CiAgICAgTXkgcHJvamVjdCB1c2VzIHBob3NwaG9yLWZydSwgYW5kIGEgcGhvc3Bob3ItcmVhZC1l
ZXByb20gaXMgZ2VuZXJhdGVkIGR1cmluZyBjb21waWxhdGlvbi4gSSB0aGluayB3aGVuIG9wZW5i
bWMgc3RhcnRzLCBwaG9zcGhvci1yZWFkLWVlcHJvbSB3aWxsIHJlYWQgdGhlIGNvbmZpZ3VyYXRp
b24gaW5mb3JtYXRpb24gb2YgZWVwcm9tIGZyb20gYSBjb25maWd1cmF0aW9uIGZpbGUgKHN1Y2gg
YXMgaTJjIGNoYW5uZWwgbnVtYmVyLCBpMmMgYWRkcmVzcyksIGFuZCB0aGVuIHJlYWQgRlJVIGlu
Zm9ybWF0aW9uIGZyb20gZWVwcm9tLg0KICAgICBJZiB0aGUgZW50aXR5LW1hbmFnZXIgbW9kdWxl
IGlzIHVzZWSjrGFkZCBqc29uIGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgbXkgZGV2aWNlIGludG8g
ZW50aXR5LW1hbmFnZXIuIHRoZW4gSSB1c2UgdGhlIHBob3Nob3ItZnJ1IG1ldGhvZCwgaW4gd2hp
Y2ggY29uZmlndXJhdGlvbiBmaWxlIHNob3VsZCBJIGNvbmZpZ3VyZSB0aGUgZWVwcm9tIGluZm9y
bWF0aW9uPw0KDQoNCg0KICAgICBwaG9zcGhvci1yZWFkLWVlcHJvbSB3aWxsIGV4aXRzIGFmdGVy
IHJlYWRpbmcgdGhlIGVlcHJvbSBpbmZvcm1hdGlvbiwgc28gaG93IGlzIHRoZSBGUlUgaW5mb3Jt
YXRpb24gcmVhZCB0byB0aGUgSVBNSSBwcm9jZXNzo78NCg0KDQoNClRoYW5rcw0KDQpIYXJsZXkN
Cg0KDQoNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQq3orz+yMs6IFdh
bmcsIEt1aXlpbmcgPGt1aXlpbmcud2FuZ0BpbnRlbC5jb20+DQq3osvNyrG85DogMjAyMMTqNdTC
MjfI1SAxNTo1OA0KytW8/sjLOiB6aG91eXVhbnFpbmc4QG91dGxvb2suY29tIDx6aG91eXVhbnFp
bmc4QG91dGxvb2suY29tPg0Ks63LzTogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmc+DQrW98ziOiBSRTogQWJvdXQgRlJVDQoNCg0KDQpIaSBIYXJsZXks
DQoNCllvdSBjb3VsZCBhZGQganNvbiBjb25maWd1cmF0aW9uIGZpbGUgZm9yIHlvdXIgZGV2aWNl
IGludG8gZW50aXR5LW1hbmFnZXIgYXMgYmVsb3c6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL2VudGl0eS1tYW5hZ2VyL3RyZWUvbWFzdGVyL2NvbmZpZ3VyYXRpb25zDQoNCg0KDQoNCg0K
VGhhbmtzLA0KDQpLd2luLg0KDQoNCg0KDQoNCkhlbGxvIGV2ZXJ5b25lLA0KDQoNCg0KICAgICAg
IE15IG1vdGhlcmJvYXJkIGhhcyBhbiBFRVBST00gZGV2aWNlIHRvIHN0b3JlIEZSVSByZWxhdGVk
IGluZm9ybWF0aW9uLiBIb3cgY2FuIEkgY29uZmlndXJlIGl0IGluIHRoZSBvcGVuYm1jIGNvbmZp
Z3VyYXRpb24gZmlsZSB0byBzZWUgdGhpcyBGUlUgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgaXBt
aXRvb2wgZnJ1IHByaW50IGNvbW1hbmQ/DQoNCg0KDQpBcmUgdGhlcmUgc29tZSBleGFtcGxlcyB0
byBwcm92aWRlIHJlZmVyZW5jZSwgSSBkaWQgbm90IGZpbmQgYSBwbGFjZSB0byBjb25maWd1cmUg
dGhlIGVlcHJvbSBkZXZpY2UgaW4gdGhlIG9wZW5ibWMgcHJvamVjdD8NCg0KDQoNCklzIHRoZXJl
IGFueSBkb2N1bWVudGF0aW9uIGFib3V0IEZSVSBpbmRpY2F0aW5nIHRoYXQgdGhlIG1vZHVsZSBy
ZWFkcyBhbmQgcGFyc2VzIGluZm9ybWF0aW9uIGZyb20gZWVwcm9tLCBhbmQgdGhlbiBpdCBjYW4g
YmUgcmVhZCBieSB0aGUgaXBtaXRvb2wgZnJ1IHByaW50IGNvbW1hbmQ/IFdoYXQgaXMgdGhlIHBy
b2Nlc3MgbGlrZT8NCg0KDQoNClRoYW5rcw0KDQpIYXJsZXkNCg0KDQoNCg0K

--_000_HK2PR04MB3826B0D0E48930B9F907B1B4FE8E0HK2PR04MB3826apcp_
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
Hi Vijay and&nbsp;<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(5=
0, 49, 48); font-family: Calibri, sans-serif; font-size: 14.666666984558105=
px; background-color: rgb(255, 255, 255); display: inline !important">Kwin,=
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: Calibri, sans-serif; font-size: 14.666666984558105px; background-col=
or: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: Calibri, sans-serif; font-size: 14.666666984558105px; background-col=
or: rgb(255, 255, 255); display: inline !important">&nbsp; &nbsp; I will us=
e entity manager package and test it, thank
 you very much<span style=3D"caret-color: rgb(50, 49, 48); font-family: Cal=
ibri, sans-serif; background-color: rgb(255, 255, 255); display: inline !im=
portant"><span style=3D"caret-color: rgb(50, 49, 48); font-family: Calibri,=
 sans-serif; background-color: rgb(255, 255, 255); display: inline !importa=
nt">!</span></span></span></div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: Calibri, sans-serif; font-size: 14.666666984558105px; background-col=
or: rgb(255, 255, 255); display: inline !important">Thanks,</span><br>
</div>
<div><font face=3D"Calibri, sans-serif"><span style=3D"font-size: 14.666666=
984558105px;">Harley.</span></font></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Vijay K=
hemka &lt;vijaykhemka@fb.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA5=D4=C228=C8=D5 5:15<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.co=
m&gt;; Wang, Kuiying &lt;kuiying.wang@intel.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;<br>
<b>=D6=F7=CC=E2:</b> Re: =BB=D8=B8=B4: About FRU</font>
<div>&nbsp;</div>
</div>
<div lang=3D"EN-US">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
Hi Harley,</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
You don=A1=AFt need any configuration for eeprom if you are using entity ma=
nager package. Just add this package in your image and at the start /usr/bi=
n/fru-device process will start which will enumerate all eeprom existed in =
the system and create a dbus interface
 for each fru device found. In my system, it shows like below.</p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_s1">Service xyz.openbmc_project.FruDevice:</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; </span><span class=3D=
"x_s1">=A9=B8=A9=A4/xyz/openbmc_project/FruDevice</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/0_80</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/0_81</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/1_113</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/2_112</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/2_16</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/2_22</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/3_104</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/3_108</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/3_113</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/3_36</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/3_68</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/3_81</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/6_32</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/6_33</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/6_78</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/6_79</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/6_80</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/7_69</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/8_31</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/9_39</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/9_84</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=C0=A9=A4/xyz/openbmc_project/FruDevice/Ava_M_2_SSD_Adapte=
r</span></p>
<p class=3D"x_p1" style=3D"margin: 0in 0in 0.0001pt; font-size: 8.5pt; font=
-family: Menlo; color: black;">
<span class=3D"x_apple-converted-space">&nbsp; &nbsp; &nbsp; </span><span c=
lass=3D"x_s1">=A9=B8=A9=A4/xyz/openbmc_project/FruDevice/Tioga_Pass_Single_=
Side</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
Regards</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
-Vijay</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
&nbsp;</p>
<div style=3D"border:none; border-top:solid #B5C4DF 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<b><span style=3D"font-size:12.0pt; color:black">From: </span></b><span sty=
le=3D"font-size:12.0pt; font-family:&quot;MS Gothic&quot;; color:black">=D6=
=DC</span><span style=3D"font-size:12.0pt; color:black">
</span><span style=3D"font-size:12.0pt; font-family:MingLiU; color:black">=
=D4=B6</span><span style=3D"font-size:12.0pt; font-family:&quot;MS Gothic&q=
uot;; color:black">=C7=E5</span><span style=3D"font-size:12.0pt; color:blac=
k"> &lt;zhouyuanqing8@outlook.com&gt;<br>
<b>Date: </b>Wednesday, May 27, 2020 at 1:33 AM<br>
<b>To: </b>&quot;Wang, Kuiying&quot; &lt;kuiying.wang@intel.com&gt;, Vijay =
Khemka &lt;vijaykhemka@fb.com&gt;<br>
<b>Cc: </b>&quot;openbmc@lists.ozlabs.org&quot; &lt;openbmc@lists.ozlabs.or=
g&gt;<br>
<b>Subject: </b></span><span style=3D"font-size:12.0pt; font-family:&quot;M=
S Gothic&quot;; color:black">=BB=D8=B8=B4</span><span style=3D"font-size:12=
.0pt; color:black">: About FRU</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">Hi&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp; &nbsp; &nbsp;My projec=
t uses phosphor-fru, and a phosphor-read-eeprom is generated during compila=
tion. I think when openbmc starts, phosphor-read-eeprom will read the confi=
guration information of eeprom from a configuration
 file (such as i2c channel number, i2c address), and then read FRU informat=
ion from eeprom.<br>
&nbsp; &nbsp; &nbsp;</span>If the entity-manager module is used<span style=
=3D"font-size:13.5pt; font-family:&quot;MS Gothic&quot;; color:black; backg=
round:white">=A3=AC</span><span style=3D"font-size:12.0pt; color:black">add=
 json configuration file for my device into entity-manager. then I
 use the phoshor-fru method, in which configuration file should I configure=
 the eeprom information?</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp; &nbsp; &nbsp;phosphor-=
read-eeprom will exits <span style=3D"background:white">
after reading the eeprom information</span>, so how is the FRU information =
read to the IPMI process</span><span style=3D"font-size:12.0pt; font-family=
:&quot;MS Gothic&quot;; color:black">=A3=BF</span><span style=3D"font-size:=
12.0pt; color:black"></span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">Thanks</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">Harley</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp; &nbsp;</span></p>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"margin: 0in 0in 0.0001=
pt; font-size: 11pt; font-family: Calibri, sans-serif;text-align:center">
<hr size=3D"0" width=3D"100%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
<b><span style=3D"font-family:&quot;PingFang TC&quot;,sans-serif; color:bla=
ck">=B7=A2</span></b><b><span style=3D"font-family:&quot;MS Gothic&quot;; c=
olor:black">=BC=FE=C8=CB</span></b><b><span style=3D"color:black">:</span><=
/b><span style=3D"color:black"> Wang, Kuiying &lt;kuiying.wang@intel.com&gt=
;<br>
</span><b><span style=3D"font-family:&quot;PingFang TC&quot;,sans-serif; co=
lor:black">=B7=A2</span></b><b><span style=3D"font-family:&quot;MS Gothic&q=
uot;; color:black">=CB=CD</span></b><b><span style=3D"font-family:&quot;Pin=
gFang TC&quot;,sans-serif; color:black">=CA=B1=BC=E4</span></b><b><span sty=
le=3D"color:black">:</span></b><span style=3D"color:black">
 2020</span><span style=3D"font-family:&quot;MS Gothic&quot;; color:black">=
=C4=EA</span><span style=3D"color:black">5</span><span style=3D"font-family=
:&quot;MS Gothic&quot;; color:black">=D4=C2</span><span style=3D"color:blac=
k">27</span><span style=3D"font-family:&quot;MS Gothic&quot;; color:black">=
=C8=D5</span><span style=3D"color:black">
 15:58<br>
</span><b><span style=3D"font-family:&quot;MS Gothic&quot;; color:black">=
=CA=D5=BC=FE=C8=CB</span></b><b><span style=3D"color:black">:</span></b><sp=
an style=3D"color:black"> zhouyuanqing8@outlook.com &lt;zhouyuanqing8@outlo=
ok.com&gt;<br>
</span><b><span style=3D"font-family:&quot;MS Gothic&quot;; color:black">=
=B3=AD=CB=CD</span></b><b><span style=3D"color:black">:</span></b><span sty=
le=3D"color:black"> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&g=
t;<br>
</span><b><span style=3D"font-family:&quot;MS Gothic&quot;; color:black">=
=D6=F7</span></b><b><span style=3D"font-family:&quot;PingFang TC&quot;,sans=
-serif; color:black">=CC=E2</span></b><b><span style=3D"color:black">:</spa=
n></b><span style=3D"color:black"> RE: About FRU</span>
</p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: Calibri, sans-serif;">
&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
Hi Harley,</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
You could add json configuration file for your device into entity-manager a=
s below:</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<a href=3D"https://github.com/openbmc/entity-manager/tree/master/configurat=
ions">https://github.com/openbmc/entity-manager/tree/master/configurations<=
/a>
</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
Thanks,</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
Kwin.</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Hello everyone,</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;My motherboard has an EEPROM d=
evice to store FRU related information. How can I configure it in the openb=
mc configuration file to see this FRU information through the ipmitool fru
 print command?</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Are there some examples to provide reference, I did not find a plac=
e to configure the eeprom device in the openbmc project?</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Is there any documentation about FRU indicating that the module rea=
ds and parses information from eeprom, and then it can be read by the ipmit=
ool fru print command? What is the process like?</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Thanks</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Harley</span></p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"x_xmsonormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">
&nbsp;</p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB3826B0D0E48930B9F907B1B4FE8E0HK2PR04MB3826apcp_--
