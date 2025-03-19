Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288EFA68AE5
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 12:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHmJm3F7pz3c81
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 22:12:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200e::71b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742382755;
	cv=pass; b=ZYubCYMgrS+E9Op/xOO2Wo/RjgTCzpzUAz4rVk8VWQA2GC+f0mdQIN2xmmSQeUNs/0/2DdQBy/xndy0M6S++LhZK/Q5A2dKohsImY4oXpOcr3yYSxx4124Z99XzLRMfuljeHItFCIWnCe2AelpLG7ZwuIkwacPFbZ+gmvOF1V1GKxSJQI+7H2Y2ddPvMTpGwsA4UhhX/G54hofq1BHa8vn5SwjLUMnbBJlpj0ALxoS+gNF4K0gIcf4z7SwtgIzuUh6oTUaHJcEj+CrrdiwjKdUyK+/39Sbj7DFROqcsxJz43oJd73q70/vKbt4CLsCdVtJRUPg6J1DYK61mx7uy5kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742382755; c=relaxed/relaxed;
	bh=MGHSuu8OdHhFTetxKlnTYhx9W+p23qToqXcRUGVDCU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EZyduDEY0lfBP5P30zfi4+5t+j3JTAxa/2M1h99qF/WHqRsbMoi4fQlh1AKCWKLy2Y0IHS9gqsS+DfVa+EgNnXxDwJkVBgCSeqiCpc5J9tVE6NI8QnqHtWdW3SNBXn7l4ay1/1Hwx+CAlSqvx15kgFVQ4hCiKLjhTEMS786FGe6NxIgzLTTbNIFPCzzCQIajY2cY1mYFYhFLJj+aqPLWGB8ijhs7uitbRBU+ocfvzlfrKJdM7HPrNdcTxmJFHGeGdFMC2z8M3FlMUSTd2zd3O+RVu11XnWhQvjN126shev78j/YcwYFD1Tvj234fJ7hE7wFhSzA8LuKX7GBnzNJs4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=cuzKeVwj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200e::71b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=cuzKeVwj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200e::71b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071b.outbound.protection.outlook.com [IPv6:2a01:111:f403:200e::71b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHmJd0NWVz2yrb;
	Wed, 19 Mar 2025 22:12:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vblT323mY1tq2c+w6h5SArzUfeXhrA/ORR7SatlfD3igOkk11DWyP4/K4ncSTsXyE8Bak98Jr1FeVUIsacPj/DzKqEGMgqeqt4bXtyY0n1+eoI7F2Mu7smd55uhkeCArnul30dDfT5V92PQhJfsuMcU7+pJ2+SBefTxwAB2b8MWf0KP687fCPOz/LNpJSaal3IEF1CMEXo8eOoIudfplmNsGvJa/Z+AwcbstcbE/hEEcMGDKSMyaGFdmcc24OqyFvt12N5ieHgV8d0R+un7Q9nWPC1KHh4VrGiEOQPpSbFRFhd68wO8YX+E3B4f+S0v68oh12Iwxi29wxelAgf1RLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGHSuu8OdHhFTetxKlnTYhx9W+p23qToqXcRUGVDCU4=;
 b=AS2eiywqE4VrOXmnbKqFDP+YBls3TDa4c8Yp7HWTRHnrVnQlSDGiDvu+zHaCdkJfAZDWn4l+OOshqOXnxEJhRyyoDlfYz7Ry+CUyEU+AeL3jmHjtj2yR/GNxFtWkGREK0d69jANJh60oPH1USJH/g987s466FWKF8zU39SRL//MFSby1EDGif/ZQJ+AjmbgIs+E0BJBrtchtTGJUIoospiwvE/G2M6v0AbXDZxke5KTWL/qtrmn5cEVB4SEFB8sezVN2MvshEJuo678YZhC6spJ1tChMV6HgGwNC4vGC9XCd0W7bGEcbuB7+VjVJ89qbhEZUPhLODHssrH6yYcra/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGHSuu8OdHhFTetxKlnTYhx9W+p23qToqXcRUGVDCU4=;
 b=cuzKeVwjgOMN/8OpGGM8sMk9JMIfaa1ZSwrI+I9sLu5f4JYnE1ZEJLIA6Z1Lj5FS4s1e2GmlsmrK53tPsDCLlaI11/woCWWGpEpHZoTOoS9m9yRcTqY9I+PfBFEi+B84R7Wuksv7butqQj9VqEDklkMN1Skv3TGlIk6+0kSc2LWeKvSktwBFeyJ4zrvGAVivQ7KI1P9EVxgwhpj8BiJtnOsr6PXT83v19N/nhgIXezU+vz27z7cPgZZUMnOoKaquWdelEMwJDA8GzCP0vu4iz4ZgALUOC1FtYb8SkdwJv6LT7QNNJWUiwRZ4TwO1cZAcYEhTh/hDmmKKqhN2BdoR4w==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TY2PPF7F4308BC2.apcprd06.prod.outlook.com (2603:1096:408::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 19 Mar
 2025 11:12:10 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 11:12:10 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYg
Date: Wed, 19 Mar 2025 11:12:10 +0000
Message-ID:  <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
In-Reply-To: <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TY2PPF7F4308BC2:EE_
x-ms-office365-filtering-correlation-id: 7c1087d2-8475-490c-7472-08dd66d6e4e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?N3l5V0RDRXJtdjF6U2VyM3JpOENvZ3MzYmlYT2U3eG40cEVjUS9wVUd5M3NZ?=
 =?utf-8?B?V0JuL05XYkFGUUxYQ2twWVBPWTRZYjVUMlRTMThFaHgxT2V1MVRxV1NYa1ll?=
 =?utf-8?B?U1pEVk1wQ3JPbVl1NWhkNjY4WEdRYkQveTBkUlhOa3F2Q2QwajBmQzVIYnJ4?=
 =?utf-8?B?ZDA2MUduMVE1cU9EdzRKcEZHRUJaWmM5enpkZVhJS2dsdmVUYU4yc1FPTWtC?=
 =?utf-8?B?b2VDOEE2UXA4WjRpV1B3aEhNdnNNZnBpWmFQcis5U2ZtVDZlUERCRFFIblB1?=
 =?utf-8?B?UGcvUzNZcklLUXIwek5hbWtKRVY4TGdsdnlFTDdaWWxFWmRzTVl6ZGhDMkZa?=
 =?utf-8?B?eDhyS1pmWlJmaEd4TllJQzBmMTgvU3RNejVHemx0N1ZxYmVidTh0S2krdnQr?=
 =?utf-8?B?VHoxNlBlK1djeWFBQ3FQeFkxQ2xyd1U2WmVDcisyVmFJWmlsYW84L0lnY0ls?=
 =?utf-8?B?Wi9Jb2NBQ2Y2eTRxbTJGSVRqZnEzanBORllubG9rQ0Jzb1dhTXdQQXBLbFRs?=
 =?utf-8?B?RFNKVUVYZnlpVHVLMm9pYS8vcWYrekp2b0ZOa0FGUlJKSDVIcnAzTzZRamZn?=
 =?utf-8?B?a1V1bTRFWlFqVGlhdmNUZmNXb2VISmJ4bU9xdHNYUHBYTFRYWWtUWC9KRThI?=
 =?utf-8?B?UDluV1lqeTg0eUFNSHlubmFuZWRLT0J1UFlucnY5QVhsaVpVMXdlN2c0N0cv?=
 =?utf-8?B?TmRoZWdvL0VyRVZMYVdjWWdmdUdvZjd1SnhhbmwvdURwYnZLWm00YTNZYmNx?=
 =?utf-8?B?OWlFeEVOaWxUajNLQlpaZWFxVDFmOW5tQTZ4d3c4cmRlTHgyMDE0djNOMWVj?=
 =?utf-8?B?SWQ5ZEYrUHQ5M0tvQUZTS2psL1k4ZldRME13SGwyRjVjRy9pbVNPZzNkb2c1?=
 =?utf-8?B?VVZrZmlwR0lxMDB0eEQ5SitHcjQ2d1VWa2lyZEw4UWZnY2RUaThmaUxtTk5D?=
 =?utf-8?B?QWhmMnZ6OXA0UDVHbnlvN2Y0Mm1GY0Q5Q0o1ZldLMmR4VVd3d2Iwb0M2T0po?=
 =?utf-8?B?L1JsNGlSUUNLTHlhVm5QOGwxcVE2Q1pOWXNXbUoveE8rdDE1YnVsYUszZk1V?=
 =?utf-8?B?V0ZRUDB2VTdGcDY2L0cyVHpVK1BIMU43RS9JdUJxTjE1VUxnZ3MrN3dOcnZs?=
 =?utf-8?B?MkQvM2FCcnVmUkFFWk5XZURyUVJPcVZzK2Q3MXc4dk5UQ05nQ3YvKzlld3Zu?=
 =?utf-8?B?YXZMYldIVnFFOTIvNGlEbk9MZm1nQ3k1a21tSTRlWTFNU05SSUhsVyt0eTRB?=
 =?utf-8?B?bTYvU0NZZGdBbjgvOXY2VVdiYWtCOVg5VnRkeDU1Tll4WG5rdnNtclJaZlND?=
 =?utf-8?B?Nmh2WWZWL2Z2bzFBNGozQzZZZ2s4NDhYcmRTL0JKZGhZRnZjeTZqTXlXWHAr?=
 =?utf-8?B?Y3JNSy9SNW9RWE52TjZhL1BqQ0pRMVJFd3JGejZtN2VKcjVBbDR1NVNHQWtj?=
 =?utf-8?B?eVU0dHp1UzNSUnlZS2g5alJCdFJERmtPNUFhUmZQaEVoT010M1lYejd6RHZF?=
 =?utf-8?B?NnRMbmZGRk1NM080OFl6Nk9lTTBwTHhFOWhTTFMwaHdxWFpub1Y5dTEzblpF?=
 =?utf-8?B?S25xVWgzNjFRQmRWRzQzOG44SGdJbWt3Q09nWk9yNXBhSDJRR2pILzNGS3Vk?=
 =?utf-8?B?WTVNQ01TZ3NlVWJEZ0t2RVNFYlJoZmQ0dnZVd3phMjFCcldIb1dkclZSdUVj?=
 =?utf-8?B?UWNXMzhVZ2NzeFlYNFg3RGtVVGNCSnM3Um9vNFN2OUVJRXhGMkhSWHYyQWll?=
 =?utf-8?B?Y0d1VUxnOXVKUWJQSnduM20rTUJ4U1kwbDdLNklqNENmUHRKMkxKVHNuV3I5?=
 =?utf-8?B?QzgzcU9kZDlvclAzMHdBck01YWQwMFV1b0lLNktJYk9MWlNobU9mMlhrMFVK?=
 =?utf-8?B?Q28vMGgrd3RTellpaFBZNk92R1ZDSERzR2twU0plVjJib0lRLzkyUkg5V21m?=
 =?utf-8?Q?+RzsqXUWFbNT6vS4xrEOiENy6E0PSO25?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V0c0N000dDNTK3pIYmVjbW1oeDlocGpRZ202QTc0TFhocHlPdm10S1ZKK0Ev?=
 =?utf-8?B?NFV5RVhXRDNzcHZ6cVE5aGlMYzVBOThvRGVoY3F0NWFGcGlySHNjMXhYMXNF?=
 =?utf-8?B?NThCT0dSbUdRdXlTd1BTSm1QVHUvT2w2WHF0cUpOY2RzYjFsZEpQN1lLeWNW?=
 =?utf-8?B?amRUdU9GSjR4cmxicGVERnkzTXJqZk5iaUEyQ3d1SEtLL3phZitKQitjV1dI?=
 =?utf-8?B?Q3hpRVl4QTRIWmQxVXNKcHZWSHBXM1JpcUpaVE9LNEp0cGtQUnlPVGU0YjVk?=
 =?utf-8?B?RU1ib1R0VEV6OWNXcEhueE8xYTNNV1VDcE81b21uS2pQeXhlU0JXMDlUT2Vo?=
 =?utf-8?B?K2pSaFpkSitEdmRaOE10NWNUQzFqVmRub1VOb0lUN2ZkUFV4M25PVnVmb293?=
 =?utf-8?B?TWlMTGp1UFc0MVRFODIwbWxoNi9BY25DbFgzRFJVKzdneGE5Q1drSjJLVVJz?=
 =?utf-8?B?dk81dUpPc2JzTjVJLytOa2x6ZlZ5QVowUnBNNjhMNFNLVUQvS0VoMktoWTNY?=
 =?utf-8?B?WnY2RW1jcDJ5SnZpMmR3Mlh6a09HdVVVOGc2blFaR3B4RlYvM3lGbVZpQ3ds?=
 =?utf-8?B?VnRqVGsrQnN0M29MQ0RSQ3FXMXJYV1NTVmVMK1V5V1REUzU4UXBIbjBsb3A2?=
 =?utf-8?B?WnJJRnFYcHhaTy9EQmdvV243MFg0Lzd2ZnJYaTFta1hzQ2oxbm1JamtlTUM4?=
 =?utf-8?B?c1ZOVitUN3loY0JpV1VIMG5UdEdnYlJzV21jRW14NFlTSlA0Y0x4SjdnNFBV?=
 =?utf-8?B?L1ZOMFlNMytnQXl3OVdVbVJOZFhuRThLM1IrZldTUVVVL0h5QSt3dVlWbFlO?=
 =?utf-8?B?V0VrU3pGcU1HZ2ZuWGZRR000NXlTZzhIajNlNm9kMDQ5RGZQNG5ZQnJNaUJs?=
 =?utf-8?B?U25RVUpHQUxsODhaZVpnNFlCNWE3aDdUS3piTXBCb2tLdlJUYjl5UTUraGlm?=
 =?utf-8?B?SWZCeTZOZ0p1WWtlT2VXV0xUUnN5dHY3OWU1MVowTjVnZzlqb2J3Vm42b0Uy?=
 =?utf-8?B?VVpUM0F4QlY2VUlNOGxzNS9Qa2NoUDhEU016SVlsS2FBVzJMSU9jSlptSWpH?=
 =?utf-8?B?MFFqbU5nUGRaeTlrUnE3Qk0xaUNPaW1GWCtROGE2YmRSMVdCTnAraWNCelA5?=
 =?utf-8?B?L3hCWVV2S21XdU1QdDFJdVhHYUJjNUVTV0JqTVJxREFaRGtxVzVFUEtnN1Zs?=
 =?utf-8?B?L3BTUDV4SER2NnNsU2Q3dVFHYnU2T2NuRndEVStQOXdCM1JPWW92YnE1c3pQ?=
 =?utf-8?B?TnhWU0VRN0tFM3ptTlZhMW1aNmRVOXdHejg3K25lbTl5KzlUV09XTXU4ek9O?=
 =?utf-8?B?UjBRU1V5K0s1TGhHc1doalB3S09pdXBSeXVsVnJUMEpPZ01Rb2ZKM3RoQmgx?=
 =?utf-8?B?R200eHA2aGw4aWNZeTF3dnBIdjhLOUlzNWsycTNkLzVUY2I4ZXVibzJZU1lF?=
 =?utf-8?B?dVhjRlQ5RGZ2MXNudVhHZ2MrRWsrR01vM3laQm1lVG5rekNObi9YUGJkOXBQ?=
 =?utf-8?B?RFpwVzRjUXRIY011aDV1Z2t0M0duVE9GQ2pNSnlWRG5PZXN2ZkhEUEpadEYv?=
 =?utf-8?B?M0RFYk9QQ2VBZlJWSjRyNlBYQm9wR2c1VmhDaTR3bGVYcnNvZzJBOTBzREtY?=
 =?utf-8?B?aUtURFJvSC9kZy9LcC9kdWRlUWMzcTI0enF3OENQMjdBQ0MzeE1HYWFMeCtw?=
 =?utf-8?B?S09FTkhzQVNVNU5KelJiTzlUKzduR0h3K2k3UHZPaHd3NG1Ya1B5K1BDK3FL?=
 =?utf-8?B?Q1I2RXNIK0JDL1o2ZHdMUy9FLzJ0a2pubmV5SjQxbHg0cUFLTVVaQmliWEFp?=
 =?utf-8?B?MXpqbWk0Qk5JQjhhRG5SK0lSVFVXUUZGVHQzVVkvdjhzalhUblJ5OGZUNDBu?=
 =?utf-8?B?WTFtYlN4S3RJdXczSTkwRWdYOWU1YVF5Q3ZLNWpMdWQyVDBINUhMWUZjS0VJ?=
 =?utf-8?B?aHBDeEdQbm9ibjVlT1FoWnV3NVhDbnJHZzM3cmhzWENZOUU1WjQ2Unc3Y0Va?=
 =?utf-8?B?dlBlWlNoN091RVkzU2xSSG82aTU5OTZzbU8xeFBYcWl2NVN5ZlNGMUlFbXUy?=
 =?utf-8?B?TFAzUHdlYzFma2Jtb2tEUTE1N1FSbDNjbjQvWDZyM1VlVlhocEJ0OTBlOTFN?=
 =?utf-8?Q?/mVY1kbkUbS18eK/raK5bN1qJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1087d2-8475-490c-7472-08dd66d6e4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 11:12:10.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJo2hqirSPdcp8IuVM/E9me0VyYqxHpZ7vI9oWfvM7vOYSXV3blt+ULrcDVe1L02kY5WLnbH9pfuX3+QGQAkEryCmjltQKFl6mVHzd3c5Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7F4308BC2
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
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMTcvMDMvMjAyNSAxMDoyMSwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+PiBOZWl0aGVyIHRoaXMuDQo+ID4+DQo+ID4+IFNvIGl0IHNl
ZW1zIHlvdSBkZXNjcmliZSBhbHJlYWR5IGV4aXN0aW5nIGFuZCBkb2N1bWVudGVkIEkyQywgYnV0
IGZvcg0KPiA+PiBzb21lIHJlYXNvbiB5b3Ugd2FudCBzZWNvbmQgY29tcGF0aWJsZS4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB5b3UgZG8NCj4gPj4gbm90IHByb3ZpZGUgcmVhc29uIGZyb20gdGhlIHBv
aW50IG9mIHZpZXcgb2YgYmluZGluZ3MuDQo+ID4+DQo+ID4+IFRvIHN1bW1hcml6ZTogd2hhdCB5
b3VyIHVzZXJzIHdhbnQgLSBkb24ndCBjYXJlLiBTdGFydCBwcm9wZXJseQ0KPiA+PiBkZXNjcmli
aW5nIGhhcmR3YXJlIGFuZCB5b3VyIFNvQy4NCj4gPg0KPiA+IE9LLCBmb3IgYXN0MjYwMCBpMmMg
Y29udHJvbGxlciBoYXZlIHR3byByZWdpc3RlciBtb2RlIHNldHRpbmcuDQo+ID4gT25lLCBJIGNh
bGwgaXQgaXMgb2xkIHJlZ2lzdGVyIHNldHRpbmcsIHRoYXQgaXMgcmlnaHQgbm93IGkyYy1hc3Bl
ZWQuYw0KPiA+IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWkyYy1idXMiLCBBbmQgdGhl
cmUgaGF2ZSBhIGdsb2JhbCByZWdpc3Rlcg0KPiB0aGF0IGNhbiBzZXQgaTJjIGNvbnRyb2xsZXIg
YXMgbmV3IG1vZGUgcmVnaXN0ZXIgc2V0Lg0KPiA+IFRoYXQgSSBhbSBnb2luZyB0byBkcml2ZS4g
VGhhdCBJIHBvc3QgaXMgYWxsIHJlZ2lzdGVyIGluIG5ldyBhbiBvbGQgcmVnaXN0ZXIgbGlzdC4N
Cj4gPg0KPiA+IEZvciBleGFtcGxlLA0KPiA+IEdsb2JhbCByZWdpc3RlciBbMl0gPSAwID0+IGky
YyBwcmVzZW50IGFzIG9sZCByZWdpc3RlciBzZXQgR2xvYmFsDQo+ID4gcmVnaXN0ZXIgWzJdID0g
MSA9PiBpMmMgcHJlc2VudCBhcyBuZXcgcmVnaXN0ZXIgc2V0DQo+IEl0J3MgdGhlIHNhbWUgZGV2
aWNlIHRob3VnaCwgc28gdGhlIHNhbWUgY29tcGF0aWJsZS4NCg0KU29ycnksIGl0IGlzIGRpZmZl
cmVudCBkZXNpZ24sIGFuZCBpdCBzaGFyZSB0aGUgc2FtZSByZWdpc3RlciBzcGFjZS4NClNvIHRo
YXQgdGhlIHJlYXNvbiBhZGQgbmV3IGNvbXBhdGlibGUgImFzcGVlZCxhc3QyNjAwLWkyY3YyIiBm
b3IgdGhpcyBkcml2ZXIuDQpJdCBpcyBkaWZmZXJlbnQgcmVnaXN0ZXIgbGF5b3V0Lg0KDQoNCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
