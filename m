Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B2A6ED12
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 10:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMQG22FMjz2yqy
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 20:52:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200e::720" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742896368;
	cv=pass; b=KkTIJSfSMtD72WKrUJBpgBN3dyGVhkbS0Sgu0VOdydSdiSeRmpSoQRi1zjk4O024X/suG+6XMwGweVJko8bQdnDNH1aMUJjI74sg/4w2etU0LeGbk7nLtX9UHEx/4Ji48lgPLS81ZQPVjO/nAnjPc2enLwQWl2V72A+D+SrLUlYtNMKUucq6ScyrkaU1a++nvqZ/c6saua0r26nVED2cNQ83y/KYKnTwx0o0HAMYr5qpBG/EbZBuI+nUpQdg0Xlt+b+l1W0qmJN832y/RJTPMMHriq1lBS7wapK2J83t5PZGlvwT1eapANW0n/xcojQFRZBXqGjb+xeAPmwBCNSEYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742896368; c=relaxed/relaxed;
	bh=nvfdLPXlhEoorOTbNl/RJkY/fOmsEMZpIt7tjNQt59Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h9jwVEDnsbkMQmf3ictoc3s2Bsn7VyM+ps2oS1J2bChEJCxwh92UFMWceFGWBoxYvD0USgIK685JC6dZiiNbWh5OUhc11Eq+GTECGyBB3XS98OCtTksblJ5BqfYFi0s8mdzw/4BztYOALoiw0XFnbJa14eOnIBDYTSASP2igq+1fE4fcMyg3d1tn3ZgNe+vK90dEyQHWRZYffatxoyKnWbOm7nxgZmH49QTWKBDQILSClaBs3vvI3idF8ZWLnHJ0Kf5AlX1uEbWN/h3R+SP/l485mNUlYq9BLOgGgxIicDuYmdCnG91X9o2zomYViAwLpWE+eKidovqIdnA5elx4yQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:200e::720; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200e::720; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20720.outbound.protection.outlook.com [IPv6:2a01:111:f403:200e::720])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMQFV5Svbz2yfy;
	Tue, 25 Mar 2025 20:52:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOYCXJUO57i0rse8Ri0u69KJMPQ9QSSY2slQlY+erTtc2SjtPxxtZWAVfJfDDvzXWLsH0l8X6g5WORixY6KJ++ncWbRV8MjnLa4LfiJRuh9n9/c9kN8lfegK6270ng+wEbkZSUoKuvNl8DjedWQ3D+Be8ruX60elADi3rFIEm4sxXWP0SQebIffwD3eIEDgw+Rah+O59Qp6zUPJU7TA1SxLVZCccgq3/Qc47eeIiiPEV6CgUVPHwtIh7dOaOJHlDq6T9VdL/6gMJDIqZ9qHriH8perhynymbVy+6bVzFBq29B7e2dxUhVTFJSIvrxTN4ragxORRGVd3T1xZZOr+8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvfdLPXlhEoorOTbNl/RJkY/fOmsEMZpIt7tjNQt59Y=;
 b=kgP1ctE7Ctci3zVWMIJIUXEAE2qKsSjoONNV7RsX6nX1zTyVmykNa5Zc2Pmzlw7T+4LAS7U8G3pI8/W9aLZpzGjwwK0tZ7+/E+qhZ4AQlWk0wtrX/W+Y2BPJy6VXeVAv8lD/kbh9GDwGjbigCeg6Hxb88F9V0CQl92DR7cLt9R80Gq1sNGdrZ/HYgalUJj9IkGXJVZX/mr85z3A1c38AbO9R4v98Ba94eg+ze6dwV+jK4VlqHsxIaH/12DOlfhkLgtdNeHEQaJxF2rBrNVBMjUuh4UjoRHVevI5zbyUqphOp2hfdFc+tOTg2ITfOo9R3tq2fjd/GSPSw5GlfhgAuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvfdLPXlhEoorOTbNl/RJkY/fOmsEMZpIt7tjNQt59Y=;
 b=XjhpknkENP/dDQuS2dt9/dH7nKsD80yq9bM0qyZFvwY4UhMSF+hB/zMEXlrXfTnx906dydOaNK/KdgbAqQlznJYwWcBjVCQI4mC1GpNNAnVtMsrTQCazJ3U23XEyuQI14pW7o5q+9VQaBGKZSGCfBQfS/10Y4h+2/7yxXFjSZ+vV6sldRazOO1U36HWyGEOKUdFsEZuVLAklHvS8lJtotxUchaLGo6M9kS4vraBoeweZxYZLwj/1KCO1NacLu27G4xLOuWa2fgfbcUgL9o2kz4C0T9ahg5xXFfO3qESnyUGLdIw+V9TqNIPWmGavqUl/FNjVwOPocIMwMQIZqT+LPg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SI6PR06MB7241.apcprd06.prod.outlook.com (2603:1096:4:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:52:05 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:52:04 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYggAecSoCAABKwMIAACvyAgAANJ+CAABVGAIABfA3w
Date: Tue, 25 Mar 2025 09:52:04 +0000
Message-ID:  <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
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
 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
In-Reply-To: <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SI6PR06MB7241:EE_
x-ms-office365-filtering-correlation-id: 0befe5bc-dc1a-4654-00d5-08dd6b82b295
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?cFg4Y29kcWdWZmdTMFdyNk5aMmZNZXRJek9IRkFiRit5SFVGVlZpSUZydDZk?=
 =?utf-8?B?TGFSdDJubHY4c2JkdFlYTW9tQ05BdWNCclY2NWJrbmFrUnp4anhkeVJjTXB0?=
 =?utf-8?B?UllpYkdmankzV096ckxJYi9wVUh3OHlaSVJScTU2VzVtcnJnY1VhZ0g0V2U2?=
 =?utf-8?B?Yjcrdkd4WUttSHZQYzFZcy90a2ZCaEdleWxEZFloZlRxRk9KWm9ta3dQc2NU?=
 =?utf-8?B?WTdTd0g4c3czcHZFZzFPZ1FWRVMxVDR4WHYwTmpWcmh1aURwZlIzdHY1Tm1E?=
 =?utf-8?B?bDV0a2tMQ0hzVDBRUXhQbi94MDZsVm43TzR2bHJxdkwyVHUvR0RjdkVIckRH?=
 =?utf-8?B?OUNuNmNZVEF4MTRkY2xFc3MvL3B1cVZNT09QTFpYTWhDTmU2citSUVJXUU5n?=
 =?utf-8?B?S1pGd0k0dEcrYlpCcnI3Mk9SU0ZRakttQTQ3TGx2V0RrTEkzMzMzeWRVYXAv?=
 =?utf-8?B?VXdhMzZucElhL2FVcExyeTBuVDFrM3pVTlFKOWo1SGVxZnd6QnhRZ1FSNDZp?=
 =?utf-8?B?Ky9aeVdGcG9Cc3dGWDFXTjBVeElDQ2tFY2JkS2M3OWRHUFRJcFFSejY3RWNh?=
 =?utf-8?B?aldseFFBallxQWJRUE52WjEweUxKcm9JTitpWUMxdTAreXVGTGNIU3p3YWU4?=
 =?utf-8?B?SDdMSm0rVmF2VmdwRDc4MkJxQTQvdVVuQjhXaS85a3FYaERvRExnazhZTlUz?=
 =?utf-8?B?Y2xFN290ZVV5Q1JQdjB1YXd5U3RXT1FtMlVkSCt1VmpMNk15MUwxdytqOFJ1?=
 =?utf-8?B?SkhEanlMbHR0Vm90TTF1MEViZkxuSUxBUXJFd2NzSnpnT3Z3MWtNMWdiVnNx?=
 =?utf-8?B?aFNwLzZJYThzZG0vYU15dUQ3QUxTVVVpTXh5aGhLeU9XTTM4OThyWDhkR0k3?=
 =?utf-8?B?TEZNMDlJRFZJakV0R1FGRkpsRGIzTCtlSDg4U2FQb2gzRUpNbmIvQ1NUUE5t?=
 =?utf-8?B?SndsWHliV1FIZkQ0WDdMbFp1aGdVYVBKRmpDOUV4M0s2c01RbDJNWFRPSkxw?=
 =?utf-8?B?R0hSVmZEUVl1QU9hbnJ3VGxmUWMvQzBpVWgxVm5iVTh5OUVudWNxME9YQzM2?=
 =?utf-8?B?Vll2eTlxNGxVUXFTU3BHTXJOOFpYUTNEOHJHU0V0TCtNbm5sV1lrYUJDSlJn?=
 =?utf-8?B?QTZtOVJDSmxoRG5CVDliQkJaR00rWmVqL3BhV3ZyZ0FMZkFXeVYrTkk4cUla?=
 =?utf-8?B?cis2eTRIK0xTVjZKZlVLMzJ5ZDRBVHYxQXdXdlRmNEVIYkE4RVFVN2w3U0Mz?=
 =?utf-8?B?SXpJdXFDWjNuaU95NVhlR3QrbDhXSHEyakVPOXRadzJQR1FreGpXaHdHYkFW?=
 =?utf-8?B?UFNMb083Uis2NTQ4SzJyYU5Md1VkaGdsYmdsaFJubHFuMk41YVhpMGdvQmJ4?=
 =?utf-8?B?UDNpN1NLdDdHa1o3Y2xSQUpDQ2lKUUJPK0M0dDA2S0V1QmdpbjdINTBhNGFG?=
 =?utf-8?B?UDFacWlWTUErUXhKUW1UZkFIeHJOeGRweUtmbWdvQjRtcDhKTE5RZ21TcFZ4?=
 =?utf-8?B?dnNFV1c5RGNHYW4yVmljeDBIQzBHcjM3dWFhTmZzVllldVN1N1dxS2prNWF5?=
 =?utf-8?B?SytTaTZ4M29OSDV2UmFyakFFUXo0SXhwdmRBYWlNRHFmUHl3QUVvTHlVVHFt?=
 =?utf-8?B?T0dKRVAyaHJkQjljcEIyd0w3TTNCcjN6Q1FZRUg1cVpJNFpyblJYcEN2VmY1?=
 =?utf-8?B?TCtnWi91RUJZV1c2eGZsNWZvZ0FtZ2V0cVNqOVNmZE4vWGo1NmVDbjkzTC9P?=
 =?utf-8?B?R3JJSlJYa2llTGhuY2htWC9qSHBnY05KMG1EbXJZT3YwYXFjZEErWEtha3BZ?=
 =?utf-8?B?VnZxUGl6clJmbVJaYUVsRHY4VkJhenM1OGEwOUtMTmNvYVVrckZ0Q1hzeWhz?=
 =?utf-8?B?cUNhek1ZZk5WWUpzbjk0WXRHTVRnQVY3aVRWUUlnWVNFeWdWaVFTUnR2bWFF?=
 =?utf-8?Q?0ShI74LoldfPeBv2voep1nbpFTF4MFsb?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YldEeUNrNVBjWE1QTjV3QXZZcTA5U3pGWlZ2MUpPcHZzZUkveFdTWll6QXlh?=
 =?utf-8?B?SCtOOXVpcjNuR2VEaWJ5TjMyYUR6b2U0dUVxUDg2UThtMTF2bzZEd2JsQzds?=
 =?utf-8?B?Qml1YW1RNllaeVdLaEFxYzh2cTVyRmVPaURMU1gzT3prSXNCdEkrOVNOTzV3?=
 =?utf-8?B?bUhaem5ab0JXanNBL3ZmU3RyVkN2cDlPYlVxR1N6NjlRcnhmUTk0S2VyVis1?=
 =?utf-8?B?czhDRGZuMC9FQlZhSWlKNkJJcWltejAvWjl3SkFKbEFkaXkydTJpK213Q0pO?=
 =?utf-8?B?VTdsemIvaWZqNDFXZThva0NDYXdYMWV4Y21OZXM0NkZLV2lvVGFrenEwbGpy?=
 =?utf-8?B?N3NISVZlbXNNaXFZQzd5THdjYkZJNWpPNEk5WkN4S2o4OGZZM0JEdElUL0Nh?=
 =?utf-8?B?b2pRNWQwNFhjVzVyVFhKMDZyWDVFUjhFb0oyUkZLTDMwYWVVV2tUT3JPN00x?=
 =?utf-8?B?NzVKYnVQZk1sa1R5S0VLMzFhY255czA3ZlhSamVRV2xoSTN1WnBJMFQyZjdY?=
 =?utf-8?B?YXgvbjdBZnY4U2ZmOEVoS3NDMzR2bU4rS1pyaG5aVVVMYWhhdFpMRlBPYjdi?=
 =?utf-8?B?MFZTNDRET1hqZHAwZnFmQXlURVZERXFaTWtVbFA2VitJTWxUTVY5bkYxdS9x?=
 =?utf-8?B?T2VzeElIdUhhWkdmcEpKNFlvTTh6bmFGOS9sVGhFN20vajBWbXYxSG4zV3V6?=
 =?utf-8?B?cEprSWtlMThRamhLYmRjTkZxYXllTko3U1dFYWVaaTFOYXVEMkNNZEJKSzRT?=
 =?utf-8?B?dXBLbkxHQWl3UzdVMFB0aE4wK3NQOUd0dEx4YStYWGZUcHpLNTlsYitBWWZt?=
 =?utf-8?B?RWorN0Z4enFWZVczZUEwM3puK1VtS0xDUXVJY1FWM216bUhZVnRENG5TeW80?=
 =?utf-8?B?VjJnRTBzdkdROXVTVGt2TERGWGtDRXdOSGJ3WWdqSUI5MmRaYmUzLzhyOHVs?=
 =?utf-8?B?bXVIdGtuWXFaQkhtYWpsRjh3ckVFR3lQdVR5bEVnc0xsNkFneG5LbzlSbU94?=
 =?utf-8?B?SlFTSGRZMndUNzBpazBySGt1M1BYbDA0WVpvNWdINnNvTm05MzBCK0RPangr?=
 =?utf-8?B?UytkYXJteXllY3ZjVE1hb1drTElFL2xXMTFuRWsyZUg1MWlUc1ZDY0k4RDhi?=
 =?utf-8?B?L1VTTWZ5clYzbVJvdXVzS0FiWXZHU3Y4aEZtMTNOR01Bd1BJWC9TSmlXWjJl?=
 =?utf-8?B?ZlFjeWg3c3U5UWhDUEtLcjk4SXZ0SU8wU2RCRDBkSzZ2UDIyNTcxYWl4TEJu?=
 =?utf-8?B?R05TMTdoZERBbUQ2UzFxZEVZUkdIR3lzakxFa3BoYTZwYUtZL1ZZMDBzWWRP?=
 =?utf-8?B?R2RhUzZUSHZpeVFMczBnT2tzNHd6ZWUrQ3F4UnI2QWZqTmIvVjM1NFpLd0Nq?=
 =?utf-8?B?UDZRTjI5NUE5ZE9QTW5KUTFnVW9DMzRTamxDSFl0cnovZmhaSnRpVks4ZGkw?=
 =?utf-8?B?ZXNhSVhyblZiZ3BnMmREWEloSjUzeDhSbmp4NG1kUDBaWGo3VllEU0x0QlB0?=
 =?utf-8?B?WGpHR29VeFAzMVJwNStOcnc2dkMyYVI4TTE4eWUzdTU1L1pOUFFSNWtwR2ZV?=
 =?utf-8?B?N0F5SU1sMllVNDlVN3pXeFpUdkxLVThLS3lCQXMrRzNxM1NMVGx3Nk85Q3B0?=
 =?utf-8?B?ekZyM2RhWG5wK3hGMHVoR1Q4L2U3ZnFUeGFVWHh6K21nYUhmalh1cUQ2bU5B?=
 =?utf-8?B?VE94cm45ay9leFNLS1AvM1c0dUNsd1U3bmhPQVcwelF5ZFlnbXF5NjhhWjlN?=
 =?utf-8?B?cG94LzhxUHE0cFJ3RklNcS8wRlFhazZkUkloQU1KVHFrWTdzNEQ0SnhCNS9U?=
 =?utf-8?B?aDZmT1ZLdU5rZ2FlbkxISXBEOTZjaTZ4VGMwbjZkSWVTUUxSNFYvZUJ2MUR4?=
 =?utf-8?B?OWFFTThaQTNlU1dCcFVHUTVQdTRBbzdBcUFJT2ZCSW5vM3QvSzJDKzlHQjdr?=
 =?utf-8?B?ZUlvSW1qaUs0ekJKcmtyamt3d3JHNFV6QzRoRWd3Qk1VS3VPRVgyb3RZUGxM?=
 =?utf-8?B?RnhqcjNMYUMyeHdPT2NjZTBReDdXWVNUWDRabDdwV0dKQ0tLRkR0dzhlMEdt?=
 =?utf-8?B?ODZSRnNlSFNGQmNHNHlxaEc1Ly9Lc3haRTE3ZUg5NlhPa2owRWhoV01zY2RJ?=
 =?utf-8?Q?0MQH/i4dDmOgpYd3y6oOgQOIb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0befe5bc-dc1a-4654-00d5-08dd6b82b295
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:52:04.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RkiIjF9sqOhU/ZDKbGfmTq7BN9MIqyPkibu5hMP97wibdyEUmZRQlYv/htHqAHaTvbZkmrPSVmminXGBuMkKxcwqNfTdni7uarpd3chVDrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7241
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
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
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMjQvMDMvMjAyNSAxMTowMSwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJp
bmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+
Pg0KPiA+PiBPbiAyNC8wMy8yMDI1IDA5OjMwLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTYgMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBv
cnQgZm9yDQo+ID4+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4+DQo+ID4+Pj4gT24gMTkvMDMvMjAy
NSAxMjoxMiwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MTYgMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQNCj4gPj4+Pj4+IGZvcg0K
PiA+Pj4+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDE3LzAzLzIwMjUg
MTA6MjEsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4+Pj4+Pj4gTmVpdGhlciB0aGlzLg0KPiA+Pj4+
Pj4+Pg0KPiA+Pj4+Pj4+PiBTbyBpdCBzZWVtcyB5b3UgZGVzY3JpYmUgYWxyZWFkeSBleGlzdGlu
ZyBhbmQgZG9jdW1lbnRlZCBJMkMsDQo+ID4+Pj4+Pj4+IGJ1dCBmb3Igc29tZSByZWFzb24geW91
IHdhbnQgc2Vjb25kIGNvbXBhdGlibGUuIFRoZSBwcm9ibGVtIGlzDQo+ID4+Pj4+Pj4+IHRoYXQg
eW91IGRvIG5vdCBwcm92aWRlIHJlYXNvbiBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIGJpbmRp
bmdzLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBUbyBzdW1tYXJpemU6IHdoYXQgeW91ciB1c2Vy
cyB3YW50IC0gZG9uJ3QgY2FyZS4gU3RhcnQgcHJvcGVybHkNCj4gPj4+Pj4+Pj4gZGVzY3JpYmlu
ZyBoYXJkd2FyZSBhbmQgeW91ciBTb0MuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBPSywgZm9yIGFz
dDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSB0d28gcmVnaXN0ZXIgbW9kZSBzZXR0aW5nLg0KPiA+
Pj4+Pj4+IE9uZSwgSSBjYWxsIGl0IGlzIG9sZCByZWdpc3RlciBzZXR0aW5nLCB0aGF0IGlzIHJp
Z2h0IG5vdw0KPiA+Pj4+Pj4+IGkyYy1hc3BlZWQuYyAuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0
MjYwMC1pMmMtYnVzIiwgQW5kIHRoZXJlDQo+ID4+Pj4+Pj4gaGF2ZSBhIGdsb2JhbCByZWdpc3Rl
cg0KPiA+Pj4+Pj4gdGhhdCBjYW4gc2V0IGkyYyBjb250cm9sbGVyIGFzIG5ldyBtb2RlIHJlZ2lz
dGVyIHNldC4NCj4gPj4+Pj4+PiBUaGF0IEkgYW0gZ29pbmcgdG8gZHJpdmUuIFRoYXQgSSBwb3N0
IGlzIGFsbCByZWdpc3RlciBpbiBuZXcgYW4NCj4gPj4+Pj4+PiBvbGQgcmVnaXN0ZXINCj4gPj4+
PiBsaXN0Lg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gRm9yIGV4YW1wbGUsDQo+ID4+Pj4+Pj4gR2xv
YmFsIHJlZ2lzdGVyIFsyXSA9IDAgPT4gaTJjIHByZXNlbnQgYXMgb2xkIHJlZ2lzdGVyIHNldA0K
PiA+Pj4+Pj4+IEdsb2JhbCByZWdpc3RlciBbMl0gPSAxID0+IGkyYyBwcmVzZW50IGFzIG5ldyBy
ZWdpc3RlciBzZXQNCj4gPj4+Pj4+IEl0J3MgdGhlIHNhbWUgZGV2aWNlIHRob3VnaCwgc28gdGhl
IHNhbWUgY29tcGF0aWJsZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gU29ycnksIGl0IGlzIGRpZmZlcmVu
dCBkZXNpZ24sIGFuZCBpdCBzaGFyZSB0aGUgc2FtZSByZWdpc3RlciBzcGFjZS4NCj4gPj4+Pj4g
U28gdGhhdCB0aGUgcmVhc29uIGFkZCBuZXcgY29tcGF0aWJsZSAiYXNwZWVkLGFzdDI2MDAtaTJj
djIiIGZvcg0KPiA+Pj4+PiB0aGlzDQo+ID4+Pj4gZHJpdmVyLg0KPiA+Pj4+PiBJdCBpcyBkaWZm
ZXJlbnQgcmVnaXN0ZXIgbGF5b3V0Lg0KPiA+Pj4+DQo+ID4+Pj4gV2hpY2ggZGV2aWNlIGlzIGRl
c2NyaWJlZCBieSB0aGUgZXhpc3RpbmcgImFzcGVlZCxhc3QyNjAwLWkyYy1idXMiDQo+ID4+Pj4g
Y29tcGF0aWJsZT8gQW5kIHdoaWNoIGRldmljZSBpcyBkZXNjcmliZWQgYnkgbmV3IGNvbXBhdGli
bGU/DQo+ID4+Pj4NCj4gPj4+IE9uIHRoZSBBU1QyNjAwIFNvQywgdGhlcmUgYXJlIHVwIHRvIDE2
IEkyQyBjb250cm9sbGVyIGluc3RhbmNlcw0KPiA+Pj4gKEkyQzEgfg0KPiA+PiBJMkMxNikuDQo+
ID4+DQo+ID4+IFNvIHlvdSBoYXZlIDE2IHNhbWUgZGV2aWNlcy4NCj4gPiBZZXMsIG9uZSBkcml2
ZXIgaW5zdGFuY2UgZm9yIDE2IGkyYyBkZXZpY2UuDQo+ID4+DQo+ID4+PiBFYWNoIG9mIHRoZXNl
IGNvbnRyb2xsZXJzIGlzIGhhcmR3aXJlZCBhdCB0aGUgU29DIGxldmVsIHRvIHVzZQ0KPiA+Pj4g
ZWl0aGVyIHRoZQ0KPiA+PiBsZWdhY3kgcmVnaXN0ZXIgbGF5b3V0IG9yIHRoZSBuZXcgdjIgcmVn
aXN0ZXIgbGF5b3V0Lg0KPiA+Pj4gVGhlIG1vZGUgaXMgc2VsZWN0ZWQgYnkgYSBiaXQgaW4gdGhl
IGdsb2JhbCByZWdpc3RlciwgdGhlc2UNCj4gPj4+IHJlcHJlc2VudCB0d28NCj4gPj4gZGlmZmVy
ZW50IGhhcmR3YXJlIGJsb2NrczoNCj4gPj4+ICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIiBkZXNj
cmliZXMgY29udHJvbGxlcnMgdXNpbmcgdGhlIGxlZ2FjeQ0KPiA+Pj4gcmVnaXN0ZXINCj4gPj4g
bGF5b3V0Lg0KPiA+Pj4gImFzcGVlZCxhc3QyNjAwLWkyY3YyIiBkZXNjcmliZXMgY29udHJvbGxl
cnMgdXNpbmcgdGhlIG5ldyByZWdpc3Rlcg0KPiA+Pj4gbGF5b3V0DQo+ID4+DQo+ID4+IFdoaWNo
IHBhcnQgb2YgInNhbWUgZGV2aWNlIiBpcyBub3QgY2xlYXI/IFlvdSBoYXZlIG9uZSBkZXZpY2Us
IG9uZQ0KPiBjb21wYXRpYmxlLg0KPiA+PiBXaGF0ZXZlciB5b3UgZG8gd2l0aCByZWdpc3RlciBs
YXlvdXQsIGlzIGFscmVhZHkgZGVmaW5lZCBieSB0aGF0DQo+ID4+IGNvbXBhdGlibGUuIEl0IGRv
ZXMgbm90IG1hdHRlciB0aGF0IHlvdSBmb3Jnb3QgdG8gaW1wbGVtZW50IGl0IGluIHRoZSBMaW51
eA0KPiBrZXJuZWwuDQo+ID4NCj4gPiBTb3JyeSwgSSBzdGlsbCBjYW4ndCBjYXRjaCB5b3VyIHBv
aW50Lg0KPiANCj4gDQo+IEkgcmVwZWF0ZWQgdHdpY2UgIllvdSBoYXZlIG9uZSBkZXZpY2UsIG9u
ZSBjb21wYXRpYmxlLiIsIHByb3ZpZGVkIGZldyBtb3JlDQo+IHNlbnRlbmNlcyBhbmQgaWYgdGhp
cyBpcyBzdGlsbCB1bmNsZWFyLCBJIGRvbid0IGtub3cgd2hhdCB0byBzYXkgbW9yZS4NCj4gDQo+
ID4gSSBzZXBhcmF0ZWQgdGhlIHN1cHBvcnQgaW50byB0d28gZHJpdmVyczoNCj4gDQo+IEkgZG9u
J3QgY2FyZSBhYm91dCB5b3VyIGRyaXZlcnMsIHdoeSBhcmUgeW91IGJyaW5naW5nIHRoZW0gaGVy
ZT8NCj4gDQo+ID4gaTJjLWFzcGVlZC5jIGZvciBsZWdhY3kgbGF5b3V0LCBjb21wYXRpYmxlICJh
c3BlZWQsYXN0MjYwMC1pMmMtYnVzIg0KPiA+IGkyYy1hc3QyNjAwLmMgZm9yIHRoZSBuZXcgcmVn
aXN0ZXIgc2V0LCBjb21wYXRpYmxlIGNvbXBhdGlibGUNCj4gImFzcGVlZCxhc3QyNjAwLWkyY3Yy
Ig0KPiA+IERvIHlvdSBtZWFuIEkgaGF2ZSBpbnRlZ3JhdGUgaW50byAxIGRyaXZlciBhdCBpMmMt
YXNwZWVkLmMgPyBjYW4ndCBiZQ0KPiBzZXBhcmF0ZSB0d28gZHJpdmVyPw0KPiANCj4gV2hhdCBp
cyB0aGlzIHBhdGNoIGFib3V0PyBCaW5kaW5ncy4gTm90IGRyaXZlcnMuIExvb2sgYXQgZW1haWwg
bW9udGggYWdvOg0KPiANCj4gIkFsbCB0aGlzIGRlc2NyaWJlcyBkcml2ZXIsIG5vdCBoYXJkd2Fy
ZS4iDQo+IA0KPiBXaHkgYXJlIHlvdSBrZWVwIGJyaW5naW5nIGhlcmUgZHJpdmVycyBzaW5jZSBh
IG1vbnRoPw0KTGV0IG1lIHRyeSB0byByZXBocmFzZSB0aGUgcmVhc29uaW5nIGZyb20gYSBoYXJk
d2FyZSBwb2ludCBvZiB2aWV3Og0KDQpPbiBBU1QyNjAwLCBlYWNoIEkyQyBjb250cm9sbGVyIGlu
c3RhbmNlIGlzIGZ1bmN0aW9uYWxseSB0aGUgc2FtZSB0eXBlIG9mIGRldmljZSAoSTJDIGNvbnRy
b2xsZXIpLCANCmJ1dCBpdCBjYW4gcHJlc2VudCB0d28gZGlmZmVyZW50IGFuZCBpbmNvbXBhdGli
bGUgcmVnaXN0ZXIgbGF5b3V0cywgDQpkZXBlbmRpbmcgb24gYSBoYXJkd2FyZS1jb250cm9sbGVk
IGNvbmZpZ3VyYXRpb24gKHZpYSBnbG9iYWwgcmVnaXN0ZXIgYml0cyB0aGF0IGFyZSBmaXhlZCBp
biBwcm9kdWN0aW9uIFNvQ3MpLg0KVGhlIGxheW91dHMgYXJlIG5vdCBiYWNrd2FyZC1jb21wYXRp
YmxlOg0KUmVnaXN0ZXJzIGFyZSBhdCBkaWZmZXJlbnQgb2Zmc2V0cy4gQml0IGRlZmluaXRpb25z
IGRpZmZlci4NClRoZSBwcm9ncmFtbWluZyBzZXF1ZW5jZSBpcyBub3QgdGhlIHNhbWUuDQpCZWNh
dXNlIG9mIHRoaXMgaW5jb21wYXRpYmlsaXR5IGF0IHRoZSByZWdpc3RlciBsZXZlbCwgc29mdHdh
cmUgY2Fubm90IGhhbmRsZSBib3RoIGxheW91dHMgaW4gYSBnZW5lcmljIHdheSB3aXRob3V0IGV4
cGxpY2l0IGtub3dsZWRnZSBvZiB3aGljaCB2ZXJzaW9uIGlzIHByZXNlbnQuDQpUaGF04oCZcyB3
aHkgSSBwcm9wb3NlZCBhIG5ldyBjb21wYXRpYmxlIHN0cmluZyDigJQgdG8gcmVwcmVzZW50IGEg
aGFyZHdhcmUtdmlzaWJsZSBkaWZmZXJlbmNlIGluIHJlZ2lzdGVyIGludGVyZmFjZSwgZXZlbiB0
aG91Z2ggdGhlIGxvZ2ljYWwgZnVuY3Rpb24gKEkyQyBjb250cm9sbGVyKSBpcyB0aGUgc2FtZS4N
Cg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
