Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE88469D8B6
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 03:44:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLNsb3znbz3c6s
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 13:44:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FNwTqSQA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::71b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FNwTqSQA;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLNrq4Bjzz3bVK;
	Tue, 21 Feb 2023 13:43:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrqodP9cRLc0D3icBSzEn6/Ko+S5tw2mMkO4GXPu2SWOBP5H1sezgWp74C5FkGUPuye7MuH9CLvR5iCA3aQVNOK+7YTef4EgrkB6EiuK0sz3mzv6X06ezlZ1V4Aifwi4SFC9efvMRTIqqCSY1dlJrpf47cmR0fe63bvY1YbrbHTdyzYKEXX1xOp/a1IH/anLoDZgEuLdvJSgab5uVv2RVv9Je0xTdYZ6KYQKCzs4WsXlHLhCkzeom6SyPwh0YNxos7XD+tlLKPvzRTFUSbTC0TzP6p5U3WcWXtE7/fj3KO0QLqurTnC5sQC/OlbyAphNwzdIdQ6srT1xCUipGHwQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTDbuKA4uEHGkEQxoBNH3NHEQFO9LgF2iX3EzXCCMUQ=;
 b=ex5yeOKGe5Gh5t+1NE/LtKeUSp9uzMqeUJLD8sOGtzOGZwJ5r02Lg0635zUxRi9QEeIcR6kRcab7dfoQld+W/dtNDGUYhTdUoqxZWKRyv/VdtnlUOldWixF3Nmz2KU33bTnAb8s+uTvlU3cYlRneNdMVPw0UiChIqsQ4oHPmXvBn4e7vRbSp6S2iBsMyasXEXbenqZlwIhniOTQ1BeuPTewtEqn3M/dY1WmR0Y7OaiKEoAN1WBftzZo6OqMacmromyLTBYIyQ33MOIBwkV/lhMKpbOh96hI3iE3DhXxe2Rkc0elAZbegaLh6PunA0ukOpYYlfTjsO/F0DAOGeyD/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTDbuKA4uEHGkEQxoBNH3NHEQFO9LgF2iX3EzXCCMUQ=;
 b=FNwTqSQApEBd2F3WIJLLb6aGPsSjlchVrMngxr6icFMC3SMPY916/VRbmAFO9b1/q2GDeGVju6xT2Oimh7erZfuvn8AcUE3yl0dvSg5o8IJc2M+Rn31fdz360I3F3nFeuB/gBsIyrBl8+dOXuuJp3qXf/pbIgzAHqzjrevCUXvZmSK6WJOecaEGmILlseKjpSkaG1ed7PvrOXv4ClQBFGkFmc8lPO/QyOTIsL0GtcTCVD+v0wIPe0GKJcZhdeo1q/LUSr2iMy1l3ZxlrMvjgoE8Ui4yUsUc4U8+bmrYY/g7NQGKJKo4ri1N0UQEXYWiJVysgvHquYeI6ZMvtFODfdQ==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by SEZPR06MB6060.apcprd06.prod.outlook.com (2603:1096:101:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Tue, 21 Feb
 2023 02:43:13 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Tue, 21 Feb 2023
 02:43:12 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Index: AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7Xgo8AgAEkZWA=
Date: Tue, 21 Feb 2023 02:43:12 +0000
Message-ID:  <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
In-Reply-To: <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|SEZPR06MB6060:EE_
x-ms-office365-filtering-correlation-id: a0da04d8-000c-4249-2920-08db13b56025
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /uNqtQXDBytkjsO15a8sdz/Iw0Kxq2wT/je1sypevCyjkUjMYX8LckEcDq5mPX5b0suLPrzGFVuJkKZJ5wVcxtDYCrdgK4Jlp2RCTABa5F4Bs1Qxz087r0N5e9T7OASRb+vUZz8weuPqM0DpJGV9DFrH6V/n+12aeqGwvXJzHJQ+l2ck/K3/uTkxaPLjWCTqJdbY/zlhOH8fVYD+Xn8B5P+RyiJdNXgr897dPJT9izaF3V/iCO2gbf4tB3YL6IxNvHVXtOp7AnTZNFxv9pZHdBmu/iAmF9JR1sxXqH0TBcS3EpmPKCa9r/FseyoS6TKY1ctgSNwElqM5rvP6pKxSQ632CSvbhD4Tr154ctRd58yL0r2wdB6Gb2Xc+aNp8+ajawzkY56132k3fxwF05q+Azxj92mgEu4YaZJ/ZqxuZWJuB3/PGWGzjZ6wmrvBb2f6JL4putu1VgWRIQhpTxazVIpZleqIxlpO7nfmyLht+7HFUrPenOvI6NCV+MthU01EMDli8D7y/cm3T/yTkUhij1AQQWd7exq8zwP5LWD21Im9qCHfl2S8bmpvMJSft0NlGlBoIsVK9hSeu3weX/aapFLTCT3Wu5AG/TuGUl48LvCDYyrzZ1l+vLRPConwq5IUnav74deZqW+mXKvIIOjcg41zodcwNLrolPL5wLcJo07Uo1Ae3K9l8CMNTmUG9c9SzPxPEfpCz2YDg3vB0fU+BiovmziyWGdSxcNBwBl7kMXJBpqXPbCh2xupPpAJeAfO
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199018)(53546011)(921005)(7696005)(26005)(71200400001)(186003)(6506007)(966005)(5660300002)(478600001)(86362001)(38100700002)(9686003)(38070700005)(64756008)(122000001)(33656002)(66446008)(83380400001)(52536014)(55016003)(110136005)(2906002)(76116006)(8936002)(66556008)(7416002)(66946007)(41300700001)(66476007)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Sy9YT0YybnhodERCdjBVNFhpaVNkQXVBSXkvcmNYTktCdFNhMzRuWVMxdnA0?=
 =?utf-8?B?SnlpYWhKTldCUjVsWVd5eFVnejVkWHY1OGZTTXpKQ285MEgzRWppamRybGNQ?=
 =?utf-8?B?N2FvclhFK25iaHdMejdPZVhQMXZoYjMwbDMrcTgvUWJJcy9aK0ZxOUE4OEI2?=
 =?utf-8?B?eGNuaXI3MWplZCtkRU1yeThoN0JRZ0Y2cVozN0RYOHlmQzBOaW9vL1Z4d3po?=
 =?utf-8?B?YzZMZFlkVmJHV1B3aGJUUlQ0UitQUk5YM2djQWZKcm53SEFYTkdUeTlBVll4?=
 =?utf-8?B?cm9ZN1I5M0xzZlh2ZUNQMVg2d1grd0pSMy81M2JSbDdhK1ZNeDFWTjN0S3Zl?=
 =?utf-8?B?bWllb2poMmdUNkszS2xnZHNNMnFtQnBqaEI5cmdWd3AxSE9qWTZtM3Vrdnpm?=
 =?utf-8?B?TU5uQUhwanYvZ1NMenN6RFlDTEpwaFRmMnhDY2xpVjNvd1BaU0FYbE9OSkhK?=
 =?utf-8?B?VkwrbHh5T29mUWtFcloxT2lBSC93Um1pM1VOL0NTamEwKzFsaVJKb2UxQ0tH?=
 =?utf-8?B?ZHhsNVpscU1Fd0ZtcFlaQVNiME9RTXJmeHhrakoyTWFtOHhrVGlrclZDVDFV?=
 =?utf-8?B?ZzZDT2NCRTYya1hWU1dUWHVvUm43dTBnbTh4MkMvN3kydXZ1dFdUSTI5SFd4?=
 =?utf-8?B?NkorOUlTV3FhVyt6eXBWQW1kdFpCVmVDSlpyKzg3V2lObC9ZeE1KMWZlM1hu?=
 =?utf-8?B?TkJyR3FKYm0reWJWelNHNE5nZ0xpQ3FsT2ROQ29mTXpXTE9iekIxVzhVS2Fp?=
 =?utf-8?B?aGQ0OHMxdUVXVlJXdXc2a090Z1NTNjUrOTRpN0Fsck92ZHFOQ0NlWExYZkM5?=
 =?utf-8?B?dEZESzByV3QvdnZIV1VYUFpNa3ZST3NVdHM1Wm9EWEJSKzcxVXE4SmxEbXdx?=
 =?utf-8?B?ei82blRqOHhWUU5OdDFtZ0lFdlE3TWFlZG9ib1lkTzhMT1dzOXNGdlBuYnUz?=
 =?utf-8?B?SW1KUEx6YUUyUkc3WTk2RjM4ZGhDN1J2RXYydFRBYW5ubkVqK3c4c0RhK21x?=
 =?utf-8?B?YUFsWnBVZlgrdWk4QWtFSndkUmgxTEVHNzduUnhLajNKYUQ3WFNUZU94ZzlG?=
 =?utf-8?B?dXFxZ0FJZTBxNzBqN2k4WmVkRitYUE00NlNyWFVHeVkxbkU4K29Jd3VJYlMy?=
 =?utf-8?B?cWgyYzdDclg0eUdpRTI3M3A0Z2o0bWFhYlVXditaNjV1ZHo3Q1N0emk5ZkZ5?=
 =?utf-8?B?VUN5UFZNdkI0MGpHbkNsNlRYTWhVbERCTlQyZlBzMTZ3cCt1MGVhaG1hRWZC?=
 =?utf-8?B?dFlzTzNRUCtERmhvY0VGUC9sblVEMFNQTzlhb3RPeDAwZ0YrczFUWkJFR0Y5?=
 =?utf-8?B?Z1FCekxDVW1ZdVVTclFJQnZMZHVxMHJFYnRoVXpXN1h1NUxVb3ljeWsxamk0?=
 =?utf-8?B?NkdnOTQ4ZkdXUFIwZDdoWHJ6OTZHQUtGQzZ6c1Nodk9vdTJLMGNHVVlDNHJr?=
 =?utf-8?B?NU9WZUMrVkhEVEppQkU0dENIcWl0ZXRXWjE1elFtRm41Y0pQN2dsc2IrVERH?=
 =?utf-8?B?YzNyU0tmK2E0VTMxSWduRHEyT3VaYnk3ZmN2QllPaG1KeU1yNFAvMTFyNXFm?=
 =?utf-8?B?cWFXbmVQb25aNUhJVGlWUmhJRmpjaGdTNUlPL29hRllaOWxhQUtkTTUvQllG?=
 =?utf-8?B?WGNqbU4yUXh0NW1OUEoyUWd4TWJ4cWVGekNid3E3NGNTRnZvUjF3VWpoNUIr?=
 =?utf-8?B?c1FvdGRrL0xSK2ZHb0FXOFoxbEJaOU10NHRoTmJJWlVwaDU3ME9MT0p1TXBH?=
 =?utf-8?B?UGNmK0NYNncybUdHNUFYN0Jqd0dobHZUQnhkYzd4UCtBdkJKSCtnWjBUU1lD?=
 =?utf-8?B?QWEwb2ROVUxGZHdjUHlnL0lyK2pNM0h4MWhCVGxlWGljNnVLNnk4MGNWeEJQ?=
 =?utf-8?B?a3hLeFVobzYvZVAwQ0FZUmZhNm5hTDJMcGg4OG5FbHAvN3JTRXFzTWppMFpp?=
 =?utf-8?B?ZW9CQUtXeU8yOTJ6ZjNnVThuUnMrWWszdnl6OFdrRmxSdWxsWGh6emxuUjhj?=
 =?utf-8?B?ODB5SVI1dEY2UDhYTnQ4TU94eXlQeVR3ampHc3BRVlF4MkNsY3lKd2U1Q2Mw?=
 =?utf-8?B?Skd5Q2FROXQveHYrTU1ZMDRGMmlVN1pEYTd2VWRPcHNsRm1mbEtBZ29sZmRI?=
 =?utf-8?B?ZUZOalV1UW9FYVRNTDlqekZsZGRyWHkvNE5rY0MvdmVvVEh1b3pjVXJpbnRN?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0da04d8-000c-4249-2920-08db13b56025
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 02:43:12.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWV6AX5NXx6QHm8CR0xRaiPosiiahroN45zLrxq5D8Q8stgtSXOYKnsXnQ0JYiYY2Uvlc6eSjhg0WHrW2AokFcFI1yeKgwrTK/Mi0u0l9O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6060
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogTW9uZGF5LCBGZWJydWFyeSAyMCwgMjAyMyA0OjM1IFBNDQo+IFRvOiBSeWFuIENoZW4g
PHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxp
bmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+IEplZmZl
cnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzJdIGR0LWJp
bmRpbmdzOiBpMmM6IEFkZCBzdXBwb3J0IGZvciBBU1BFRUQgaTJDdjINCj4gDQo+IE9uIDIwLzAy
LzIwMjMgMDc6MTcsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBBU1QyNjAwIHN1cHBvcnQgbmV3IHJl
Z2lzdGVyIHNldCBmb3IgSTJDdjIgY29udHJvbGxlciwgYWRkIGJpbmRpbmdzDQo+ID4gZG9jdW1l
bnQgdG8gc3VwcG9ydCBkcml2ZXIgb2YgaTJjdjIgbmV3IHJlZ2lzdGVyIG1vZGUgY29udHJvbGxl
ci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRl
Y2guY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVk
LGkyY3YyLnlhbWwgfCA4Mw0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDgzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjdjIueWFtbA0KPiAN
Cj4gTmV3IGNvbXBhdGlibGUgaXMgb2theSwgYnV0IGFzIHRoaXMgaXMgdGhlIHNhbWUgY29udHJv
bGxlciBhcyBvbGQgb25lLCB0aGlzDQo+IHNob3VsZCBnbyB0byBvbGQgYmluZGluZy4NCj4gDQo+
IFRoZXJlIGFyZSBzZXZlcmFsIGlzc3VlcyBhbnl3YXkgaGVyZSwgYnV0IEkgd29uJ3QgcmV2aWV3
aW5nIGl0IGV4Y2VwdCBmZXcNCj4gb2J2aW91cyBjYXNlcy4NCj4gDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjdjIu
eWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQs
aTJjdjIueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi45MTNmYjQ1ZDVmYmUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjdjIueWFtbA0KPiA+IEBAIC0w
LDAgKzEsODMgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvYXNwZWVkLGkyY3YyLnlhbWwjDQo+ID4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsN
Cj4gPiArdGl0bGU6IEFTUEVFRCBJMkN2MiBDb250cm9sbGVyIG9uIHRoZSBBU1QyNlhYIFNvQ3MN
Cj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gUnlhbiBDaGVuIDxyeWFuX2NoZW5A
YXNwZWVkdGVjaC5jb20+DQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IC9zY2hl
bWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1sIw0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4g
PiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBhc3BlZWQsYXN0
MjYwMC1pMmN2Mg0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+
ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGFkZHJlc3Mgb2Zmc2V0IGFu
ZCByYW5nZSBvZiByZWdpc3Rlcg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBhZGRyZXNzIG9m
ZnNldCBhbmQgcmFuZ2Ugb2YgYnVmZmVyIHJlZ2lzdGVyDQo+IA0KPiBXaHkgdGhpcyBpcyBvcHRp
b25hbD8NCg0KV2lsbCBtb2RpZnkgbWluSXRlbXM6IDEgdG8gMg0KPiANCj4gPiArDQo+ID4gKyAg
aW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoN
Cj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAg
UmVmZXJlbmNlIGNsb2NrIGZvciB0aGUgSTJDIGJ1cw0KPiA+ICsNCj4gPiArICByZXNldHM6DQo+
ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9jay1mcmVxdWVuY3k6DQo+ID4g
KyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgRGVzaXJlZCBJMkMgYnVzIGNsb2NrIGZyZXF1
ZW5jeSBpbiBIei4gZGVmYXVsdCAxMDBraHouDQo+ID4gKw0KPiA+ICsgIG11bHRpLW1hc3RlcjoN
Cj4gPiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAg
ICBzdGF0ZXMgdGhhdCB0aGVyZSBpcyBhbm90aGVyIG1hc3RlciBhY3RpdmUgb24gdGhpcyBidXMN
Cj4gDQo+IERyb3AgZGVzY3JpcHRpb24gYW5kIHR5cGUuIEp1c3QgOnRydWUuDQo+IA0KU2luY2Ug
aTJjLnR4dCBoYXZlIG11bHRpLW1hc3RlciB3aWxsIGRyb3AgaXQuDQo+ID4gKw0KPiA+ICsgIHRp
bWVvdXQ6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogRW5h
YmxlIGkyYyBidXMgdGltZW91dCBmb3IgbWFzdGVyL3NsYXZlICgzNW1zKQ0KPiANCj4gV2h5IHRo
aXMgaXMgcHJvcGVydHkgZm9yIERUPyBJdCdzIGZvciBzdXJlIG5vdCBib29sLCBidXQgcHJvcGVy
IHR5cGUgY29taW5nIGZyb20NCj4gdW5pdHMuDQpUaGlzIGlzIGkyYyBjb250cm9sbGVyIGZlYXR1
cmUgZm9yIGVuYWJsZSBzbGF2ZSBtb2RlIGluYWN0aXZlIHRpbWVvdXQgYW5kDQphbHNvIG1hc3Rl
ciBtb2RlIHNkYS9zY2wgYXV0byByZWxlYXNlIHRpbWVvdXQuIA0KU28gSSB3aWxsIG1vZGlmeSB0
byANCiAgYXNwZWVkLHRpbWVvdXQ6DQoJdHlwZTogYm9vbGVhbg0KICAgIGRlc2NyaXB0aW9uOiBJ
MkMgYnVzIHRpbWVvdXQgZW5hYmxlIGZvciBtYXN0ZXIvc2xhdmUgbW9kZSANCg0KPiA+ICsNCj4g
PiArICBieXRlLW1vZGU6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBkZXNjcmlw
dGlvbjogRm9yY2UgaTJjIGRyaXZlciB1c2UgYnl0ZSBtb2RlIHRyYW5zbWl0DQo+IA0KPiBEcm9w
LCBub3QgYSBEVCBwcm9wZXJ0eS4NCj4gDQo+ID4gKw0KPiA+ICsgIGJ1ZmYtbW9kZToNCj4gPiAr
ICAgIHR5cGU6IGJvb2xlYW4NCj4gPiArICAgIGRlc2NyaXB0aW9uOiBGb3JjZSBpMmMgZHJpdmVy
IHVzZSBidWZmZXIgbW9kZSB0cmFuc21pdA0KPiANCj4gRHJvcCwgbm90IGEgRFQgcHJvcGVydHku
DQo+IA0KVGhlIGNvbnRyb2xsZXIgc3VwcG9ydCAzIGRpZmZlcmVudCBmb3IgdHJhbnNmZXIuDQpC
eXRlIG1vZGU6IGl0IG1lYW5zIHN0ZXAgYnkgc3RlcCB0byBpc3N1ZSB0cmFuc2Zlci4NCkV4YW1w
bGUgaTJjIHJlYWQsIGVhY2ggc3RlcCB3aWxsIGlzc3VlIGludGVycnVwdCB0aGVuIGVuYWJsZSBu
ZXh0IHN0ZXAuDQpTciAoc3RhcnQgcmVhZCkgfCBEIHwgRCB8IEQgfCBQDQpCdWZmZXIgbW9kZTog
aXQgbWVhbnMsIHRoZSBkYXRhIGNhbiBwcmVwYXJlIGludG8gYnVmZmVyIHJlZ2lzdGVyLCB0aGVu
DQpUcmlnZ2VyIHRyYW5zZmVyLiBTbyBTciBEIEQgRCBQLCBvbmx5IGhhdmUgb25seSAxIGludGVy
cnVwdCBoYW5kbGluZy4gDQpUaGUgRE1BIG1vZGUgbW9zdCBsaWtlIHdpdGggYnVmZmVyIG1vZGUs
IA0KVGhlIGRpZmZlciBpcyBkYXRhIHByZXBhcmUgaW4gRFJBTSwgdGhhbiB0cmlnZ2VyIHRyYW5z
ZmVyLiANCg0KU28sIHNob3VsZCBJIG1vZGlmeSB0bw0KICBhc3BlZWQsYnl0ZToNCgl0eXBlOiBi
b29sZWFuDQogICAgZGVzY3JpcHRpb246IEVuYWJsZSBpMmMgY29udHJvbGxlciB0cmFuc2ZlciB3
aXRoIGJ5dGUgbW9kZQ0KDQogIGFzcGVlZCxidWZmOg0KCXR5cGU6IGJvb2xlYW4NCiAgICBkZXNj
cmlwdGlvbjogRW5hYmxlIGkyYyBjb250cm9sbGVyIHRyYW5zZmVyIHdpdGggYnVmZiBtb2RlDQoN
Cj4gPiArDQo+ID4gKyAgYXNwZWVkLGdyOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSBwaGFu
ZGxlIG9mIGkyYyBnbG9iYWwgcmVnaXN0ZXIgbm9kZS4NCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0K
PiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+
ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIHJlc2V0cw0KPiA+ICsgIC0gYXNwZWVkLGdyDQo+ID4g
Kw0KPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxl
czoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xv
Y2svYXN0MjYwMC1jbG9jay5oPg0KPiA+ICsgICAgaTJjOiBpMmMtYnVzQDgwIHsNCj4gDQo+IFlv
dSBkaWQgbm90IHRlc3QgdGhlIGJpbmRpbmdzLi4uIFRoaXMgaXMgaTJjLg0KPiANCkkgZG8gdXNl
IGNvbW1hbmQgOiBtYWtlIGR0X2JpbmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyY3YyLnlhbWwgDQpUbyB0ZXN0
IGl0LiBpcyBpdCBub3QgY29ycmVjdCBtZXRob2Q/DQpJIHdpbGwgbW9kaWZ5ICJpMmM6IGkyYy1i
dXNAODAiIC0+ICJpMmMwOiBpMmNAODAiDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQoNCg==
