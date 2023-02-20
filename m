Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D369C7F9
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 10:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKyPB6Fxkz3c8V
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 20:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Gol1T006;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::729; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Gol1T006;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20729.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKyNR6yqFz3c6R;
	Mon, 20 Feb 2023 20:51:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0knXgTyNdZvE2mMwTtacvHQRb9/bqfrhiHxlZLX/DEZsezomdWNsRwD+g3oanXiy3aj683Cym/rqkfxL3mOlH6AyMhdbPswWGkXVPiYuGyozg79NUpv6fq3xpFY0UHEgpk9D5ZwpyNlNm56GzvEjqr3XJhaHSFMUbA+iaLYemzSVfsZhIAM8macwrX9l8aDsPlp+ksQxRCGC9u43vsCRf40i+F5hVtmP3ogRxTExNRA/g/v//Z+xKpaFNIPNinV872YbNrwoNQn1ATcyzpF2UsG16d0kFFcA6VApwQx6EffBIuupJqKbDoH9wMlpxsF8nODQy+X7DmDxF3cm9yRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GOZ8a4cyjF3x9aT9PvZG9YrdRU5ruWapuDXwwSVLL0=;
 b=YyrNGrwrljPTgbzJ8nfpVOeyeTjVOE8p4RsCep5nB26wzr9oQ/TDJX1l9V00BlOHVyM7EpmwG2xish6xIF+bT1RFpxG8rNQMSmZCaDpxUVT5Wfv16yI6CUlluRxIyPHjnIchF0Dz9fazjpsxODAh6qkUGVgXxzPQ+GFnFKZgP2B1LtySJ47fbBsytyq50LjVfjuhR9Biyvw/4wqb7EZBIJxwLomHZoFIuLz86SPnOUafC3WDLaWmdBa6/YkRJxwZNAdGKfetbAGurAtjXP7TNMru+8qfGmCZV41mnRfdYRwImIy0bDURIj9JPincKgGJbUnt6miaBRTDfBshaFuWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GOZ8a4cyjF3x9aT9PvZG9YrdRU5ruWapuDXwwSVLL0=;
 b=Gol1T006UYnu3wIZU71RCGEkPGxWyQ0swzUmAE5gE0HEkSSIGcBP66JW+Lo05rtxmkZgaVQVy4gVEDLASOdVqGPLFOGryUmS9Swes6IBu+womoPKcs4b1p1S3MzsMyfDwg92krGENq5WLcnj1H0CXH7yHGY5DCth8gH67suBI4p9QvoqZ43T+cPCPb0+yyX8O/0l5mxYTph571RUDKpmHV92jCE7AlmnX2K0uIl5dAvqwIYj2GX/cYZGxf323FbNBhcbEebHAFfGqryXbQok06x5etnXpJclvsQ4VgZTIMeNbuQ6tgE8Uqd0TqhgD8C6dNcXZC2jIWaedAH9yR8+vQ==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by KL1PR0601MB4132.apcprd06.prod.outlook.com (2603:1096:820:2c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.16; Mon, 20 Feb
 2023 09:50:40 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Mon, 20 Feb 2023
 09:50:40 +0000
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
Thread-Index: AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7XgM2AgAAUk5A=
Date: Mon, 20 Feb 2023 09:50:39 +0000
Message-ID:  <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
	 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
In-Reply-To:  <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|KL1PR0601MB4132:EE_
x-ms-office365-filtering-correlation-id: 99947fff-788c-46b9-f6c0-08db1327eca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jSf582m5q98i8prbkQoGT8r7fXlJMMniRydQP7hrRMkzIvpbFCkao9m44PPfX1tzfAGv+pZf2mgCnl5UEO0djgl4rv/yHq1AfHcQzygqVbQWOdcvS8gLaA6Qbil/ydh2B2Vpn/ZIwzzaaBrgbAFL5bGpUiAmx6qcFC6Qk/mWkB+RNwoxcC0mYCo5c6jjmXlwVlvlp2qRaBBEmydqTb/+Fhf3arBfAz2mxUHOyTSEAaeoYbitTVL1blLR7rM4KDJMLWNxPqpybmrzOc1nVW/5HAbgVx/rW9mzXfBLiO/KT4f09yrR/w9EtCQi4ldKBKL1O+12i+tSl+VlRdpUYlw0ay3jF5D6QH6X1rPeJH7rJw1ZLTc9WeEm0Rs+T5pFaaEcp//DQzrjlVOG3XxxO0ZWeX01GiU4Hn3lM4DprXmorPb/QdcMEqAMRdYWUMvwTw9yTufiFgr5DwnBEyyuUh8k34+gMPInrNO6yBQs77nqyun/RrUNpY4M4ux+paLgYQMuPFXxChRFZzzriULO11gCuo91mX3zKA2D7A3/fMtYFn4D9rhEqYCMPpMoRxkmh5DGyVmWRWpSXDP6DBVH+HAluJl/xiXGkuN5yBrHzqC1RYq+RkfbSqiH0Yj6jmRv7NVKT8PJ5rNEZ6fYKULtTGSp18kzRUq25uMnND9Aw57YUsSHufniOqD7nHn5V6BN+2aUIA14RgAw8oqDNIDkshhg2Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(376002)(136003)(346002)(366004)(396003)(451199018)(110136005)(55016003)(71200400001)(9686003)(6506007)(53546011)(186003)(26005)(7696005)(966005)(478600001)(52536014)(8936002)(7416002)(921005)(38070700005)(2906002)(38100700002)(316002)(5660300002)(41300700001)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(122000001)(8676002)(83380400001)(86362001)(84970400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aURBVFBDWmJVdHVPUXNxNFlBRGVoRDRHbm15WWtsNnM2QWZXUEE3dXNYbHN4?=
 =?utf-8?B?TmlMQmE4VUFIY0kvVjVtZElhK2RHZXZqVmxyT2QzYVNaYnMrNGRIVTBJVXBR?=
 =?utf-8?B?dzVvUlVrTDYzRHo5SmtCcmpRZHhIWGw4aE9oZzFCNXU5WXhuRjlxcm1oN1hq?=
 =?utf-8?B?V2QyYW80UnJoOFMvTUdUOFdkSmZkRzdycWdhMitzVHRWTFFFOHQrNUZlVWpi?=
 =?utf-8?B?d1VjV1daTFNkbS96OEYxMUt2bmpkS2hwbTJlcUt4WCs4TzBLbDN6cHdRbDBN?=
 =?utf-8?B?U1VTRWhqSDg3YkVQK09GYTJDRU8vYUJBbFRFNFJoS0I1MU5ubWgyRDU1WVBY?=
 =?utf-8?B?TW9qc1BkMXlndEJLdkNheis4ODZNWWgwZFM2U1NHenBiNlF0azBDR244VW4z?=
 =?utf-8?B?SFNmRVpEcldURVE0T29uUnd0a1FZbXFGUFBtZVFTTVVVTHRaTFdyejd1WG45?=
 =?utf-8?B?dHE4R25QRUh0TTlJSW5DRjVRZ0t0NHdUSUhTRDl3Q21IekZSdlR0QkpFMmdB?=
 =?utf-8?B?RE5wcXpuZWx5MmhEcXdYS0NCeGg3bEFOQXZDeWt4bFFWZjQxeXRJMTBvVllu?=
 =?utf-8?B?dDl0TVlFa0s5VTQ1MmRpc0lCWGVqRHlENkgva3M2RE16UWIyS21Cenp5TGhO?=
 =?utf-8?B?ekF3L0FwSU5qb0N4eFMraytCYkVkVGtxazFFZkFETzVmR1lTMXJER05GRWMw?=
 =?utf-8?B?K0YvRjhZYVh4RytBUDNyZ0ZNQ0xJdHZtNE5xd2pSR1k5S1F4ZTVTRDZBaStO?=
 =?utf-8?B?NzRmWTJaSVRIYWtHYnlhWmtJaHlEejVURmNYam1Xb3pqRTRzOVRPTjU1T09G?=
 =?utf-8?B?NXFEWkI0Vy8xMzVqUGtWdUNhdmdTUFBBS1VuRXlTdnRPMWZqVUMwMitTM1Rv?=
 =?utf-8?B?aDd3RmF5VmZuSGlGYzE4VE9JMVJObWtkOXRTTXV6RHNTbURHWVpUV2J0Ykxt?=
 =?utf-8?B?RWxuMUp1Z2d0QzlXVFB1dFh4a0p6Tkw2RUVqckozMUFBUVptT2l2UE9RbjFy?=
 =?utf-8?B?ZCt1SGZ6RlFTU2tCNkhac1VMUElNck1FVWNQUXJ4Z2h4VTlKYy8wcTFpSUxz?=
 =?utf-8?B?dVhQRTIzNWZmNGhrT05WZDFQNFoyUTlhemNBUFdmTnQ1SVplRkwvNWIwVUFJ?=
 =?utf-8?B?TFVhZjBRdmwreXo3S3M4TURDaHZ2cEwzOWxtQklWSDRoYzFPdjVWTml5VmF2?=
 =?utf-8?B?elV4UmJqZTg2YTlrZ2J6Y29tYnA2THg0R1hwWUFpK2lTNllHMDMxZ0htcHNH?=
 =?utf-8?B?N3UyRExuUTEvYWp6OWZNTUFvMmR1dlh5YzFlTFk1SW5sNzF2UnpBZ296dmFM?=
 =?utf-8?B?eHhzc2VEY0FIV05qZjNldm9qUnArak9INnhZZ0xsTWU1eUV3aXlDQjRCNDdi?=
 =?utf-8?B?VStRdlFWOEhYUnB5QXNDbUtRRUpKWTBROTVLbzF0aDVJQU5NNFo2NGI5WWxq?=
 =?utf-8?B?aHFldjZpZENHZDJTZXp5KzRaSyszNDRoTUlVM0R6aHo4MHhyNmFMYkFEaUNT?=
 =?utf-8?B?b1pFYTJwbVdWMHNiM2NiUnlyMzlocCtLeXFGNkVKVkdoclY1Sm1NNzl0YW1y?=
 =?utf-8?B?N3VZbFB4aWdwQ2dhRW1QSGZMaVBrWEhCRWJlT3YxMmoyWFgxNVdRR3RVby9w?=
 =?utf-8?B?dWVMVGJrVDYxZmNKd3pQT3dJSXhPazU5cm90c0IrbUhHaSswTUFtQVhIUkFw?=
 =?utf-8?B?SUIxR3MrU1A1SVEvRnd1UTdGVGZZMGxhK1g5WmxFZk1GeUp0OEw0RHMyRXQx?=
 =?utf-8?B?RzhvTDNrZkF2c2hJVnBUVExYSFo5L2V4UitrdnZTTjlPRERJTkRPL1c2ZHkv?=
 =?utf-8?B?TnMyaG03NHZ1NnhmcUs4YVBzeHphV3ZsN0J5L1RMMUdGTDVFTGQxaDRvbGFz?=
 =?utf-8?B?bU8zNG5UbjRyVFBWc3U3RnQ2cFZNVXJ0bStySFlTODhrZG1HYXR6NGRxTDc3?=
 =?utf-8?B?WWZhQkU5RDRsMHB6STlCME9GSFk4bmkyNkxFQW5tL09BQUR4dTZRSE5UbHBG?=
 =?utf-8?B?Q2QwcWJ1VW1oY3I1VS9EdytwdHZqZUdBcnZ3L2NUY0FVclNxNzJheVNwUVN0?=
 =?utf-8?B?d2hlMGNZZWhQUDVFcndaVXJGVVpVckdTMmtuelFLTlBVaUxON1RXR21TZmVO?=
 =?utf-8?Q?YmtHqKTOrsGFGDsa3yS0jhsAo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99947fff-788c-46b9-f6c0-08db1327eca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 09:50:39.7115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPETxzkRehCLESm2JhTpiuhin3D9NAep3EVLCVIJ7EqgAcc+FJdaYJhSwWfYZ1N+EVLAtoW7Aa5T7lnC/nkffDxXW6uc2sD5K9UKHArbsoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4132
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

SGVsbG8gSmVyZW15LA0KCVRoYW5rcyB5b3VyIHJldmlldy4NCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEplcmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5h
dT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyMCwgMjAyMyA0OjI5IFBNDQo+IFRvOiBSeWFu
IENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0
QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tp
K2R0QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+
IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzJd
IGR0LWJpbmRpbmdzOiBpMmM6IEFkZCBzdXBwb3J0IGZvciBBU1BFRUQgaTJDdjINCj4gDQo+IEhp
IFJ5YW4sDQo+IA0KPiA+IEFTVDI2MDAgc3VwcG9ydCBuZXcgcmVnaXN0ZXIgc2V0IGZvciBJMkN2
MiBjb250cm9sbGVyLCBhZGQgYmluZGluZ3MNCj4gPiBkb2N1bWVudCB0byBzdXBwb3J0IGRyaXZl
ciBvZiBpMmN2MiBuZXcgcmVnaXN0ZXIgbW9kZSBjb250cm9sbGVyLg0KPiANCj4gU29tZSBjb21t
ZW50cyBpbmxpbmU6DQo+IA0KPiA+ICvCoCBjbG9jay1mcmVxdWVuY3k6DQo+ID4gK8KgwqDCoCBk
ZXNjcmlwdGlvbjoNCj4gPiArwqDCoMKgwqDCoCBEZXNpcmVkIEkyQyBidXMgY2xvY2sgZnJlcXVl
bmN5IGluIEh6LiBkZWZhdWx0IDEwMGtoei4NCj4gPiArDQo+ID4gK8KgIG11bHRpLW1hc3RlcjoN
Cj4gPiArwqDCoMKgIHR5cGU6IGJvb2xlYW4NCj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOg0KPiA+
ICvCoMKgwqDCoMKgIHN0YXRlcyB0aGF0IHRoZXJlIGlzIGFub3RoZXIgbWFzdGVyIGFjdGl2ZSBv
biB0aGlzIGJ1cw0KPiANCj4gVGhlc2UgYXJlIGNvbW1vbiB0byBhbGwgaTJjIGNvbnRyb2xsZXJz
LCBidXQgSSBzZWUgdGhhdCBpMmMtY29udHJvbGxlci55YW1sDQo+IGRvZXNuJ3QgaW5jbHVkZSB0
aGVtICh3aGlsZSBpMmMudGV4dCBkb2VzKS4NCj4gDQo+IEkgYXNzdW1lIHdlJ3JlIE9LIHRvIGlu
Y2x1ZGUgdGhlc2UgaW4gdGhlIGRldmljZSBiaW5kaW5ncyBpbiB0aGUgbWVhbnRpbWUuDQo+IEJ1
dCBpbiB0aGF0IGNhc2UsIHlvdSBtYXkgYWxzbyB3YW50IHRvIGluY2x1ZGUgdGhlIGNvbW1vbiAi
c21idXMtYWxlcnQiDQo+IHByb3BlcnR5LCB3aGljaCB5b3UgY29uc3VtZSBpbiB5b3VyIGRyaXZl
ci4NCj4gDQpTaW5jZSBpMmMudGV4dCBoYXZlIG11bHRpLW1hc3Rlciwgc21idXMtYWxlcnQuIEkg
ZG9uJ3QgbmVlZCB0aG9zZSB0d28gcmlnaHQ/DQoNCj4gPiArwqAgdGltZW91dDoNCj4gPiArwqDC
oMKgIHR5cGU6IGJvb2xlYW4NCj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOiBFbmFibGUgaTJjIGJ1
cyB0aW1lb3V0IGZvciBtYXN0ZXIvc2xhdmUgKDM1bXMpDQo+ID4gKw0KPiA+ICvCoCBieXRlLW1v
ZGU6DQo+ID4gK8KgwqDCoCB0eXBlOiBib29sZWFuDQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjog
Rm9yY2UgaTJjIGRyaXZlciB1c2UgYnl0ZSBtb2RlIHRyYW5zbWl0DQo+ID4gKw0KPiA+ICvCoCBi
dWZmLW1vZGU6DQo+ID4gK8KgwqDCoCB0eXBlOiBib29sZWFuDQo+ID4gK8KgwqDCoCBkZXNjcmlw
dGlvbjogRm9yY2UgaTJjIGRyaXZlciB1c2UgYnVmZmVyIG1vZGUgdHJhbnNtaXQNCj4gDQo+IFRo
ZXNlIHRocmVlIGFyZW4ndCByZWFsbHkgYSBwcm9wZXJ0eSBvZiB0aGUgaGFyZHdhcmUsIG1vcmUg
b2YgdGhlIGludGVuZGVkDQo+IGRyaXZlciBjb25maWd1cmF0aW9uLiBEbyB0aGV5IHJlYWxseSBi
ZWxvbmcgaW4gdGhlIERUPw0KPiANClNvcnJ5LCBJIGFtIGNvbmZ1c2VkLiANClRoaXMgaXMgaGFy
ZHdhcmUgY29udHJvbGxlciBtb2RlIHNldHRpbmcgZm9yIGVhY2ggaTJjIHRyYW5zZmVyLiANClNv
IEkgYWRkIGl0IGluIHByb3BlcnR5IGZvciBjaGFuZ2UgZGlmZmVyZW50IGkyYyB0cmFuc2ZlciBt
b2RlLg0KSXMgbXkgbWlzLXVuZGVyc3RhbmQgdGhlIHByb3BlcnR5IHNldHRpbmc/DQoNCj4gW2Fu
ZCBob3cgd291bGQgYSBEVCBhdXRob3Iga25vdyB3aGljaCBtb2RlcyB0byBjaG9vc2U/XQ0KPiAN
Cj4gPiArwqAgYXNwZWVkLGdyOg0KPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246IFRoZSBwaGFu
ZGxlIG9mIGkyYyBnbG9iYWwgcmVnaXN0ZXIgbm9kZS4NCj4gDQo+IFdlJ2xsIHByb2JhYmx5IHdh
bnQgdGhpcyB0byBiZSBjb25zaXN0ZW50IHdpdGggb3RoZXIgaW5zdGFuY2VzIG9mIGFzcGVlZCBn
bG9iYWwNCj4gcmVnaXN0ZXIgcmVmZXJlbmNlcy4gSSd2ZSB1c2VkICJhc3BlZWQsZ2xvYmFsLXJl
Z3MiIGluIHRoZSBwcm9wb3NlZCBpM2MgYmluZGluZzoNCj4gDQo+IA0KPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlL2NvdmVyLjE2NzY1MzIxNDYuZ2l0LmprQGNvZGVj
b25zdHJ1Yw0KPiB0LmNvbS5hdS9ULyNtZGEyZDAwNWY3N2NhMGM0ODFiMWYxZWRhZGI1OGZjMWIw
MDdhNWNjMw0KPiANCj4gSSdkIGFyZ3VlIHRoYXQgImdsb2JhbC1yZWdzIiBpcyBhIGxpdHRsZSBt
b3JlIGNsZWFyLCBidXQgSSdtIG9rYXkgd2l0aCBlaXRoZXIgd2F5IC0NCj4gdGhhdCBjaGFuZ2Ug
aGFzIGJlZW4gQWNrZWQgYnV0IG5vdCBiZWVuIG1lcmdlZCB5ZXQuDQo+IFdoaWNoZXZlciB3ZSBj
aG9vc2UgdGhvdWdoLCBpdCBzaG91bGQgYmUgY29uc2lzdGVudC4NCj4gDQpHb3QgaXQsIHdpbGwg
cmVuYW1lIHRvIGFzcGVlZCxnbG9iYWwtcmVncw0KDQpCZXN0IFJlZ2FyZHMsIA0KUnlhbg0K
