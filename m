Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552996A6694
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 04:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRKmP0xYfz3cDT
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 14:41:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DrG5PRzG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::710; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DrG5PRzG;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20710.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRKlg0s6Nz2ymk;
	Wed,  1 Mar 2023 14:41:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsRsmhI6VWY+/IrX4Oss/Wk6ic5Aw9nkH2wQjL7nOaEwPgtBzJ1LRnmps7Njwd6CK8j1AvWSW9+ejFv2VM1RGXlFyGXDG3LmHx2dKam1HCnC0KQg/OhsHY0ubFJPZHqOplbh7zjRE/o9MX8zpccPf2TTd49an/oRq0ubWTuqRBHyoMU4bxaPGLFSt0oIE3N6/IJf7BfU9NwKrWuDx+IvxVyz7POAnMYKOQxqVtBzULksfhlmNJZBd7Wp+XFKWLJMDMLSfO/YYy0rKr3hGAj0wlqbVBM5VP1mewiap7chXfRShVs9Ym2+RAy0bkcIU+vBtrORYz4c66rPZqJ/PrllZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9WMCzGc6ofOJDJXxBmYLTBEoxcvJJPzjP+E9DicYpw=;
 b=EWlF5z7GRz5oZukbLXIvT90zOHHAZBCdjeBwC8ApK3Rz3aUPX6y6Z1e9wvKdODTxKyh5AQIvpyxQY7ly/0PCOhfS2pYS2sN0V6Y4+aDoLNboXaha9MrDKzrGvyw/BqV2QbbS+fVXLcCjDf3TWVY3RN1DtgAHLl9VowTfiPOPqZJ5VEjFbAvSmMFo4l1JZ39KPVkjIgl9tol3GRDa556QtKYcHmd1fOP0aWGgKor8lO6GvHGlO24kksrzxIYRbUKp3FYmz+cKC1IzcqwwdxPomHYBiowFBRYWvUo103gCuKFEEJIRrfb2QlVGFpw5fevZjNHFXlBPY9PazPYT0cN/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9WMCzGc6ofOJDJXxBmYLTBEoxcvJJPzjP+E9DicYpw=;
 b=DrG5PRzGNPR+8Vq3PZc9Nj52CpHAVVOpkAfmobjsF8hYt6YLQE1p+deaZgL5F92HZHePtmDlYzcZwcbWYKfxDzIuCgye81FCfzmos1rOq84z0RIJ9sdHYnQ8oQSiv4DfS92dV0qBfZYQ/QVrYHnbY5wNHdNBxUrUDb+wDfiAlZHlxgJujGtmDnDEQvhmclk2/hI3eZRMmW0V2k6u4eVRdsPVHP8fJNlX779aHIcl6Hf0wWIYZ4h14t3+N47CNIBftRq9GWEvDjhRYy6Ujc5OY91xA40eaZG+QvbU3Iv2DprJ+vANZO0H56B5OqoDNtr+vtQJCsp8hJyCxWv/u5zT2g==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB5894.apcprd06.prod.outlook.com (2603:1096:820:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.16; Wed, 1 Mar
 2023 03:40:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Wed, 1 Mar 2023
 03:40:54 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Andrew Jeffery <andrew@aj.id.au>,
	Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7gzfMAgAFcBjCAAB7SAIAC81VAgAALJoCAAAIuIA==
Date: Wed, 1 Mar 2023 03:40:54 +0000
Message-ID:  <SEZPR06MB52694CC2B6AE36B14F8D2303F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
	 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
	 <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
	 <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
	 <f4cb3efc9825efa582aa94bd03657b1319ff38fd.camel@codeconstruct.com.au>
	 <SEZPR06MB52695281E21B27DB57A7B2FFF2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c18b064b6b01bd547b2f03006dbf4bb6fdf9b91d.camel@codeconstruct.com.au>
In-Reply-To:  <c18b064b6b01bd547b2f03006dbf4bb6fdf9b91d.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR06MB5894:EE_
x-ms-office365-filtering-correlation-id: 45ae89ec-9088-4e3b-e824-08db1a06c2bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  FfgN5A75DgdE1Esaq9aOccWNBm732zZY6bFPlE66BC9Najp/d8c4az2cdpQUCsdLGLedrfpR3j4tnAI3rWuXLwE4Vo7y8hQk3WobkF2h4XXM3pSLNqDwUU1125KuCkHWXh+FMV5i2R1DsHzDe1WxCsgrCi9Kf3hGOad4VxDUgOK03Tk9ZP1UcIG4qGyLqD7RdsBGfVXz06WQz3LDbjLGQAGZ3Zl9KAAKKrHPBdNb0iPRWHYMOosBTiDzvj1+0bkXWMA3zwu7TzK1Kiio8o6gQnOB84FCWRv6TecKQsn8JI2d3qpWrBmrnRPOv+YgpsCczer98gwWXACPlBWJLYegGy8C0icOlCoOVDWHXy1fwS01WlcUluDmpE+v9wdl0xopskkbzkSBFQFgwnz6P+U/ozhuMv3m6IkYXMjtE/gtxZcN/Eo2EGeJO8jpAm55d1gawMqjglAMFDCHwqIA8HhqePau2zflSv93CiIfbN0XmmlwNzyjTJ5Ccn+v+PrGnYpOTRSoPwHTDj+Lk5mdJ11QUyPb1wfxhlcQln5wfUKFnrzGTnupY2+5k6mzA419rFnnd8Vmidx0TD3h4CbIKwVS4ywWTeB2PM61BN4zY3UDEcKghokUd/U4ARCt9LUpEKAFQYmsJbvonbb1zt0T9TkEoo8gCeks9+LVIPRBhsgw7Dc8AgxbtSXEFXAmAx5XN0Ly5mST1+ewZytI2QwdlKWlNd+1E8yEv+/mfeRN/Yeu0Qk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(396003)(376002)(136003)(346002)(366004)(451199018)(921005)(8676002)(76116006)(66446008)(64756008)(66946007)(66476007)(33656002)(52536014)(66556008)(38100700002)(7416002)(8936002)(478600001)(5660300002)(41300700001)(86362001)(38070700005)(122000001)(186003)(6506007)(9686003)(83380400001)(26005)(71200400001)(55016003)(7696005)(110136005)(316002)(53546011)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R1daUzlTY2hBNDRnMHFPd1I0ZUdiaGxZQjhsWnBuNlNJRjh5cVg0ZDhSMGRh?=
 =?utf-8?B?cllDcjc2Z2xUblpmMEtRM2E4amRCRXFqalJFcjkya0JEQ0hOdXYrRmhLRWRM?=
 =?utf-8?B?ZHM4anJaZVdKRm5qdlpMcmV3dVd5bHhXeXlmS1E2WitWayt5MmQ4cXNyOE1H?=
 =?utf-8?B?RjlKaHUxeTNTRGRiT0tUZDg4V1BYNjQzTWxPTDZvRDluekYySzlmdHl0eWpT?=
 =?utf-8?B?Z0wwTUtOdjhxTlJwZEZmRms5eFlPbisxYkhwMyt6dVpFS0tpQXhLVWYzRlBZ?=
 =?utf-8?B?MitaWlRrVEpSYmJVSWxNQVdUZTFvNzNjZUNHLzMxQmNaOEVNVVZCYmVSUVRk?=
 =?utf-8?B?T0hrZGJ1dU8vSGJEUllzcnNLRnIzazRCNXlIcXAzaStsNk10VzRqOFFvYkUr?=
 =?utf-8?B?c2FBbmtqR2R5NE1ackhib1E1d2pkUndCb08xWGd2ZmVVYlpHZ1BETnRSZXpG?=
 =?utf-8?B?cG12cnF3SGtqRGRVV2I5TWZteWVNMzIrd1VBM2ZQUFJQT2JRTDBSM01lS2pr?=
 =?utf-8?B?dFpDREtnd0lyN25aVW1ZUXBQNURFTCs2L3ZQMWk1QlcrTFczUU9oakJpSlFQ?=
 =?utf-8?B?eUFMeEdhckZRckVKVVp3MzJOSkgyWGJTNy80QndsRDZXZ0o3akdhZnhDSUZQ?=
 =?utf-8?B?dnJNQlFGT1A1NHdRN2oyNDFFRXAwUnp1WTFwbUg0NHBaSEQzalhidHVWYi9Z?=
 =?utf-8?B?L3kva1I0SEx2Z2R3c2MxYkhEWU9FNk5HRHdnVW41cFIxMHdRMDV6ZmJWeCtt?=
 =?utf-8?B?WkprQzBQWWp5TUF0c3NMRXM5czVzYlZKTzVkTU1vaGxhVzRpRWEyU3greGNX?=
 =?utf-8?B?UVhXYUlVNHBhMS9tR0tNM2pjQjBTYndiZkNoaXBtQTVRYjkrcjdhRXFuNTRm?=
 =?utf-8?B?bWt1bkxBeFIyR1p4aU03QkhvSHZ0Z1NpUkhHTTYxWXlWUkJqbkJUVW1qZmM4?=
 =?utf-8?B?SmUwZStqSkVCSk5LNUJ1M3NJLytiZUZRQWp5OXk5LzVUL3dPWWJRNmtSWUtV?=
 =?utf-8?B?TDRjRmM0cGJhdmFtdTNOempPcjRTelM2eHZVUEFyVXlHS084UHE4cEdKdEJI?=
 =?utf-8?B?cmNVSkRRTk9YbnhJNUc1SWIxTWdLK3M5eFNZQUxuOU41MWp4L0llUkhXWDk0?=
 =?utf-8?B?aGs0dHBFMk4yMGEyclZLengybFBndVF6SzBKQ043Z0ptemI4UStPdDBmdkJX?=
 =?utf-8?B?Q2hoeHM0YkxJRlBSZ2ZiRnl0WmxGOVBlMlFyN25hT3RBbDdFUW9WNmJwWnJB?=
 =?utf-8?B?b1BGWmxwUWdGekNySzZDYnh5c2hXeVJSL1p0Uk9KQUpmTXJmdmN1bmxVWWtC?=
 =?utf-8?B?QXh4bSsrUDVPdEJYbVBpRExYRzhhZThXOEdZUkJxMFgvazhnalQ4eVZVdldX?=
 =?utf-8?B?amV4VWpnNi9HeXBGd1R1cUc2Tjl5ZFJlRVA4SXo1MXM1ZTl4RzQ4Y241SDNZ?=
 =?utf-8?B?NW1xdXpERmk2dkg2ZnJUNCtHNWF0ci9qU1hTZUs4UEprY216TlhpVklpck0y?=
 =?utf-8?B?S1loTTZoTlBlR2dzUGhvamJ5SThpYkt3Qi9najU3ZTZMWG5ubjdhQytZaTdj?=
 =?utf-8?B?UVM3cmdlRmIrSVVIOGZyR2dFbElkdDFhZmkrSFVFbjVTbFJsNThOelh0c0VE?=
 =?utf-8?B?c25xbm1PTldFWTd1Wi85TDdHbXdwQzkveUZsTjNWU0tBQmRxM25QTGUwdTli?=
 =?utf-8?B?NEpydEtPQ2IzMXQvQjRhcnFLTzgzS3J3QTIzVWgxbFRaTmJGRFBmaFJPVnFZ?=
 =?utf-8?B?ZjJNc3V4b295MjlUdFlqTFNJbml3TkpVeGxWa1BacU12bloxQ3VCVHpQbnVC?=
 =?utf-8?B?TGFYTEhzRC93bGw4R1J2U1VKalFVR3F4SVdKQWxIaFM0QTE3dURpU0xOUUdX?=
 =?utf-8?B?WEFDSE5LTnBiQ2hJTHhBTGpzdk4yNmNKTjJrYnpMcm9aY3VvbThlT2V1MXBJ?=
 =?utf-8?B?eUlyc0dmSFFEQ2cyMDhFQU5uR242bDh2eVhlb0lHS095ZEd5U2QxWEhFZXVK?=
 =?utf-8?B?bFRUczBmK3ExZ0tWMU5MMEVMd3ExakFrZXhiQk1IV2JJa1BibjdLYmtpb3RL?=
 =?utf-8?B?T2dMS0FCdjJMY2ZKMlhwM0k3c1dZVzRpK1FsQmlzUXhiNWIwNzB4ekRQMTQx?=
 =?utf-8?B?Z0J4MDlHZFJhaStVekFVTnlFWlJ6c2RYdUhSdmVJaHVOa1VpdldSdFNZQk84?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ae89ec-9088-4e3b-e824-08db1a06c2bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 03:40:54.1902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSjijKj29Hhb8K77Nr95eVkKnr2fsMTY3QSYmJiDkc4MO+JqgtKCO2F7rtStBFe3rMdsTTKVrwcndFw6/mS/dyVl1zjGthBfMIyOTi0jsNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5894
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
cmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gU2VudDogV2VkbmVzZGF5LCBN
YXJjaCAxLCAyMDIzIDExOjI0IEFNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0
ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBCZW5qYW1pbg0KPiBIZXJyZW5zY2ht
aWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PjsNCj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3Jn
OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBs
aXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9y
IEFTVDI2MDAtaTJjdjINCj4gDQo+IEhpIFJ5YW4sDQo+IA0KPiA+IFNvcnJ5LCBEbyB5b3UgbWVh
biBhZGQgaW4gZGVzY3JpcHRpb24gbGlrZSBmb2xsb3dpbmc/Pw0KPiA+IMKgIGFzcGVlZCx4ZmVy
LW1vZGU6DQo+ID4gwqDCoMKgIGRlc2NyaXB0aW9uOiB8DQo+ID4gwqDCoMKgwqDCoCBJMkMgYnVz
IHRyYW5zZmVyIG1vZGUgc2VsZWN0aW9uLg0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBFUlJBVEEg
IkkyQyBETUEgZmFpbHMgd2hlbiBEUkFNIGJ1cyBpcyBidXN5IGFuZCBpdCBjYW4NCj4gbm90DQo+
ID4gdGFrZSBETUEgd3JpdGUgZGF0YSBJbW1lZGlhdGVseSIsIG9ubHkgMSBpMmMgYnVzIGNhbiBi
ZSBlbmFibGUgZm9yIERNQQ0KPiA+IG1vZGUuDQo+ID4gwqDCoMKgwqDCoCAtICJieXRlIjogSTJD
IGJ1cyBieXRlIHRyYW5zZmVyIG1vZGUuDQo+ID4gwqDCoMKgwqDCoCAtICJidWZmZXJlZCI6IEky
QyBidXMgYnVmZmVyIHJlZ2lzdGVyIHRyYW5zZmVyIG1vZGUuDQo+ID4gwqDCoMKgwqDCoCAtICJk
bWEiOiBJMkMgYnVzIGRtYSB0cmFuc2ZlciBtb2RlIChkZWZhdWx0KQ0KPiANCj4gSSB3b3VsZCBz
dWdnZXN0IHB1dHRpbmcgc29tZSBiYWNrZ3JvdW5kIGFib3V0IHRoZSB0cmFuc2ZlciBtb2RlIGFz
IGENCj4gdG9wLWxldmVsIGRlc2NyaXB0aW9uIGluIHRoZSBiaW5kaW5nLg0KPiANCj4gVGhlcmUg
aGFzIGJlZW4gYSBsb3Qgb2YgZGlzY3Vzc2lvbiBoZXJlIG9uIHdoeSB0aGUgYmluZGluZyBzcGVj
aWZpZXMgdGhlDQo+IHRyYW5zZmVyIG1vZGU7IGl0IHdvdWxkIGJlIHVzZWZ1bCAoZm9yIGZ1dHVy
ZSByZWFkZXJzKSB0byBoYXZlIGEgYml0IG9mIGNvbnRleHQNCj4gb24gd2hhdCBtb2RlcyB0aGV5
IHNob3VsZCB1c2UuDQo+IA0KPiBQZXJoYXBzIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gICAgIGRl
c2NyaXB0aW9uOiB8DQo+ICAgICAgIFtnZW5lcmFsIGJpbmRpbmcgZGVzY3JpcHRpb25dDQo+IA0K
PiAgICAgICBBU1BFRUQgYXN0MjYwMCBwbGF0Zm9ybXMgaGF2ZSBhIG51bWJlciBvZiBpMmMgY29u
dHJvbGxlcnMsIGFuZCBzaGFyZQ0KPiBhDQo+ICAgICAgIHNpbmdsZSBETUEgZW5naW5lIGJldHdl
ZW4gdGhlIHNldC4gRFRTZXMgY2FuIHNwZWNpZnkgdGhlIG1vZGUgb2YNCj4gZGF0YQ0KPiAgICAg
ICB0cmFuc2ZlciB0by9mcm9tIHRoZSBkZXZpY2UgLSBlaXRoZXIgRE1BIG9yIHByb2dyYW1tZWQg
SS9PIC0gYnV0DQo+ICAgICAgIGhhcmR3YXJlIGxpbWl0YXRpb25zIG1heSByZXF1aXJlIGEgRFRT
IHRvIG1hbnVhbGx5IGFsbG9jYXRlIHdoaWNoDQo+ICAgICAgIGNvbnRyb2xsZXIgY2FuIHVzZSBE
TUEgbW9kZTsgdGhlIGVuYWJsZS1kbWEgcHJvcGVydHkgYWxsb3dzIGNvbnRyb2wNCj4gb2YNCj4g
ICAgICAgdGhpcy4NCj4gDQo+ICAgICAgIEluIGNhc2VzIHdoZXJlIG9uZSB0aGUgaGFyZHdhcmUg
ZGVzaWduIHJlc3VsdHMgaW4gYSBzcGVjaWZpYw0KPiAgICAgICBjb250cm9sbGVyIGhhbmRsaW5n
IGEgbGFyZ2VyIGFtb3VudCBvZiBkYXRhLCBhIERUUyB3b3VsZCBsaWtlbHkNCj4gICAgICAgYWxs
b2NhdGUgRE1BIG1vZGUgZm9yIHRoYXQgb25lIGNvbnRyb2xsZXIuDQo+IA0KPiAtIGFkanVzdGVk
IGZvciB3aGF0ZXZlciBwcm9wZXJ0eSBpbnRlcmZhY2Ugd2Ugc2V0dGxlIG9uIGhlcmUsIG9mIGNv
dXJzZS4NCj4gDQpJdCBpcyBtb3JlIGNsZWFyIG5vdywgSSB3aWxsIGFkZCBpbiBuZXh0IHBhdGNo
Lg0KDQo+ID4gPiBTbywgaXQgc291bmRzIGxpa2U6DQo+ID4gPg0KPiA+ID4gwqAtIHRoZXJlJ3Mg
bm8gcG9pbnQgaW4gdXNpbmcgYnl0ZSBtb2RlLCBhcyBidWZmZXIgbW9kZSBwcm92aWRlcw0KPiA+
ID4gwqDCoCBlcXVpdmFsZW50IGZ1bmN0aW9uYWxpdHkgd2l0aCBmZXdlciBkcmF3YmFja3MgKGll
LCBsZXNzIGludGVycnVwdA0KPiA+ID4gwqDCoCBsb2FkKQ0KPiA+ID4NCj4gPiA+IMKgLSB0aGlz
IGp1c3QgbGVhdmVzIHRoZSBkbWEgYW5kIGJ1ZmZlciBtb2Rlcw0KPiA+ID4NCj4gPiA+IMKgLSBv
bmx5IG9uZSBjb250cm9sbGVyIGNhbiB1c2UgZG1hIG1vZGUNCj4gPiA+DQo+ID4gPiBTbzogaG93
IGFib3V0IGp1c3QgYSBzaW5nbGUgYm9vbGVhbiBwcm9wZXJ0eSB0byBpbmRpY2F0ZSAidXNlIERN
QSBvbg0KPiA+ID4gdGhpcyBjb250cm9sbGVyIj8gU29tZXRoaW5nIGxpa2UgYXNwZWVkLGVuYWJs
ZS1kbWE/IE9yIGlmIERUIGJpbmRpbmcNCj4gPiA+IGV4cGVydHMgY2FuIHN1Z2dlc3Qgc29tZXRo
aW5nIGNvbW1vbiB0aGF0IG1pZ2h0IGJlIG1vcmUgc3VpdGFibGU/DQo+ID4NCj4gPiBJZiBzbywg
anVzdCBsZWF2ZSBlbmFibGUtZG1hIGFuZCBvbmx5IHN1cHBvcnQgZm9yIGJ1ZmZlciBtb2RlIGFu
ZCBkbWENCj4gPiBtb2RlLCBhbSBJIHJpZ2h0Pw0KPiANCj4gWWVzLCBmcm9tIHdoYXQgeW91IGhh
dmUgc2FpZCBzbyBmYXIsIEkgdGhpbmsganVzdCBhIHNpbmdsZSBzd2l0Y2ggYmV0d2VlbiBETUEg
Lw0KPiBub3QtRE1BIGlzIGFsbCB5b3UgbmVlZCBoZXJlICh1bmxlc3MgdGhlcmUgaXMgYW55IHRp
bWUgdGhhdCBieXRlIG1vZGUgaXMNCj4gcHJlZmVyYWJsZT8pDQoNClllcywgSSBhbHNvIHRoaW5r
IHNvLCBidXQgaWYgSSBvbmx5IGZvciBkbWEgdG8gYmUgc2luZ2xlIEJvb2xlYW4gcHJvcGVydHku
DQpTaG91bGQgSSByZW1vdmUgYWxsIGJ5dGUgbW9kZSBjYXBhYmlsaXR5IGluIGRyaXZlcj8NCg0K
QmVzdCBSZWdhcmRzLg0KUnlhbg0KDQo+IElmIHRoZXJlIGlzIGFscmVhZHkgYW4gZXhpc3Rpbmcg
RFQgY29udmVudGlvbiBmb3IgaW5kaWNhdGluZy9lbmFibGluZyBETUENCj4gY2FwYWJpbGl0eSwg
SSB3b3VsZCBzdWdnZXN0IHVzaW5nIHRoYXQuIE90aGVyd2lzZSwganVzdCBhIGJvb2xlYW4gZmxh
ZyB3aXRoIGENCj4gc2Vuc2libGUgbmFtZSB3b3VsZCBzZWVtIHRvIHdvcmsgZmluZS4gVGhlIERU
IGV4cGVydHMgcHJvYmFibHkgaGF2ZSBhIGdvb2QNCj4gaWRlYSBvZiB3aGF0IHdvcmtzIGJlc3Qg
aGVyZSA6KQ0KPiANCj4gQ2hlZXJzLA0KPiANCj4gDQo+IEplcmVteQ0K
