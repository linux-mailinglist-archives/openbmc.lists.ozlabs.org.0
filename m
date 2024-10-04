Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC398FDAE
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 09:15:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKfvj39gdz3c20
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2024 17:15:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::70a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728026125;
	cv=pass; b=WMfO9NA3qW9q6jfj1XaiakVGah7Mr+LR6Umni3H3lY02EH/wzwqsIDhj82gCASfG7X9qQAS8ArueYIggxdbTzL/JnmKxfK8VviXI1kE+vwc03FeSJl7QAy3sT29JrW+e6i0vwnc10/Fgvxmi0EpKUYdpieNATaBfMxCU5Ywrl/Q3aKhO5sJhd9DsTKHSXSWtKmdFgjiBRDAoTwW6tu1QhgzBdod5IehbevDsAkiCeh62PC4XcCyezeYYvWHbwfA/apO/9GT/BWkcMx5Uxb3SbZffrHjQ4DBnr4FdmC+wF7fezc9BJGwd5xlQP8E1li8UOJd0Wlg9+lln4GcqZCi2ww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728026125; c=relaxed/relaxed;
	bh=7JOBVYl5FlOg/TBSAQ0TD4ovo4pNiv6Cqa/HMUT3DhI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ry5InnsocS0jZzV1ZJ1fDascluqGPBTRL/JlSQaiwb+qywpJvY/nSb8mN3lbFxpRmPag74FcmeV6uILJivspNjf7k9keM2oXIT104kq+koWZYpWeh97/OeuYVK7r3SqnDfmtQO9FLJ8G/iK3cIqVStP8dqf3G2vB2iXl7Gt9oUPNedsxFvbFRH1tDURUtdQ5fhDvXCKNfQ4zoIpCUlrbb3k7aYT4fGB9Q/vfwsuXoGk3sKedQVsZxR/gYRPBhCgBoYuaKO3UzIdRiJaD3BTiq7dotuEugxfSGwkbRnpYQcY/n8qjw5lIGfbk7JpXjQ4y6BvbNeJI43o1qLBoAVj9uA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Y1eUiT6J; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::70a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Y1eUiT6J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKfvd0Plyz2ypW
	for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2024 17:15:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0gCyn4HzcStdSwaupAE9ViKr0UZK/dLU/AS4/vQC81MGYWKXtd46htMndhmrEjiVpINMbOW6pvbAfUYp/17e/9IlA2iKcTWwoptfyFiJP50eolCltJMw/k7lguDBOTPRKDtx1DXR8Qm6FPBG8Cv/eIzuQUCfuM7gqsOY0FETdMltpKKCTVqgVrPz7m3K+lWW6bHhOK26wEln9XvrABm58Bvu9EuvwSvq7EVUt8fF0z0sZwDuXy+2i5DR8M+cxCFbf7OfDQxyHlAEbxLCwanELQnvqMZlEgoRsdyy3AtejkgNvB7cSy1cNQQUe6D2Hws3nX3+ae0JvSQwWQEzSXpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JOBVYl5FlOg/TBSAQ0TD4ovo4pNiv6Cqa/HMUT3DhI=;
 b=BuOyMNWw6uwEc1tfLsZDHDXvQmK/VygPVBZ4SGcmej7oA03Xg50wwLPArJMoUKnb8LZa4WD4o7fdwQ6DwBkL7NJ1eyrInTiEm1zQyc0P7J+ACqAeOfQkigBvRwOO/r1y6EZcXJOAflsX6r+LDgx2s8cDizD/tRbpZoFgPeyWbOrcy5EDI50DG7Cp72plQ+q+pz/9En4xAgrcwsRtbvFVaQS2EposLXRUtW0WrlYa+k++Sd+xuCU5Op4aPeYSLQPHxZDNtNGZGI+YF3O1S+6K1rvdAsNdv3FJQi6CrCkaOHAcfij9dcvk9PsxIt6mhsS/QjAawaelu1UnF3PnBqD3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JOBVYl5FlOg/TBSAQ0TD4ovo4pNiv6Cqa/HMUT3DhI=;
 b=Y1eUiT6JFY+3I4mnTV6qgU9Xl0WipcB5+ndV/ekt8AwF49UBelEJPmKjbBdWXEABYgDh65NOI7nhdoojdhUoUflgvs9O/52qbe91G6RIkMY0lefV0kOtlDq80BAQH+KmsHq/LORZoD0yrdMaW9rMF7PtYPu02/uN9aZow9uTogruDF54cSrCcUot7s0cJHObfKeIl0GdehgGBZl7uefekefGD4vHS8TIuBk1AL2VL0DqTJXxeCPz6XeGqmavwfZiYkrMX32BvFuhirb6YY3pFEW0DvaZ3BzuCbBCZ1UqgokboxzC/6d5NKt/1RnEXFBCtq5c+pR/cZcIX1PnKgyWOg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB6396.apcprd06.prod.outlook.com (2603:1096:820:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 4 Oct
 2024 06:58:27 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%4]) with mapi id 15.20.8048.007; Fri, 4 Oct 2024
 06:58:27 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>
Subject: RE: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Topic: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Index:  AQHbFJkFQwNKPZEeEUm4WxILxLvNH7Jzh3+AgADa1uCAAG7pAIAAIvIAgAAFI4CAATK9MA==
Date: Fri, 4 Oct 2024 06:58:27 +0000
Message-ID:  <OS8PR06MB75411555216E89213DA0933EF2722@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
 <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
 <Zv6QdUuiUFvXjcd4@smile.fi.intel.com>
In-Reply-To: <Zv6QdUuiUFvXjcd4@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB6396:EE_
x-ms-office365-filtering-correlation-id: 55206563-baaa-4b9a-395a-08dce441f2d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?2Q4a3TnBNwl+U+hFCVAHLe8ZtmA4t5RPug/hlbNhVIOcTzrhOJxPYQH0Uixi?=
 =?us-ascii?Q?Sa6kFxWleD4/6PZaVfTqbHpWSsJbQrDeCxwMXCDwrxfzWEoXHWDhJf4QsZkT?=
 =?us-ascii?Q?VKmG+LBCT1JfLpd6NuxD48VHmiaQlGwn+Xjfn68wVxyj9zy2FlL4f/6a9Xeg?=
 =?us-ascii?Q?Xz4bBRtfXvnhOF70OfYsdWLF5zgeTMoATMah1qlHVOxXjPA/PQJK/g2Pk9Vh?=
 =?us-ascii?Q?Ydb7iJdZ8oYc/wxf2To7j9IPtGFgo3yVFxBStbsEl40XS4lwGvAW3Es8Lmjr?=
 =?us-ascii?Q?5jYFVSPqrI/IMLkJ2zhGCUZ5Aa7T8j5xDu/TbEsD34TPTX2rYTj2HZbb82k5?=
 =?us-ascii?Q?KOW7Gi4WzPXxduccLwy5+qxANdG65ZyZM1jxsLYKj+APhInCLb1nm3THP6yR?=
 =?us-ascii?Q?kQQ2DZ5c8jvIqz/ZQpVRjWZ6lTs0as8KtrMrcTzY14EM8CD+oKP4wKC9eK7p?=
 =?us-ascii?Q?Bfu31AdhWDibeLz+jLMi7ad1PBPlz0NJPbRFBLhdSObpv9jny3TpQoL+yMdh?=
 =?us-ascii?Q?fheJpC1BldZX3ctLDTQP8cxZnWqZmN+yAvmMZyzdD3Ndrex+EqML2HcNa9Te?=
 =?us-ascii?Q?HjN7N5TspA6EhZNsE4dtmrmB2xlhdbxSXs4SKIzemBnoCKQKTOWD/bUsApBn?=
 =?us-ascii?Q?8yNX0sbbzyvdxdMmCSfsWKjboBp6igPSyEHxMpbWz8DO78EnohwGcSSlbEQp?=
 =?us-ascii?Q?3ANacXDSZITFRj41/p0JMdz44zQ2qGWoaFkq3ptVRLiW0XH5xX4tafILc50Z?=
 =?us-ascii?Q?idhy6XPw1onJ8C+vwiBuTWlIDqIH95SgdKe18hKSj3275x0HNqzO+Mx7YVw3?=
 =?us-ascii?Q?gFalkg/atkcb8bmQ3kr/deYMRgsgtUe+33sqe9RX6P8QHoUdnROi91oUGCVj?=
 =?us-ascii?Q?6ZpZCQCxWumnTvvGxFQPuOBo4B/BAtDaI8zIHYsOc5S2vyjrozwaI9m0FogH?=
 =?us-ascii?Q?KMDl9HEQ0pV6gnA+B0iItSrGE9FWaJNr8LFOwF3q69cj5/B64yosizTnVo94?=
 =?us-ascii?Q?64BdgvI3RqHuZoMNaebY8c1iay8OT7eJWQ2VXJe7w7bPQpqAaSohoAZwbtZf?=
 =?us-ascii?Q?hBXjSI1kYlYxhUXMIxTryMZsoESml9OFmhDvxq1GTVHosflrCqp53p0gW8cj?=
 =?us-ascii?Q?tSn/UxzQ8q9urGgeC3UaOzPO92c6DP16nHL7ejB5sIVTEF+UCMrwShw1tjEC?=
 =?us-ascii?Q?kl4mGKwzzIcBH1cXRFUQhOkmyju32C64mOz0fQviETtAyLEIXKo4Zb8UlNNl?=
 =?us-ascii?Q?D2SwC4TCtZZvPfG8b4dfvBxsSHgLsUUrWQyUdE4AyDb11hf1SqiawPIwFQe/?=
 =?us-ascii?Q?cEvk+Aq9RGshvvxjWg715q+5kRLaSbRehJlN3k3kRqXGsw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?SGDpGdc9+jQeZ5wklaR++p2wkKVkK8LfnQ2CKpKNBbFC+aEmCmopWJRtlPmk?=
 =?us-ascii?Q?jlJZ9qzGDZM58jihSXw688S/RVW9/5C5G5n9wp8hLbtKO1T128CSWln+dv35?=
 =?us-ascii?Q?tzJ69DlAlIT3V6KkCxuF1qhikBsRWiKAFZx4q6QWupkTj7wRrc4+V6SEe03n?=
 =?us-ascii?Q?avKdkT/L4XLNswtVgiJYzHdqDeZm9jrzI8E31Tz+B0XdC+2qwasOdFO7K5Fs?=
 =?us-ascii?Q?q3xHHzsWTEpZpjwPbsiR3OAagn9NXn0hUaJQSesnRfRoJRF/aBG6o+rY5y7e?=
 =?us-ascii?Q?ryn0lwqa0ge/0VKXDUrH1Si1n566sNpH1L/JvCUDdGnv6SymURa5Y9ch4ZIK?=
 =?us-ascii?Q?dPiciDckoG9np+/Gs3myfyue9LcAagXXm7q5Iw3WhsoKh1T+4pZJwkA4RPGM?=
 =?us-ascii?Q?vKl474rNIc+zRuimhqTySvBdaSphBcSewxEkaX+utO5qFsmCYE/tzkJ0Cbog?=
 =?us-ascii?Q?BK7d9edpoTZJ78FDpcza2sQAWLRu2bLishHgEiNKEz5gFioBwDmUauRvWynb?=
 =?us-ascii?Q?YtgsnD+iEqoT0qVUjhOBXPEFQkPJnrKeM/2n3fngRxfdR31cleq03c7Y96gE?=
 =?us-ascii?Q?kd5l6MID/b1lZJSaJ0/tx/n0gwDSsUy4Fp2xjztrM8DLWBqARHlY3m9Q7pIr?=
 =?us-ascii?Q?7NRn1IXL421SKBck834efwdS0rvACQLgEn16o9W4fdsyEe2hq5zwIANi05M7?=
 =?us-ascii?Q?nlnwTmm1y10ed3HKNlmcjgcLZtUb0ork+CXWhfn4X2VfACLHrJAHCX0NCquE?=
 =?us-ascii?Q?0xzKIOmuP2GreyDB12WrQDnqcwU3Csmo0AohbBwtreoKmZ+gTt8N4uvWlJXH?=
 =?us-ascii?Q?SguFjjzvvzlqcbKcO83lNkv5JN0ApywRF61CMvzR/SsHNxRJNguF/x6MQZAI?=
 =?us-ascii?Q?b7bKVtyy21p42RY9fFitMhlWwl/i/llpVihmnqMIUinS8K5YLANbsH2HIX5B?=
 =?us-ascii?Q?8C0GKwcTkxxeLeW3yjNbJQPbXYsdVu87TIJZP45YbNM45LVKw+1sANk/K+sO?=
 =?us-ascii?Q?mfBMkpi62YORpGqe54oxWUbzJt8oLAGzKuKuiXUGvV3s3l8iVwKNuUBZbNLq?=
 =?us-ascii?Q?7feixRwnU54GSoas9Rzx7Ne3BcgrUZjUYNgFxZTjJPxotUWvEnq8KPEWJVkg?=
 =?us-ascii?Q?gn8Qs5AL27ukX6cq61YnN9JHAEe32/VqneaIzUNkpAsoDDtHd9+HHUwDP48H?=
 =?us-ascii?Q?nZY25p92bRfpeGDafLqqX1l03MQ7kd8Vo4e0U9HpWcdnLpdOmrWsO/G5bsSp?=
 =?us-ascii?Q?dIKvRP5rjCrT0z/8Z28fNbtu+5JoL3VTcCWHr4V57EkTNXaWLEpXspgdjroo?=
 =?us-ascii?Q?dmf1sW9Ri/WAxqmAgdYL+aSRhZLRAsxnO75l9U9IAAYzCQzWg1HTJ5wMxif+?=
 =?us-ascii?Q?pXQEVW8Q8kHsaWMcJIToDt7Lk2gnUG6vMdBlAJja4L8C4ZYu25kAkORCbSjH?=
 =?us-ascii?Q?NaYh3WrXWBGvCK1/j9ghLLskpH+47zdzAPkxkXDLVFh//fniyy0mDG/t7t9Z?=
 =?us-ascii?Q?0nuyJl0ltrnCQM7KJ1Y78lOByO6Mu+cXL5pS401Yx0tMYYRTFdXKmNlKRJ30?=
 =?us-ascii?Q?erie9V7OOTbiaW7fCT0aGZxhOmNWtTb8oiwUSvRI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55206563-baaa-4b9a-395a-08dce441f2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 06:58:27.7484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayUOovFX6oCFQ506JOUIrdTYtTX4HRhm/3YHwB/KF2E73U9NpN9gtcHceKhO5ZlJEmT/x7ySeCVuNaDLk7xwLNNukkkMQndv79k7Tevfm9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6396
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
>=20
> On Thu, Oct 03, 2024 at 02:20:54PM +0200, Andi Shyti wrote:
> > On Thu, Oct 03, 2024 at 01:15:50PM GMT, Andy Shevchenko wrote:
> > > On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > > > > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > > Is it possible to switch to new terminology wherever it's possibl=
e?
> > > > > I.e. master --> controller, slave --> target. See, for example,
> > > > > f872d28500bd
> > > > > ("i2c: uniphier-f: reword according to newest specification").
> > > > >
> > > > Just for cover latter? Or I should modify for each patches commit
> message?
> > > > Or entire i2c driver statement need switch to target?
> > >
> > > I believe everywhere, where it applies: driver code, comments,
> > > documentation, commit messages...
> >
> > If the datasheet refers to a register, state, or any other hardware
> > property as master/slave, we should retain the master/slave
> > terminology. Otherwise, we should follow the i2c and smbus
> > specifications and use controller/target.
>=20
> Indeed, makes sense. Thank you, Andi, for the corrections!
>=20
Thanks, I will modify with controller/target in sw driver parts. Keep the h=
w datasheet statement.=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

