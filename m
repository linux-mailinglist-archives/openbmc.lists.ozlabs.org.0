Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D8A59F12A
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 03:57:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8Ny4lypz3bNj
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 11:57:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=u3cuV9xG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.99; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=u3cuV9xG;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8NG3WQnz2xbC;
	Wed, 24 Aug 2022 11:56:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTtT4ZLsMzwub+rsO4GJTdefySXS6tF/1Lse0bJYaCTxz37zLyA8NW7YNlUV1E0mIddJSXA5KdLxQgqHmX5mW2Z3CG9mbGdDlC7qAFoFPL1nQ1/IXag1NiRTsX1FdPOqZTQ/vxFzvC8NnVTh6AQfyMjVcqIJJiCWJ541WagLzIxpn0kWMD9DDdy4hAuSr3QZ5qtYGupma4LuseOyXmtW8JdegTfqm7VdvunaQs1fDqyqfoXSjZnVtEXySx7donkF6LQRhVoh3ViYi14eWl/VrVEI17NomTsdqkzOt0JDSGRwLzwNpJL5eXEtbDYDE6XBfzR1NqWOz00vdnZ7kRYPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYLsUqAq+c2J2dbl57tkaK/tCRP/H755lFR6EGXsFsc=;
 b=NyDsfX5dDKyr00tZ6uE3vLjKwendkGHG/BRD91wlok1eH3cr8Efdq2S6joui5wLpyhFzQ6GK5TPJK2Nl6MWVxa7C61/uLghKohRY8jnqaHb2qT6UnDo0kIeqCvbQ8OXi6LAIVe5zx/X/DStFVkqRYNcFl2dyerD+AsmX3uPCN4bVoyBgPjAR7bbzthdM4/xxMJcC1DMS/kO6D7rMIq/COTZ3qdS667/+QwXamayGdJe0F2lVqShF+MvQejE7hJAtWZ0z1/gPXFCApYTQnVUa+plgwDzXN+90/fwE8x5d+z+ds0USiBXLCcXHr2A7SVxTey/ECDBiNBOuEklrmUK77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYLsUqAq+c2J2dbl57tkaK/tCRP/H755lFR6EGXsFsc=;
 b=u3cuV9xG8pGsnBmtNuF6ClmiYzIj6t8Up08XaBfWbMi9fsL+uP5AmJibFEdYkxcBsA1BD+cxbMnTfPhtG2qZycc+X+04Rzf8zBJ+RqCLO6mQeWZd7wv9SByUtTmCj1xKyE8pmFcDrULXFbo/9dktVlRN3diE+13VBu2vhbUHk/cucI8zS+fvfizRi1V6P8BVLPauc+0uNRJTPVi7oPzh8Cdl7lYtA0Ef8BKQS5icyLoKmQQGbfmdj51s7jM07h+w5wcy8PJgzuAw0Uc0Smqe16iJ2SorFcUl2+d41D73R6yFculjQCQlUem9EKh2ys4YFQBq3i/Qje4K7OZE1k5IbA==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by TY2PR06MB3230.apcprd06.prod.outlook.com (2603:1096:404:9a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Wed, 24 Aug
 2022 01:56:24 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ce1:d9ac:e036:3e5a]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ce1:d9ac:e036:3e5a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 01:56:24 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] watchdog: aspeed_wdt: Reorder output signal register
 configuration
Thread-Topic: [PATCH] watchdog: aspeed_wdt: Reorder output signal register
 configuration
Thread-Index: AQHYs7Dzzu8nHfKi6kCIg7p/4YhId629Pm+AgAASFzA=
Date: Wed, 24 Aug 2022 01:56:24 +0000
Message-ID:  <HK0PR06MB2786179F8469AFB8C0337009B2739@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
 <CACPK8XfeocBz6phbYyuHHMmZhisw5kGr3QpkdWv3LocvAN=WsA@mail.gmail.com>
In-Reply-To:  <CACPK8XfeocBz6phbYyuHHMmZhisw5kGr3QpkdWv3LocvAN=WsA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcfda9c2-38ec-4bf0-a9c8-08da8573d960
x-ms-traffictypediagnostic: TY2PR06MB3230:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BS1Nwoh7QU+RhSri6lN203AIA+JusWYThHW76A9mH55+Lpp4zxf7v0uyKqzrkMr4uA3WQHe0emJzUwzQIN7WYFe7vkykRvNBsf4IwO/URfdr0kTLtAn4BAbwp0V9P5dGnEVddY+2glzq454Cxl25N4nQpSf/81jraEV9mUZDmotH76o9Nv332pBvieoNqa9oxor1jPY6IXLYQWcNw11eB93OtP/TRGzFWqw4Na3IjtaKouaT2QS8hWsf9+0gWoG14ynxFjUMgkINSxLbFNx6IrITXuV9d43X9irC6MsvTUuRY7PjxpfKqZ2Vwb0bIXA6pKdzwyfSLDwHI9gOCGNtFW6a6WqaRMJtq1Ieyq+uyP5MXjS6SHCTih2KFlt+H6eODjVrZ5oUHxQj1FTBgO8RA5xzeyLiPCFGuHL4pH3OVfodkjXBiqwtMiWv1t6HjVL8CY0ltRu1fOICz7NaltkryKhhkG1HGI3onRILOTwD8+fafp4R1qxtWRViiCneQEEdN7DG2sENX3IaeLWlfeMJhqoTJPbQvWxnns8YH3/rqaNiB+uQE8PUh6/XgoMXiAFmIA3X0I6KV1ed9l2Zv0iYzA+0IOmkwqGq6aKYGB/6QxT0rHQH4FrFsJThpblsv6adUY6caKIwST+ekmY5Ays7YfsO+F/mHPu/Yp4d7cWqJh0Gw3QUjpnkTVj7nF+7p59CNv2X/0ljOTGfUJYr46xdzarA9J6BasQTuAXnCFDiOMpvy5/VePUIkETbDr4fybYoKI1Qzm9j0o09Trvyk+HFZA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB2786.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39840400004)(376002)(136003)(366004)(396003)(346002)(8936002)(66476007)(316002)(54906003)(52536014)(2906002)(66446008)(4326008)(76116006)(66556008)(66946007)(64756008)(6916009)(55016003)(9686003)(26005)(41300700001)(53546011)(33656002)(5660300002)(7696005)(8676002)(478600001)(71200400001)(6506007)(122000001)(38100700002)(38070700005)(83380400001)(186003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c2tyUlJEUGxsa0NMV1B0RUc0TFRSRGRKQS92MkZzN2JPeFNxSDZkOUJGbm53?=
 =?utf-8?B?WVZJbjJPQ3lwcC83aWpxQk9CRkpKbmxvUndVMVY4R3RTUHFVZ0xFdURGUDdJ?=
 =?utf-8?B?cm5ObVRKdlRDNDRFTU9heEEvalRXQVV6RUcvQVdIMnZNanVlQUVwRTUxcnVn?=
 =?utf-8?B?OWN1RUh2bTFSMWxaeEVDbGswU0wzTUw1SFhzNW8xR2pRNklTN0FVNlIrSm5j?=
 =?utf-8?B?UDlGTnExVDRKY3J1SytVaVJVL00yazJxUHNPQ3Rzc0pvdTRqa2dJWXZZWVdh?=
 =?utf-8?B?VGtNYnlGSjhvS1BWOVBhY3hpb1NVTlRvTGZQUzdOTk52MEpiYnR3bGk1OC9X?=
 =?utf-8?B?UXlkSFk1eVpndGRXT0oyR1pPaExMSDZ1ZDZhVkVKNVBvT0VnTjF2cGJ3R0Qy?=
 =?utf-8?B?b21KVHBOR1RCMWtKQ2Nscm9wRDFKeXdyWDJKazBCYmE0Y3F6NlM0RFhTU2sy?=
 =?utf-8?B?dVRaOUxTdE5NMEt5a1RQMVJmZEF2SW15QTJJaWFxM2c5VXgrbjNpRWNMQjM4?=
 =?utf-8?B?ZEp5bzRxaFAwbmVlcno1WWxLNGJZaW9LTDA3Y213NkJxOSt4Q2E2Q1ZWWlZN?=
 =?utf-8?B?b3FJK3dDQ2ZubVF6TnpkSTIvc2orN1RzS1BwcWNmMFczZ3UzS1lKdi9IREVn?=
 =?utf-8?B?c1JraCttajN1VndjM2xRVnYyQVBUVW5oalpGSTFSemlQUkF5OHgwM1dIa2Zj?=
 =?utf-8?B?eTBpbGRoaG1OQ1lEQW03TG5UeWxTSXNnZXhPalQzQTR4NlZDV3BsMkRCVTg2?=
 =?utf-8?B?Z0V4WnRDdjNNeUM0aDZtUStseHFYMHNOajNTaXVyQUxyZnhXSGlhMzRLbzhY?=
 =?utf-8?B?eWoxNFQ0WkpDdTd4YWRVUngwRjE1Q3IzMWc1WTVtTnFDS2ZPeDhZa0F6c3Ru?=
 =?utf-8?B?MU01MWxtVGEvV2dLRmZIRXF2UjdTRXJhZEtmL2lIRHAxR1RneEVXa3BXY3Rq?=
 =?utf-8?B?MFJQVjg5ZHdCY05Qc2hmMWkrQnNtSkNHWVJyOUpOZlpkb1hOU2k5WUZ2R2Mx?=
 =?utf-8?B?TjF0b0JXMnhENHpnVE1wNEZMWXZtdHFqVDVxZHBzdUFsdWNVSHNnUDZUZ3Vt?=
 =?utf-8?B?SHZqTVVTL3hrdDUwS2NTMjZKU2dpUGtmeHN6M1ZVTjI4MWxUZElhR1ROQWtt?=
 =?utf-8?B?b3g3WGUzaGlKL0RaOGUwWVN1N05rZG9NSStNUDcvSmxPS09tekJldHd4ZjMr?=
 =?utf-8?B?ZWVDeS9USW1SekZNbUZrQXg1L1RKVFFKQ0pHenlxTDBNLzVnQkRPeTJ2WXZI?=
 =?utf-8?B?T3h0V0RYdW8ya1hVbVlZbVAyeS96Q05meFdkc2NINzd2UmYvQ3VobXhFVUdW?=
 =?utf-8?B?RURqQlkycTc0QzJnUHZNVng2ZGNjYUI1L2VXbXlwbHlWN2wxQ095VWhyZkt4?=
 =?utf-8?B?ZWpCK2lUU2FyU0MzT0ZYTi9OYmlsZjlNRGpSZzcybm1Hbmc3ZmJodlI4M2tP?=
 =?utf-8?B?WllWWHhzR1BGR0pSTlZTUFM0THRUWFl2YWIxdHRtTE8xN0xxalhxRW8zS1B2?=
 =?utf-8?B?ZTkwaHVUVUVZaG5WM3NXYzQwK09KQmNsNEJtcEhYWHRvZGM5TzVTaEtKc2Zt?=
 =?utf-8?B?cFEwMDZYcmxSRDdoSmswd1dFcDBHbW5xdGdKY0lGVU5SRnREL0dQS0U1Vkt1?=
 =?utf-8?B?ZXBLb2JJb3NTYnNQNDR2Mld0akxNVHZMU3FNNW9Mczd1MURjeHNza1d2Wi9o?=
 =?utf-8?B?b05qNHFDRjBhN2lMaDlKcVNrTm9ML0EweWgxUld6dkNSMVhKeUc1UENFMU5m?=
 =?utf-8?B?L2hlZmxHUWp1ZTVXTHdyNUp0L3FCaTlTOHZ2bWFhNThhNmVtWTRDeThHM1I5?=
 =?utf-8?B?QTlrbWhySG9mazlTa1FPTXVoa0w5QlFHaDl0eSsyc2pFeGxQQ0YyZStXMzN5?=
 =?utf-8?B?aXhrNVBOS1JRRlFVazNmVXFZUW5ZS0VQSEpiY002cmR2ZXNaUnp6OHBrTEc0?=
 =?utf-8?B?WVZYV1RUWGMvY2R0N2pFclAzL1g5b0hrWDBmeXBVbDFsQWVRUTMvV05MNy95?=
 =?utf-8?B?U0dPSXAyRmgyNE11VDNhaTNXM0FhdVhxRzN0OEpsY2J4NVMyYzJLS05rYXJ4?=
 =?utf-8?B?LzNKN1ZnMlE0TlBCY3FKU2dkQUkwd2cwRHNtL0pidi9iVUNCTVFFZ2phRXpI?=
 =?utf-8?B?UkJ1N3RwUGg1aU5UM1lLeFpYUjU4VmNnTXViaWlSakJDOXhGT1ZvVlUwTGw4?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfda9c2-38ec-4bf0-a9c8-08da8573d960
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 01:56:24.0914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/qnyt4jJfcTyk2FVXeHMTx7elDuMvYQ8py+6X1gm4c4B0pAEw3SK5NBSDHCI+sxowt9N8o86XF6t8d19a5QX/OObxdmwX4FREGp3RBxqkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3230
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgQXVndXN0IDI0LCAyMDIyIDg6NDYgQU0NCj4gVG86IENoaW4tVGluZyBLdW8g
PGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHdh
dGNoZG9nOiBhc3BlZWRfd2R0OiBSZW9yZGVyIG91dHB1dCBzaWduYWwgcmVnaXN0ZXINCj4gY29u
ZmlndXJhdGlvbg0KPiANCj4gT24gRnJpLCAxOSBBdWcgMjAyMiBhdCAwOTo0OSwgQ2hpbi1UaW5n
IEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBJ
ZiB0aGUgb3V0cHV0IGRyaXZpbmcgdHlwZSBpcyBwdXNoLXB1bGwgbW9kZSwgdGhlIG91dHB1dCBw
b2xhcml0eQ0KPiA+IHNob3VsZCBiZSBzZWxlY3RlZCBpbiBhZHZhbmNlLiBPdGhlcndpc2UsIGFu
IHVuZXhwZWN0ZWQgdmFsdWUgd2lsbCBiZQ0KPiA+IG91dHB1dCBhdCB0aGUgbW9tZW50IG9mIGNo
YW5naW5nIHRvIHB1c2gtcHVsbCBtb2RlLg0KPiA+IFRodXMsIG91dHB1dCBwb2xhcml0eSwgV0RU
MThbMzFdLCBtdXN0IGJlIGNvbmZpZ3VyZWQgYmVmb3JlIGNoYW5naW5nDQo+ID4gZHJpdmluZyB0
eXBlLCBXRFQxOFszMF0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRpbmcgS3VvIDxj
aGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiANCj4gVGhhbmtzIENoaW4tVGluZy4NCj4g
DQo+IEZpeGVzOiAwMTJjMDQ2MDFmOWQgKCJ3YXRjaGRvZzogYXNwZWVkOiBTdXBwb3J0IGNvbmZp
Z3VyYXRpb24gb2YgZXh0ZXJuYWwNCj4gc2lnbmFsIHByb3BlcnRpZXMiKQ0KPiBSZXZpZXdlZC1i
eTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gDQo+IEkgd29uZGVyIGlmIGFueSBv
ZiB0aGVzZSBtYWNoaW5lcyBoaXQgdGhlIGJ1ZzoNCj4NCg0KVW5leHBlY3RlZCBvdXRwdXQgcGlu
IHZhbHVlIG1heSBub3QgYWx3YXlzIGFwcGVhciBhdCB0aGUgbW9tZW50IG9mIGNoYW5naW5nIGRy
aXZpbmcgdHlwZS4NCkl0IGRlcGVuZHMgb24gdGhlIG91dHB1dCBzdGF0dXMgb2YgdGhhdCBwaW4g
YXQgdGhhdCB0aW1lLg0KQnV0LCB3aXRoIHRoaXMgcGF0Y2gsIHRoZSBvdXRwdXQgcGluIHZhbHVl
IGNhbiBiZSBjb25maXJtZWQuDQoNCg0KQ2hpbi1UaW5nDQoNCj4gJCBnaXQgZ3JlcCAtbCBhc3Bl
ZWQsZXh0LXB1c2gtcHVsbCBhcmNoL2FybS9ib290L2R0cy8NCj4gYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWJtYy1pYm0tZXZlcmVzdC5kdHMNCj4gYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJt
Yy1pYm0tcmFpbmllci5kdHMNCj4gYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnNwdXIt
ZnA1MjgwZzIuZHRzDQo+IGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtb3BwLW1paGF3ay5k
dHMNCj4gYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1vcHAtbW93Z2xpLmR0cw0KPiBhcmNo
L2FybS9ib290L2R0cy9hc3BlZWQtYm1jLW9wcC1zd2lmdC5kdHMNCj4gYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWJtYy1vcHAtdGFjb21hLmR0cw0KPiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQt
Ym1jLW9wcC13aXRoZXJzcG9vbi5kdHMNCj4gDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3dh
dGNoZG9nL2FzcGVlZF93ZHQuYyB8IDEyICsrKysrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jDQo+ID4gYi9kcml2ZXJzL3dhdGNoZG9nL2Fz
cGVlZF93ZHQuYyBpbmRleCA0MzY1NzFiNmZjNzkuLmEwM2U0ZmY4MTJhMg0KPiA+IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jDQo+ID4gKysrIGIvZHJpdmVy
cy93YXRjaGRvZy9hc3BlZWRfd2R0LmMNCj4gPiBAQCAtMzI1LDE4ICszMjUsMTggQEAgc3RhdGlj
IGludCBhc3BlZWRfd2R0X3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gICAgICAgICAgICAgICAgIHUzMiByZWcgPSByZWFkbCh3ZHQtPmJhc2UgKyBXRFRfUkVTRVRf
V0lEVEgpOw0KPiA+DQo+ID4gICAgICAgICAgICAgICAgIHJlZyAmPSBjb25maWctPmV4dF9wdWxz
ZV93aWR0aF9tYXNrOw0KPiA+IC0gICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9i
b29sKG5wLCAiYXNwZWVkLGV4dC1wdXNoLXB1bGwiKSkNCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICByZWcgfD0gV0RUX1BVU0hfUFVMTF9NQUdJQzsNCj4gPiArICAgICAgICAgICAgICAgaWYg
KG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImFzcGVlZCxleHQtYWN0aXZlLWhpZ2giKSkNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgfD0gV0RUX0FDVElWRV9ISUdIX01BR0lDOw0K
PiA+ICAgICAgICAgICAgICAgICBlbHNlDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVn
IHw9IFdEVF9PUEVOX0RSQUlOX01BR0lDOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyB8PSBXRFRfQUNUSVZFX0xPV19NQUdJQzsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICB3cml0
ZWwocmVnLCB3ZHQtPmJhc2UgKyBXRFRfUkVTRVRfV0lEVEgpOw0KPiA+DQo+ID4gICAgICAgICAg
ICAgICAgIHJlZyAmPSBjb25maWctPmV4dF9wdWxzZV93aWR0aF9tYXNrOw0KPiA+IC0gICAgICAg
ICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiYXNwZWVkLGV4dC1hY3RpdmUt
aGlnaCIpKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHJlZyB8PSBXRFRfQUNUSVZFX0hJ
R0hfTUFHSUM7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
bnAsICJhc3BlZWQsZXh0LXB1c2gtcHVsbCIpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJlZyB8PSBXRFRfUFVTSF9QVUxMX01BR0lDOw0KPiA+ICAgICAgICAgICAgICAgICBlbHNlDQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnIHw9IFdEVF9BQ1RJVkVfTE9XX01BR0lDOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyB8PSBXRFRfT1BFTl9EUkFJTl9NQUdJQzsN
Cj4gPg0KPiA+ICAgICAgICAgICAgICAgICB3cml0ZWwocmVnLCB3ZHQtPmJhc2UgKyBXRFRfUkVT
RVRfV0lEVEgpOw0KPiA+ICAgICAgICAgfQ0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==
