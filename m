Return-Path: <openbmc+bounces-884-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF54C569CE
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 10:35:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Zqm0fWzz2yvY;
	Thu, 13 Nov 2025 20:35:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763026500;
	cv=pass; b=fk+asry8nJhx3g2kSYFxc74NMyvxqMhuiQjIgkSWLIpwR+E2HKpZ8X166/Q24X/mtxK/5kWc4wDXzuagtHRdzi6AwsKYbSen3K9WAAOsHyNO+OHaA8WE7u/cKyjnlt+hyFxzuLvHwOXjN8GVqAJZ0FIH5mKaQxsvF/6moEVNyTMLW+8OvvGTYYRWVlVYwe0cnn2kTGzr0mTgejA56yO53eWf41zl6XVrz4tdiijHDHSmYdNxgljFg+VDRSHBuFb/GUXfOROJthdIVJRzmPD8Kx3Pu9zWATNKpgssAIQhvxVp2JpM08HMSJd/x3sxzgRrOCBdwTwC9WY5F8fjdiD5Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763026500; c=relaxed/relaxed;
	bh=QKuA8Tg1FHy/Y7XAF1d7IREgwrZh7LFSZMxSSObxBUk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DBTulR4nN/LkGAn6WbRMJCTGOqvK+/J0w41PU65mjmZCLSVSfv7rfOTAmE3e1VYGCicxm8lkph9zuNr2FVyT+7gNT2AxaciTnTFiSH2nVlLzwyu0MPBxOg4JBwKQzurTtG90+khdd9ZSYH3zNXO40+6dxHYOdsCl4wYBvc9C8ZCFjddYB2BJwcMgLfPOUa6zA9++KbKQHSWtxRXiqbyz4uFIxh9Pj3bh3z/l2pYpR07jLdCJ1kse9apz50yzoFxjspPpTclp3WbLkLbG+pRwP3NPx0rldyYJZ4i5k0k5XGfIdmW+IrlU6mE7WcryTv/DMuLiabUWxD4oPh5vWzdVEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=is6hvMUF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=is6hvMUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Zqk23jNz2yvX;
	Thu, 13 Nov 2025 20:34:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRxHzuwbyhQyknpjzpVXH1j1HRAE7FsSdSwfxDtZAWQkpFlkicsmERGrKW/bK5TanuTuT2dNINr1w8KjR2fpRLqVdIBESd/nl/VUzVkZ9bIylIIqNVfj/BO44lpKHNb32LZbNgi2f9W6Zn9yxxEsgb1XqxFIrozAMFkuj03itTo+nClQ52nUKUXyGHdu3RyxJG42Xal0wnKrJlGod4nLf7ZdQZDxIzQVlLdY0Mi2yVvk2jGehUnTf/UtcCOhFbNJ9GLYgGGTTyxy9LYKQL9lul/dGizvTUmr+P+wo+75afRE8311pIvnEgCPD0uWl/tERhjxQyWlC7QYtgWivS4xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKuA8Tg1FHy/Y7XAF1d7IREgwrZh7LFSZMxSSObxBUk=;
 b=W2nZyd3damgYm49EaSUqD9D0ITOEykQBKq+rbxl6/tFGjFLLDD65fsEk1QxK/CvO09JxBr19uyi39GWEN3Yxe3hh5vihwG3QZBIK9cOg5IeiTjeArQ9IC7TdUCPMKvVo8dnqJp3WUHHqS+QhB0NPGYTADWaS99/GdH1m+sMmPgmP+b83n00rV3to83G9BAA/8tgoG+NfpOPV5FoWx/zsRoiPM3TyJxOsCnwYxmbVSETHYbRkQVDpbQ/R+r89R3rPJ6luaiS2hJZnASogb5F4Fyc76LMXKfgAG2U243RKpdnumcCWbGHgx5pXD1T5PvjjhenZ3MtXd7SivdC25niWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKuA8Tg1FHy/Y7XAF1d7IREgwrZh7LFSZMxSSObxBUk=;
 b=is6hvMUFMVfqnFeZC2V1gILgnruTeTVqOH2iQAN4yAXLym36n1YJbeWAWOCjjf8eDGzxzNJc8GC7ffRoroLZ2b4dOB70Exie67pgk+yWbPVOE5v2mCnKQunhOjgRvZuKDMkPsFCrG8mmDsdbuksXpbO+P+n+9+78Q9TgQCKkgf1mawRDeWwbB9cnq+0FSSbzToTf6fqL9QOtdUtEmReA+TXb3dPqsus3vmc8IWYxv1Dz5xLWOFbii1L3k54LnxOb7betEGutiNFeU/+Ak4EXdxONW2MqCN0NJI8dmcV8i21qvv/8jnKLJtvlRbik0xv95NlC3T93pZ/NNLqBpOTEEA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEYPR06MB5350.apcprd06.prod.outlook.com (2603:1096:101:6a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 09:34:32 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 09:34:32 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Topic: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Index: AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ+A6AgAfdvQCAACofAIAT7eJAgAOJTnA=
Date: Thu, 13 Nov 2025 09:34:31 +0000
Message-ID:
 <TY2PPF5CB9A1BE67DBBC08424DD062549BDF2CDA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
In-Reply-To:
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEYPR06MB5350:EE_
x-ms-office365-filtering-correlation-id: 59b49ebc-8be4-4646-83cd-08de2297d98f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|921020|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?YThPQzhNdzdaa3A3SDV6eFpweHZhQmFiQnBMRkpISG9HZDBCbGp4NCtrZXIx?=
 =?utf-8?B?dG1xVkprWTJ0aEZ3MFRSZkwvZkhXcWxoT2R1Z2FXZ0hieEhuOEt6dU1hWjhU?=
 =?utf-8?B?NEI0dHgxdHc0M3hxRGR5L1prMEV4dU8xQUgxWGdka1BCOHZwd1VqY096dDY5?=
 =?utf-8?B?VHZ3SWZsczRTWVREaGNaNTdkVFBCRWw1cDBLUXJFZVYrU2gyb2hYTlF2QXE2?=
 =?utf-8?B?NDdMbFJ6QTkvUVBTUUp1cGo3Tnl2WnRoQ1dwUVFmOTR5M1FoRDlBOGtHQU8y?=
 =?utf-8?B?WXlzdTQxVmVETmhSaHVFT2ZOT0NZb2ZRU3kwRVMySGYxa09LL1U5czI2ZUZ6?=
 =?utf-8?B?RXNjNHBUa25QNVk0UzFTanJrNS9jSi9sOHNTbzllNG1jOW1wUXBDNG9FbFJi?=
 =?utf-8?B?Yzg3WjlwUDFBdTBDRXdRR3dYMnk1TEkzenVYMXBNT0VuUjNEb3hWVGNCZzlj?=
 =?utf-8?B?cEtZVmcwQXNjNXlsdUtLMUx3dlhmUnpNWVBmeXRoQ25KZXZlZmlZL3Zjb28r?=
 =?utf-8?B?ZlRkbTdNRU9TRS9ieUcrRW1pSitvL2E3U2psMlVWcXR0MVJRU3dsODhtLzVo?=
 =?utf-8?B?eEk2N2JVRitXTk83NjNzNkxtSk1xVXJLYlFLcWdpZmlROEExUXZ2SlFTMXNE?=
 =?utf-8?B?b2ZqcmU2WmtiT3BLM3hBWjdrbHVrd0Rld29xVzVBMjV1U2xtVUdsRENhc2ZJ?=
 =?utf-8?B?OUUxM0NVNTVFZEdCNDdGUEc2bjVZWlpJMUdGOUpDVnhDaEZGNEU5Um9sc1RV?=
 =?utf-8?B?dXhYV1hWK3hCMHhLOXVuRmdkRVNlTTJ2NVdzaVFRS0VBRjRIM082STZlcFVF?=
 =?utf-8?B?UjljdGFEWjBjQjdIc00rUmtuaWN4MERMT0taQ1d6MkZpaERQR0FYTHhocFdh?=
 =?utf-8?B?MEtYYnd3cjAzbldqemdwK2duNDY4QWFaK3VQbUd5OEcyRlprcTdOVmdNenRQ?=
 =?utf-8?B?QW1DMmg1S1ZlMnEwUVFBOS9PTCtGUUMva2gwTzZwOU5tVWc5U1NFN3JsL1Zn?=
 =?utf-8?B?eHFPZGZvWjd3ZXBFMXFxM0FGSERwdWFHc0dKN3A0TFNWVElnemMyUVVBOEJm?=
 =?utf-8?B?SFBiTlh2d3B5bGhUVnRkU2hBd0thMzQzQmZ1UFJQQ0c3L052dFNCWWZsN252?=
 =?utf-8?B?OGVQdnNRdjVJOXNBSjdETHhsOWdJY0YyVG16ZU9veTFBM1NPUWFNQ1VMeFg3?=
 =?utf-8?B?R05nbTE1QmxqVkpXQ0N4MDB3a1NlSWc5OVNKMFJlT21yd3F0TGFBRmpBWVpG?=
 =?utf-8?B?cnR6SmRTWEQyaHErZWVHdjZLRGVoZXQxZjcwcWd6YmFPZUduVUlPUjR3R2JH?=
 =?utf-8?B?UWV3ZXIxVjN1M2VnVXVPMkxmcjBhWEVGK3FsdHQvTUNqamw5NWprV0p4dE9p?=
 =?utf-8?B?US8rM1Mxd3NJbERUWVJkbVc0Q0gzd3dsNEIvWm16eTZScXI0VVI4a2dwMUw5?=
 =?utf-8?B?RXV1UmlrVjhuNk1SUGhaaDRyME1jdUJyOU1QeHcyYXFuVU9uRWhqVWNVeTFI?=
 =?utf-8?B?ZWJxcVovazQwRU9GcnNqWGNxVkw1S0JWMGM0S2xRS1FoNElNWVhFVjNESjVw?=
 =?utf-8?B?US9TRmdwdXJ0U3FaSHNHSUdUZ0RJT2NaMm5oWnJqYjByWWwzT044R0FxeDZF?=
 =?utf-8?B?VkdvdnByVEFFZFhSMTBDMHJUdW9HTkZmaTE4S0NWUW5IaUg5Ym9NaXJ5NEtl?=
 =?utf-8?B?aHozYkRQdEFhWXU5NmF1dEVZV0RyVVFlQkdSd1duaDh1VUV3RytrQmI4SGI1?=
 =?utf-8?B?WEE2a0Y0dS9WS0NZcm5odjZwcGVGQ2tzSDJoM3NYdXFIWWZCN20vR2FmS3BB?=
 =?utf-8?B?S0I0czJHYlFCM01qYjhNemx6dUloRXdXZFFRcS8vL29wS21Va3BVSWNuQy9V?=
 =?utf-8?B?VllNUVhLN21zMnQyWDdJL0Q4dUtjbm10R3Z1S0VxcG5BTWhRZHlpdnlHMGZ6?=
 =?utf-8?B?TnkzZ2lzWDdDYmZPSGxSaHpDU2ExanpwQkp2aEVlUzdXSXJabVphUXhQK0dw?=
 =?utf-8?B?RW1POTJ2N29BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(921020)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkZSbktTQ0ttRzVLaGNNMmxqY0FUelRNMHZvRVE5aDIxWGZQc2tZSVhhSUxZ?=
 =?utf-8?B?aDVWY2hGbWZld2lkQ2hGODlvWEhmclhmaVNZL29FYlpBWEtLeWlqNE44a3Ux?=
 =?utf-8?B?TDluZ3dLMWhTLzVyRjRFWVlOdG83aThOVmxIM1MzUmVFck9DTldvbVZyTW9I?=
 =?utf-8?B?eExSTThCVGVvSThtUHJJc1daQW9kVElKNHJnaFZxbENKL3czZ3dNa2I3cmY4?=
 =?utf-8?B?bmtCd0JEN3liMmsyZXNDZU1ZYXhhQTFEQWN6MWhyd3FVZ0RwMldPZGpSd0Rp?=
 =?utf-8?B?VkpXeUYvYTR1RW5JRzVESDIzckE4eDRDbVNuWVYyN3YvczR3aFZQZWJIRjRN?=
 =?utf-8?B?S3NveUFsSGhRVmEybDI4clJiWUV1WnZ0SmEvZXlHRnNMM0VmcWt5Z0pOeVJ2?=
 =?utf-8?B?VHAwVW16akE1R2Z6WXpaWWs0TzdvNFBpZGpUaVRjczY3V2dKMkgzenBJQTBs?=
 =?utf-8?B?WlQ3M2dYM0RXRUgveW5JM3RPbURBelNDTnpGZVo5bUZBc1BrRkxKRHJyTUVz?=
 =?utf-8?B?ZkZZaEoyY2lvVmRrakZsUjBDVnNLbDJKYnl0Y25PZC9Ha1BsSXh0bUZtOUpU?=
 =?utf-8?B?M3hsbDcvZFByMTk5a2xzbUUxS2lycjI5dkxucUN2L1NrZWQrNzVRUG5POEVL?=
 =?utf-8?B?Y0R0eXN5OEVuOG1FVnZzdHdwTVkwUC9uRDBLZU5WZGdwNFJEOEcwMG43OFQ4?=
 =?utf-8?B?a05QSnd1Tll4Ry9QU0dzQUNSdlQ5bE4rcnJSWGJNbXlEZDA1SnRVdFlwWXMz?=
 =?utf-8?B?WURHQjJyNk94cnhPSi85ZGlWL2hsZDI0RnI3ZVdkOXkyR2MvK3d6WWlCS1I1?=
 =?utf-8?B?eUpYdGowLzNjcytGNENlQWY3bWtpRDFMbXNNczM2VURsa3hKanBudlZHN255?=
 =?utf-8?B?Y3YyWXVqUTFVWVdia1lMT3VUL1BjNWJmUzJBaWZGSlBnS2NqYk9VSDNrSnpZ?=
 =?utf-8?B?MFoyVExPbnhXSi9MUm9lQjZNUW82WHNxLzFlb3dtVWt4SzVhdFhaSG02cVpZ?=
 =?utf-8?B?a2IxaEp1SXdGdXdWNDc4MTJSSERsT3F4SmI0YmRxaWJFNU9IZlFSd2R5b2RF?=
 =?utf-8?B?eC9wR0YwZ3dTdFpBdkM5SU5aazhHam9YSmV0amFQZU5rdEZnSnZFdDFxTkpB?=
 =?utf-8?B?cWVTQXQzRHhDU1hFTmlkbG50MzNYWGNkTVBHTjlla1Y3ZWxLVWNwTHZPMWdt?=
 =?utf-8?B?SHdwRUR1KzQ1OGJ0cDFxSkFsdmNibDMremtwQnZhb3lOS1ZpVTVrZ1NpeGd4?=
 =?utf-8?B?ckVqdWkzL21OakM3bmRiN1lFaEppQ05OZ0Z5ZUJpczFGcHpFd3U1aGNBc1A3?=
 =?utf-8?B?VE1hZ1kwV2Nna3BzVzI4VG9Zck93MnBlTFMvZTFJZ2NVN2ZHVEZsUUxCT3hk?=
 =?utf-8?B?UmtHREFWSStJUmI4WTdsUDQ0ZEJPR21Ma2VuaHZJZjJrSkFXdEJDRExTbWpD?=
 =?utf-8?B?NTlHcWl4emNNRVdYcHI1cFlaSmswMUhzYlc1RFhTbVVGQUZqd2FxMFJOQWRx?=
 =?utf-8?B?ZmU3YndwNmZtVzJpQnQxVll6R3FQT3k2SUdqL1RnK0FDU2JXcGNVanV0eTFx?=
 =?utf-8?B?U3BuejFUWDNUQStTcUNWUGUwWWhKUE1VUnFDR3RPZmJySjdMYkpnckxZWEFM?=
 =?utf-8?B?bStGam5OVHhiVVlhMjZjdjFDN3o1dnlKQkZxZ2NkaXRlWWhuV0plRjVoY3ZB?=
 =?utf-8?B?MFcyNjVqdUlKTEVjeWRaS1hzTTFlTXVTK1NXWHRnNFhFL01OeTN6OFZ5bS8z?=
 =?utf-8?B?MDJ4SFY4RG5SRzYrSjAycGJSZEVPQW45VmFFT3g3K2tsblNIYXJpcFZJdHcz?=
 =?utf-8?B?eTVKRktGY2tZTGZyOUdzK2UwZFVETW40SDdJV1pxWDRWd0tHUkF1QWFUM09h?=
 =?utf-8?B?R2JUVXA5eGVtK2s0QytseTRxdHNxYVRaYUs4NGZnRXpzN2xkemVTS3VCd3Nu?=
 =?utf-8?B?Vk81S2N5b2VyTWp0Y0QzQzdtYWRweVR0dUh4Mjh5SGd2bkhlb1ZkZ3JZcjBU?=
 =?utf-8?B?YzBwK1VQRXl6M3V3TnNTelBlNXJCWDMxVjVlTkZUUWFacy83WjRWN3ZON2pW?=
 =?utf-8?B?UXdRSmdRZDdqR24veWNMNnk2NGU3UHhyNHpieVpvR1ZodndRdVRSMkhROXpa?=
 =?utf-8?Q?+tmLWfgXiRCJmWkvD1y+oT/yy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b49ebc-8be4-4646-83cd-08de2297d98f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 09:34:31.8120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pr12uDFpXbH/yo3VK3xvSHirs2j2NejoeouTDgmsKEicNgNElYIEEGMYdEOom6AgAwEV59BsR061y58sUy3WdMHzM4SR6opSfdkRDlkPWuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5350
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MjAgMS80XSBkdC1iaW5kaW5nczogaTJjOiBTcGxpdCBBU1QyNjAwIGJpbmRpbmcNCj4g
PiBpbnRvIGEgbmV3IFlBTUwNCj4gPg0KPiA+IE9uIDI5LzEwLzIwMjUgMDk6MjksIFJ5YW4gQ2hl
biB3cm90ZToNCj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdz
OiBpMmM6IFNwbGl0IEFTVDI2MDANCj4gPiA+PiBiaW5kaW5nIGludG8gYSBuZXcgWUFNTA0KPiA+
ID4+DQo+ID4gPj4gT24gMjEvMTAvMjAyNSAwMzozNSwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+ID4+
PiBUaGUgQVNUMjYwMCBJMkMgY29udHJvbGxlciBpcyBhIG5ldyBoYXJkd2FyZSBkZXNpZ24gY29t
cGFyZWQgdG8NCj4gPiA+Pj4gdGhlIEkyQyBjb250cm9sbGVycyBpbiBwcmV2aW91cyBBU1BFRUQg
U29DcyAoZS5nLiwgQVNUMjQwMCwgQVNUMjUwMCkuDQo+ID4gPj4+DQo+ID4gPj4+IEl0IGludHJv
ZHVjZXMgbmV3IGZlYXR1cmVzIHN1Y2ggYXM6DQo+ID4gPj4+ICAtIEEgcmVkZXNpZ25lZCByZWdp
c3RlciBsYXlvdXQNCj4gPiA+Pj4gIC0gU2VwYXJhdGlvbiBiZXR3ZWVuIGNvbnRyb2xsZXIgYW5k
IHRhcmdldCBtb2RlIHJlZ2lzdGVycw0KPiA+ID4+PiAgLSBUcmFuc2ZlciBtb2RlIHNlbGVjdGlv
biAoYnl0ZSwgYnVmZmVyLCBETUEpDQo+ID4gPj4+ICAtIFN1cHBvcnQgZm9yIGEgc2hhcmVkIGds
b2JhbCByZWdpc3RlciBibG9jayBmb3IgY29uZmlndXJhdGlvbg0KPiA+ID4+Pg0KPiA+ID4+PiBE
dWUgdG8gdGhlc2UgZnVuZGFtZW50YWwgZGlmZmVyZW5jZXMsIG1haW50YWluaW5nIGEgc2VwYXJh
dGUNCj4gPiA+Pj4gZGV2aWNldHJlZSBiaW5kaW5nIGZpbGUgZm9yIEFTVDI2MDAgaGVscHMgdG8g
Y2xlYXJseSBkaXN0aW5ndWlzaA0KPiA+ID4+PiB0aGUgaGFyZHdhcmUgY2FwYWJpbGl0aWVzIGFu
ZCBjb25maWd1cmF0aW9uIG9wdGlvbnMgZnJvbSB0aGUgb2xkZXINCj4gPiA+Pj4gY29udHJvbGxl
cnMuDQo+ID4gPj4+DQo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVu
QGFzcGVlZHRlY2guY29tPg0KPiA+ID4+PiAtLS0NCj4gPiA+Pj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwgICB8ICAzICstDQo+ID4gPj4+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pMmMvYXN0MjYwMC1pMmMueWFtbCAgfCA2Ng0KPiA+ID4+PiArKysrKysr
KysrKysrKysrKysrDQo+ID4gPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+ID4+PiAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3QyNjAwLWkyYy55YW1sDQo+ID4gPj4+DQo+ID4g
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2Fz
cGVlZCxpMmMueWFtbA0KPiA+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4gPj4+IGluZGV4IDViOWJkMmZlZGEzYi4uZDRlNGY0
MTJmZWJhIDEwMDY0NA0KPiA+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+ID4+PiBAQCAtNCw3ICs0
LDcgQEANCj4gPiA+Pj4gICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTJjL2Fz
cGVlZCxpMmMueWFtbCMNCj4gPiA+Pj4gICRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ID4+Pg0KPiA+ID4+PiAtdGl0bGU6IEFTUEVFRCBJ
MkMgb24gdGhlIEFTVDI0WFgsIEFTVDI1WFgsIGFuZCBBU1QyNlhYIFNvQ3MNCj4gPiA+Pj4gK3Rp
dGxlOiBBU1BFRUQgSTJDIG9uIHRoZSBBU1QyNFhYLCBBU1QyNVhYIFNvQ3MNCj4gPiA+Pj4NCj4g
PiA+Pj4gIG1haW50YWluZXJzOg0KPiA+ID4+PiAgICAtIFJheW4gQ2hlbiA8cmF5bl9jaGVuQGFz
cGVlZHRlY2guY29tPiBAQCAtMTcsNyArMTcsNiBAQA0KPiA+ID4+PiBwcm9wZXJ0aWVzOg0KPiA+
ID4+PiAgICAgIGVudW06DQo+ID4gPj4+ICAgICAgICAtIGFzcGVlZCxhc3QyNDAwLWkyYy1idXMN
Cj4gPiA+Pj4gICAgICAgIC0gYXNwZWVkLGFzdDI1MDAtaTJjLWJ1cw0KPiA+ID4+PiAtICAgICAg
LSBhc3BlZWQsYXN0MjYwMC1pMmMtYnVzDQo+ID4gPj4+DQo+ID4gPj4+ICAgIHJlZzoNCj4gPiA+
Pj4gICAgICBtaW5JdGVtczogMQ0KPiA+ID4+PiBkaWZmIC0tZ2l0DQo+ID4gPj4+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3QyNjAwLWkyYy55YW1sDQo+ID4gPj4+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3QyNjAwLWkyYy55YW1s
DQo+ID4gPj4NCj4gPiA+PiBXaHkgY29tcGxldGVseSBicmVha2luZyBuYW1pbmc/IFBsZWFzZSBm
b2xsb3cgd3JpdGluZyBiaW5kaW5ncw0KPiBjYXJlZnVsbHkuDQo+ID4gPg0KPiA+ID4gV2lsbCB1
cGRhdGUNCj4gPiA+ICRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2kyYy9hc3Bl
ZWQsYXN0MjYwMC1pMmMueWFtbCMiDQo+ID4gPj4NCj4gPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiA+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi42ZGRjZWM1ZGVjZGMNCj4gPiA+Pj4gLS0t
IC9kZXYvbnVsbA0KPiA+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2FzdDI2MDAtaTJjLnlhbWwNCj4gPiA+Pj4gQEAgLTAsMCArMSw2NiBAQA0KPiA+ID4+
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpICVZQU1MDQo+ID4gPj4+ICsxLjINCj4gPiA+Pj4gKy0tLQ0KPiA+ID4+PiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvYXN0MjYwMC1pMmMueWFtbCMNCj4gPiA+Pj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0K
PiA+ID4+PiArDQo+ID4gPj4+ICt0aXRsZTogQVNQRUVEIEkyQyBvbiB0aGUgQVNUMjZYWCBTb0Nz
DQo+ID4gPj4+ICsNCj4gPiA+Pj4gK21haW50YWluZXJzOg0KPiA+ID4+PiArICAtIFJ5YW4gQ2hl
biA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+ID4+PiArDQo+ID4gPj4+ICthbGxPZjoN
Cj4gPiA+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9pMmMvaTJjLWNvbnRyb2xsZXIueWFtbCMNCj4g
PiA+Pj4gKw0KPiA+ID4+PiArcHJvcGVydGllczoNCj4gPiA+Pj4gKyAgY29tcGF0aWJsZToNCj4g
PiA+Pj4gKyAgICBlbnVtOg0KPiA+ID4+PiArICAgICAgLSBhc3BlZWQsYXN0MjYwMC1pMmMtYnVz
DQo+ID4gPj4+ICsNCj4gPiA+Pj4gKyAgcmVnOg0KPiA+ID4+PiArICAgIG1pbkl0ZW1zOiAxDQo+
ID4gPj4NCj4gPiA+PiBXaHk/DQo+ID4gPg0KPiA+ID4gV2lsbCB1cGRhdGUgYXMgZm9sbG93aW5n
Lg0KPiA+ID4NCj4gPiA+IHJlZzoNCj4gPiA+ICAgbWluSXRlbXM6IDENCj4gPiA+ICAgbWF4SXRl
bXM6IDINCj4gPg0KPiA+DQo+ID4gTm8uIFlvdSBjaGFuZ2VkIG5vdGhpbmcuIEluc3RlYWQgZXhw
bGFpbiB3aHkgdGhpcyBpcyBmbGV4aWJsZS4NCj4gPg0KPiA+IFNlZSB3cml0aW5nIGJpbmRpbmdz
Lg0KPiANCj4gU29ycnksIEkgc3RpbGwgbm90IHVuZGVyc3RhbmQgeW91ciBwb2ludC4gRG8geW91
IG1lYW4gbmVlZCB0byBleHBsYWluIHdoeSByZWcgaXMNCj4gZmxleGlibGUgMSAtPiAyPw0KPiBJ
ZiB5ZXMsIEkgd2lsbCB1cGRhdGUgdG8gZm9sbG93aW5nLg0KPiANCj4gcmVnOg0KPiAgIG1pbkl0
ZW1zOiAxDQo+ICAgbWF4SXRlbXM6IDINCj4gICBkZXNjcmlwdGlvbjoNCj4gICAgIFRoZSBmaXJz
dCByZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVyIHJlZ2lzdGVycy4NCj4gICAgIFRoZSBvcHRp
b25hbCBzZWNvbmQgcmVnaW9uIGNvdmVycyB0aGUgY29udHJvbGxlcidzIGJ1ZmZlciBzcGFjZS4N
Cg0KQWZ0ZXIgY2hlY2sgdGhlDQpodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dyaXRpbmctc2NoZW1hLmh0bWwjYW5ub3RhdGVkLWV4YW1wbGUtc2NoZW1hDQpJIHRo
aW5rIEkgc2hvdWxkIHVwZGF0ZSB3aXRoIGZvbGxvd2luZywgYW0gSSBjb3JyZWN0ID8NCg0KIHJl
ZzoNCiAgIGl0ZW1zOg0KICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgZmlyc3QgcmVnaW9uIGNvdmVy
cyB0aGUgY29udHJvbGxlciByZWdpc3RlcnMuDQoJIC0gZGVzY3JpcHRpb246IFRoZSBvcHRpb25h
bCBzZWNvbmQgcmVnaW9uIGNvdmVycyB0aGUgY29udHJvbGxlcidzIGJ1ZmZlciBzcGFjZS4NCg0K
V2hhdCB5b3UgcXVlc3Rpb24gYWJvdXQgDQoiIFBsZWFzZSBleHBsYWluIG1lIGhvdyBvbmUsIHNh
bWUgU29DIGhhcyBvcHRpb25hbCBJTyBhZGRyZXNzIHNwYWNlPyBJIGFza2VkIHRvIGV4cGxhaW4g
V0hZIHRoaXMgaXMgZmxleGlibGUiDQpUaGUgQVNUMjYwMCBpMmMgY29udHJvbGxlciBoYXZlIHRo
cmVlIGlvLGJ1ZmZlcixkbWEgbW9kZS4gDQpUaGUgQVNUMjYwMCBoYXZlIGJ1ZmZlciByZWdpc3Rl
ciBmb3IgYnVmZmVyIHRyYW5zZmVyLiBUaGF0IGlzIDJuZCByZWcgb2Zmc2V0LiANCklmIGR0c2kg
bm90IGRlc2NyaXB0IGl0LCB0aGUgZHJpdmVyIHdpbGwgZ28gYmFjayB0byBpbyBtb2RlIHRyYW5z
ZmVyLiBGbGV4aWJsZSBpbXBsZW1lbnQgaXMgaW4gZHJpdmVyLg0KDQoiDQoNCj4gDQo+IA0KPiA+
DQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+DQo+ID4gPj4+ICsgIGJ1cy1mcmVxdWVuY3k6DQo+ID4g
Pj4+ICsgICAgbWluaW11bTogNTAwDQo+ID4gPj4+ICsgICAgbWF4aW11bTogNDAwMDAwMA0KPiA+
ID4+PiArICAgIGRlZmF1bHQ6IDEwMDAwMA0KPiA+ID4+PiArICAgIGRlc2NyaXB0aW9uOiBmcmVx
dWVuY3kgb2YgdGhlIGJ1cyBjbG9jayBpbiBIeiBkZWZhdWx0cyB0byAxMDANCj4gPiA+Pj4gKyBr
SHogd2hlbg0KPiA+ID4+IG5vdA0KPiA+ID4+PiArICAgICAgc3BlY2lmaWVkDQo+ID4gPj4NCj4g
PiA+PiBEb24ndCByZXBlYXQgY29uc3RyYWludHMgaW4gZnJlZSBmb3JtIHRleHQuDQo+ID4gPg0K
PiA+ID4gV2lsbCB1cGRhdGUNCj4gPiA+IGNsb2NrLWZyZXF1ZW5jeToNCj4gPiA+ICAgICBkZXNj
cmlwdGlvbjogRGVzaXJlZCBJMkMgYnVzIGZyZXF1ZW5jeSBpbiBIeg0KPiA+ID4gICAgIGRlZmF1
bHQ6IDEwMDAwMA0KPiA+DQo+ID4gSGVoPyBZb3UgYXJlIG1ha2luZyByYW5kb20gc2V0IG9mIGNo
YW5nZXMgbGlrZSBkaWQgbm90IHJlYWxseSByZWFkIHRoZQ0KPiA+IGZlZWRiYWNrLiBJIG5vdCB0
byByZXBlYXQgc29tZXRoaW5nLiBXaGF0IGlzIHJlcGVhdGVkPyBDb25zdHJhaW50cy4NCj4gPiBX
aGVyZSBhcmUgdGhlIHJlcGVhdGVkICJpbiBmcmVlIGZvcm0gdGV4dCIuIFdoYXQgZGlkIHlvdSBk
bz8gRHJvcHBlZA0KPiA+IGNvbnN0cmFpbnRzLg0KPiANCj4gU29ycnksIEkgbWlzdW5kZXJzdG9v
ZCB5b3VyIGNvbW1lbnQsDQo+IEkgdGhpbmsgeW91IGFyZSBwb2ludCBvdXQgbXkgZGVzY3JpcHRp
b24uDQo+IA0KPiBJIHdpbGwgdXBkYXRlIHdpdGggZm9sbG93aW5nLg0KPiANCj4gY2xvY2stZnJl
cXVlbmN5Og0KPiAgIGRlc2NyaXB0aW9uOiBEZXNpcmVkIG9wZXJhdGluZyBmcmVxdWVuY3kgb2Yg
dGhlIEkyQyBidXMgaW4gSHouDQo+ICAgbWluaW11bTogNTAwDQo+ICAgbWF4aW11bTogNDAwMDAw
MA0KPiAgIGRlZmF1bHQ6IDEwMDAwMA0KPiANCj4gPg0KPiA+IEkgZG9uJ3Qga25vdyB3aGF0IHRv
IHNheS4NCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBLcnp5c3p0b2YNCg==

