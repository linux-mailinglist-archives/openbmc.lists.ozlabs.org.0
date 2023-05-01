Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65E6F2BD1
	for <lists+openbmc@lfdr.de>; Mon,  1 May 2023 02:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q8kQx4VPbz3c9x
	for <lists+openbmc@lfdr.de>; Mon,  1 May 2023 10:21:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=webT9k2I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::708; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=webT9k2I;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20708.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q8kQD2QfQz30Lt;
	Mon,  1 May 2023 10:20:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ekybz3NYvmU1wD6Wa7b5nTBfaVQ0qH+QlnNhLik0+cXNGVbc9amKIohHt0yr/x7NNwnVwwK7az6DhSPPlRn2UfS4vUdGGndMe3faa9hGz1HNSIFOU1GJnHuU0iN6XS/mAmCgSC3yuibhnpBB21winpQRbLIp8gNxY+PVLCj2XqT7GRXAMhDxDxoCF/ntS3PpSb+liKDPM40sEKs7ffgk0Y3yen/qh2xhAs+hLIODub4TzgUbfnZV0pC5NqvzvmOnaaLX1rSmKiv6OFO1ZGXSnUf0IJXoyScGcbJ3Q8hcrfwLoSNqjqU3nldlMTRn+3qnm17pHD6OWqNY7ItOuz4fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F1MsifnkWjXdF0s7c1zwyGa1HagHDZpa1HPBaI51RU=;
 b=kOl4+10TSMBzd57Zv0CnJYd2eKwLdcrS5WTQkzAfJ6iIBwvNDu2eDPRqoqbpmkrwsQce7ANzehTJ7Qz9w87ljW83okdh3OSGIWIlSrIM3D0FubNFvmSV0ez6FQMOQ0seiN2WtjOAC1krPo9RZGG9vRw4ejF3FVk+kFY/CK00m5djPv7i/ChN4dgGjYxeVHQRBYHd5y4BRAY/uvFXfMtU9pzGtQSODhG/QpT7pjP4UlzjgUuZlfc7Y8QoWyldqBalVy/xGHVgXO1pi5vYC0+F2yWkOUeS7P4W55diaNJ7ghUKymv7qsFb1aAss/uX0E4IOMLwmt1J9DT9VN1rzDjoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9F1MsifnkWjXdF0s7c1zwyGa1HagHDZpa1HPBaI51RU=;
 b=webT9k2IU6HtWLFkNJI1f7n0t3vgOElGSveznKUWH2dhhoNVMQGy3Mh8Rl3WYWxkTEea+LjR46EFtYzV8WodRSBSRodZ2gy7NN1vhwaQISc7Wa7yiyDwJX1andvbKtBZI0aGX8qhtyUJ2kuVgMY6DAiqAluJYeizcBLaH8UkPlsrAzZX5pzEc92uUEjIO4jXvG9kws4wWV/MMQkoyiNqObRiVR7OLPB3nk+oJ+569r8xKHduAZmOIZHOEnzojSiAYGPIJzZWknJgphbjJ+GEBKQbw/aaqGT1exYoc+N0HWhzPkd9EQE72V/Na/XUXvCPTtXg+a6swAr8z0VLeRIdJQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5458.apcprd06.prod.outlook.com (2603:1096:400:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.29; Mon, 1 May
 2023 00:20:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 00:20:26 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Brendan Higgins
	<brendan.higgins@linux.dev>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jean
 Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>,
	Tyrone Ting <kfting@nuvoton.com>, Tharun Kumar P
	<tharunkumar.pasumarthi@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Phil Edworthy <phil.edworthy@renesas.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "=linux-kernel@vger.kernel.org"
	<=linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v11 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v11 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHZexqp8gJ7xo7JFEqmTFNCmoKpXq9DxIeAgADKKEA=
Date: Mon, 1 May 2023 00:20:26 +0000
Message-ID:  <SEZPR06MB5269BD01787FDD95C86031E1F26E9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-2-ryan_chen@aspeedtech.com>
 <93773f00-1301-cf77-9bde-5de0595fec8d@linaro.org>
In-Reply-To: <93773f00-1301-cf77-9bde-5de0595fec8d@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TY0PR06MB5458:EE_
x-ms-office365-filtering-correlation-id: c362a362-190a-4d0e-0b6b-08db49d9dcdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  W/5cSTmNEQ6c/GUf5YCRV8yW1SFWlvtQKvLrKCU13qsuMhxWFiKyn68U4dYETSYJk4HQNAYKuuz6Lqc3/etovyaOU/u1UYbd3KZkwsGO4ynjTuUX3zoFCl4th6GowBQVLj0j+/wVDvmx12l5HaXaXDtKZ2KViMBtBR/rPcXGcK0X7yhS0/d0+KcMjnKBkXguq/P7bHjH4J+nJNFuohkNeQ+ixZLiLX3WQUD0pMD4IlmOj9VD1Grpj+LG/cPRAcXyDkevZYsuTwv4ElpKchflA+kBxUPruKmflrkj5ebuSsat3egabH2RT9fOiTCo/eJWIpi3P7bN0FA/d650czN/x+DO7/HRYCfS6Vfpo/dMWjRJzDRZcCsQALTCJSz208eqs9cEmyin2UiRNq4NDDaDgMePgw6LKmxeJgtEh1cIcq53L1rgjhDpH3N8DqSPHxWTk8lBezXwdpTMSJxKLiHtRz7At8+Bi6B9B6T4fFDEPJfGr6G90Yiyf2vpOm8o02Jupp8Q0Ga+vqzUHPCO59hVT5Ud3GJ1qQICTXHcq0IUCaaYQmamku/zvO1fDtwj5ELrvrtawVwXkzrPXHGP9TU5Eg9YpP3CRfXeNOCMcoJYwtQI+OwM7yrGeXybh1ulAjWi
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39830400003)(396003)(366004)(136003)(376002)(346002)(451199021)(110136005)(316002)(66446008)(64756008)(66556008)(76116006)(66946007)(66476007)(966005)(478600001)(7696005)(71200400001)(55016003)(52536014)(41300700001)(8676002)(8936002)(2906002)(7416002)(5660300002)(38070700005)(33656002)(86362001)(122000001)(38100700002)(921005)(53546011)(6506007)(186003)(9686003)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WGRnbGxTbUFSci9WUkEyZHBxdVB5RU00MHhqazlra0c4MmJEdGpvc0EwR2dT?=
 =?utf-8?B?UENNb29RYnpDRU1INDZOWld5ZFhQWXVjOHluOFpuWnFNS3pvdU1ZQWcvNi9O?=
 =?utf-8?B?SlpNQkVKNStZRDdjRUdjRjdONHdxblJoM3RhYnpXNFVxME15ODROOExtU1c0?=
 =?utf-8?B?RWVRVTRIOVAvbnVKbUxJQlpOQzM0QXZTT2puZmtmU3VHMFA0Y2Z6RFdtT20z?=
 =?utf-8?B?NkNpZ0psNjdwSFcvZFhIam5UajRZRWNrTVhQdHNaQTFPTkdYajRGZGo4Q2tk?=
 =?utf-8?B?U200TzB0elNoRGZsT2lFcmpNY3Q5WGVpcWtYblNFWFd4Mkwvc0UzeG9pV3Fq?=
 =?utf-8?B?TFZBN2ovNmtxV0pQb2JqUW1OU2hGcEZQR0hCd3NnMnl3MWpCM2s5aEE4RVJt?=
 =?utf-8?B?WFZaQlBFUGVtV01QQ0VsNXNIU2Rnbkx4YU0vY0xLU0FQa1pBRDc4TWlDMFpD?=
 =?utf-8?B?S2ZNaDc4MHY5UWdlcVZHT1J5YitxSk5yMG5Kak1rcExmV09RaG10WjZOYjNx?=
 =?utf-8?B?TmdOcVRKS1BwT1FCbFJySWNqYUVkUkV3Vnp2SktWZUYxY1cvQUxDdFFWRnBQ?=
 =?utf-8?B?M21HUzVSVCtEdUVMdUdjaDhpY05USjBWR1l1MzV6OHBDbldEeUM3OFhzcGF1?=
 =?utf-8?B?bU9XY0hpZlBFS0llNldhWkoreHFwd0hBYmF0eitxM0kwTVdpQlNwdElRWTkw?=
 =?utf-8?B?YVAzY2x3TWcyYjNDNDVHd3p2dm5LaFQvRUhQOEN6TnJvK2RxRGZtenlxUkU5?=
 =?utf-8?B?NzdseW9yR3gybnU5Z2ZTTE90bWhiRnNYUks4S0NIamZFaFhkZjlOVjREOC9M?=
 =?utf-8?B?VjVhNWxWcU5lUjUzdytPbWhrSTVLMEhIaGt0Z2UvNlpNYkd1dHVKeFVjTTFh?=
 =?utf-8?B?aHJ6d1RqS1Ixdis0cTMyUXJ6QjlSRzBIUDZWWEViUzd4cWZSOCtZWG00bUl5?=
 =?utf-8?B?U0VQNldFY1d6VFdlR011MjNOZmRwUUwyOFJva2liYVVXRWZzZUNvalV5NlRm?=
 =?utf-8?B?QURLZTJsZDJ3QXplRHNCK3RJditpcHVRSkxxYXR4MnduR1lkQjVPdW83Nm5Z?=
 =?utf-8?B?Tjk0SE94Vkt5U25mSTlZY3kyeEpmWjFLUWZkeUtEa1k2RXplcmMwNUR0Lzhv?=
 =?utf-8?B?NFhObHZzWi9wM2gzSHc3ejRqdGZJZ3BEaFoxY2Rsa3U3ZTJqRW83MC9tTDF2?=
 =?utf-8?B?TEdZVE16bVcxQnBRMDQ4dUFlTEV0bUpEQlNPbTBkUUFNNDAxbFoyWlNuK1FW?=
 =?utf-8?B?cmx1TVJJbnl0NWp5RjBQQlVQT1pqb2Z2M2dBaGlvL0tBVUdLK3pYR1JsMDcx?=
 =?utf-8?B?emVpZ0h2Y1QrY0E0MlQ5S1VrTVM0NExVUEMzZnppNC9TR2JPeldSNC83TEdN?=
 =?utf-8?B?RDkzM3luRFNOS3Y0eEppWnVVQVNvY3E3ZmkxYTB4RHNsSmJua0xDTTNBbjRS?=
 =?utf-8?B?djhpc2FES0I1ZjlzcnJQaE1KQUFvT3JyZFd4REJxM2xYN252RjdLVE1EM1RK?=
 =?utf-8?B?TXhuVmEvVmlzUDRhU2wxN3VIN3BJck9jOW8weVkvZExCUmZuN293c05LVGtB?=
 =?utf-8?B?WXltRU9DNHdVdDhSSXIxWjYxM25ZRmg0R0lpREN1dTluWERzdnFIaS95UjRG?=
 =?utf-8?B?QklCVVdMWFpnSERzb0g5VUpQNTNBMi9uUEFxVDZoVHd0SnI0a0tCRGo3Uzhy?=
 =?utf-8?B?VlRGSlcyWlFGSlZjN3ZnaFp0MHB3NE5xUHg5MHdBWjJ1ZUJJRVB6NHA5bW8w?=
 =?utf-8?B?UEhKVXBPVDNVSkZLZUY1eUkwbDJhdTcvUVV4WDRjVU1TT0xwRWJGcStrQkFW?=
 =?utf-8?B?c3FjTXFESCtVVnB3TDVqM0VBZnFVcGszaFBFNkJlaWR5ajZhYXZ4RExYU2J1?=
 =?utf-8?B?TnFGNWtkTmJEcWM5QnRIYWl5OFkrb2VlWjZmY1Byajdwdy85Q25FOWlUR2FU?=
 =?utf-8?B?Z2NXWmRKT1IzZktwak9Ta0FpZUo2Mkw3U05oby9IdTEyWkc2UXdybU1RTkhT?=
 =?utf-8?B?T1QzM01SbUY4dlRzaWhvWEt5WlpxN0xoNG02cXpYeHlubHZZOFVzb3lVbkp3?=
 =?utf-8?B?ZCs2VFVIa3FLZWo2VWRzOFpQaXJDZ1JXNG1BYk1RdG83SVBWaHdRN2tiVXVS?=
 =?utf-8?Q?DjD2wnfp25mnPGenZfloftLxk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c362a362-190a-4d0e-0b6b-08db49d9dcdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2023 00:20:26.4973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9D3zdt/prTtkFG7Pn/tW3iCHmAtOYF+jYFR4mdlWct1ldx8hpR+jdGJXseox58Xfe6YgTAAf7i0K6iIIOB7pBF38W69dgWDq6ISRXXlyK4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5458
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDEvMl0gZHQtYmlu
ZGluZ3M6IGkyYzogYXNwZWVkOiBzdXBwb3J0IGZvcg0KPiBBU1QyNjAwLWkyY3YyDQo+IA0KPiBP
biAzMC8wNC8yMDIzIDA2OjE3LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gQWRkIGFzdDI2MDAtaTJj
djIgY29tcGF0aWJsZSBhbmQgYXNwZWVkLGdsb2JhbC1yZWdzLCBhc3BlZWQsZW5hYmxlLWRtYQ0K
PiA+IGFuZCBkZXNjcmlwdGlvbiBmb3IgYXN0MjYwMC1pMmN2Mi4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiANCj4gVGhpcyBp
cyBhIGZyaWVuZGx5IHJlbWluZGVyIGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuDQo+IA0KPiBJ
dCBsb29rcyBsaWtlIHlvdSByZWNlaXZlZCBhIHRhZyBhbmQgZm9yZ290IHRvIGFkZCBpdC4NCj4g
DQo+IElmIHlvdSBkbyBub3Qga25vdyB0aGUgcHJvY2VzcywgaGVyZSBpcyBhIHNob3J0IGV4cGxh
bmF0aW9uOg0KPiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5L1Rlc3RlZC1ieSB0YWdz
IHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMuDQo+IEhvd2V2ZXIsIHRoZXJlJ3Mgbm8gbmVlZCB0
byByZXBvc3QgcGF0Y2hlcyAqb25seSogdG8gYWRkIHRoZSB0YWdzLiBUaGUNCj4gdXBzdHJlYW0g
bWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFja3MgcmVjZWl2ZWQgb24gdGhlIHZlcnNpb24g
dGhleSBhcHBseS4NCj4gDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE3
L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluDQo+IGctcGF0Y2hlcy5yc3Qj
TDU0MA0KPiANCj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3Rh
dGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuDQo+IA0KU29ycnksIE15IG1pc3Rha2UuIE1heSBJIGFz
ayBhIHF1ZXN0aW9uPw0KSW4gdGhpcyBzaXR1YXRpb24sIHNob3VsZCBJIHN1Ym1pdCB3aXRoIG5l
dyB2ZXJzaW9uPw0KT3IgSSBqdXN0IGFkZCBSZXZpZXctYnkgYW5kIHNlbmQgaXQgYWdhaW4/DQoN
CkJlc3QgcmVnYXJkcywNClJ5YW4gQ2hlbg0K
