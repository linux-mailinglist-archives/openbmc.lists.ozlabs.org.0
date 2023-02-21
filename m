Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3169D949
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 04:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLPyb2bpZz3c8G
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 14:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Vrof5hGk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71d; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Vrof5hGk;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2071d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLPxp152Vz3bmH;
	Tue, 21 Feb 2023 14:33:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX2eGhC5areCrCRlBXhvynL49jN/nwC5B+LClnj+Sl7v6SyeaZIJXAlfkuzSg37B7u3vxENinsIroIIU85A69UM+LXY4YZ/BjwG9piNFIp7xFqunVOI+Dlke8t2pB2w+ip88UzOhN5DkNZ4s6Q7NllQ1PilEHt9EqyXvQj9hN/GNoyvLI597TrockPBA6fjN6uxJXCjjDPq+HwGvzwF5SO1cLbR9/yY2EiPyHkrUd+j8LoHn0z/CKHug0it/1SATte8qbe5gm4gZLIOzOLB3YAcQYbVV7MhAW6OqB7cpK+Qy0WlMVu4rweIlAeeDUWyQp6JY/dXZ71h4vN9+pbKV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyHUDUqtZx+Y/FUk2oX7o4kHlKxwar3QXymWrlh+ZPs=;
 b=XVRIge2H/2cGZxumcIpEI3ckYfrtJZaOxIW/D+6h+nStDDbZHnrgfnGmQIo9JvWYT/6gWGaJLx7c0Cbmjf3qguiq55U3hsBazNmCoU7wNFYFwiyl2jJvN17Sp+0JYEV7NtXQiZWCSxeCyOyXKhB8g7yhvdF2UhLEC+RkgpRsp3kBjId1OYqqB95s2AN+x6e5UG/k8w+GVYsgUvJBVZMXpURlcCD+ZCeR4Ppr2pI/X4++RMpWm0iOaTcNnexZLq/iVDNKFMYNCs6tmSmsV/QJswP0TxWtirJnqlHkmMPW5i5QezpJefCFhT3RWrsb5hLNdl7wD58jDahWVtvewaNZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyHUDUqtZx+Y/FUk2oX7o4kHlKxwar3QXymWrlh+ZPs=;
 b=Vrof5hGkT4cWs/K2Ik8BhIZ3LGmih9CAU0VQrnmCY6P2OAirAGb09zU3JSlu0RPN1yw9ZEkZK83l1Pry+dNaRHOfRx2DakKuCO7q8+/oLlu23V1OFNBsZyIoEorXmYAvnSCaFMa2Ng655xHTfF/5oQFBwbLrjfNnNj8FORQXH3rbAfSoj/Joyf27OyRtgekXuIwVeAZuZCQLRFKonqhka0m8ZOnF5SDOiTmJSNB20LEd8jzPbIujW0gsniu3VrcNAgWIO+DQuAcArBUkEYV+uPUBnkB18JUV0QVgyu1SSsOigSp3PxmQ5VAeJZ63w15sL+3/3O5/AGoJmVEqmur6YQ==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by SEYPR06MB5278.apcprd06.prod.outlook.com (2603:1096:101:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.14; Tue, 21 Feb
 2023 03:32:40 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Tue, 21 Feb 2023
 03:32:40 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Index: AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7XgM2AgAAUk5CAABxrAIABC7xA
Date: Tue, 21 Feb 2023 03:32:39 +0000
Message-ID:  <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
	 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
	 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
	 <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <dfc2c2c442af55f64e147c920585cb7e6a74939f.camel@codeconstruct.com.au>
In-Reply-To:  <dfc2c2c442af55f64e147c920585cb7e6a74939f.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|SEYPR06MB5278:EE_
x-ms-office365-filtering-correlation-id: 0dc4685a-f203-4de1-8ea1-08db13bc48e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2xzmgyCeg2XI34lY2v1KMzs6VgiPH7nW0vwrRR0A9qAB96WzmBglSJSgfQtMV62P95gt7IAtTeiSPOtC28lDIYR2C1WWCWKn/VY1N4kMj1tfBlcaUwVfoTQWiY+KfUv4OlwFwguZT5r78tepkcYg4rDewcyZ/ZY6s9zrnFfCHP0xR9oMcfC1KRPB6rTb2Yde3C56rN72pvTID3tv4ZCVCVufMOEJy0Vp6gGGETgdXktxwZ+NSBrE8i/VxmyEsS4rG+xy6KQWW+nVvWCb+V3J2ozXyj5CjcVwi4qpyLHPXH+UDqk4gmJ+adHJx+5UpCRrdsijNGhKThEjWoRndBFaGCc5wDvcz7ylWi+gF5E8xg+pVMONamqC75Fd8fyYqpQEUWEUei8ntARLPKI0rmPEFAecAGreZf1b/7+KJ9MYNdw05XJuTTgMgAbXayuzdFHqRQogKMp8zFNfRBqgk1iLS+TvXOHSTaa5ER68wUoaS8j4F/0IK8xlw3qHM8zoU3952QygVtcf/OYiTx7lc0wBj4R3M0kRLeJnyqPPAVxTbG/wWa2azJu06H7mCLx8yzWJ8jW2lQwXNc48XLAIGCwxqq2H31Nr8v0b0V7Kx0O1YHDT+itxgJDIR6Uo8XDOazOr14aRWXVOG8wq5Nh2BSix4gUGW3eysZBJsFYDppgmXy2GchnBOZch6z7JkJMW6NW6F9ja4jD9HNl3dlkGJ9uUGUhwazn0yj2a/et3mgV77GE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39850400004)(346002)(136003)(366004)(451199018)(76116006)(8676002)(66476007)(66556008)(66946007)(66446008)(2906002)(7696005)(55016003)(64756008)(478600001)(316002)(52536014)(7416002)(86362001)(8936002)(5660300002)(110136005)(41300700001)(38070700005)(921005)(53546011)(186003)(9686003)(26005)(6506007)(71200400001)(83380400001)(38100700002)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NVhGM3k5MU1CUXI1eUFHNXZ6UXpueCswR25hWjEyQ1VDYkJGS2htSUlEZ0w1?=
 =?utf-8?B?M1Q0QTg4b3VJdkc0SUxEZ2drMUlGWjBnM2VVRERZcDRFckc4bHJZb3dhbHYr?=
 =?utf-8?B?aFVONVJ2Rk1IZ0xVYVZvVFJNQlNXVU5NcklJWkt3MWh5bjJ2czhSajhzWVI5?=
 =?utf-8?B?MTIwWDJhUnNEdkh1bTZJQmRweTlMVUsxalBSUjRTdnNZSDIrY3dkdURDZ3N2?=
 =?utf-8?B?YTRkMmtsTW5vaXdOYSsvVXJQaXNsV2xuL1hRQ0NjZjBKOWFNSUYvSnhoOWE0?=
 =?utf-8?B?RXFKNE9sUFIzS3VoNFN4SHBpdFUydGM3VXV0ejZVeTJZNDJFWG15Z3I1UElZ?=
 =?utf-8?B?YVFENkZRU3hBazNyZTltN0lEYUo4aW5ocERnRkhLTURjV3oxRUdNak40YVY1?=
 =?utf-8?B?OTNWOGk3NklWRUptSWNNUmExWU0yRWtPVVp5ZTcxWXhWM0w5VS9GbTY4bE1n?=
 =?utf-8?B?eXJHMGROL2diVTRTMnBVM1pSbjBoV29DLzBEQjI3YVJiVFFvcWhxM1BLQytH?=
 =?utf-8?B?N3JPWm5vby8wRGNQMDhXczhPZjQyUy9iVHBYNHdSZnRhZzFBMGpSMzRabUVN?=
 =?utf-8?B?RDlzdzgxNXhRbnBrKzh4SXJsOFRScC95TThacENtYWxQOXlOREdhQnloSXZ3?=
 =?utf-8?B?aFNlT0hPbzJBWHdDTkVWKzVhM1ZWSHNwMXk1ZE5nWVdnanlBMnBjcllhMDcv?=
 =?utf-8?B?YjVOSWkwUDFmcmx4TXVvVituTk9NbzVVaitpaEpTNm9GeCt3S3g2SVhMRWha?=
 =?utf-8?B?aWoyQVhGTS9EUGlrSXE4TnZKdVN2Vnh5UWRpMEc1aW5idkRQTUFpRmZsK1l2?=
 =?utf-8?B?R3Nyc2puUWR6U1ZycG4yTERtcGM3N1lYQ2VRYlhzb3ZPeWUwSVN0aldiRkRF?=
 =?utf-8?B?VkcrMzlvUHVKM3lJZEkwZk5yNUZra1BKOHVCU3JObDRoMFFMQ2t6NEN6cUVW?=
 =?utf-8?B?dDZOa050YkNObFluUXROWmpONytPT1dsZ3RFK0Y4L3BNWjJwWC9VZ0s5N0Ez?=
 =?utf-8?B?bkVkRDEvaWNyV2Mwd2NqTUEvd1ZoTWxqa1ZXWmJQMFdULytrSjVXS3RrL1F4?=
 =?utf-8?B?aDd5OEg3MkZURDdTcTZRelFMQnE3V25WZmFMVHIwZlk4dTY0RVUrOHJ3QlFw?=
 =?utf-8?B?dUhJOWYyYXhTWHRLTmRZTkRRdDRHVHg0bTdrTmhJc0Zrby9ZL2hVQ2hiNkhl?=
 =?utf-8?B?NThzb2tha0tPbFNIbDlyMDhqSW51UEY5bEo1b2w3TlR5OHpNZ2lUM1JaUjRp?=
 =?utf-8?B?OGtGN3VSbGs1UkJCVWMvUS9NNVRTUys4WFRIS3BMajhudGRQOXNUbHhvZXl0?=
 =?utf-8?B?UGR2YmYvdW1qZkI5YXJmbi92VGhyd29ZZGNpaFVRVWEwQjZsYXhrSUJnck5Q?=
 =?utf-8?B?YnZCdWJwV0FXeitMcHc0ZVQyMFVzeVVqeUJFM0ZDQTFPTzdoSU1ZOFRYM3Rq?=
 =?utf-8?B?aEdqRU1BNFkrSlA5VVpjQVllR0phOGh5TU41eXVIOG5maXlpUDFuYzRyUFJn?=
 =?utf-8?B?RFJZSEdOcExMYjcxT3ExdUw4Vnp2NlBCRTdRYW5SWFgvVG94K3VMbzNpbkdK?=
 =?utf-8?B?UEhUY05reEdrUTNiUTJwUEZTQ0E3UHhVY3dSWjNQQ3YzZndlOGZucmozVkY1?=
 =?utf-8?B?aEp4UTl5SjJNYVNLanVsS1ViSnlBQ01KQ21La1JiMzRic3VBS1lBeHFUQWFX?=
 =?utf-8?B?SFQ2dk5TQ2FZZE44UUV0Z1VkU2RCbHFwdDhjTDNzUHpLclJISjNHZGVYNE1X?=
 =?utf-8?B?a0RlSnp2UnY0c0d4a0pHQ1JHT0dzaW95dVd1Z2ZYNUh4MGw2dHBNdHNEMU5h?=
 =?utf-8?B?OEU1dExCRzN1aUNPZUlzQWxyZ1BlWmlvVGN6TWRLVHZVZjFLUkZYR3c1MlVK?=
 =?utf-8?B?Q3NYTGF5VGM0VmFFMmJ4TkUzb3ZKZ2RrYmg1UnBjVStWZkhWSHFlTGFucENo?=
 =?utf-8?B?bnRBeGxXY2VmZFZRNU92RDQySTNjcm5Qbm9GZXdCWEpXN2tlT2tWMnNsUEdK?=
 =?utf-8?B?RllSM3VDbjQvMzhvakNmazY4NERUWmg4OFJ0dk16c1dSL3NybnJIUFdVUTZl?=
 =?utf-8?B?aHB3RzZsTDFHWk9UYStkUXRkb1hYNjh4SDV4ZDNNK0k4Q0gwUGRjbytUbHV0?=
 =?utf-8?B?bTlGaGxZWVlLcEcrSDJrT2ZBTFRRd2NySXpTZENDNHpzN0tyUXEzYmtOZWhC?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc4685a-f203-4de1-8ea1-08db13bc48e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 03:32:40.0281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jLKQIH9UWSGD+ag+C8ixZU5ef7BCzEmvJn4wSOni9WApvNDX08YdTS2jx2wFQ3CS2NlvAafDNG9UZ9JHB9j5ZECnIS9/UhWPwxk90xWeh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5278
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

SGVsbG8gSmVyZW15LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpl
cmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gU2VudDogTW9uZGF5LCBGZWJy
dWFyeSAyMCwgMjAyMyA3OjI0IFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0
ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2Yg
S296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+IEplZmZlcnkgPGFuZHJld0Bhai5pZC5h
dT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4g
bGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IEFkZCBz
dXBwb3J0IGZvciBBU1BFRUQgaTJDdjINCj4gDQo+IEhpIFJ5YW4sDQo+IA0KPiA+ID4gPiArwqAg
Y2xvY2stZnJlcXVlbmN5Og0KPiA+ID4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiAr
wqDCoMKgwqDCoCBEZXNpcmVkIEkyQyBidXMgY2xvY2sgZnJlcXVlbmN5IGluIEh6LiBkZWZhdWx0
IDEwMGtoei4NCj4gPiA+ID4gKw0KPiA+ID4gPiArwqAgbXVsdGktbWFzdGVyOg0KPiA+ID4gPiAr
wqDCoMKgIHR5cGU6IGJvb2xlYW4NCj4gPiA+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjoNCj4gPiA+
ID4gK8KgwqDCoMKgwqAgc3RhdGVzIHRoYXQgdGhlcmUgaXMgYW5vdGhlciBtYXN0ZXIgYWN0aXZl
IG9uIHRoaXMgYnVzDQo+ID4gPg0KPiA+ID4gVGhlc2UgYXJlIGNvbW1vbiB0byBhbGwgaTJjIGNv
bnRyb2xsZXJzLCBidXQgSSBzZWUgdGhhdA0KPiA+ID4gaTJjLWNvbnRyb2xsZXIueWFtbCBkb2Vz
bid0IGluY2x1ZGUgdGhlbSAod2hpbGUgaTJjLnRleHQgZG9lcykuDQo+ID4gPg0KPiA+ID4gSSBh
c3N1bWUgd2UncmUgT0sgdG8gaW5jbHVkZSB0aGVzZSBpbiB0aGUgZGV2aWNlIGJpbmRpbmdzIGlu
IHRoZSBtZWFudGltZS4NCj4gPiA+IEJ1dCBpbiB0aGF0IGNhc2UsIHlvdSBtYXkgYWxzbyB3YW50
IHRvIGluY2x1ZGUgdGhlIGNvbW1vbiAic21idXMtYWxlcnQiDQo+ID4gPiBwcm9wZXJ0eSwgd2hp
Y2ggeW91IGNvbnN1bWUgaW4geW91ciBkcml2ZXIuDQo+ID4gPg0KPiA+IFNpbmNlIGkyYy50ZXh0
IGhhdmUgbXVsdGktbWFzdGVyLCBzbWJ1cy1hbGVydC4gSSBkb24ndCBuZWVkIHRob3NlIHR3byBy
aWdodD8NCj4gDQo+IERlcGVuZHMgd2hldGhlciB0aGUgbWFpbnRhaW5lcnMgY29uc2lkZXIgaTJj
LnRleHQgYXMgcGFydCBvZiB0aGUgc2NoZW1hLCBJDQo+IGZpZ3VyZS4gTWlnaHQgYmUgYmVzdCB0
byBnZXQgdGhlaXIgaW5wdXQgb24gdGhpcy4NCg0KDQpZZXMsIEkgd2lsbCBkcm9wIHRoaXMsIGFs
c28gaW50ZWdyYXRlIGludG8gYXNwZWVkLGkyYy55YW1sIGZpbGUuDQoNCj4gPiA+ID4gK8KgIHRp
bWVvdXQ6DQo+ID4gPiA+ICvCoMKgwqAgdHlwZTogYm9vbGVhbg0KPiA+ID4gPiArwqDCoMKgIGRl
c2NyaXB0aW9uOiBFbmFibGUgaTJjIGJ1cyB0aW1lb3V0IGZvciBtYXN0ZXIvc2xhdmUgKDM1bXMp
DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgIGJ5dGUtbW9kZToNCj4gPiA+ID4gK8KgwqDCoCB0eXBl
OiBib29sZWFuDQo+ID4gPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246IEZvcmNlIGkyYyBkcml2ZXIg
dXNlIGJ5dGUgbW9kZSB0cmFuc21pdA0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoCBidWZmLW1vZGU6
DQo+ID4gPiA+ICvCoMKgwqAgdHlwZTogYm9vbGVhbg0KPiA+ID4gPiArwqDCoMKgIGRlc2NyaXB0
aW9uOiBGb3JjZSBpMmMgZHJpdmVyIHVzZSBidWZmZXIgbW9kZSB0cmFuc21pdA0KPiA+ID4NCj4g
PiA+IFRoZXNlIHRocmVlIGFyZW4ndCByZWFsbHkgYSBwcm9wZXJ0eSBvZiB0aGUgaGFyZHdhcmUs
IG1vcmUgb2YgdGhlDQo+ID4gPiBpbnRlbmRlZCBkcml2ZXIgY29uZmlndXJhdGlvbi4gRG8gdGhl
eSByZWFsbHkgYmVsb25nIGluIHRoZSBEVD8NCj4gPiA+DQo+ID4gU29ycnksIEkgYW0gY29uZnVz
ZWQuDQo+ID4gVGhpcyBpcyBoYXJkd2FyZSBjb250cm9sbGVyIG1vZGUgc2V0dGluZyBmb3IgZWFj
aCBpMmMgdHJhbnNmZXIuDQo+ID4gU28gSSBhZGQgaXQgaW4gcHJvcGVydHkgZm9yIGNoYW5nZSBk
aWZmZXJlbnQgaTJjIHRyYW5zZmVyIG1vZGUuDQo+ID4gSXMgbXkgbWlzLXVuZGVyc3RhbmQgdGhl
IHByb3BlcnR5IHNldHRpbmc/DQo+IA0KPiBJdCBkZXBlbmRzIHdoYXQgdGhpcyBpcyBjb25maWd1
cmF0aW9uIGlzIGZvci4NCj4gDQo+IFdvdWxkIHlvdSBzZXQgdGhlIHRyYW5zZmVyIG1vZGUgYmFz
ZWQgb24gdGhlIGRlc2lnbiBvZiB0aGUgYm9hcmQ/IElzIHRoZXJlDQo+IHNvbWV0aGluZyBhYm91
dCB0aGUgcGh5c2ljYWwgaTJjIGJ1cyB3aXJpbmcgKG9yIHNvbWUgb3RoZXIgaGFyZHdhcmUgZGVz
aWduDQo+IGNob2ljZSkgdGhhdCB3b3VsZCBtZWFuIHlvdSB1c2Ugb25lIHNldHRpbmcgb3ZlciBh
bm90aGVyPw0KPiANCk5vLCBpdCBub3QgZGVwZW5kIG9uIGJvYXJkIGRlc2lnbi4gSXQgaXMgb25s
eSBmb3IgcmVnaXN0ZXIgY29udHJvbCBmb3IgY29udHJvbGxlciB0cmFuc2ZlciBiZWhhdmUuDQpU
aGUgY29udHJvbGxlciBzdXBwb3J0IDMgZGlmZmVyZW50IHRyaWdnZXIgbW9kZSBmb3IgdHJhbnNm
ZXIuDQpCeXRlIG1vZGU6IGl0IG1lYW5zIHN0ZXAgYnkgc3RlcCB0byBpc3N1ZSB0cmFuc2Zlci4N
CkV4YW1wbGUgaTJjIHJlYWQsIGVhY2ggc3RlcCB3aWxsIGlzc3VlIGludGVycnVwdCB0aGVuIGRy
aXZlciBuZWVkIHRyaWdnZXIgZm9yIG5leHQgc3RlcC4NClNyIChzdGFydCByZWFkKSB8IEQgfCBE
IHwgRCB8IFANCkJ1ZmZlciBtb2RlOiBpdCBtZWFucywgdGhlIGRhdGEgY2FuIHByZXBhcmUgaW50
byBidWZmZXIgcmVnaXN0ZXIsIHRoZW4gVHJpZ2dlciB0cmFuc2Zlci4gU28gU3IgRCBEIEQgUCwg
b25seSBoYXZlIG9ubHkgMSBpbnRlcnJ1cHQgaGFuZGxpbmcuIA0KVGhlIERNQSBtb2RlIG1vc3Qg
bGlrZSB3aXRoIGJ1ZmZlciBtb2RlLCBUaGUgZGlmZmVyIGlzIGRhdGEgcHJlcGFyZSBpbiBEUkFN
LCB0aGFuIHRyaWdnZXIgdHJhbnNmZXIuIA0KDQoNCj4gT24gdGhlIG90aGVyIGhhbmQsIGlmIGl0
J3MganVzdCBiZWNhdXNlIG9mIE9TIGJlaGF2aW91ciwgdGhlbiB0aGlzIGRvZXNuJ3QgYmVsb25n
DQo+IGluIHRoZSBEVC4NCj4gDQo+IE1heWJlIHRvIGhlbHAgdXMgdW5kZXJzdGFuZDogd2h5IHdv
dWxkIHlvdSBldmVyICpub3QqIHdhbnQgRE1BIG1vZGU/DQo+IElzbid0IHRoYXQgYWx3YXlzIHBy
ZWZlcmFibGU/DQpJbiBBU1QgU09DIGkyYyBkZXNpZ24gaXMgMTYgaTJjIGJ1cyBzaGFyZSBvbmUg
ZG1hIGVuZ2luZS4gDQpJdCBjYW4gYmUgc3dpdGNoIHNldHRpbmcgYnkgZHRzIHNldHRpbmcuIE90
aGVyd2lzZSBkcml2ZXIgYnkgZGVmYXVsdCBwcm9iZSBpcyBETUEgbW9kZS4NCg0KUnlhbg0K
