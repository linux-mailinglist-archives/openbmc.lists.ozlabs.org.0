Return-Path: <openbmc+bounces-1354-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDZQJil3i2nuUQAAu9opvQ
	(envelope-from <openbmc+bounces-1354-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 19:21:29 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79C11E4D6
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 19:21:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9VHY1Nqdz2xRq;
	Wed, 11 Feb 2026 05:20:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770747657;
	cv=pass; b=fPZ9buQS6EIsp2zNhl4URMnBiBQSH128/ljYC3laSyhdrDWyB/84oRxRlb/Ud1IPO6EtLDXs+/A1w6lcEbFBsyrRgVwuwPOWU+LQV+eP0KXvf2SRlFOjQWEbzZANM4tHUuvx4E5BPN2+hVHCeBHlq7I6hDFt7RClmTALxB36cQ8dOMmcjEyuxZxO1MbavVpnLHeMgJTJdOFIVqHv2YLkJRvkV7ruTrXrMpfx9zvYO4eR9XGdkWwfoSjRrVEYZiQi8Akcfw6RU/MFB+FCBPwAxDv4RvLMUDfugFAXW8QaMX/lidRPgaqkloMn99S87Xsal3+jDqMG8X2X+rJIY4EKJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770747657; c=relaxed/relaxed;
	bh=7A9ztuZvTsNzD+ZwRlGXAPOTkYCnGBKI3zZTYv5zBgc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m+Cak+6sAXpdks+7qabBMMIfotKzteb1QKw3I4b4iDn/llhEkthPRujmElQfSZL6LQRSNUN2GjmFSD117m5N3AKR3858Byen/5vaIo803l4w7kavY06ntwwrdkbq709CUvEDugXQII/P3ICu2rfHoxv/Wg2qFS7uJXcwNhAGj3lRMWY/jrBIxUMo0I4Hq1EMqGl1Sw+bpne6JplO7Jgp861abO8N3P0dYB8mybKoaUnN0AUDmV0oAWM62d4RLR9v5zcrCJtN4YJVlDAhi3JV3ZsXOTudgtG8rMqkvEIIeHmRuqXYfbpCSa6JG70NzlCYLyqHWwTU8YKg80zjga2nbw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Oe62Ku+c; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Oe62Ku+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9VHX2wjGz309y
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 05:20:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8qNKREnNHJQnLYNoFQJUI31YZA3o38K5Vt9mtXUSgmaqxdTtbiM487cnKrB1AArA5+HkG/eMn/T6Lq75r+xPyvzDemnPu0UwtSSeN6PE4plVBnMywj8dTUVUl28VZrGgJ+8mSg7vdWRM/i8l1fFMLtas0UZPCRi/Yc9b+ecQueL6ojEs+wknhbgKIeLYJY1qM9E63y3yyJc14biEKuCpPAd8+CsLDVqwuzJkTZJWX0/B7hKV+ISZ3qXcJLzUxvAtInxFG+bis7gQQpufdSlUj0lUmGoYiWRKKlrWJahs+plv2lMpWS5qI7zllTEn4hJ8xyoCL9QKPjruFs5aYbRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A9ztuZvTsNzD+ZwRlGXAPOTkYCnGBKI3zZTYv5zBgc=;
 b=Pq/flxdEGJwFoYPhj+fjDHUGKX3QuZtTqOIDHWuln3SYECGtE4WstgZbFh/IFnCaWKd8l7fiXkIinkEX3DF3qoyL9F8kqhglZpVD+5yO0PFVeT3+PxDb4IF+DQdcGfKIrXyztHsRqjiNUov+yMwQefBKmvPNUj4uAOfD396piH7VkvhwQqIEf7dJjyW7cJxoGoDQY10i0gNLfJC+tRRml2lnRbg8mQygD9fWyNJc8x2CFHidEo3N0P6RVqUNVlfuCwbyJw4/wI/zl2vyfRw5z7rDU59WgtbA5T7LehUYpXQise5YNxc6GyS1RoXGm+IFwqGKc4HMDHmBl4MtbG4YWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A9ztuZvTsNzD+ZwRlGXAPOTkYCnGBKI3zZTYv5zBgc=;
 b=Oe62Ku+cOot27535dR8pENhoqNWbVxI36zG1eSvHmTIqAvEIDjDVpP9/E502VjRnPphx9FQKPTmRCMuE8dqVcb/dOhaCC4+WOGRc/JeIufW6ASNHLe9IeLyb0IPZr6TiSsgwnaVLUNjv/L285bKaK6JzUaGSMNArvnHzotQ+/0DPN/38dIc4Xoc70uK97UmmtuFe2xOOwjujmxmF0wrAXcapM+ffzdSlQNcl87l12wSVT3J/mxCRuzpYYP9Bs5WTxRmfkd/i/afPmHa1ZAzFHGWs073xhs2g8t6t83iWwo1DzEsHjGD+ajxUwZuqYvDVjZwIwqz7EY7iqAeIt5sSKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by BL3PR12MB6545.namprd12.prod.outlook.com
 (2603:10b6:208:38c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 18:20:21 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::4558:b58:4d9:de9d]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::4558:b58:4d9:de9d%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 18:20:20 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 10 Feb 2026 10:20:01 -0800
Subject: [PATCH u-boot v4 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-msx4-v4-1-7dbb1e223e49@nvidia.com>
References: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
In-Reply-To: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Marc Olberding <molberding@nvidia.com>, eajames@linux.ibm.com, 
 fr0st61te@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770747617; l=3020;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=vRrEMsOvqALaM/NQRa28hD60BoI7h2lZiAogOPZcyas=;
 b=U5gMQxqZmbAs2WUYgWcV0NytLnrlqpohkDascvD/xecgQTfPBUmTxpgPNQumPPxQCujt8fKFz
 Adb5RxLDlM5C1o4WFN9l68ZuoZ4nF1xAyCV24gkt8jQp7jef+xuT+Iv
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 788e13f2-5b31-4677-0aa5-08de68d10ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFphM1Rrbk1PVjkxT1BBMUtCc1V3a0VMNUhMUTBFOTVORTcrTzJmc3V6TlN3?=
 =?utf-8?B?N3p5anZUKytqd2dWYTdpNSt1M2JSU0J0OUdLMDVFLzNHa1lyTDEzUGVSekNH?=
 =?utf-8?B?RFNkd1N4S2ovR1o0SEV5N1h2aUwvNUZRWCsrZmk2Zlp2aTJrcFV0cXkxN0FT?=
 =?utf-8?B?ZWJOcnlldzdmWGY4alR3Qk5kbWJCbXZjVXpGTHN0VlZyOThsZkMwWWNBNVh4?=
 =?utf-8?B?MUthTFhYZjhnNkFhRDVtRWdWQ0ZFZUF4Q2FZZkNOdlRmNWtlTllWb2ZydUhS?=
 =?utf-8?B?Ymw2ck0yNGY2ZkczT3N4SmwrNGovRC9wNE9ZYUVQQ3g3UkhmUHU0RzdKNng1?=
 =?utf-8?B?dWVqNUc0Mm5ZQmUyYmtWUGYrK2JWcWpoK2NOcHpud085NWxlVEZYOTZkLzh5?=
 =?utf-8?B?UC9OamZvU0J2aTIxMkNpRWk4b2JJNDJrcmRsa1NyQVJZZGtTbmVEb094WVZP?=
 =?utf-8?B?ZlRyME82Y01xYkZEYy9BY3E5SlZaeS8xMVFpQlk3RlROaDNaR2NzY215MlNP?=
 =?utf-8?B?dU5KRm1YZkZKUVg2Wkw0QnRwUEV3VEV3bnRsa3AxeE1rU1orUFJtZXJUYm1W?=
 =?utf-8?B?MnpVYjVMTHNidmVzZE5UNGRCZ2lzRkQ2ekNVNTJLeDBuekNQOUtJdXlwVkZ4?=
 =?utf-8?B?a200MEhQeS9Fd3A1NkZnQ0RCZnI2VStIV1ltTDA0WitNaE50OFhrNUxHMXMw?=
 =?utf-8?B?aThLdllwZlBYQW1Md1JYMy9vZHhyd01pU2F2NmljSFMwbkwxcUJwUnhnQi9W?=
 =?utf-8?B?bzNJL2pCbnVIczRxMWRLQ1huTG5IRk56REQ5d3Vjd3FQaVg0VE9yRzdaSzVu?=
 =?utf-8?B?QXNUL1FLZXZ0eXNNQW44dVF6eVpJcWdYWFBpa2RxVGtBT0dOSSs5Q1Q2Zm05?=
 =?utf-8?B?eWt5Q3dnK1JXUTNJN0NZREsxUExpNkxZTDZCTnRwbGh2RFVYUXdJRE1FSEJH?=
 =?utf-8?B?T2NmRlB6ZGNhOFZBWDVnMkdKbzI1b1ZIdzY2YzFEb1pnZ3BkZysvT3VXdUZV?=
 =?utf-8?B?ZisrWTJBdE1mQlp1WWJVZ2VnT0dGdXBZOW4zTmJBaHFuRzNmbjlvQVRmZFJs?=
 =?utf-8?B?S1g3SiszelBlaU9GcEYxUS96aDdlSEZCaENzQmdwclJpbmhMeXhRUmhSZnJk?=
 =?utf-8?B?dE43SmhTdzVIZ0hWWVV5YU4wVndZbWFGcDF1K3lTcDlaYjYyeHc0UUd2a0hJ?=
 =?utf-8?B?RlR0cFpWN3JkSkdxOHF1Q3JQQ3NTeFZrUFMwMXZwYXQwb2NEd1AvaEE3YmJT?=
 =?utf-8?B?bnN0VnVoL1FCT2pTRmlVd3p1UktvVHlBb1JTcTNqWmdUNXhnYWMvYUszMU52?=
 =?utf-8?B?YUFWd281NFJMbm9ZekhpVGVqcmlMenV2TFNaMy9mM2NVRWVPaUM1MnBKNDEw?=
 =?utf-8?B?dURxbzgvSEpXMUF3TnA2bHRoUXE3RWh4alZUVC8zYTRJdSsxZTZpSG95Sy9u?=
 =?utf-8?B?cGNnV3NZL3AxNEQvb3pZcVFXb3dUbFROV1Q0MlVZQXpFUEdpeVVHOG5kdUNy?=
 =?utf-8?B?SjlaQWJ0OVJ0RDFyK2RRODNPSDRXOEk0dkpiL1VQSytkM2JTNENjME95bXAz?=
 =?utf-8?B?ZTI5b1hadG94N3oyRkNkb09PTzdzVVIxOFpacTNEOEFvcUkxYkNpZWswaElE?=
 =?utf-8?B?NWRHZzAxWmF5Q2lYcmRhU2hYVWIwOXBJMXh3YndiSVFmczVUSkovVmYySm9q?=
 =?utf-8?B?d3NDWlErVnMyNmZtd2FOcFZRTzU4YXRxWXZ3TVoxcitUU21naHM4ekFmQ3dm?=
 =?utf-8?B?WkVXR2FiNElFZ2l5K2ZoVVVUaDJNTGFBWVM4Qm5JTmo2YUxSQ1FJeFN4OWIw?=
 =?utf-8?B?Q3lYbFVJMkxhUk1WTGJPb2RQQUh1UG5GZ0U2ZFl4Ujg3UmlQQlpIRFBLczJw?=
 =?utf-8?B?TEVyWTExS1JLakFISTRmcVdaM2QxWWtQVFRpVlJYZlBNWDB0a2JROG9aSW1G?=
 =?utf-8?B?NWs5MzM3QjFvNndlaFNCZEZCbFU0eXRLOXFuMFZrakxDZmV1dUtNQm5NN25H?=
 =?utf-8?B?azNQeXUyUGVKT0R0VUJCWGd2TE9UY1RtUEVQWEJxWEl6Q05DTkRGMHlWa05Q?=
 =?utf-8?B?RkVrSzZTZTRXV0NLR1lsKzNMc2xEWSs2MTVmN2VhMjA0bWFwMEFycHFJeG1O?=
 =?utf-8?Q?XWyc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZ0ZzBINEZ1REREM0VuTWYzV0Fyanl5R3dkZmJvTytqcjF4RkcxMHFnTXI1?=
 =?utf-8?B?SWNvWWtBQk5Fb1VkN295TVNsRzlGc2xORUZKODh2RmpBdC9BYm1laGhUdzV4?=
 =?utf-8?B?cXFVbWM1d2pra1ZFNDFhWjhVS2Mrb2dKS2VKV0dWYnhDQnJma2hwZ3lNY2hW?=
 =?utf-8?B?bFRyUVphU0Y2clNYT3dYSTl1aVJNREhOdU9JM01ScVZMaHAvMDllOVZheS85?=
 =?utf-8?B?bVkwOWVjeTVId29DWndHVDlkdWsyWkdqZnJrenBKNjdyMFowMjFHNEJzMlZT?=
 =?utf-8?B?a0Q5UHE4WDJPL1gyVmJsWUxkVzJuOG9wTzhlaVYxdVh1c2tjWmJ0REVPZ01q?=
 =?utf-8?B?UEpvbGE5aDNxdTMxNWpXY044U1JwU3lQc25xVExuUjdaOVFhby9oSnRiUkdr?=
 =?utf-8?B?MGFYVDhxTjRSVlBMT29TSnJrclZhcStucFlKY1lUQTNmRE1BOTlUR2p1ejFM?=
 =?utf-8?B?S2oyNmc0QUsxR3FGa2tnSHlObHJsa2lnQjRsT3Nmcm9GaXVHaUVCZ3k2VTBj?=
 =?utf-8?B?ZDh6dE9EcHQ4eUFOQzc3bnB4SVJqNHlvbWJ3emtEVEVRSHZ5WHFnNlltejI0?=
 =?utf-8?B?NjNVSjhWRDM2Nk5zVTU4T2NaK25pSXBFTnBWbGNXWWdrUTdyV1dONnh5ODlm?=
 =?utf-8?B?NzU0M25xcXRZR3QzdWlMMHQvZmtnb2s1Y3BEMW1xTFhNV0JHZzNZcTRzRGR3?=
 =?utf-8?B?MFhaU0JnUnp0RU5ISGhneC9CSG44OXFidVlKa3dWWVhJYzBkQmRac1dLa2JE?=
 =?utf-8?B?MzZ3Q2hLTFA5dDk4YlZiV2ZpWDJBR2l6THNHSXpMK0pkUEdGcHZnQ1pkeU5D?=
 =?utf-8?B?NjhsZUtGbXpEK3RnWGFuMis1TDdLWEVWRE82YW9sWnBqNHFUWVZYSUNQZWhW?=
 =?utf-8?B?NFVMdlBTYkdnTHNSQ2dQVDNPK2FKcXZnUlBzQ20yL2k0bmxSZTkveDAzQnFa?=
 =?utf-8?B?L2V6UDdpSmRBd2s0RVhrTFhwWkNmdHIyZXd4WEx0UXhFbzkvMmNvVkVhZktq?=
 =?utf-8?B?S2xWRmlDWWtSd2o3VklVM1JlenYxK2VVRkFxbVV5eWpIQjhYdGE3VkZMVGJo?=
 =?utf-8?B?ZXZlTTUyYmYxS2JHbUxQV3g0WDRLRGhFUWdFMzZPbitHWmEwdDE3NjVjMTRY?=
 =?utf-8?B?c2haZTZ3MzkxMVUwbWl0UElVQlJIRzhxck4vRThTbnYvcytNM2p6TE9zSHJu?=
 =?utf-8?B?aFVJcE1OdmYvVktLRGhrU09wbThIL1dtOHBPZUlBNVo3eHVaTU5MbnN3RFM0?=
 =?utf-8?B?YjhhTHJocE9jNmRaYkV5NlVReEs2QlNWQ3d4TTlpRjk5Z2htRDQyYUJmNWdy?=
 =?utf-8?B?VXlPNUp3dEU2YXpJMGFzVjkwQy9SRkdUQW45ZDhsTWxtTXVsQ056R1I5VnNk?=
 =?utf-8?B?Y0VJbE9UcmRNUDVwaU5GaVBEaVd3K1pPRDhUMWtRZzFUNFRtSlYrZTVuOEtz?=
 =?utf-8?B?MVoreHpvMjh2bXA3V2JpeVRwQTlMS2dEQmZFRlp3V2RyZjhtU2FZMnd3VURl?=
 =?utf-8?B?enpxQmZHQTVZQ0NUa3hDc1dVNzFJaDN4MXc0Y2dvc2ZKRDYyTk9hV0E1UmFl?=
 =?utf-8?B?elEzTVpwU2wraXVxck1MVVdkdVFkVmVkQ21PNjVtL3JOT2NkWjRkcHF6Z0Ni?=
 =?utf-8?B?UlV6WC9VT0NpZ2RmaVJURkJ1YURBM3RLVGtzSXdSemhiVXVTN3ZIUVlEUzJK?=
 =?utf-8?B?MTNsUGd5bi9aTytNanZsNFhMY3hnS1AvVUNqVnNnU2hWZWROQnhJcGVDUTQw?=
 =?utf-8?B?RGdYSUZtUitUajlKYzFycm9oSzhZdGlPNStreFJWTll5Q1BnQlpTYk01Zjhn?=
 =?utf-8?B?ejd1U3IvUGRnTnppNHFkWDJQa21VeVBKZUtlRnRKWitNQzh1SDRXRTlQNy9V?=
 =?utf-8?B?MGFIaWduazEwZWVpVUZjMHlHMUQyN25xbHJ3NDNaN2xHT0pJd3VxQXNsZ20x?=
 =?utf-8?B?NERFZXJZUXBuRDJtcURCMXNGOWNwcU1oVG83Z1hKTDZlcjJJZEJORmJ1SG5L?=
 =?utf-8?B?ZVVPeklBdkdBODQ1WFlzV2JHaytLYTA2R1JTQXdST0VsOGI2eGl4bTkzbktw?=
 =?utf-8?B?aElYU0FFUXV5ZHBuMWtiM0g4ODA1SUkxZWJJR3BaQk5zY2lEZTlMMWpBYTVi?=
 =?utf-8?B?WGV0SnFuSFFhbTVVMUUyalRGaHN2Mnl2VS9oVFFZNWFBSEJxRnNPajN1S3hP?=
 =?utf-8?B?aVRpd2VTdjdBUXFZT0tHLzNPSDcwTnZ5Y0RKM1djKzVGMHQwYzl0RlBmdlg1?=
 =?utf-8?B?QVZqYmlySStqcmsyaTFjQU5qNWNWTWFpeENxdFRSellKY0JzclJPcjRqOVcz?=
 =?utf-8?B?QUp2cmhVSEtuNS9tZkNPTmVRQi9SSDR6VlRxVkx4VjlJWEsvY05Odz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788e13f2-5b31-4677-0aa5-08de68d10ca2
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 18:20:20.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6HHxheSZsgA0drlfV0vcHYNCDIr0MVJu6N82qKfqmpg+zCVjxAwBFb6ul+iaTF0VAL0ixQYgKEN2bSY/KEgPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1354-lists,openbmc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux.ibm.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[molberding@nvidia.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3A79C11E4D6
X-Rspamd-Action: no action

Adds support for disabling the ast2600 FMC_WDT2 through
a device tree entry in the fmc node.
Set `aspeed,abr-watchdog-disable` in your device tree to have
the driver disable it.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 drivers/spi/aspeed_spi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
index 54520122f1..bdd878f347 100644
--- a/drivers/spi/aspeed_spi.c
+++ b/drivers/spi/aspeed_spi.c
@@ -30,14 +30,16 @@ struct aspeed_spi_regs {
 					/* 0x30 .. 0x38 Segment Address */
 	u32 _reserved1[5];		/* .. */
 	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset Command Control */
-	u32 _reserved2[11];		/* .. */
+	u32 _reserved2[4];		/* .. */
+	u32 fmc_wdt2_ctrl;		/* 0x64 FMC_WDT2 control */
+	u32 _reserved3[6];		/* .. */
 	u32 dma_ctrl;			/* 0x80 DMA Control/Status */
 	u32 dma_flash_addr;		/* 0x84 DMA Flash Side Address */
 	u32 dma_dram_addr;		/* 0x88 DMA DRAM Side Address */
 	u32 dma_len;			/* 0x8c DMA Length Register */
 	u32 dma_checksum;		/* 0x90 Checksum Calculation Result */
 	u32 timings;			/* 0x94 Read Timing Compensation */
-	u32 _reserved3[1];
+	u32 _reserved4[1];
 	/* not used */
 	u32 soft_strap_status;		/* 0x9c Software Strap Status */
 	u32 write_cmd_filter_ctrl;	/* 0xa0 Write Command Filter Control */
@@ -45,7 +47,7 @@ struct aspeed_spi_regs {
 	u32 lock_ctrl_reset;		/* 0xa8 Lock Control (SRST#) */
 	u32 lock_ctrl_wdt;		/* 0xac Lock Control (Watchdog) */
 	u32 write_addr_filter[8];	/* 0xb0 Write Address Filter */
-	u32 _reserved4[12];
+	u32 _reserved5[12];
 	u32 fully_qualified_cmd[20];	/* 0x100 Fully Qualified Command */
 	u32 addr_qualified_cmd[12];	/* 0x150 Address Qualified Command */
 };
@@ -163,7 +165,8 @@ struct aspeed_spi_regs {
 #define SPI_3B_AUTO_CLR_REG   0x1e6e2510
 #define SPI_3B_AUTO_CLR       BIT(9)
 
-
+/* FMC_WDT2 control register */
+#define FMC_WDT2_ENABLE		BIT(0)
 /*
  * flash related info
  */
@@ -267,6 +270,7 @@ struct aspeed_spi_priv {
 	ulong hclk_rate; /* AHB clock rate */
 	u8 num_cs;
 	bool is_fmc;
+	bool disable_fmc_wdt2;
 
 	struct aspeed_spi_flash flashes[ASPEED_SPI_MAX_CS];
 	u32 flash_count;
@@ -683,6 +687,9 @@ static int aspeed_spi_controller_init(struct aspeed_spi_priv *priv)
 	setbits_le32(&priv->regs->conf,
 		     CONF_ENABLE_W2 | CONF_ENABLE_W1 | CONF_ENABLE_W0);
 
+	if (priv->is_fmc && priv->disable_fmc_wdt2)
+		clrbits_le32(&priv->regs->fmc_wdt2_ctrl, FMC_WDT2_ENABLE);
+
 	/*
 	 * Set safe default settings for each device. These will be
 	 * tuned after the SPI flash devices are probed.
@@ -1907,6 +1914,9 @@ static int aspeed_spi_probe(struct udevice *bus)
 	 * SPI controllers
 	 */
 	priv->is_fmc = dev_get_driver_data(bus);
+	priv->disable_fmc_wdt2 =
+	    device_is_compatible(bus, "aspeed,ast2600-fmc") &&
+	    dev_read_bool(bus, "aspeed,abr-watchdog-disable");
 
 	ret = aspeed_spi_controller_init(priv);
 	if (ret)

-- 
2.34.1


