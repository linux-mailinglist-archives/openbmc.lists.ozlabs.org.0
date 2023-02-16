Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2F698FAA
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 10:22:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHTwk0zPCz3cdg
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 20:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NqzVqSAD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::723; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NqzVqSAD;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20723.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHTw156Fwz3bkM;
	Thu, 16 Feb 2023 20:21:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdiNenjnn1aPxBEUAwCLULQUItxlrja9GKMxf/9NVmj/Z/DGDum7cmJ+2RFAQiDX7VZdgn9ac8a64d+y2qH5NCYcln4+wUvPNBEQIVL86G9hgLqMhDiyDDBmllOEAb/Yn2y2HvZl7SMQVdhdstWiHszs5f8ZZriD5M3U4oybtkSkDVLQLut3lzvU41SXIAsDe1Hbsde+x0ZIoP4LL7ma6FweEEn1JhXgt/dsDnR1FLEO5kXK79Gtqc3HnJ8AzOC+xEyq+JAmCvra65hYaTxwJWsV/sq4pom4FNZ9HSd4lPjeO+F49UewdhTOYcDwHgmYwoxoMaZFbD94S76xD3JIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG3dFA7Qplm9p66ol0+bLyBtpCqEjj6U0qayJdkNUFY=;
 b=kCHUjJhQArAbIY79b/OVjavUZj5XSc/dabLcMjKPr8DCKigQ1/UVuHt0ttgqviBAHJK+rUUswGfjAvSe2WjNylbGSEYuKg0DtW1HwxPQbYfmqaqxIQd628W90YyeW63hxTyR3UOfQiDE9pYfYdVTszVg+b2Fy+ETUaBRqEVo7Ml8PN8+5YiyZ9nUDqbUxZFPF55miDrcu9GpL+gu7uIXCSwKXjMRg20fZuKoP19BpTiAh+isCVnSRq1qE9v8K6pvA18TnYvrKLllt+BCkSapb7nII9axiMv5zFYjoSujNqYLsgWA26Tnmwj3H1o1Ij/UAb6ollHorWUoaXrcZh21rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG3dFA7Qplm9p66ol0+bLyBtpCqEjj6U0qayJdkNUFY=;
 b=NqzVqSADHO75MnF+kaRL6mXnlxNN42Y9ivAswQATScJHpxu4+GIqV1NTtuk99lWu9LhotXO1r6DBUP3avHUo9O8OIQgnrBmicFhIsGNrLj7cdKeX1XU2GesMcs7EWW6C9k9e+nIehMQlV9Zlu9qotvDm7y+Ps+I9Abd0CaaRh2fNEpVJQFYrcJE+qDPeTtSYsC72S+Werk5WbYUMVAHdD9H2/AhEMeL1I01/vwSutMJT4lFxyntfFVJ8x7Q9i5syJANjMnnFYlNZNKypbeTQqPKhNFBSWdv+kSqyBORLj6IXE8kK0O/7wekOvd6HA0z3YbE3yCWSxkoRjS5wQ0anfg==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by KL1PR0601MB5512.apcprd06.prod.outlook.com (2603:1096:820:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Thu, 16 Feb
 2023 09:20:59 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 09:20:59 +0000
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
Thread-Index: AQHZNii3UFiZnjoVzEOnbd7WD7fD4K67XHWAgBQ23XCAAPWKAIAA2h/A
Date: Thu, 16 Feb 2023 09:20:59 +0000
Message-ID:  <TYZPR06MB5274C8D759C5C762C12A1CE9F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <b58fad13-12d5-346b-9452-d345c7bf5327@linaro.org>
In-Reply-To: <b58fad13-12d5-346b-9452-d345c7bf5327@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|KL1PR0601MB5512:EE_
x-ms-office365-filtering-correlation-id: 43188be9-8ef9-4979-1584-08db0fff1df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MVEQFv4HcgdxCaB2lkGjkC5o9RpqZwIvLLeg6GBMyt6A4aCdYlXJJTLmBwvsOdVbhn/eF4A2IaQE+ERip2JZNaR0j9BJ9jfjV3dFgAUIrYe4Wv3oqPy+UUxKDZh2P+usbM5DmZ4ZHehU3TXDU1IZEu4OV8GqIrls5lBR3ROrFYB9LpmVJCM4yT50opnxodLvV+TwQ1RJnoFVxYAWQQXcMqTlgeWD9L/VTjZK5QrSO/IFf+tUm4CT8Vj/HgFcC01TVBBaYMJrQBLMP4tGwxj1H03OUeY2zzrbnOy2kv26rE4TvqV5Zq792JMiB/gfokbzLsOj968KSbU4PzaVS2PRa1GTfwScuatn5vawmbF3s+g3GrX/KI/ug+YpOiI2f0ZPAtspgi4vo6eogjHQZXPRISheLbGhhB/Su1PwR3BE8YNkmiV0KC+92MCRYL4OaQsegboV+12AWdudMZ3ZPkhhfrNdRBEWxX2/oPpjE8ujytVOkeTLyBb7kimGdmB7LPYEKAKUhJcECGQ2Ngq3QpabaQ2U4CtoHZw7LSdPMdfpzFOAfyJNoZ1zu76qpFebY2VXWImGDnFqlhNZ8m4pkXXLN9RgBot53w/r53R1+kDogda2+L/tHlk9Ra8CVDhz5T20+ECJ2njFQaGEqurP618VzJre+dS1Qmo97xhWh7JsgHby5dl3wIT7BsWZ9yRUhcpWrfNzxeKd0mnSCVY1s1XrRX8/aXtw4ooU9ZERntkTtLI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199018)(9686003)(2906002)(26005)(8676002)(33656002)(66446008)(186003)(66476007)(66556008)(64756008)(76116006)(66946007)(41300700001)(316002)(53546011)(86362001)(38070700005)(6506007)(5660300002)(110136005)(83380400001)(478600001)(7416002)(122000001)(52536014)(921005)(71200400001)(38100700002)(8936002)(7696005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QjJkcWZ5MStBMzR4N3ZBSGgrVGNzbk54eDE2eEgwT1dwU213cUFCbFFKaVND?=
 =?utf-8?B?dUNtblp4UlNYdExlL0grdDFpUUZjeVk0dlhneEJVN1JIOGphWEJ3a1pBQW1z?=
 =?utf-8?B?TDhnNXBnSFM1RHVMdDg1em1MR3JsS1FheWtIUDk3VDk3RVRlSXh3RWFpM25O?=
 =?utf-8?B?b2cwd0hVY3ZqNitrelkwb21pTGVkYjJaTHArcmV4YzZpbS9YSUtMOHpvZmcw?=
 =?utf-8?B?eEU5cEUzSS92ZTlPNnhCMUF6cUNGZE1lV0x1dktPV0c0RnBZazY1b3pwaHBo?=
 =?utf-8?B?azNDYTZtdmdqMGdFTS82bFVVQ1NYUS9OVFR5YW9sRW1ReVJFMVNVWDQ5UTJ3?=
 =?utf-8?B?NHhEYUlEOUZMU0RqbWxzUlRwNnd1MjdrK3Z3Rlk2aC9nQkRJWjJoZEp3Wisw?=
 =?utf-8?B?aitrUkJIb1l1QndFWWlQcThWRFdkcjhlNkkyRnJReWorUHRSczFqejlOTnZq?=
 =?utf-8?B?LzRkekQxYlpOVGJMeXBOQVNxZ090UDJMY290TXVWeTcwbmFQWnU5RERPRnpC?=
 =?utf-8?B?MWRPaEtINkNNd2FHYjk4QVJmTVdLRjUvbUptelR2QjlxZXZaMHJLZTZCNWow?=
 =?utf-8?B?YU9XOVRlb1FoODNDWW1CY1NCd1F3MjdZTkZ6dElCcHVteFBPQVBYSFVybWdX?=
 =?utf-8?B?ellFb2tYVEhtT284RlRMcnFlRC9kZkgzVlRMVmNVMTFzcDZyV3hQblcvTXRq?=
 =?utf-8?B?bFNYYkEyZ2s2WXl0dS9iOXIzTGhPckM2YnVGbmc0UkgxRkVIUlhCUXVZYWk2?=
 =?utf-8?B?WEF2cTVpcnNhaXRhVEtwWmhjV0FoYUx5L2EzVnZYMVVJV3lQTTNMMTJXdU45?=
 =?utf-8?B?MkxIOE5nTzRrVkY5OGhTYlVtSCtnRGhhV21qRG9xWXNrbitHSmQvVDdNcDkr?=
 =?utf-8?B?dFVSdG4wZ2JWNS8yTEdYQTM3QURUY1Vxb3lGanBISytoM0VFQS81N3NjampX?=
 =?utf-8?B?RmtxL3k2ZWpPQXlBTWtkaVo4RWlqRXpiY0ZUbjFaQU80WVFPVGtXaWpKYmJN?=
 =?utf-8?B?d0JCOVBaUTdoTjU1QkNVSENtMXQxTjVpMUhRbjZpN3MyREFMSlExamdzY1Zy?=
 =?utf-8?B?L0ZidWRVMEFXY0NDOTFaMWs5VUVkampCL2JNWnlEZEczaVRkclU0bGg5WUc2?=
 =?utf-8?B?TXFLY096TnJNS0hOREFtWU1SREl3RGE4d2RrZzhndFFRM0FXUW5reGlEZ2Jw?=
 =?utf-8?B?T1JnR3pkMzlRL0l6a1NMYkp5eHdRcUowc2tKRFI1ZXFjcUZSTVRaUUlQdWww?=
 =?utf-8?B?LzNWOGVBSFBRaWc5T3pFYllSRWxCNEVtekppbHl2c2JtTEJaRlB3MnFGUUJF?=
 =?utf-8?B?NUQ3bUtVWWgzcVluV1ZyQ0ZKM3owbW5zdDJaclBYUnJXTEJFaXZiTStpVGVV?=
 =?utf-8?B?ZTF2RmJwV3Q3RCtJelZMUTBLT0lvakxtSTk4VTNFUUxiN3FnM1Q5eWRNb1Jm?=
 =?utf-8?B?RThtbTZhMndVVmpvMjlFRzhUeE9YcS9yTW9GSW5Obk9ocUdtZ2ppa29JNS9q?=
 =?utf-8?B?VDRRMW84RGxId2FidzgrZkxMNVRFMWswL0NGYWxzMW45STZyYTI1OFVHdFFn?=
 =?utf-8?B?TERzYW9oc09mYlYxZFlUekVqMnczZkZGR2Q3STY1TE90VFRlSVdVTEhGTDBY?=
 =?utf-8?B?eXVPRHZ4Q1FxcmZwWDhZNzZaQThVUDZ2NzRVQ3BVYUQzaG8xcHJ4Y2tyUnNN?=
 =?utf-8?B?NXJTUFJVOTZOblVEV0l2dm9Ub0lPbVV3M3BVS0Zpd3NuSHFtc3Y3WTNOT3dD?=
 =?utf-8?B?QjVWZG04YU5XQ0JqTHh6Z1FyTkRPbml5cVVLa1pZMEJBQ2kvTmNRZXE1dS8w?=
 =?utf-8?B?eWRJVURvRUlzdFhBMDZPQ3BiYlFYOFNSSjY4eUlzV1NjMXViU3lOWFlyRTd3?=
 =?utf-8?B?VnVTYThHMjRMUmNpNGl0K0Y3MUdJc0xBVHdmTWlmYkpiVkxmWE5qNUJwQ3A2?=
 =?utf-8?B?RUJJNjcxbytyWkNNYU54SGFhd1Z3b2Q1TnljZHdISTBqS2dORGdiKzBnQko4?=
 =?utf-8?B?NVhtc0pMTmpjaE5vNEVxTmh3WFVSZlJaVU05UDBnSXNIbFE2bmtnVUNBUmRt?=
 =?utf-8?B?dXN6cGY1R1lRemE4OGtqZW9tbGErakpBWmRWWGZ1eXdwSENrNklEM2F3U0tn?=
 =?utf-8?Q?IklCFaAqhRsSvVDbtbRplUakv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43188be9-8ef9-4979-1584-08db0fff1df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 09:20:59.6110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzCJtvMhieyFepYsXMTo/iXbWlQoMOvP5tTE/s/La6HitxdyJop1yVh6y6LwWHE5A0MsVcU3+6NGJbwjZLTd5c4fr/fGcQfsQd9UqpTkimU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5512
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

SGVsbG8gS3J6eXN6dG9mDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBT
ZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMTYsIDIwMjMgNDoxOCBBTQ0KPiBUbzogUnlhbiBDaGVu
IDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldw0KPiBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi8zXSBkdC1i
aW5kaW5nczogaTJjLWFzdDI2MDA6IEFkZCBzdXBwb3J0IGZvciBBU1QyNjAwDQo+IGkyQyBkcml2
ZXINCj4gDQo+IE9uIDE1LzAyLzIwMjMgMDY6NDMsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4+ICsg
IC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVyLnlhbWwjDQo+ID4+PiArDQo+ID4+
PiArcHJvcGVydGllczoNCj4gPj4+ICsgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgIGVudW06DQo+
ID4+PiArICAgICAgLSBhc3BlZWQsYXN0MjYwMC1pMmMNCj4gPj4NCj4gPj4gTkFLLiBJdCdzIGFs
cmVhZHkgdGhlcmUuIFBsZWFzZSBkbyBub3Qgd2FzdGUgb3VyIHRpbWUgaW4gc3VibWl0dGluZw0K
PiA+PiBkdXBsaWNhdGVkIGRyaXZlcnMuDQo+ID4NCj4gPiBJdCBpcyBub3QgZHVwbGljYXRlZCwg
YXMgbXkgZGVzY3JpcHRpb24gaW4gY292ZXIgIiBUaGlzIHNlcmllcyBhZGQgQVNUMjYwMCBpMmMN
Cj4gbmV3IHJlZ2lzdGVyIHNldCBkcml2ZXIiDQo+ID4gU28sIHRoaXMgd2lsbCBiZSBkaWZmZXJl
bnQgZHJpdmVyIGNvbXBhdGlibGUuDQo+ID4gVGhlIG9yaWdpbmFsIGNvbXBhdGlibGUgaXMNCj4g
PiAgICAgICAtIGFzcGVlZCxhc3QyNDAwLWkyYy1idXMNCj4gPiAgICAgICAtIGFzcGVlZCxhc3Qy
NTAwLWkyYy1idXMNCj4gPiAgICAgICAtIGFzcGVlZCxhc3QyNjAwLWkyYy1idXMNCj4gPiBTbyB0
aGUgbmV3IHJlZ2lzdGVyIHNldCBjb21wYXRpYmxlIGlzICItIGFzcGVlZCxhc3QyNjAwLWkyYyIs
IHJlbW92ZSAiYnVzIi4NCj4gDQo+IEJpbmRpbmdzIGFyZSBkb2N1bWVudGluZyBoYXJkd2FyZSwg
c28gSSBjbGFpbSAtIHdlIGFscmVhZHkgaGF2ZSB0aGlzDQo+IGhhcmR3YXJlIGRlc2NyaWJlZCBh
bmQgdGhpcyBpcyBkdXBsaWNhdGVkLiBPdGhlcndpc2UgLSB3aGF0IGFyZSB0aGVzZSB0d28gSTJD
DQo+IGNvbnRyb2xsZXJzIGFuZCB3aGF0IGFyZSB0aGUgZGlmZmVyZW5jZXM/IFdoeSB0aGV5IGRv
IG5vdCBoYXZlIHJlYWxseSBkaWZmZXJlbnQNCj4gbmFtZT8gQnVzIGxvb2tzIG1vcmUgbGlrZSBh
IG1pc3Rha2UgdGhhbiBhIGRpZmZlcmVudGlhdGluZyBuYW1lLg0KRm9yIG1pc3VuZGVyc3RhbmRp
bmcsIG9yIG1pc3Rha2VuLiANCkkgcHVycG9zZSB0byBiZSBhc3BlZWQsYXN0MjYwMC1pMmN2Miwg
d2lsbCBpdCBtb3JlIGNsZWFyIHdheSA/IA0KDQpCZXN0IHJlZ2FyZHMsDQpSeWFuIENoZW4NCg==
