Return-Path: <openbmc+bounces-854-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84342C3EA16
	for <lists+openbmc@lfdr.de>; Fri, 07 Nov 2025 07:35:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2q7L3YzCz2xQ0;
	Fri,  7 Nov 2025 17:35:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762497326;
	cv=pass; b=KjG/NfmU62h6+ySimomVeaJTz8jN6K2JkCCVNTyufH6RArD6ByWPCjnOFZ5iJ6KI5Mab6RYlMMIqI/F+oW859oicOfeVkLEfGwKTU2qLkKBG+jnuaB7Lwu2pJVlF/AZ4PhKX8NfxeZB5xrMCIeiiNEhAhIhNsiH+i/0+8MIVwqFl02L2en9Wha5E2U/QetPNecju8LAVQky/P/YgxXFpnMNqYJ+e57DYpEHIUNaMvtPDob4qkVHnPmlYSfVtWp2CuxCIBWD2BcCbUwsvOyIj+oc7KI/H2pzqyxknCtr7G3YkNpT8pzLZWWQuyDQQ5oMpmFmtNY/vcPHdE+hqFf8xHg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762497326; c=relaxed/relaxed;
	bh=iig0t5BjZwVRLYoXmDmr3Ipb4QB4CODQU/ZAqvxJwOw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bitF5UjO8wmwDrsoUj3ADakp4MonR3xk/PY5888rr6WBm3kdh+2M0rZ8TFDkPYiTRMLCeUKlgaxZi3wh0KanKCX/tQnm+XQi5Uw/kK99ccnPnr+vRM0ZKMNwk9IaRTWKRsItRx4Y641hTvtMgr53hJjJDVgKwRbAjCIW2gsveWh5tNC6eFCWowYUItUPUqtGj39q/nUzqwyrnBpAImvsDi350bxig5KZxpiFEWmDh/vomFZmzGLudU+3KVbC/0cKWPEfhvs+ZmWtuPf9SqPxOpC5lZehDHPsHhqCtlnQUvfNW0AdZxyShpNyu6k+t1g7EdQrhhPDHHnIZuT3evSHtQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RV3PZu1v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RV3PZu1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2q7K5k1sz2xPx;
	Fri,  7 Nov 2025 17:35:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKg94gfb6ZRdbZZUn1DmiIJ/8898shr1xDi7sfQKnf0RuRQ+ix+SrLQT57AYqQypZHJIBX5PWPUX1sbnBXM3UgJ+jJC10pOluQQ8AxMarxYuHWLGSJCAK043CWmwzWKdZ0lB3M3oQ9ba8in9EGNpUKWLVhZlXUy5nJU9vOlhTCP8+ii0i3jC4VVVvU3kpXt0H4zk2BPV4kRU9Mr5XLvZX+0z3oqEqEiHAdn4GMeXFbjn7qzucZ6FNdyQPg8v+bVbm/cKv3ATdOCM2O7XIwcay0EQ0wtpNbfHVTif/n6syPYovHJ0RWbKJmZNSdbmdnbK1Tjx+zkYoL5+hC9nkrmtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iig0t5BjZwVRLYoXmDmr3Ipb4QB4CODQU/ZAqvxJwOw=;
 b=MNK8+Eh6WUvDPjClV5IsSl60A54dpGfVFf3Rmb+sGH8bCC3fdgji1womGIWdBnO+Uoewqm2jnqMGy6RO+gQBAuTQjONiEPLi5UGePtxm3LmSvZQxxPt8hKVmXLxe+SlNUTrJt6+0KT/C4qj3YeD4/5RQM+diSlJ3KVDtuMpJ9sPKzOj3ARSPOjTlg0byvDJfco+vSunBE74yvHFJgjOqUHNwhLC+NxlxoIcvpfhZw2qW+yrKt8mb2gUbvySfVC3QKAF3/WVbIrFxm8XbbVhyYl8FUGr4N9pK3EA5uo6mGt0mLFKGVv5q9kAnPt4kmVHjqdYhCS7M2eHgdE6+0DmNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iig0t5BjZwVRLYoXmDmr3Ipb4QB4CODQU/ZAqvxJwOw=;
 b=RV3PZu1vIc2BYyr0mDEfgRh3AZTueviqnEYyYVHt92reOXYzDa3pJkigZQWLsOpzLzkwEWN98rS66TCXR+vhldnUqE2ODgeTPun8FjbVId4VOG/jKUZex0Ge3uuS4ZfeEOnJCo5YpgizrJE7Vrawif64xPywpnu+tPClBHf6f7PwuCxwkPyhL8gKdkxU9o3HXYuOuaqa84NA8XHUBrJ6mo2dfJ84Qmbjme2DlbnREdYFPxZvIXp0fxpu9jg2vnoTNtsz8S9vA7PClkpBpBQ00TJ9QhSBAz1/GYyMezz93bkviGNoudxPPPjYcyGTDwd1qNf+9YV3Ky8FnEdTyRqKoQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEYPR06MB5860.apcprd06.prod.outlook.com (2603:1096:101:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 06:35:01 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9275.013; Fri, 7 Nov 2025
 06:35:01 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Thread-Topic: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Thread-Index:
 AQHcRwi3xNYEORZZrU+2vI7qaB6dc7TWXdeAgAJ+8DCAACECAIAA8atQgAnHsICAAxs48A==
Date: Fri, 7 Nov 2025 06:35:01 +0000
Message-ID:
 <TY2PPF5CB9A1BE6AA78DB1519305B565746F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
 <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <36e2b87f-5567-4bd6-bd1b-789623441461@kernel.org>
 <TY2PPF5CB9A1BE62BD449193B23A22DF941F2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7e3c1b0b-2880-4abc-b80f-30ffc16d6158@kernel.org>
In-Reply-To: <7e3c1b0b-2880-4abc-b80f-30ffc16d6158@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEYPR06MB5860:EE_
x-ms-office365-filtering-correlation-id: 74a8de6a-96cf-4b8e-0636-08de1dc7c79b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXViMDFHQ0YzYTdCZ0xxR1lzWHQwQVpqVDlyWUJSK3VzZnhTaWhkMS9YK2Yv?=
 =?utf-8?B?NWRaaS92RWJPSjk4eWZXR1BmazJFS1d3V3A0QW5GVWdBbDFlKzRnTXJrWi9D?=
 =?utf-8?B?T3grMEFlSnJ1aGduUWEwMmNQeUVVMG9LS2JxcEJkUmlJcFhDTEYzNGJ6MCtE?=
 =?utf-8?B?U2hrRWU2d3ViZEtOTk9wWnJWaTNzY3loSUdJQWtmS1VydzRWaWgzTFlDWEwv?=
 =?utf-8?B?MGUxekxqeFdrSU1tN2VjVHpOZjZRckZVZTRjNkN2YWtCeWxBeGY2TWJmVHA1?=
 =?utf-8?B?SGJlamtkNGIrNkQwOHplUHdtaWNYdXl5SFh0Y2FpV3J5eC9OS25BTWhHVzlQ?=
 =?utf-8?B?SGJiWkVsYmNjdzRKbDJid2F3dmttQll1cjFKbzBEQVl6bi9mZFJaNzhoUmg0?=
 =?utf-8?B?WDhOZ0tkWXAveTRwNTJZa0g3U2luVFZlajhFZGYwYU90a2QvUGswSVN4SHZY?=
 =?utf-8?B?RHpNOGduRHZHbU5pbVBBeWYyZEJpZEFLSWlUU0FYTlQ5QVpVdHAzUHVNSkYz?=
 =?utf-8?B?S2tRL2xDWkdEdHRCbVM1ejN1RG1zN1A4TzFBdmxyT20zOVlMMk1ZR3RoNDFh?=
 =?utf-8?B?VnhqZExvbFNYR0w3ZkNlcURpL3hHWHdqNEpmcHRNQmZ1Ly9OeUZsNUNBUEJU?=
 =?utf-8?B?WUlVMk9WcS9YcE5jNHRqOHRIU092c2pTM1RLdExqUUxwSWxnaEEyRFJPZnBh?=
 =?utf-8?B?VUZRNlh2RnBOYWMyM20zRWpwc2lyN0JHOE5VWFV1Ym0zaGlCZTlmTGJQckZX?=
 =?utf-8?B?ZnZsTS9JdEhGM0hmaGFlL2kxV0NMNnBhM1hzOVlpd2VNeGZ3b2NBTXRJYTZT?=
 =?utf-8?B?RTA4bnZDazM5OEtPZEV3cDJvYWMrVldOOG9lek1iTHF6N3JiQnE1bHBEcFBD?=
 =?utf-8?B?emRaOTRuNFIrRXFBQklFdVhUVEQ3bnRHN1Y2dUNJaG55N1RvUkZWeGJZUEwy?=
 =?utf-8?B?TldrZlluRjhCcmVlZ2hXSDJWWnZ6UFRsL015OTlCSFp3MEVSU0Y1MG5BZjds?=
 =?utf-8?B?cE5JWnBsWCt1WGYyaFcyR2Y3U3R2K0xRdjBQbUE0eHVQaGo5UGY0NEpENnVJ?=
 =?utf-8?B?NFpBd3VNUE80djVybUoxOHJMRkQyMHdqWkRhRUt6dUJzdmkzQXlTV3dGRXJy?=
 =?utf-8?B?QWJaZUg3Q0ZJWXlKOGVZVCs4MGVmMUJjZnM5UXNxNzFlWjhyS2dqSFF2czZr?=
 =?utf-8?B?VnR4NDJRRzlFbE9rTVA0TkJxTlVRTm56U0NoZStTV0FIbTFvaXBHYlREeXJV?=
 =?utf-8?B?VzRvdFYzaFl4aXFKeURVRGRCdHU2S3JJNldvSW1ENWpSd2t4bmttQjVCenJk?=
 =?utf-8?B?U2hLSi94Y1B3Mm5Hc0p0cGI2QzRmMVg2eHQ5alV3Z0FLVEFTem4zVXpCYVpv?=
 =?utf-8?B?bDgwaG5YNHBCYmVrNE84aDJIRkhKTjg2eHVSa3BkRHZXb3JIWWJwU1NhNkJo?=
 =?utf-8?B?T0NqQXdrQjRpTTNCaVljSzNZb0Y5MmN1UDVyWFVFMXp2Z2JGc1JNNHF3NG02?=
 =?utf-8?B?cS9Kb0pwK0ROeG5uQ25zc2cyeHV2NkZlbkl3a1gvNjRDUEJQQW1DR3BSTGVz?=
 =?utf-8?B?S3dOUXU4RjRqYzdMYXd5QWZUOWlCeUc5UEw4VGlzamZJNk5vNzlsdmZLOElq?=
 =?utf-8?B?WllQWGREVDdQZ3FCUzJvZGMzWWJtTlBJOFo5cjNGZ1FKbVgyTEl5aFJMTlV2?=
 =?utf-8?B?dzBwY0RqUzZkd1N6ZE9qTFM3RlRENklXR2lVK0VLbEZsUkRlUVJETjNkS0ZV?=
 =?utf-8?B?Q2hGVEJZdnF6MXVJMSt4UlFUL1hxTmcyd2VVK2ExNjBxd2p6UUx2S295UGxk?=
 =?utf-8?B?TTdWQy9mbCs3MVpZenZsMmNZMjBXWndtR3dWNCtNTUVqM2hUVWRiTWlCNWFE?=
 =?utf-8?B?Rm42dSs3dDR2ZUVmQ3E1MTNrcmRTTWIrYWZ1MGIrOUp4amZ3L2hYOEpFRXJy?=
 =?utf-8?B?RzByNmc4Yis4VGI2Wi9kOGQ5K0RBNVBUR3Y1ei9qZTROVkpLTG4xS1BDSjJ2?=
 =?utf-8?B?bUZwUEovMitPaFdLR3Ywck91bEUrVWJHQUg1TTBWeVFBMG5HYThEcGhtamdn?=
 =?utf-8?B?S0w2RHFieUJFNUFuM2M4NXpwV0pkZlUyQVl3QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVRUT2JGazN4Tjc3WENxM2Y1RzlMTHdoekNWcnh1Nm1vbldXQ1daMHlhR0Uz?=
 =?utf-8?B?VldJa255M21leFNPMlVvUlM1NTdEZDllRTE4K3pGTk1ITks4NzJMdUJkYlNX?=
 =?utf-8?B?SnQybFByY2tRblNCamlNaUtGTGtqZHlibStiTWZVdXVlQllMcmdyeDExT0F1?=
 =?utf-8?B?ZHpqakpPS3pCRkVqalU4TzRHMnRZczV3SXNTN0pjakNlNE95NXdtQ3FxbXo0?=
 =?utf-8?B?dEtqb2N0VS9zWUsvLytrM0pHR0lsVDMzd0gxUWE2QXBXcFIrelNFZnJ2WnI3?=
 =?utf-8?B?eWttN3RzZEFhUXlCTDFWRVAwelNCeTZmRm85ckQvM09qekNaU0I0cWEvZVBi?=
 =?utf-8?B?NGgycGJWK2hQUktwTDJ3KzRHZWZyRmVHb1ltRWNlRnZ5cDV0bE1mRnhDb0R6?=
 =?utf-8?B?K3FHdGY1U05CMEY1NUtRYkxZZExCY2RuZW8vMXduWU9mbkNzeUdGWHhtbUht?=
 =?utf-8?B?SksyUVdWSit2NEJTNWdCU0dBYVBEdGJXN2lBdnM4S0hzeEJIYUZWenRqSWxC?=
 =?utf-8?B?SmZ2TTBpZ0JOWGZkVlRrN3BuamVyU0ZZSlN5S0Y0Nk02VmtDT1RGNGpnK1lP?=
 =?utf-8?B?bHB0NGdmdDBoT3MzM2JIVVFCY0pna1MvVUJ6TTdmK0o3WDJwMk9NT3RLMXBQ?=
 =?utf-8?B?OHNNZ0JYdzNhRWRpMmx4NXVqT0JzMXB1TGg0MUZxVDZiZUNQY3haa25NT0oy?=
 =?utf-8?B?YlJzUGl4SXVWV3ZLM0FQdEQ1Q2psQW1EYnFubjFMOG5PMi9KemFjamVVMk04?=
 =?utf-8?B?VGU2RHZYRyttRU9hNkZDUDZWdGsvMlFBck5sc09LK2VkTGF6THJyZ1AwaFpl?=
 =?utf-8?B?R1BQSzh3bFNZckN2Zk5KM1QxRWs5OVA4VWtzSUo3aFB0Tmd6VWxFSVRWc3I0?=
 =?utf-8?B?LzFNYzhneW1xNGszazRtakdJbUN0eEFweFU0SFRZWUNkMG0xa28zalo2NUtv?=
 =?utf-8?B?bFlmYzJtVnVqYVNLQlNZYlo2S2c1SFM1cUo3Y0E1ZFFDdERXbG4yWHIyR01l?=
 =?utf-8?B?RkllNDVEUmUrdlozOHlxM1lIUE9qYkhNZXJ3YTlJWVZvdTduZGNWTC9qNWhD?=
 =?utf-8?B?VDJpeUlUQ3NlenhvMytIZFdiOHdEbkc5ZjM5bDdGMnVZOFc5cDRscFIwbDdZ?=
 =?utf-8?B?c1hhNWpkOS9zY3pxdXJ0MHQzMUpyVzhIRVY1cFQ1SVBDSGFEaGQzYnovMnhx?=
 =?utf-8?B?NEVXNlpqelhVK3BVNVkydUVHM0Q2YmVZZlRvS1lVM0w1OFhQR0VjNHRtVHFa?=
 =?utf-8?B?QUc0YXJ4NVY4dXorV1RBWUhRSkRBa1R2VGNLR2srdmpuR2hYQXErdXRYMzg2?=
 =?utf-8?B?dzNqNGZZWU1wNE0vUk00d2JrTVk0cit1bVFDVXhvZWtmWXBPZkhrbFd2Z1hL?=
 =?utf-8?B?U2psb2o3dWxJTkVjRnFPQWdDcXdwR0dDSG5zMzRMQUN6NXNQMUFSRGdsZEhT?=
 =?utf-8?B?R2NobG1pdnZyNGYrdXA1ZEM2NmRWYVUrWnc1WXFCLzk3UWFTS2hhdW8zTXJv?=
 =?utf-8?B?Z0hTVHpONXdGQkFKNzdUVVFucEwzWjNZbkVMSjYvaCsxNVQvYTZ2MURKLzBP?=
 =?utf-8?B?Y3ltOXZzd2RqZ0RxREpOUFdUakhMNzBuNTk5M1UveDNUUjFDRHg5UUVNNTBt?=
 =?utf-8?B?Nm02aU1iQ0VMM3hSMEExRDJIenQrMG0vR0tkMTBKUEZWQmVZclloYWhzNGxp?=
 =?utf-8?B?bWRBU1I0dlc1N0lMcVlBN0l5aXZyMzBKbTc5YlZXTEhSRTFwT0ZtQ1h4Y2FL?=
 =?utf-8?B?UHZOeHg3MDAyR3hYc2J3dEhMd0JxVFhSUEdENWlYQVozZjMvU05UWDFpZUZV?=
 =?utf-8?B?YzlyY1RWUTRXUjFkZm9jWkxXeU5uNXQweUxuZWswckJmamRITWZBZFJqSE84?=
 =?utf-8?B?UFZXRHppZU9sZFk1SUxqVHdFTTc4UDh0WTdSMG93VkpBMmNyY2FUUElNbzRa?=
 =?utf-8?B?eXB0RzN1RGY2Z0dpdWdxMkVFM1FnSUZWSHo5RWlMczNqankwejExdnE5MFd3?=
 =?utf-8?B?SlFXdDFFcVQ3NkVFaFhoTHVqYi9Qa2x1cEh1bVdLNjI5TUxCL3dEd3lwVEhS?=
 =?utf-8?B?V2lLYUtFT2gzdXFIcWZQN2lJaXNIc0oyZ0lDeDFxalRVOTBDK3dudDU4Ujhk?=
 =?utf-8?Q?6neQblKKBhkWh9kLkvoygzfLz?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a8de6a-96cf-4b8e-0636-08de1dc7c79b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 06:35:01.7082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pply18v/0iNBMBBLLLVrCpOTD0LSB4aUI1G5zqcS1b4ZgN6pFywQuHkAU0ce+Kpc+gIYSLhtjQhn7FDa6L1vSjFDiPpazbbQLLeYWsmwV0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5860
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMSAyLzRdIGR0LWJpbmRpbmdzOiBpMmM6IGFzdDI2MDAt
aTJjLnlhbWw6IEFkZCBnbG9iYWwtcmVncw0KPiBhbmQgdHJhbnNmZXItbW9kZSBwcm9wZXJ0aWVz
DQo+IA0KPiBPbiAzMC8xMC8yMDI1IDAyOjQ4LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIxIDIvNF0gZHQtYmluZGluZ3M6IGkyYzogYXN0MjYwMC1pMmMueWFt
bDogQWRkDQo+ID4+IGdsb2JhbC1yZWdzIGFuZCB0cmFuc2Zlci1tb2RlIHByb3BlcnRpZXMNCj4g
Pj4NCj4gPj4gT24gMjkvMTAvMjAyNSAxMDoyNSwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIxIDIvNF0gZHQtYmluZGluZ3M6IGkyYzogYXN0MjYwMC1pMmMu
eWFtbDoNCj4gPj4+PiBBZGQgZ2xvYmFsLXJlZ3MgYW5kIHRyYW5zZmVyLW1vZGUgcHJvcGVydGll
cw0KPiA+Pj4+DQo+ID4+Pj4gT24gMjcvMTAvMjAyNSAwNzoxMiwgUnlhbiBDaGVuIHdyb3RlOg0K
PiA+Pj4+PiBUaGUgQVNUMjYwMCBJMkMgY29udHJvbGxlciBzdXBwb3J0cyB0aHJlZSB0cmFuc2Zl
ciBtb2RlczogYnl0ZSwNCj4gPj4+Pj4gYnVmZmVyLCBhbmQgRE1BLiBUbyBhbGxvdyBib2FyZCBk
ZXNpZ25lcnMgYW5kIGZpcm13YXJlIHRvDQo+ID4+Pj4+IGV4cGxpY2l0bHkgc2VsZWN0IHRoZSBw
cmVmZXJyZWQgdHJhbnNmZXIgbW9kZSBmb3IgZWFjaCBjb250cm9sbGVyDQo+IGluc3RhbmNlLg0K
PiA+Pj4+PiAiYXNwZWVkLHRyYW5zZmVyLW1vZGUiIHRvIGFsbG93IGRldmljZSB0cmVlIHRvIHNw
ZWNpZnkgdGhlIGRlc2lyZWQNCj4gPj4+Pj4gdHJhbnNmZXIgbWV0aG9kIHVzZWQgYnkgZWFjaCBJ
MkMgY29udHJvbGxlciBpbnN0YW5jZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQW5kIEFTVDI2MDAgaTJj
IGNvbnRyb2xsZXIgaGF2ZSB0d28gcmVnaXN0ZXIgbW9kZSwgb25lIGlzIGxlZ2FjeQ0KPiA+Pj4+
PiByZWdpc3RlciBsYXlvdXQgd2hpY2ggaXMgbWl4IGNvbnRyb2xsZXIvdGFyZ2V0IHJlZ2lzdGVy
IGNvbnRyb2wNCj4gPj4+Pj4gdG9nZXRoZXIsIGFub3RoZXIgaXMgbmV3IG1vZGUgd2hpY2ggaXMg
c2VwYXJhdGUgY29udHJvbGxlci90YXJnZXQNCj4gPj4+Pj4gcmVnaXN0ZXIgY29udHJvbC4NCj4g
Pj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgaW1wbGllcyB5b3VyICJyZWciIHByb3BlcnRpZXMg
aGF2ZSBub3cgY29tcGxldGVseSBkaWZmZXJlbnQNCj4gPj4+PiBtZWFuaW5nIGFuZCB0aGlzIHdv
dWxkIGJlIHF1aXRlIGFuIEFCSSBicmVhay4gV2UgZGlzY3Vzc2VkIHRoaXMNCj4gPj4+PiBwcm9i
YWJseQ0KPiA+PiAxNSByZXZpc2lvbnMgYWdvLg0KPiA+Pj4+IFdoZXJlIGRpZCB5b3UgZG9jdW1l
bnQgdGhlIHJlc29sdXRpb24gb2YgdGhhdCBkaXNjdXNzaW9uPw0KPiA+Pj4NCj4gPj4+IExldCBt
ZSBleHBsYWluIG1vcmUgYWJvdXQgInJlZyINCj4gPj4+IFRoZSAncmVnJyBwcm9wZXJ0eSBjb250
aW51ZXMgdG8gZGVzY3JpYmUgdGhlIHNhbWUgcmVnaXN0ZXIgcmVnaW9ucw0KPiA+Pj4gKGJ1cyBh
bmQgYnVmZmVyKSBhcyBpbiB0aGUgbGVnYWN5IGxheW91dC4gVGhlIHNlbGVjdGlvbiBiZXR3ZWVu
IHRoZQ0KPiA+Pj4gbGVnYWN5IGFuZCBuZXcgcmVnaXN0ZXIgbGF5b3V0IGlzIGNvbnRyb2xsZWQg
YnkgYSBiaXQgaW4gdGhlDQo+ID4+PiBTb0MtbGV2ZWwgZ2xvYmFsIHJlZ2lzdGVyIGJsb2NrLCBy
ZWZlcmVuY2VkIHRocm91Z2ggdGhlIG5ldw0KPiAnYXNwZWVkLGdsb2JhbC1yZWdzJw0KPiA+PiBw
cm9wZXJ0eS4NCj4gPj4+IFRoZXJlZm9yZSwgdGhlIG1lYW5pbmcgb2YgdGhlICdyZWcnIHByb3Bl
cnR5IGRvZXMgbm90IGNoYW5nZSBhbmQgbm8NCj4gPj4+IERUIEFCSSBicmVhayBvY2N1cnMuDQo+
ID4+Pg0KPiA+Pj4gU2hvdWxkIEkgYWRkIGl0IGluIGNvbW1pdCBtZXNzYWdlIGFib3V0ICJyZWci
ID8NCj4gPj4NCj4gPj4gVGhlbiB3aHkgZG9lcyB0aGUgYWRkcmVzcyBjaGFuZ2UgZnJvbSAweDQw
IHRvIDB4ODAuIElmIGl0IGlzIHRoZQ0KPiA+PiBzYW1lLCBpdCBjYW5ub3QgY2hhbmdlLg0KPiA+
Pg0KPiA+PiBZb3UgYXJlIGRlc2NyaWJpbmcgdGhlIElPIGFkZHJlc3Mgc3BhY2UsIHRvdGFsIGFk
ZHJlc3Mgc3BhY2UsIGFzDQo+ID4+IGRlZmluZWQgYnkgZGF0YXNoZWV0LiBOb3Qgd2hhdGV2ZXIg
aXMgaW4gdGhlIGRyaXZlci4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQu
DQo+ID4NCj4gPiBCdXQgdG8gY2xhcmlmeTogdGhlIGFkZHJlc3MgY2hhbmdlIGZyb20gMHg0MCB0
byAweDgwIGluIHRoZSBleGFtcGxlIGlzDQo+ID4gbm90IGFyYml0cmFyeS4gSXQgY29tZXMgZGly
ZWN0bHkgZnJvbSB0aGUgQVNUMjYwMCBTb0MgZGF0YXNoZWV0LCB3aGVyZQ0KPiA+IHRoZQ0KPiAN
Cj4gSG93IHNvPyBCaW5kaW5nIGhhcyBhbiBleGFtcGxlIGZvciBhc3QyNjAwIHdpdGggYWRkcmVz
cyAweDQwLiBZb3Ugbm93IGNsYWltDQo+IHRoZSBjaGFuZ2UgaXMgdG8gYWRqdXN0IHRvIGFzdDI2
MDAuIEJ1dCBpdCBpcyBBTFJFQURZIGFzdDI2MDAhDQo+IA0KVW5kZXJzdG9vZCwgSSB3aWxsIGtl
ZXAgdGhlIGFkZHJlc3MuDQoNCkFuZCBJIGNhbiBmaXggaW4gcHJldmlvdXMgc3BsaXQgYXN0MjYw
MC1pMmMueWFtbCBwYXRjaC4gYW0gSSByaWdodD8NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg==

