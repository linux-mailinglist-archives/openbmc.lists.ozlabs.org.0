Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45015695DBA
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 09:58:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFVB18twz3cGH
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 19:58:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=C0hxnAup;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::72b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=C0hxnAup;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFTN6GJDz3blb;
	Tue, 14 Feb 2023 19:57:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djTNCTkQhFJzOhde7Tdw4+gXOqZv3QVVlIkgpOkLLWBxwnoiZw1WeAwbIOgmRugsQzvPV+WSWP/ZlKflJtMMzSHBf1hgFoxNevaufN2Hn5A3BJ8FcnxA+uIxj5YJ6LHVE3HnePs1e7/ISwK8Z4IUPNQHjAjdvzLcGNA9AQtJGRwkisoYi6DKd+ULwpNTCLIcwRekq9qheZTmcYph6V/MQokjq9atYl/GlTOvtbcofemI8K4BlZL4HQakP76EjipJ5isAiZu5tw722CDhAC3FJRJOS/4KZuB/c0dKGxw6/xUKJaLAg2K/AMfRE2UJDh/JYeVo26muBCCwdxrPvb8+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0+goLYCBzvFE4Mopxwr6KRghxUBD+37aT14bX8wbE0=;
 b=B/u7wrsohtH88cQgXPNFjymWv0rrIFODvCb2qbGPGIexyAy6l3dGkthh2MFzdF84x6jdO3wB4pMjgGs33EyRw2JIJN1bfr5QppDfTHL8cztesOGRV89ZwluUBJVUxrVII0IGj6ldT1H5NNLBhnwt7ao8qUI1qYGLEV+0wcj5hcO9zmyrwZlAlZ/QEpUlRC4eUp7Cu8ILT9t/O9NyNCHgE54XI52p/KslTvaNbqbg4VQjN9XlYfzMg0B5Px+rXBrX7XfdsuZ5Lmxg8eMBwcTMt6b/nEUfNzHTKql+Y2ZvSSLr2cjHGuEqGQkIvBOhjC2y73f6V2C6p8WbIVuo0Y2CLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0+goLYCBzvFE4Mopxwr6KRghxUBD+37aT14bX8wbE0=;
 b=C0hxnAupx1TXw3jbaYVgVCNwP/KUeOca6kZ5xiTvBFkonFSsUeTGRU+DAXCE9UUGxqjh4qjcIOTTCa7DSDioH+A2AmV9m8+rQ5wtsKiK+wsAoMLZAIe3JsDEP4N5/T2VEmQAyEa876NUtvOHzfD03nMGySXuFdfNaT7+3EDgHEBHqfsH4kxmLgmfKDfXtGbCpEEO2npnUtDZZdUGu0RCtlDp1UY6tAQtCuHPZtpxW17bx0IcmexjCo4HLygOWOFNPW+TEqjgOffcn7e8eyoc7qONCiMm4Lsk+yWoy2ARQPRyQro2uxbR6jA6zjXwU+1x5aId4wkYp4CL2NXc55txQQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3930.apcprd06.prod.outlook.com (2603:1096:4:fd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.10; Tue, 14 Feb 2023 08:57:02 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Tue, 14 Feb 2023
 08:57:02 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jeremy Kerr
	<jk@ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register mode
 driver
Thread-Topic: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index:  AQHZNii3gD5v2vNmBkaMPcn6K0RsGq67LCOAgAAkr4CAABWagIAAB/owgBKbtbCAABqWAIAAEtHw
Date: Tue, 14 Feb 2023 08:57:02 +0000
Message-ID:  <SEZPR06MB5269752C96643832E32F8AD1F2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-4-ryan_chen@aspeedtech.com>
 <30c7cbbf57abbdfb5f974d6ee17b2218d124c7e8.camel@ozlabs.org>
 <SEZPR06MB526941A3DDB25529F0671112F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <5239ea2f-284a-dcf5-6dd4-be3b13b319e6@linaro.org>
 <SEZPR06MB526951F24B841965C0DD6B84F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <SEZPR06MB52698009DA893813FECBE76FF2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <013cc486-dc70-a8b9-69d2-d0ae991549fd@linaro.org>
In-Reply-To: <013cc486-dc70-a8b9-69d2-d0ae991549fd@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB3930:EE_
x-ms-office365-filtering-correlation-id: 4aef5c92-6e3d-4297-9d1d-08db0e69705f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0FUYNSq3FbX4BGGf+hTGy0KPuNcF18BL0Q7MQwswLumCGJ72Eyr6GYRFHxbgPhDYVY0b8MD7fO6thitPCFwN5+hGtbXwC9aTCK5aiNh7A5yG9irrbJatq/5akSeg9HZ9ySBAhrmZ8jyc764cSBi9drDW3oZKLY2AFOURUHEQtolfrUkoI2UBNepKRJYJJBD42v4Df8AJoQC+ISZtaeJohG6vjoieyjktRtyr/hHjIIXgL6/OF7u0mPjhjZt7AbzBuzlA3oU6024k89scYBeu9rc1aO71VKt1y+MPiGvyUahh+s3s800UYkuS0ReEzzSyEDOvtVOJrPvdf9XtZNZrf29lKdzzlQQIDMgdEBNPCziF/k9TbfNwla2xwZbL7tw88p7PNl7XDjsu7jJ+nP/dN6QuQEBGmPkELO1fbKL9SiBYfLRMx34IT+AH0hR8RHwC1zkLsQA4z5giuF6Mw7Lh3eUOZZYlmrLdKNoA+qU9mgt2RDDOAkK56cEWSZHJpxQCynlLEuvPyW+BY3KMy64vuNiF8TcS5ta6cZzm6vIIV9dsB3RZPNn6FI89W2q8/QgIdRt27OzB9VYtxbeJPNJqYDGx2bsRUyVv9u+1nHCnMzHiwbJFsYxwRKNB01eo2wEBgCLJZC+Pygk2EeyJf2uUeGeR5A0LK5ficIwhQhKhOiodY+iDyRKQYlT0GPAj4HVhU7DTJaiC1WBqu1vfLjby4s4YY1brLTyudcPzBzzXnKs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(39850400004)(346002)(451199018)(8936002)(52536014)(71200400001)(8676002)(55016003)(76116006)(64756008)(66476007)(66946007)(66446008)(110136005)(83380400001)(7696005)(66556008)(316002)(33656002)(41300700001)(478600001)(26005)(186003)(9686003)(2906002)(38100700002)(921005)(86362001)(122000001)(6506007)(53546011)(38070700005)(7416002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q29MZDdkUllGak4vVEh5R040dXJweERZOWtPMnJtS2xZRnhmalRWeFByZ2JC?=
 =?utf-8?B?emgvMWtRdXZpQVUyNUFGQmk1ME0rbzlYeExueVR5V2E5RHpVZmI0RldRaDlL?=
 =?utf-8?B?dlpaQnBNTG9FVFhneEYxTzdpVDU3YVBDemw2bmgvY0VHdmRFeXRWZW4zc2VV?=
 =?utf-8?B?MGN4UU1iQzBuUGkxakd5L1hueWtGdmZGOXFZaTFlb0JBa3VYYlJwdkdlek5S?=
 =?utf-8?B?bld6Vk93ZFRiV3ZZVUZpaTZNZ2N4YWxnSXA5eUd1ZzZqMWVHSHpFSFBmNzB3?=
 =?utf-8?B?Nm5oemVsWmpGUnQvc1RZRTRYcUV1cUM1WGtmUkxjWTRGOWluVE1pMFMzY2Fl?=
 =?utf-8?B?NVJLN1RTRGJvd1JPSFgrVWdnYitmM08yRFdLeldMd0s1b2tuM0dKemxBRnds?=
 =?utf-8?B?S0FuYndPVWo1cGtncmIvaFlBTEVpYnFoY0dlTzZJSzMxVDVFcDZOV1QwSEZs?=
 =?utf-8?B?RWF6TllVOHFiYVc5YkZQczUzM2hDWHI3KzROMGRkSGtJSWhuZ0l3YW5ldDZl?=
 =?utf-8?B?QjZHTm1mTGlKbUlpakFQaVBVQW9LZnRaT1JFMVp4azNlRS8xMGxRQ1BxYWZj?=
 =?utf-8?B?Q01WSkYrNENxWTNNcUVsdVhlRkxoYjJrWlR0UDJNdlpCV3U3ZzE4NG1HUlVQ?=
 =?utf-8?B?bzFKRUJWRnVrdjR2MndQdDl0RCtHdTFsakpDSFdaVTZ4alZqcW5Ba0N3UTNG?=
 =?utf-8?B?TW9WU3ZGb1hzanRvNWc4YmFOVGdKQnRUd08xMkJ5MDFwSDZBekZXMFd3dEht?=
 =?utf-8?B?K1JMZmxsNnMxQVJkTE41eE1Cb3lSUml3RlpNaEJXUExIQ01OYTMrQm5SeVBz?=
 =?utf-8?B?eVNlRi9rbDRqMWl3Wnh5S2hyS0xwU2RUODVnU1JDMUVjelROZmwvazBhZTht?=
 =?utf-8?B?dy9LZEZuWW5NbTZTSTgyWFozZXREUWpkVVNLTnNqOEF5VHBFNVRXT2Zsa1k1?=
 =?utf-8?B?bk0wZ3VORk5KS0xWa3EyVGw2YlJWWTZnajh4eUFOazdSZDdLazVqZEFvdGRm?=
 =?utf-8?B?dGlRYm40MUtrK25mTU1HY1AwZ1M3Sk8ydEwwNWYySUdEZm1NQXRmbVFmcTh0?=
 =?utf-8?B?V2szT0VnL1RKd2JTYndaWjZVNUtwVHpGRGZNalZvRmZ0aW9meUZXSVpyRVU1?=
 =?utf-8?B?MGwydjlRN09sVVVMblNaZVp2RzI0VDBXSG1zTC9ubE43MExHcnlHdTlvQzBJ?=
 =?utf-8?B?aExGSEZaWlk2dWJtamVRbE5vajlPNGVNUzZDdG1lNDRqbHhkQXU1UDdyRGR3?=
 =?utf-8?B?eHhiN2Q3OG5TZEtCeHR1M045aS85V1kramdqVG1RbGMwMG5WUXhZZmd3b0Mv?=
 =?utf-8?B?bnRzbWM2Z0NSV2pHQW5YMDJ3QU04emlVZjR3RXNTNW9ObVZySU0yb2gxeUNV?=
 =?utf-8?B?dG5YWUtFMk00c3ZzbXpSQVI2YXFBaHNCaUxIVVd6ZG5qbTFHcU4xQkJmN1ZW?=
 =?utf-8?B?aitURFdBd3RicllneEVaU01wR203aEcrdmhZRER4QTMrbVJBRzRrMGZobk1O?=
 =?utf-8?B?OWVLUTFxVkx5OTlUNVM3UldMN1VpT1pQa2p6ZFZXYmcrajBRNjZ4R2hkVDNh?=
 =?utf-8?B?Y3B2RHQ2a0FGMjNZckdjajBKWVBacldzdy95aWlaR3VQdjlwektXQ1Y3ekhz?=
 =?utf-8?B?N21zTldVK3E5dXdFSDFEM3dmYThDT3BiYXFLYjIzSWVsbXNzakZFK2xObklB?=
 =?utf-8?B?bElXZTZ5blRjM0hqdXAyNVErN2owWjkxbWk4SW9FekNyU292SCtUalU1eXUv?=
 =?utf-8?B?blllUGxQMkx2SStlS2h3K1M5ZXlTaWZRRHF1QUJFbCswN2hncEVrNVZCYVI2?=
 =?utf-8?B?c3VoTElKeFNPaTRleE9mRHRnY1l1VjJxR2wyUklnemRZb01oT05KMEc2Qk9w?=
 =?utf-8?B?SERMUC9IS3FSOEJOU012a0gxRElHa29MdG1Sb2FiekF0WTRyNnpkNjBlTm5K?=
 =?utf-8?B?b0NJUnRZb0k0R0xTU2RoeDN2SXNIdW05Q3J1b2NRUUhoMk8wQWtDbk1tVUQ3?=
 =?utf-8?B?TjZ6NHdnWFlmVk5GK2N5YnpSOHRGL0FxYVptbHNYQnRmLzN0dlFablNTcDlY?=
 =?utf-8?B?TTMvQ1BZcFNVdGdEaHh6U0dMdUZIVXo4S2xrUUN3Q1p5TERzdnltRWN3a2cv?=
 =?utf-8?Q?9azU0MSfE5OZAfcd5QV3ZTo4B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aef5c92-6e3d-4297-9d1d-08db0e69705f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 08:57:02.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgQHBUTxXA4qTbYsHuP22psRpvdSh6f/Pu819xkLrbj94V0xuf+0HE1nuqybE5NJYyn2ibcUsrKgKtLoUQzSGhB2+N4vX8q3qYJLw9Qc9y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3930
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxNC8wMi8yMDIzIDA3OjEyLCBSeWFuIENoZW4g
d3JvdGU6DQo+ID4gSGVsbG8gS3J6eXN6dG9mLA0KPiA+Pg0KPiA+Pj4gT24gMDIvMDIvMjAyMyAx
MDoxNiwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBhc3QyNjAwX2kyY19nbG9iYWxfZHJpdmVyID0gew0KPiA+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgLnByb2JlwqAgPSBhc3QyNjAwX2kyY19nbG9iYWxfcHJvYmUsDQo+ID4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAuZHJpdmVyID0gew0KPiA+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC5uYW1lID0gS0JVSUxEX01PRE5BTUUsDQo+ID4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLm9mX21hdGNoX3RhYmxlID0NCj4gPj4gYXN0MjYwMF9pMmNfZ2xvYmFs
X29mX21hdGNoLA0KPiA+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgfSwNCj4gPj4+Pj4+ICt9Ow0KPiA+
Pj4+Pj4gKw0KPiA+Pj4+Pj4gK3N0YXRpYyBpbnQgX19pbml0IGFzdDI2MDBfaTJjX2dsb2JhbF9p
bml0KHZvaWQpIHsNCj4gPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoHJldHVybg0KPiA+Pj4+Pj4gK3Bs
YXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmYXN0MjYwMF9pMmNfZ2xvYmFsX2RyaXZlcik7DQo+ID4+
Pj4+PiArfQ0KPiA+Pj4+Pj4gK2RldmljZV9pbml0Y2FsbChhc3QyNjAwX2kyY19nbG9iYWxfaW5p
dCk7DQo+ID4+Pj4+DQo+ID4+Pj4+IE1heWJlIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSBpbnN0
ZWFkPw0KPiA+Pj4+DQo+ID4+Pj4gRHVlIHRvIGkyYyBnbG9iYWwgaXMgdG9wIG9mIGFsbCBpMmMg
YnVzIGxpa2UgdGhlIHNjdSwgaXQgbWFrZSBzdXJlDQo+ID4+Pj4gdGhlIGRyaXZlciBpcw0KPiA+
Pj4gYmVmb3JlIHRoZSBpMmMgYnVzIGRyaXZlciBwcm9iZS4NCj4gPj4+PiBJdCBpcyBuZWVkZWQg
dXNlIGRldmljZV9pbml0Y2FsIGZ1bmN0aW9uLg0KPiA+Pj4NCj4gPj4+IE5vLCB3ZSBkbyBub3Qg
ZG8gc3VjaCBvcmRlcmluZy4gZGV2aWNlIGxpbmtzIGFuZCBwcm9wZXIgcmVzb3VyY2UNCj4gPj4+
IHNoYXJpbmcgaGFuZGxlIHRoZSBvcmRlci4gVGhpcyBtdXN0IGJlIG1vZHVsZV9wbGF0Zm9ybV9k
cml2ZXIoKQ0KPiA+Pj4gKGFzc3VtaW5nIHdlIGRvIG5vdCBkcm9wIGVudGlyZSBzdWJtaXNzaW9u
KS4NCj4gPj4NCj4gPj4NCj4gPj4gSWYgZ2xvYmFsIGRyaXZlciB1c2UgbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlciwgZG9lcyBpMmMgZHJpdmVyIHdpbGwNCj4gPj4gbGF0dGVyIHRoZSBnbG9iYWwgZHJp
dmVyIHByb2JlPw0KPiA+PiBJZiB5ZXMsIEkgdGhpbmsgaXQgd2lsbCB3b3JrYWJsZS4NCj4gPj4+
DQo+ID4gSSBmaW5kIGEgZ29vZCB3YXkgaW5zdGVhZC4NCj4gPiBzdWJzeXNfaW5pdGNhbGwoYXN0
MjYwMF9pMmNfZ2xvYmFsX2luaXQpOyBpcyBiZXR0ZXIgPw0KPiANCj4gTm90IHJlYWxseSwgdGhp
cyBpcyBub3QgYSBzdWJzeXN0ZW0uIFRoaXMgaXMgbW9kdWxlIHBsYXRmb3JtIGRyaXZlciBzbyB1
c2UgaXQuDQo+IA0KQnV0LCBJIG5lZWQgaTJjLWdsb2JhbCB0byBiZSBlYXJseSB0aGVuIGkyYy1h
c3QyNjAwIGRyaXZlci4gVGhlIHN1YnN5c19pbml0Y2FsbCBpcyBuZWVkZWQuDQpJMmMtZ2xvYmFs
IGRyaXZlciB0byBpbml0aWFsIGZ1bGwgaTJjIGNsb2NrIGFuZCByZXNldCwgYWZ0ZXIgdGhpcywg
aTJjIGJ1cyBkcml2ZXIoaTJjLWFzdDI2MDAuYykgY2FuIHdvcmsuIA0KU28gSSBzdWdnZXN0IHRv
IHVzZSBzdWJzeXNfaW5pdGNhbGwgaW4gaTJjIGdsb2JhbCBkcml2ZXIuIElzIGl0IG9rPw0KQmVz
dCByZWdhcmRzLA0KDQo=
