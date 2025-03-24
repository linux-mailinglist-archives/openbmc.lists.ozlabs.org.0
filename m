Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE5A6D62C
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 09:30:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLmTh4l9wz3c5q
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 19:30:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200e::70a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742805044;
	cv=pass; b=JbOONuR+Yk6cuGaCZ16FTUDpx1p9GmZcpwd76tiSN8nMy0I8UmT4CB48+zLa/g2an1fU7A46lAjHRyQgur9ERHRmEEJsxAKCMttAi/Ncr6RGFdHsiaNhTh6xEFgoka2JxCF9UlbY7tNhBa+XNq/F7w1vklIVSMrGNcsvokXhN+vEESAP5deqxH2N028XJ4qrLc8efFoS3lKCkxqZuTAMMKIV8TMOVk60UpYPFaEnF6FaBBzS5L2WnRyi09I/2o76Ungmf+RC28ECLDG8BnCYIDOaOtIp68j7KJZUfJo0Djdmzmi5zsQqEJKxEtoJk0DSxnzCQqX2k2ZDeS1qHc/csA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742805044; c=relaxed/relaxed;
	bh=zew1zA2b5Qc900FH4v419XyVgG+i7rAjOXnVIGm6ZLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KzqP0pneae/s4PIye+5SXk+PRVPnuqW+d8SMuoBHz5350VuQKVWuIyYxrq8mbP9y5FftdOC00Y0yDZEercZ9YK8LCabtP0x9qqltoA1hTyTN1DEdNUff14vC/LL67gikxm8IIyTb8eYf2ff/HnPcSVFh+iODdiy6VvkS6yim5iksxsIoKk7autX170wtoOM90Ntwx8rqFxghuYOtLPKbsyt6q4cUxC2mcPQjJGdmio4IOKrkUphIdcOKpiviNcr0XbfnUFjKIZ7jVZk4FyWZlSSbySIPUB3SzZGVrUnUeZU0HyEsezuSGiukEJRHrGntshTkKiRmHRXzTLfkbk0sOQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=BtMnmjA0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200e::70a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=BtMnmjA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200e::70a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070a.outbound.protection.outlook.com [IPv6:2a01:111:f403:200e::70a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLmTZ5Fkyz2ykX;
	Mon, 24 Mar 2025 19:30:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5YxCgNHkmCRS6Nw71y3ssbLW6bl3hvMrxEkLIb34sMxsK/t+CJ30nGNtEdPiBFUY38RKUMLFS5X4/9AUBxmf/ZxjqW+FN/gIGJvzRQDILJOOEtOKeqO9db5ZzRNU1RYSv/uPb0RTsCJW+ddNNm0rczsQO5f+wlRQZ12JAVpMUVQTZWWgWUlvl53ai3RjhGReXOPPccMQxFeFe6/4MgrwiQWeqbh7xtCht2XR8AruNE1MWr8tIyz7KNuhEpY59ApX3dZbRrJi1Qujcxjhn9OXJ//h7Os4hRwAPEg/ZWZftJBw++a1/vTlPlREGVMqASJtnKhLYY1SeLSRFEQcvtASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zew1zA2b5Qc900FH4v419XyVgG+i7rAjOXnVIGm6ZLw=;
 b=Tv/BfBLXtMjVpnk6cLxdKtZcTEh9Z//7G3QN/xbM/t4ErlTawNV9afXwjY/N08w7DlvtUT/q90mLbq4gQdto2XYodTKoBnjgPmdAFSlwoYUY/xAWYjFD74lDEBWGc1YR00I6aakVyo8phOwQydz5B/3aaEY0EwoxvFydnLcRVTAOKWkz92iu+a52XTIcIwdPOHJn/XkwXOqJ+bQqLImp21CoWSyw1TMyx3bJImZw6HLD6d1EJDn81yeYQY/BkrM6hLBSPlGLZPV47jwThIkX2U1qDGHx82hpbKd17kvlQD1983M/TWCDYP+AAkdgtzs1wEqCp29IEFBGg+jBDwvRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zew1zA2b5Qc900FH4v419XyVgG+i7rAjOXnVIGm6ZLw=;
 b=BtMnmjA0K914vluJKLny8XHCbW0aCCbFulQNkIwFjzEw9NAnuP9pIdLI+qbXdWGwoSGNtAnpkBOwaA6MdTT5S+IwZVgEkm2Dpa/xnDzLcDoqDXCoghH8gC+WGi18WzZvs9jVI5YsIj01sAeG0jK7cc92WS92uyuoOCdeWy43sTfTr75nr8faob3el/bNluOq3xOC8UCZbI7BhlvkuhPF6xdsCA3bwyZP9YvtzOUCvvLYh2YyN3JXw+vZgrnG2MgxEm//UaAHMlVCGHn08Q+kLw/GxJEPvG/GNANNV9q4ncPGu5RLmLDYkWurcRqqSUGshq8cS+gPf18Q1v8J+/eyOw==
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com (2603:1096:4:235::12)
 by SG2PR06MB5360.apcprd06.prod.outlook.com (2603:1096:4:1db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 08:30:16 +0000
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f]) by SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f%6]) with mapi id 15.20.8534.036; Mon, 24 Mar 2025
 08:30:16 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYggAecSoCAABKwMA==
Date: Mon, 24 Mar 2025 08:30:16 +0000
Message-ID:  <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
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
In-Reply-To: <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI6PR06MB7535:EE_|SG2PR06MB5360:EE_
x-ms-office365-filtering-correlation-id: eb7b60f4-cad5-47a6-d440-08dd6aae1b1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?Rll6R3hyalpSa0pOOXgzNlpyOW1DSHB2T3lWQWtRd0VDZ0w1ckNBUjQxdGl1?=
 =?utf-8?B?Z0p0Y0tIdVVwNGtzM2s2ZHpHNVBTNGViQjRLZDVYbEE5c1pSM3htV2pLa2JX?=
 =?utf-8?B?M09YUXQrWkxVaEhOSGlTRTdSSnQrNSsyN1dHMlJUekNhU1ZsZ0tycHVqdGxi?=
 =?utf-8?B?Y3Y2QTJCNE1tM2xyMUp3Wmxucmg5N2d4SitNd3p3c2k2NTlaSFplbDE2RVJC?=
 =?utf-8?B?TVpZY1RSaVJydmFiblVQMVkySWdHelFNUmRzSU1ZNlUwRkh4ekl5bWlxUDRO?=
 =?utf-8?B?VTFINXBEQytTNkxGdGkrTldzaHpNczNkTWJhZnhTczcxelFnckRVa0RjMlU1?=
 =?utf-8?B?K3RSTVRGTjIxUk45TW9FVGpiYnFnUGFneGNid1BVV01VekhFS0hoc2VCaXdK?=
 =?utf-8?B?bFoxNEdMbEpmVTA1MFVVWi9scElkNXdORU9id0lHdlNQTzhXQ01MZ1VZZWda?=
 =?utf-8?B?a09HWGlZc0FPWnY3N0RXOTBMMExKS1g0SVZxbE42QmJWdW1hYXY3bllUaVJF?=
 =?utf-8?B?ZC9WZjlaQXJRVGJzLzFNcGFLd3RkaWN6RTRZQWdETVVuRkhhWUp4bWVhaDJv?=
 =?utf-8?B?MUV4eVNXMXAraUx1ZkRrTWxTSVhFbXl5K1JDaWdhbGVRdHoxNFlhZ3dpR3dJ?=
 =?utf-8?B?Nk0yMFlYTWlSdWxBWXBDamFCc0lVeVdxM1ljSnd5OTJsKzlBeFdjTHhIUFBx?=
 =?utf-8?B?ZWJ4WkNSM0FSckZ2U0VrWFBrZ1FHZzlqdzJueTkwQjRXSlByVGFiQThMam5M?=
 =?utf-8?B?a0ZBUU0vTDFVejFWdWE1dDNadU9EM2tFeC81aUdLK1psRE9QbG5pcWdrSyta?=
 =?utf-8?B?S3ZnYjN0SHF6a1I2YnJCTkFHS2c5WFhrV1BlemNXR3k3NzFrTlRHRnNjWVpu?=
 =?utf-8?B?OVVyS1lwRnUyN3IwRVR6bnFKQmNvand6SGRVcGw1QTcwWk1yRVB1SHRoNEc0?=
 =?utf-8?B?Y2p6N3o3T1gwU2tzeUtXYUJFUjdXbXV1d0tvOWQ2a3pTSkkvVTdES2ZsNnpX?=
 =?utf-8?B?Y1RhZmIwTzlmNzRyMUNlRmY2NUpvR3huK2ZjaUw3Vm8zL20xSC94UjMwdlc0?=
 =?utf-8?B?K28wekFGdUxDbjhFTDBId2IyV3pJMGNKQmZmM0xjcEVrZ2ZkK0Z3M2FuYnNL?=
 =?utf-8?B?SzdQUWFxY3VhbGVvS1Z3RmZJdTdTV0FGSytuQS94N2lkR2Rpa2hPaUtQajla?=
 =?utf-8?B?R0xMRnhQRkVnYXpRTmR6NURkNklsbWtvVCtjVzZ4RTc2OUl1Y3E4eUI1c0M5?=
 =?utf-8?B?eTJuVDY5N0s2dGtTbTZaa3BVa3dMWWNrdVY1czYySk1HdEJLb25lZjA3WEdS?=
 =?utf-8?B?QUs2MmpuVUN1N0FFMlQxNmtkc1NUUTViNnFweVZYR0NoR1JrcUNvMnVQOThn?=
 =?utf-8?B?UXNWNGllUkhNK0F6UmJ3Y0JNcXVBVFNMWjZVcHlnZGtZVW10Q3dBejNtNEF0?=
 =?utf-8?B?RkJHdmVKZ0toWmlWcmFMS1pWSXdFU01FR0VrSXZ2T1AySjhHSGNSZ1BPTjNy?=
 =?utf-8?B?WE5KSll6eU9JVTVSUHJRQWFMYTRVN0QwQ0NHTEgxbktpZzJXUWlXeVZNanlL?=
 =?utf-8?B?ZEdLSncxd01RcE9INXE4UWl5Q1RmZGRHRFVsdndodk52R1JuYnJsTCsxT2J5?=
 =?utf-8?B?eUhSTlRFTjl3Z3UyTDdFUU41VlhXYnVWeVMyT0hKdGJzazd2eTNQdUhNM2tO?=
 =?utf-8?B?WVhheUFrSUJpaWUvNWFqcFBXRGJ4NjRCRFlQWTM3NWtMTTFaM0hpMnJMN3Uw?=
 =?utf-8?B?MzdydlViY1JDUTVNVmhTcElkYkNFSGRmd0tGTG90RmUyd21Id2VVeFJXcThM?=
 =?utf-8?B?SncyL0FMQjNoaStCa1dxcm1RQTAwTk1NVmY4MXRUWHlyQ3g4NEFIVW9OTDY2?=
 =?utf-8?B?L2k5N05RSkNiVXhzNndaT0VPNEtITWNCbmViZlU3Rmc3YWhMTHZZTnFJY0k3?=
 =?utf-8?Q?7ES/Joc5xjG4nzIGgDaTUZyGlc+LrgMf?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR06MB7535.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OWJ0QS9PalI3bEtPZmRvbG9CTGJrRjIxbWw1dldKOXp0UnR0ZXpSVFdTTTJi?=
 =?utf-8?B?TjBma2VWSWhqVnhUYWJ4MmZOQmJrVTl1QW4rektoTlgvdjZsaVNYRGZnaStS?=
 =?utf-8?B?SCsyNDFvWTN5SWlOb2w0ejVPbk5YTkxOU0lRRllJL2E4TlNaWUo1Y2Z1c1Nu?=
 =?utf-8?B?RWc1dFBwZXl1dG9aUk5tU2gvY0IyS2l2bHhpaG15RGpQSy9rUnhTNFJuQkp2?=
 =?utf-8?B?YXhGV1ZiOGlDNGpackh3M0NqdDN0T29RcUFEY1BJTllNa1BzamhCeVRUcThr?=
 =?utf-8?B?ajV4VTVwbjlveFZnZlhGR05EU0l3Tk5TMDZDWTF3SE1MQVRjeGR1eWN3cGZh?=
 =?utf-8?B?MmQ2clpsNFlNTHVTU2l4MkZsaHJocHcrQ1JmL2MxUlNXUlp1V0IwRkY5by9w?=
 =?utf-8?B?TlFPSWxRTE51cUFPMzFzYVFETVdteFBBUEZvSGxJVHEyNSsycThHUnlIMUMy?=
 =?utf-8?B?cGJucG9EczFLeXZ0U0F3cWRrTHkvVUoveGl2ZytBbEpicm1JRFhPeHYzWmtr?=
 =?utf-8?B?OW5lZjI2Q01OUFlYcVNGMnp1Y3dBVUxvZVRaTVdGajAybjcvTnNzaDdSK0ZT?=
 =?utf-8?B?MTM0U1NVRUErRTFWNUhTdEtSM3EwL3RiREMrSkYwcjFPL2pwUWdiaXhUYm0v?=
 =?utf-8?B?S1czak9tZTRaRXpHWkV2Y1VMQjJQRHIzY1dnR0JwSnBycXpDZkN2ZC8zaVdz?=
 =?utf-8?B?QnNtT2x1U3lWcDJicVYvNkhRaUs2bGJneURBT2VnSm9IN1g5V2lKTG5DOG83?=
 =?utf-8?B?NjdlN2FrZnlSeXZvbm1qMzI1NUZHY2wyUkJqaHpCNU5LZjQ0U1BYaWQwbVk5?=
 =?utf-8?B?K3g0M2RBNEFMMG9aYytYOTZqWHdvZDVISGs1WFc5SVlzRkNhOVEvSmxrcUE1?=
 =?utf-8?B?Tlk0SElMWUNMOVQxNUt3WnBLWWM2eDFnZFpLVDF3elJ0dWNsTmVDMUVqV0tU?=
 =?utf-8?B?eWN4UFhZT1lDK05rRkEzL0xidnU4RWdXVi90K2VKUVcyajIrQ0N2T1lKYUdt?=
 =?utf-8?B?QkhlMkpMZm50U1kzeWVXcHNJUjM3a1ZaTERhT2VhNllWekJEMmU4ZjR3STZr?=
 =?utf-8?B?M0JsY2NYTGh4d1k4TzBGQ2dPdk1yclI2VjV1STNQTmE2M2U2Q01UQUpkTFlU?=
 =?utf-8?B?TS9icFBCeGMyaUlQKzVERGF6VkJVazhMMVBlN2RaRkp4TW54SzQ3R09xbjdI?=
 =?utf-8?B?WW9vNExWNXFZYkpBWHZvb1lodmVzdTB5UXhIZ3ZNSmdRRVJUcWhxLzMrYjM2?=
 =?utf-8?B?eHJmY1d5a2RLekhqSWJqYllIQTBFSDk3aU5yZGdhS3F6UUFLMFRTQ3BJQWRm?=
 =?utf-8?B?VnUydVNKUDBGcDNKU3NCK0NqSHJoTlpWaFFTWEZFTEJWZHpOR2NDNk5tR3VZ?=
 =?utf-8?B?T2U2bHJ3RGtxdVpVc0wyZ0cxbWJnWHEzdk1UdEVnRzhja2Q5TUhESEl2NkNU?=
 =?utf-8?B?bEJJSCtNNDh4Q0JITGVLZHVyYms2c0JhRW5zc0JzWVdDbkNyd0ZMV0NoUG80?=
 =?utf-8?B?TG53UDdjUFlMZ2wrWktrdzNKRnF3T1RuYkcvRzcxRGY1RHJKR2FvK3k3S1JW?=
 =?utf-8?B?WWRNWFVlY25FL1lteFRIaGJWNmxWdzZIK3VMT3Bnazk5M1U3U015V2VGTE80?=
 =?utf-8?B?ZmloSWh2M2JjakI0OWVLNysxaWdWaEkycVljbmNESGRBcEhyeGV1aFV5YU1v?=
 =?utf-8?B?bXJKc05YajhSc0NrY1doeEZWakNNalVvak9OdktqZm9yTjRvUjNqUXNpd01K?=
 =?utf-8?B?MmVDdW5aYXRwY1BHNW1PWlNIYkJBTjdXb25kbWIwM1pwOStJMUlYYjdWRHJn?=
 =?utf-8?B?WnhoVlZBcGlHSUZCZ3hzbzZhaVcxVE1XUmJZSTBLRFhmQWJzZll1WmhaR2Ry?=
 =?utf-8?B?bG9qdVIrM1BiTnRTM1lFRmIzNWdzamJPUEM2MlJidWZtZzk2QktlYS8zb1lM?=
 =?utf-8?B?UUlhdjhHOFp2Vys5YkM4ajZBTGp2Tmt4NVFBNkx1NHRpWVJXNEFkZjR6eXlB?=
 =?utf-8?B?TzY5dnBrRmhsdzQremZBUmo0cyszS1ZUSGRXV0o2cTNOT3loRDErKzlrR0hR?=
 =?utf-8?B?dFBQY2N6bHg1VzgzaURzeVo1K3VBZDl4UmxCLzNzWG14b0dPeldXaEQ3OVpK?=
 =?utf-8?Q?4uGXAmJSDZM+0Jfa3CkBBBVPz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI6PR06MB7535.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7b60f4-cad5-47a6-d440-08dd6aae1b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 08:30:16.7972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vw130QbZvWdSPLH+HRifcdyWHq4sk3CwBakUCYSX75jKFz5pvrA1SpTsz9u42WarqogRxJYN1IyxX/5eVFMP+uwsa4qY66w4F+IdnyZZdbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5360
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
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMTkvMDMvMjAyNSAxMjoxMiwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJp
bmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+
Pg0KPiA+PiBPbiAxNy8wMy8yMDI1IDEwOjIxLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4gTmVp
dGhlciB0aGlzLg0KPiA+Pj4+DQo+ID4+Pj4gU28gaXQgc2VlbXMgeW91IGRlc2NyaWJlIGFscmVh
ZHkgZXhpc3RpbmcgYW5kIGRvY3VtZW50ZWQgSTJDLCBidXQNCj4gPj4+PiBmb3Igc29tZSByZWFz
b24geW91IHdhbnQgc2Vjb25kIGNvbXBhdGlibGUuIFRoZSBwcm9ibGVtIGlzIHRoYXQgeW91DQo+
ID4+Pj4gZG8gbm90IHByb3ZpZGUgcmVhc29uIGZyb20gdGhlIHBvaW50IG9mIHZpZXcgb2YgYmlu
ZGluZ3MuDQo+ID4+Pj4NCj4gPj4+PiBUbyBzdW1tYXJpemU6IHdoYXQgeW91ciB1c2VycyB3YW50
IC0gZG9uJ3QgY2FyZS4gU3RhcnQgcHJvcGVybHkNCj4gPj4+PiBkZXNjcmliaW5nIGhhcmR3YXJl
IGFuZCB5b3VyIFNvQy4NCj4gPj4+DQo+ID4+PiBPSywgZm9yIGFzdDI2MDAgaTJjIGNvbnRyb2xs
ZXIgaGF2ZSB0d28gcmVnaXN0ZXIgbW9kZSBzZXR0aW5nLg0KPiA+Pj4gT25lLCBJIGNhbGwgaXQg
aXMgb2xkIHJlZ2lzdGVyIHNldHRpbmcsIHRoYXQgaXMgcmlnaHQgbm93DQo+ID4+PiBpMmMtYXNw
ZWVkLmMgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyIsIEFuZCB0aGVyZSBo
YXZlDQo+ID4+PiBhIGdsb2JhbCByZWdpc3Rlcg0KPiA+PiB0aGF0IGNhbiBzZXQgaTJjIGNvbnRy
b2xsZXIgYXMgbmV3IG1vZGUgcmVnaXN0ZXIgc2V0Lg0KPiA+Pj4gVGhhdCBJIGFtIGdvaW5nIHRv
IGRyaXZlLiBUaGF0IEkgcG9zdCBpcyBhbGwgcmVnaXN0ZXIgaW4gbmV3IGFuIG9sZCByZWdpc3Rl
cg0KPiBsaXN0Lg0KPiA+Pj4NCj4gPj4+IEZvciBleGFtcGxlLA0KPiA+Pj4gR2xvYmFsIHJlZ2lz
dGVyIFsyXSA9IDAgPT4gaTJjIHByZXNlbnQgYXMgb2xkIHJlZ2lzdGVyIHNldCBHbG9iYWwNCj4g
Pj4+IHJlZ2lzdGVyIFsyXSA9IDEgPT4gaTJjIHByZXNlbnQgYXMgbmV3IHJlZ2lzdGVyIHNldA0K
PiA+PiBJdCdzIHRoZSBzYW1lIGRldmljZSB0aG91Z2gsIHNvIHRoZSBzYW1lIGNvbXBhdGlibGUu
DQo+ID4NCj4gPiBTb3JyeSwgaXQgaXMgZGlmZmVyZW50IGRlc2lnbiwgYW5kIGl0IHNoYXJlIHRo
ZSBzYW1lIHJlZ2lzdGVyIHNwYWNlLg0KPiA+IFNvIHRoYXQgdGhlIHJlYXNvbiBhZGQgbmV3IGNv
bXBhdGlibGUgImFzcGVlZCxhc3QyNjAwLWkyY3YyIiBmb3IgdGhpcw0KPiBkcml2ZXIuDQo+ID4g
SXQgaXMgZGlmZmVyZW50IHJlZ2lzdGVyIGxheW91dC4NCj4gDQo+IFdoaWNoIGRldmljZSBpcyBk
ZXNjcmliZWQgYnkgdGhlIGV4aXN0aW5nICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIg0KPiBjb21w
YXRpYmxlPyBBbmQgd2hpY2ggZGV2aWNlIGlzIGRlc2NyaWJlZCBieSBuZXcgY29tcGF0aWJsZT8N
Cj4gDQpPbiB0aGUgQVNUMjYwMCBTb0MsIHRoZXJlIGFyZSB1cCB0byAxNiBJMkMgY29udHJvbGxl
ciBpbnN0YW5jZXMgKEkyQzEgfiBJMkMxNikuDQpFYWNoIG9mIHRoZXNlIGNvbnRyb2xsZXJzIGlz
IGhhcmR3aXJlZCBhdCB0aGUgU29DIGxldmVsIHRvIHVzZSBlaXRoZXIgdGhlIGxlZ2FjeSByZWdp
c3RlciBsYXlvdXQgb3IgdGhlIG5ldyB2MiByZWdpc3RlciBsYXlvdXQuDQpUaGUgbW9kZSBpcyBz
ZWxlY3RlZCBieSBhIGJpdCBpbiB0aGUgZ2xvYmFsIHJlZ2lzdGVyLCB0aGVzZSByZXByZXNlbnQg
dHdvIGRpZmZlcmVudCBoYXJkd2FyZSBibG9ja3M6DQoiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyIg
ZGVzY3JpYmVzIGNvbnRyb2xsZXJzIHVzaW5nIHRoZSBsZWdhY3kgcmVnaXN0ZXIgbGF5b3V0Lg0K
ImFzcGVlZCxhc3QyNjAwLWkyY3YyIiBkZXNjcmliZXMgY29udHJvbGxlcnMgdXNpbmcgdGhlIG5l
dyByZWdpc3RlciBsYXlvdXQNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
