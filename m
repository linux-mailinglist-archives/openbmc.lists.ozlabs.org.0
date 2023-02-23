Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A586A062E
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 11:27:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMq3C6tl2z3ccg
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 21:27:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=OozPUf0e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=OozPUf0e;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2070c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMq1j146Qz3cbV;
	Thu, 23 Feb 2023 21:26:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6FxWQ1FJ7lKv47+65bp0RlP0mlAiC7yBAetuIgGGfHm9m5dFdv+TezpqK+IbUPDifSgZd51Ls87kn70t0ZKZ71JuMUEMzQ3Xc9R+VmAMcnZSUaNo4LeCVxChnfwEz5YTu91VIw2Omx83K682ke753in9LP/loMgD0m8EtFqm9qH/Lfl/w+Xbyxm7EwmcM9NfuKH33VYXHhaQXo9Mlwpf4QIDtrTZEZ2NgLI/NpPHeiykWeggSLGrslPUs6S1If/miqUJ061QNVgSHN71v2d3M9qgUl4Qnr09AK2IuawRrTXzEZNSB70/qO4705ATGKNjDP53xs+cns4Cc9ErNxLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eempe27B4l0EmbP4e4K8T+O/x8toFKxCkIaCEWGYFNQ=;
 b=UY2wkEWXJCluuozlQvAAKLym4H0k6x/l/Z4l8EXc3cUsWt7nxC6vOC6vgPLNdmtmXKKi10eXu4I51eGVQDZnQFyh08rCxo0uXlchwLHO3pFW+PGpINaHUwFwhO5R/b7PSXCylIDInhqbvRWAnvDHMYmPHjYs+l5K4OTcNJ8nOb3DEmGZq9Cc+gZkJ037NLW2Sv70zUwuKyE6VobYeAemqF58Fam2veviZ6Js9Kp7VFnjQC4Vc5QtdFBZkpp67fkZIhdCwFjR4ImFKesTZh9T4BAgc4+kJQs0d71wwglz9v1w7o5m00VJ9dp+5mItia9tAwNeOBZ3dADMsxBLka/pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eempe27B4l0EmbP4e4K8T+O/x8toFKxCkIaCEWGYFNQ=;
 b=OozPUf0eeZc+Zn1AmYDQR9f6hMylgWPwbCHZa3tfkZ2WOXOcJlMdGGuiD3OEEMxlpKlWHIYdf/TjI8P3Dvphp/rSzwOWQJTLsYS2CHJKPu7AKB7LavF83gwl6IPcg6CdnuJtVZFC+yaR2kmpbvaRZCXRTVVynfLNUAc9p2bRiYYtnnCDXtXfmcv75IChMT/LPdchqtsWSNS3r0OQlsM5KjCTmgdxHQKbPeiVpVFSli3r5ltv953WHn1ewel2bhSAkDjcQjFzaNczvjPqokW89QKnx/iXB9NN1ou1SgrgwWRgCzBwOKH94+0RrexNnRATKbb7yM0+rfo482MimYlWWQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3900.apcprd06.prod.outlook.com (2603:1096:4:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.14; Thu, 23 Feb
 2023 10:25:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%8]) with mapi id 15.20.6111.010; Thu, 23 Feb 2023
 10:25:57 +0000
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
Thread-Index:  AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7Xgo8AgAEkZWCAAIA2gIAABk2QgAARNgCAAQdUEIAAXpcAgAAiCSCAAAJCAIAAAIJwgAF/KwCAAA+lQA==
Date: Thu, 23 Feb 2023 10:25:56 +0000
Message-ID:  <SEZPR06MB52697747528490B1A16AF87FF2AB9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
 <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
 <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
 <SEZPR06MB52698CCA6AE59DDC6C15CBE4F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <94238c42-1250-4d51-86e5-0a960dea0ffc@linaro.org>
 <SEZPR06MB52696835ED8E2709D6A454DAF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <b7ca24ea-a265-81cb-3da6-19f938b35878@linaro.org>
 <SEZPR06MB5269052D7ADCD0D0F939E60DF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <5c255eb3-ec9e-d66f-4a2b-ccc32edf5672@linaro.org>
In-Reply-To: <5c255eb3-ec9e-d66f-4a2b-ccc32edf5672@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB3900:EE_
x-ms-office365-filtering-correlation-id: e4aa8c2e-6431-49a0-a673-08db158859d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WoWGJZQsmNP8nDhFcBERZxc/5Ckl8mM3tki1U2MGDTHBAjH606Awn6d4xi7KY6QXoXVoVKOwv8tDefWoVggM5l2y4U4UjBNMtPvaFvRouMcnlKUga0unNXkoHDGiO4Ck0RCnBb26pPx5CK64d7uFnIsZFP57/V3NbCMwGJidJrLXXFTSi9gXCp12tsdA+S8pYdy9exRP2mMxj6Iue1A3WI/DOjWEzlK3+PvJq081EzXWZrUPFxXZb26unceQoNWrOD+NmLECpPdqlw37Ql5xaTdVUZjhsQWufivTZ5+ZqCmIFs/lMiE22OovjcK/h/Th95AItsOGNZ5+FGBI2s98ZnyAYGV4znoBwFl8dgV32oNMOPEK3yqcSOjC+rltm+AtD5yiRa/8pufP0XXbwkjCwMmfVvijXavKLiEzUlMuuSVi7j1rtqueqfY68lEu1ikZipVktckMxo7ZUQBF9Jr2Wy4Bysf1o9oRp9WTk+d7+MJeKa0nxXQs5Rb2s/lhZdJHhEsnfPyIBJaKclJP4hXrqi9Avuo2sYw5arcIsGoIaERFIVzb9euHdLJAZg7I6s/DR8WfRXMbgmEVnEbUa8aWnR37M1DJr/IgCVE3zHpH6LHK7TshGsZg09xt3887aNjBFTklSZBDcpblOvX5BnPhqO8X+S+UrLVSMW18JZ5q4WghwzZFhqsjnzCc1wJhwu4kHHKVxByJ9QFEOer9g6BlcLg/A9N7vWYRs3xMqTiLlrY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(366004)(346002)(39850400004)(136003)(451199018)(7696005)(38100700002)(110136005)(316002)(26005)(6506007)(9686003)(71200400001)(83380400001)(186003)(122000001)(55016003)(53546011)(478600001)(33656002)(86362001)(52536014)(5660300002)(7416002)(38070700005)(41300700001)(8936002)(2906002)(64756008)(76116006)(66446008)(66476007)(8676002)(66556008)(66946007)(921005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SnBvLzYvYWkzYnRBRGNhSjJNTlV1TlNjMTFlaGFreU4xeHRYWXR3d2gwRDJY?=
 =?utf-8?B?QlloWkU3WkJJSlpQM3BoaW1kUFpFUS94UDM4UHVyQlVBTXRiSFhHc2pIRXVY?=
 =?utf-8?B?SUxCQ2RRM01LY1o0NTY4UzAyVGFQZUtRSnVsUDlxWFVXeTJ4aU82aU5OLzdr?=
 =?utf-8?B?RnVtMEE3K1dvbVVjS1ZwNW0zVXhNRldkajJQTEdneWVEeEh4MjZRWEsvL0FC?=
 =?utf-8?B?dTMveHNHdWpNTSsremNaSnA1VGV5UERBajgvZlVDWUhuT0FYbjVGb1lKb1Z5?=
 =?utf-8?B?emcwVjUvNU16YWIwK0ZWY3VPcHdKbmI1TS9nLy9PZ2NmSGVmSUYzMmJlbFR6?=
 =?utf-8?B?d3N0Yy9GM0d3cEJ1cmw5UHRxcUJlcEV5cFd0amRPYmVwUGxZSEtISDRhTVhB?=
 =?utf-8?B?VG9ocmNrN2ZkZGc2M0RpTEpIbHRiRFJjZHBSTHV4ZVZ5VjluNjZiSy9ONWVy?=
 =?utf-8?B?QXl6Mk5oamp1dzN5L2NVMUxsRGtabGNkai81R21iaHd0TVhseDlPM1FtcUk0?=
 =?utf-8?B?YzBkMmNXY1Ruc0pOV2hKcnBvNzF5U0llb2c3RGZkRHFzSGFtdGd1cGY2aUdW?=
 =?utf-8?B?Z2NGN0FHQ0phRWllaVE3bFVSQi9CNm14NEllVnoxV1h3N3NkTTNDR3VFVDJk?=
 =?utf-8?B?WXFEQllVV2VpcnBmWUZEL25rVEhuemtVbExNUTMyWUVITE9JcDBsOHdBenRv?=
 =?utf-8?B?Z0ttbE0xY2I0ZVZZV2MzWFlmakxHRTlKLzNkMExRNjEvU2FFWDJXU1VrZURT?=
 =?utf-8?B?SnJTQXZQemtuN3pjT3IvUWZxeGlubFltbms5Tk42SHJYRk5LUmxtbDA0ZDND?=
 =?utf-8?B?d2s4TzlSOXhsc2pGMGIxL3M5Q3lONFljWERnQ25TcTBhdFdBT1JSK0NNUHhk?=
 =?utf-8?B?MHNMUEhOVm9UR2R5UXJkUWJkbjlQbzZUa3pCRmtiTlRuMldJeUk0SGk5cWtW?=
 =?utf-8?B?dno5V3Mzcm4zdDRFVnNzU24vZHNZc0xCSlpzVFJ2a3ZKam9qRU80OStkL3Zp?=
 =?utf-8?B?Uk5lenFTaHB5TFU2a09GM1RpMFR0SEFGZllOVFJBVnZyM1lMVGlVMFVXYUVM?=
 =?utf-8?B?TkdWckUwTEwxWS9rYnNzTFRzaTFnbnArYTBtbWZiVWJjLy9oRTJabExISVpq?=
 =?utf-8?B?Y0VpQXV4YW1RR0JyTkJHVUNSVisyOWp3VU1ueDJ4S25pNFhpN1pDSjQ3T0F2?=
 =?utf-8?B?elhaWTV3cU5KQkU5a01rNkltVlBXbFNZOE5mdFdnWlRPSlZmdDY0elJ0aTF1?=
 =?utf-8?B?TGtlWk5yZzdEeE4vdjhOdS9Fb0hVZXI2U2RMSUhQWWJVaTd0ajgwZ253bU9t?=
 =?utf-8?B?OGE5cXd6ZmRoYVY1MFhRaWR0NS9TTSt2OTVwVml4MDYzSnViV28wQVdpMjAx?=
 =?utf-8?B?bjhveTBCTERnQ3pCOUJ3QUIvWXdOWUtQYS84TkhWdUpKMkIxcWxWZjE0U09p?=
 =?utf-8?B?QUFRYnBnQjlSWGlWaFRScHByQU9tVFhsZWlxbUVTUDZodkdvdmRVRWN0QU55?=
 =?utf-8?B?anZVV2IxNUlUaGJzcmllUTI0YWl4RnNmU0xjTi9WR0s0Nmg1L2NqRFRqZTdF?=
 =?utf-8?B?ZkFieHdIcEpwbXFOTXZjRDNHRlhzUWpSQnFJa3I2SUhQT2JxbmJMckgra29F?=
 =?utf-8?B?azMvVXdEMWxocUIrVXM3RUxvdDlJSUt1SmR6ZXhjaVBiZFJkVWUweXpmN0V0?=
 =?utf-8?B?NkMxT3ltK1pKRzV3QzF5S3F4Rm9qYmhSZTFJUm9BRlFqcmJaTCs4NFB4K1B0?=
 =?utf-8?B?VlZCV09tcEZQcXhyKzRBenkrTDJpMzJwZ2EzQWVGZzZGdGg5MDJ4Rk9jd3JE?=
 =?utf-8?B?YmRibitHRnhyL0pzSEFta3RieDNuV2pBdU9tQ0J2MkIvOFdaSTFpOWxQTjkw?=
 =?utf-8?B?dkVKTjM5ZE9kYTBISjhiZmJiR3lvTEZObjdyczRCSlV5MEJNZS8vWEJVYzhu?=
 =?utf-8?B?a0dGYytBbTRJL29Ib09YcUsrd2tSWHF4di9UR3FTNDk4TE9LeCtObUpXVVJE?=
 =?utf-8?B?N25YVWtXRUtHUzFMWUZHZ2pCeTRoNncvMldwdndPcmcvTHprTGlteVVvYng5?=
 =?utf-8?B?V3NVYlNKd3NKdldmdHRJYlQzRkpVMzcvNDN0bjdNTEVQNmpwUnAwaGFtTldm?=
 =?utf-8?B?R3p2aXdtOU9pT29ZTkI3V0FuYUlUenpWenY4bUJ6VVYxWWJWZ005TjhSRVVF?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4aa8c2e-6431-49a0-a673-08db158859d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 10:25:56.9341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2xh7aO8t7H33idokzkezH+QsAJwSIB0/skDEoqXx5MZgm0c9kmWdmotPKHTwRg4jRbXH0GCvFd7V7LkrMDGTgIqWFaJfp4g82fmzr/LIeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3900
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
U2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIzLCAyMDIzIDU6MjkgUE0NCj4gVG86IFJ5YW4gQ2hl
biA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2Vy
bmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRA
bGluYXJvLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcNCj4gSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT47DQo+IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDEvMl0gZHQt
YmluZGluZ3M6IGkyYzogQWRkIHN1cHBvcnQgZm9yIEFTUEVFRCBpMkN2Mg0KPiANCj4gT24gMjIv
MDIvMjAyMyAxMTo0NywgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+IGNvbm5lY3Rvci4gVGhhdCBz
bGF2ZSB3aWxsIGtlZXAgc3RhdGUgdG8gZHJpdmUgY2xvY2sgc3RyZXRjaGluZy4NCj4gPj4+Pj4g
U28gaXQgaXMgc3BlY2lmaWMgZW5hYmxlIGluIGkyYyBidXMjMS4gT3RoZXJzIGlzIG5vdCBuZWVk
ZWQgZW5hYmxlDQo+IHRpbWVvdXQuDQo+ID4+Pj4+IERvZXMgdGhpcyBkcmF3IGlzIG1vcmUgY2xl
YXIgaW4gc2NlbmFyaW8/DQo+ID4+Pj4NCj4gPj4+PiBJMkMgYnVzICMxIHdvcmtzIGluIHNsYXZl
IG1vZGU/IFNvIHlvdSBhbHdheXMgbmVlZCBpdCBmb3Igc2xhdmUgd29yaz8NCj4gPj4+DQo+ID4+
PiBZZXMsIGl0IGlzIGJvdGggc2xhdmUvbWFzdGVyIG1vZGUuIEl0IGlzIGFsd2F5cyBkdWFsIHJv
bGUuIFNsYXZlDQo+ID4+PiBtdXN0IGFsd2F5cw0KPiA+PiB3b3JrLg0KPiA+Pj4gRHVlIHRvIGFu
b3RoZXIgYm9hcmQgbWFzdGVyIHdpbGwgc2VuZC4NCj4gPj4NCj4gPj4gSSBtZWFudCB0aGF0IHlv
dSBuZWVkIHRoaXMgcHJvcGVydHkgd2hlbiBpdCB3b3JrcyBpbiBzbGF2ZSBtb2RlPyBJdA0KPiA+
PiB3b3VsZCBiZSB0aGVuIHJlZHVuZGFudCB0byBoYXZlIGluIERUIGFzIGl0IGlzIGltcGxpZWQg
YnkgdGhlIG1vZGUuDQo+ID4NCj4gPiBCdXQgdGltZW91dCBmZWF0dXJlIGlzIGFsc28gYXBwbHkg
aW4gbWFzdGVyLiBJdCBmb3IgYXZvaWQgc3VkZGVubHkNCj4gPiBzbGF2ZSBtaXNzKHVuLXBsdWcp
IE1hc3RlciBjYW4gdGltZW91dCBhbmQgcmVsZWFzZSB0aGUgU0RBL1NDTCwgcmV0dXJuLg0KPiAN
Cj4gT0ssIHlldCB0aGUgcHJvcGVydHkgc2hvdWxkIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSwgbm90
IHRoZSByZWdpc3RlciBmZWF0dXJlIHlvdQ0KPiB3YW50IHRvIHByb2dyYW0uIFlvdSBuZWVkIHRv
IHByb3Blcmx5IG1vZGVsIGl0IGluIERUIGJpbmRpbmcgdG8gcmVwcmVzZW50DQo+IGhhcmR3YXJl
IHNldHVwLCBub3QgeW91ciBkZXNpcmVkIExpbnV4IGRyaXZlciBiZWhhdmlvci4NCj4gDQo+ID4+
Pj4+IFRoZSBzYW1lIGRyYXcsIGluIHRoaXMgY2FzZSwgaTJjIGJ1cyMxIHRoYXQgaXMgbXVsdGkt
bWFzdGVyDQo+ID4+Pj4+IHRyYW5zZmVyDQo+ID4+Pj4gYXJjaGl0ZWN0dXJlLg0KPiA+Pj4+PiBC
b3RoIHdpbGwgaW5hY3RpdmUgd2l0aCB0cnVuayBkYXRhLiBUaGF0IGNhbmUgZW5hYmxlIGkyYyMx
IHVzZSBETUENCj4gPj4+Pj4gdHJhbnNmZXINCj4gPj4+PiB0byByZWR1Y2UgQ1BVIHV0aWxpemVk
Lg0KPiA+Pj4+PiBPdGhlcnMgKGJ1cyMyLzMpIGNhbiBrZWVwIGJ5dGUvYnVmZiBtb2RlLg0KPiA+
Pj4+DQo+ID4+Pj4gSXNuJ3QgdGhlbiBjdXJyZW50IGJ1cyBjb25maWd1cmF0aW9uIGZvciBJMkMj
MSBrbm93biB0byB0aGUgZHJpdmVyPw0KPiA+Pj4+IEplcmVteSBhc2tlZCBmZXcgb3RoZXIgcXVl
c3Rpb25zIGFyb3VuZCBoZXJlLi4uDQo+ID4+Pg0KPiA+Pj4gTm8sIFRoZSBkcml2ZXIgZG9uJ3Qg
a25vdyBjdXJyZW50bHkgYm9hcmQgY29uZmlndXJhdGlvbi4NCj4gPj4NCj4gPj4gSXQga25vd3Mg
d2hldGhlciBpdCBpcyB3b3JraW5nIGluIG11bHRpLW1hc3Rlci9zbGF2ZSBtb2RlLg0KPiA+DQo+
ID4gQnV0IGluIERUIGNhbiBkZWNpZGUgd2hpY2ggaTJjIGJ1cyBudW1iZXIgY2FuIHVzZSBkbWEg
b3IgYnVmZmVyIG1vZGUNCj4gdHJhbnNmZXIuDQo+ID4gSWYgaW4gYW5vdGhlciBpMmMgYnVzIHN1
cHBvcnQgbWFzdGVyIG9ubHksIGFsc28gY2FuIHVzZSBkbWEgdG8gdHJhbnNmZXIgdHJ1bmsNCj4g
ZGF0YSB0byBhbm90aGVyIHNsYXZlLg0KPiANCj4gYW5kIG5vbmUgb2YgdGhlc2Ugd2VyZSBleHBs
YWluZWQgaW4gY29tbWl0IG1zZyBvciBkZXZpY2UgZGVzY3JpcHRpb24uDQo+IA0KVGhhbmtzIHlv
dXIgZ3VpZGFuY2UuIEkgd2lsbCBhZGQgYWxsIHRob3NlIGRpc2N1c3Npb24gaW4gbmV4dCBwYXRj
aGVzIGNvdmVyLWxldHRlci4NCkJlc3QgcmVnYXJkcywNClJ5YW4gQ2hlbi4NCg==
