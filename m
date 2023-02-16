Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F5698F8F
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 10:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHTrb5hLKz3cjW
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 20:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=A9lGuiki;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::72e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=A9lGuiki;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2072e.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHTqn0MJkz3cdd;
	Thu, 16 Feb 2023 20:17:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMcwQGiILDvUvsZMX3sGSueUZw5wyObZ5m1j/32eGAAhM4BWbxeTwhIaHDPU/drb+yEqNYZjvtq8GrXy9Sh057RLSYi1AcIVR3zoUpK2oVL7njpn+a1YI5hTKLy0Y78E08WruDLCimDjblnEgQE9q3mhH6TvEOiiceH3Ynel6cQKsqLUcc3SZgb/sJr840+YhZJGy3MUiXZ5B1WyTRQd/J+f6Y1Uz9b59FXGFqamGr37vxZ9+1NvUPs1hwes46SugDbCt87AnvlrbXJhjnkYoLue/2UQadiG9wImAXe0fxe3+Tb53Zbsq3ZCBR2ORTa62e3a2XX6a4CsTM76pbov6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIhoRdLJQr98ukScubDXBMuE0V++xWzTiEha3nrfpQ4=;
 b=dNr+Cgn6558AII5Vqv/tAWqRWTXv7NVGADnrRlhGlt8UX9gnpMBW49wqpmE+V6NRW/hkR6hSj1auGMiFQW7pmdglx3eKnNh5JFXGhe4Hbl8rM7xnljxwdDWAn9gsdXNP4Waim2FNy8vxipi1ushl7VV52RSeItub2Ev7tYgAfU32poDwOo3vn0VBzpCbmdBR+/CSmOIGGg6l2QikL+J472NwWbnNcHWKgPWRncU9m6HOIabwq2xF7vb3qBNszHYxjJhE9sPvDIH20DRfr/TTVBeNplPkqP6j3tqWkR+0k+o6BN3GBI9T7MSbhBhBqSgW6fRybY+OudQJtiyec07JVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIhoRdLJQr98ukScubDXBMuE0V++xWzTiEha3nrfpQ4=;
 b=A9lGuikiJFELWauzEoGYMuO8kPBfY7ETSjYWvCwHKFn1gYrMLGbw7loHdwz7OIjodMKY8l5Z92h9E8LpXZInt+c++PhJ/C3fEDMPmCvrvBY7y3Y6M/eFFldsR0Mb8OBb28YbLs8Ka/MM9g/hHJxl/qYMT/gOoRADInIl7KRhRYOZ1D2uRuqIBpE1r0YoSUyYHcsm92T9H6pAH9vwDdx6LJ+rHSNlolipoC1rBAaVHoiLiWprwfX0E+UdzRk3wr5SsOiNmXmN+V4EJwXj8bedIbIjF7faGe4paKdHS8fkDYUKnP+hVMy94aEXdvUZ2EjsdJVAUcxNwc7VeTTTnVX6Tg==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by TYZPR06MB5735.apcprd06.prod.outlook.com (2603:1096:400:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Thu, 16 Feb
 2023 09:17:13 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 09:17:13 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Thread-Topic: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Thread-Index: AQHZNii3UFiZnjoVzEOnbd7WD7fD4K67XHWAgBQ23XCAAXtkAIAAPf0g
Date: Thu, 16 Feb 2023 09:17:12 +0000
Message-ID:  <TYZPR06MB52747AA667D2481034396444F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a62fb259-3ad3-b75e-c59e-2ce937bf799a@linux.microsoft.com>
In-Reply-To: <a62fb259-3ad3-b75e-c59e-2ce937bf799a@linux.microsoft.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|TYZPR06MB5735:EE_
x-ms-office365-filtering-correlation-id: 387c7cde-246f-463e-b693-08db0ffe96cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IH9PB3FY7//tSMm4ktBC57ghpxw+TN9KIK2ZTqWzV8cWjWrIdNHPB6IlsN96S/AvBIFA81GqODbd6e5yZyla9U/S/lcFkH0g31vBPqwVRpOrV1lfq7teMe/y3sFyhhRpGe5EZSQ49D0MxsGZs5o22dKwOcy9J2gsdZt0YnRV55XzYBcQ0LndcSH+7bOsi6fwb77XDakxIUV7mnuiULsoDLNQvpfhrmQF6skN110pRQOoqiQVakyRXVEWacqIYqv0CgFFzESdhl9AH8l0E4DSnaLHdVRdrXq8jj+C32Vlcht1sS/i5xJsc41Y8AZvBY2RvUrmrccrkhpnTpwQ94PoXbjepJE1JbtmWjLuXuDXjwhTEJcPEFJO6Xxn/wjo4SdrJLGl/bAHSFyc4wZqW1wHjMNsye//FmwIxnFfNjDZw6WWX0rZkP1z5ViytB/qgER1ucZDEvjJonez8C7ZHDApZT664Cx9DAEcyuf015uG96L3V7//4bOqP/d7Yi5yd4nkkfwdJLudbN4T3f14amux03SIwTqx+mRKXXuiiYAAksB277YwT1IXpUBIS9MMw1XP/fqQ4YaN4QTZ/o55UFA2S51pmWRxLqTozICOlAyxXg0M/OQ/saqErS7ZLF2TntVGTuwBBMWRl2K2942peHEU+X3yJhfCBsXHJfkmBF9fgZv2Pu35sUFtid5A0rP9HVeiBAVkCWeAK1v8Eg+LxFXGPsbmdTFL0SKnsGQ1k7PibZI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39840400004)(136003)(366004)(346002)(396003)(451199018)(55016003)(33656002)(7696005)(6506007)(186003)(53546011)(26005)(38100700002)(921005)(86362001)(478600001)(71200400001)(38070700005)(83380400001)(9686003)(5660300002)(2906002)(66556008)(66446008)(41300700001)(110136005)(122000001)(64756008)(8936002)(76116006)(7416002)(66476007)(66946007)(316002)(8676002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UkxPcFc4RHl4ZGlOT3FIS3JNYmZ0MzJ3em9qaXQ1eFNUd3J2ak5YSDZrOFdX?=
 =?utf-8?B?YXppZWVQWFhZbU1rWCtwRE5Wb0puVGV5bE1hZ2grWkJvQ0RLU0NTN28vSzRW?=
 =?utf-8?B?TUtKWHl6ZDBSK3ZjSlFpVjVWTkU2UzJVOWhBV3h5Y3ZEb0RxN3QvSTdhNEVy?=
 =?utf-8?B?bmhISSt0QU1nWVJqSDhXWXRuNlRFb3JpQUZ2SDBjaUprWTV2S3lhQ0JyWWtk?=
 =?utf-8?B?VXVVL05LVnh1cEFrcnNqRjNjaXlNdnNHTTROVzZvc3pXSjNZc0tUNDRSYlls?=
 =?utf-8?B?UkRGYTlwQ1Q1SlpXbXNib1JjWndRSkRLUURJWklpNkhmVFdiMmJvSkJ5YUlU?=
 =?utf-8?B?dnQyMWJ2RVNRMzJUTWFESFBqbzVZWlB6V0RUNlZycVU2cjRvRG9WRzFuUmN2?=
 =?utf-8?B?OUx5SWc2MDZSZjRuc3lIeXJxeGFiNStia3pVcCtycFRlSjZQZlYwdEtRbWpj?=
 =?utf-8?B?d3E2Q29xOXA3UWR1TU5EdGZXdzZRcVRQMnVSR2x4QzhuSVNjOWZzeVoxeThu?=
 =?utf-8?B?bnhoVWJVdCtHVDNINjJxSmNXYVB0bjIxaGw3SEk0ZWdvT3hTSTdseHRaSWZq?=
 =?utf-8?B?MHdTRkFPbWJWR3FhdlZMcEg2OXNaMVJCdGgrcHdPUy9UWFVlcENBY01BNkpF?=
 =?utf-8?B?eEFZVEt4SXFubkJMdlNOWmxGNVRTUGRyNkhUWi9QWWxWbHIwblFlWXVFeW16?=
 =?utf-8?B?SlV0Slcyb2tRT3dWaDBBUmFFcVRkZzNhTjdOakdwTEdZL0JMZFFIWEYzT2dZ?=
 =?utf-8?B?Y1ZCYkppdVU1bWk3bHNseHMyQ2RPV2I0cnF2WUxiSlMybHI2YWRSc292ZE42?=
 =?utf-8?B?UWRzQXlZQWZoV3dJSkwyeHBwbm9xRFppRFlxUTBacnViN1BXTEpieG5sYjcy?=
 =?utf-8?B?RkZGWFlVNi9nSmNBQ1A3RHUycXVqc2MzajdmWjNzYXFvZS9XUDBJN3kyZXJx?=
 =?utf-8?B?dFVRRnRwaU1OVE53QXk4TnVpNHFOT011dC8xODBsM3F2MEhmOVN1aE5PcFQ5?=
 =?utf-8?B?SEIrTVA0ZVUvTTRlSWV1S0NXcXFJc3pCQ2htTWIxYmxtditQYzBEV0pMR3FJ?=
 =?utf-8?B?d3NubCtOVnh0akxsS0Yycmx1a09kZE5YWkNHRDF1Vnc4cGRQbWw3OHVlZGov?=
 =?utf-8?B?aDdrUS9BcTBVbGtHN1VsVWxEWVl6TjVhblQzZWJzZHRMQTdzbmxxSzJUYzR6?=
 =?utf-8?B?RFVXUGpWN3BOZytqa3lLdGlDVC8xS2tla3RuRE1pZ2N5Q09WZzgxNzJxTDdD?=
 =?utf-8?B?UWU4ZmtkSjNyUXg5azIvQUJJUjR6ekFua1JIbDlXMHVkS3BQRkZ5Qkc4OVZV?=
 =?utf-8?B?R2E3N3I5K09wOVdQeTA3SlhqWHVHWU14aFRsUFRPUkJKOVZOUUU2aWRKV1M1?=
 =?utf-8?B?bUFiZm8weU5MNjBZNnI0d1A3cHpWVGhYM0hybld0OGdMcVdjaHM2Y1JxcXhn?=
 =?utf-8?B?aTNNQ2J2U3B5cnAvM1pvNEV4c3RDU0h6NDB2QzZEajZmdHYzbjllTmt6NFZt?=
 =?utf-8?B?ZEQ4eFYyVnR3MERGYWI4cTRvcmxiaEY1VUdCeEVSU1B3eW1HT1djaHBzdnky?=
 =?utf-8?B?Z1NnZ2EwdDNmT0VGSHdyNlorU0NlSExER1VsT0w4OHhTWGRHcWI3UHI5T1Bl?=
 =?utf-8?B?TEl5NmxRRnprTklEZElDTzZ4MnRuNDZGMGNNWm5ORndkN3BzdEFkRmk3bHMw?=
 =?utf-8?B?Y3IwVWpoWE1YODFVMklQVElVVnNacng3bGpvMkxiWSszVzVRSGJOY2xHTE5L?=
 =?utf-8?B?RjRudjlDMGFPc1ZiL2NMOVNYZSsyQytXaUxYa045Q0JoOVVYQlJSdjh5c2dW?=
 =?utf-8?B?TkowSDFSUzVxMzJKMHg5VHFxUkN6eU1xQk5KbU9IdjZRSlgzS1J4aklzc0N6?=
 =?utf-8?B?UmdINjVMMUR1a2RjWHNqc0VMZysvUFlha1JjZEswUThRNjE1eXRhOSs5NEZD?=
 =?utf-8?B?bWpDaXAyVHQ0b1Y1M09pT2VPclZuZjhKTWNxc3puVXJsSkpsdFJkMmJQVE9p?=
 =?utf-8?B?QitLZUFRU0phTVd6SXZtWm05cDFSSFhLS3U5OVoydW1NWC92YVEzS2FTM3Ny?=
 =?utf-8?B?SE1DVjFUa1BFMGNhSlhGQk01Q3hlQ3hRQTh2S3hRZkJmUjFXVjVIYzZDeldH?=
 =?utf-8?Q?KvmnoFT5axay7+Q9EJV+uFBG2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387c7cde-246f-463e-b693-08db0ffe96cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 09:17:12.8737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pzw03sukwbcqGAOBEtIraIKWylYn66gFRLja80OYx6PHcPFXAZeZEGStKlvMofp3I0Zg+et/iAVF5uADuqOr+/JweFuKeA6yJfsYtscGIwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5735
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

SGVsbG8gRGhhbmFuamF5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IERoYW5hbmpheSBQaGFka2UgPGRwaGFka2VAbGludXgubWljcm9zb2Z0LmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIEZlYnJ1YXJ5IDE2LCAyMDIzIDEyOjE3IFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5
YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+
OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsNCj4gQW5kcmV3IEplZmZlcnkgPGFu
ZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0K
PiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzNdIGR0LWJpbmRpbmdz
OiBpMmMtYXN0MjYwMDogQWRkIHN1cHBvcnQgZm9yIEFTVDI2MDANCj4gaTJDIGRyaXZlcg0KPiAN
Cj4gSGkgUnlhbiwNCj4gDQo+IE9uIDIvMTQvMjAyMyA5OjQzIFBNLCBSeWFuIENoZW4gd3JvdGU6
DQo+ID4gSXQgaXMgbm90IGR1cGxpY2F0ZWQsIGFzIG15IGRlc2NyaXB0aW9uIGluIGNvdmVyICIg
VGhpcyBzZXJpZXMgYWRkIEFTVDI2MDAgaTJjDQo+IG5ldyByZWdpc3RlciBzZXQgZHJpdmVyIg0K
PiA+IFNvLCB0aGlzIHdpbGwgYmUgZGlmZmVyZW50IGRyaXZlciBjb21wYXRpYmxlLg0KPiA+IFRo
ZSBvcmlnaW5hbCBjb21wYXRpYmxlIGlzDQo+ID4gICAgICAgIC0gYXNwZWVkLGFzdDI0MDAtaTJj
LWJ1cw0KPiA+ICAgICAgICAtIGFzcGVlZCxhc3QyNTAwLWkyYy1idXMNCj4gPiAgICAgICAgLSBh
c3BlZWQsYXN0MjYwMC1pMmMtYnVzDQo+ID4gU28gdGhlIG5ldyByZWdpc3RlciBzZXQgY29tcGF0
aWJsZSBpcyAiLSBhc3BlZWQsYXN0MjYwMC1pMmMiLCByZW1vdmUgImJ1cyIuDQo+IA0KPiBJcyBp
dCBwb3NzaWJsZSB0byBrZWVwIGV4aXN0aW5nIGRyaXZlciBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWFzcGVlZC5jIGZvcg0KPiBhc3QyNDAwL2FzdDI1MDAsIHdoaWxlIG1vdmUgYXN0MjYwMCBzdXBw
b3J0IHRvIG5ldyBkcml2ZXIgYWx0b2dldGhlciwgc2F5DQo+IGkyYy1hc3QyNjAwLmMgYWxvbmcg
d2l0aCBuZXcgcmVnaXN0ZXIgbW9kZT8gQnkgZGVmYXVsdCBuZXcgZHJpdmVyIGNhbg0KPiBzdXBw
b3J0IGxlZ2FjeSBtb2RlIHdpdGggc2FtZSBjb21wYXRpYmxlICJhc3BlZWQsYXN0MjYwMC0gaTJj
LWJ1cyIsDQo+IGFkZGl0aW9uYWxseSBkcml2ZW4gYnkgZHQgcHJvcHMsIHN3aXRjaCB0byBuZXcg
bW9kZS4NCg0KTm8sIGFzIHRoZSBwYXRjaCBjb3ZlciBsYXR0ZXIgZGVzY3JpcHRpb24sIGl0IGlz
IHR3byBkaWZmZXJlbnQgcmVnaXN0ZXIgb2Zmc2V0cy4NClB1cmUgbmV3IHJlZ2lzdGVyIGNvbnRy
b2wsIGFuZCBhbHNvIGRpZmZlcmVudCBjb250cm9sIHNlcXVlbmNlLg0KDQpSZWdhcmRzLA0KUnlh
bg0K
