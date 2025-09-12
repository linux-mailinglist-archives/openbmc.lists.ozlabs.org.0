Return-Path: <openbmc+bounces-638-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73DB54397
	for <lists+openbmc@lfdr.de>; Fri, 12 Sep 2025 09:13:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQdQ3bsTz3chv;
	Fri, 12 Sep 2025 17:13:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757661226;
	cv=pass; b=gSlxoXyQfFCi/Pu7M8TPUbh9oTIGTwiTzeIlz2V4xkiFwdjcbalbRpOvx1zHj4gIuPlEIlx+0FRxn2nULFsXgCZ3ULN4Mes0zvML90J0UMn0onJTt9SBgFXHsA7u10ScZ/TIZAB1nHc1p7rNFg8xy3FZZkuY7MoyRg85LD6Mm2s5p//WYwCKtpHuIwcv16mVVMsUkidB47EaVK9X25WCvVbaOyoAzVreu4R2Xdxwi8H2wqzHJ/WXITMMR0s3OqP0RjARwerJ4VmLVpXN6IeiwQKJGgRRCQLXvyHlx6hudQg96xmKJgstc5CUkXGDmm+3YAI2YqEeKGIoYEej+MYZmA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757661226; c=relaxed/relaxed;
	bh=rz9XGwK6ejTnFxaX4O+dl/CeugdEIV66eIQwcE5YmfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SX/5ho54LX9RUS7Qg9oZE3lZ0jlu66YMspCjVSAsCri2ReeJY3V/JIfCLsi+Gtp5cN2hOTxfAr4neMBRof1Ijl4XfX7gv7gYohilJ8a1iQvdSnSy33hhnoMxonplm5bnJF/Eb3oRdbEfhoVH9V6jV8ta6JllANtMv/k4SI38+TcPSk0mQwfjdW90rEt2hVd6EjM3KcSVFem2oMDZNkLprz0mnTeCMGoEeehkav6HjJQK6ws+0UXz56HmcjHkm6l4SQrxLzQimQOxvDtZAEY26i0IrXF0/qLLyrtNgMPADJFYxk07clUy/tLP8hzhCUDNwb/dp6f1Tu+9qyZog5cCyQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FAEC77dL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FAEC77dL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNQdP0zBZz3cgt;
	Fri, 12 Sep 2025 17:13:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu4VBkoGZ+cRMbqulBvRriyxjWV9bQQyOixZukihQCZ4nCYU/awzN0CHJNF79ekaW/CrCzCOYZbUQ99Hcs8m8uXr7keP4rnBPZb/old4g9/okEqnCUHiYYtoQji/JikKaWQurab20Km+GTTtE06tzWNZm94LPN5dGgv1tnYXUSv2zQGGA3sQ1QDXJxesAar15Z+xc4/NncHGu4dsllYYs/iYYq75+44t8fZLWlXEwP6Vc/fGQv8uVjM2SC7mM1bguSEBR8sj84vKsPo9X2IcBqpsPO9gbaPtuxDTDSQqE3TTnnoDyAE4aP0UVQ2BunIDmlS9/05mwGM+nrav7jPSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz9XGwK6ejTnFxaX4O+dl/CeugdEIV66eIQwcE5YmfI=;
 b=luyJDYB8cVgnLgGVWGA8PdPKxCWSvo+B3LCBNCtvytEAa/fnT5tjBQ+0QB7liGJSSHhXk0mnOW+jCEiOHAdukQcqEG/K32QnCMamG/nqW5EaWXxTCmgCe1eEfSESjeSLvvHNDB6JivHbUQq5hw35qDv7i7FQDTqfyJxfiaL8S5ta26N9gjsV/BT76Aar8omLRZwreKtvFEK8zbKCokKDSb4XZr9WRHRpUJy4R+fSAUSooNKH/MNGOa0dRX51rLvvuGmp7N1RFofhWT5WXLrNySsAlzS6GQSbou2UL9jLRa+ztg6UWWkY+tNZkheaBUfkNUKWqkRpNLPt7jiD91qPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz9XGwK6ejTnFxaX4O+dl/CeugdEIV66eIQwcE5YmfI=;
 b=FAEC77dLUvtb42QMp0lfOev9wmRM16s6SrTb12CtpWNObncPLx5BdIHUAQFLM4SsYCCpseD48BiCAgtCcX5n6cGrgFilduOo6xRkTxLT2lNGpmaFS6KiXrrifMVSM2Bus+x9t3DbEcZfS6PxrInIuhiz+yg3SoY8RmHevWlNmJTS5fueWi0XXYWKtQyQdLX5Oj5KoUQ6gnzAK84g9v6ANbqhBROrPSCTWjIlQhVatdNkGv7IoYF/B3QF8FZey8br4jC5X32XFjsHiK5rguvB5BUhLhDNktl+BZgaAa3pNQ1bWr7AOoxbUoXwy4m5jBmpAc1RpjMpYGIlmN1OsbTicg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SE3PR06MB8071.apcprd06.prod.outlook.com (2603:1096:101:2e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 07:13:18 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 07:13:18 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jeremy Kerr <jk@ozlabs.org>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:
 AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYggAecSoCAABKwMIAACvyAgAANJ+CAABVGAIABfA3wgAAHyYCBCWl+gIAABUkAgAANMACAARickIAABmWAgAB8ZYCAAWmbgIAABWPA
Date: Fri, 12 Sep 2025 07:13:18 +0000
Message-ID:
 <OS8PR06MB7541CCC6EB852A886D4649BFF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
 <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
 <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
 <ecefaed7ed0fe83442021c0bfee0a49111269aad.camel@ozlabs.org>
 <6feb419e-ee3d-4573-8820-19c70acdb426@kernel.org>
In-Reply-To: <6feb419e-ee3d-4573-8820-19c70acdb426@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SE3PR06MB8071:EE_
x-ms-office365-filtering-correlation-id: ba4bb08e-fd6c-453f-4396-08ddf1cbd958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnBBaTl4VzE2MmxTUEJ5ZGxTY3FRblhkUVY1dmtzdW5FdFYvQlNKVzlacE9N?=
 =?utf-8?B?djN1Y2pyb0ZtSVFBMVZKZUdBT1NXcCsvdTBXaVYzVTRMZTF4NExTMkFmZEJq?=
 =?utf-8?B?MlhVVGtQSWlkSUhuTGJ2TjlYT2l3UTd5d2VEelNwOWx2S0w0S2Y1OWhLZTI1?=
 =?utf-8?B?Y2hTaUl0U1VNSTdLZ1M0YmJCenJ0cnBWQTJ2NHBiK2tIYlpCYXJlc1psNXZT?=
 =?utf-8?B?cVVTeDBPNGZDaFg5YS9xbEhXRnZ1UnluMFV2N1NhdS83b0ppMXc4TDJPWnBo?=
 =?utf-8?B?bVg0ZnVtcndiOWtkenFiWGJNMzNCUlhmb3B5ZDZGZWg1bFdpNEhBTjEvbmQv?=
 =?utf-8?B?ekl6YnRIck4yNG9PcVhoZ2dxWnVpRWxFWWVHbXJRTjBkb3o0WitwaDBsOXYw?=
 =?utf-8?B?TUpibVpYcFFuK1lYV2V1VUtwYlhDSE5md0RiN1k3dGM3Z3BoUndKR25ndXNt?=
 =?utf-8?B?K3lNN09ldy9kYVlVSUlFYVVzNWlIRWRsL01DNUltL1lBL09BMEpmSGZacHFP?=
 =?utf-8?B?UCt0eVRST3RmNTNib21HZDdQTUFmZnh4YWMzUFc5bFZuNnVpZkpOVnFjNnNR?=
 =?utf-8?B?czVtcDRmRGN2Q0NVTlorMGtPOXNpNVdqRENiN1kvRTMxc01sMllQNFI0T3JT?=
 =?utf-8?B?c3MyV1BZUzQ4SlhkeEJPZTZMbVlLdzQrTGtvQ3hQUXlwMHpjLzBrRTBBMFVi?=
 =?utf-8?B?VXFPV0R0eWQvN2VVeGVFNjVhMFd6TmxkcUNOUGdnWnBJdXVDSUlYQ1QxZ1lR?=
 =?utf-8?B?aFh3STJKSHBOQ0tpV0FoTkJEUEtyWDZkNzJteUZhSDVITUorWmdzV0NhcWF4?=
 =?utf-8?B?Zm0ycHJnOUZwdnR2TG9OT3JqOGtJK051MFFET0w2NUR5R29UaW5UNVpEc3lV?=
 =?utf-8?B?NzZzdUpKK3lxUDZNYzREVVkxQXcySzErMW1mREZpWnpFSFh4eWZac0M4Z0pX?=
 =?utf-8?B?UjlEcGtoemtUOGU3SFc4aDB4VWZnakdyNElYS1FVMFdPbUk0bzZnREk2ckpT?=
 =?utf-8?B?UzJ4WUszQzhkZVpCc2dYZTVXRjV6YmkyKytDaVdxck1pOTBhUmFGOTNoRi80?=
 =?utf-8?B?czVWQWRPR0JxRnpJbDZJbC81OFpRVVVyblVhVkxsbHNDZ3MrNUJoaEpCY01a?=
 =?utf-8?B?NUZCWXpOKzB3MzBoYXh4dDhPTHp5UUVobmd4eFhkWDZleU56LzAzQjVkTU1P?=
 =?utf-8?B?QkdhMkUrb011UmRiOGNFOFBVYUFDRnNOSHlmTzFqcU9nNkRxRHRyaDVlckVh?=
 =?utf-8?B?SEMwV1E1anpmb1BmK255dXRnNjE5cjhYSzNBc3N6dzNRM2FRQWhPZWFoZnZT?=
 =?utf-8?B?N1R3UnAyM210WVJ1a0krcW4vL3JQNHBRd2ZhZ0lmZERjK0FGVUxWRTVzaDBL?=
 =?utf-8?B?dHN1K3FubkdNWndnOHY4anBvZlVESzlWbzFBd3ZzdkpWMytXRDU4anl1YjZp?=
 =?utf-8?B?eVJaZFNkMk9HZ3RDSW50bmptNTArenkxcTZXdUtLR2p1ZDNHay8zcFIzeHo0?=
 =?utf-8?B?OUdJa2w5d0ZXZlcrSnBUZURrMHR4bEsyR1NnbkxqZ3JmaUpNakptV0x4K1ky?=
 =?utf-8?B?YnJqWmlXRUU0aSt1TnIzVHJWdjl4bGNXVi9NaTdXNzhDZnRxdy9RQ3FxWEdI?=
 =?utf-8?B?ZkMrWEdGdHA0a3JnNllSK20yZ0NnRHh0MG5ON0pXc3JpOGZlcnhDN29DVmpw?=
 =?utf-8?B?dGtPOXJYK1l6eDh0WjJVMlVWRkg1V3AzaFk2Mnp2NzRxdFdYSG5HWklRbjdF?=
 =?utf-8?B?ZFBadGhTUTVMcFhLUFFIRDlmNWkrbHRnNlB3bjUyWHJEbDZUYmszeTcxakxh?=
 =?utf-8?B?NXJJUjQzRnVuMDE4b2cyRHZzeWZxQU9qdUN2dU1iTFpGVWZZNlNLbmlERnBB?=
 =?utf-8?B?SFVhZDI2dHcydkt1M3FKWjhYbVJEMkFNcVNJZ01hZVp6QTN5QXFsb3Njb3U5?=
 =?utf-8?B?dXZ1QlFKakNZM25qV1JLVW1jRC80Z2FQVzRYR3kxUWZ3b0lOTkorSUI4NW9I?=
 =?utf-8?Q?n2eDpDfvkvEBwNnIpoLStHJRqjwr0E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXlFSlV2QUNQOXBMUUI0eVVYUjVKekdiMlF6NlE0amM0dzZiNzhzdDhsVmhX?=
 =?utf-8?B?UDdpR29YMndqTzZ5K0JkMXRCa20yMTRoeTJGK2tQWFRzbGJ2NU5xcjMyY2xu?=
 =?utf-8?B?akNqZUZYNlRydDZYTUUyN1FTWWMrdVE4d2Roa0hGd1FvVHF4M25iMnVrWFlj?=
 =?utf-8?B?RW9ubUxubVM2a29xaWFCeE9iUmVMZDZuczFqZUFZLzRNREF5NldJMzlPaFJj?=
 =?utf-8?B?VXptWUlwTVZKN2VhSE1xSEVpKzNEdjkzYjFNcnd2QThTeE5FckFDTElTSU1m?=
 =?utf-8?B?SngyNHhsaTBEd1hGSCtXYVMrNittdWFMNG8vSURUUGVpcDhIL2hGc0pUQ3l4?=
 =?utf-8?B?Y3Azc2ZXRjFQaUtyUWJWc003TEVibTFyajE3RHRCcWJKZlBUbDR5c1o2SXpK?=
 =?utf-8?B?VTdPczRiUzVZQkdUYVEvaU5Pajh1UjQ2VFNXY0FtWDZHK3F2Z1ZxeFBZeXQ2?=
 =?utf-8?B?U2ZpWlVXdStERXMrL01oZVZKa2duY0lXdUh5S01vb1RqRGJFNS9xdFJtbFB2?=
 =?utf-8?B?MzBKc1R3ZzRPOXloS0w0YmtzeVYxVGVTSUFIQTBuQjlHazJhbHBLeXVuSFMy?=
 =?utf-8?B?VEZ0enUzS1NxQjNyYmN6K3ZaeWdRWWkzWFNBdnZ3SGowTFFyMjd5Wk5xd3Fo?=
 =?utf-8?B?WlZDQ1l2dVlpM0p3UlQrb1h6TWJHcjFPSHNzVG1QaENjbVlrQUl0dDIyRktO?=
 =?utf-8?B?bWk1eWFkZG9qYzN0d0FXWFJKNWZGcnNKSWdmOElEN01iVWVRSmxKN0wrUzBl?=
 =?utf-8?B?SE5JSDIrNlVDSU9idkF4cjc5WnZmd1NpWXg2WVU5WWpSVUNxTDlnTlJsUkQz?=
 =?utf-8?B?WllFMU82TW4xRlB5R2V3OHV2ZW9WcjYzYUJaTEdVWXltelRMVTd5ZXZzUFlt?=
 =?utf-8?B?cW5EcG40eU5jOG9PdHozUWVPNTNLQWQxZ2pTcXdad01oOVdpdHdIZU9EbHJP?=
 =?utf-8?B?ZjM0TUVuV0tiWE9mcm9JMXVuMU5NUnNTbm1LaGpXL2JLcEQ4UGc0dVdrdDBu?=
 =?utf-8?B?cXh4TFlKTCtuMGh2N3c3dThzcldnbUdKMnBkNlpqYmsreVdaZWhiWHhGMmha?=
 =?utf-8?B?RVBoQk9aV3puTVc0dk1IdSs0cXNGcm9nR3ZVbi8rZnh0YVFFRHVXYzJDbHpn?=
 =?utf-8?B?Z1c4K0VJbnI2SEtDUTZWUlBjR2tLaUdyQ2w0a01KVUVkQ2VCOEFaUHJVdnM3?=
 =?utf-8?B?THJlQ0ZyRVhYWk83RTV1TDF0RjMvbldnRFBCRmpvazVsLzBjZWtqR1VFYXhH?=
 =?utf-8?B?VWwxYzZHN3VMTkhGQ3ZlUTdtUlJ4eFNCOU9aSXdpKzdCWTJHdFdGbWp4ZmVO?=
 =?utf-8?B?ajBnY2YxVkprRjZuVDVvSUpUYi94NHViSkhrWkdhT0RCM3JzL1MrRy9odW5t?=
 =?utf-8?B?QTFQbVYwUnlSRjB6dFMxaUI2c3lOZXo1OC9EdkhCQXNzNGtiSmlyMUoxeUMr?=
 =?utf-8?B?ZncrVW1oZEFzNFB2b1VKU08rdWZOKzBJZ3FEN2NPOGVLeWtKUDNzeTdJQzRw?=
 =?utf-8?B?UWV6dUNqNmU2cWFWV1ExVGpIRm1uQUd6WmVodVppMlVJdXhjaGtLb0NqSnZh?=
 =?utf-8?B?UkUybW5MaVZvTWR1b0ZUeTdRQkdaK1Z1WXZNSzRvVEdNdHpxSVV4MnFudkNS?=
 =?utf-8?B?bHZ1YUZ5b2ZkeDB0cSt6bjlxZzloNmpMZ29LdHFGYmtFeXJnbXVMKzI2amJa?=
 =?utf-8?B?M0RseG1ENHVrYXl3dVdFQzVEMGxDaEQwazVNYzIvbEVHU1JSSXJwZkhNY0VK?=
 =?utf-8?B?M2pzMXQrQnRZazFRVWFVcEpYR0dpdDl3NWo0RVRrRU0yd0tPUlF1Zk1kaTdE?=
 =?utf-8?B?OHlLdUhCemh4Z2RHWnpUWTQ5aUp4SDBJb2hOU1ZHazRQVFJUaGVKS3lydS9T?=
 =?utf-8?B?R3lqSW5OdjdiL0FGRjZhdG9aZE1JTkxnM2RJcm9lNk13bW5ZVnkzelpEQ05Q?=
 =?utf-8?B?RzJRYWdGWWFGN2pTaFBRQmhSQ1M5U2hLWjhPeEFtb09wcVdPb21vTVFpY3Yv?=
 =?utf-8?B?YmFzQ2RVVFZkU3RtNzFSR0wxN1k5V2VOaEFKM1lLNFEzTU91R3pNMzI4czdP?=
 =?utf-8?B?WGR4U0tNTjVsSHNBMFF4NDRMVjNZTmFlc1FtUlNtbGJLNDFBdzBqcDFHS2ho?=
 =?utf-8?Q?ib8zpfAzsJpaZLjztj9F/FoRm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4bb08e-fd6c-453f-4396-08ddf1cbd958
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 07:13:18.2966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EhdRbbwJuPsDkXSBVr1+HAgnqCiP8waAJ6K4rKXL7jotR5/jmJwiEemTurI/ORjfZZlEK9fflL3bUNJU30T8rAj50RsBFeQDLSOzZHMo2UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8071
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMTEvMDkvMjAyNSAxMTowMywg
SmVyZW15IEtlcnIgd3JvdGU6DQo+ID4gSGkgYWxsLA0KPiA+DQo+ID4gQWZ0ZXIgYSBiaXQgb2Yg
YSBjaGF0IHdpdGggUnlhbiwgc29tZSB1cGRhdGVzIG9uIHRoaXM6DQo+ID4NCj4gPj4gVGhlIHF1
ZXN0aW9uIHdhcyBtb3JlOiBpdCBzb3VuZHMgbGlrZSB5b3UncmUgc3dpdGNoaW5nIGJldHdlZW4N
Cj4gPj4gKmZ1bmRhbWVudGFsbHkgZGlmZmVyZW50KiBoYXJkd2FyZSB1bml0cyB3aXRoIHRoZSBt
dXggc3dpdGNoIC0gbm90DQo+ID4+IGp1c3QgYSBkaWZmZXJlbnQgcmVnaXN0ZXIgaW50ZXJmYWNl
IGZvciB0aGUgc2FtZSBwZXJpcGhlcmFsIGhhcmR3YXJlLg0KPiA+PiBJcyB0aGF0IHRoZSBjYXNl
Pw0KPiA+DQo+ID4gVHVybnMgb3V0OiBuby4gVGhlIGNvbnRyb2xsZXIgY29yZSBpcyB0aGUgc2Ft
ZSwgYnV0IHdoYXQgZ2V0cyBtdXhlZA0KPiA+IGluL291dCBpcyBtb3JlIG9mIGEgY29tcGF0aWJp
bGl0eSBpbnRlcmZhY2UuIFRoaXMgcHJvdmlkZXMgYW4NCj4gPiBhc3QyNTAwLWxpa2UgcmVnaXN0
ZXIgc2V0IHRvIHRoZSBhc3QyNjAwIGkyYyBwZXJpcGhlcmFsLg0KPiANCj4gDQo+IElmIHlvdSBo
YWQgdHdvIHNlcGFyYXRlIGJpbmRpbmdzLCBob3cgd291bGQgeW91IHJlcHJlc2VudCBpdCBpbiBE
VFM/IFR3bw0KPiBkZXZpY2Ugbm9kZXMsIHJpZ2h0PyBUaGF0J3MgY29uZnVzaW5nLCBiZWNhdXNl
IHRoZXJlIGlzIG9ubHkgb25lIGRldmljZS4NCj4gDQo+IElmIHRoZSBkZXZpY2UgY2FuIHByZXNl
bnQgb3IgY2hhbmdlIGl0cyBwcm9ncmFtbWluZyBpbnRlcmZhY2UsIGl0IGlzIHN0aWxsIHRoYXQN
Cj4gZGV2aWNlLCBzbyBzdGlsbCBvbmUgYmluZGluZyBmb3IgaXQuIEFuZCB0aGF0IGRldmljZSBk
cml2ZXIgd2lsbCBoYW5kbGUgYm90aCAob3INCj4gb25lKSBwcm9ncmFtbWluZyBtb2RlbHMuDQo+
IA0KPiBJIHJlbWVtYmVyIG5vdyB0aGUgcHJvYmxlbSB3ZSB0YWxrIGFib3V0LCBidXQgSSBkb24n
dCBnZXQgd2hhdCBleGFjdGx5IHlvdQ0KPiB3YW50IHRvIHNvbHZlL2Rpc2N1c3MuIEFueXdheSBh
bnkgZGlzY3Vzc2lvbiBzaG91bGQgYmUgYWJvdXQgbmV3ZXN0IHBhdGNoLA0KPiBub3Qgc29tZXRo
aW5nIGZyb20gRmVicnVhcnksIHNvIGlmIHlvdSBzdGlsbCBoYXZlIGNvbmNlcm5zIHBsZWFzZSBy
YWlzZSB0aGVtIGF0DQo+IHYxOCAob3Igd2hpY2hldmVyIHZlcnNpb24gaXMgbm93KS4NCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkhlbGxvIEtyenlzenRvZiwgDQoJVGhhbmtz
IGEgbG90Lg0KCVRoYXQgSSBzdWJtaXR0ZWQgd2l0aCB2MTguICh0aGF0IGFkZCByZWFzb24gaW4g
Y29tbWl0IHdoeSBJIGFkZCBpbiB5YW1sLg0KCVNvLCBsZXQncyBiYWNrIHRvIHYxOCBnaXZlIG1l
IG1vcmUgZmVlZGJhY2ssIHRoYXQgSSBjYW4gZnVsZmlsbC4NCglBcHByZWNpYXRlIHlvdXIgaGVs
cC4NCnYxOCBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA4MjAwNTE4MzIuMzYwNTQw
NS0yLXJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbS8NCg0KUnlhbg0K

