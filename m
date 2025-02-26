Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B0A45A1F
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 10:29:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2q1T5Pljz3cYg
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 20:29:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::709" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740562169;
	cv=pass; b=ZULhJ1q4A2lVhWuialf2FwGRxpKnwh/zMXRv+HonKPRw6j1BYrmNnyxQRYjCsS/fOeJS+0SrDfmmRTTywYclJMMX9trb4jwxW4YwgSs+jVnnZ7ibJYZZXuoEYrguLkJRA6zb43z9rbyndpSUKuKny8R7LDy6VRxNw0HvHZLzqBGVxB1cNx+gIx8dZMDJ1lJy3CSI3+3F+IBaZ3WksXytBSvBjJzEkXnJ0bw/zVSiUDJuarRf2yyrC2+qmfJOf+kjFMDhyKyR15b4CVPGnB193fQxB4B+28TnjKbi87JGXwFjKS+m6t6dODfwNzEwENiLEBqeCStp1T6rRlqw2LoWvw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740562169; c=relaxed/relaxed;
	bh=Lujc5WYbWIuk1GwpUJ3InooYLdi89twCkT8LIGGQWy4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EHaRmzyf7M9GaOIru4pl8BOeEki2h8YgdxobSuqtuyhFwNUOCRpyTewQbA10MkKHwM/I2tJDZiIH7SOGm7pMURHrALtLADGBQDCYkPGszXw46x42QCFnH9uhVAni6t9AcrL+dxdPfStYYAlyeR8yuJrrRoCrU7xj+5poIvm4EGlHrAEljAPXSzz7wxGTLUwQAJc0PO4psowB3ldFHVYyebkhlDU0P1Q0MYMQQq8/Kxe1QNH3Wyfn2pTzh/+ilbSXkIJ4dvgQcLFrlVmPaHeP888IjGcvacjKF00h9mKqnxzLfE4AQX3PeBADTPdKE43V5/cU3HIKND4FX6SWOiEY+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:200f::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200f::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on20709.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::709])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2q0q0LvQz30W1;
	Wed, 26 Feb 2025 20:28:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pz36z8w3fZkFv+U0yiP5odUzt3iyJLaJgpPInq/nf/6Xp81EDhy5i9zUisebw0JKPnoAIKXdz/+DbgMqElGy5Yq22pOv9vkkjeg9Lxl4DD8CmCHzIPO2N4LNmIIcOSZnumN8NG+b+TbK/r4vuJrg2dFQTqshJBTQldNIRwvtK34PlfyCOBYx7UJ+xe6uJzJUhRVjYKAb67QlH57Qh8J5gDc41iO7l5dTyYrEUQwauWlnMZus9Li1UW0DshnkZREo73Hvt/f+JgP4xOdCrFY352q7VjbAD+DSoC6m7dA+BJI11HyB2/E9bh1EDLebKoUvJZVVN4v9uWWUhQiCw5VGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lujc5WYbWIuk1GwpUJ3InooYLdi89twCkT8LIGGQWy4=;
 b=fzHhwwJ0l0pT36VObVrXDL87BfGBMLdPBIsWFcNYSkhotMDPKXItqqYEorNS53qchl8tRfHJPByT4tpxZsA11wYDIirFpmF2G4uUPLj99heMxPeLnTRsZtUjl7QN0c9ZKytc/cFi8ExisOSGRqAwpDnOFTkyhK6xlx3XtVIh+3CgOX+vFGYPEm73eqVGW+ThIjqVc9MGvwye1+awf7lc89cYBOTACukDK/IjcyPTPKL2lAiHknLeDg+Y0rwicGg2JgOKZTXCjHHUAfVDl9dLXhehrgIDboS5I4sqWkRqaEN5aFi1PEcGnBmdIAjeofpunneHt9KUayRFwkZf8ZmzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lujc5WYbWIuk1GwpUJ3InooYLdi89twCkT8LIGGQWy4=;
 b=KTNwIEegNAl0i96QFx4n7uEzmeSx3hB/eehN1Luf+NMHDx9g+CRvxsqtYdElNUKidISm05ohnrEKdZY/yHJ/HytL2dSBBZX8LlGfw99KQBO/Zyo+lUaTYhfooXpe+fa7pWDP6iOp1986ppGqATERz+P6B+17UH3ku9T4HsYZssnCpzT6JIPPAQdz2PJ3MMXyMU4hg0zKDpq3z5eHN+FPXZgJso6c7KZ+Yl4RBiEHbcLAiCVRlPB5K9eNpyn9yLrPxu8tbRfIr108Sl+fbdey5zZELWMWNpACh687bJeW1sCLRovxPmGuCjJ2i7Vls0lfn57lChtzQv9KCyJDWcsh+g==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by JH0PR06MB6317.apcprd06.prod.outlook.com (2603:1096:990:19::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 09:28:21 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 09:28:20 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQA=
Date: Wed, 26 Feb 2025 09:28:20 +0000
Message-ID:  <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
In-Reply-To: <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|JH0PR06MB6317:EE_
x-ms-office365-filtering-correlation-id: 92b423ab-9cc9-4b73-7ffa-08dd5647e8c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?d1RaVHZJTVQyc0t5RmFwU2ZtallwdVliNmNxc1Q2czJSN1ZnU01ZblpEOWVy?=
 =?utf-8?B?bjB5RXU4b0F5SzRJM1BtVnVBVTF5Rkk2bVlZREhjdHdsQys2bElSN0Y2S1ZU?=
 =?utf-8?B?c1BjR0pydldUbTN4b0tPSnVaVVlQRkorZkZJNkhIb05JOWluY2ZIRHFYbk1m?=
 =?utf-8?B?alZGYXN5eUVQd3hSMWJkVHEvY1NZVmNrWi93UEpBL3lIWXRtaFRnVW03dlpE?=
 =?utf-8?B?RTZsQWxxdW05bjlFak43Mk1mSk5Tc3h0ZkYvZUdWSE1kWnE3cUtib0JJekZx?=
 =?utf-8?B?eTZvNUdENzhIRitFc0xEZ3ZBTWFnYjBnRERpOGhrZWRUbWRKcHB5TVhjQTMr?=
 =?utf-8?B?dEZ3VG1oclFWaGZLUXVsTHh0dWJHWXM5cmxJc3lFYis0MWYzaFJIbTdKR0xV?=
 =?utf-8?B?NW45eWNqektGSkpPaHJYa2ZDaDNpWFNoRUJnNklOcUxmZ1lxdHkvaytUMWJK?=
 =?utf-8?B?cCtrUXJEaEQvUFdLVnhJV095ZUVHcmJiZnFTeTlVR1R5NVk3dWJkdHdTYlM0?=
 =?utf-8?B?VEhPaklReXJTbDFZRFd4bU5mYVpaRGpkbGQ2Z0NibWRsNklWOHgzaU12cTZs?=
 =?utf-8?B?a3pGclZQdW1hMGtYS29oKzRFVTZKRzNFTmx2Q2dFbnVJVjRFV3pZRjZnRGVD?=
 =?utf-8?B?ejRZRStJNkRmbDl0MHQvRWtwTDF0QnlrcmxWVWprRy9hMXB2bEtlZTNzSkZ1?=
 =?utf-8?B?VDlHckNLbmhqNkpvS1N1VXFRaE1WU1pKZDV6Y3d0WkhCTHBqZmdCWkw1aWNl?=
 =?utf-8?B?bnZrcGY1bmtzelEwTnhGZ2tkYy9jVklrTE56SDBMd2doamJ1M1NtVjFRaFZw?=
 =?utf-8?B?Mm1tRm5aZjg5V0tCY0RYOFd0bk5ISG4rcnZVUzFxZDBYQmNsYXhtWUxhcldE?=
 =?utf-8?B?MkJJeWdhaEVRUjk0bEt4RTRoS0l3eXRkUlpIZmNpTVY5aGI2WFdyWnZYRTRs?=
 =?utf-8?B?QzYrcVNtdzlRZUxGbjhhUzhoZmNRcS9oSzRaMlh0czVaR2ZxbTcrTTJmS0NE?=
 =?utf-8?B?S0lWTjlUd1NQZnp3b1VMWG1HQ3JvRWFCMVJhVU00eHVLZGV5anZ1R3JneEV5?=
 =?utf-8?B?R2grODRYb3d6bUxZN1RBRnBpMEFNc2ZoYWtKdnB5b21Gd2lOVHJ1ZWpmOU4w?=
 =?utf-8?B?eEU1YzdFMmwySGp0WmhobEpmbElOeTRsbEZDWDRZQWpwVHNTQ0ZvMDZrRlZw?=
 =?utf-8?B?dkh3NTV2cnB3bjZFQzg0OHd4UFR1NFk1S3hDZmtxdFc1N3hPU3phdS9kamh5?=
 =?utf-8?B?WndHWElHaFl6dXNCR2dseWd0aHp3YzVraVFiOFpOVGpqd0RJOUlTN1NOczYx?=
 =?utf-8?B?eUxleDJFMzVEV0RCOW1md056eWRSNWJVbEg4cURnWlY4aWdvazdkR1Jmd2FI?=
 =?utf-8?B?UUZNb2tzQVkzL1dQTkJTeXF2Mzc0V2dIVUE2cUVDUnpLSWcvekJyS0JDQldF?=
 =?utf-8?B?bThwdzgwbGhNNTVoVC8rcFpBM2h0bVlWejJUZ3NtUFNiZ21iSG41Yk1BeHQw?=
 =?utf-8?B?UjcyV3hjZjBYRmtmRTdwT2dCU0pGZmZ6YUxEdm01WnJTTXJkdWdGTzBtZkIy?=
 =?utf-8?B?K051SldYWktPY0s2ZTFkVGd2T0V3VmNRSVJsL0lVSmdmMnErRjFWWnBaVnY2?=
 =?utf-8?B?eSsvL1RVNFFGajFPMVVObjlMQ2VjRENQRE5LWTZLU1hkeGN6T0tTeml6WFMy?=
 =?utf-8?B?MjdnQkJ1bGVSaGRlWVozcmpGbS9BNTVHcFdxYW9qM3JFWEhIRkd3UnNCdUhH?=
 =?utf-8?B?VEtiRjVKRzV6NHY5SXZKN0I0RlNQdTA3azJmVGpoc1RTMHFiaVdhUW5XQVVh?=
 =?utf-8?B?amdiLzhUZjNsY2RxbzJ5Tlh4QWdzY0l6T04zQWFzV01RWHNNM3NXMThRMmlZ?=
 =?utf-8?B?aS9ScHFocmJaNTZuQlR0dm5MQlBSYVBtYmRtY2NaK2lBM2JOWWlYSWw3SnVS?=
 =?utf-8?Q?ygl/o65OHPoSVzeVgMvUQAXxIPhkJDRR?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aUZEb0wvcEhFNU0vRUNWNXFQNm5QNlI3RmxseVhsOU8wMmxtTVByd0lJUGUv?=
 =?utf-8?B?Zi9nOGxhKzgzKy96ZzhheW5VMlo3b0JzMzJkam5WNjlMVWFUSjI4Tmpud3B3?=
 =?utf-8?B?VnAwWXd5OHN2cThOczdtdnZTVmpRUzJ5WDREVmw1TDViS1E1Sng5YmZNWms4?=
 =?utf-8?B?U0hYN3IrcW5aVmRmemtxL0g0cXhIbGJCdlo0WWVnRXN1N1dZTkdZbXdBdnAw?=
 =?utf-8?B?R3ppQ3lBUWcyNmNYLzBxNmxDSiswZmJYQzBKL3BTQXQvUmdIZTZ0emh1OTB6?=
 =?utf-8?B?SG5BazQva1B2NXVQQTNyajNiVUNFRnIrSXBuMVNySGJJYmZ5SEk1ZHZ2Q2Fk?=
 =?utf-8?B?SWFmRTR3OFpTNTZLV3p0V0pabVBhd25ZV1lWQnl1aVNHaS82Uys4bWtpRGN6?=
 =?utf-8?B?cmdGT3JpOHpwWEtzUHliSXd2VXUzSndpSDdUQm85UkF6SlRhYi9DbGwraDRj?=
 =?utf-8?B?R2dxdEFub2M5OXZCaDhtaEZlYXJ3WnNiY0RadlZUV0ltSTNXb3ZmMFpIMWxL?=
 =?utf-8?B?MytFOTBtZ2N4R1lWMWNOZ1A3bzhGaHhyVzFlNFk2WXVnYk9PbTJVSzg4bEps?=
 =?utf-8?B?RUl0WTRYQlVrbUtnZG14ZGp4SGY1YjRvYlMza1JOL0F1Tzlydnh5MG5zVjFS?=
 =?utf-8?B?UHZOWmlGZDkvV0ZXUkUrdkIweWpjQUpRZkovUnVlSW45U0kvVm45b2krYUNU?=
 =?utf-8?B?ZTVkS3NpckRaRTVNRXhWSi96Vyt3eThobmY0bEhpOEVFNTNTNXBrVUFJYVlI?=
 =?utf-8?B?YWNTVmtGNnJlT1VIM2xtUXdpV05TdVFvMmhkMmNjeVRkV3g5WVdBbHRwcXB0?=
 =?utf-8?B?d0gxNlNMd2lPSVkrbytPQkdmMk5RL1dVWHFxcTMzdGxrencwdmJSL2hKaW95?=
 =?utf-8?B?RGlwQW50aExvVXFGNjdUSDdqYVQ2a1d3WWJQRzByODlBM2J4Nm1TWEN5eWFq?=
 =?utf-8?B?UGY4MzkvRVJqM1hDemxjUE93d0Q4aThacXI0bGdwU3Z1OE0xMzgyM0RHbzdZ?=
 =?utf-8?B?TGVyZnArcm1vVkxaNjlQdVBrdlZzMmpEYmJtdnVhbElUMjY5OG1BWkYwaURH?=
 =?utf-8?B?a1F6ZnQra2xMTEkvdkxMYVN2cGhNMnUwSGtQZDc2TTcrL1JWWWtHRVphb0Yw?=
 =?utf-8?B?dUNSOUkxSFZtWHFKazJIWDA2Wm44L1IrQWJ0L1lrSWVobDNnenJ1czVObkVL?=
 =?utf-8?B?L3hzNGFtVW1jQW9CM0R0UWFrYjVoTE1oRS91SUljWkRBWHlIRG9WejFWMGpM?=
 =?utf-8?B?SzQ1MXNMbDl4aGV4NUx3NHhKYzdkMFZPcWRSVGMyMERTTnkxbUZhRHhBTWZU?=
 =?utf-8?B?UVFyQ0tPQW1oNGJDSEpUYXZwd25Ed3AzcDZkUmlXOTJEOEdjOHlzR0dyRHhB?=
 =?utf-8?B?OWp3U3AxSGhQRDIwQUZsVmQvWCsrWk9BSUgzd090WmNGUWZhbWtvS2Rsc3hK?=
 =?utf-8?B?RlB5NW5qcTFTMm1WdGVNS2xIek13ZTdneVhXeDRDOXhEQ2FrTlB0ZUNpUTlh?=
 =?utf-8?B?NVVXelZ6aXRuWFpDSVNhS256RzFHTHp3OEQzUUh5UVdCTUM1cFRzWDF0SlNl?=
 =?utf-8?B?dE9QU1RqWWtFTXZFYVdHeEdMQnZyczFCejVxdm41S1ZkRzRqQTB6bmdsTHlE?=
 =?utf-8?B?Uy9lcFZubjdxWEZ1VmdlTUFnbkRTTmV4bkovSU1WQzU1QmdvMVhmZVBJdlU4?=
 =?utf-8?B?cnMvYUFWaTIrQjlFRWR3cDUwZjVSWnlkNEZUU3BDSGp6WHdXNVFEUHNlMXVZ?=
 =?utf-8?B?aVlVaTNyamtMcDk1MGtHY1p0RWE4MXJZVkRla0ptbm5FT3M1OFptYjhsYUNv?=
 =?utf-8?B?Wm5aUWZRdkQ3aTB3NUsvUm42VkpuenNrVXlHUXZLT0RDZE1NSVJiTXZiSUg4?=
 =?utf-8?B?TGlIcHQ0eGtWOVhKT2JRVmxDUFQzOWxpYW9vYjBJQ2x1Ry8xejhNZEVoaUlD?=
 =?utf-8?B?TysySlp1R3JPcG0xQWNRcVk3WS9sVDBJOEtEeDAzTHpZcjBxV0xrVUtxVWcv?=
 =?utf-8?B?RElHNWZtUjMwMXR3WFRXZm9Xa015S3VUUmUxQUVjdTh1UmhlUk1LTWM0YUZE?=
 =?utf-8?B?UnU2aFNWK0dKeWcvMzlpNmkvOE5PSnlpYTRLak1XaEwvNFNhaUdKTzJTQVU0?=
 =?utf-8?Q?w763QA4lDW2FuuBcBmDZYI+Lm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b423ab-9cc9-4b73-7ffa-08dd5647e8c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 09:28:20.4524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1v8WhcqiAhF00XO7AX3FV2TTi1FRa+TazPGtniHWaUbj9E3bxptlabMkml+RH5pfPxpXh/gi+Q2jPsV5wZRPC5YmX6iG8/KOq8kPXaOQLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6317
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gTW9uLCBGZWIgMjQsIDIwMjUg
YXQgMDE6NTk6MzRQTSArMDgwMCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+IEFkZCBhc3QyNjAwLWky
Y3YyIGNvbXBhdGlibGUgYW5kIGFzcGVlZCxnbG9iYWwtcmVncywgYXNwZWVkLGVuYWJsZS1kbWEN
Cj4gPiBhbmQgZGVzY3JpcHRpb24gZm9yIGFzdDI2MDAtaTJjdjIuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbCAgIHwgNTggKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvYXNwZWVkLGkyYy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+IGluZGV4IDViOWJkMmZlZGEzYi4uMzU2MDMzZDE4
ZjkwIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvYXNwZWVkLGkyYy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwNCj4gPiBAQCAtNDQsMTIgKzQ0LDYwIEBAIHByb3Bl
cnRpZXM6DQo+ID4gICAgICBkZXNjcmlwdGlvbjogZnJlcXVlbmN5IG9mIHRoZSBidXMgY2xvY2sg
aW4gSHogZGVmYXVsdHMgdG8gMTAwIGtIeiB3aGVuDQo+IG5vdA0KPiA+ICAgICAgICBzcGVjaWZp
ZWQNCj4gPg0KPiA+ICsgIG11bHRpLW1hc3RlcjoNCj4gPiArICAgIHR5cGU6IGJvb2xlYW4NCj4g
PiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBzdGF0ZXMgdGhhdCB0aGVyZSBpcyBhbm90
aGVyIG1hc3RlciBhY3RpdmUgb24gdGhpcyBidXMNCj4gDQo+IEV4Y2VwdCB0aGF0IHRoaXMgd2Fz
bid0IGV2ZXIgdGVzdGVkLi4uDQo+IA0KPiBEb24ndCBkdXBsaWNhdGUgcHJvcGVydGllcy4gaTJj
LWNvbnRyb2xsZXIgc2NoZW1hIGhhcyBpdCBhbHJlYWR5Lg0KDQpJIHdpbGwgcmVtb3ZlIGl0IHRv
IGF2b2lkIGR1cGxpY2F0aW9uLg0KPiANCj4gPiArDQo+ID4gKyAgYXNwZWVkLGVuYWJsZS1kbWE6
DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsg
ICAgICBJMkMgYnVzIGVuYWJsZSBkbWEgbW9kZSB0cmFuc2Zlci4NCj4gPiArDQo+ID4gKyAgICAg
IEFTUEVFRCBhc3QyNjAwIHBsYXRmb3JtIGVxdWlwcGVkIHdpdGggMTYgSTJDIGNvbnRyb2xsZXJz
IHRoYXQNCj4gc2hhcmUgYQ0KPiA+ICsgICAgICBzaW5nbGUgRE1BIGVuZ2luZS4gRFRTIGZpbGVz
IGNhbiBzcGVjaWZ5IHRoZSBkYXRhIHRyYW5zZmVyIG1vZGUNCj4gdG8vZnJvbQ0KPiA+ICsgICAg
ICB0aGUgZGV2aWNlLCBlaXRoZXIgRE1BIG9yIHByb2dyYW1tZWQgSS9PLiBIb3dldmVyLCBoYXJk
d2FyZQ0KPiA+ICsgbGltaXRhdGlvbnMNCj4gDQo+IHNvIHdoYXQgaXMgYnl0ZSBtb2RlPw0KSSBl
eHBsYWluIGluIGNvdmVyLCBJIHdpbGwgYWRkIGhlcmUgYWxzby4gDQphc3BlZWQsZW5hYmxlLWJ5
dGU6DQpGb3JjZSBpMmMgY29udHJvbGxlciB1c2UgYnl0ZSBtb2RlIHRyYW5zZmVyLiB0aGUgYnl0
ZSBtb2RlIHRyYW5zZmVyDQp3aWxsIHNlbmQgaTJjIGRhdGEgZWFjaCBieXRlIGJ5IGJ5dGUsIGlu
bGN1ZGUgYWRkcmVzcyByZWFkL3dyaXRlLg0KDQo+IA0KPiA+ICsgICAgICBtYXkgcmVxdWlyZSBh
IERUUyB0byBtYW51YWxseSBhbGxvY2F0ZSB3aGljaCBjb250cm9sbGVyIGNhbiB1c2UNCj4gRE1B
IG1vZGUuDQo+ID4gKyAgICAgIFRoZSAiYXNwZWVkLGVuYWJsZS1kbWEiIHByb3BlcnR5IGFsbG93
cyBjb250cm9sIG9mIHRoaXMuDQo+ID4gKw0KPiA+ICsgICAgICBJbiBjYXNlcyB3aGVyZSBvbmUg
dGhlIGhhcmR3YXJlIGRlc2lnbiByZXN1bHRzIGluIGEgc3BlY2lmaWMNCj4gPiArICAgICAgY29u
dHJvbGxlciBoYW5kbGluZyBhIGxhcmdlciBhbW91bnQgb2YgZGF0YSwgYSBEVFMgd291bGQgbGlr
ZWx5DQo+ID4gKyAgICAgIGVuYWJsZSBETUEgbW9kZSBmb3IgdGhhdCBvbmUgY29udHJvbGxlci4N
Cj4gPiArDQo+ID4gKyAgYXNwZWVkLGVuYWJsZS1ieXRlOg0KPiA+ICsgICAgdHlwZTogYm9vbGVh
bg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgSTJDIGJ1cyBlbmFibGUgYnl0
ZSBtb2RlIHRyYW5zZmVyLg0KPiANCj4gTm8sIGVpdGhlciB0aGlzIGlzIGV4cHJlc3NlZCBhcyBs
YWNrIG9mIGRtYSBtb2RlIHByb3BlcnR5IG9yIGlmIHlvdSBoYXZlIHRocmVlDQo+IG1vZGVzLCB0
aGVuIHJhdGhlciBzb21lIGVudW0gKGFzcGVlZCx0cmFuc2Zlci1tb2RlID8pDQoNClRoYW5rcyBz
dWdnZXN0aW9uLCBJIHdpbGwgdXNpbmcgYW4gZW51bSBwcm9wZXJ0eSBsaWtlIGFzcGVlZCx0cmFu
c2Zlci1tb2RlIGluc3RlYWQuDQo+IA0KPiANCj4gDQo+ID4gKw0KPiA+ICsgIGFzcGVlZCxnbG9i
YWwtcmVnczoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBvZiBpMmMgZ2xvYmFs
IHJlZ2lzdGVyIG5vZGUuDQo+IA0KPiBGb3Igd2hhdD8gU2FtZSBxdWVzdGlvbiBhcyB1c3VhbDog
ZG8gbm90IHJlcGVhdCBwcm9wZXJ0eSBuYW1lLCBidXQgc2F5IHdoYXQNCj4gaXMgdGhpcyB1c2Vk
IGZvciBhbmQgd2hhdCBleGFjdGx5IGl0IHBvaW50cyB0by4NCj4gDQo+IHMvaTJjL0kyQy8gYnV0
IHRoZW4gd2hhdCBpcyAiSTJDIGdsb2JhbCByZWdpc3RlciBub2RlIj8gVGhpcyBpcyBob3cgeW91
IGNhbGwgeW91cg0KPiBkZXZpY2UgaW4gZGF0YXNoZWV0Pw0KPiANCkkgZG8gZGVzY3JpcHQgaW4g
Y292ZXIsIHNob3VsZCBhZGQgaW50byB0aGUgeWFtbCBmaWxlID8NCg0KYXNwZWVkLGdsb2JhbC1y
ZWdzOiANClRoaXMgZ2xvYmFsIHJlZ2lzdGVyIGlzIG5lZWRlZCwgZ2xvYmFsIHJlZ2lzdGVyIGlz
IHNldHRpbmcgZm9yDQpuZXcgY2xvY2sgZGl2aWRlIGNvbnRyb2wsIGFuZCBuZXcgcmVnaXN0ZXIg
c2V0IGNvbnRyb2wuDQoNCj4gDQo+ID4gKw0KPiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIHJlZw0K
PiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0gY2xvY2tzDQo+ID4gICAgLSByZXNldHMNCj4g
Pg0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IC9zY2hlbWFzL2kyYy9pMmMtY29udHJvbGxl
ci55YW1sIw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAg
ICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAg
ICBjb25zdDogYXNwZWVkLGFzdDI2MDAtaTJjdjINCj4gDQo+IE5BSywgdW5kb2N1bWVudGVkIGNv
bXBhdGlibGUuDQoNClNvcnJ5LCBJIHNob3VsZCBhZGQgd2hhdCBraW5kIG9mIGRvY3VtZW50IGFi
b3V0IHRoaXMgY29tcGF0aWJsZT8NCg0KVGhlIGNvdmVyIGRlc2NyaXB0cyBpdCwgc2hvdWxkIEkg
YWRkIGludG8geWFtbD8NCg0KDQpUaGlzIHNlcmllcyBhZGQgQVNUMjYwMCBpMmN2MiBuZXcgcmVn
aXN0ZXIgc2V0IGRyaXZlci4gVGhlIGkyY3YyIGRyaXZlcg0KaXMgbmV3IHJlZ2lzdGVyIHNldCB0
aGF0IGhhdmUgbmV3IGNsb2NrIGRpdmlkZXIgb3B0aW9uIGZvciBtb3JlIGZsZXhpYWJsZQ0KZ2Vu
ZXJhdGlvbi4gQW5kIGFsc28gaGF2ZSBzZXBhcmF0ZSBpMmMgY29udHJvbGxlciBhbmQgdGFyZ2V0
IHJlZ2lzdGVyDQpzZXQgZm9yIGNvbnRyb2wsIHBhdGNoICMyIGlzIGkyYyBjb250cm9sbGVyIGRy
aXZlciBvbmx5LCBwYXRjaCAjMyBpcyBhZGQNCmkyYyB0YXJnZXQgbW9kZSBkcml2ZXIuDQoNClRo
ZSBsZWdhY3kgcmVnaXN0ZXIgbGF5b3V0IGlzIG1peCBjb250cm9sbGVyL3RhcmdldCByZWdpc3Rl
ciBjb250cm9sDQp0b2dldGhlci4gVGhlIGZvbGxvd2luZyBpcyBhZGQgbW9yZSBkZXRhaWwgZGVz
Y3JpcHRpb24gYWJvdXQgbmV3IHJlZ2lzdGVyDQpsYXlvdXQuIEFuZCBuZXcgZmVhdHVyZSBzZXQg
YWRkIGZvciByZWdpc3Rlci4NCj4gDQo+ID4gKw0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAg
cHJvcGVydGllczoNCj4gPiArICAgICAgICByZWc6DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczog
Mg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
