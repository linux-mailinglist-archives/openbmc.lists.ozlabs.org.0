Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025AA6D827
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 11:19:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLptP4yHfz3c2h
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 21:18:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::72c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742811530;
	cv=pass; b=l01SenpINltlHGKi0HKzrXz0LxFQqiTVGXoHePggLn1DhW7e0kO5FAiG9eBZnYd3yfqrxoZ1hgEmyiWlqLv40JJGxGjGhDMo6TpsIs96B00m0tpIiWUI1fgfp3EXbgA2P72+5Rh2bmJByzaQB/xpNaL4llfhdXULOLfm6QgLanHXbjDjjR2pGC25LNxVF018bGZOHwVSUR9KAh5pwKNFLaZVtcaXCnfh37IToT3hbJ1ZffiVYiyNhuxrFcFo/gwlnKTqij5UnV0LDIJCahB+znj7IpQZy+ccllmsZcxQh88tYmyakNs2ZUkjWTNMJJvptfUlBg9Jp8VZpmEblDWS6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742811530; c=relaxed/relaxed;
	bh=0lIBfMqRUz30ta5pnlpdNwTG8ELPqVQ0evXcUfn3VQg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j86rAuDF1Euyk3sDDJRhFi1fIk2sQwOy9LDhE8WTivlIB15gM1PgfVdQKXTq9U+CEx620xBlVko2LCQO40/+5I17wo6Q945vosiVIJYl9fP0yWl5lGbnkpNyweUtuacgf0ZayDmgvn0xYD39OZxDMQZDLy6CXjdk4X3cJJlOioLZzWME7nvaX2ndf0rZKgGVeyaLsUqE0u6IkrqQQkXFJ4OBPxve1/tBqOpwAeKkERgDcGDaR8vST4ZyiVLS8pGCTEHpPCiXAxo1+nhFDGOU3E4wdA9gGqMnNNj+PTpf14Ktru5BOdPLl/UBGKazE6EQE9cWJiAv+mpRPvwIhgX6/g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MYfZgub6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200f::72c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MYfZgub6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200f::72c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLptK6GwHz2xtt
	for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 21:18:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6w+FyWnvm8pkiapNrIw1Izr2oRP2fM8ld5KbROgAM0DU71qIAKPMxlwwzi9CB/4zvMc81oReaFe9NKYXdswdNHaDmNbfRHJCe7FGXNEd6WX9W7gSd3/JzGycuHAaQI4OYbQM14pCNhMJaybMa6l1O2/Q5cMCmgOnoFJSylVCz6XZ/pea3ccpnNbsRi7K8aEyFwNZlrCPG8q5uIh6m/OW+lopBFNUMncv/vc3zr4lFfriVaa16ylJu1gfGcHO+6Z5nT5SGVkTJXEl3k4ZCOV2Gi8bQiy8zXuKqqSjr1Iy3WKVUZLLqGgUSfIaYHZZ8u18ZODLSLgf+0tyn6bbJauGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lIBfMqRUz30ta5pnlpdNwTG8ELPqVQ0evXcUfn3VQg=;
 b=k6UrGyHqSYSKDuwz5mIzAAsnyzckw3WGvW3LCtRObtymk7aV8isFjO6LRyLnmzH8jkLGjzYjMmiy9KAmlXH7iJ3U6SBQ6PBUIRBmpdRS22BCDnINE7duBsAlhrUrKqLTLW9HND6tdmuemWiEzICa7lNecaL03trWzqImeDYw6aIv6y946PkrGJIm8E9SEowKdWvV/HvkZCYut0T2q8QDNjPBH0gxacUbHZlLzsCmXc6zlK9GMh/Mb5KLpYEvozlhzmx2LfYqlnSH5ykTwVLKvfiRI8K0cy7L1/nLOY3dS+YH/TxPq52vDy3zPH47IbyZdyllaHx02ehE7ye03RHQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lIBfMqRUz30ta5pnlpdNwTG8ELPqVQ0evXcUfn3VQg=;
 b=MYfZgub6MCZJvKq9v8dVa856TP6R71wlPe5roNHtqNuqqW0AwzgNW4Y9Oeo013+/CPGImPWsekoX+U/DK75dP8bh63eprCYBtqZUAVzdYl+DT7o2AcqKS5fdfDAd1Sxu4yvuHqdTT+FpqS6tssxCZCEKs54zFL9ldqmd2Kthj8wEluVG37XBMa6Y8q2YBrZXVGKT0iop1H4xICpeLu4TiJ2CMz4JWa2IQBjWB1RoFLdbfSI+36Oz4x9VTk827jKohnEQpCqYwuZvxuYl0xfEJnfSfBngA9OPQuQzJ5MaAk5ARlARu32LVZYgJpOn21Jx6AUS3aEMAyly/l4udXxeNg==
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com (2603:1096:4:235::12)
 by TYSPR06MB6363.apcprd06.prod.outlook.com (2603:1096:400:417::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 10:01:36 +0000
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f]) by SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f%6]) with mapi id 15.20.8534.036; Mon, 24 Mar 2025
 10:01:36 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYggAecSoCAABKwMIAACvyAgAANJ+A=
Date: Mon, 24 Mar 2025 10:01:36 +0000
Message-ID:  <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
In-Reply-To: <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI6PR06MB7535:EE_|TYSPR06MB6363:EE_
x-ms-office365-filtering-correlation-id: 078f0254-edee-4abc-3a3c-08dd6abadd0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?T21xRWI0bjB0UkRGdVBsN01tUUhMbTljMnlrVVBSUVJTUFdJSDlYT21sa2FU?=
 =?utf-8?B?M3ZNVHlieVZ5dThrRHo3M3VXVDN3SkgvbHdkZVJvNWRkZVQzTVR3ZDZBL25E?=
 =?utf-8?B?Tzc1Q0tOdUV0NW1xUGd4amUySTYvazI0S2RuWWtRYVR6TlhnNEtPb0RQMzB2?=
 =?utf-8?B?cmNJcW1kbjVmN2hlK1lFWExTUS9LejFGVCszZThpYUZwZDI4T2R4WDhTenBW?=
 =?utf-8?B?R2RkeXdxeU5IVFd5MlA5L2pDNlRoWjZnaGFRcFJVUGkwdlZUY3BsZlFZRmFZ?=
 =?utf-8?B?RUdvREl0M1crbGlUZ0JLWllmakhNVFFxUmJsbGJJV2NTdEJlSWpsL05XYTNQ?=
 =?utf-8?B?WFd1M09yajdrOFB1Q1M2d0w3UC9kQkx6K1Y4aHlkaU5pQ09qOXJsSitGSzBU?=
 =?utf-8?B?OUJLNm5keWZKNUpYUUJmSGtpd0gvWklyV2hDREh0YU5EZFduQ241NjAxYXhY?=
 =?utf-8?B?Z2VrUCtuOElJVFdoL21pL2FMYXRrTXpXU1NwbUlxdU5PelNMclljK0p2Z3Nm?=
 =?utf-8?B?K0VrL2I3b28yeDNMR2tiLzQ0a1IyZjJ1Y3VER0JlVjJIUFdxMUgxS2o1ZXdK?=
 =?utf-8?B?Wk1iWStIVVF6NmxPdTBEWExiZEdnVmFrZDZjUzQveVhEL2xHeXB5LzBVS212?=
 =?utf-8?B?TlVxQWNXQmYwUXRCbmxDR0NGRUhpNmdDbUQ0SVBXR293eTcrRkdIdDlUWUtX?=
 =?utf-8?B?dU9QeCtTRWdFOXVWZG1vVzhDcUI1a3llc1hpR2E3RU9DbWlLMGtoT0pUQ0lz?=
 =?utf-8?B?ZlRQZG05eTBURFdTYzJObU1teUs2QmlJSU4rY1FDaFJGRiswNWxMTWE2M2M4?=
 =?utf-8?B?RlZpekJFT2NoYTFDVWY3MnhwK1BTQnl4cVViN2dhcGRIMXJSRkV6NFpPTUVX?=
 =?utf-8?B?OEFRWUU3VkppVEh4dUlSaDNwMmRNZWhnK3dMbGh5aWV4S1VUNUpXQ0JQanhG?=
 =?utf-8?B?RVlXNGQ0aE1mcTVPcUh2MUladjJISXYxS09PZklkbGVqSnVvb2QzSjl5M3BI?=
 =?utf-8?B?b3NYeVRTdlkycGZlT1pKVVVZN0tDOElpWXhSTjBDQWhJaTd4VktRMVVNQU5P?=
 =?utf-8?B?TkFiUnhtalhnQUdVb0JHdlRJdVVubW4vTUJsZngxd3h2cEZsKzEzY0RHL3VI?=
 =?utf-8?B?S3VJQ3dFZnBlSlppRnUwMWwzRUZEbUhZVHRPdGp1aXFmeVpuUys5NU1HUXZx?=
 =?utf-8?B?THJncmlLLzFRYmE5ajV2cC93SGoyQmtSNVA1eXNqUkhOYkVEa1NET3JOd0Fi?=
 =?utf-8?B?am1yT2tkcjh6UElZTG1kOXdScmJmc2JEZ1VPRjRyT0U0b0pYdS9reis4VUxq?=
 =?utf-8?B?R2hzU1FJeW85NmF5TjZZZ2VCV05kRlk0YlpQWG5ZTjU2L3c5RHpSQjJ0QXZY?=
 =?utf-8?B?K0RLaEp1ajhKNHArOWdvNnE4UmluNmZtVUJFZWJsNVdNaHNhMjZjTUFHTVJL?=
 =?utf-8?B?bnpQdGcvZTRnOUU0ODNKcVNjcmh3eFlZL09lQlRqVGFCdTZnSDRib0JJMzlZ?=
 =?utf-8?B?ZkdVc0NPcUxFS2RJd2tpZUxYcDZRRkxHUDdWc1hveTkyR0owZGZ1TkZxc2p1?=
 =?utf-8?B?djd5VkFQSlRaWHAwMEVpYWoyT0dOdWdpbkYvc3RwVEdTMlhZTzVRdlYzTWdz?=
 =?utf-8?B?STYwTEFNaFk1ekoyMkpmWnNXN3RpYnUzS29pWmFEQXBoMWJmT1prTFBMNkQ2?=
 =?utf-8?B?RkdveVlMZlJFNFFqdVlUL1RaVk1Uby9CdHBQejQvYUk1cTQ1NnVnSnVwSHdt?=
 =?utf-8?B?dCsyUktTYVhtQjc5VmVLYmRBOTVweE5JbHJ6MGR6RjlOUm1HWTBwMnRSdzZi?=
 =?utf-8?B?bkdROGVmMGtKWE1ZWEpqZGdZTGgzSTF5UmhyMXBJVldvTE1HNDhxWThZOHFx?=
 =?utf-8?B?bVBtWUZ0YUViL1k0UHpqWVJsSVl3YkdKbDZ1dnYvNlU1c2JORFA5cVFubEJm?=
 =?utf-8?Q?sO/3c61jADGvhVNZi5cEAJMOdDlY4Fu5?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR06MB7535.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aDE0ZUd4VzdGMmNrSHhleTVKL0NjdFVpdnRRdHVpcFRnN3l3YmU1R2NKQVJ5?=
 =?utf-8?B?SzBSWmZqQVlOTXNHMVYzZ1JqTG9rYjE0UmNKVUtyWGNFSmdYV1JINDRoRUVt?=
 =?utf-8?B?aVpyR2NoREJHVWl4SzBKNTN4Zm5MQ25hRDBvLzFBY2IxenlSQWZ2L2s2L3Bx?=
 =?utf-8?B?UXMxU0ZhUGlrTXpOWlNhZWVCbm5MYS9DVmpMV1ErOHpYVWtWd0tPcmhUMjVY?=
 =?utf-8?B?azY3T05jK1RyZVpFb0pmczlNSHN6NnBsbVBFTGhJejl6dU1NelgycEtCT1h2?=
 =?utf-8?B?TDZlTDVDMjBYcVdOZDlnVmplc2FKRURvV2JnM2tMaldMYzlNUHdOUkw5SVQ0?=
 =?utf-8?B?a2FwY1NLbG96eUJBeFU2SHVwb2R3VElkSUlCREsvdHdrM3hKOThQUVpKWkN5?=
 =?utf-8?B?YWNEWEtyaEZkblQ4NkJrR21ZNXIydWtvN2orNGZ3MXowZmZ2cEJxSGlUa2xr?=
 =?utf-8?B?eUgyd3BrM28wZ0JxZ0FSTE5BSmllbEZIai90U2pmRzZJTkhrQVd0bjBidys0?=
 =?utf-8?B?VUE5RWdNN3Y2bTFqdVA0OWJraXZSZFdsSS96akVtV0JFRkVRMzlyYXE5bi9I?=
 =?utf-8?B?YTJRSXdJQitBNlZqS0VhVm1FVEw2Rzl1a2xjaWRubXdpRkcyM3I0YTdvOEFI?=
 =?utf-8?B?RERhcVgwQUU2R2t3d09ZUXRONDRlVDRFSTljN1VGSTI2djhvQytBWFI1VU9S?=
 =?utf-8?B?Z3dYS1dYZG9RU0NWTHBQODlqZWxtZkIwM09VR1hUNTlqKzZHN0FTc2lOcXMz?=
 =?utf-8?B?MkZQSWVuRHdyQVR5RXBCcUlBZXhhWWZGWEF3VVUvNnFoZzlJUUFld0Z1Rm5J?=
 =?utf-8?B?c2hNWllHTHllTkZGL09ZQnBlN3NBZ2lId2xOWXVjQjcwUlo0bkwrdGN6aFBC?=
 =?utf-8?B?aFlLcEcxeGNmUnVmMHJXR0ZKRCtCZUNJT3BCYk90WU4wanVLQ1d0a1JzdnYx?=
 =?utf-8?B?and5NTJKSUozbVRLcG9uSWVQT2QwVTF6UmNLa0Uxa1p4eG5OMktWOHFpSmZH?=
 =?utf-8?B?R3RkbTBjckZKdHQrdXdMUURINysvRW5OVDVCZHFrc1RrWnBpVlh2UkFRRU1s?=
 =?utf-8?B?M2VPalV4bjlSNEpDUTJuTmdhUGRsMzhkNVFieFhIRktpY3BoOTNSbk1Yc2RS?=
 =?utf-8?B?bVo5bitNZDlsMm9GOE9ENlpqT1NGcS9iN3dFeFFJdEIxRS9uWlZuRGJlVjVk?=
 =?utf-8?B?RUZGeGhOcTZxZ21FMjV2Z3cvbGJtR1NiTmU5R3h1dnlYK1k1THg0cnhoYXQw?=
 =?utf-8?B?b084UnZreTZON2R6WFFrTWkrOUM1UmxoQXpWMTRUSGRHZUtCQm9JUXpBdHlR?=
 =?utf-8?B?SWFjZTNlNHpnQm4zMVpmSzhIK01DWlpFRGh1LzZlR0JEOStpbStkSlN2M1ZR?=
 =?utf-8?B?WlJPczRCSmI5U2NVKzZEaGhvVkdKbzBRRWNXWmMvbTJrT1BuVkpMU0Q5WTFo?=
 =?utf-8?B?SVJFcVpNODdiajlGTHRXUHJSMmhNdGY0QS9heFdFeHRXNC9aYTFKQ21MUVMx?=
 =?utf-8?B?SzA0UGlsRTJWOFFPbHMvamJOcmhMWUFQR3pBTnB5aks4dERNVm9zelA3ZDg1?=
 =?utf-8?B?T20xZERPb0NlRGtrSC96OFZMc3ozUWFOd1d1eHpFSDZWTW5EeHFtbWJhOVZJ?=
 =?utf-8?B?N1J3dlpPcklUSktOTDUrNk94K2grYmlWWDhleHE1dU4rc3VjZUNJb1pRRG8x?=
 =?utf-8?B?dzFhTmpMYjBNWXdqbUx0UHN4RHlwTDNJYWl5VEZJS3ROeUhFRjI3VmJOVG40?=
 =?utf-8?B?a0xFdlo2dTROTHdpb2x2ZHhpaThBNVhqUkQxYkovRmljOE03Sm4rL3NtMEh6?=
 =?utf-8?B?MVBtVTBDVXlYb0s0ZnBVbkJaMzZSQnhtd2VGdkNzSVRabjVCeVBld25qL2Fi?=
 =?utf-8?B?c3ZNQkJObjhuOHJITllUbnNjTXpQMThiRzNnUmMwd2haVVlIUGF2b1g3WGhE?=
 =?utf-8?B?QXNBRUd6RkxQL3R3QXdXNDhLdy9NSmZiVERKZjVtVjhDdU8wd0lMSXVhZ25Q?=
 =?utf-8?B?VC83VU1xVlNXeXFLZW9YaFpiTFlLaUVMckw2VHN6ME9KRDY5NitHbzNPemtI?=
 =?utf-8?B?YVdScmNGWFJlVmYxdWkrVi9RUVRYWTdrSTBDbFMvaXRnU0E0ZUJFeStQN1ZJ?=
 =?utf-8?Q?d+fHybYtTurZ+1skm/A2A4Cu1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI6PR06MB7535.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078f0254-edee-4abc-3a3c-08dd6abadd0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 10:01:36.1176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzRsIhdB9ZjLhohiUned6QMfq97C3SUm11T04PRvsT+RqlrGInb1/31BkX/bs0zTz/U4ijyvUJ8BUbetOCpaiF6TT0cl1OSJAR334B+3mj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6363
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMjQvMDMvMjAyNSAwOTozMCwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJp
bmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+
Pg0KPiA+PiBPbiAxOS8wMy8yMDI1IDEyOjEyLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTYgMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBv
cnQgZm9yDQo+ID4+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4+DQo+ID4+Pj4gT24gMTcvMDMvMjAy
NSAxMDoyMSwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4gTmVpdGhlciB0aGlzLg0KPiA+Pj4+
Pj4NCj4gPj4+Pj4+IFNvIGl0IHNlZW1zIHlvdSBkZXNjcmliZSBhbHJlYWR5IGV4aXN0aW5nIGFu
ZCBkb2N1bWVudGVkIEkyQywgYnV0DQo+ID4+Pj4+PiBmb3Igc29tZSByZWFzb24geW91IHdhbnQg
c2Vjb25kIGNvbXBhdGlibGUuIFRoZSBwcm9ibGVtIGlzIHRoYXQNCj4gPj4+Pj4+IHlvdSBkbyBu
b3QgcHJvdmlkZSByZWFzb24gZnJvbSB0aGUgcG9pbnQgb2YgdmlldyBvZiBiaW5kaW5ncy4NCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBUbyBzdW1tYXJpemU6IHdoYXQgeW91ciB1c2VycyB3YW50IC0gZG9u
J3QgY2FyZS4gU3RhcnQgcHJvcGVybHkNCj4gPj4+Pj4+IGRlc2NyaWJpbmcgaGFyZHdhcmUgYW5k
IHlvdXIgU29DLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPSywgZm9yIGFzdDI2MDAgaTJjIGNvbnRyb2xs
ZXIgaGF2ZSB0d28gcmVnaXN0ZXIgbW9kZSBzZXR0aW5nLg0KPiA+Pj4+PiBPbmUsIEkgY2FsbCBp
dCBpcyBvbGQgcmVnaXN0ZXIgc2V0dGluZywgdGhhdCBpcyByaWdodCBub3cNCj4gPj4+Pj4gaTJj
LWFzcGVlZC5jIC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWkyYy1idXMiLCBBbmQgdGhl
cmUNCj4gPj4+Pj4gaGF2ZSBhIGdsb2JhbCByZWdpc3Rlcg0KPiA+Pj4+IHRoYXQgY2FuIHNldCBp
MmMgY29udHJvbGxlciBhcyBuZXcgbW9kZSByZWdpc3RlciBzZXQuDQo+ID4+Pj4+IFRoYXQgSSBh
bSBnb2luZyB0byBkcml2ZS4gVGhhdCBJIHBvc3QgaXMgYWxsIHJlZ2lzdGVyIGluIG5ldyBhbg0K
PiA+Pj4+PiBvbGQgcmVnaXN0ZXINCj4gPj4gbGlzdC4NCj4gPj4+Pj4NCj4gPj4+Pj4gRm9yIGV4
YW1wbGUsDQo+ID4+Pj4+IEdsb2JhbCByZWdpc3RlciBbMl0gPSAwID0+IGkyYyBwcmVzZW50IGFz
IG9sZCByZWdpc3RlciBzZXQgR2xvYmFsDQo+ID4+Pj4+IHJlZ2lzdGVyIFsyXSA9IDEgPT4gaTJj
IHByZXNlbnQgYXMgbmV3IHJlZ2lzdGVyIHNldA0KPiA+Pj4+IEl0J3MgdGhlIHNhbWUgZGV2aWNl
IHRob3VnaCwgc28gdGhlIHNhbWUgY29tcGF0aWJsZS4NCj4gPj4+DQo+ID4+PiBTb3JyeSwgaXQg
aXMgZGlmZmVyZW50IGRlc2lnbiwgYW5kIGl0IHNoYXJlIHRoZSBzYW1lIHJlZ2lzdGVyIHNwYWNl
Lg0KPiA+Pj4gU28gdGhhdCB0aGUgcmVhc29uIGFkZCBuZXcgY29tcGF0aWJsZSAiYXNwZWVkLGFz
dDI2MDAtaTJjdjIiIGZvcg0KPiA+Pj4gdGhpcw0KPiA+PiBkcml2ZXIuDQo+ID4+PiBJdCBpcyBk
aWZmZXJlbnQgcmVnaXN0ZXIgbGF5b3V0Lg0KPiA+Pg0KPiA+PiBXaGljaCBkZXZpY2UgaXMgZGVz
Y3JpYmVkIGJ5IHRoZSBleGlzdGluZyAiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyINCj4gPj4gY29t
cGF0aWJsZT8gQW5kIHdoaWNoIGRldmljZSBpcyBkZXNjcmliZWQgYnkgbmV3IGNvbXBhdGlibGU/
DQo+ID4+DQo+ID4gT24gdGhlIEFTVDI2MDAgU29DLCB0aGVyZSBhcmUgdXAgdG8gMTYgSTJDIGNv
bnRyb2xsZXIgaW5zdGFuY2VzIChJMkMxIH4NCj4gSTJDMTYpLg0KPiANCj4gU28geW91IGhhdmUg
MTYgc2FtZSBkZXZpY2VzLg0KWWVzLCBvbmUgZHJpdmVyIGluc3RhbmNlIGZvciAxNiBpMmMgZGV2
aWNlLiANCj4gDQo+ID4gRWFjaCBvZiB0aGVzZSBjb250cm9sbGVycyBpcyBoYXJkd2lyZWQgYXQg
dGhlIFNvQyBsZXZlbCB0byB1c2UgZWl0aGVyIHRoZQ0KPiBsZWdhY3kgcmVnaXN0ZXIgbGF5b3V0
IG9yIHRoZSBuZXcgdjIgcmVnaXN0ZXIgbGF5b3V0Lg0KPiA+IFRoZSBtb2RlIGlzIHNlbGVjdGVk
IGJ5IGEgYml0IGluIHRoZSBnbG9iYWwgcmVnaXN0ZXIsIHRoZXNlIHJlcHJlc2VudCB0d28NCj4g
ZGlmZmVyZW50IGhhcmR3YXJlIGJsb2NrczoNCj4gPiAiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyIg
ZGVzY3JpYmVzIGNvbnRyb2xsZXJzIHVzaW5nIHRoZSBsZWdhY3kgcmVnaXN0ZXINCj4gbGF5b3V0
Lg0KPiA+ICJhc3BlZWQsYXN0MjYwMC1pMmN2MiIgZGVzY3JpYmVzIGNvbnRyb2xsZXJzIHVzaW5n
IHRoZSBuZXcgcmVnaXN0ZXINCj4gPiBsYXlvdXQNCj4gDQo+IFdoaWNoIHBhcnQgb2YgInNhbWUg
ZGV2aWNlIiBpcyBub3QgY2xlYXI/IFlvdSBoYXZlIG9uZSBkZXZpY2UsIG9uZSBjb21wYXRpYmxl
Lg0KPiBXaGF0ZXZlciB5b3UgZG8gd2l0aCByZWdpc3RlciBsYXlvdXQsIGlzIGFscmVhZHkgZGVm
aW5lZCBieSB0aGF0IGNvbXBhdGlibGUuIEl0DQo+IGRvZXMgbm90IG1hdHRlciB0aGF0IHlvdSBm
b3Jnb3QgdG8gaW1wbGVtZW50IGl0IGluIHRoZSBMaW51eCBrZXJuZWwuDQoNClNvcnJ5LCBJIHN0
aWxsIGNhbid0IGNhdGNoIHlvdXIgcG9pbnQuDQpJIHNlcGFyYXRlZCB0aGUgc3VwcG9ydCBpbnRv
IHR3byBkcml2ZXJzOg0KaTJjLWFzcGVlZC5jIGZvciBsZWdhY3kgbGF5b3V0LCBjb21wYXRpYmxl
ICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIg0KaTJjLWFzdDI2MDAuYyBmb3IgdGhlIG5ldyByZWdp
c3RlciBzZXQsIGNvbXBhdGlibGUgY29tcGF0aWJsZSAiYXNwZWVkLGFzdDI2MDAtaTJjdjIiDQpE
byB5b3UgbWVhbiBJIGhhdmUgaW50ZWdyYXRlIGludG8gMSBkcml2ZXIgYXQgaTJjLWFzcGVlZC5j
ID8gY2FuJ3QgYmUgc2VwYXJhdGUgdHdvIGRyaXZlcj8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQo=
