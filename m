Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944B967D1E
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 02:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wxr4F3tXQz3cHx
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 10:59:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::700" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725238746;
	cv=pass; b=aOEZWous2plO5/bXmbcuwdS+22ZQutDt1Km234HpEd3aex9LVFtJethL2wDGqtjWCNRWkrIRy8AHLAoSYJqDLhnSGWfjZiCyrY4m2i385n4tQBDFp8fqudL06dFgPFIAa+ZxOOBGUEctaiA7isZ7QFUbhcF+CRl538eqx1WEOegkYyGNLXbibo5MqkXpkFUonPX0u+ExZixUxUOcHzQ4pjqDe4WvZWwNvQIul+pw1/QDDSmNyGJsd5JKC5kNShSPJEgPJFGvD8RrZmwJ0iOgdJapaDFt31Xujrq8NNZijRyEGVE7niXiaQpVDVyrtA6Fyot/GCTURAyLfrOpbHxB/g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725238746; c=relaxed/relaxed;
	bh=wOqfMq/TOw2w1dNKfQZD2PDyGSiL0jxyhphjWUvHR2M=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-C
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Zq9irj9v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::700; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Zq9irj9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::700; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxr496KTJz2xtp
	for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2024 10:59:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD/uQWHxJHrRLxnm8PyJP2deyU/Vt+3PJmomn6pESEM6FuaIBQXr1CuSRwgGGeMtUBVxnCrMsrX93RJedlNZ8cb46hhOmRseCNK8PErz9ZYUC7emXliiIDpViDjksNwfwXjgRlHKHCRyZjoVfVJItufI1ZRxEbMKHP3dVfceQinKs2grnGsyT7eE/szDcrxBzed3UVeS/ayMAxncpMQelK7uRTbcTaZpdVaaDnju+BX3PIN8/fZnCUj6JPq9jfWSAJw6IZJ5cxGTgwSguV5zClkPzIHRLeyp2mmJPwWgoSNb7MKY/AqBcLHQtDdMdhS09X0DWex/exz7hsmncV0IgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOqfMq/TOw2w1dNKfQZD2PDyGSiL0jxyhphjWUvHR2M=;
 b=ZxQyI8OFEn8AFCbPsAvAkDL4OouWKXDC0Jpyz+dCvHUZ1uywRgKl6OBLhKON4HcpGb+fuGKk6RoRPaMyYpzwjbUbyHuIGjyUy8qMCCbENs1GC0u7Y5sRkU44HOAgrqUCi++ftNkGaozpwcAaxaLXxawQZLsoPUwvY+yZkyrSTI0NF2PjqTvNm8+j4TIA8QMhQNCfS1+Eo1Z69pOJ5AYjqMa4s8pxn0QT/NuRpi4/1IxmaSM7qBWlWm2h5i/JOJa7mMPhc8nnA4HcWi9++aWA4gf8kGkVf7/FivNi9wmms9evMw0b1F7I7w8opFtVxX6FyDyx4uTIq6jeLxwALDQhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOqfMq/TOw2w1dNKfQZD2PDyGSiL0jxyhphjWUvHR2M=;
 b=Zq9irj9v9C2AZlXilKJs0P2XEZ/h63UQxfjvc8sHtleKq2FAPzw3OByfwDoHYlNC09A6PgBmvRcq9xUUjrdnToRLmy7jIHF1q1E1bsi1nUavgyPD/dx3pT5B/X/R5u+lx+2g7GyBp2A/E/ZBKXHguQSczQDwLOL+lmywH7XBtNdeTESJmDi656viMTiXtEyvF4ged2XBzwSCZJe3ArZ3oG4zw4+vnAkQtR/lW3oPScPWc9STvEZtBVV9A7oHETHyR0NZNwPQTN9Cit+t/6aOn/sPg3AYsKdbLkOKe+Gd6UdoF8uTHcBKG0TqlhIJ3pnT5IOy8ycMB+baC8gVMfGYMg==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by KL1PR06MB6209.apcprd06.prod.outlook.com (2603:1096:820:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 00:43:39 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 00:43:39 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
Thread-Index: AQHa+ezB4LDf1KKIuUSSZ8BsLCYoHbJDreJQ
Date: Mon, 2 Sep 2024 00:43:38 +0000
Message-ID:  <TYZPR06MB6568EE392C0B1900D18BD609F1922@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
 <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
 <172491982164.2766568.9027879446207472741.robh@kernel.org>
In-Reply-To: <172491982164.2766568.9027879446207472741.robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|KL1PR06MB6209:EE_
x-ms-office365-filtering-correlation-id: ed35c467-49ff-4769-105c-08dccae8494a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?WjFlZTMzSjNzaFdFaTNQcitHbUp2cFZVa3FYelgxNm1WcEUvMFdvS3lQZ0FR?=
 =?utf-8?B?eUVNM0diQitjUkRERVVlU2NOeHlDcU1oS1pUc1JsNGl5MFg2SHhGc2JCN3h6?=
 =?utf-8?B?eEVTTkY5azlaNUU4TllyWGxTRmZLQVZHdHRobDEySGY1S3k0VjZ6RzVPSUJu?=
 =?utf-8?B?bWlGZVVTK0FDT0k3RWJzczBiYTViTVlCYnhVR1dicFh1VEFvTzFtMDF6YXFS?=
 =?utf-8?B?R1VlM09GQ2ZoazlQYzZSYUg1bm5tSEliUCs4eGZWV0hwMTl3UEdsQzIxMHpY?=
 =?utf-8?B?SzZMamtaalVrUmxWQUg5MTBRU1Jra0UzNEowc0lFMUh1SVpEV2dsUmh0a3JT?=
 =?utf-8?B?UHBERkRrYUZBRE9Pa1gwK3RDamVML3l4OHFFUE1NT2ljWVdsMStoVndnS2Q1?=
 =?utf-8?B?ZHR5WG92T2hKSVhqNVRubGJQenRkTEZLbm9TZy84SjhFcmllMjR5YmRyVmFU?=
 =?utf-8?B?WjRPeWVpbStIdmZjbFNZWlhrQkdHZ0VVejIreUdjOEt6amdkQUR0QnZZZkww?=
 =?utf-8?B?alVScGlvYWErQy9kVWZlMVpBT0ZaY3QrTlpaMFV0cVZ5bzVmaVdWcEdsTGZF?=
 =?utf-8?B?d2VnekZtUVVJSXEyZmMvK2liRVFoT1B2cTlCSkp4dnFSdG13aG1ZTWVmWUs4?=
 =?utf-8?B?Z1lJQ000bHNITnJ3WER0cGNxNkZwalU2SmU0Q3lGV2F4SHU4NWhJcjZPQkpG?=
 =?utf-8?B?YTFraGhzVU9xOGFrZnFBRU5UZ2E3aVhLUFNVMzhNZHh4WnFReEl4OUY4L1lq?=
 =?utf-8?B?MEY3SHV3MzExeTZpd1VSK3NKdHlVNHUvQmlqTC9sSHlUN054RUJUTHQ4M29Q?=
 =?utf-8?B?SUpaQ2UyYmI0WW1abUZNVWxVNGRBNWxKc0phZGNaTDFkUGZ1STZ6aU1WZDBD?=
 =?utf-8?B?Q2d6WUpGRjRpRUUvRWZXak8reEptQkxLUUNGYTlqaHFSL0R5ejUzWUVJYkFG?=
 =?utf-8?B?SVg3cjlFZ3lpWDBuRU1ScTA4aGVBK1BLam8xNFBvNFFGZ1I3NWZFamVyZVNY?=
 =?utf-8?B?OUMrNXNUNTIzVnZVb2JIYWxqNUNpUTM1RkFHTlVvYUdQM0twRmRwdzFtWFBq?=
 =?utf-8?B?THFncHBQK0ZKRG1CYTIvSzAxK3VKK0pUemduSHBBYjBYYW0xTS9DQVlEMjhU?=
 =?utf-8?B?aHFLamZqeXNqbThkaVFFTXdZbWpGNjhRV3RjVTYwK0RBMXpsMHhOcEhGTWJy?=
 =?utf-8?B?UWJMU0NtZlNLUjArN2JxVm1vVis5cWFPTDc0bTZxWkE0OUVqRGhITDNpRnZY?=
 =?utf-8?B?M0xKaEczMjZHQ3lMeDNudmtCQTA2aVEwcnhmSEhhd2s2c3NTVTRUQms3QlJ6?=
 =?utf-8?B?QnkyN2hOTjRYaGtPWm1FN3VvcDNFVUlGNWw1ZUpOS3Ayam5tekFqK1hsWG1y?=
 =?utf-8?B?NWdGN2ZBT1poV2hRTnVrWkxUTEUvdWxJVWQxSG1BajhpaUNzTjR1aXZZb3lZ?=
 =?utf-8?B?YnFOTHRRVmZXZjF3WEhTb0pFRm5tZFRndm5xQXlQR0xzbm1DZlBmRmJYSVhX?=
 =?utf-8?B?ZytiVmFUOTg3b3NXeGRUdzg1U2R2K0dwYjFaVEFpZlpyYVFmZDZUcXFUZ3pU?=
 =?utf-8?B?eHNjL2tJcmpVK1ZORWMrSE9sRm0xQ3pUZzNDSVRHbzBPVkhzRDNuMnhLQnJU?=
 =?utf-8?B?c1JCOWEvQ09zYnJGZFJiWEpZUTcyNm1nc200VTY4SVhreFVwQjhLR1Z1OWlQ?=
 =?utf-8?B?bC9na1JBM1JRL0J6SXZDOTQ5bWtRQmZRaXRhb2Q0Z1FTTlUxQ2M3VzlIQ2xK?=
 =?utf-8?B?Q3c2RUtrRjNia3RQUkQvS0ZuR1ovWE5ZcW9QRThpWUdYelBab3o5Y2h1QUx0?=
 =?utf-8?B?cStvbUs3bkM2ZEYrTmYwTU1VdDRldi9iN01ZM0VEVjc5OFN0TnJncVBnQzFv?=
 =?utf-8?B?eXhCU1BqWFNseVNlcE1XajhydUxKQ2tBbW4xTFBETjdBTHc9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFMwakh1UGt1Nm81azZJc0V4QU05K1lZSzRJUzdTa1JzTDJWQnJKL0djZGJK?=
 =?utf-8?B?SFI4SDEwVjlUMW1ML1BHQlRqdVVYVThoajgzUnkyOTFnUkxaL3VTejRaSUlx?=
 =?utf-8?B?ZUplWlYxbUhlUS8zd1pvSlcva0ZqK2ozc2NzUmxCb3ZlR01WMnlRWXhvM0J0?=
 =?utf-8?B?NHhDSVFIMkR3WTljVVk0QVZMSENZVTExdUd6SUdyZjdmeWRrSzRzZ0Jra0pY?=
 =?utf-8?B?S1VWMHZOaGtuUGhVSHQxcXQ5amZWTXlFdXlaZVRDR0dmT1FCaThsVHV2bEpK?=
 =?utf-8?B?T2Y2YWV4VVFNRGhpM0dQczQ0SVhUVFFFd1p5YmtMRkx1ZHBESC9KcEIxMGQr?=
 =?utf-8?B?T05BeXJMWndJZjFVUUd6QVFDdG1jYzlvYzlyc0RZa1dJOXJ2ZGtCRkpFUGI1?=
 =?utf-8?B?KzhxRnlLSXA5N2Q4eHV2bXdLa1pRckQ5b21CTkZ3bmVZNERtTnNJLzlVV2pC?=
 =?utf-8?B?cWhDMnNteitOeGhQOTJER1hRa0RWa2dXQWRuNERqYUd6RnZicndIcWRseDVL?=
 =?utf-8?B?T2lQN0lnNU1jeDJBdXJZWkxVMzhEc2JUTTMrS1pTOXE4VUg2SVRCbnlKcXFq?=
 =?utf-8?B?YStRaHZtSndKdGhaZG8wemxoRmJRcjVBMnhzWTRQSForL0hZK0M5eHVPb1dq?=
 =?utf-8?B?clNvUzlRRnh0bm1SamcvRk5pckJCR3JhRmY3MVVXcTBSanpzTXY3UTkwVjkv?=
 =?utf-8?B?NCtmSThQTUw5OW5wUjZjcEthY3VXK0ZHMEVWVVc3S1lwalMrNEdEVk90T2Rm?=
 =?utf-8?B?V2czMXg4RHV5YjFVSHdudHczUDhtWjE4aWdBYktxZmVFejJ5M2tpTHI5T3NJ?=
 =?utf-8?B?SlE3RjE1OHZkWlU5OHVKMjR5R3FrUjN5YnQzUEFuRWQxVllXZVdJc0grK1V1?=
 =?utf-8?B?bVkrR1RxRk9VLzJWaE9vcCtCaW5QUFFXUW5NVWVDUHdJNlo4b3pWQlFYa1hj?=
 =?utf-8?B?dGJxQ2Vsd0p3S0kwYWZQY3lXQTlyWVFETlVqWmdmN2ZMUENhSWJoQjVHYWRM?=
 =?utf-8?B?cnZsM2RGb2gzWDJ6OFdZVzdwL3pYUndkdXRCcytpUEdEVGlwWE92MDNTS0Zi?=
 =?utf-8?B?NC9XQ2cvQkRtNmNqR0JwUHJIbHhwcll0NnkxelhjZkhwTnVRWFl3QnJLN09I?=
 =?utf-8?B?TWxISVhJTjI5RTNTL0xTbVpsR0JlbmZWd0FTVW8wQlk5Sis2ZWh3N1hYL3Fq?=
 =?utf-8?B?WWR5RmlIaE9qSUd3UkR1MGtrREtvcTdGamdudnNkRk9iQkNISEVYVm93eGEz?=
 =?utf-8?B?RUlCWHMyZXVwYytZTGFMZ0t1a1pIbDIyZS9xQWdSVldBVzIwZWtxZk83bEl6?=
 =?utf-8?B?S3lJZnZtSGNJUGJlWkNRKzlQKzlFLzNwcVJIc2lBRDJJNmlCRm9RdXdBeFlL?=
 =?utf-8?B?NFRFQ3ZRd2IyWjd1c3JLMk43SnFOeHBFeElERGl2dFhycS9GcERvWjNOUU4v?=
 =?utf-8?B?TjJJUlVXQ20wb3BPL1RJUnpQM3lBQk82ZzNqZXZwVFlJSzl4VGlNZ2NzNEJZ?=
 =?utf-8?B?NTdOMzc3NU4zOUI4ZHdISERub2JIM2pVNFg0T1ZkN0R3b2tycjAwbUJXRXFL?=
 =?utf-8?B?Qys2VjBSTUQvWXQ2UGhWRCtPeHErZUhzTisrQzZ3d0RMb09RWmJ6OCtwUFFB?=
 =?utf-8?B?SDZNcVplNnlFSys5dmhsQU1PK2luOU1hUDAvQU5pMVg2UWRIOTU5ZXlaNVBp?=
 =?utf-8?B?bGN3MkZQUVBmT0VkWEpOVzdoWGJ0MXgwbDNYdk5tc2NGZXFwNjhyMWVzZTR6?=
 =?utf-8?B?bGcvdE5mK0pLTXlnclJMQ0daQlVMMUx0eUJHK3QwWG5MUmt3dmhHbk5wcGQr?=
 =?utf-8?B?Nm96ZldiZ2xFUVh6ZlNQaURTbWpHNGNOSU5IQ0NYM2xNV25RUzFjR0NWbHJE?=
 =?utf-8?B?ZzVoMStaTkExMzFKR09CSTNycXhVUmtmK3hDdDE2eDhhbWZWNll6ek93SENa?=
 =?utf-8?B?bm9rdlB6ZlFpaEhRdHFEQ2FGeks2bzM3bFZPL2RYbUdKcVZuWVBSZHVqQW9C?=
 =?utf-8?B?Mld0ZjFhL2lRU0M4YzZjRDUxV2Q4UlU4SmFSaXBiT3hyMkIrRnVreHN3TmNx?=
 =?utf-8?B?ZTlzQVc1UDZkcGJmV3YveUNNRDFNZGZVK002N2VQY1Nid3loU00rdnJWdExI?=
 =?utf-8?B?UjF5UTEydDVHdnpiODUwOUtGVDZNd05zUzFwMytHbG9nd2dKR1BMK3RrYjRI?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed35c467-49ff-4769-105c-08dccae8494a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 00:43:39.0242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVaUQEklUcL4hQJCVQSARH2gCTOC5X3UsFWJkXtkppoDE/gPkwc6eJxhf/zg12/EZ49y5oU9ASHPVuVxZImpLncH3FDE5iCCt66hYs+dxJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6209
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "joel@jms.id.au" <joel@jms.id.au>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUm9iLA0KDQpJIHdpbGwgZG8gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYmVmb3JlIG15IG5l
eHQgcGF0Y2ggdG8gYXZvaWQgdGhpcyBraW5kIG9mIGVycm9yLg0KVGhhbmtzIGZvciB5b3VyIHJl
bWluZGVyLg0KDQpPbiAyMDI0LzgvMjkg5LiL5Y2IIDA0OjIzLCBSb2IgSGVycmluZyAoQXJtKSB3
cm90ZToNCj4gT24gVGh1LCAyOSBBdWcgMjAyNCAxNDo0NTowNyArMDgwMCwgSmFtbXkgSHVhbmcg
d3JvdGU6DQo+ID4gQ29udmVydCB0aGUgQVNQRUVEIFNvQ3MgdmlkZW8gdHh0IGJpbmRpbmdzIHRv
IGR0LXNjaGVtYS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9o
dWFuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL2Fz
cGVlZCx2aWRlby1lbmdpbmUueWFtbCAgIHwgNzgNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAuLi4vYmluZGluZ3MvbWVkaWEvYXNwZWVkLXZpZGVvLnR4dCAgICAgICAgICAgfCAzMyAtLS0t
LS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9u
cygtKSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvYXNwZWVkLHZpZGVvLWVuZ2luZS55YW1sDQo+ID4gIGRlbGV0ZSBt
b2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9h
c3BlZWQtdmlkZW8udHh0DQo+ID4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAn
bWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiANCj4geWFtbGxpbnQgd2Fy
bmluZ3MvZXJyb3JzOg0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gRXJy
b3I6DQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3BlZWQsdmlk
ZW8tZW5naW5lLmV4YW1wbGUuZHRzOg0KPiAyNy4yOS0zMCBzeW50YXggZXJyb3IgRkFUQUwgRVJS
T1I6IFVuYWJsZSB0byBwYXJzZSBpbnB1dCB0cmVlDQo+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9N
YWtlZmlsZS5saWI6NDQyOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvYXNwZWVkLHZpZGVvLWVuZ2luZS5leGFtcGxlLmR0Yl0NCj4gRXJyb3IgMQ0KPiBtYWtlWzJd
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPiBtYWtlWzFdOiAqKiogWy9i
dWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvTWFrZWZpbGU6MTQzMjoNCj4gZHRf
YmluZGluZ19jaGVja10gRXJyb3IgMg0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjIyNDogX19zdWIt
bWFrZV0gRXJyb3IgMg0KPiANCj4gZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tk
b2NzKToNCj4gV2FybmluZzogTUFJTlRBSU5FUlMgcmVmZXJlbmNlcyBhIGZpbGUgdGhhdCBkb2Vz
bid0IGV4aXN0Og0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYXNw
ZWVkLXZpZGVvLnR4dA0KPiBNQUlOVEFJTkVSUzogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2FzcGVlZC12aWRlby50eHQNCj4gDQo+IFNlZQ0KPiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDI0MDgy
OTA2NDUNCj4gMDguMzcwNjY3Mi0yLWphbW15X2h1YW5nQGFzcGVlZHRlY2guY29tDQo+IA0KPiBU
aGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlm
ZmVyZW50IGRlcGVuZGVuY3kNCj4gc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4NCj4g
DQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0
IHNlZSB0aGUgYWJvdmUgZXJyb3IocyksDQo+IHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMg
aW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8NCj4gZGF0ZToNCj4gDQo+IHBpcDMgaW5z
dGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0
IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUNCj4gdGhhdCBE
VF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVw
IGNoZWNraW5nDQo+IHlvdXIgc2NoZW1hLiBIb3dldmVyLCBpdCBtdXN0IGJlIHVuc2V0IHRvIHRl
c3QgYWxsIGV4YW1wbGVzIHdpdGggeW91ciBzY2hlbWEuDQoNCg==
