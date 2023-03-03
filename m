Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393366A931D
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 09:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PShfS004lz3cgx
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 19:56:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=y+zjBPYg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=y+zjBPYg;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20709.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PShdl2btwz3bhJ;
	Fri,  3 Mar 2023 19:55:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8hyGPHvPiua6lQw+Uc0loPKBek9u0yM7XqGJWWJS+ScXjqEB0CDoOmzGE8CwXFstmHtMvMydjVaNKfVjY4nT+uvb7ciJiaZMOt5137hGZ/RZVy89iVhiYIHoT//kkkholaHfVKlaqcA81tgIxzYeu0krYkwSV9nFm6NXYdcL7CDGbd/TKkqJKrqwzBxar7mOqVnAmO8MLAYkKXG35EQ4gwcDqf3dep1yTK82jjidsU/9pqL4t5WyRj1ckNQfYxkvLMB/lnLdjmu3JcYLGBz5oj5zN/N07gDWhdPpL/e9LX7IZy5IqfICdQqGaXvmJ5ETAebcp3/kYZirH755oaCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTWwc4DLJ5aYfwAL81+c7H30f/CjX564NsnJJ91Lkwo=;
 b=VO3xous6UjTq2JbSKTrvxVSGqzHKsUnpdLR/w20iP2mkDagPu40Lj6DaXF16LNNvv5fr8qNkDXti2fo2TWF+uUhG/EP+C0yTR29odMuNuiOj7v5oE1MEhDq0rT9St6mm31fs/asgSjhDLnzjGFf2JM6V3HkpLvNUq9YkIBBOrZRqpZ1elwkUA0KgozWRm5vizH9q0QmZuwMpp/wV/NWX1P7EXWBLGuSyLv2syWYBjjhB6NvcDsVbU9TgWsTyLja5qnr8HRnStS0wtLQtays0gC3nWxdk84d9mRC7fqPJzgmfWFGePRC7sTznnb3O41LQAPRvRiVDO99Gp4kv/lQvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTWwc4DLJ5aYfwAL81+c7H30f/CjX564NsnJJ91Lkwo=;
 b=y+zjBPYgPPYiNO72hk41w3GGW2Ae+ImRptXqDtx2Sc2yqmfkesH2dRPpQWoEEI3geMy+SYjdBLkIGDisZmPbdlRWpEur83KZOBJRg2qNSXv49ee2Aurhg8h3nEPHOLVFcaIgMC7CQWRudQuqxy4dFIajraqEMck5C1+tO//d6joD4wqALkehh+6YcOvF0yBOhC8MQViyabNPRXKfWC8OcEHNXKNZhIGIsRWLBaZc/2ineFVVHDK3aUGvn1Ff0RejuYGc/SfdH4BstLcRID4p/sPumWlNPULnscrJv6wyKoZnLbXQIa5zsKO9NBKTqchHyWkHLC19FXrqC399Kf4GBw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5099.apcprd06.prod.outlook.com (2603:1096:400:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.14; Fri, 3 Mar
 2023 08:55:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Fri, 3 Mar 2023
 08:55:34 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQawgAAHfwCAAAAwwA==
Date: Fri, 3 Mar 2023 08:55:34 +0000
Message-ID:  <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
In-Reply-To: <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYZPR06MB5099:EE_
x-ms-office365-filtering-correlation-id: 652ec6db-8d24-4197-226c-08db1bc50d3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o3q4lnJNmh8f8Ii74cJtQ/pxwSB2uBB9tD0Kzymn7gnTJ8NmNiRA/tdQQJkYHzTfa2Xef4WKhTkOXU8e/nJbASeF0g78p0ANwsNByzUl2t/pIGz7+1IJQ9yw4gjny8BQKHVRNCcPCHp2K4uBTrv78W3jmGtEglnxYsEEa9+K/QOx9RIgLIa4Bi9R/obSuQxU9v5wFkPxFj0OpXstv5RUNH1mlzW9SON1tfWseGMKxC5qRefXwCTdYQ/xqoOhFirjuIPubFp8S/BkId8PfQlF494F+1OcerJ7nA6p5Jn4KzrcB4i7i2JSCYdMxqJfM+WVC9REdDm3G3CFTyyBZ5EPAKDeZtwFchL+7kooJl3KY0fo3EY/fVGziFCrac5x4iLJmJpRTtKZUFkYVsz+3BUsMN0cFMVd41SglCigK9yJkxt2tNYlVduV7SQ+0xy/E8+Egu6e2KcV4SHPHgVtECxaIOgs2zOddPnmS8bHV1RJ1ibG4pq6aRmfnmjUZ8tzjZrY7oWr4+g68MEnw2Le8ps3CoSzlFQotOApqbyVP82PCHDRTXQfm8aozLehjzE9Nyh8QugeNaqpsxhPWCBmR/sVu8XT+J6HtaVgO8m4rsT3CpW0T1awiGR0gOi+YZWHVeCs7hdLOa0mah8/W02ufy/Ph632wvvBynm7jbzxL6HiYFvmTnaelU8oJfcNbbQGKc/C
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39840400004)(136003)(366004)(396003)(346002)(451199018)(66446008)(41300700001)(66476007)(316002)(110136005)(66946007)(8676002)(64756008)(76116006)(55016003)(54906003)(4326008)(66556008)(2906002)(52536014)(122000001)(38100700002)(38070700005)(53546011)(6506007)(26005)(83380400001)(478600001)(33656002)(71200400001)(7696005)(9686003)(186003)(966005)(86362001)(7416002)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SFVBcllUb3lUNlA3WVpWcUptcUpLV1BaSGI5YlltbEFSbmlWK0t4U0Q1UDUz?=
 =?utf-8?B?VzEvQ25XOWFTWktYMEFRNVJ5SExXSTBzN3huTkNOSWR6ckw3UWxqZlNtUmls?=
 =?utf-8?B?M3B0QVdXcGkxWDE2bklUMTlocXdrZjUwNVFhc2JhT1M2bWVmTTIySi9jOVBv?=
 =?utf-8?B?WlFSU3BQSndiQ3EzOEcyekFpcmMvdVZ4WHMySkdBU09ENnRYT0JWUkVXTmlJ?=
 =?utf-8?B?bmRNUExBamh4UjQ5ZjZBVElka3g3bWQ1WGE5d1N1MzhWZWVZcVdKZGlOUEdp?=
 =?utf-8?B?dC9Jd2R6TE9vZVpDODhUU2IxWjBSQnBhNS9ncE8vWWtBZEJSKzNrY2drUi9G?=
 =?utf-8?B?S25haWZaOEJHUHFCMHJEeWlJWGVidlB6Mk1hNGV0bjJtZ01LSnhuaTEvb3hs?=
 =?utf-8?B?dmM0NVNQUDlKOUZUMW5ZUG54YXdZZjJHeGxuRjZiSlBvS2dSdkRMMUFXbXJ5?=
 =?utf-8?B?Y2taR0JyQkFldWdteFJ4Z25YbEdNUXp0QnlKY3RMOWZ6aklDQmdabk5WeEx5?=
 =?utf-8?B?d2VkSldMR1J1WG1ZanRIWnJrdFZ1Tm9IdUkyYzJwKzNHaktnNm10TDlpclRa?=
 =?utf-8?B?enMwaCtKOXRNR2ZFRXFBYjlpeVdBV3N4WmpUSEExY3NIdnlWVlZWeHJuZmlo?=
 =?utf-8?B?aTBNVWZPZCt5UVVEQUxpTVdLMUowMHB6enVxN2JiekJGZXhwLzJEb2FUbmFu?=
 =?utf-8?B?YkUvTUJyOGptUUxWMXdrYitoc0k2bmRGdFR6L3FUUFBkbG5UWnBsZXJVNjF2?=
 =?utf-8?B?MktUSmlxbWFLQ3Ayd0pkMTVaZWY5SkUwNUZydEdJclpneUtVamQ2RDVZMGln?=
 =?utf-8?B?L0hvcDFwWS9UK0llN0VCSUc3bHpaMTRUaVlORktsOFRMem9RWkpucTlWV2s3?=
 =?utf-8?B?dkE1Tnh1S3QvaHY4YmRwa2k3OE1yMkt3OXJLRnEzRTFidXRmY2d3YzNDTGh4?=
 =?utf-8?B?THFGVm8wWEJVYk1hKzgyeVByZ0EySWdxb1p3U0FucXgxM3hwOWw2dTFvVUhH?=
 =?utf-8?B?cllqNkVnUWRMMDN1SzliTGJIOS81Qk5YTHZ6L2Z1KzRxcGhWbUFVTk14T0cz?=
 =?utf-8?B?RHowVGhGWEVpL0IvdzZraGpCa0M4MHJaZzF5clRja0Y4Z2VLSUIzWUtMZHdJ?=
 =?utf-8?B?NnBETE1zQVVvN1VUMmFxWkdQVTh4MjRBQ08ydVo4L29zY3lFcVpMRlp1Rm55?=
 =?utf-8?B?cHNNTEtYVUxEMUkxRkxjTzJQV3FnTGFDdkw3S1FjWndxd2UwUGFpbWVndkZl?=
 =?utf-8?B?c1VobXJZc2VUUjhEOUtUTzRRWHBYOXZaeWtQcHNJWndLS0prWTQ5cUFjbXox?=
 =?utf-8?B?d2w5cVNVZUNVcmdSYXVHZWE0VVFrSHhEUFJ2ajBEQ2RXQSswOXlleXBiNGpS?=
 =?utf-8?B?THRYVmhKem41ZW1SYVkxelZvekYvUHZDNk1QajZncnp1WFpLd2wzaWlpcmhS?=
 =?utf-8?B?a1VBaU5JVXNlZXJMZVQvUjVWRk5yd1dFckIvWTNiOVY5UG9URmtLZjRvT1ZX?=
 =?utf-8?B?KzlmZ1BtU0o5ejZhemo3aDh0V0JkUEc4OWVJdUlhNHNtQzBnQSsyL2FvR01G?=
 =?utf-8?B?enpFanVmVml6b1FtRzFva1Z1UUxVdkYrNXNBL0FUNTJWMU5KanA5NW90aDlE?=
 =?utf-8?B?OW80Z0s0S3FOOGpuQURFUkVHL2VsMjBpOXJzUVl1R2czZ3NxcHB2WXdOZDhM?=
 =?utf-8?B?Q2JOZTVmb045UWIrWmVLMjNXa3dxdUpEREtUM21HZmFTYnE5WjBMNnA4dW90?=
 =?utf-8?B?dWEvS2xiZlFmLzdkM0JyTGlub1U0cWlkYy9TVFkrSHFKNEg4VGpGRDFlbXp3?=
 =?utf-8?B?L0pvbUtLbS9mVDI0NW9tWHorbStkdHpXTWl4RG1yTEg3RCt6NzhEa0RMYUFm?=
 =?utf-8?B?bVQ1Vktid0l4b0xNbEk5SWNpM2RJR2hrNmIrRFc0a09QTWtUUjQ1cXhqOWNs?=
 =?utf-8?B?Um4zbEhTTUl1dk5Ka1Z0anBqdWVzaEJrU1RhZWVzUzJjVWpuczRaYk1oUlMz?=
 =?utf-8?B?ZkNkbkUwaWdnQ2Uxc2VmL3NQNlZDdWh4RFd5NnowUWEwUmgvUGJjSmk5SXNw?=
 =?utf-8?B?d2ZHY1JCdVByWGVVKytCZjJPMTdHemcrSVVqMFpHUXZYMVBTSzJTSlZGYWx1?=
 =?utf-8?B?Z1BsekMvZndSMXFDL0dZWmRsdFlNMkdueWNTYlc5UEY1b090RGdISVlKMHhP?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652ec6db-8d24-4197-226c-08db1bc50d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 08:55:34.7493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Ltfb0XT+wMnviKzMT7xugbxorksEkBeUl5mk5QkfCf03TRL2V9C5XRR/udrh2QlMM0uJzLu7/NADKFCjTSZCUlQWfURfI+U6rNZW8z8Ji4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5099
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gS3J6eXN6dG9mLA0KCQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4N
Cj4gU2VudDogRnJpZGF5LCBNYXJjaCAzLCAyMDIzIDQ6NTEgUE0NCj4gVG86IFJ5YW4gQ2hlbiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgV29sZnJhbSBTYW5nDQo+IDx3c2FAa2VybmVsLm9y
Zz4NCj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMN
Cj4gPGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBSb2INCj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwu
b3JnPjsgQmVuamFtaW4gSGVycmVuc2NobWlkdA0KPiA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3Jn
PjsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9y
IEFTVDI2MDAtaTJjdjINCj4gDQo+IE9uIDAzLzAzLzIwMjMgMDk6MjgsIFJ5YW4gQ2hlbiB3cm90
ZToNCj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBGcmlkYXksIE1hcmNoIDMsIDIwMjMgNDoyMCBQTQ0K
PiA+PiBUbzogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBXb2xmcmFtIFNh
bmcNCj4gPj4gPHdzYUBrZXJuZWwub3JnPg0KPiA+PiBDYzogSm9lbCBTdGFubGV5IDxqb2VsQGpt
cy5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA+PiA8YnJlbmRhbi5oaWdnaW5zQGxpbnV4LmRl
dj47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGlu
YXJvLm9yZz47IEFuZHJldyBKZWZmZXJ5DQo+ID4+IDxhbmRyZXdAYWouaWQuYXU+OyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgUGhpbGlwcCBaYWJlbA0KPiA+PiA8cC56YWJlbEBwZW5ndXRy
b25peC5kZT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBCZW5qYW1pbg0KPiA+
PiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Ow0KPiA+PiBsaW51eC1h
c3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPiA+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmc7DQo+ID4+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NiAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3IN
Cj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pg0KPiA+PiBPbiAwMS8wMy8yMDIzIDA2OjU3LCBSeWFu
IENoZW4gd3JvdGU6DQo+ID4+PiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4+Pg0KPiA+Pj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgRmVi
cnVhcnkgMjcsIDIwMjMgNDoyNSBQTQ0KPiA+Pj4+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBh
c3BlZWR0ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+ID4+Pj4gPGFuZHJld0Bhai5pZC5hdT47
IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbi5oaWdnaW5zQGxpbnV4LmRldj47DQo+ID4+Pj4gQmVu
amFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPjsgSm9lbCBTdGFu
bGV5DQo+ID4+Pj4gPGpvZWxAam1zLmlkLmF1PjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVs
Lm9yZz47IEtyenlzenRvZg0KPiA+Pj4+IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnPjsgUGhpbGlwcCBaYWJlbA0KPiA+Pj4+IDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+PiBvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiA+Pj4+IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4+PiBsaW51eC1hc3BlZWRAbGlzdHMub3ps
YWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+Pj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yDQo+
ID4+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4+DQo+ID4+Pj4gT24gMjYvMDIvMjAyMyAwNDoxMywg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+PiBBZGQgYXN0MjYwMC1pMmN2MiBjb21wYXRpYmxlIGFu
ZCBhc3BlZWQsZ2xvYmFsLXJlZ3MsDQo+ID4+Pj4+IGFzcGVlZCx0aW1lb3V0IGFzcGVlZCx4ZmVy
LW1vZGUgZGVzY3JpcHRpb24gZm9yIGFzdDI2MDAtaTJjdjIuDQo+ID4+Pj4+DQo+ID4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+Pj4+
PiAtLS0NCj4gPj4+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlh
bWwgICB8IDQ0DQo+ID4+ICsrKysrKysrKysrKysrKysrKysNCj4gPj4+Pj4gIDEgZmlsZSBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspDQo+ID4+Pj4+DQo+ID4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+Pj4+
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1s
DQo+ID4+Pj4+IGluZGV4IGY1OTdmNzNjY2Q4Ny4uNzVkZTNjZTQxY2Y1IDEwMDY0NA0KPiA+Pj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMu
eWFtbA0KPiA+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2FzcGVlZCxpMmMueWFtbA0KPiA+Pj4+PiBAQCAtNDksNiArNDksMjUgQEAgcHJvcGVydGllczoN
Cj4gPj4+Pj4gICAgICBkZXNjcmlwdGlvbjoNCj4gPj4+Pj4gICAgICAgIHN0YXRlcyB0aGF0IHRo
ZXJlIGlzIGFub3RoZXIgbWFzdGVyIGFjdGl2ZSBvbiB0aGlzIGJ1cw0KPiA+Pj4+Pg0KPiA+Pj4+
PiArICBhc3BlZWQsdGltZW91dDoNCj4gPj4+Pj4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4+Pj4+
ICsgICAgZGVzY3JpcHRpb246IEkyQyBidXMgdGltZW91dCBlbmFibGUgZm9yIG1hc3Rlci9zbGF2
ZSBtb2RlDQo+ID4+Pj4NCj4gPj4+PiBOb3RoaW5nIGltcHJvdmVkIGhlcmUgaW4gcmVnYXJkcyB0
byBteSBsYXN0IGNvbW1lbnQuDQo+ID4+Pg0KPiA+Pj4gWWVzLCBhcyBJIGtub3cgeW91ciByZXF1
aXJlIGlzIGFib3V0ICIgRFQgYmluZGluZyB0byByZXByZXNlbnQNCj4gPj4+IGhhcmR3YXJlDQo+
ID4+IHNldHVwIg0KPiA+Pj4gU28gSSBhZGQgbW9yZSBkZXNjcmlwdGlvbiBhYm91dCBhc3BlZWQs
dGltZW91dCBhcyBibG93Lg0KPiA+Pj4NCj4gPj4+IEFTUEVFRCBTT0MgY2hpcCBpcyBzZXJ2ZXIg
cHJvZHVjdCwgaTJjIGJ1cyBtYXkgaGF2ZSBmaW5nZXJwcmludA0KPiA+Pj4gY29ubmVjdCB0bw0K
PiA+PiBhbm90aGVyIGJvYXJkLiBBbmQgYWxzbyBzdXBwb3J0IGhvdHBsdWcuDQo+ID4+PiBUaGUg
Zm9sbG93aW5nIGlzIGJvYXJkLXNwZWNpZmljIGRlc2lnbiBleGFtcGxlLg0KPiA+Pj4gQm9hcmQg
QSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQm9hcmQgQg0KPiA+Pj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4+PiB8aTJjIGJ1cyMxKG1hc3Rlci9zbGF2ZSkgIDw9PT1maW5n
ZXJwcmludCA9PT0+IGkyYyBidXMjeCAobWFzdGVyL3NsYXZlKXwNCj4gPj4+IHxpMmMgYnVzIzIo
bWFzdGVyKS0+IHRtcCBpMmMgZGV2aWNlIHwgICAgICAgICAgfA0KPiA+PiB8DQo+ID4+PiB8aTJj
IGJ1cyMzKG1hc3RlciktPiBhZGMgaTJjIGRldmljZSB8ICAgICAgICAgIHwNCj4gPj4gfA0KPiA+
Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+Pg0KPiA+Pj4gYXNwZWVkLHRpbW91dCBwcm9wZXJpdGVz
Og0KPiA+Pj4gRm9yIGV4YW1wbGUgSTJDIGNvbnRyb2xsZXIgYXMgc2xhdmUgbW9kZSwgYW5kIHN1
ZGRlbmx5IGRpc2Nvbm5lY3RlZC4NCj4gPj4+IFNsYXZlIHN0YXRlIG1hY2hpbmUgd2lsbCBrZWVw
IHdhaXRpbmcgZm9yIG1hc3RlciBjbG9jayBpbiBmb3IgcngvdHgNCj4gdHJhbnNtaXQuDQo+ID4+
PiBTbyBpdCBuZWVkIHRpbWVvdXQgc2V0dGluZyB0byBlbmFibGUgdGltZW91dCB1bmxvY2sgY29u
dHJvbGxlciBzdGF0ZS4NCj4gPj4+IEFuZCBpbiBhbm90aGVyIHNpZGUuIEluIE1hc3RlciBzaWRl
IGFsc28gbmVlZCBhdm9pZCBzdWRkZW5seSBzbGF2ZQ0KPiA+PiBtaXNzKHVuLXBsdWcpLCBNYXN0
ZXIgd2lsbCB0aW1lb3V0IGFuZCByZWxlYXNlIHRoZSBTREEvU0NMLg0KPiA+Pj4NCj4gPj4+IERv
IHlvdSBtZWFuIGFkZCB0aG9zZSBkZXNjcmlwdGlvbiBpbnRvIG9yZSBhc3BlZWQsdGltb3V0IHBy
b3Blcml0ZXMNCj4gPj4gZGVzY3JpcHRpb24/DQo+ID4+DQo+ID4+IFlvdSBhcmUgZGVzY3JpYmlu
ZyBoZXJlIG9uZSBwYXJ0aWN1bGFyIGZlYXR1cmUgeW91IHdhbnQgdG8gZW5hYmxlIGluDQo+ID4+
IHRoZSBkcml2ZXIgd2hpY2ggbG9va3Mgbm9uLXNjYWxhYmxlIGFuZCBtb3JlIGRpZmZpY3VsdCB0
byBjb25maWd1cmUvdXNlLg0KPiA+PiBXaGF0IEkgd2FzIGxvb2tpbmcgZm9yIGlzIHRvIGRlc2Ny
aWJlIHRoZSBhY3R1YWwgY29uZmlndXJhdGlvbiB5b3UgaGF2ZSAoZS5nLg0KPiA+PiBtdWx0aS1t
YXN0ZXIpIHdoaWNoIGxlYWRzIHRvIGVuYWJsZSBvciBkaXNhYmxlIHN1Y2ggZmVhdHVyZSBpbiB5
b3VyDQo+IGhhcmR3YXJlLg0KPiA+PiBFc3BlY2lhbGx5IHRoYXQgYm9vbCB2YWx1ZSBkb2VzIG5v
dCBzY2FsZSBsYXRlciB0byBhY3R1YWwgdGltZW91dA0KPiA+PiB2YWx1ZXMgaW4gdGltZSAobXMp
Li4uDQo+ID4+DQo+ID4+IEkgZG9uJ3Qga25vdyBJMkMgdGhhdCBtdWNoLCBidXQgSSB3b25kZXIg
LSB3aHkgdGhpcyBzaG91bGQgYmUNCj4gPj4gc3BlY2lmaWMgdG8gQXNwZWVkIEkyQyBhbmQgbm8g
b3RoZXIgSTJDIGNvbnRyb2xsZXJzIGltcGxlbWVudCBpdD8NCj4gPj4gSU9XLCB0aGlzIGxvb2tz
IHF1aXRlIGdlbmVyaWMgYW5kIGV2ZXJ5IEkyQyBjb250cm9sbGVyIHNob3VsZCBoYXZlDQo+ID4+
IGl0LiBBZGRpbmcgaXQgc3BlY2lmaWMgdG8gQXNwZWVkIHN1Z2dlc3RzIHRoYXQgZWl0aGVyIHdl
IG1pc3MgYQ0KPiA+PiBnZW5lcmljIHByb3BlcnR5IG9yIHRoaXMgc2hvdWxkIG5vdCBiZSBpbiBE
VCBhdCBhbGwgKGJlY2F1c2Ugbm8gb25lIGVsc2UgaGFzDQo+IGl0Li4uKS4NCj4gPj4NCj4gPj4g
QWxzbyBJIHdvbmRlciwgd2h5IHlvdSB3b3VsZG4ndCBlbmFibGUgdGltZW91dCBhbHdheXMuLi4N
Cj4gPj4NCj4gPj4gK0NjIFdvbGZyYW0sDQo+ID4+IE1heWJlIHlvdSBrbm93IHdoZXRoZXIgYm9v
bCAidGltZW91dCIgcHJvcGVydHkgZm9yIG9uZSBjb250cm9sbGVyDQo+ID4+IG1ha2VzIHNlbnNl
PyBXaHkgd2UgZG8gbm90IGhhdmUgaXQgZm9yIGFsbCBjb250cm9sbGVycz8NCj4gPj4NCj4gPiBC
ZWNhdXNlLCBpMmMgYnVzIGRpZG7igJl0IHNwZWNpZmljIHRpbWVvdXQuDQo+ID4gQnV0IFNNQnVz
IGRlZmluZXMgYSBjbG9jayBsb3cgdGltZS1vdXQsIFRJTUVPVVQgb2YgMzUgbXMuDQo+ID4NCj4g
PiBJdCBoYXZlIGRlZmluaXRpb24gaW4gU01CdXMgc3BlY2lmaWNhdGlvbi4NCj4gPiBodHRwOi8v
c21idXMub3JnL3NwZWNzL1NNQnVzXzNfMV8yMDE4MDMxOS5wZGYNCj4gPiBZb3UgY2FuIGNoZWNr
IFBhZ2UgMTgsIE5vdGUzIHRoYXQgaGF2ZSB0aW1lb3V0IGRlc2NyaXB0aW9uLg0KPiANCj4gVGhl
biB5b3UgaGF2ZSBhbHJlYWR5IHByb3BlcnR5IGZvciB0aGlzIC0gInNtYnVzIj8NClRvIGJlIGEg
cHJvcGVydHkgInNtYnVzIiwgdGhhdCB3b3VsZCBiZSBhIGJpZyB0b3BpYywgDQpJIHNhdyBmc2wg
aTJjIGFsc28gaGF2ZSB0aGlzLg0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvbWFzdGVyL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy55
YW1sI0w0My1MNDcNClNvLCBJIGp1c3QgdGhpbmsgdGhlICJ0aW1lb3V0IiBwcm9wZXJ0eS4NCg0K
IA0KQmVzdCByZWdhcmRzLA0KUnlhbiBDaGVuDQo=
