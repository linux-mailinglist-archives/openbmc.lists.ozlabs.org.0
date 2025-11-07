Return-Path: <openbmc+bounces-853-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA4C3E9E3
	for <lists+openbmc@lfdr.de>; Fri, 07 Nov 2025 07:27:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2pxl1fySz3bt7;
	Fri,  7 Nov 2025 17:27:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762496827;
	cv=pass; b=esh7AJkXC6xHrr9wZbDxZH2S6ojo2tKlOYae7Uo/04QIhhUUkWEdx2BuUhrzaR6BQGrtQ8GopEUiAH3FiX/mlKDnCs/a8wRWVFqnCsbnV6ptawAWkmYbncd48Pl/NzZM2vN4ySJNDdTEWlHUOfY1OilAtZPzXDhTD8yUaxurJC1nRPHHTfYXHAhNwCx8LbcRK8m2Nmm7el0/OpedJHaWM0uqLBvHqwpbqQOkqoIdjgfQ2245NCPg/5tRFxkU+zBpHg9b4igwjBfzj5svg0q9N6t0d8ZqKT8mj1Ec9yyyXxUq2ynAIzjUNoQojNWJLfFddxAWms0bXrfvfUIro1xFpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762496827; c=relaxed/relaxed;
	bh=cvd2aUYGIsZoGe4X76fvvgYgrQASrDB6uyDHKtSNs2Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cWeTLXeUJNIboSxIgWY2PY6jnOuUy5GRysoqNkKg+iOElvAI90jJFzhHRALJoTTUopj3XU0U618X9hTuVfnPWBk2SLoaF7/ZXNAG0Q7icD0PTsX65BcxSPdNkHOgcfHsDvni56K+eMA2S2v/N4tB5nvhs5CRhMCvnK/howtL2bnttK/j6LONe3Z4oW1JI2B0NuDHtUH3nw5gQVAxeJdj1Y/zE2vshLkx0bl8myilayJc9TLsI8vuuYwfTJqxJFziyJGtCwIHTnOj5n1DB2BZAly+FcUc//J0tDazP6DFtRBgtdcw7GzbZV6E5gP+nn0fsmUQOiBNI/qGs1hfu4kB1A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=THhsvyHr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=THhsvyHr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2pxk0qmkz3bsN;
	Fri,  7 Nov 2025 17:27:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/FTLTJW93W/VtSglo5oDu61ZjRs2VT/yoXfIQA5S6Xo2atAnukDk0IW9/RQ+c7DIcZXdIyY3UkIpjJ6Tiq8tLtXmB4ZMv9GmQgOffX8qmlmM6kLE+hv1nU0VunnmLWlrqYIkmuN8DhBWlpM/xPa4zhP5LFU6BF+qBzY3/9hLFhcMA+OnaE1UFuB/fIha3uAdL4Qd2FHjkb2lWZ9aWF/QjVLxFt6a0tyy+fLwp5uy0SaXsJihu4CuhW7QusB0SPZybLv5OvVmnABctuvJtvaXJ35FeQCpU8fgCdt6FMImxA+KEgRCnLxC+gjMSDlquv3WYU44kDbAdIOdGMdiJxENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvd2aUYGIsZoGe4X76fvvgYgrQASrDB6uyDHKtSNs2Y=;
 b=uZbYpytB9IUiidlsXzyUIYtJQkDosUWRMc5FlFCA4IdTW0S95wv08H5/P/tF7uR5koGuDrgQ0JgKGI39LimpWvWcKFm+bPdsXKafk3ybCa1Co4tyAbnrN3bNv19SsHtDkWTQ7OsPNtBhHnF5Zs61hjqxiD3XNkZwaG8JuHQzHtIF2zI+Qj7edyJnQf0CdJm+PzjCwm53p//agTDQ+fsWmAsAPrzMruI8axQOZ6yvuvGSUqrfpnhW59ZR8bLEid8NjIQMA2/xf9axhGLXqKHDv+OeMN2YT1kU9zIpKurtN9YwcgQ6izMv0oeeX6LOAncTyNuGu42wCQUtYIGJ3npMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvd2aUYGIsZoGe4X76fvvgYgrQASrDB6uyDHKtSNs2Y=;
 b=THhsvyHr+O3+FsewFhQF1Zk06250t19WlbYtP7ZeIRQ0UoxEnTLtRCUrmg3vKxXzrGi0Bfdnr/tQSI/uiTHQZbVLO/fs9i8loTISzT/EEXa0o7f384dKlYWjbKgyA823zEE9SuneUnjcVTM9TMGQ0vU9vwjKMgzd9e9mJFe/DLOQuRb/lGX+w0fQ5ErsRIecZ1sL1lc416dedIkNFVAINcqADWiraUj2PLVI+Sfqx9+Zfq1E5vIkobz9n1p7th3moub3I4Uoc71ZsnmCG9hkyCvFkjqVapRLKVrqbZ9wnPJp1HkXSlwaBUHjgz2G7rW2FDpt/mUQ9P9juy9a5Ibk8g==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SE2PPF89A5F5D54.apcprd06.prod.outlook.com (2603:1096:108:1::7e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 06:26:40 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9275.013; Fri, 7 Nov 2025
 06:26:39 +0000
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
Subject: RE: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Topic: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Index: AQHcRwi5PyFo05/UVU+zKir4RznKX7TWYJ2AgBBvTEA=
Date: Fri, 7 Nov 2025 06:26:39 +0000
Message-ID:
 <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-4-ryan_chen@aspeedtech.com>
 <f08b1078-fc8c-4834-984c-813e01291033@kernel.org>
In-Reply-To: <f08b1078-fc8c-4834-984c-813e01291033@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SE2PPF89A5F5D54:EE_
x-ms-office365-filtering-correlation-id: 26c61a0a-239f-44c6-059f-08de1dc69c7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?L0xjdTVPcUhFcDhmZ2h1Vm4rZmpJZmNheE1xckZKemMrVFl0TW1YR2lURHlK?=
 =?utf-8?B?YS9oR28zK3dSWWNWQ1dPamo0TTlYdllpSEFOdmw3bWxwTTZLVDl5U2FYdEto?=
 =?utf-8?B?T1B0dG91RlR4Ny9zYXdIaG9VR2xDMlgybXhaWXpjcnhNYnUvNlBYSmQ1YlJC?=
 =?utf-8?B?Sk04RTRtWnU2Z29SUnlTSXBqQXcwZVBvQzRWUTlqNjc4RFNtYTBvZEtPaW9C?=
 =?utf-8?B?UUpQQ05pTUljaElwd0szUldMMXVTYkVpMk9jNFZscFVJM1RTbmRqLzI2S3RT?=
 =?utf-8?B?TG8zQUFCdXRHWXNmcWozb2U5aFN2bktPK1c2ZlZkc0hZY243VTB3cDVyY3dQ?=
 =?utf-8?B?dU5PM003MzkwRm1Ra0FNeGNGZFB1cndvRERuZlkzKzVTTnQzaThRbHBkZW96?=
 =?utf-8?B?aGNFNXNra0lzWjNGKzdseTduOWxtMVgyV1plMVB4bkZNa3EzVE12ci9TdXI2?=
 =?utf-8?B?VTQ1d0VvNVZvV1VIM0ZtL0d1TTBIcktWNFpKUEhQdEZveE8rTGRwUzJna2ov?=
 =?utf-8?B?ZFNGZzN3SnZkKzlYTXdrMWplQ2EyOXJXUWF5ZTBxT092a0JZOG9wY0xaRjE1?=
 =?utf-8?B?cXBjS1RrY2hJQnlsdjhEWGY4ZnAyemlXZWtMWEJ5dXZOUVRKYkZINmU5Z01R?=
 =?utf-8?B?UmlpZlhqVmpMNmd2ZDlodmwvREV5Q3Nnai9IRWJJK0hzeW5xUXpxdzVQR1Qz?=
 =?utf-8?B?bjRnQzhudEQ2c29CdEpabVJabXNpaGluNVBLMVJidlhqakNaSVlERGF2TGtn?=
 =?utf-8?B?bThpT2NNcVRadG5Dd2xZbCs5U0FaUk8veEk0aE81NE5kTVk0dVNhZ1F4Z2Fz?=
 =?utf-8?B?STVxeDZwdTMrd24vaVFYcWVzSlYycmt5ajBsNlF1clkxUWtJbVBhMldBUE9B?=
 =?utf-8?B?WXh6MmU3bkVWSFh4ODQ2WHllaHhKWTdWNnlESFBQbzFOSGJIZldtS3dxNEVS?=
 =?utf-8?B?NTZiaWIvWkNud3EvVHR4R29MWVNsOGNjRFFyb1Z4YUNTaXBvSUJEbVhIeWU1?=
 =?utf-8?B?ZUtoaDRZMGU1bVFVdktxOTJQaDAzMkZ6Ynk0Q3I3NDlnOUVIcGVocTBFVFR4?=
 =?utf-8?B?VGRCM1plMGoxZDFLYnl1ZGx6TmZnVG9LQVhxcGxnU0NwZTdSQmFtQ2xIZ2JE?=
 =?utf-8?B?UEl4NUZRc2JwOUx6aHRULzdhVnZ3M2o0OWxvbFZLWUF6YVhqbDd4aERPT05i?=
 =?utf-8?B?aExsQWp1YWc1aVJIQmhuelZnNndXYVcxRTB4aUlXejUxdjEyb2tTeStJd20v?=
 =?utf-8?B?dFVkZXQyVFEzU3Y3V2llVlh4NEY4am9OeGxDOUVxak1GelMybm13OGtpZ0pQ?=
 =?utf-8?B?MUVmU1pKZ01wRHNCa2o5cjMwMmFnalRlcGxTMGkvMndXdWZKVEdGU21SZnpB?=
 =?utf-8?B?Z2NQR0prSEYvSVBBQS93akZkRzZ1eGdDOEtXUld4M25xd1ArVDRaQ2EweHFS?=
 =?utf-8?B?MDFNY1ZCL3RLb1pEQzIrZ1BHeXNjYnJ5UUhCdUh1dUhlTFZFRHZ2aHp6N0Vm?=
 =?utf-8?B?TGdBVWtpVkNsS2REWXB1Y1NCazc5c1FMRTlSQzZiME9TdUliNUM4LzVsNGVW?=
 =?utf-8?B?MmdHTFQ2NTFWMnJMN293cDdPZlBmbkNnOW5ORHdaYWtZR0xDOG5aNzNzUHlp?=
 =?utf-8?B?ZDFFL0lhUndlTE9iWXh4ekJPb1FuL0F6cDV2akg3UUFOTUU2VFBQMXp3K3lo?=
 =?utf-8?B?M1I1NEdpT1B3dXdqT3NqMG43VXFsV0JnMW1ETjJnUEpRRVZEMnZpQ1l5L2VE?=
 =?utf-8?B?WlVaYkNYOHkxMnVrSm14Ylp6WmpXTjZERUZkTktXRmRjOHlSSGdFUnBaQ3JC?=
 =?utf-8?B?MXZrcUZhMDFSQjB1L3hVM3FXQWtjT3NtZyt3MnJZUjIvOWxTUW4yUjVMYnoz?=
 =?utf-8?B?NzA0U25vREdCSXVFR216Tm9uZjdibko1RDVvb2czVWZhK0YvQmpXSFFldjE0?=
 =?utf-8?B?L1B0YnlrODlUaE83S2ZMaFRDOUt2anh6czNxeHhUUUxwcVRkSFhVcGw5S2FJ?=
 =?utf-8?B?V3NXQzJHZTRTK1JkZ3hXNEk5TnF5ekFVdGxyd0FMUnpkbEFoTy81djdxMXJF?=
 =?utf-8?B?WjB6aGI2b3lZb2lqZURwUC9XWkVwTEMvdml2dz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEdSdlBmYk94RWVhSlBrM0Z4NXhEVitUbm5kSWd3TkZQemRyMkFFTVdOVWM4?=
 =?utf-8?B?bUJ4N0Y1VDVDZ2kxMHc1SUMrSDZoeHZBNjRobTVqSUlzSmRBS1JUVUtqUU1R?=
 =?utf-8?B?RlFKOXI4RytxRWhuOWlxZEVnb3ZhaVVnUFUrUS9ZeGR2TWlRcGl5eE5hUVpq?=
 =?utf-8?B?RzM4TVdPdlo2bTdNaEE4a1FZVVN2OEpEYndrZm84amhCbHltQkx4UjRuME0z?=
 =?utf-8?B?SkRhdVowM1lSYXhqd0VkUFl3RjBxK1JqRWhwV0lEVk5vcE9iV3lsWUttTkND?=
 =?utf-8?B?aTFNci8yVDg0V2hlOVBkYzJvYjNUUVBaNVVFd0pMNDRpN3hrNlVkWVErVmJv?=
 =?utf-8?B?UjZId0M5MC9pU1grVVFtNlkxUXJlTGc0RmRzQnY1VGdFbXJoNHI2ZUNwZ3VL?=
 =?utf-8?B?T2ZMT2lZRkRLNm44RlhDajJPSnE3OWhOdEhWMlRJWmNJcFdyL21MdHo5dExU?=
 =?utf-8?B?RXNJY1FzNm5HNXdBcGp1a1Z6Q1FwRFgyMHBxQ1RaN2IveDgvMDlsVlFGYmI2?=
 =?utf-8?B?U3hkdU5qQzBsMExKOWZaUytwaytnRTc2bWlKK0JickUrYmZjMHRnRE01NnEv?=
 =?utf-8?B?bzYzN2FVbHd1S0dSMkJvSGV3R2FTaDdjejAwaEpqaWVNRktqcTl6UlRUVUs2?=
 =?utf-8?B?ZVlQbElqd25ZOWkwWVJFMTlzZlZmemV4VU95dk04TTYyeXpEZ3hLTlpGMVBT?=
 =?utf-8?B?VmU2UmhBRFBSaHoxSzdITHkzUFVUQldVV25mK3RKZDBxQmNGNXFvV0pyRTdx?=
 =?utf-8?B?R2RqTjUwcnRpVG12aytLSDhZTEpxVlpCRXBoT3ZoMXFsYjIwNG0rMFBUczZh?=
 =?utf-8?B?UDl0cHpORnROYk5wd2t1YngwUGxnMGxhQ0lScnMzSGVmN0xTa2w2UktYZCtR?=
 =?utf-8?B?ckNuSjFZME8rdmRKdEpGL2xIaCsxQVI1ODh5dkZXeDNmampyK2NKMWpXN2lu?=
 =?utf-8?B?WGRpb1hacVltdVVxSFJkZUJobHd1ZXhXV2RQOGh4TXN5Sm4vM3JoZitWUUxO?=
 =?utf-8?B?S2FxUitGSitRRHdLa0M2MFRBM3d5cU9MOFA4VUxiSnZCY0xBNzRrcnNoUFdU?=
 =?utf-8?B?UXNtS0NFc3hqc3FJZmt5R1djTEJoQ3UxMzRNWDBTLy9Dc0FXQ0JpL3lVVGZM?=
 =?utf-8?B?RThmRU9GaTVrSm9VMlZIelVZTTZENitiZnoxZnNQcW5TeE00LzkyU2hMcTl5?=
 =?utf-8?B?YzZ4VWtRQ1A4eHdqV3c1ZnQxNm5iUDlmMWJ3SE53VlNVZStKa2t6VUw3UzFI?=
 =?utf-8?B?U2lhZDhmNW1DZmdYdEhuZDBwYmZmMFdLMlRhbytqa0RvdEVvRUZZOGV2SkZY?=
 =?utf-8?B?eElRUXg1ZnRzbjlzU1JoWVU0U3h4ZUNXUDZWRzJkWDloa1BncXdscFNuVmNz?=
 =?utf-8?B?U2ViY3JyWk1kNDRWTDlQRTZGZFpaSFpTcmVXcWcrOVRVNlNHWk83M1NkWUdN?=
 =?utf-8?B?endiNjZOL1BIWmdaaVBuLyszWnozdTNEamVTZ3lDU3k2M0xtZlRUdmVCWldN?=
 =?utf-8?B?WkVUNGtGZnVoUjZKeXdkWFFrcUdCRk5ZMjNpb2Yxb1d5dFZ1Ull0eFFxcWVk?=
 =?utf-8?B?TEhaMVBNRkt6WDFUOVdGdGo2SnJNWldyMkxrOE9KdHpFMm5udDVFOFNTRDNw?=
 =?utf-8?B?S0llY1VJb1kySm4rOWRldEV2aTdzZGx0OGtUK1VPTnZyV1dCQzVLcXcya2xC?=
 =?utf-8?B?UWcwZU40WmNFYkQyNG9NVTdtNWg2SEJkT1hvTGY1SUp6U2M0enN4Z2hEVzY5?=
 =?utf-8?B?YUllb0E3Y2VBTDE0ZC9kZmpoaDN6eHo4Q2dEYkZYb0lDc05xOWEyaXlEWjVj?=
 =?utf-8?B?RDNoRWVQV0hYZjk1a2VjRUpsTmlFMVBMQStheVVpQ3p2U2U4MzNKZHViUnBU?=
 =?utf-8?B?cVdQMGozMll3UXlwQ2w5dEhsMlY5cGNMNUt3eDhXQTJKOHBWeGhFVzJPSFQ4?=
 =?utf-8?B?WU10aHZoMUN2WndRaC82a3laMTZ6NnFjQlVVNkowUGVNUERFaGV4eGVVTHpY?=
 =?utf-8?B?NlFJeW5SVXhkdkpVdElDQW14Sk44YlpBb3hHTTVZdmxNRHZBZWNGdHloeDd3?=
 =?utf-8?B?SmUwdVBHc2ZyMFBqT1BBY2dyWlIrQjJZS2ZjRWkvNmtWdkQrQW01cnFKOWtS?=
 =?utf-8?Q?tJPR47aQy2kaOAAbvnF1vclUF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c61a0a-239f-44c6-059f-08de1dc69c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 06:26:39.8730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2kLWlKYPRQjsQkinwIn7S7/9QsvgRKrJ4HYN36pgCDtTrpfm5QFNy05B8bLpqC+3ekSUjSq6yCLIv6j5ephEVdlY6S/25BJ66C2wcae1kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF89A5F5D54
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMSAzLzRdIGkyYzogYXN0MjYwMDogQWRkIGNvbnRyb2xs
ZXIgZHJpdmVyIGZvciBuZXcNCj4gcmVnaXN0ZXIgbGF5b3V0DQo+IA0KPiBPbiAyNy8xMC8yMDI1
IDA3OjEyLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gQWRkIGkyYy1hc3QyNjAwIG5ldyByZWdpc3Rl
ciBtb2RlIGRyaXZlciB0byBzdXBwb3J0IEFTVDI2MDAgaTJjIG5ldw0KPiA+IHJlZ2lzdGVyIG1v
ZGUuIFRoaXMgaTJjLWFzdDI2MDAgbmV3IGRyaXZlciBhbmQgdGhlIGxlZ2FjeSBpMmMtYXNwZWVk
DQo+ID4gZHJpdmVyIGJvdGggbWF0Y2ggdGhlIHNhbWUgY29tcGF0aWJsZSBzdHJpbmcgImFzcGVl
ZCxhc3QyNjAwLWkyYy1idXMiDQo+ID4gYmVjYXVzZSB0aGV5IHRhcmdldCB0aGUgc2FtZSBJMkMg
Y29udHJvbGxlciBJUCBvbiBBU1QyNjAwLiBIb3dldmVyLA0KPiA+IEFTVDI2MDAgU29DcyBtYXkg
Y29uZmlndXJlDQo+IA0KPiBXaGVyZSBkaWQgeW91IGRvY3VtZW50IEFCSSBjb21wYXRpYmlsaXR5
IG9mIG5ldyBkcml2ZXIgd2l0aCBvbGQgRFRTLCB3aGljaA0KPiBkbyBub3QgaGF2ZSByZXF1aXJl
ZCBwcm9wZXJ0aWVzIGFuZCB1c2VzIG9sZCByZWc/DQo+IA0KPiBJIGRvbid0IHNlZSB0aGF0LiBJ
IGFjdHVhbGx5IGNsZWFybHkgc2VlOg0KPiANCj4gPiArCWkyY19idXMgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKmkyY19idXMpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghaTJjX2J1cykN
Cj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlpMmNfYnVzLT5yZWdfYmFzZSA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gPiArCWlmIChJU19F
UlIoaTJjX2J1cy0+cmVnX2Jhc2UpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKGkyY19idXMtPnJl
Z19iYXNlKTsNCj4gPiArDQo+ID4gKwlyc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJl
ZF9kZWFzc2VydGVkKGRldiwgTlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJSKHJzdCkpDQo+ID4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJzdCksICJNaXNzaW5nIHJlc2V0IGN0
cmxcbiIpOw0KPiA+ICsNCj4gPiArCWkyY19idXMtPmdsb2JhbF9yZWdzID0NCj4gPiArCQlzeXNj
b25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldl9vZl9ub2RlKGRldiksDQo+ICJhc3BlZWQs
Z2xvYmFsLXJlZ3MiKTsNCj4gPiArCWlmIChJU19FUlIoaTJjX2J1cy0+Z2xvYmFsX3JlZ3MpKQ0K
PiA+ICsJCXJldHVybiBQVFJfRVJSKGkyY19idXMtPmdsb2JhbF9yZWdzKTsNCj4gDQo+IA0KPiBB
QkkgYnJlYWsuIE5vIGV4cGxhbmF0aW9uIG9mIHRoYXQgQUJJIGJyZWFrLCBub3QgZXZlbiBtZW50
aW9uaW5nIGl0Lg0KPiANCj4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIGJyZWFrIHRoZSBBQkkuIFlv
dXIgbmV3IGRyaXZlciAqbXVzdCogc3VwcG9ydCBib3RoDQo+IGludGVyZmFjZXMgYW5kIGJvdGgg
RFRCLiBZb3UgKmNhbm5vdCogKHBsZWFzZSBsaXN0ZW4gY2FyZWZ1bGx5LCBiZWNhdXNlIGluIHRo
ZQ0KPiBwYXN0IHdlIHdhc3RlZCBhIGxvdCBvZiB0aW1lIGRpc2N1c3Npbmcgc2ltcGxlIHN0YXRl
bWVudHMpIHJlbHkgb24gbGVnYWN5DQo+IGRyaXZlciBiaW5kaW5nIHRvIG9sZCBEVEIsIGJlY2F1
c2UgaXQgaXMgdGhlIHNhbWUgY29tcGF0aWJsZS4NCj4gDQo+IFlvdSBuZWVkIHRvIHJld3JpdGUg
YWxsIHRoaXMgdG8gaGFuZGxlIGJvdGggRFRCcyBpbiBiYWNrd2FyZHMgY29tcGF0aWJsZSB3YXku
DQo+IA0KPiBOQUsNCkkgdGhpbmsgSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQgYWJvdXQgQUJJIGJy
ZWFrLg0KSSB3aWxsIHRyeSB0byBtZXJnZSBpMmMtYXN0MjYwLmMgd2l0aCBsZWdhY3kgaTJjLWFz
cGVlZC5jDQpBZGQgbmV3IGZpbGUgaTJjLWFzcGVlZC1jb3JlLmMgdG8gZG8gbGVnYWN5IHByb2Jl
IGFuZCBpMmMtYXN0MjYwMCBwcm9iZS4NCg0KCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShk
ZXZfb2Zfbm9kZShkZXYpLCAiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyIpICYmDQoJICAgIG9mX3Bh
cnNlX3BoYW5kbGUoZGV2X29mX25vZGUoZGV2KSwgImFzcGVlZCxnbG9iYWwtcmVncyIsIDApKSB7
DQoJCXJldCA9IGFzdDI2MDBfaTJjX3Byb2JlKHBkZXYpOw0KCX0gZWxzZSB7DQoJCXJldCA9IGFz
cGVlZF9pMmNfcHJvYmUocGRldik7DQoJfQ0KDQpUaGF0IHdvdWxkIG5vdCBoYXZlIEFCSSBicmVh
ay4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

