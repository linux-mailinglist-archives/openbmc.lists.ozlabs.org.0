Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A69CD46A
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 01:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqJ2p2XYHz3c5q
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 11:35:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731630926;
	cv=pass; b=FoE+QInMgUbNRR5wWTQiZYDF9wFKlzyusEk9UOFZZRniItUllR5O2nzPZwOE+p9PkKMia2LeP8q1DQSnmulR/eWoBHsgF0vM+3tIWtyRBuRhtDPi1HEKDMmY1fIYWqccJidVXB3fxw+w9rrdAVNLJrsxSZir8qqyWHjNQbNwF1MPFB3LCGODrWjKctxLDPRI5I49O/+4tqp5On7VQndTAL7dWHfau99FBhlGlxULoWhv6UnmMlVxeUS7Uqlfc0/fdGunZcaVHGAod9d3eK3dzMSQhNuNmIIhX8eHPL4sYkrOplYeEFVTh7FlmJrnEIpS4/HXjFsdFCNS3KH8j2dQXA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731630926; c=relaxed/relaxed;
	bh=FJxsoGTPhyOjifKaJe1Q2h8jvGei4dg1JsKSPXv8QRU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hQ9oBXWoYuotN3nRCLrScGI99AASTatgIwW2Gb2vqpzSonAKTcq7aPjGiPGs7j2g2D3PxnwfciZWBOriLoJHgeD4CYbeM1GfZZFHAJAFQSRE0nT9KaC31jQH5nlX5AlY7F9CwB7KWGQ9Z+Oq5juIFsD9Xoc0/2be5b0MJl0S6FZb3qmdKBsyud6zFpOtAPBpZr6Ens2tPqf+/PgbqbYe/1LwK/st4dXrSI6LeZNejv/O+xK012UHj8JfkpkCzOmtvvhI88z5SmU/9M7bxaUwhGnv4oxPshkoIAUgSR+tA6gVVnGkQah7/a8vWHQo8I9mIxrKvuKZYD2z8LNMEmsUhA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=PvtJBqBh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=PvtJBqBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqJ2j17Vqz2yF6
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 11:35:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOXCZoYSUZYeZYZS69VjGFrV8j6uUrCjsVrfcFAuCd0PFkGgpnTIFpjC0CVIUr/ELk2jfjvLQ1oyn4+9bUvxDJViMvI+ngQBQ6GQE/raz458gQ0mzP/YYhtEo/pOrlTqsDoNLyTvT8c2xjioivnJdH/5NFXFf0rFrMj0R4w4ysVqcn7jNmjUk3IOLejrM8W969TYb21V3/USV+uxEfGugEbNzhLAHGa3xQpNDZFHIAEWDM6BbjJRgf+6/nVhistm+kIL0L+r4WlGx6h0jratKUFFob4cL7rAYsn9UjfsPD1SQKT7xgVAWTRBJ9MBS+Q2wRGXh9/APvq5EQPMBwaTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJxsoGTPhyOjifKaJe1Q2h8jvGei4dg1JsKSPXv8QRU=;
 b=vKcXLeKpGFF7cLAz8EfbsCDxZIB3be2gKqGkZ1OxnIU1TSIwwQep/X5mvZwFUn41SRyS/OBXxGnaBA+WVnEoMh3knt4L4OvHbzaggD5iiTAyCu2asBEpfXN1Q1Qgl1MEmfTT74yEhL0FHmUVzEhgklY3RwdZPYhxpYPpWbKsRksaXyF/8VQ5nsoLfOPrKzOuwm8aglwlL61U4ETI8fHFFFwXgon+6eIvy8qEhHyQt1XxZT4EDbMgdc7c7q3Z2EuisheD20ovpPrLL+sagRcYTVVO11Aejtm/u2/iioxlw0+x2yRZGiFQ2mg64T45gM8c2XaiWpUHpZAG+uNi2RdkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJxsoGTPhyOjifKaJe1Q2h8jvGei4dg1JsKSPXv8QRU=;
 b=PvtJBqBhYUBGBoEUyAo3ySYB5aDFLaM/5Zlept9BOEJ3bZsDOdZpuP8ahDWbveYPwyeBTbNK4uvypAMOJakWSXhkKfggRp30Wfn0C5EKioOvyarh5CZ/Bq3UBcdKq01EffDW+lAR5xrmuNDhRxr/8HAkm1ZKeJFLlDCzswXr+QpyXLhBE/ffpqXzUnh+EyjHZrO/WvAl6NR7y8Es6R2+OQQiY7v07m5SZSkgr4hGeTjAnetGwA4TDtPI5XxURaSzqTaLKNB/kUy/zGEBVFkjuuZLhaheiEZwTQQGQLGJwL2CGq9udqifncn/3XHLPnuWu9J4PzHWuuNzOa9MWRsjyw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYZPR06MB5997.apcprd06.prod.outlook.com (2603:1096:400:335::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 15 Nov
 2024 00:18:28 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 00:18:27 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHbGGxcfd5QCYaLt02IHuq/iSVWarKzqJsAgAFlhJCAACe3AIACgPdg
Date: Fri, 15 Nov 2024 00:18:27 +0000
Message-ID:  <OS8PR06MB75412A3FB0FD82174DD1C7D9F2242@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
	 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
	 <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
	 <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <6d8a0d8916e185090423d42217262450ee948088.camel@pengutronix.de>
In-Reply-To: <6d8a0d8916e185090423d42217262450ee948088.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYZPR06MB5997:EE_
x-ms-office365-filtering-correlation-id: 75170ea1-fa21-4ccb-2703-08dd050b071e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|366016|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?RWdjdnZHVE51SEU1R0wreDQ2RUZzMmhxTWFNaFJqM0cwOGNxeGg0N2tsSlVO?=
 =?utf-8?B?d2h2MGRlMHF3MFpuaGdyMDF2azZ5YjVBK1dGckNQYTdzbjlqTVZ5UkFrTG1O?=
 =?utf-8?B?RzF6NDhiN053b093dVc3MUc5UVFPMkQ3OFpvQXducXBvSWgzdG1FL1pVcnFj?=
 =?utf-8?B?WW5uS2R5cFNVM21FWFExTk1BWTkrbDIyQmFZUmFlNGJlK05qRURvV0ZrQ1g1?=
 =?utf-8?B?NmZNSDFibjNiNDZhbnBITW1CT0VuQU15RDdCSGdzeDNTTVozN0tNempWUTZR?=
 =?utf-8?B?K3h0aFVBMno3Uno0VXlQbitnWUhwNUpDSHZZNmhIaTZRajRuNkhYS3Mza0hq?=
 =?utf-8?B?eENhZ3EvNW5PYzhZVWNlTW10R1AyYkdLS2lMR080Q0RVa2dVTmllK2t3QXRG?=
 =?utf-8?B?ai8zcjlBRmMyRERQaG9oSkh2SEZqaDNaZVJNU21mSU5WbTIrQ1FPMEhpUitB?=
 =?utf-8?B?dGZ3RmN0SlppWjZkWmVnU1lGKytJQkhZQ3lBdGRaeEkxTGVmaEgvM21nZlc0?=
 =?utf-8?B?UnZHZ3lJeFRFMGR2TXRyOEdnN0tybW8rSndlbG8xNnBxTGRiK25YbnltWEx3?=
 =?utf-8?B?eEhOa1pJV05zRWpZQ2kvWm5KY0k1TVUrZDNXcFA0dHNsNEpLdXVQZmt6ZTdH?=
 =?utf-8?B?QXVoSXAwQ25zVWxrVnIraFVmVmk4ZFdqNllUS0cvSjJaVWY4Rmx4ZUdwWVJx?=
 =?utf-8?B?VDNXVThFSDRJOXNielEySEVncEZ2eWhyWEx0eDhkSk1IV1Y3ZFAwUWdVZ2la?=
 =?utf-8?B?Y0dwZkpLS3lvWFU4bHQvbUNQc2NScktjN016TlVOQVdQZ09KcXc2OHRiNEkx?=
 =?utf-8?B?dkllVElKT3pKaXlVNEtLSnRZNm9ENkVlSVRQMXZKV3U1TkxReTNNbi9iUXhj?=
 =?utf-8?B?NXJCQkJPcW9XNUVacmpBRExFNU9mZkh0K2plemM5TE9MelJ3cFl6UThVQ0oz?=
 =?utf-8?B?ZTNtclI0VlNORzJDZG9xNkw0OHZWTDJST2doeTE2RUFDUTFNcHFGQXpGVmQz?=
 =?utf-8?B?WndVUjE0WnJEMWFsa01oSXM0SDJGV2RzTXF4U3hRblJSK2dHY2FKeWVGdWZM?=
 =?utf-8?B?TEJpM3FMVlR6RVlOWUJTRkg2VDdxQUZnV2Nvc2lDRmY4WldZOUgwSWN6OEJ1?=
 =?utf-8?B?Zytvc3oxZnppdWp4dTBtVUZDOGR5QVNIY3BtRzZuNVQ0T1FabG9SWjY4dnVm?=
 =?utf-8?B?UVNjSEFidHFTaXJ0a3UvZUdYNFRrek0yWlNFa3dJcWMzeVpXOUE4Nnh6Mytp?=
 =?utf-8?B?MGloMUUzNnI4WDBBYWkrN0hwOGMrQUp4aFl3cm9DNTJGM05UVVVPYVQwbU8x?=
 =?utf-8?B?TnVoUkgvZndZcXg1dG9FQ2dUUjZoN00xbmdCZzlhTVp0WmJFamIzc1prNW9E?=
 =?utf-8?B?Qjh0cW5aUEQreCtibUE0S1dRSENCSXd5V3JCdWFkU3gxOFE0SnE0MUQ4dklI?=
 =?utf-8?B?VkVyNmJCU0g3R0RFTWN0aTlYck01TG11Ui9JNTN2bGtWMWRCYVNGM2xVRXVD?=
 =?utf-8?B?WXZTUys5Slk5SXJFTksyMEN0c2N6QUR0dVg3d1ZvcHVzMHpseVVGOVYrNFFP?=
 =?utf-8?B?UXY2TG9KaVp3eE9aYThFSEUyNlEyUTQzSERXNWtUZ0sra2VRcDVsYlNjamN0?=
 =?utf-8?B?eVRETCsyeVFaNmZGRFd5WFNYYmhCZmlLTEZCVnh4ZVhKNXdMN1N4UzAyREYv?=
 =?utf-8?B?alpKYVVoNWI4VGhIcFhUbGZSTHZqejJ2VUR2WjBlMkZDcTFpZjhFZkY2bGJO?=
 =?utf-8?B?UGRCT3h1MmhsS3ZKY3B3bjNFdERqUkx1a0VxRnpoZlVhUEN5TE90Y2FVcGFH?=
 =?utf-8?B?VmxzWmJGdzU3MDFLMHgycTcvSlZNY2pHeGUzMFRGY1VTZFB3czNCa3A1ZVEy?=
 =?utf-8?Q?VdyZRHwJdANc/?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TWhDd09aQ3cra1ZFMVk5eXdSVmh0SFdLblhZcFVBa2NFRmw2REs0OEFjOTE0?=
 =?utf-8?B?Q1JzdCszc24va1kwRUlmMGswY1FjdVJ3QUt6K05uSHpoNzFRV2pWcG1GK1cx?=
 =?utf-8?B?N1JpTFl4TzI2N0FHd2tXSnE2bmRKVFFHZGluNTY4eDZpVElTanE5Y3owUS9M?=
 =?utf-8?B?SVdsK2ZBU05xdUMwZ1VlaDFjbTNCTW5xVVZTSUNPL3hpZjJ5TkIzeGNhc1c5?=
 =?utf-8?B?ZDgxbFJIL2ZTanFMOHhpZXd2TWNHNXljWTVBOFlvN0JKeEorMDBoMTBUTjQ4?=
 =?utf-8?B?SEFDYm1MVTJOTktrMHpGbTB6TjM4cTZrU0JkTFJGUUFrMU9pblh3Y3k1cWNt?=
 =?utf-8?B?MFN3U1dzZXlJZnZQWHlPOSsyeUhDdE5pV3daSWtENkx0Y2Fzb2ZWNlowWTJa?=
 =?utf-8?B?QmNobzNHaXRhWHFJRDl0anYrdDAySWdwbmRpbEVlRVZEZG9NQ2kvaVRGVmxz?=
 =?utf-8?B?cnU2ZURlQytrR0g3RzM0cmd3KzNtN1o3NzdWY0FDZXl4TnpFRHVLL0NEMWdh?=
 =?utf-8?B?eWNwbHJhQlJNckpIMk9GQWFET3hMclFHNU5MMW5PQ3VlSmRpREZTai9zWWN2?=
 =?utf-8?B?eTlaQjYyRlZtVTVNL0tuczViOHBDYXRubGV3TzdrMHJQeXNnK3FqV0VIM25u?=
 =?utf-8?B?TlFnUURmSGlXdE40U3pVMzRwdWlnMHEvME0wdlE0OVU0NGdiQ3RrMzhUTjZs?=
 =?utf-8?B?c0tUcUE2aVBMdHVYUXpzQXRIWHUvU0xWV2R2cEJJQ0MvQnJHdDhqZFVGUkk2?=
 =?utf-8?B?OHdkZUo2R005b3JaQU10N1V0N01VY21GY2Rob1JvWS9oT1VIZzBHcFlhZVY2?=
 =?utf-8?B?Uzl1RC85VXk1M3hYTkdZQ21USTlFUmszNXEyak84cWxQSndZZXJ5RUpVUFNT?=
 =?utf-8?B?VlNRRHZveTVBK1dMeHdvaVVLNUN4R0dkRWJtN1VvcG9zNFRCMXB2WVkvQjE0?=
 =?utf-8?B?bHQ2ZWxSWGs3Wm5OZG9wc1BCVGdkS0tlZjBhazg3Tkw2bGhkazBndm9XQlQ4?=
 =?utf-8?B?UzA0U3YyVVN4Z2x1LzR2c1pHUmFCUEJKd3JCQjZ1U1dDcnc3SWNDZ0xoeUYr?=
 =?utf-8?B?K0NSL3dRWXM0SFBxKzhCajhMcXJtWGhNeC92N3Zmc1lhM3JhN1g1U2tHMUkv?=
 =?utf-8?B?VGNYdWhRQ28zZGliQ0JJS0NmUGdUMVIxQWVVK2R5RDAvVFdvckNFQXVVUWs0?=
 =?utf-8?B?K2JFdVV0RzhpSEpFcTdiVXR1OW52Q0RWcXZxelJtblpiSWpRYm9ZSDF6KzNC?=
 =?utf-8?B?eDRKZjZtL3dLd0pCOWUralE3ZUxaRllQY3FHUUZYK2ZIMm1WYTQ0ZTFUWWdB?=
 =?utf-8?B?YjFvUXFrZkNzUy9vVzVYUVVUMHZvUTU4OWtoYVRxN0lTcWRkaE1EeGpodk1k?=
 =?utf-8?B?ZTNYYmFzQ0hIQVNLejB6cnhtSDBsNWJtRzdURHBLeTM1STJ0eDlRTFRHb3NI?=
 =?utf-8?B?UTQ0bmZZeXpUU1l6M0lFeW5XNzRyRjZ2WDBXMWlnQVlXNlROY2tnUDJBUTgv?=
 =?utf-8?B?cHVWVXQ0ZFJ4UENWT3dDNTFYVE8zUHR3TlpIWkNFaHJ2V3Y5N1RTeFRUdlk2?=
 =?utf-8?B?WUNOUm1VYnUvcExFMzloRjJtdGhOdy8wTkhvV3JIeW5tdTVkY1JwT2dCaHFy?=
 =?utf-8?B?N01pdXdIeUdscStLdnBtK0swTFNEMnBLV20wOGxuTzF2a0plUnlaMTIyenNm?=
 =?utf-8?B?SEZwZmRMTjZaZDFtOTVXTnpyallCSGZRWEJzcWgvbnJueXJ3R3l1QXVsM0Nq?=
 =?utf-8?B?Y2RhS0xzVCtLbklpN1JwSnpsTERMYUhOc3NRTFdaeGpqZ20rZERMQXRxQ3ds?=
 =?utf-8?B?RTg5U1VrWWo2NnpZWXI1bHFXUjVlRjJ2RzQxTW5zK04reDRRUmRlaVZLZ2pW?=
 =?utf-8?B?ajV6cXpkbkhObkg4ZVZBTEVCM3NPWTV2aTJiM01WUDcwMHRaRnNlbzZ6NnVz?=
 =?utf-8?B?SDM2TDBvbDUzQ2lmeGt1ejF6T0tDeVNCaENRbEFKVEZ4Y0xPSklpRW8yb3hE?=
 =?utf-8?B?UGVTTW9xYXAvcHo2eDBLVk13RUhRcDdEdVBsT1MxaHZWRU9HS1FxdXZsd2FY?=
 =?utf-8?B?S2VjZU9aanozQk15MTBLTEJQNUdqd1NMV285Q0NnTGpvcFVMR25IOFZCMkNM?=
 =?utf-8?Q?TSB1ag2pDyrH6DurGuNTR/LyZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75170ea1-fa21-4ccb-2703-08dd050b071e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 00:18:27.8122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/qUpYYflMZMW9hIYq+pXT3yK0950gG0msYwrYFNGX36CqtYKwgPUbAtB8YkgNTUsDWkYvjeRNs9QydC8M0Ko7bhSUg219OGyeCtrizwDhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5997
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNSAyLzNdIGkyYzogYXNwZWVkOiBzdXBwb3J0IEFTVDI2
MDAgaTJjIG5ldyByZWdpc3Rlcg0KPiBtb2RlIGRyaXZlcg0KPiANCj4gT24gTWksIDIwMjQtMTEt
MTMgYXQgMDc6NDMgKzAwMDAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjE1IDIvM10gaTJjOiBhc3BlZWQ6IHN1cHBvcnQgQVNUMjYwMCBpMmMgbmV3DQo+ID4g
PiByZWdpc3RlciBtb2RlIGRyaXZlcg0KPiA+ID4NCj4gPiA+IE9uIE1vLCAyMDI0LTEwLTA3IGF0
IDExOjUyICswODAwLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gPiA+IEFkZCBpMmMgbmV3IHJlZ2lz
dGVyIG1vZGUgZHJpdmVyIHRvIHN1cHBvcnQgQVNUMjYwMCBpMmMgbmV3DQo+ID4gPiA+IHJlZ2lz
dGVyIG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kgYW5kIG5ldyByZWdp
c3Rlcg0KPiA+ID4gPiBtb2RlLg0KPiA+ID4gPiBUaGUNCj4gPiA+ID4gbmV3IHJlZ2lzdGVyIG1v
ZGUgaGF2ZSBnbG9iYWwgcmVnaXN0ZXIgc3VwcG9ydCA0IGJhc2UgY2xvY2sgZm9yDQo+ID4gPiA+
IHNjbCBjbG9jayBzZWxlY3Rpb24sIGFuZCBuZXcgY2xvY2sgZGl2aWRlciBtb2RlLiBUaGUgbmV3
IHJlZ2lzdGVyDQo+ID4gPiA+IG1vZGUgaGF2ZSBzZXBhcmF0ZSByZWdpc3RlciBzZXQgdG8gY29u
dHJvbCBpMmMgY29udHJvbGxlciBhbmQNCj4gPiA+ID4gdGFyZ2V0Lg0KPiA+ID4gPiBUaGlzDQo+
ID4gPiA+IHBhdGNoIGlzIGZvciBpMmMgY29udHJvbGxlciBtb2RlIGRyaXZlci4NCj4gPiA+ID4N
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAg
ICAgIHwgICAxMSArDQo+ID4gPiA+IMKgZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlICAgICAg
fCAgICAxICsNCj4gPiA+ID4gwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAuYyB8IDEw
MzINCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+IMKgMyBm
aWxlcyBjaGFuZ2VkLCAxMDQ0IGluc2VydGlvbnMoKykNCj4gPiA+ID4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPiA+ID4NCj4gPiA+IFsu
Li5dDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAu
Yw0KPiA+ID4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jDQo+ID4gPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTdiYTBlZTc3
YzI3DQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hc3QyNjAwLmMNCj4gPiA+ID4gQEAgLTAsMCArMSwxMDMyIEBADQo+ID4gPiBbLi4u
XQ0KPiA+ID4gPiArc3RhdGljIGludCBhc3QyNjAwX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KSB7DQo+ID4gPiBbLi4uXQ0KPiA+ID4gPiArCWkyY19idXMtPnJzdCA9IGRl
dm1fcmVzZXRfY29udHJvbF9nZXRfc2hhcmVkKGRldiwgTlVMTCk7DQo+ID4gPiA+ICsJaWYgKElT
X0VSUihpMmNfYnVzLT5yc3QpKQ0KPiA+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYs
IFBUUl9FUlIoaTJjX2J1cy0+cnN0KSwNCj4gPiA+ID4gIk1pc3NpbmcgcmVzZXQNCj4gPiA+ID4g
K2N0cmxcbiIpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmVzZXRfY29udHJvbF9kZWFzc2VydChp
MmNfYnVzLT5yc3QpOw0KPiA+ID4NCj4gPiA+IFRoZSBzaGFyZWQgcmVzZXQgc2hvdWxkIGJlIGFz
c2VydGVkIGFnYWluIGluIGFzdDI2MDBfaTJjX3JlbW92ZSgpLg0KPiA+ID4NCj4gPiBIZWxsbywN
Cj4gPiBJdCBpcyBzaGFyZSByZXNldCwgaWYgdW5ib25kIGRyaXZlciBhbmQgYXNzZXJ0ZWQgdGhl
IHJlc2V0LCBpdCB3aWxsDQo+ID4gYWZmZWN0IG90aGVycyBkcml2ZXIgcnVubmluZyAod2hpY2gg
aXMgc2hhcmUgd2l0aCB0aGUgc2FtZSByZXNldC4pDQo+IA0KPiBTaGFyZWQgcmVzZXRfY29udHJv
bF9kZWFzc2VydC9hc3NlcnQgYXJlIHJlZmNvdW50ZWQsIGxpa2UgY2xrX2VuYWJsZS9kaXNhYmxl
LA0KPiBzZWUgWzFdLiBUaGUgcmVzZXQgbGluZSB3aWxsIG9ubHkgYmUgYXNzZXJ0ZWQgd2hlbiB0
aGUgbGFzdCBkcml2ZXIgY2FsbHMNCj4gcmVzZXRfY29udHJvbF9hc3NlcnQuDQo+IA0KPiBbMV0g
aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9yZXNldC5odG1sI3NoYXJlZC1hbmQt
ZXhjbHVzaXZlLXJlc2V0cw0KPiANClRoYW5rcyBhIGxvdCwgSSB3aWxsIGFkZCBpbiBuZXh0IHZl
cnNpb24gc3VibWl0Lg0KDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K
