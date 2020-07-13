Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75421D546
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 13:52:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B52841mS0zDqVT
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 21:52:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.62;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=igf8Upzz; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254062.outbound.protection.outlook.com [40.92.254.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B52752dtQzDqSG
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 21:51:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixK35jloz3qJ0DdmmejSPkwDXrtMCtiwjvta7Q9kR5+cVB8BktCNPBZOAGJGFPIktuLHbk7tjk2ppGpSNH8nJmzlvD33Xy6TuzdvYIFZJnVltR0+Pkl2ULu+cGPm/rUSBaI6QhdlLzfUSUIqEd1tcUxUg4XK1QF+mB0RNtuxPAX58mXeWw9wwPdGEYxw6QfDUL2CDOwbEIF3xYX6hZQ17HeggnsYVsPW2/a6/b/SIBGjoQ8olqWvT3fVRnkY1yS3fM/laUPRs3ByD94PQgdOgdwLQd8RZjLP+ORlX8iTG6rjTsOf6VfIkx/Uehu4hv0EPMv/WRHQINptymhSCCFxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbnnWDYM5nnf6I051UiGfnl/tSXUUaXCQoBLPgyB8zg=;
 b=ZrqsoAk0HTATxgKRDslyfr+gYoD3hgQs3zYpQTMSatDu0hzNpXa2HO1divz954Nei6o/jSALfLlfpeY/fAT6Y7u3hbG9Z3olo4paGfoiXV/P7VIL2Gx2LeqfqbOPMlKk67HLVD4nZTaEUrBsJ7e5jT8JOIHgssqKjtIjv5T6oDLl5IdrM8umhBRxP7mvAhOlpc4YZCMZHLYPuX68FoWOwghYmIDGdLthIfUZ5+zH2emndOrsfWBTOEiynq2S0e4HloOIveo4iHjYrO08YZpbGD4LT+jzyVUEcqAm2dvVu7KX7yJhZKueIj3XOjOauFoq7ksJkmRQD2gGLop4vOwvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbnnWDYM5nnf6I051UiGfnl/tSXUUaXCQoBLPgyB8zg=;
 b=igf8UpzzrErtX/zz6oGARnC1OfJe+BfLuH7zjLYo036HbLgnK58kUj2MwWwGcfKqXn8LVwO3GitPNwVvQBcuSyyV9jC1u5CGlZ91oNEqaSge/l3amnZ0sdiVPl+ok5P94CEWhFGYbWsSJHFHFQuJrTDjtA1D0MVXb+7UZT24hMHNIDUtCQVap+5VSccnWhhCMurqZrQ2jVkYH+RZ+JwRId9lZSOPsS/92veCnORAw+B+jDag6IbSMWKTbHF/dlPHfJJG910oy5+iQcQUpw7wUz1oMo5X2D2L+jrNMMF7UaaAWR0p0JauNFqSHtVNWg3lq1k2BPQFq1UIeLe33HgWGQ==
Received: from SG2APC01FT112.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::41) by
 SG2APC01HT203.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::282)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Mon, 13 Jul
 2020 11:51:38 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::4a) by SG2APC01FT112.mail.protection.outlook.com
 (2a01:111:e400:7ebd::201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Mon, 13 Jul 2020 11:51:38 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 11:51:37 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Subject: =?gb2312?B?u9i4tDogYnVzY3RsIGNhbGwgImxlZCBtZXRob2QiIGZhaWxlZA==?=
Thread-Topic: busctl call "led method" failed
Thread-Index: AQHWWOqIeDidKmsYQEOnQI+B0F5CRqkFNuEAgAAs02U=
Date: Mon, 13 Jul 2020 11:51:37 +0000
Message-ID: <HK2PR04MB38260F9F252A567A42ED3A80FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB38264AF28981EE1CCA3FBCA2FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <062A643D-06BA-4019-A075-80D5BB763172@linux.vnet.ibm.com>
In-Reply-To: <062A643D-06BA-4019-A075-80D5BB763172@linux.vnet.ibm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B43880C5E3D06A4EE5E33B3809791D4B58DC63E5DF81DBB3BBFB7AF537EB65AF;
 UpperCasedChecksum:4CD945A63D8770BA9BA52CEFA43DD779A03A4A853768F1E07BEBDC0B9B7D856E;
 SizeAsReceived:7035; Count:44
x-tmn: [p8HEPOGcofus6nawY2X5VFi1Viib9b20]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 10a10209-e88c-417b-b259-08d827231992
x-ms-traffictypediagnostic: SG2APC01HT203:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8okFnyP/yGY8RYCeTxyHqnPHCjC9ANOIrjAvKbNBTjHVYCzrMiKZoW9c/2bjXySZTDMRGogqrOc1DQq4TUg+UbZPhiM0Iy5KK0yyI9/IMIS50qfgMIKZo07tUSPg2TIC9EUomSI9HospbFKhXrtpX1koWUMKAkNrRpfRFnPVRxSio/JBHFuR+/Tdl+fez1YCWXyYUS7n2OOFI5RsAmI+6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: XMJ8ZYM5qvJTAlJ2iyJXsJh0IgVJLT28YpnWluhkd208OyawLqWBFYzejHFS5bjML88Jacf6/cA5tyWPRlxTv5TBblvcWmvfpvhiOr7lYtyLFCmXEqitkHhcVFt4OKdO8x4WUfJc3pajMsoLbGbaJw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38260F9F252A567A42ED3A80FE600HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT112.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a10209-e88c-417b-b259-08d827231992
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 11:51:37.6229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT203
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB38260F9F252A567A42ED3A80FE600HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgVmlzaHdhDQoNCiAgICBJIGNvcGllZCB5b3VyIGNvbW1hbmQgYW5kIHRlc3RlZCBpdCBhZ2Fp
biwgdGhlIHByb2JsZW0gaXMgc3RpbGwgdGhlIHNhbWUuDQoNCiAgICBJIGxvb2tlZCBhdCB0aGUg
cGhvc3Bob3ItbGVkLW1hbmFnZXItbWFzdGVyIGRvY3VtZW50IGFuZCBzYXcgdGhhdCB0aGUgc3lz
L2NsYXNzL2xlZHMgZGlyZWN0b3J5IG5lZWRzIHRvIGdlbmVyYXRlIHRoZSBmb2xsb3dpbmcgZmls
ZXMuDQoNCiBscyAtbCAvc3lzL2NsYXNzL2xlZHMvZmF1bHQvDQp0b3RhbCAwDQotcnctci0tci0t
ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICA0MDk2IEp1biAyMSAyMDowNCBicmlnaHRuZXNz
DQpscnd4cnd4cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICAgICAwIEp1biAyMSAyMDoy
OSBkZXZpY2UgLT4gLi4vLi4vLi4vbGVkcw0KLXItLXItLXItLSAgICAxIHJvb3QgICAgIHJvb3Qg
ICAgICAgICAgNDA5NiBKdW4gMjEgMjA6MjkgbWF4X2JyaWdodG5lc3MNCmRyd3hyLXhyLXggICAg
MiByb290ICAgICByb290ICAgICAgICAgICAgIDAgSnVuIDIxIDIwOjI5IHBvd2VyDQpscnd4cnd4
cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICAgICAwIEp1biAyMSAyMDowNCBzdWJzeXN0
ZW0gLT4gLi4vLi4vLi4vLi4vLi4vY2xhc3MvbGVkcw0KLXJ3LXItLXItLSAgICAxIHJvb3QgICAg
IHJvb3QgICAgICAgICAgNDA5NiBKdW4gMjEgMjA6MDQgdHJpZ2dlcg0KLXJ3LXItLXItLSAgICAx
IHJvb3QgICAgIHJvb3QgICAgICAgICAgNDA5NiBKdW4gMjEgMjA6MDQgdWV2ZW50DQoNCiAgICAg
SG93ZXZlciwgL3N5cy9jbGFzcy9sZWRzIGlzIGVtcHR5IG9uIG15IGJvYXJkLiBJIGFtIG5vdCBz
dXJlIGlmIGl0IHdpbGwgYWZmZWN0IHRoaXMgcHJvYmxlbS4NCg0Kcm9vdEBzdGFybGFrZTo6LyMg
bHMgL3N5cy9jbGFzcy9sZWRzLw0Kcm9vdEBzdGFybGFrZTo6LyMNCg0Kcm9vdEBzdGFybGFrZTov
c3lzL2Zpcm13YXJlL2RldmljZXRyZWUvYmFzZS9sZWRzIyBscw0KY29tcGF0aWJsZSAgZmF1bHQg
ICAgICAgaWRlbnRpZnkgICAgbmFtZSAgICAgICAgcG93ZXINCnJvb3RAc3Rhcmxha2U6L3N5cy9m
aXJtd2FyZS9kZXZpY2V0cmVlL2Jhc2UvbGVkcyMgY2QgZmF1bHQvDQpyb290QHN0YXJsYWtlOi9z
eXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL2xlZHMvZmF1bHQjIGxzDQpncGlvcyAgbmFtZQ0K
cm9vdEBzdGFybGFrZTovc3lzL2Zpcm13YXJlL2RldmljZXRyZWUvYmFzZS9sZWRzL2ZhdWx0Iw0K
DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogVmlzaHdhbmF0
aGEgU3ViYmFubmEgPHZpc2h3YUBsaW51eC52bmV0LmlibS5jb20+DQq3osvNyrG85DogMjAyMMTq
N9TCMTPI1SAxNzowMg0KytW8/sjLOiDW3CDUtsflIDx6aG91eXVhbnFpbmc4QG91dGxvb2suY29t
Pg0Ks63LzTogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+OyB1cGVyaWNAMTYzLmNvbSA8dXBlcmljQDE2My5jb20+DQrW98ziOiBSZTogYnVzY3RsIGNh
bGwgImxlZCBtZXRob2QiIGZhaWxlZA0KDQpIaSBoYXJsZXksDQoNCkkgYW0gYWJsZSB0byBzZWUg
aXQgd29ya2luZy4gUGxlYXNlIGNoZWNrIGlmIHRoZXJlIHdhcyBhbnkgdHlwbyBldGMuLiBqb3Vy
bmFsY3RsIHdvdWxkIGhhdmUgdGhlIGluZm8NCg0Kcm9vdEByYWluNGJtYzp+IyBidXNjdGwgLS12
ZXJib3NlICBjYWxsIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkdyb3VwTWFuYWdlciAveHl6L29w
ZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL3Bvd2VyX29uIG9yZy5mcmVlZGVza3RvcC5EQnVzLlBy
b3BlcnRpZXMgR2V0IHNzIHh5ei5vcGVuYm1jX3Byb2plY3QuTGVkLkdyb3VwIEFzc2VydGVkDQpN
RVNTQUdFICJ2IiB7DQogICAgICAgIFZBUklBTlQgImIiIHsNCiAgICAgICAgICAgICAgICBCT09M
RUFOIGZhbHNlOw0KICAgICAgICB9Ow0KfTsNCg0Kcm9vdEByYWluNGJtYzp+IyBidXNjdGwgLS12
ZXJib3NlICBjYWxsIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkdyb3VwTWFuYWdlciAveHl6L29w
ZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL3Bvd2VyX29uIG9yZy5mcmVlZGVza3RvcC5EQnVzLlBy
b3BlcnRpZXMgU2V0IHNzdiB4eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZCBi
IHRydWUNCg0Kcm9vdEByYWluNGJtYzp+IyBidXNjdGwgLS12ZXJib3NlICBjYWxsIHh5ei5vcGVu
Ym1jX3Byb2plY3QuTEVELkdyb3VwTWFuYWdlciAveHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3Jv
dXBzL3Bvd2VyX29uIG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgR2V0IHNzIHh5ei5v
cGVuYm1jX3Byb2plY3QuTGVkLkdyb3VwIEFzc2VydGVkDQpNRVNTQUdFICJ2IiB7DQogICAgICAg
IFZBUklBTlQgImIiIHsNCiAgICAgICAgICAgICAgICBCT09MRUFOIHRydWU7DQogICAgICAgIH07
DQp9Ow0KDQpyb290QHJhaW40Ym1jOn4jIGJ1c2N0bCAtLXZlcmJvc2UgIGNhbGwgeHl6Lm9wZW5i
bWNfcHJvamVjdC5MRUQuR3JvdXBNYW5hZ2VyIC94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9ncm91
cHMvcG93ZXJfb24gb3JnLmZyZWVkZXNrdG9wLkRCdXMuUHJvcGVydGllcyBTZXQgc3N2IHh5ei5v
cGVuYm1jX3Byb2plY3QuTGVkLkdyb3VwIEFzc2VydGVkIGIgZmFsc2UNCg0Kcm9vdEByYWluNGJt
Yzp+IyBidXNjdGwgLS12ZXJib3NlICBjYWxsIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkdyb3Vw
TWFuYWdlciAveHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL3Bvd2VyX29uIG9yZy5mcmVl
ZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgR2V0IHNzIHh5ei5vcGVuYm1jX3Byb2plY3QuTGVkLkdy
b3VwIEFzc2VydGVkDQpNRVNTQUdFICJ2IiB7DQogICAgICAgIFZBUklBTlQgImIiIHsNCiAgICAg
ICAgICAgICAgICBCT09MRUFOIGZhbHNlOw0KICAgICAgICB9Ow0KfTsNCg0Kcm9vdEByYWluNGJt
Yzp+Iw0KDQpBbHRlcm5hdGl2ZWx5LCB5b3UgY291bGQgdXNlIGJ1c3RsZSBzZXQtcHJvcGVydHkN
Cg0KYnVzY3RsIHNldC1wcm9wZXJ0eSB4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFn
ZXIgL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVkL2dyb3Vwcy9wb3dlcl9vbiB4eXoub3BlbmJtY19w
cm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZCBiIHRydWUNCg0KYnVzY3RsIGdldC1wcm9wZXJ0eSB4
eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qv
bGVkL2dyb3Vwcy9wb3dlcl9vbiB4eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRl
ZA0KDQpUaGFua3MsDQohISBWaXNod2EgISENCg0KDQpPbiAxMy1KdWwtMjAyMCwgYXQgMjowNyBQ
TSwg1twg1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbTxtYWlsdG86emhvdXl1YW5xaW5n
OEBvdXRsb29rLmNvbT4+IHdyb3RlOg0KDQpIZWxsbyBldmVyeW9uZaOsDQoNCiAgICAgICAgIFRo
ZXJlIGFyZSB0aGUgZm9sbG93aW5nIGNhbGxzIHRvIGJ1c2N0bCwgaXQgaXMgbm9ybWFsIHRvIHVz
ZSB0aGUgZ2V0IGNvbW1hbmQsIGJ1dCB0aGUgc2V0IGNvbW1hbmQgcHJvbXB0cyAiQ2FsbCBmYWls
ZWQ6IHBhdGggb3Igb2JqZWN0IG5vdCBmb3VuZCIsIGFuZCBubyBvdGhlciBsb2cgaW5mb3JtYXRp
b24gaXMgb3V0cHV0IHRocm91Z2ggdGhlIGpvdXJuYWxjdGwgY29tbWFuZC4gUGxlYXNlIHRha2Ug
YSBsb29rIGF0IGhvdyB0byBsb2NhdGUgdGhpcyBwcm9ibGVtLiBUaGFuayB5b3WjoQ0KDQoNCiB+
IyBidXNjdGwgLS12ZXJib3NlICBjYWxsIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkdyb3VwTWFu
YWdlciAveHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL3Bvd2VyX29uIG9yZy5mcmVlZGVz
a3RvcC5EQnVzLlByb3BlcnRpZXMgR2V0IHNzIHh5ei5vcGVuYm1jX3Byb2plY3QuTGVkLkdyb3Vw
IEFzc2VydGVkDQpNRVNTQUdFICJ2IiB7DQogICAgICAgIFZBUklBTlQgImIiIHsNCiAgICAgICAg
ICAgICAgICBCT09MRUFOIGZhbHNlOw0KICAgICAgICB9Ow0KfTsNCg0KIH4jIGJ1c2N0bCAtLXZl
cmJvc2UgIGNhbGwgeHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQuR3JvdXBNYW5hZ2VyIC94eXovb3Bl
bmJtY19wcm9qZWN0L2xlZC9ncm91cHMvcG93ZXJfb24gb3JnLmZyZWVkZXNrdG9wLkRCdXMuUHJv
cGVydGllcyBTZXQgc3N2IHh5ei5vcGVuYm1jX3Byb2plY3QuTGVkLkdyb3VwIEFzc2VydGVkIGIg
dHJ1ZQ0KQ2FsbCBmYWlsZWQ6IHBhdGggb3Igb2JqZWN0IG5vdCBmb3VuZA0KDQpoYXJsZXkNCg0K

--_000_HK2PR04MB38260F9F252A567A42ED3A80FE600HK2PR04MB3826apcp_
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
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
">Hi
 Vishwa</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
">&nbsp;
 &nbsp;&nbsp;I copied your command and tested it again, the problem is stil=
l the same.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
">&nbsp;
 &nbsp;&nbsp;I looked at the phosphor-led-manager-master document and saw t=
hat the sys/class/leds directory needs to generate the following files.</sp=
an></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(50, 49, 48); color: rgb(50, 49, 48); font-f=
amily: &quot;Microsoft Yahei UI&quot;, Verdana, Simsun, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif; background-color: rgb(255, 255, 255); display: inline !important=
">
<pre style=3D"font-weight: 400; box-sizing: border-box; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 13.6px; margin-top: 0px; margin-bottom: 16px; padding: 16px; overflow: a=
uto; line-height: 1.45; background-color: rgb(246, 248, 250); border-top-le=
ft-radius: 6px; border-top-right-radius: 6px; border-bottom-right-radius: 6=
px; border-bottom-left-radius: 6px; color: rgb(36, 41, 46); orphans: 2; wid=
ows: 2"><code style=3D"box-sizing: border-box; margin: 0px; border-top-left=
-radius: 6px; border-top-right-radius: 6px; border-bottom-right-radius: 6px=
; border-bottom-left-radius: 6px; display: inline; background-position: ini=
tial initial; background-repeat: initial initial">&nbsp;ls -l /sys/class/le=
ds/fault/=0A=
total 0=0A=
-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:04 brightness=0A=
lrwxrwxrwx &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 0 Jun 21 20:29 device -&gt; ../../../leds=0A=
-r--r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:29 max_brightness=0A=
drwxr-xr-x &nbsp; &nbsp;2 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 0 Jun 21 20:29 power=0A=
lrwxrwxrwx &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 0 Jun 21 20:04 subsystem -&gt; ../../../../../class/leds=
=0A=
-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:04 trigger=0A=
-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;4096 Jun 21 20:04 uevent</code></pre>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;However, /sys/class/leds is empty on my board. I am not=
 sure if it will affect this problem.</div>
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
mportant"><span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Cali=
bri, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); di=
splay: inline !important">root@starlake:</span>:/#
 ls /sys/class/leds/<br>
</span>
<div><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial,=
 Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inli=
ne !important">root@starlake:</span>:/#<br>
</div>
<div><br>
</div>
<span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>root@starlake:/sys/firmware/devicetree/base/leds# ls<br>
</span>
<div>compatible &nbsp;fault &nbsp; &nbsp; &nbsp; identify &nbsp; &nbsp;name=
 &nbsp; &nbsp; &nbsp; &nbsp;power<br>
</div>
<div><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial,=
 Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inli=
ne !important">root@starlake</span>:/sys/firmware/devicetree/base/leds# cd =
fault/<br>
</div>
<div>root@<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, A=
rial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); display:=
 inline !important">starlake</span>:/sys/firmware/devicetree/base/leds/faul=
t# ls<br>
</div>
<div>gpios &nbsp;name<br>
</div>
<div><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial,=
 Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inli=
ne !important">root@starlake</span>:/sys/firmware/devicetree/base/leds/faul=
t#<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Vishwan=
atha Subbanna &lt;vishwa@linux.vnet.ibm.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA7=D4=C213=C8=D5 17:02<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.co=
m&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;; uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: busctl call &quot;led method&quot; failed</font>
<div>&nbsp;</div>
</div>
<div class=3D"" style=3D"word-wrap:break-word; line-break:after-white-space=
">
<div class=3D"">Hi harley,</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">I am able to see it working. Please check if there was any =
typo etc.. journalctl would have the info</div>
<div class=3D""><br class=3D"">
</div>
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br c=
lass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Set ssv&nbsp;xyz.openbmc_project.Led.Group Asserted b true&nbsp;
<div class=3D""><br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN true;<br cl=
ass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Set ssv&nbsp;xyz.openbmc_project.Led.Group Asserted b false</div>
<div class=3D""><br class=3D"">
root@rain4bmc:~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupM=
anager /xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Proper=
ties Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br c=
lass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
root@rain4bmc:~#&nbsp;</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Alternatively, you could use bustle set-property&nbsp;</div=
>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">
<div class=3D"" style=3D"margin:0px; font-stretch:normal; line-height:norma=
l; color:rgb(59,35,34); background-color:rgb(215,211,183)">
<span class=3D"" style=3D"font-variant-ligatures:no-common-ligatures">busct=
l set-property xyz.openbmc_project.LED.GroupManager /xyz/openbmc_project/le=
d/groups/power_on xyz.openbmc_project.Led.Group Asserted b true</span></div=
>
</div>
<div class=3D"" style=3D"margin:0px; font-stretch:normal; line-height:norma=
l; color:rgb(59,35,34); background-color:rgb(215,211,183)">
<span class=3D"" style=3D"font-variant-ligatures:no-common-ligatures"><br c=
lass=3D"">
</span></div>
<div class=3D""><span class=3D"" style=3D"color:rgb(59,35,34); background-c=
olor:rgb(215,211,183)">busctl get-property xyz.openbmc_project.LED.GroupMan=
ager /xyz/openbmc_project/led/groups/power_on xyz.openbmc_project.Led.Group=
 Asserted</span></div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Thanks,</div>
<div class=3D"">!! Vishwa !!</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""><br class=3D"">
<blockquote type=3D"cite" class=3D"">On 13-Jul-2020, at 2:07 PM, =D6=DC =D4=
=B6=C7=E5 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.com" class=3D"">zhouy=
uanqing8@outlook.com</a>&gt; wrote:<br class=3D"">
<br class=3D"">
Hello everyone=A3=AC<br class=3D"">
<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;There are the following calls to busctl, =
it is normal to use the get command, but the set command prompts &quot;Call=
 failed: path or object not found&quot;, and no other log information is ou=
tput through the journalctl command. Please take a look at&nbsp;how to loca=
te
 this problem. Thank you=A3=A1<br class=3D"">
<br class=3D"">
<br class=3D"">
&nbsp;~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupManager /=
xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties&nbs=
p;Get&nbsp;ss xyz.openbmc_project.Led.Group Asserted<br class=3D"">
MESSAGE &quot;v&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br c=
lass=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">
};<br class=3D"">
<br class=3D"">
&nbsp;~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupManager /=
xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties&nbs=
p;Set&nbsp;ssv xyz.openbmc_project.Led.Group Asserted b true<br class=3D"">
Call failed: path or object not found<br class=3D"">
<br class=3D"">
harley<br class=3D"">
</blockquote>
<br class=3D"">
</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB38260F9F252A567A42ED3A80FE600HK2PR04MB3826apcp_--
