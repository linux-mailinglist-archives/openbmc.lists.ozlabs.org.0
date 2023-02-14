Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336D6958FB
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 07:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9sH2BpWz3c7s
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 17:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=agmXQ64F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::720; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=agmXQ64F;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20720.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9qy5S0Cz3cCD;
	Tue, 14 Feb 2023 17:13:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMHOGW5lRlBeM5UhBLmDNd0MSu3tSNUrQPROw2lUL4MvJzB5WY+B6JTZgirhhSA/GZ8naETKkHykKYfcrcE6usp3rd0OjUx782lEpcYnL2/+GNxy9XRWM7ze1i8mki3E7n2MxUZE0mqf37qNViemrkxJWAFIMjgCt1XhluK+O1Ed9MCVrIv4vYkLckoTBtzAlrfUcdKn4XXYWJwB/qgamXxNhMd0aR3D2rM1kOBsfmGsBa6voExy3fF+8DI8HKx0LCfWNoGC1y/J9K51bFFa1RgbInw5RgzTZwytQ0rjMudegYkGuUek+JCNGnnhfIpZnIWXV63uyp/YlGR7Tk4y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+tvUWAOyFFwTj/NQfBhEA+wHjiTY59r81vsySqFb5E=;
 b=YEok0kz3eaKvBq4Ne9BAg8Ly/+CbM4rDoIUgZNGc3lUi0weoXXAu5wgWvTUlX3NxYgvBCbxajQ02Q7vudQLPH+V7rz4FQ3qqxwlM88bC8ylwrwa9SHtEp9CZvBiZLTix4pcUYwzJFSnF0Scgsg6aLj6Zi6jXWscnVAHgs9x8L0n5b/RnOfW4SBoePceT6+POg5rYdxO/I6GsYxksdRGP26E4UytxaMwXvGE/VUqa7u8lvU3EfVFoWn+ThwIOfPPzjQZTfp/0dKycXCIS1wc5O7/+zQpTFrBQlCVOL3kLoxviSov0bVYVjKV2SYdARxXwdMdeGlcEEvn7tjvDwsXDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+tvUWAOyFFwTj/NQfBhEA+wHjiTY59r81vsySqFb5E=;
 b=agmXQ64FZegsXY5cCzEEelxrMy5ywJURTlzTUEG/laEfjqBVgL1JhCsDuONXtPmforolhJf3LXrfJGW6xSJJ5CJnqCFci9GuuG/sG2WrGhICDfmxIqYHpPszx8hf4rjBGABxBROuRCnW5jYkFxzvKBvCDvFgHM4DuIi62yWJ0KFdwY4gHECAJWA6s43s7YLY3wD5riLMVMZpEy3gcWZErkKiUmi9RlwH+zv/cIv85v1Blh6Ukjr3E8zeZVA3UwACZ8f0nc4sZajSH4iWTVVSslk+8Dau4QVmR8x5uIXBOC3k9IwF55BeqyaANaFwNCHP6TkyNColsiJWVk9yJpLFeg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4392.apcprd06.prod.outlook.com (2603:1096:301:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Tue, 14 Feb
 2023 06:12:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Tue, 14 Feb 2023
 06:12:54 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
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
Thread-Index: AQHZNii3gD5v2vNmBkaMPcn6K0RsGq67LCOAgAAkr4CAABWagIAAB/owgBKbtbA=
Date: Tue, 14 Feb 2023 06:12:54 +0000
Message-ID:  <SEZPR06MB52698009DA893813FECBE76FF2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-4-ryan_chen@aspeedtech.com>
 <30c7cbbf57abbdfb5f974d6ee17b2218d124c7e8.camel@ozlabs.org>
 <SEZPR06MB526941A3DDB25529F0671112F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <5239ea2f-284a-dcf5-6dd4-be3b13b319e6@linaro.org>
 <SEZPR06MB526951F24B841965C0DD6B84F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
In-Reply-To:  <SEZPR06MB526951F24B841965C0DD6B84F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PSAPR06MB4392:EE_
x-ms-office365-filtering-correlation-id: f97de24e-2ccc-4e73-9240-08db0e5282a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zD3D8Er1XpnD9exJ2EGnYLIGq83cYUB4dQY6MJC5zje5JLDTIvRZQv3N4MO+U6A/Xu2Yme00AybB+RCkQqAIugADhM3ay9jNERTHomohXcstM37NVeUHV4lOQoTwaT8OCmlLwHNp7H1/H4zniLJm8XlxotfkjlgehUjPfJYXzVHzW9HDERabs8kYvR2a2ibHZWX+Ss88/tNJESoyY665VeCX7ZZ6c64mHwT9+SrhehwMICKMCZByQPd05t7Mk4Ci8noHG247rjIzGKQhLKhbcFFV9KI6+UcGgkRktnlMvRnHJXIZuUXI9S8KbAooC7P5zvfF6RoOEeKuaM+DV9PVgZ1OmbFUC6gFyTDQ3QBm1Wl56VoHOtc1IZqUDpOJY/xRXxjX4qy1QiIcZRiS1/9nc/fgaenfaGjRmfEL7tQFhl3DfcCn5ZL1koXJ8/IxYD7yfAyybMk7ia1Ry552BMrxN0CTWFQdqiYvh4vQb4ukB3YYQq72cGR/sO12zQR7WtMYaSXmupsSKzhpsVf0a2afsARDKSrh1OHI+t9yOE5iUB45fke5NyUP2i3Po/QYEXWX/lskbDXwil5AnD9GyB7dTF54vIn5CszXlGgADdiOU/0hvddcjHYMGnciqWVUCVEH4Z8zElqtiAySaLSYisw4YQfWHPEOXZvqKQT4p79/wCGqcw9mNSop6DZ9CXt09eV56/lHC/MkggJZvFLIAVCTcM7ctxQK0z/0SJF/FZy9k94=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39840400004)(396003)(346002)(366004)(376002)(451199018)(5660300002)(7416002)(71200400001)(9686003)(41300700001)(53546011)(26005)(6506007)(186003)(52536014)(2906002)(38100700002)(8936002)(38070700005)(478600001)(7696005)(55016003)(110136005)(316002)(66946007)(64756008)(66556008)(8676002)(76116006)(66446008)(66476007)(83380400001)(86362001)(33656002)(122000001)(921005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SThMSE1zb2Yxc1gyRFBSNFpEWjVNOHpwcWdCR0VTVDltaVN5Wlhpbk1YaW1l?=
 =?utf-8?B?em9NSXFHUmozNW5ZbHRmTzRBVzFtL3BIOXFsUjR6UXhtVE1mRkFmN3BCLzFM?=
 =?utf-8?B?SmZPdkV4ZkRVNUpDSG41NkJCQVhBTkNXRDhGeWUxd1FxRDRObEsvMHZmTFV0?=
 =?utf-8?B?Umd6bGhVMStXTGorTzNHQ2NmTlBKMWVzUVhlVUZzdWhNdGo0Njgxb05URld2?=
 =?utf-8?B?NjFvMWlnSnpnU21ZOStiaFY3R3J1em9wazhHSEtrSGxkMlN6bHhaTE9PbFJp?=
 =?utf-8?B?cnhRTStTcDlhd0NxUUdjeElJamRQOS9LaDUrYmxucU9PWVZaU2V3VDRaczF5?=
 =?utf-8?B?bVh4amh4bzNSSFQ1SjBscGpwdGFwNmg2Mk0vNDU4bWwrbVB6WG5jeHpHMTdO?=
 =?utf-8?B?MTBGSmRmZmJ1aWpjNS9uVzVSM2VuU3QvSFJVaXRxZjl6MmNLb0JmWGdvenp6?=
 =?utf-8?B?aVhtRWNUc1pkVm1uVGMzN1pNL1QrMGcrcThnMzN1OUpPMS9TSEFIaGsvVlpY?=
 =?utf-8?B?c1hqcGhkVlQ4Y3JIVFBEZGN6amFrUnZGN3RPMlpWOVFIamVmZGpjaTNwalRD?=
 =?utf-8?B?c0Jnb09ad3Jwc1huUzVYdlZYUWtoK1ZLY0d4YzZBdk1qMUlleGY3eWVVN2lw?=
 =?utf-8?B?Rzc2dXBuWjUvaVordWlPV1FRditZQ0dKbXdKSDhHU3NyempmNzZiejlaRk1T?=
 =?utf-8?B?WGluWHI2VTBuSXBnc2FwQnlzZFNIMEhyelU2cHV1cGpCbWZzUXZtOERzUENG?=
 =?utf-8?B?bk5JeEYxZEdvcldBTVJXMkd3dWc5VzYwTm90YTNPeGtqaXE0OFhaY2VRVWRk?=
 =?utf-8?B?VTIrT29BUWJLajBQTXhNVXJ5eGhvalFKR21EZU1qaFc4aGlwSTdtTjNlbW03?=
 =?utf-8?B?bXFNYXB5MWpFRlc1MEFoWW9GVGFyWXNpdGtsMythd0toR3NKTTIxY3U2TDhU?=
 =?utf-8?B?S1I1a1lhVzNtQ25CV2JINUhScnM2U3NOQWIrdFBhUmFwNzJiMCtLVGI0T1k4?=
 =?utf-8?B?elc5M29LTlFLT3lmakJtWjlIOXY3YUFQOEFORnAvcWlBM2dLK2FPbUJvNEdB?=
 =?utf-8?B?NGZYM1BXbVN5NDAwSUs3bTB1Sis2VnZ6Y1lSZkRyUDk3MDdYQlQvUm5SeExo?=
 =?utf-8?B?dXd5eXZwb1poSlpUUFYrRTFuUkt4cUpCckNNNTBCcFRTczZZWmJLKyt5cUds?=
 =?utf-8?B?aGpiRU9qK3R4RlpGampCVndrbFpTa1JxSW56M3V6YmpSL1ZCa05GRWE0MlN3?=
 =?utf-8?B?Z0s3RDFESThQSXZScy9KSmQ0QXltRG9LNDFLYWI4akpnT1Y2THRTTTh6OTMz?=
 =?utf-8?B?cUp2cUgvSGRxbUZ4S2FpTjFxeWk5SkppbHAwQUc3QTdmTk1GSk5rQTdiaEdv?=
 =?utf-8?B?M1BuZG1jR2czOVZzN3FTV2ZEdmFRV0FZRkpKbzJnSWhzUW9QYVE2UExicDkw?=
 =?utf-8?B?aksybVZUcFpGZmovbzF6cTZXU0ZzRmJFSkh3WTBmR244R0oxenJZN1BDOVJ4?=
 =?utf-8?B?SzBlQWFmMmRPSXluZlNFZnJXazdyV2NmSzdncjNLMkZ2Qk1sTjhkVkd1R2RV?=
 =?utf-8?B?RHBsQUQvR2VGbzkxa0RVQitYZCtQRG1uY0xrdXR2YjYyWDlZRThIMldZU2or?=
 =?utf-8?B?bTl2TitHbmgzTnRiSWt3bFdUaHVHcEFtbkdQZDIxK0tmWDYvbk9Ic1FITkhY?=
 =?utf-8?B?V25vYTRiUjZKSGM4Z1h5d0dGZ3Y4Vnhva2ZwNHV1OHNDSmZwYUhjU3NuMUxE?=
 =?utf-8?B?M05JS3JoeXNqdmpBNWRaWUFyNjYyTTQvMUlQdzNOS05TVVNObXExRUtvb0JJ?=
 =?utf-8?B?ekovQzNMdVNsSXFsdGlsZFJ6S245LzdBbkduNHRkakRTVGM2THRrK0dtMytU?=
 =?utf-8?B?Yk9vQXplWHpzWVhMWkFHOUJqbnFsRVZ1WmkzbzlwVXpQa1hiVUYrS0ZLUU1M?=
 =?utf-8?B?RWdHaDM0aW12T2hKREJPdWt2QXV4ZGZQSXJPUk9UWE9OWjZkWjRsOG5HKzBx?=
 =?utf-8?B?dWQwTUg4Sll6ekJPYW01NkhscmpnaWlLenhGNUtUeWF0cStSL2xYQUlsUW84?=
 =?utf-8?B?dVZIVmU4T2o5d1REc1RmYmlYN2NyRndkSDI4YXR5NSt0cE5HYThwR2ExZk0r?=
 =?utf-8?Q?/Fqy623s0EekfSrqCaFWqXBq4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97de24e-2ccc-4e73-9240-08db0e5282a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 06:12:54.4690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cc/dKSsR2LoLUSNMbabtKVSbrO3Vv5NyaTP3SrrPkotKo9rRrVGGkuYvUixTD/klQaSBxfZ5tS93teoJK/9E8nT87/p7y9jcN190+9FD+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4392
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

SGVsbG8gS3J6eXN6dG9mLA0KPiANCj4gPiBPbiAwMi8wMi8yMDIzIDEwOjE2LCBSeWFuIENoZW4g
d3JvdGU6DQo+ID4gPj4+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYXN0MjYwMF9p
MmNfZ2xvYmFsX2RyaXZlciA9IHsNCj4gPiA+Pj4gK8KgwqDCoMKgwqDCoMKgLnByb2JlwqAgPSBh
c3QyNjAwX2kyY19nbG9iYWxfcHJvYmUsDQo+ID4gPj4+ICvCoMKgwqDCoMKgwqDCoC5kcml2ZXIg
PSB7DQo+ID4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubmFtZSA9IEtCVUlM
RF9NT0ROQU1FLA0KPiA+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm9mX21h
dGNoX3RhYmxlID0NCj4gYXN0MjYwMF9pMmNfZ2xvYmFsX29mX21hdGNoLA0KPiA+ID4+PiArwqDC
oMKgwqDCoMKgwqB9LA0KPiA+ID4+PiArfTsNCj4gPiA+Pj4gKw0KPiA+ID4+PiArc3RhdGljIGlu
dCBfX2luaXQgYXN0MjYwMF9pMmNfZ2xvYmFsX2luaXQodm9pZCkgew0KPiA+ID4+PiArwqDCoMKg
wqDCoMKgwqByZXR1cm4NCj4gPiA+Pj4gK3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmYXN0MjYw
MF9pMmNfZ2xvYmFsX2RyaXZlcik7DQo+ID4gPj4+ICt9DQo+ID4gPj4+ICtkZXZpY2VfaW5pdGNh
bGwoYXN0MjYwMF9pMmNfZ2xvYmFsX2luaXQpOw0KPiA+ID4+DQo+ID4gPj4gTWF5YmUgbW9kdWxl
X3BsYXRmb3JtX2RyaXZlcigpIGluc3RlYWQ/DQo+ID4gPg0KPiA+ID4gRHVlIHRvIGkyYyBnbG9i
YWwgaXMgdG9wIG9mIGFsbCBpMmMgYnVzIGxpa2UgdGhlIHNjdSwgaXQgbWFrZSBzdXJlDQo+ID4g
PiB0aGUgZHJpdmVyIGlzDQo+ID4gYmVmb3JlIHRoZSBpMmMgYnVzIGRyaXZlciBwcm9iZS4NCj4g
PiA+IEl0IGlzIG5lZWRlZCB1c2UgZGV2aWNlX2luaXRjYWwgZnVuY3Rpb24uDQo+ID4NCj4gPiBO
bywgd2UgZG8gbm90IGRvIHN1Y2ggb3JkZXJpbmcuIGRldmljZSBsaW5rcyBhbmQgcHJvcGVyIHJl
c291cmNlDQo+ID4gc2hhcmluZyBoYW5kbGUgdGhlIG9yZGVyLiBUaGlzIG11c3QgYmUgbW9kdWxl
X3BsYXRmb3JtX2RyaXZlcigpDQo+ID4gKGFzc3VtaW5nIHdlIGRvIG5vdCBkcm9wIGVudGlyZSBz
dWJtaXNzaW9uKS4NCj4gDQo+IA0KPiBJZiBnbG9iYWwgZHJpdmVyIHVzZSBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyLCBkb2VzIGkyYyBkcml2ZXIgd2lsbCBsYXR0ZXIgdGhlDQo+IGdsb2JhbCBkcml2
ZXIgcHJvYmU/DQo+IElmIHllcywgSSB0aGluayBpdCB3aWxsIHdvcmthYmxlLg0KPiA+DQpJIGZp
bmQgYSBnb29kIHdheSBpbnN0ZWFkLiANCnN1YnN5c19pbml0Y2FsbChhc3QyNjAwX2kyY19nbG9i
YWxfaW5pdCk7IGlzIGJldHRlciA/DQoNCkJlc3QgcmVnYXJkcywNClJ5YW4NCg==
