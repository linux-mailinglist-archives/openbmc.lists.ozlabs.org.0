Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27862693BDE
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 02:47:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFRzQ6m8kz3bgk
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 12:47:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=K5rptG9D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=K5rptG9D;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2071a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFRyg6GZJz3c7S;
	Mon, 13 Feb 2023 12:46:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVNJYLpmm0ycGCKzu2soMfHqVpISdfUgclePyA1ypmNA8cojvQwOxxTj24J3nvl0HHL41iy3DUc18cwDkQKPCHtye/LQGzq6LrF5zyjf4H4o937/uacwNFwfb+0HUEIy8piDo6Evc7Cnnf35Gq269riT2bwYgk5JxifAPskgpA6fmI8Xxs+LrkfB7hVa/YFhSwcZJS3Gm89dKAvFMoi25HbrgFx61mKXEjAEx7FXK8ZsGqvqzcV/YZKwgug7bt3lGDSukgabruHUGpp0gs48EQMIZ5gjzd+RK+zynRMjnjKZ6PCp74Wb2OxP8ORBHyRsVdBymAMZoGeDLqOjkFlOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykpnJ7MtQi2tdbPPlGsIlLg2XuBz5It7ZbTL5D43XAk=;
 b=E4vGAQuNMT4aN7/BROaUB5ws5yVoH0MwuDKNGV8qMaZeUwX3AKv4jM4Ocqhew+Fvec0YWhlSmW5CM8CfBsXJFi5ZB69SxlDXlQnxNVkwtUIXjVNUIr8KeFB5kOiN/80dR/nhzZdCMUXflSh8l2572T4cS0BELbosfbh0THfRVLIPe8gdEDnhofAcfGsb/H5wFtzdrGylmgllO3oRZGJn7OGX97eEjJMU1BUnkoOsxqd2/kliQGHf31UhrtdJouky5imLZ1a+xiLdF09Oz5RR6drESvnjScQnNXTB97+4Tia4F5n2wsNunMsm8oEi7YVU1tM6rV1tLo1sXI/ZeXAW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykpnJ7MtQi2tdbPPlGsIlLg2XuBz5It7ZbTL5D43XAk=;
 b=K5rptG9DnTP5c3vFL5N/0EHUGMcrcStbkZX7npKF/NbF5Jtm9BSoKLmGbq5ucYwpyVUhjBpNz9gB3Le+lajHgbWWSqRGucdy89gISRf3eToOvcHSzlC3N+Qc1ZqqkdzYz3gSh20gxJ9Mz3+oxrPmtQTFthOZb4Ej9kXmy+ldWhdAdIrSxTh6YEq7HhnoR+F5BdZLsl11gYM11qE9FPnhZRPQZj9aF9m/zPd7QKVT83m116DqiCPsRui3NWwwwQFDF6xf8EWg44nAgVgZ80zWNWiFOPcFudgLJnkkpohncgz7iiqSLmcoFDqKkjyCPJi/zq1xkFUSRtKsnob7/XVo0g==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by TYZPR06MB6141.apcprd06.prod.outlook.com
 (2603:1096:400:343::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 01:46:17 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%4]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 01:46:17 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH 4/4] ARM: dts: aspeed-g6: Add UDMA node
Thread-Topic: [PATCH 4/4] ARM: dts: aspeed-g6: Add UDMA node
Thread-Index: AQHZPSEyp0RpjauQskeEN3GnocyocK7H5dsAgAQ5p+A=
Date: Mon, 13 Feb 2023 01:46:17 +0000
Message-ID:  <KL1PR0601MB37811723965A68AB07016AF191DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-5-chiawei_wang@aspeedtech.com>
 <db065c0a-6c0e-ebf1-1867-6271b0cb5e8a@linaro.org>
In-Reply-To: <db065c0a-6c0e-ebf1-1867-6271b0cb5e8a@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|TYZPR06MB6141:EE_
x-ms-office365-filtering-correlation-id: 566cbe3d-99ac-4a98-a604-08db0d641945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eZu4YqM8zCKMLbS6A50ky0msrCqDfTXyRmQQxpObnxcB/v0wVHNVwMlTzTVM8oeakUSR6jM0LFt8HHmqYzkZY9rCVp0AFsf4QduvAeVWw5cA8GGUWwnC26GI2zVrp03cl/zLH8zix5YG41x55zMGWFJpPQxJVnGxlyQbPgILL4OlvcpbcYuQYEra0Eys0EQ/vYN5njbGp9bi76vDeDOTIUzEZqmv4xn/JerHeoJTMOmmrmCvyta2KdnoiE99V3zaU8/yzfAZO6lrEgC19og6pKeDYies2FpKoT+lZTlsNHvzIDJd24r6JxgeNON1F8HfwfzYTjceXeYTjDdyAcNgy4ypHlVVHH1lLukd0/wASrrKR2hBNFepQCAsV6KDER9cZjClufFOVJG/72uJW9LkxvtfUjNk//Zp1a3z5BbfrLeNxosN72NqLxTbbCOu90xZrHhpGrHmppSrfukDDSGWR4WMQl1y/G/yFsIeWlzy/jOAJCzM4D+Q7jiNIvazkDgz29X7iVbSL3DP2b7cz7Cgne4B8j9Mf0GYP+hNCZjr0klneS4f9uNl+jNbbkM+PBkB7wFibYWqzoc/XYcgtfROmY9cEc79uaT5iNe12WKPU0jXqJNm1WIz4TIs8ncwpu/jgXvcG+d82+7Zj8Oyl8CEkA5m833phYO6j0srKeVyxjs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(346002)(396003)(39830400003)(451199018)(71200400001)(7696005)(110136005)(53546011)(966005)(186003)(26005)(6506007)(9686003)(478600001)(8936002)(41300700001)(52536014)(2906002)(7416002)(5660300002)(316002)(8676002)(76116006)(66556008)(66476007)(38100700002)(64756008)(66946007)(66446008)(122000001)(55016003)(86362001)(38070700005)(33656002)(921005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K3RQck9XZVJXSm51S09ZbW9wNGNKSlJLRE1XcG1MSHQxZFBWak56Szc1L1ZR?=
 =?utf-8?B?Tlg3b3pVVVJ4MzVMYmQ1dmlkQVZvM0V0cEpNMlB5T0QvcVcydFgxUmFvbSs0?=
 =?utf-8?B?YUNWQlQ3djR1WXFzYnU1eVBycmVKbGhEZWVtZGYwWjFuVGJEZW51SVpsYy9D?=
 =?utf-8?B?SXJiYXlpTmE5ZVN0Z1BVZ3RJYXRjbXhoTGJUdDJCbXZxeElBSVIzVWptRzh2?=
 =?utf-8?B?SFdjTllqdHIzcklQaUN2enZxV3dtQkFQNDZHODQzd2htMVFYNUttZ294RkdG?=
 =?utf-8?B?YkU2c2NtZWpmYkVXL0pEbmRWcnJGRWlqYVZycmp6OEpvS1MvSHFZdkpjZzZs?=
 =?utf-8?B?b21LUzduNHVUUkM5eWtVdjl4Q2xoREM3eTR2ZWQ1U0kvRzNLU0lnNDBueWVB?=
 =?utf-8?B?OTgxUGR5Tk96U2krRkMzZE1IdjFmdXFla2cyS0tUTHFsQUc5WUNORTh6dGVy?=
 =?utf-8?B?TmZYbDRjZ2NaQU9jSzBnOXY4eXNmaFQ4NGcxV2RTQ05YekdEdTF3cjRIVjkv?=
 =?utf-8?B?c3ByTjFoK3ZMdWl2bGZmcTREa3RXOVlCQnkrVnZVMEltOXNJemFhWUJOcXB3?=
 =?utf-8?B?TDJRT2FuYWxNZlpSb0pSK244UjhLeXIxOXBsNld1WXdIKzl1M2RaSWVwZk5a?=
 =?utf-8?B?UmtLVkJNb0x2eTVvbUQyK2ptZTBhOEp4RHlJNlBVckVid3dUQldyZkx2RUVx?=
 =?utf-8?B?ZWxyUTZhNGw2MjlISzhid3pvWWgxQ1BhYUF5dkI0QTdYaVhWa040VGpFdzJN?=
 =?utf-8?B?b0hKYThib2lPRTVpYndLVkhwY1gxUEpRMjVCVnJCaDlHQWpyLzc4UVFxZTdx?=
 =?utf-8?B?MTI1d0FJaG82YnFDVy9LVlloTWVKVEF5U0FMM2ZyK09CQlZ0RytuSFdYdlNn?=
 =?utf-8?B?NkVGdmpXQzZZTU9tbmFXRDhrMUc3RWp3SUI0REIvRXFrZjlEZUhpaExqSXB0?=
 =?utf-8?B?OXFORyttTnFZUytOK08va1VqdVA3SmkrMHJmKzFZVFdtVGRFWlMreXlqSndV?=
 =?utf-8?B?M1YxeTdFQnBjOWdIVkRhM2Zkb2dJMk5GVUpPWUVEOFJCZDdPdEI2KzNMTFpG?=
 =?utf-8?B?clJabUFhNmEvN3ZWcFFvZ3lQT2tybXNzSHNOU09lM3hZaUJxWmFnek91Rk1q?=
 =?utf-8?B?Q3ZzZFhDVFFCRnR0ZUcrQVNUVWtucVBmRWlhOTA3SUxRZTIyVjRrM3VGejhx?=
 =?utf-8?B?MTA2RWpheDhqcXJSSFN0dTArZDdGVTd6WStESUtjSW9LZlU3RW53UUpwb0ow?=
 =?utf-8?B?RTFVTmlRc2NwWUh5T2RwMVlaeFpVSFo1cjNnS2d6c2Zqa1o0ODZQY0s5Ymp0?=
 =?utf-8?B?QkVZaXI3Z3NFU05yU29BUkx2K0ZrUlVmblovZXNkMkRKdms2Q20rRDhwZXg4?=
 =?utf-8?B?WkNPMDFWRXByRUIwVnhKTWlnZGJTQnZndklSd1Q1aUVSZlgvYVM3UkRzY011?=
 =?utf-8?B?V3VpbTNEdWc4R3ZRSHd3VGlCTWI0SFJDTUR5Y1dnWFBwRjRnTWdHU0dQTmdo?=
 =?utf-8?B?aWNNZFVHUm1SdGswcERXU256R0hLakFtUHpQU3RUT3puYjVuMVlXZzhEOWww?=
 =?utf-8?B?aXdLaXB4cWd0MXl4azRwWHpjUHV6MUhrUzZDeWJpNE9pUVdQZGdqRjRubjJX?=
 =?utf-8?B?K1ltMElCZnNhRVdPNC9vMXhHTTdUNlg3OU43L0hvbC9sMWpqd2xCZ1BzUGd2?=
 =?utf-8?B?RGlVVTRpdUJtR0R3Qy9MdHdiOTliT2tCZGJ3bisvdWhjNFhhK0pJaVFBcDRv?=
 =?utf-8?B?NjgrdGQ1ckNaK0N3R0hLMW1vV2lESThwakZIdnU3UFJTM0VIMkFTTnBBdk54?=
 =?utf-8?B?eXpyRGFjYXYyL0ozWTdHUk5tRGc1WUMrVlc3a2RDTFVQV2V6MHpOVXhRbnU5?=
 =?utf-8?B?ZE9wSFZBT3RzMndtOG1CZTJWc1FDL2FLTUpuUnlaWmJnb2lyNkUxb0tOSFZC?=
 =?utf-8?B?SDFkeUNMODFQTjFLNEczdWthbitQS21XZit3aVBETlFmYVplU2twNVN4UmdQ?=
 =?utf-8?B?emJ5Z1dQKzF5K29sQWhJUDFaMTZ2dTdWS3NONnFyRjlVMHp3bGVmY2V5a09a?=
 =?utf-8?B?K3I0QzFDZVN4QW9DRnNZN3EwRzRFR2RzbnZucmZzRmFXMm42dW1KeFdRNHRN?=
 =?utf-8?B?VkxLdUVmZmdub0pLZ01WQkkxNnZuVlFhbld6SXV2Q3MxTzdXcUNqTU1SMlhu?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566cbe3d-99ac-4a98-a604-08db0d641945
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 01:46:17.4630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oc5JWA2YXa58cmXiFz8RlpK2/768Hi3USweYfVrMKP2TZjEbNoQ0X8S+Z96EyeVE2qHWc1KTELCutDua0WYVoH4t0InWSdBqk9jjYHSVPgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6141
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

PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMjMgNToxNCBQTQ0KPiANCj4gT24g
MTAvMDIvMjAyMyAwODoyNiwgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gPiBBZGQgdGhlIGRldmlj
ZSB0cmVlIG5vZGUgZm9yIFVBUlQgRE1BIGNvbnRyb2xsZXIuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGlhLVdlaSBXYW5nIDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0t
DQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpIHwgNyArKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1nNi5kdHNpDQo+ID4gaW5kZXggY2MyZjhiNzg1OTE3Li4zZjRlOWRhOGY2YzcgMTAwNjQ0
DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kNCj4gPiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiA+IEBAIC04NTAsNiArODUwLDEzIEBA
IGZzaW0xOiBmc2lAMWU3OWIxMDAgew0KPiA+ICAJCQkJY2xvY2tzID0gPCZzeXNjb24gQVNQRUVE
X0NMS19HQVRFX0ZTSUNMSz47DQo+ID4gIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICAJ
CQl9Ow0KPiA+ICsNCj4gPiArCQkJdWRtYTogdWFydC1kbWFAMWU3OWUwMDAgew0KPiANCj4gTm9k
ZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYy4NCj4gaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmlj
YXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtDQo+IGJh
c2ljcy5odG1sI2dlbmVyaWMtbmFtZXMtcmVjb21tZW5kYXRpb24NCj4gDQo+ID4gKwkJCQljb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXVkbWEiOw0KPiANCj4gUGxlYXNlIHJ1biBzY3JpcHRz
L2NoZWNrcGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4NCg0KVGhhbmtzIGZvciBy
ZW1pbmRpbmcuIFdpbGwgYWRkIHRoZSBkdC1iaW5kaW5ncyBmb3IgVURNQSBhcyB3ZWxsLg0KDQpS
ZWdhcmRzLA0KQ2hpYXdlaQ0K
