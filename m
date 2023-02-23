Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 227DB6A0057
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 01:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMZRX09kwz3c8G
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 11:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=x2k2JB8k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::722; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=x2k2JB8k;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20722.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMZQl517fz3bjd;
	Thu, 23 Feb 2023 11:58:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7X8+CCTBodF+m/7OzFQl5EkTpur2IeJURx0HPxw9NOCuTJbOrOy+kDnTfehRwY2zWNLfVhl55c5SYCgL+aSSMvW5uKZqSEiot8pRy2inZAftVzwvCXCX5DmKHApn+Ybl4WJPaNdVv3Plg58fWQCLwvZ5g4SO5CipQxGN/11nIY1k0mAGP+sogar8esQzZ7jxUGkIX8d6pXiO9JmfwTgrMPCsFtYkGAXjpL8kyFn8fCHuWdlPRNxsVUWxoYLS316Uskxqwa1xayZ7yYgY0frRflFqIv3DA8ZdO/aNqkVtsxYo9/JEXZanuFchvSQwzn7aNW2t7X7NyijR7wea4D3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PbP+Oj+hTN6YEnR63chlq+d0CMISxcu+eBkVO2K4Ss=;
 b=ly6COu2+ghDQ4Es7zjULyswHHqY16559to6IQOaqB2vUofPtyAAQAUST6o/wUMiqNir5usTQwKjoTtiL6kQIEBIChCziyh1onzxYmZyRonbfg8sBoZlplhtLbF8AQgFpfDDaunbl6xzRJHcEMTF11nyr4eq+cPt2j+tAxUfE94urP6cGDqUCd369ToutHNjQsnTI57dM66Qndqh0KSimLVX8HL5M/Jn7gMgZEdZUOLpzDBnI4yJgC5qBtVmXKC7MRPkq/SmF+fVymtpzdFC+e76Z0RkUCzSglFwFmAmn64Fnlf9jRoVxytbfa3Zn/0eHlWWmo/8wPlFVndbrGUfMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PbP+Oj+hTN6YEnR63chlq+d0CMISxcu+eBkVO2K4Ss=;
 b=x2k2JB8kWdkn/1s01gFmZE1T+vvhbFUtT2DZQgrLrT8FVyBl6SgIUaC1l/b33bX356bzC7th2olp8gf0k27t+h5A5yLLk8P04B3+YtPeQUNGIjuafTedd5bIxCrQRPyJQcl2R808S0+3PdmtakV3UTovvN8QmaMKbdgfhkY8SIuz4cvd4F011UpTUIk8raP36FoK+K1RNhUw8e92IWX3pOx5p0OL2TYVjJjBXgYKR0vOWPKnBuW6hU4eWTwsefHR76EHwsWl3dETnXqk5MJkfoRYl6oVdG70mYt0pM/kFXTS8AO55uE22j8bpSVXqV/SHhQZVS4l0vkTfwqqcKpf6Q==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5172.apcprd06.prod.outlook.com (2603:1096:4:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Thu, 23 Feb
 2023 00:58:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Thu, 23 Feb 2023
 00:58:14 +0000
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
Subject: RE: [PATCH v5 2/2] i2c: aspeed: support ast2600 i2cv2 new register
 mode driver
Thread-Topic: [PATCH v5 2/2] i2c: aspeed: support ast2600 i2cv2 new register
 mode driver
Thread-Index: AQHZRPMRywH1bqUtTEmyVqt5fP7yF67XhPmAgALHOPCAAFktAIABE1kg
Date: Thu, 23 Feb 2023 00:58:14 +0000
Message-ID:  <SEZPR06MB526909B8D4313CA5F33074C5F2AB9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-3-ryan_chen@aspeedtech.com>
 <63986fb1-f8d4-f348-bae9-72e08369213b@linaro.org>
 <SEZPR06MB5269B032022D3D7286E59D36F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <77480142-a2c0-f6da-af0e-d3f01f72ac53@linaro.org>
In-Reply-To: <77480142-a2c0-f6da-af0e-d3f01f72ac53@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB5172:EE_
x-ms-office365-filtering-correlation-id: f8cae16a-6272-4e5c-cd9d-08db15390b06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tfkQmNciLfPsfvJHTA38fwRMvF+m7UmbJ4XRol0m5un0HlpANoklwcJKILI3LWlwQx0I5zt2tVqomHKZweKSg10/ijBDYKWgqP+CPMOn23g75AHAtYxWPCMk3r96pubSHVxOZ0S8UV2jkcHiGPIvNGQ/weyOwYcuObu0Mqger08L3GZf23a7tVrlis8/qgABaVbKaCRzCEii0GKG+SK0CFAQjWjkLJwPNxLQO8dl0WV01/uHUu8xLeAotn6RmnaiETonhBn+/xroKmbasZq+KUFtHglG70P2w6SwDTI8cAhUuqwRZYTIP08iQ5dnX0j7BGvjvcAafbhVJfK3flHxjQyLah2UpWFGm4umybaSP6RyPJOHUCeDeizvfCbGv4u9qnpnfa2s7/H6bZhm1kjFMdN7/l9N4mAaIvmZBrmlzExb84+WxsYJtIQ+HSl1O+7oZjAeEflEUnaF6pnxd89tPqSBDIA1TxuQkaElnuo7atYUcxtAgK0y9/a4Tz/YvnKS5WBPsKwWbVsQ1AU3XpVdje5S4GmsIuY6LAvUAIrCrNqGy4n8G/jEa8FBH5Ano2wATmee5Qtig7WGV+B8bcX+tnE1MPVcxZAmyyio/X3maRDbyawvTcPt/g3FNGsdu+361bpElp8UKPrQrBt/yQrymKTvl1xxiHBZ4OKLHtwLk5fRr5quwifxWywkrrcm/7YHeZgsoDOSrRAPNDZ2nSwGI5Ki/4h27A2Oai5jESsBTHc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(136003)(346002)(39850400004)(451199018)(66476007)(66446008)(83380400001)(64756008)(66946007)(316002)(7416002)(8936002)(5660300002)(52536014)(8676002)(41300700001)(66556008)(76116006)(921005)(478600001)(53546011)(186003)(6506007)(38070700005)(71200400001)(9686003)(110136005)(55016003)(26005)(7696005)(33656002)(2906002)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q2JiNVlVNGhCS0Z5QmVpamVCbG93d09JeldTUXlNRnE5N1gyN3JGbnR2QVJx?=
 =?utf-8?B?ZjdXcjBqZGNJT0ZHblJHWVRLcFpVV0dMV2xIcXMrQzk4Z20ydFBHeDNnVU5q?=
 =?utf-8?B?M3VyWXVySUhhbTlIN1oxaFFZYzVZNUNwaSs5cVZWRmhsZlk3TlRqdElkWHpG?=
 =?utf-8?B?eklVcnN0YzhIS25FWjA4cWNoZjBBSE5pajg3VzNLUDhiOXN4VkdzTEZKSnhz?=
 =?utf-8?B?SE90aGhacHo2MlZEUXRpcUxpNGJCUVhRZWI2eWIyU2hxQ2JiVGZCN3dVY0lr?=
 =?utf-8?B?M2FlMzIwbnhlVStVUTdnTGRoUDdZaE90NThWbUh6cEVqRmNGSiswL0hGa2d5?=
 =?utf-8?B?WXdtZHc1Y0dKR2dxdW5ndnlKaEZzQTNscndCWDVPempMdS9FWFdzWXQwc3Zk?=
 =?utf-8?B?RUFvU05xR0taeVlMSks0SEZmS1kyVlcxcFhHeDNjL20vT20vSWxxRjJjZ0RZ?=
 =?utf-8?B?c0syQzZJNytTbWRQNDNHaERtaFg5K0hHUjRVTXpsOHZwWnlMS04reVBxMXZR?=
 =?utf-8?B?NCtRc2lsMDVvb0pZQnVwZDJMOFhuTkFVa2htclh3dExiOTFQVlFsa2Q4N2xP?=
 =?utf-8?B?RW90WTI3WExRWEg1MklLbGo1cS9sWFZRQUwwc1c1V01jSzhtbkFPNVJ4OEE1?=
 =?utf-8?B?WGFwRm1JQWd6eXNvN0QxcEZQNDk1N0EyREVsRnVYaGVJTFgrcGtUcmxtdytr?=
 =?utf-8?B?bzkrNDdOOXFnWmNkZnB4VHh6c0dMazY2STg1VWFRSHY4QnVUU2VXTUJtV3g4?=
 =?utf-8?B?UUxLU2xjZytldDFkNUU4eDN0dmhXVE9hWDJFbnpxdDRYbnNyNVNIYnc3aWc0?=
 =?utf-8?B?WndRVzVrcm5pMk9hOGJTNDFDcTVIZUpManRMc0NjSG9mdjYyc2tzVTZwcGVk?=
 =?utf-8?B?OU9xcFFSSVB3em8zVGM0eWFrbFNqR29CaTRXc21hVENtUnYwR09oTlRucGZs?=
 =?utf-8?B?UDRZcTA4SzE1d2tOelVhNFFuWWdyOHhCdFAzeW1aa0tmQllEa1lySUpCWEJ1?=
 =?utf-8?B?NXY1YVZUNWM2Z2lTeTVmQjRrcnlMM3lvWmpmdUxSK1NDWmRGR3l3Q295WHVj?=
 =?utf-8?B?ZS96ZGRqTGRXNmM4bHc5YXZtcnBEaUdRUU1pd2RJY3h5aVNHOExuQ0pLUWZj?=
 =?utf-8?B?aXFybWdnbDZkVzZiTmdqSVhlS0EySi8wVlBKOFRpUGhMdWhKYzFrdjhJLzd1?=
 =?utf-8?B?ODdacTV0emJYQWtvOVEvZEpiK290ZUI3WWp2cXc0SUpHU21sTCs3cElxYXB4?=
 =?utf-8?B?UitaNWdVUE9KcG5CTXRRVExqblZWWVJKZFBTckVpK0ZSRnB5bStUUkt5bmZl?=
 =?utf-8?B?NlNRNDVid2F0VlJFL1EyRllGTjBWQ2FCZ1VXT1lIQXIzQ1RsdldvdEpNZjN5?=
 =?utf-8?B?Tmx5ODVGQmFHNmdCYnFNZkc1VWRMWHYyMGtVVGhEVTNaWExOYzQ2bXRHQW1Z?=
 =?utf-8?B?Mnl3MmZaOHBSd0xWWjErSnBScHJRdWprckhjSUpIOXNITlFEM25IdWcrakxL?=
 =?utf-8?B?ZXNUV2hUbEVreHNvU3lXaGtGR0JtUXNsQXJneDRpMStmU1hYWldUT1VsZnZy?=
 =?utf-8?B?b0lhU09GTWtlQWFSYU9qSkllU3lnOUZuQXNaS1hJVWhIMERKRjRwRU1rYnFS?=
 =?utf-8?B?dGl4dkNXRUYzUTR2R1ZUbnl3VENSUTE2Kzl6MUNkcDdXbVpaNE1KTGdRVWFB?=
 =?utf-8?B?TGpPUkFsTGFDcElZN1RsMHh1MGhCYzVwOENkdUJESkpnbFVWczlGVGd0L0FY?=
 =?utf-8?B?azl6RHlSZmJGclVpYmZNS0RHN0VkK0MrZmJqc01pbFI2Q2E0cDVaRFFYRDJk?=
 =?utf-8?B?TGFMZ1IxSTYvZW1oZUY3dWF5MlF2Z0ZKdGVNMnVFOEdEQ0hGcFlya25tVWRa?=
 =?utf-8?B?bldDSmM2S3RhOFEzZEd3a2VBcHA0S3o1VWg3bjUxYUtpQlo0TXpXc1BRdnNL?=
 =?utf-8?B?aTBBbmlEOUx2eDNpbkZGaEJBZG9ob0huNzAwZFdvUXBwYjFvQTNnQmxjYkND?=
 =?utf-8?B?NHlGaE9aM1hUeGpBUmdVdHhqWGZUVXJydWVnYlMwWlFSS28vOTg4TDNDVk42?=
 =?utf-8?B?amJuRUQ4eTJHSHhoN0QwOXhnWVUweXljVWtENGwraklrNEZWbW90cVRocUdh?=
 =?utf-8?B?OU8rSjNEZmFlVTdhcjF4dk55VGFnR1BxWGZnL015VVVCUUpKdElDeEV1T2p0?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cae16a-6272-4e5c-cd9d-08db15390b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 00:58:14.5054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xp6RsGNJekLl/97Ef6jlOlub7QbABqb6TZwz5pVJhoA9byJbdeF/rKXz0CGmugNgUZp1I/fZuG7QGVhkN5eaDUz9MaCCrd9pBe5YaG61eu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5172
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
U2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMiwgMjAyMyA0OjI4IFBNDQo+IFRvOiBSeWFuIENo
ZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzJdIGky
YzogYXNwZWVkOiBzdXBwb3J0IGFzdDI2MDAgaTJjdjIgbmV3IHJlZ2lzdGVyDQo+IG1vZGUgZHJp
dmVyDQo+IA0KPiBPbiAyMi8wMi8yMDIzIDA0OjM2LCBSeWFuIENoZW4gd3JvdGU6DQo+IA0KPiA+
Pj4gKw0KPiA+Pj4gKwlyZXR1cm4gMDsNCj4gPj4+ICsNCj4gPj4+ICtmcmVlX2lycToNCj4gPj4+
ICsJZGV2bV9mcmVlX2lycSgmcGRldi0+ZGV2LCBpMmNfYnVzLT5pcnEsIGkyY19idXMpOw0KPiA+
Pg0KPiA+PiBXaHk/DQo+ID4+DQo+ID4+PiArdW5tYXA6DQo+ID4+PiArCWRldm1faW91bm1hcCgm
cGRldi0+ZGV2LCBpMmNfYnVzLT5yZWdfYmFzZSk7DQo+ID4+DQo+ID4+IFdoeT8NCj4gPj4NCj4g
Pj4+ICtmcmVlX21lbToNCj4gPj4+ICsJZGV2bV9rZnJlZSgmcGRldi0+ZGV2LCBpMmNfYnVzKTsN
Cj4gPj4NCj4gPj4gV2h5Pw0KPiA+Pg0KPiA+DQo+ID4gU29ycnksIHRob3NlIGFyZSBwcm9iZSBm
b2xsb3dpbmcsIGlmIGFueSBlcnJvciwgd2lsbCBnb3RvIHRoaXMgbGFiZWwuDQo+ID4gVG8gcmVs
ZWFzZSBtZW0vdW5tYXAvZnJlZV9pcnEuIElzIHRoaXMgdW5uZWNlc3Nhcnk/DQo+IA0KPiBSZWxl
YXNpbmcgbWFuYWdlZCByZXNvdXJjZXMgaXMgdXN1YWx5bCB1bm5lY2Vzc2FyeS4gVGhlcmVmb3Jl
IEkgYW0gYXNraW5nDQo+IHdoeSBkbyB5b3UgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5IGhlcmU/DQo+
IA0KPiA+IEkgc2F3IG1hbnkgZHJpdmVyIHN1Ym1pdCBpcyByZW1vdmUgYWxsIHByb2JlIGZhaWwg
Z290byBsYWJlbCwgaXMganVzdCByZXR1cm4NCj4gRVJSLg0KPiA+IERvIHlvdSBtZWFuIEkgZGly
ZWN0IGdvIGZvciB0aGlzIHdheT8NCj4gDQo+IFdoeSB3b3VsZCB5b3UgZG8gaXQgZGlmZmVyZW50
bHk/DQoNClRoYW5rcywgSSB3aWxsIHJlbW92ZSB0aG9zZSBsYWJlbHMsIGFuZCBtb2RpZnkgdG8g
ZGV2X2Vycl9wcm9iZSBpbiBwcmV2aW91cyBwcm9iZSByZXR1cm4uDQoNCj4gPg0KPiA+Pj4gKw0K
PiA+Pj4gKwlyZXR1cm4gcmV0Ow0KPiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50
IGFzdDI2MDBfaTJjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4+
PiArCXN0cnVjdCBhc3QyNjAwX2kyY19idXMgKmkyY19idXMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsNCj4gPj4+ICsNCj4gPj4+ICsJLyogRGlzYWJsZSBldmVyeXRoaW5nLiAqLw0KPiA+
Pj4gKwl3cml0ZWwoMCwgaTJjX2J1cy0+cmVnX2Jhc2UgKyBBU1QyNjAwX0kyQ0NfRlVOX0NUUkwp
Ow0KPiA+Pj4gKwl3cml0ZWwoMCwgaTJjX2J1cy0+cmVnX2Jhc2UgKyBBU1QyNjAwX0kyQ01fSUVS
KTsNCj4gPj4+ICsNCj4gPj4+ICsJZGV2bV9mcmVlX2lycSgmcGRldi0+ZGV2LCBpMmNfYnVzLT5p
cnEsIGkyY19idXMpOw0KPiA+Pj4gKw0KPiA+Pj4gKwlpMmNfZGVsX2FkYXB0ZXIoJmkyY19idXMt
PmFkYXApOw0KPiA+Pg0KPiA+PiBXcm9uZyBvcmRlciBvZiBjbGVhbnVwLiBJdCBzaG91bGQgYmUg
cmV2ZXJzZWQgdG8gdGhlIHByb2JlLCB1bmxlc3MNCj4gPj4geW91IGhhdmUgc29tZSByZWFzb24s
IGJ1dCB0aGVuIHBsZWFzZSBleHBsYWluLg0KPiA+DQo+ID4gU29ycnksIHRoaXMgaW4gcmVtb3Zl
IGZ1bmN0aW9uLCBpdCBzaG91bGQgZG8gaTJjX2RlbF9hZGFwdGVyKCZpMmNfYnVzLT5hZGFwKQ0K
PiBpbiB0aGUgZW5kLg0KPiA+IFdoeSB0aGlzIHNob3VsZCByZXZlcmVkIHRvIHByb2JlPw0KPiAN
Cj4gQmVjYXVzZSBpdCdzIGxvZ2ljYWwsIHlvdSBkbyB0aGUgc2FtZSB3aXRoIGVycm9yIHBhdGhz
IG9mIHByb2JlLCBpdCBpdCB1c3VhbGx5IHRoZQ0KPiBvbmx5IHdheSB0byBtYWtlIHN1cmUgc29t
ZSBvZiB0aGUgcmVzb3VyY2VzIGFyZSBub3QgdXNlZCBieSBzb21lIG90aGVyIHBpZWNlDQo+IChl
LmcuIGludGVycnVwdCBoYW5kbGVyIGlzIGNhbGxlZCB3aGlsZSBpMmMgYWRhcHRlciBpcyB1bnJl
Z2lzdGVyZWQpLg0KDQpTb3JyeSwgSSBjYW4ndCBjYXRjaCB5b3VyIHBvaW50Lg0KRG8geW91IG1l
YW4gcmVtb3ZlIGRldm1fZnJlZV9pcnEoJnBkZXYtPmRldiwgaTJjX2J1cy0+aXJxLCBpMmNfYnVz
KTsNCktlZXAgaTJjX2RlbF9hZGFwdGVyKCZpMmNfYnVzLT5hZGFwKSBoZXJlLCBiZWNhdXNlIGlu
dGVycnVwdCBpcyBjYWxsZWQgd2hpbGUgaTJjIGFkYXB0ZXIgaXMgdW5yZWdpc3RlcmVkID8NCg0K
QmVzdCByZWdhcmRzLA0KUnlhbiBDaGVuDQoNCg==
