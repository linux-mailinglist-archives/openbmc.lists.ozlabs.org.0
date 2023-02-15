Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B66975F4
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 06:44:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGn8066Stz3cMN
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 16:44:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DVLdI+zl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::721; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DVLdI+zl;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20721.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGn7D3MHRz3cFN;
	Wed, 15 Feb 2023 16:43:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUvyRzuEL5abzEChcA3lMjLperH2DpXWPVKwbkvcuNnEVJoKMxg9mbfAvw5Oy9y3VhORKYNqJ7EM56x8cs49FlczjSg4Hw7zdGbMh6D4BWK6LLtBZsJYjUmum66g+cE+oy92kJZmdSL7VsZ1aNopgHugeRCJqiqDnEeLWK41bieH/jHZFEHIzgzXDiyCMXbqqzUMJJ8U0c4Tfj/Te+bp7ryzQLFLpXMTyuDq56xnL0uV4okv9cWnsL9L2p6BHaja0KfoP7n+F1c/OA24oD8BewXkxeMbHL1wVynNQJC94R5Xb2cujJsBbmFPIUlhMqAYJQ3Y/hb2Sfr9JaM3prXCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpe1oit1HBJKq9SLmf7UAFAP+KpVAGJug1k6TSSoCwk=;
 b=Ajq3uOTlb86ukAC6SohWiaUhUHOU26VqD/qqQ+0IpRtgyOVIFW8XqpO34B3rmpdxDfBgvDYPVn9sv/ReM0ALkG7anaReezx7xbq5kJT0L4wBn9HirR2AwKQqRuQ6JhWLuoMUivXYGTCes/80qzIoScdLRqMIPOztmL4swycnk1Q4Ui680fTn9tLuTRMgl4nUbi9Qyf56ORItIIDMQix4rlEXdCfkx9x4pju9zH7BIPF2wotrvgT2yc8Fd1ULpcbxl08Xu6doz0U2jL77I83uLJ+qXorzKBP0eO52BQ5Zn+ZynuamROPKRntVwnZH9jB0ySzSwCvXY03nkKSlg2Gsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpe1oit1HBJKq9SLmf7UAFAP+KpVAGJug1k6TSSoCwk=;
 b=DVLdI+zlA9jvqEUnKT+kCAUp0C6ufuOOgpWunP/MkkxNdamz2xFvCBenyUG9oGqPF7+bAsemTrSTDkfVUMeolwcHwFSz8jWtneVJjbaebyFTcSEepy8HSW66ZghMEmA8U89YwncQmH105GGaBhWNJGG9ZK+FO3wFC/+4oxb+DroaccByCf1vC4e5rv+KpnmzuAqrSxdPueezEXitH429PRFvxaFmkXyTFMeTH5vwtYTuQZM/qU/2tzSm/rKcebdbWvaMonfLjsqsO0BIp7pdZ73I29jW7D6mzOkI/cRGZBdyucTKYvfJpBTKSSXlvnrzyp9H3+/i3t/SReSIjE93Xw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5251.apcprd06.prod.outlook.com (2603:1096:400:1fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Wed, 15 Feb
 2023 05:43:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Wed, 15 Feb 2023
 05:43:12 +0000
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
Subject: RE: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Thread-Topic: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Thread-Index: AQHZNii3UFiZnjoVzEOnbd7WD7fD4K67XHWAgBQ23XA=
Date: Wed, 15 Feb 2023 05:43:12 +0000
Message-ID:  <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
In-Reply-To: <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYZPR06MB5251:EE_
x-ms-office365-filtering-correlation-id: c6a05455-e07f-4270-d727-08db0f178702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iGiDnT5vZskCKOYm0JOqvT/jvKSGObfFI87/SXuKlhJ1WzAYWoE8CryKHwVQSgjHz6PV4S85u0QevsJfB6YfRprE7zMVVVYL6eg8tZon6doLm/5+FLpjMVK95LINZbU6qjTxQ8SQ+Ni9i/FdmBuMNECNAEOIlRfRYt3v0UjenmIaYG2UB/k4X4eUhVhgZXFzoRqEhcpusUNtBZV9kcnFootoxofF9ObFuNzv0L6fHM2RI0HGH0zsY2+VXsXEArt485SEe/dg9KtzS8VWdWCXl1OQ6YJHnUbrv+nRx+XdTlIee5Z3eYue1wfDM6ues6M3B/hfZKztkE49jSj66pGFSmxP8Fc8e6GyiwKpN8ESt/3F1HBzCwmnUxMnm/qgR6+7wwbm8PkJAe5Lx0IC7DTSrMojRBJ3Q16PCGl1DXZaUwoKrUR6cY+aoRIkqp5nKoST2z2SEieCYVBFfPNFMrTgsbBx3AslZy5VUu/oMDC2SjrC+x7WY5eAFXGHPumoshOgCtNcuvbl2YHEpYEzgKUp7vZ390PxHbHvnmCuq2Bry+DG6KtRDDBQK94Sq5zj1Bn8U74FGydkVVw36Mo9U/YjrSocpve+DdWImLv9j4DiaO8MBmk775bZOLW+ZuGa7NHkoemBS9OAmio8kJgMMJApPXW9g09uDnmQVWlbYkZptfjMgj+e0cueG3IkJGHtYn5aNiE74SDnDL8DOGCazAROg7yrxwDh2FOFbwk0NfxZ9kbzsSBHW3U1Wsgt5icu3JGh
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(39840400004)(396003)(376002)(451199018)(316002)(83380400001)(86362001)(110136005)(53546011)(71200400001)(186003)(6506007)(9686003)(26005)(478600001)(966005)(33656002)(55016003)(7696005)(2906002)(38100700002)(8936002)(52536014)(7416002)(921005)(38070700005)(5660300002)(66476007)(41300700001)(122000001)(76116006)(66556008)(66446008)(8676002)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Sk96cWcxUFN5czNsQjhlSXRsbmZGY0Nhb28xdzJMTVdPc2Z6aGdEZjFLUXVN?=
 =?utf-8?B?Ty8xNjlQK3pWVkVkSEVxOWNLNlN1clJSVUdDUXhENlZYQXFqRmxZK1NKL052?=
 =?utf-8?B?SEZNZU1FcWV0c0QzS0FZcGl4NWxYa056dUI3dmpvaFVOSUlTMERUUTFLWmgx?=
 =?utf-8?B?ZjhoYmNXTkhUTFhoMXhCN2tnVTRaZktNdGhvdFYyOUdFMU1IOUJDc25UaXY3?=
 =?utf-8?B?dERlUlZQODZJVnpGZ0lHdlJoOGJkeXltNlo1Ky9UMUZFcjFRNk9IYmxnRDN5?=
 =?utf-8?B?ZDFVL1BlUXoybk9FQitzd3dDQjgrWFRaSVh4UjVrb09Lc2RCWWVDQ0FaL0pW?=
 =?utf-8?B?ejBwN2M3QlBUMUt5cUlOVEpWSGxDSmpOUUR6dDVmV1M1STJIQ0RXbHNIc1Bv?=
 =?utf-8?B?UDlLaThXb3FNTXJOMDZrWkxpZjVmVEFXNGZLQ0o4SXZDM1Bod2JKUWQycTZR?=
 =?utf-8?B?QkhiajdTMm50d1JPWXErKzJPK3c1SUdIaEVxNnZhVjA1OU5iOEd0bFBuSXFy?=
 =?utf-8?B?MjliVTVIVlNXbFllZjc0ODVRdHRjY0hMSEkzMXBLbHVaa2pNNjd3SVFaTFYv?=
 =?utf-8?B?TWNxNUozQ2lBNFRsTVBtVGpzaExCNFR3QStHRDVwQlJKVzk1aUdWRlFnVTJD?=
 =?utf-8?B?NlhoOXBUT2RtZCtqN1hLOWM5WE9rZVpSeVdHMFcwc0l1TWpCQ1cwd2pQT3Mw?=
 =?utf-8?B?VW9IejZpMG9NYkROYnNROUZyYnBKUmZNT3FIMFYyL0tkS21DZEJLTytoZXM5?=
 =?utf-8?B?cTh6dTZRN3VhYTdjdDRGS25mSklQNXpwaWY0d0wyaUZUbVI2OWRlOGJRcHZ0?=
 =?utf-8?B?ZnQzMmRzR3NwdUtycnBIK20yeHBDYThZT0tpNnNBTU02aW52ci9FUVN5Y0tx?=
 =?utf-8?B?K2x3eWJpVk9BWjFrVDY0YVlFeW5tT0p1RHcxTjNjQnRvMHE0V0J0Rmc1MmxB?=
 =?utf-8?B?WUoxb282TFRvd3NZdXdmZDlkbDYzTk5iK2dLZXJ4ejBjRkVlNXRreGxjalRM?=
 =?utf-8?B?QjM5VG9PbWp6eU1JckE2bnZWVW9jMGdCR3lxOXE2SmlTQi9jaVREWTlZVitz?=
 =?utf-8?B?Z2hvV20zaVNoL1RnWGNjbWEvNUhicitlNkk0ZzdKMDVRdmNzMkN2QmpVNmRD?=
 =?utf-8?B?dnVUSTdPQ0E4VG0zR3BiWW9INXMramtmWWNObjRBekdrN2JDNFJCN0k4d215?=
 =?utf-8?B?bmtaa2V6dnA2VHhDUkc2ZEx0UnYrdktaMU1YblZXeFpSY1pYUllvMFlWYnY4?=
 =?utf-8?B?emZ0Y1BjUWh1WUU0bmJtYlZubUtIRDBBVExLaG1qSTdCWE5oNnA3d0RrdEdy?=
 =?utf-8?B?cHN6cXplMkRnZmNkb3drcTFEdXJVQmNZZi85MEI5MHh1WTk4NWFZOXRHRzdZ?=
 =?utf-8?B?b3NwTzBJN2xHZCs2MWZZR1U2M2Z4NmswcERaSkl6Y2VTVVI1Y05uSTdLTHdP?=
 =?utf-8?B?dXRRa0FocVpOd01JS2g3b1BpZ1FYWUdtN0xNRVh4dTZCQy9BZ0lxdDhROHRk?=
 =?utf-8?B?aFBqamdvbFMyUmRua0lSWk9FMFR0T2s3TlBpSGVDbUtDQWovVnNsajFvWThn?=
 =?utf-8?B?eHJpWk55ZHZTOEdUUzRMakViKzRTb0N1cVprcy9Na3hkOEZ1Uk5XNk85enBn?=
 =?utf-8?B?M2I4WHJqc05vWitqVkdkZjlPbkVRNmwyNEhPZUNDMTJqU05Qekt0c0YwZndM?=
 =?utf-8?B?MTNPMndESVBXT1N0MWhjMGdLVXRObk1ab3lZRktFMWUvaWdST2t3R0NFSldl?=
 =?utf-8?B?azI3TzF0TXFpckdJbGZPNlFFWDR4TzFteGx3OEJNWnA0dTJYZDM5VEhwUlhq?=
 =?utf-8?B?VkFtK2IvUkhySUFMY2VNOTNUUi9UQW1YNjQ1WnhTQ0VvZ0oyUnI4Q2xHbmhG?=
 =?utf-8?B?TDlVVnphWTRIaFI5WVZOWVZQZjNvOUZaYTVmaHMrMmRxaWZ4TmtPNDRxMmVI?=
 =?utf-8?B?SDVJelJjdWVIMFBreEdOK0Y3R0IyR2hIbGk4NS9ITWJiOGFscFNnbGpnNDJn?=
 =?utf-8?B?TFA2Y2hoVW42c1ZCN0E4SWJveU9QbkI5b2x3Umd2Z0w1Wll4T1B4YnN2U1BI?=
 =?utf-8?B?ZDdQcys3L1RuS3RaSkhRMjNLSGhTR01wWUo5TWVVNTc2YTN0UUV0TS9lekRI?=
 =?utf-8?B?cDVRM1JKb3QyN1ZnbVBGcWNUaWtrNS9tdVlkSExlUUNnaUFGK21hdjNjR3lU?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a05455-e07f-4270-d727-08db0f178702
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 05:43:12.6675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAOAGX0ktvK7J6Qwgw7v5o3pdH0qcmS/GdRCp+YiF6Xp07cGbvBxDO3QbXqgVdNZaroMFPgsk9PIjyunZCd249ONo95fkSHcEaZnjg/dM5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5251
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
U2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIsIDIwMjMgNDo1OCBQTQ0KPiBUbzogUnlhbiBDaGVu
IDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldw0KPiBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi8zXSBkdC1i
aW5kaW5nczogaTJjLWFzdDI2MDA6IEFkZCBzdXBwb3J0IGZvciBBU1QyNjAwDQo+IGkyQyBkcml2
ZXINCj4gDQo+IE9uIDAxLzAyLzIwMjMgMTE6MzMsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBBU1Qy
NjAwIHN1cHBvcnQgbmV3IHJlZ2lzdGVyIHNldCBmb3IgSTJDIGNvbnRyb2xsZXIsIGFkZCBiaW5k
aW5ncw0KPiA+IGRvY3VtZW50IHRvIHN1cHBvcnQgZHJpdmVyIG9mIGkyYyBuZXcgcmVnaXN0ZXIg
bW9kZSBjb250cm9sbGVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFu
X2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9pMmMvYXNw
ZWVkLGkyYy1hc3QyNjAwLnlhbWwgICAgICB8IDc4DQo+ICsrKysrKysrKysrKysrKysrKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJj
LWFzdDI2MDAueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAueWFtbA0KPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAueWFt
bA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5iN2Q3
YmMzMDNlNzcNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAueWFtbA0KPiA+IEBAIC0wLDAg
KzEsNzggQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvYXNwZWVkLGkyYy1hc3QyNjAwLnlhbWwjDQo+ID4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+
ICsNCj4gPiArdGl0bGU6IEFTVDI2MDAgSTJDIENvbnRyb2xsZXIgb24gdGhlIEFTVDI2WFggU29D
cyBEZXZpY2UgVHJlZQ0KPiA+ICtCaW5kaW5ncw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+
ID4gKyAgLSBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiArDQo+ID4g
K2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVyLnlhbWwj
DQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBl
bnVtOg0KPiA+ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLWkyYw0KPiANCj4gTkFLLiBJdCdzIGFs
cmVhZHkgdGhlcmUuIFBsZWFzZSBkbyBub3Qgd2FzdGUgb3VyIHRpbWUgaW4gc3VibWl0dGluZyBk
dXBsaWNhdGVkDQo+IGRyaXZlcnMuDQoNCkl0IGlzIG5vdCBkdXBsaWNhdGVkLCBhcyBteSBkZXNj
cmlwdGlvbiBpbiBjb3ZlciAiIFRoaXMgc2VyaWVzIGFkZCBBU1QyNjAwIGkyYyBuZXcgcmVnaXN0
ZXIgc2V0IGRyaXZlciINClNvLCB0aGlzIHdpbGwgYmUgZGlmZmVyZW50IGRyaXZlciBjb21wYXRp
YmxlLiANClRoZSBvcmlnaW5hbCBjb21wYXRpYmxlIGlzIA0KICAgICAgLSBhc3BlZWQsYXN0MjQw
MC1pMmMtYnVzDQogICAgICAtIGFzcGVlZCxhc3QyNTAwLWkyYy1idXMNCiAgICAgIC0gYXNwZWVk
LGFzdDI2MDAtaTJjLWJ1cw0KU28gdGhlIG5ldyByZWdpc3RlciBzZXQgY29tcGF0aWJsZSBpcyAi
LSBhc3BlZWQsYXN0MjYwMC1pMmMiLCByZW1vdmUgImJ1cyIuDQoNCg0KQmVzdCByZWdhcmRzLA0K
UnlhbiBDaGVuDQo=
