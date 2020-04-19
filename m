Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7341AFA1C
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 14:42:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494qH35w73zDqH4
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 22:42:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.20;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=hLQ69aro; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253020.outbound.protection.outlook.com [40.92.253.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494qFt2Q0HzDqvd
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 22:41:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l979uwDpQ9VL6H3ty8+uulQ6lkVfhuZQPnOPpiLucpJ2SvQNt2MTbnWlLEQ6tGmG541riGeRzNdSzWl4Xf9SEL8M//slMynPl0BFDt+5nirTcTos9CGfkQiGKPn3Ri7JpCYt/tMQcsvBqHeVnLdJ9GC+P+uQ/KYjzePsOFXKRiWHVTDE/Y1d+wkukYbiA3rY3EghXhY/PNGm5OLVWvZ8kGNpWyY9Fu0LOIHUJe1pOC0KIvvxBUReiVJuhOm/gfcNNJqWp4zrsPD5L5AiZJL9W2GnAh6BzLKCwvbdSl59u8eNnZUVg4LvXTCbMIxXyfWYn4sggXkF8aQ9qX+PiMDYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUlqUPV8KsYOZAG8ONN0qQIG+FnkgCDdpaGTgCEE0g8=;
 b=S3zsVDcpBYRm2aldtEbO8TkX/9JKTSvtNtzlSP/YLUoTZLmCXsrT19eEGvtIONFfIAu+5aFGXHHJc/ZasyK9nXbaHRXIe4qm/DfmfPC02CKxyuxvlDFKbSUXVYOY8X0mtjr4he5j+npYecmq5d7Q8GjjZV9I/qZavYJMKhE5Rt5uKrylvQhKFLYs8P/HRwNj3psIwezX2JVLL4vFVHi0WDZMrhI8I6n5sewT/NJ91b5c3LahtE7UypaK7etO+qQR5b4gFE2PuCtzhIyIM9+oDi2faqYNcJgcdkQ9whm4XvPntTsuypNtGM/hK3YMPqKV9tTkkTd8Wbv/dahZK01aWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUlqUPV8KsYOZAG8ONN0qQIG+FnkgCDdpaGTgCEE0g8=;
 b=hLQ69aroNHW/vFrnQHKBEY3ytT4PMgGa1a7qyH50XHCATWqe1HSEDi8akjQIJkBrziv7u7TvkMLlRGPSswbNE7F6XzMV9VlowP4A63MNo07ZIjLab6t88mh++2seO6m9XzkhcVbUC+Wot6ODLfGfznRmIwtDruWLuELPh6NEznAHysjKX4GLjSyYg8LRma4hDiWCAztDcsujjxckX0X5sNyv/Jf+YEMkgHiAO93rAx6CSA8TJZewJTGwDGxRrC84YK9JD+P68DuuEpa6eNkNTOGu1cnHOQzhYAAHvhzwg2Knu7sXILzGZ7u5iPo+hdKmuRUdeMayj0EP9MWmxlDJWw==
Received: from SG2APC01FT043.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::49) by
 SG2APC01HT237.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::458)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sun, 19 Apr
 2020 12:41:32 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::4b) by SG2APC01FT043.mail.protection.outlook.com
 (2a01:111:e400:7ebd::285) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Sun, 19 Apr 2020 12:41:32 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2921.027; Sun, 19 Apr 2020
 12:41:32 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogQWJvdXQgUkdNSUkgbW9kZSBzZXR0aW5nIG9mIE1BQzA=?=
Thread-Topic: =?gb2312?B?u9i4tDogQWJvdXQgUkdNSUkgbW9kZSBzZXR0aW5nIG9mIE1BQzA=?=
Thread-Index: AQHWFXAwowlVvDbP102O33VLLGtv86h/27EAgACDJaQ=
Date: Sun, 19 Apr 2020 12:41:32 +0000
Message-ID: <HK2PR04MB3826B414E7D2F68C81359C25FED70@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826A2AAD55E77655BDFB558FED60@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <1fbb893d-6a13-4d33-b11e-407f5283368e@www.fastmail.com>
In-Reply-To: <1fbb893d-6a13-4d33-b11e-407f5283368e@www.fastmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:1342794A75694ADD4531EBFA65276E0CCF36AB58E33BDF1614802D81272B9AB2;
 UpperCasedChecksum:9307EF441C9FB6176A6D598570F1FAA10CA25CEBCE72D82728C1FDDEE5B5327A;
 SizeAsReceived:7133; Count:45
x-tmn: [mGquCRdgzj0ZAdC/UfAfxhlg3IAZtc+o]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 2dbb83d2-5d3c-4a97-b221-08d7e45efd7f
x-ms-traffictypediagnostic: SG2APC01HT237:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MsB8WQ4hoHpBzR7A2H0ogETdiDrGb9KsnIwOrw7pum2z6nP8LHLLsZRJgWY6wAv6/obnZ22ZnP8Se4dPrBil/dxrBbh6HK6dpvcryMa3/4uTSAg/c4JLUGxz0Ogrezg3g746fJPJqoD3mtCn/bJTSINQV6R4CO0vZwZMom+u/Q41RIbnkYaQpFjk88foewXVEKFsCidSqFNtyLTu0tUWnQ285dtEWBV3OZnryh77oRHimkpUX1oayyoSFrCMJNy3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: er2K5mRwR2sqdGAsuOQBgYH3rx9Yg3h7QVnjnxBet1nAa9mmSr8o53tdIxmZk0pqbs0iqYR3yQ+7/qTwDEXAQluSbQD3Z3IZ3h40Q6epbax92FI3qwKdYrDM9GWuPe0bk64xkBRgtT6AcDvAWu620A==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826B414E7D2F68C81359C25FED70HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbb83d2-5d3c-4a97-b221-08d7e45efd7f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2020 12:41:32.5508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT237
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

--_000_HK2PR04MB3826B414E7D2F68C81359C25FED70HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KDQogICAgVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBndWlkYW5jZaOh
DQoNCiAgICBJIGhhdmUgbW9kaWZpZWQgdGhlICR7TUFDSElORX0uY29uZiBmaWxlIGFuZCByZWNv
bXBpbGVkIHUtYm9vdCxJIHdpbGwgZGVidWcgaXQgb24gdGhlIGJvYXJkIHRvbW9ycm93Lg0KDQog
ICAgQWNjb3JkaW5nIHRvIHlvdXIgZ3VpZGFuY2UsIEkgZm91bmQgdGhlIGNvcnJlc3BvbmRlbmNl
IGJldHdlZW4gdGhlIHJlY2lwZXMgc3BlY2lmaWVkIGluIHRoZSAke01BQ0hJTkV9LmNvbmYgZmls
ZSBhbmQgdGhlIHBuLWJ1aWxkbGlzdC4NCg0KICAgIEluIHRoZSBjb21waWxhdGlvbiBkaXJlY3Rv
cnkgb2Ygb2JtYy1vcC1jb250cm9sLXBvd2Vyo6xhcyBmb2xsb3dzo7oNCg0KICAgIFt3b3JrL2Fy
bTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL29ibWMtb3AtY29udHJvbC1wb3dlci8xLjAr
Z2l0QVVUT0lOQysxMTQ2ZjhjNmU1LXIxL2ltYWdlL3Vzci9zYmluXSQgbHMNCiAgICBwZ29vZF93
YWl0ICBwb3dlcl9jb250cm9sLmV4ZQ0KDQogICAgVGhlIC5leGUgZmlsZSBzaG91bGQgYmUgdGhl
IGV4ZWN1dGFibGUgZmlsZSBvZiB3aW5kb3dzLCBob3cgY2FuIGl0IGFwcGVhciBpbiB0aGUgbGlu
dXggc3lzdGVtPw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0Kt6LLzcqxvOQ6IDIwMjDE6jTUwjE5yNUg
MTI6MzANCsrVvP7IyzogemhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbSA8emhvdXl1YW5xaW5nOEBv
dXRsb29rLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPg0Ks63LzTogdXBlcmljQDE2My5jb20gPHVwZXJpY0AxNjMuY29tPjsgc2hpbmVyb2Nr
eUB5YWhvby5jb20gPHNoaW5lcm9ja3lAeWFob28uY29tPg0K1vfM4jogUmU6IEFib3V0IFJHTUlJ
IG1vZGUgc2V0dGluZyBvZiBNQUMwDQoNCkhpIEhhcmxleQ0KDQpPbiBTYXQsIDE4IEFwciAyMDIw
LCBhdCAyMDo0NCwgemhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbSB3cm90ZToNCj4NCj4gIEhpLA0K
Pg0KPiAgTXkgbmFtZSBpcyBIYXJsZXksIEkgYW0gY3VycmVudGx5IGRldmVsb3BpbmcgYW4gb3Bl
bmJtYyBwcm9qZWN0IGJhc2VkDQo+IG9uIHRoZSBBU1QyNTAwIGNoaXAuIFRoZXJlIGFyZSBhIGZl
dyBxdWVzdGlvbnMgdGhhdCBuZWVkIHRvIGJlDQo+IGNvbnN1bHRlZC4gUGxlYXNlIGhlbHAgbWUg
dG8gYW5zd2VyIHRoZW0uIFRoYW5rIHlvdSB2ZXJ5IG11Y2ghDQo+DQo+ICAxoaJBYm91dCBSR01J
SSBtb2RlIHNldHRpbmcgb2YgTUFDMA0KPiAgVGhlIGN1cnJlbnQgb3BlbmJtYyBwcm9qZWN0IGFu
ZCB1Ym9vdCBjb2RlIHN1cHBvcnQgMiBtb2RlczogTUFDMCB1c2VzDQo+IE5DU0ksIE1BQzIgdXNl
cyBSR01JSSwgYnV0IG15IGJvYXJkIHVzZXMgTUFDMCBSR01JSS4gSG93IGNhbiBJIHNpbXBseQ0K
PiBjb25maWd1cmUgdGhpcyB0byBjb21wbGV0ZSB0aGlzIHdvcmssIG9yIGRvIEkgaGF2ZSB0byBt
b2RpZnkNCj4gYXNwZWVkbmljLmMgYW5kIGFkZCB0aGUgbmV3IHBhdGNoIGZpbGUgdW5kZXIgdGhl
IGRpcmVjdG9yeQ0KPiBtZXRhLXBob3NwaG9yL2FzcGVlZC1sYXllci9yZWNpcGVzLWJzcC91LWJv
b3QvZmlsZXMgPw0KDQpUaGUgd2F5IHRvIHNlbGVjdCBOQ1NJIHZzIFBIWSBpcyB2aWEgdGhlIHUt
Ym9vdCBjb25maWcgZmlsZXMuIEhlcmUgYXJlIHNvbWUNCmV4YW1wbGVzIG9mIGRpZmZlcmVudCBw
bGF0Zm9ybXMgc2VsZWN0aW5nIGJldHdlZW4gZGlmZmVyZW50IGNvbmZpZ3M6DQoNCmBgYA0KJCBn
aXQgZ3JlcCAnVUJPT1RfTUFDSElORSA9JyB8IGhlYWQNCm1ldGEtYXNwZWVkL2NvbmYvbWFjaGlu
ZS9ldmItYXN0MjUwMC5jb25mOlVCT09UX01BQ0hJTkUgPSAiYXN0X2c1X3BoeV9jb25maWciDQpt
ZXRhLWFzcGVlZC9jb25mL21hY2hpbmUvZXZiLWFzdDI2MDAuY29uZjpVQk9PVF9NQUNISU5FID0g
ImFzdDI2MDBfb3BlbmJtY19kZWZjb25maWciDQptZXRhLWV2Yi9tZXRhLWV2Yi1hc3BlZWQvbWV0
YS1ldmItYXN0MjUwMC9jb25mL21hY2hpbmUvZXZiLWFzdDI1MDAuY29uZjpVQk9PVF9NQUNISU5F
ID0gImFzdF9nNV9waHlfY29uZmlnIg0KbWV0YS1ldmIvbWV0YS1ldmItZW5jbHVzdHJhL21ldGEt
ZXZiLXp4My1wbTMvY29uZi9tYWNoaW5lL2V2Yi16eDMtcG0zLmNvbmY6VUJPT1RfTUFDSElORSA9
ICJ6eW5xX3pjNzAyX2NvbmZpZyINCm1ldGEtZmFjZWJvb2svbWV0YS10aW9nYXBhc3MvY29uZi9t
YWNoaW5lL3Rpb2dhcGFzcy5jb25mOlVCT09UX01BQ0hJTkUgPSAiYXN0X2c1X25jc2lfY29uZmln
Ig0KbWV0YS1mYWNlYm9vay9tZXRhLXlvc2VtaXRldjIvY29uZi9tYWNoaW5lL3lvc2VtaXRldjIu
Y29uZjpVQk9PVF9NQUNISU5FID0gImFzdF9nNV9uY3NpX2NvbmZpZyINCmBgYA0KDQpFc3NlbnRp
YWxseSwgeW91IHdhbnQgdG8gY29uZmlndXJlIHlvdXIgcGxhdGZvcm0gKGkuZS4gaW4gJHtNQUNI
SU5FfS5jb25mKSB3aXRoOg0KDQpgYGANClVCT09UX01BQ0hJTkUgPSAiYXN0X2c1X3BoeV9jb25m
aWciDQpgYGANCg0KPg0KPiAgMqGiVGhlcmUgYXJlIGxvdCBvZiByZWNpcGVzIHVuZGVyICBkaXJl
Y3RvcnkgbWV0YS1waG9zcGhvciwgSG93IGRvZXMNCj4gYml0YmFrZSBjaG9vc2Ugc3BlY2lmaWMg
cmVjaXBlcz8gSSByZWFkIHRoZSBtYW51YWwgb2YgYml0YmFrZSBhbmQgdGhlDQo+IHByb2plY3Qg
b2Ygb3BlbmJtYywgYW5kIEkgZGlkbid0IGZpbmQgYSB3YXkgdG8gY2hvb3NlLiBvcGVuYm1jIGhh
cyBtYW55DQo+IHJlY2lwZXMsIHdlIGNhbid0IHVzZSB0aGVtIGFsbKGjDQoNClRoaXMgaXMgaGFu
ZGxlZCBieSB2YXJpb3VzbHkgYnkgcGFja2FnZWdyb3VwcywgRElTVFJPX0ZFQVRVUkVTLA0KTUFD
SElORV9GRUFUVVJFUyBhbmQgSU1BR0VfSU5TVEFMTC4gQWRkaXRpb25hbGx5IGlmIHdlIGxvb2sg
YXQNCmUuZy4gbWV0YS1pYm0vbWV0YS13aXRoZXJzcG9vbi9jb25mL21hY2hpbmUvd2l0aGVyc3Bv
b24uY29uZiwgd2UgZmluZDoNCg0KYGBgDQpyZXF1aXJlIGNvbmYvbWFjaGluZS9pbmNsdWRlL2Fz
dDI1MDAuaW5jDQpyZXF1aXJlIGNvbmYvbWFjaGluZS9pbmNsdWRlL29ibWMtYnNwLWNvbW1vbi5p
bmMNCnJlcXVpcmUgY29uZi9tYWNoaW5lL2luY2x1ZGUvb3BlbnBvd2VyLmluYw0KcmVxdWlyZSBj
b25mL21hY2hpbmUvaW5jbHVkZS9wOS5pbmMNCmBgYA0KDQpJZiB3ZSBkcmlsbCBkb3duIHRocm91
Z2ggdGhlc2UgZmlsZXMgd2UgZmluZCB0aGluZ3MgbGlrZQ0KbWV0YS1hc3BlZWQvY29uZi9tYWNo
aW5lL2luY2x1ZGUvYXNwZWVkLmluYzoNCg0KTUFDSElORV9FWFRSQV9SUkVDT01NRU5EUyArPSAi
dWRldi1hc3BlZWQtdnVhcnQgdWRldi1hc3BlZWQtbXRkLXBhcnRpdGlvbnMiDQoNClNvIGlmIHJl
Y29tbWVuZGVkIHBhY2thZ2VzIGFyZSB0byBiZSBpbnN0YWxsZWQsIHRoZW4gdGhlc2UgdHdvIHBh
Y2thZ2VzDQp3aWxsIGJlIGluc3RhbGxlZCBvbiBBU1BFRUQtYmFzZWQgaW1hZ2VzLg0KDQpUaGUg
aGllcmFyY2h5IG9mIGByZXF1aXJlYCBkaXJlY3RpdmVzIGhlbHBzIGJ1aWxkIHVwIHRoZSBzZXQg
b2YgcGFja2FnZXMgdG8gYmUNCmluc3RhbGxlZCBpbiB0aGUgaW1hZ2UgdmlhIGF0IGxlYXN0IHRo
ZSB2YXJpYWJsZXMgSSBtZW50aW9uZWQgYWJvdmUuDQoNCj4NCj4gIDOholRoZXJlIGFyZSBtYW55
IGNvbW1vbiByZWNpcGVzIHVuZGVyIG9wZW5ibWMgLyBtZXRhLXBob3NwaG9yLCBpcw0KPiB0aGVy
ZSBhbnkgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgYXJjaGl0ZWN0dXJlIGFuZCBkZXRhaWxlZA0K
PiBpbXBsZW1lbnRhdGlvbiBwcmluY2lwbGVzIG9mIGVhY2ggcmVjaXBlPyBGb3IgZXhhbXBsZSwg
Y2hhc3NpcyBwb3dlcg0KPiBjb250cm9sLg0KDQpMZXNzIHNvIGRvY3VtZW50YXRpb24gb2YgdGhl
IHJlY2lwZXMgdGhlbXNlbHZlcywgYnV0IHlvdSdsbCBmaW5kIGRlc2lnbg0KZGlzY3Vzc2lvbnMs
IGNoZWF0c2hlZXRzIGFuZCBndWlkZXMgaW4gdGhlIGRvY3MgcmVwb3NpdG9yeToNCg0KaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy8NCg0KSG9wZSB0aGF0IGhlbHBzLg0KDQpBbmRyZXcN
Cg==

--_000_HK2PR04MB3826B414E7D2F68C81359C25FED70HK2PR04MB3826apcp_
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
Hi&nbsp;<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30)=
; font-family: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe=
 UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&=
quot;, sans-serif; font-size: 14.666666984558105px; background-color: rgb(2=
55, 255, 255); display: inline !important">Andrew,&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important">&nbsp;
 &nbsp;&nbsp;Thank you very much for your guidance=A3=A1</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important">&nbsp;
 &nbsp;&nbsp;I have modified the <span style=3D"caret-color: rgb(50, 49, 48=
); color: rgb(50, 49, 48); font-family: &quot;Microsoft Yahei UI&quot;, Ver=
dana, Simsun, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Robo=
to, &quot;Helvetica Neue&quot;, sans-serif; background-color: rgb(255, 255,=
 255); display: inline !important">
${MACHINE}.</span>conf file and recompiled u-boot,I will debug it on the bo=
ard tomorrow.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important">&nbsp;
 &nbsp;&nbsp;According to your guidance, I found the correspondence between=
 the recipes specified in the
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
">
${MACHINE}</span>.conf file and the pn-buildlist.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important">&nbsp;
 &nbsp;&nbsp;In the compilation directory of obmc-op-control-power=A3=ACas =
follows=A3=BA</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important">&nbsp;
 &nbsp; [<span>work/arm1176jzs-openbmc-linux-gnueabi/obmc-op-control-power/=
1.0&#43;gitAUTOINC&#43;1146f8c6e5-r1/image/usr/sbin]$ ls&nbsp;</span></span=
></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(32, 31, 30); color: rgb(32, 31, 30); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; font-size: 14.666666984558105px; background-color: rgb(255, 255,=
 255); display: inline !important"><span>&nbsp;
 &nbsp;&nbsp;pgood_wait &nbsp;power_control.exe</span></span></div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;&nbsp;The .exe file should be the executable file of windows, =
how can it appear in the linux system?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Andrew =
Jeffery &lt;andrew@aj.id.au&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA4=D4=C219=C8=D5 12:30<br>
<b>=CA=D5=BC=FE=C8=CB:</b> zhouyuanqing8@outlook.com &lt;zhouyuanqing8@outl=
ook.com&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=B3=AD=CB=CD:</b> uperic@163.com &lt;uperic@163.com&gt;; shinerocky@yaho=
o.com &lt;shinerocky@yahoo.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: About RGMII mode setting of MAC0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Harley<br>
<br>
On Sat, 18 Apr 2020, at 20:44, zhouyuanqing8@outlook.com wrote:<br>
&gt;&nbsp; <br>
&gt;&nbsp; Hi, <br>
&gt; <br>
&gt;&nbsp; My name is Harley, I am currently developing an openbmc project =
based <br>
&gt; on the AST2500 chip. There are a few questions that need to be <br>
&gt; consulted. Please help me to answer them. Thank you very much!<br>
&gt; <br>
&gt;&nbsp; 1=A1=A2About RGMII mode setting of MAC0<br>
&gt;&nbsp; The current openbmc project and uboot code support 2 modes: MAC0=
 uses <br>
&gt; NCSI, MAC2 uses RGMII, but my board uses MAC0 RGMII. How can I simply =
<br>
&gt; configure this to complete this work, or do I have to modify <br>
&gt; aspeednic.c and add the new patch file under the directory <br>
&gt; meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files ?<br>
<br>
The way to select NCSI vs PHY is via the u-boot config files. Here are some=
<br>
examples of different platforms selecting between different configs:<br>
<br>
```<br>
$ git grep 'UBOOT_MACHINE =3D' | head<br>
meta-aspeed/conf/machine/evb-ast2500.conf:UBOOT_MACHINE =3D &quot;ast_g5_ph=
y_config&quot;<br>
meta-aspeed/conf/machine/evb-ast2600.conf:UBOOT_MACHINE =3D &quot;ast2600_o=
penbmc_defconfig&quot;<br>
meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/evb-ast2500.conf:UBO=
OT_MACHINE =3D &quot;ast_g5_phy_config&quot;<br>
meta-evb/meta-evb-enclustra/meta-evb-zx3-pm3/conf/machine/evb-zx3-pm3.conf:=
UBOOT_MACHINE =3D &quot;zynq_zc702_config&quot;<br>
meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf:UBOOT_MACHINE =3D =
&quot;ast_g5_ncsi_config&quot;<br>
meta-facebook/meta-yosemitev2/conf/machine/yosemitev2.conf:UBOOT_MACHINE =
=3D &quot;ast_g5_ncsi_config&quot;<br>
```<br>
<br>
Essentially, you want to configure your platform (i.e. in ${MACHINE}.conf) =
with:<br>
<br>
```<br>
UBOOT_MACHINE =3D &quot;ast_g5_phy_config&quot;<br>
```<br>
<br>
&gt; <br>
&gt;&nbsp; 2=A1=A2There are lot of recipes under&nbsp; directory meta-phosp=
hor, How does <br>
&gt; bitbake choose specific recipes? I read the manual of bitbake and the =
<br>
&gt; project of openbmc, and I didn't find a way to choose. openbmc has man=
y <br>
&gt; recipes, we can't use them all=A1=A3<br>
<br>
This is handled by variously by packagegroups, DISTRO_FEATURES,<br>
MACHINE_FEATURES and IMAGE_INSTALL. Additionally if we look at<br>
e.g. meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf, we find:<br>
<br>
```<br>
require conf/machine/include/ast2500.inc<br>
require conf/machine/include/obmc-bsp-common.inc<br>
require conf/machine/include/openpower.inc<br>
require conf/machine/include/p9.inc<br>
```<br>
<br>
If we drill down through these files we find things like<br>
meta-aspeed/conf/machine/include/aspeed.inc:<br>
<br>
MACHINE_EXTRA_RRECOMMENDS &#43;=3D &quot;udev-aspeed-vuart udev-aspeed-mtd-=
partitions&quot;<br>
<br>
So if recommended packages are to be installed, then these two packages<br>
will be installed on ASPEED-based images.<br>
<br>
The hierarchy of `require` directives helps build up the set of packages to=
 be<br>
installed in the image via at least the variables I mentioned above.<br>
<br>
&gt; <br>
&gt;&nbsp; 3=A1=A2There are many common recipes under openbmc / meta-phosph=
or, is <br>
&gt; there any documentation about the architecture and detailed <br>
&gt; implementation principles of each recipe? For example, chassis power <=
br>
&gt; control.<br>
<br>
Less so documentation of the recipes themselves, but you'll find design<br>
discussions, cheatsheets and guides in the docs repository:<br>
<br>
<a href=3D"https://github.com/openbmc/docs/">https://github.com/openbmc/doc=
s/</a><br>
<br>
Hope that helps.<br>
<br>
Andrew<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_HK2PR04MB3826B414E7D2F68C81359C25FED70HK2PR04MB3826apcp_--
