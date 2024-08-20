Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A57C957EA4
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 08:51:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0Vs4xf1z2ywh
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 16:51:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::70f" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0VS3SzDz2xxr;
	Tue, 20 Aug 2024 16:50:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfF3VHaBpN+8k/iBQRlA08f2w/wbkRlLYgnxvQIj30S/Avy69oxzvSfQT1AeuU1K0hD76I4RFWlDGUXujPcA6akwuv2QRbnSwN2M+w9e02q8Me7IJKPljOdjgrtE0I1553Bx1YhhWJon/8qkhChIGJxWtPrjYIoay2GRwa6VfYXprA/qNOQ7GRnS5TX9D6ZsLr7bFqRrJXMBbxA05Xo6zXXBlaITUz7PXtxeiJ3oziRKcmRFyQB2rhPhQgd3gg/hjfIAcEnmUymj1Cc2uoTqDd0kH2lSxnl3Fqkrdp7lIWjy+r7/mBaWd3PLlXygda1GAk2tS8NGBMTb9YpFVIvrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FP935QoH++r9YE8Es8ORQsJSeBU+BXiyuyC7+EyhUog=;
 b=gp0aQFfbnK+mzoNaHSthL2qEOjMuao77SwpsuA84qhjUy4e/5y7WhzbXLOU9mA8Xv0894YpNGEctALAcW52Kh2VTXvu1duqU2LB4qcqceMq4hdmZdsypwCfQLqUzpoXNPjqhboYNrBJwXb3ys1X7r3igDpfdxS1hwo19gjyEvN1Xqo7J09Akyxv7kzH4IVtLjzbF4bEdaiOdqI0rRGCY5QBbnGvh7NBB5WB/aZsq3uJeDQh+8rSYNCFZ+FhWsi7fBeLp0poPLxeDZ/L0oOW/GYHTJme2ykuiewQSQNwgN796M4RKN6M6T90raMoqyf5OdqRng4xO8qgV+qPHeylJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FP935QoH++r9YE8Es8ORQsJSeBU+BXiyuyC7+EyhUog=;
 b=PZEZlaRVe6xqX95g9KoW0yJoJjBK1rjgTgI0tZ1CxklDRD+7zla+G77xgYSZIjphMck+nXy1/W/3PK/r8VwZL7PC17vJWz3Opxk5ylDaDCkQ8X3BXTzbKKCDxC116TN7CsiNXW00UYnORv7esMWo9NygusKqiAMXWAYNPRZ7r+zZ88LMFGE7AfJ0uSV05BAWyFfzmnHDk/dBCrXte+KcyOfI955ZiBBgGG5oysbyFnGyk2eL5XreyXSPFJcTLSKndbZOztikJWYDs66bXNfqQvKkSAt2GQjfO2be2iX2OJbLZmQOXAcjXQIqtz1Uo4M3EN3+CdFtzjjpe+aKt2pjmg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB6348.apcprd06.prod.outlook.com (2603:1096:820:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 06:50:30 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:50:28 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHa8ho549HAiRHYiEK49yrqFuaLn7IuYooAgAD5pxCAAFELAIAACBjQ
Date: Tue, 20 Aug 2024 06:50:27 +0000
Message-ID:  <OS8PR06MB7541A25AC3A11C51DD57E1B4F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-2-ryan_chen@aspeedtech.com>
 <7237aa34-9821-4ba7-a45b-3b1d598bc282@kernel.org>
 <OS8PR06MB75418A2ACA6693A8163F19E8F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <46a9280d-f4ef-4cfb-83a3-3744e04721f3@kernel.org>
In-Reply-To: <46a9280d-f4ef-4cfb-83a3-3744e04721f3@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB6348:EE_
x-ms-office365-filtering-correlation-id: e5cf7182-cb14-4f94-045b-08dcc0e46043
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?eWRQTm5Ha2ZPZFdxNkRwQ3h2alpwaWRwSXk0dS9WK3g1TXExdWFJalY0SDZZ?=
 =?utf-8?B?Z3c2UndSRG93Y2Z2dVZyMnhGZjVFUnp1V1QyYy94Q2xOckd2ZmgyMTU0V3ZQ?=
 =?utf-8?B?VGhSUnZkUEJtTWpiTURiVXZZUnZJVUp5cFZieWdvWGdPSlJraGRET3ZpRTJB?=
 =?utf-8?B?TFRnbERJcVE3RThGWmRPZ1V0V1JuNkIxWllvaUs1ZFQzcUNZL1M2RHBNZFNH?=
 =?utf-8?B?WXZKeWprU3FzMXFUalJaN25UUnlKeXRuSXp4Y05HK1owRk90UFhZcmRxWENF?=
 =?utf-8?B?TENDUlVvay9pU3dqK2xwUnk4dzdWRGJoVEJiYWVkUEdMc01hWGtKa0hVbUpJ?=
 =?utf-8?B?TVRUWW51Q2RlVHNsZnE1N3p4dzVMVGxVUU04MmUweVdsd3d0Q3BieG5YWTh6?=
 =?utf-8?B?MUZkeGxoR3ZLT2t0VklKZW5DNzY5c3BoQnZXRnFEc1NWVjMxRmZ4ekV3cnBY?=
 =?utf-8?B?TlhmSVBsUHNhb1k0NktVL3pNUkhNQjFuMUZrZXd6WnJ0UmNoWHJDR3BKOGxO?=
 =?utf-8?B?Y25Sb2JZSkJxM1pXK3dXVHZoZnJtTjBjRVZ3V0lVYnZCbkVQZTI1a0hScE85?=
 =?utf-8?B?amRyZzBleWgzQjVsVjdNc1drdm85YUprcWUxNjBzVUVwaW8xY015QW05Nk50?=
 =?utf-8?B?MHdnMXg1WG4wdDlDSGdLclU0UUJZZE5iamxxN2RhT2ZBR0g5emVUWTZwUGdU?=
 =?utf-8?B?R2ZFNTRrZjMrbUtQckFyM1JRTm1GMFBTRHNuVE5VcFBsRnlFcW1RUEJDcUty?=
 =?utf-8?B?YzkxQ0dNUVVwYjE3ZGgwR0ZodzhSUmdJQlphelc0Ly9KM0duRDBHb1Z6OHEy?=
 =?utf-8?B?Y2MvcGlCR2pkTFZ2ZE9pc1VzdXRWU2ZIWnl2dXBGYXRDNEN6Z0dySFYvelRq?=
 =?utf-8?B?ckNZZTkzRzVWWjVIL1lDRTh0eSt1L0gyRFNscTJWTXRJeU5LTTBTYmdNbXJZ?=
 =?utf-8?B?YlUwbENDaHJPUzA5N2EwNVMwNm9pOEx0bkZPZHlmbmZhdEZmNnFrNHF3dDA5?=
 =?utf-8?B?ck5BdTVQeXZKaVlLUGxXazJNSFd2NERicEkwMzM5Mm9adE1rMXVJTGI4ZVhu?=
 =?utf-8?B?ZlNRRS9WOVBqQ2NRRlpBek9nbFJGWlV1Y010TzFkSEZOZzdCSVdmckw2TWIr?=
 =?utf-8?B?VUhld2hlcUxYcU5qV0xET04vcGtINnJlbTA0OFZoK3ZYMXBxYUl4bFJvNXNE?=
 =?utf-8?B?alZuMnc3SG5EUGN1YWJFbG96b0tGdGZyQ1U0WndTYnJMSHorV1QzQ21DKy8x?=
 =?utf-8?B?ZE5yTkxqMVh6ekF1NHpCYkFPRkxGNnFFL3lCa015Q2g0VWVQVkUzZkQ0Q3RQ?=
 =?utf-8?B?L3g3dkRaaXNySGFBNXJXZDRyWldNQU5YOUR3NURreFJxMThJNmxlZE40QlM4?=
 =?utf-8?B?VU45eGlkQTNFWGhBOFhHczE3Q2hDY0xLU0hjc0JNL01adlZvWnBYOU9BOVZw?=
 =?utf-8?B?cjg5dVZVNjlWZ1Z6bXFWaDEwZVcwdnRhNjkyL2syUjdLdTVsWnBKejlSNXMy?=
 =?utf-8?B?SHpBL0I0amJoZGJGRnRYc05EazdkNkloU3BySlZQaVU1NXFxS3FUQ0hlcU1L?=
 =?utf-8?B?MTRpOFpqclZBWWduNnMxUzl3WEhYQWtRVEpGeVhHQ0RvcVZiRS85K2J2end4?=
 =?utf-8?B?bEFDSWpHVkFMYURnTjRaSi9MaGVMV2VuRVVMNVZKM0tzSllaUnlCOGlwR05u?=
 =?utf-8?B?WUR6eHZGMUZ3MWJWRjNLdklRM1ljZXdEak9KTGxPTVZYUHo3dDNJUERoNEpN?=
 =?utf-8?B?S0tNakIySVdGSk4xMEZBcnZCc0kza0tsbGF5d0lzQ280TWtoa3hsOVlRMXBH?=
 =?utf-8?Q?nsiccFzpgeyoO6xeyZVIYoo5y/5mYbyINDrk8=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QUhGWlA5NGhmeFhsUDltdzNkK0FJY3dQWGI3VnkxSnh3WWpVMzEzVnA2RDVS?=
 =?utf-8?B?Y0EyMlNtUTZDL242N0dOSVZwTFdiK2lIYUsxWlBEdzJGNmREMmRtRGdsRStQ?=
 =?utf-8?B?UkFvN0VMbWpaN08zSEY2ajMrTGZ4TGloOXE0STFIQXZjVWI1MkpCZnRYb3pH?=
 =?utf-8?B?R0hzWWZNOG9vTkNldkNnM0pMemYwNmpDZ0RQa3haN09lK3BxOE5Rd0Rwekww?=
 =?utf-8?B?Y0tHeUZQNXlIYWFLcUVmNlNsOWJkRjZXQUwzS1dqTUFDZUFycXg1TFp4SmFV?=
 =?utf-8?B?N3ZCOGNsdlBQZmhRek84cW5JMytEb3hEMUhuejdtY3VndWVGN0VjeEQwaFpn?=
 =?utf-8?B?ZC9PYXkrUkFER2IvOUM2R2IybW0rMy8ydWVXMnp2aDhMMVdjVWZyYURrNWZK?=
 =?utf-8?B?NmdFK3p0K0xrUGdibE8rOEtCN0ZPdnA3ZzlyN0hnSHRmMU0vbFliUHQzOVh0?=
 =?utf-8?B?cGtzcHRNdWVkM21vWjZJWjIzUy9mMEtCUmIyZXE0eDBMQVZlRWQ0aHhST0U1?=
 =?utf-8?B?QS9HVGF1c3FnRHhqSkdNU3NkUGVXVWdITzcvVGlRbWY3UmluaTRMSDdVWDJv?=
 =?utf-8?B?RXVNZFpDZHR2aHFML1JDcEJQSVdSVldEVVpVRlcxZ2x3ZW52RisxM0JTZTd6?=
 =?utf-8?B?UzVnc3cyS2pudVZGN2F2RlJCVnRqYTZULzdUSm91Y0dNU09BVCtvMlpUOUU5?=
 =?utf-8?B?TTJuRnl4Vk5oaHFrWWc2b1gxc0FwMVcrVk91ZzNrRldxTXo2NTR5ajcxMkpq?=
 =?utf-8?B?S3ZiNVRDTmlRbHFjSEh6dHZ3aWo1S2ovTHFsdWtYK0VXOW1NNTZnWUlKUEZS?=
 =?utf-8?B?LzdabE9RTGlBYWZ2WGFHWllBeFhTaUVYQ1JEUm9sVU1MUmtEbVNsMEszUHZM?=
 =?utf-8?B?eTlwM1VkWjdiV29VQzVKMGVzc21pMy9TaHVVM3VKWE9LNEp1UmcrKy9SZVZ4?=
 =?utf-8?B?ek54S3BSd2k4VjV0MEJKQnNQSUlWVGNuR3ZrVTA4Und2LzRLU0s0WlRZbEVU?=
 =?utf-8?B?NzJyT1RsMVgvUm9hWE83OHRCTG8rdENIQVlKTXMzNUZKQ3B6aFg4RXZ1STZF?=
 =?utf-8?B?K3RvK2RIcmpMSFI0UU03blpxUHcya3NXWU04MU5LcmJ3YTUzb0xFd3poYnlz?=
 =?utf-8?B?RFlNZjdERHMydTZYekdzeDRXYTJ3WnRHNkdkMnhDSzlGMCthdXEvWGoyUHJS?=
 =?utf-8?B?UzE2S3Q2ZGpYcTFnby85REdpT2E0TUZXUUR4ZWJIL21zaENOQ2NvczJ5WXJV?=
 =?utf-8?B?Y3ZZOHloY1Blc0c5TFdrSVhTeFhFZXU0ekNpeFd6bVNJQXJ1UWpCcDdsMFZT?=
 =?utf-8?B?LzZqUVBVZ1lhY3YyK205MzR4ai9rTFlyQmJkcWd5eExQSUdvYmlCRnE5dW12?=
 =?utf-8?B?aXgvZ3RoU0RpRVVteWExdXVQQ3VJNnR3UVQzbEY5TDBKMVdnTXVZdUFNTm5J?=
 =?utf-8?B?YldUcXNYLzZFMVI1c28zandDRGhkSEZKVW5URXU1SzhRdUNHMlI5T1dMRU0y?=
 =?utf-8?B?dDY1UEpLLzZyNExxTHJCNW5sMmVyQTE0Tzh6Nmo3QWJWNFRLTUtjRXVTZHZo?=
 =?utf-8?B?aUNaYmJIRTFGa2V4VnF3dVhsSDVtcm40RGROMDVaMGhKcVBwenFGRlI0cnZz?=
 =?utf-8?B?SEdac1phSzNBZDI1RVAwWENVdUYzdjU4WmVmSkVVVzAyeUF6Q0VTbnE3Z29L?=
 =?utf-8?B?OE5sZ3B5bEZGMXVHY3NmdGxaZkpJd3ZDSGZwZVJkNFhDV2JsbVVKTDA2WW84?=
 =?utf-8?B?c3JFMEZ6N3JoYTRPVTV0YnQ1eFEvRTNDK21ZYk5kK0IxVzhDUjBoSDQrRFhp?=
 =?utf-8?B?a3B4MlREVjBIeDY4VHM4ejQxbFlvaTA4UWhBNHJIOXB0N2JzNTNacDdDQTBt?=
 =?utf-8?B?TWEyOG04VmtJYTVwRnY1R2N0MUlHUHBHTXpORjRsb2c1V1gzaHh5MVFtVEU1?=
 =?utf-8?B?c3A2V3NOMzY5cVUvcS82WG43VHBjZXB0RlRXUzhnanJKQklZWmEyMi9lVFlz?=
 =?utf-8?B?N2tNRWtYblJVaXAreTFVMjhyeWZYbjE5NTZLeThQa3dWOTJwWnNpempZRENr?=
 =?utf-8?B?NmU1bzJBOFQxN05CV29sTEg5L0Q1OC9JbFlUMlhWeUw1WWdiUHduNkJEWHJq?=
 =?utf-8?Q?GA/Kun3UxxphVc63NGyVPYhsT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cf7182-cb14-4f94-045b-08dcc0e46043
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 06:50:27.9763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vc97SgnKd2mkcr+8b/FxWct6uRmLFLJ+AYof4VV33AkHekSzv/qm3sIYI/ROICxnn4ETwx4FaW+oixCrcC+5Pjt446QYFVM7iAqA+T+Bxlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6348
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

PiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMyAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVl
ZDogc3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pg0KPiA+PiBPbiAxOS8wOC8y
MDI0IDExOjI4LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+PiBBZGQgYXN0MjYwMC1pMmN2MiBjb21w
YXRpYmxlIGFuZCBhc3BlZWQsZ2xvYmFsLXJlZ3MsDQo+ID4+PiBhc3BlZWQsZW5hYmxlLWRtYSBh
bmQgZGVzY3JpcHRpb24gZm9yIGFzdDI2MDAtaTJjdjIuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+ID4+PiBSZXZpZXdl
ZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0KPiA+Pg0KPiA+
PiA/IT8NCj4gPj4NCj4gPj4gV2hhdCBoYXBwZW5lZCBoZXJlPyBXaHkgYXJlIHlvdSBhbWVuZGlu
ZyB0YWdzPyE/IFRoYXQncyBub3QgYWxsb3dlZC4NCj4gPj4gWW91IGNhbm5vdCBjaGFuZ2UgcmVj
ZWl2ZWQgdGFncywgY2hhbmdlIHBlb3BsZSBuYW1lcyBvciB0aGVpciBkYXRhIQ0KPiA+PiBBbmQg
aG93IGlzIGl0IGV2ZW4gcG9zc2libGUsIHNyc2x5LCBob3cgZG8geW91IGV2ZW4gd29yayB3aXRo
IGdpdD8NCj4gPj4gR2l0IHdvdWxkIG5ldmVyIGRvIGl0LCBzbyB5b3UgaGFkIHRvIGRvIGl0IG9u
IHB1cnBvc2UgdmlhIHNvbWUgd2VpcmQNCj4gd29ya2Zsb3cuDQo+ID4+DQo+ID4gU29ycnksIEkg
ZG9uJ3Qga25vdyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+IGlzDQo+IHlvdSBvciBub3QuDQo+ID4gT3Igc2hvdWxkIEkgc3RpbGwga2VlcCBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Pw0KPiA+DQo+ID4gaHR0cHM6Ly9w
YXRjaGVzLmxpbmFyby5vcmcvcHJvamVjdC9saW51eC1pMmMvcGF0Y2gvMjAyMzA0MTUwMTI4NDgu
MTc3Nw0KPiA+IDc2OC0yLXJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbS8NCj4gDQo+IEhlcmUgaXMg
dGhlIHRhZyB5b3UgcmVjZWl2ZWQuIFlvdSBhZGRlZCBpdCBpbiB2MTIuDQo+IA0KPiBXaHkgZGlk
IHlvdSBjaGFuZ2UgdGhlIHRhZyBzdWRkZW5seSB0byBzb21ldGhpbmcgZWxzZT8NCj4gDQo+IERv
IHlvdSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBub3QgYWxsb3dlZCB0byBjaGFuZ2UgcGVvcGxl
IHRhZ3M/IEkgaGF2ZQ0KPiBkb3VidHMgaWYgeW91IGFzayBhYm91dCBwZW9wbGUncyBpZGVudGl0
aWVzLCB3aGljaCBpcyBlbnRpcmVseSBpcnJlbGV2YW50Lg0KPiANClNvcnJ5LCBJIGFtIG5vdCB1
bmRlcnN0b29kLg0KaHR0cHM6Ly9wYXRjaGVzLmxpbmFyby5vcmcvcHJvamVjdC9saW51eC1pMmMv
cGF0Y2gvMjAyMzA0MTUwMTI4NDguMTc3Nzc2OC0yLXJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbS8N
ClJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxp
bmFyby5vcmc+IGF0IHYxMA0KU28sIHdoYXQgc2hvdWxkIEkgZG8gbm93IGF0IHYxMz8/IA0KDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
