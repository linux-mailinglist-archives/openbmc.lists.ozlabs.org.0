Return-Path: <openbmc+bounces-1352-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAiaKwx3i2nuUQAAu9opvQ
	(envelope-from <openbmc+bounces-1352-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 19:21:00 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714111E4BF
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 19:20:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9VHV6dSCz2xN5;
	Wed, 11 Feb 2026 05:20:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770747654;
	cv=pass; b=Y2qz/U2iNccj/vLJUMaQ9vN5aHB80JY59VpPM7x5Tz94j5TrX8AlFWfYiVKU76bwLNhxxp5Vdwo1o78rmXw/03jCEneu65wkC76ddNUV+hJBkIYNyfkv/gXB4E6Uu/eKwwy0xamqm5tv1S0H5jKfOf3NyBo65RFs1AzNb6d5shxi1kZRmBEsJTcu+wVT+SwHTGDFalqkbmXEXQ9qdi4VSGU8Y6HSEdOnYCCllswHWVNbxQRgw2luFN1/a9msTU6bSfVGnV8p6gVW85W/OdPG/oWUb72zK72niOLVeUKX/uAosRfDYIrDqYiY1GxFIqVgd1AftJC8tsZs7Bg0Df4qjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770747654; c=relaxed/relaxed;
	bh=GynQ6xPpGt/TC5GrzCtQIqGlIBJTzyz/zTj2oC92Rzw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=h+S+9nA7qFLRU/Kbhv4W+m4cA6T9rayxIcdAPefPhheWm3ZotLG0mEn+23yRNM8tbhMVIvC8LH3Mu2KI7V5JMIepNnEKFEDHO7TYGFRRZ7X4Bxx7cMkDCo5UJICYnkH196RDVGIiBkimxd64ynFUiYsVq3KAnde1ocYiUvPso6JwdcIY6EbnHy9NdmvRpiLmwvG9cgRys55etzI7eDJsIIIUjG4KfzVLx+hWUK/2g8faUiEIVhk+H5BcVlwmkh3KJCFq4gu+rESq/h3coulteW/YdnguW03JuS12SczTVLwIHRO8jNMkmlhaI9Zat6N45XEBPYythA2vperJswvVQQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nOSkE9wF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nOSkE9wF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9VHT075Kz2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 05:20:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCTfOOJ1UyILBSpdQHklS+u+FtxoeojsZgmhaeLvpnhYew6eOvD1AW8O3O2QyiNBugwyEBZZtzaMQkBKGFrf1hjJV2xqLwus1Hj0W3RBivYeeEA58xayHHJr7xXvMiFykDVmwsBtnmcW8jJCJelYmwD3yW09cROjO5ygp8YbgQhzf6HppmD+RTFO523C13nf3HghQhbiMcZRQrvC4kgVRgEm1iuKitzSzfDj95ybN8ltgJKOzJLXkjo3GIje6ZFp9ycWj3+kNUcKfhFCz/2VlsFM8APYRXee9rurpYyQZsUULcwjr2UQ4bEgEgxGj1edGAoHnI3hy3QfM6mhLXRoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GynQ6xPpGt/TC5GrzCtQIqGlIBJTzyz/zTj2oC92Rzw=;
 b=Z4On7U6tZ8TrcdypAHkM+bbj/TvxZqejcvXgVS3bhDgA7BexWH/HuZbMe5XhTiDGTr2cQEHItjSbKL67X8UE1n/gnePjEmENIZk8G4U16ifF1buK+B4GicZs2Nqqfw2ojJDl8NDvtWvw0dnPMe68tdEEAMPdjUIRbpk75Su7uQiBIIEv9qxCaxg8amL20d7Ymkhhco945Uf+oKVC1WK3bEFpSLNJ2kApwOkGvMlQ0g+48sxlWTxwwaL1wCmoTI4aH5HJRXiXJ43qgZqsdO9EhcUMzy8tXfIBjvd2Gyi3qLN0nldmxBNuEgkyrjaFNbuqBNcaFWFVfqNMuM/jYpqW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GynQ6xPpGt/TC5GrzCtQIqGlIBJTzyz/zTj2oC92Rzw=;
 b=nOSkE9wFeJeXTwocqlr6vlGGEGUxkEHIVeU4xuLmlkFOUMxF/aDGFTdtWex2Z5m0/edS84cRrW2WZuX6K70BnjpEjwbovuW5NIl4QTgtoC2cCyCs6C++LDptu5QBXayrPiLglXwN2gV5SdZePLGqBDwxfLycAmqxxDz4dSkV5yovmvStm1udgxFfBGFBmec/y+pshMXyETfDmaLuEoqZ2l7nTEaNo/10mU1rBHTr5vE4P1/JiYPtZzmflJ8mJUXzZEckjAKgW8YforC81Z6QBJXAC6qLstnW/dieqTGce/i9pBrAcvSuuaJPFjG7TZdkfxUAAeIhsB1PUAUSdKHJxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by BL3PR12MB6545.namprd12.prod.outlook.com
 (2603:10b6:208:38c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 18:20:19 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::4558:b58:4d9:de9d]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::4558:b58:4d9:de9d%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 18:20:18 +0000
From: Marc Olberding <molberding@nvidia.com>
Subject: [PATCH u-boot v4 0/2] aspeed: Add support for MSX4
Date: Tue, 10 Feb 2026 10:20:00 -0800
Message-Id: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANB2i2kC/2XMSw7CIBCA4as0rMUwQLF15T2MC161LFoMVFLT9
 O4S2kSNm0lm4PsXFG1wNqJztaBgk4vOj3nhhwrpXo53i53JO6KE1gDkhIc4c6ylAUst7yRrUf7
 6CLZzc8lc0RMr7yd0y/fexcmHV6knKK9biMIWSoAJ7jQBaJQQQsNlTM44edR+KIVEPyqPXdGsp
 CC14bxRhtA/xb4UiF2xrIBLrohmHavbH7Wu6xtCufMzDQEAAA==
X-Change-ID: 20251107-msx4-cad1e2e4fa39
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Marc Olberding <molberding@nvidia.com>, eajames@linux.ibm.com, 
 fr0st61te@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770747617; l=2514;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=klYZDYu2UlumoMI5S5WSy4jcS66gzsNghdy2SPPmQvE=;
 b=sMal8QZFPHh4xaYhjo61iZwPYahUBveymzwxZgXcbSpk0uhdgFMAGONOopYm7+CSn5C86A6sw
 fMlf9wkJLyeCavVqBOMCU/rRLdkJe0FZpM8kp7SWpy45BEsHuzXEPv7
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0350.namprd04.prod.outlook.com
 (2603:10b6:303:8a::25) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 4a493241-06f7-4015-00ae-08de68d10ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzBEN0dHV1BlUlBteWNKSTNmWE9GVFhVU2doelNVWjRGYnVKajljM3d5OUVa?=
 =?utf-8?B?UEFkYkVrWnZjejZnTS9kRDVldkg4aGwvaG96dmtJaU1sd2k1WkJiZlExSlNW?=
 =?utf-8?B?Y3ZNL1lZOG96TGNlbnVmSDhGM1Bqb294Vjhab2tmUENqWlpEcEFhQWlUVDNL?=
 =?utf-8?B?ZUxubFRLdlE2bk8zSVlhRy81V3BRUnRKamk1TkNMOFR4WlRJZXprZE5pNDd3?=
 =?utf-8?B?UDNENFFPYlExbFJNRGFjZzhacFBGSUdkN3RzaGRKTWVXLy85eGRMS09qSDQw?=
 =?utf-8?B?RlFLUnZub1NjRUhEcy91UE1KdXFwVVpJeENWZlJ1aVorR01CU0RLbmc0c2J3?=
 =?utf-8?B?RXA5SDhzS0VWK0ZBRkcveFc3eCtrZ2h5dHN4Qk1NdVdQN1FDalVyM0h4QUJK?=
 =?utf-8?B?SUYwTmYwdVdxanpRNFdEaWZ3UFpVSUFROUl3OHJ1ZGNSaGRGYnl4aEhuQXpQ?=
 =?utf-8?B?RlBiN29mZWlxSmlUSTl1VnVIeU5RQXI5cTBIbkdkMEppZnRKd1J0NW9HTGRE?=
 =?utf-8?B?dTNCY1p5N3JKV0x5RVdIL3dLb0w3OSt6NXVad0ErRHBwY2FrRnRjbDVDdTlK?=
 =?utf-8?B?NlZRYzZjUjdOOWhwTDZvSkx3dHNEbkwyRkhtU1ZyMVQyM2c5SlhtYmY5R1hB?=
 =?utf-8?B?a3l0YzNPZVRuQzFST3lJdWl3VkVuaVZkSExKeUFLQWExV0d4czZXMXRwWCs0?=
 =?utf-8?B?alI3VUpEUUdsbXBQWE5vTVIrTU9haDNhQ3krRDRoQTQ3a1NQTzBKelpEdjMv?=
 =?utf-8?B?ZVZjUVVIVC82bEQxbldVYXpCK09JcE1MSnpHZFlma3J1Ulc1bkUwdnY4clFx?=
 =?utf-8?B?bXNXeTFEbjJaalBOU2RoWTA4QTlRa2JqeDk4QlN3d2g1OHBpNDAzSWsySVdR?=
 =?utf-8?B?TWVUOWQ3Z0VCZXc2M1ZNcGlBWE5MUHBqOEgvUHQrNWJVVUhPbStWRUtxTU5R?=
 =?utf-8?B?YXdPZGhBd0JNdllxVVllckZhVXdzdjkrSFBCT0dWeVNLb3VlU3R3cXBBV2Nj?=
 =?utf-8?B?TXBlTFBQcll5OXRnTU9peUNJaEhER3p2cUZHTk9naG52di9NV2lTM1NMMUUz?=
 =?utf-8?B?UUlXS0E4YzlOd2o5S0QrNlpmWElNbGJOa0pYeGRaTWhrcWpVRzgvTzNEaFFS?=
 =?utf-8?B?WlBicnpXSVRxRzRFaWF6aStGQXRLcmdqM0N0QjByQTIvVnh4RXRMd2s0MU10?=
 =?utf-8?B?TFNRVEQvVk41cmZkbGdsbE1kWW43blVmWnozbzRjVUk4bEJkRitiZy9wbXUv?=
 =?utf-8?B?RmpIc3hUcmFXeWNJT3R6dGZQTGtNeENkR1lJaGJRdW1jM1U3SXJwRnRLV2dS?=
 =?utf-8?B?OE5wTzU2MHJTc3pKOGc2N3Y4ZjVmWlNjSGpIcWR2STFLNFFSM0VUOWVrWGZn?=
 =?utf-8?B?ZWZQMXA0SStYc0lDQmZDNDcxenUwaWJ4M1l1ak5WR2NRZUhmeHpneUtlZ2p5?=
 =?utf-8?B?RXhXdHY2bnllN3ozOS9EVVlBeWs1NDVvWStKTG8vb0FtRk1mT2RaVCtuNDVV?=
 =?utf-8?B?K3ljRFJuSHV1OUhvTmk2YzRrUkhCZW9vODlaWnovRFhHeXdHK0w2b1dTNTVa?=
 =?utf-8?B?Smc2TEFDMlJHNVUwc0xGOHhTTmlvVmcvS1JDUzNVWVlkeCtyRjZxWGxTTS9M?=
 =?utf-8?B?ODFGS2xPdDhwbkNwd0V5Qzd6TEpkL0k0aGVOMFR3UlFDclJJdk9FdGhRbU1n?=
 =?utf-8?B?Q1ZmUnRNRUlTeUZuQ1lCVUhrL0FaeTUyNVl6TW1JVWNFYnBtdjZZWDZRTFAz?=
 =?utf-8?B?aW5zdW1hZElOM0RzMjRPbEF6aVUrVkFram5BZCsrREVwR3E1UFllcWlWMXJ1?=
 =?utf-8?B?QTgyTWlGTXZRbGlvczZSUUI5aFBHcWpLVXZHVDR2cXNrUWVUdTFDMGpqcFVs?=
 =?utf-8?B?MTNLbWxwQnNFTTFoV1VpQjNjT0tKQkJMcVQ3b2hnNWZrTVVNZHR3aHd4RytK?=
 =?utf-8?B?NFBhbFBYSFNsN211eTlGMWZwQUpHbGNVaE01ZUdEOExid3prTndaN1NMT3Aw?=
 =?utf-8?B?eFdJdFBZMUUvRGlzYnBTSXZrd3pXMWFMc1E1KzlqNVdWeTJoZ0NPalFsOWNM?=
 =?utf-8?B?bWlwTVg2RGNJTDcrTmkrYzFYeUJhN0lBTVpJTmcyajBPaExCTlJEbWI3bEhP?=
 =?utf-8?Q?z3Zk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b05IUjhqenpreFpyUkRySzgzZ2N2UFZOeWxCTmZzZStFLzZPOS9oVjlUblZt?=
 =?utf-8?B?YzVtbkdGSStqaklIckRERFEweFlxanhmeXBremtDSWJDaGtHaS9ycnZFWmhm?=
 =?utf-8?B?N3k4Qi9GeExzemt2MUdGYnpVdWZGTEg1RGhoTTFMVkk3b0hWS3pVMzJQcW44?=
 =?utf-8?B?ejJ6bGlZTHBqM3VZQVRoSytXSzZZTEI4ZjJRdDczcWRJTXI3MVJwTm5RNnZy?=
 =?utf-8?B?ek9PMjQvN0IwRC9VWkZEbmZnSlIyRWJDUDB1cTlNRGF3TnVMdTYrMkI5VC9U?=
 =?utf-8?B?QndCOXZ5UXFiWGtCWHc2YS9XQS9wVlVEMkQrOW9aNVlIODM5djRhWnFQMG1K?=
 =?utf-8?B?MnVEc3c1MjhtQThnVzFaWWNHejZwRk9ENGxrNTg5R2JoZlVQclRQZjUrVWtU?=
 =?utf-8?B?bmVlN1Uyc2Y0TEs4a3B6cXc3N0lJUmZOTmN4UWhwOThGSjhYd09yd0I5NlN0?=
 =?utf-8?B?QzJsZDN3cklJckFlb3ZBSXZFaW1DRUVlbUxDcFZwcVFoNk9yMHE3bXllSklJ?=
 =?utf-8?B?UUVUVFZRWnFOK2YreGtwMklxbFo3VDRZOVlPWFdXcUFXRURvQlZoVTJ5UlNC?=
 =?utf-8?B?WDdEQmdBT2gzWWphcC8vQ3FGdmNOVmxLSFBQbEs5N1B6L1E3VXpXTkoyeXA3?=
 =?utf-8?B?S000MjdzNzNQczNWbm1LL2JKbjhYZGxxQUdyL3J1dnluN3k3WE1ZQVFEZlg2?=
 =?utf-8?B?VWhMRFhSUW02VnV5Wk02ZVh3bjNZV0Mra3JGbnQxVnluK2RhTWdrM2EzR3VU?=
 =?utf-8?B?KzJqNElDTERhYWpwN1BPbXpBSktwdTZ6eEFrSXAxbFVGcXVzRkpJN2owUm5r?=
 =?utf-8?B?TVljaVNzUlgzb3pzRi9lL3R3bmh2Y0w2bzlwMmZJNU9RWkVVNERIOGxIaXhq?=
 =?utf-8?B?dnFqMzlxOUtvSzJ1UTBISFBna3RuTnpFbGxhcm1UYkpYc24vNStPMkNHbWYr?=
 =?utf-8?B?NmY2a2VnT01Ldm13eW01TTltTFF5RXNrTEp5SE8wVi93OWVsS3ZTMTlnb3hF?=
 =?utf-8?B?WUptWndrc2xHcHlack5iQVJSMUo1VGhOMUIyUDRWeVJ0emJiVkMwNWxuN2tt?=
 =?utf-8?B?QTdZQVdjbEZ4Zk9jTlpiSHdqeUJNMVM4UFdxcEVFakVRKzN4QWNhQ1hQdnhF?=
 =?utf-8?B?NEk5KzJNOS9XU3ZGUSttZkMxTWZzZExJRjMxNjRPRlljWFNmNGxyS2NkeCtZ?=
 =?utf-8?B?VTZwKzNrTjBETnBySWFyVFJ4OTVwZVNRVDRWL3ZwWXBsQ2c2eW9vdit6Wm9k?=
 =?utf-8?B?L1kyY3dDL0tCcUF6VWxjL0hQbFJWRnpEanRvaU5xRWlTRExZcXFiYkFDd3lt?=
 =?utf-8?B?ai91WW51dTV5YTNBS0lmbGpDR01XWGZuNy9ZMFZGR2hyMlZnQmNuZnJRRSsv?=
 =?utf-8?B?cTlLV3JxY2VBRlpRVWJqc2VGa0p1cWs5dlBiNlVWdFNhSTRaTitENmdaRXhT?=
 =?utf-8?B?eG1yeExUOVdtb3k4VGsvWFloZm5QVk9WR2lZby9GbXRvaVMxWStkV2JOUjZz?=
 =?utf-8?B?TG9WdlNKRnRLQUxxaGhpWGRTZkxwWS92SmdGQk9lWjlxT1FOcTVnRUYrS0di?=
 =?utf-8?B?VDZ3R0t6ZFRCZlR4M1hmcmtnVE5FTlpSZElaYzZmZEFia05oZ2g1b2xURmlZ?=
 =?utf-8?B?RzZYNlYyNGdqU3pVQ3BOeGhJa0l6QlJTekt2NGpoallBSHY5eWdOMTRmMzhL?=
 =?utf-8?B?L01jdWh6RGFpNmU4R3dyeFV1OEJxQWNDdk5OWFZUakJzOFZtQW83R3RNYVdL?=
 =?utf-8?B?UFRxOStHZkFEWUYyTnhOMVF4Uml2VHlMSDlEbkVUbFpEaVJ5TDZXZUU0RkRy?=
 =?utf-8?B?K2ZNWHFob215YVQvUjVEbE5Nc1lPUUJlMWkwRjlncGdLNUxMZXBtdjdGWjNV?=
 =?utf-8?B?U2F2T3p1anZTcllzZzRVVzB4VmdQSmYrZTFQYzNZR1BqVGtjWlY0RmRJdmd5?=
 =?utf-8?B?dnRWdWExbGtBNVdVQUVOM0xLS1FDRi9LOW1TOWVEcFk0L2xIWWsrS1h0cHFw?=
 =?utf-8?B?M3A1elpyUXJrRWtPaGNvUW5WNTRxbllkM3Bpb2tiZEQzT0h4NERFcjZTR294?=
 =?utf-8?B?QmxMRzhpTUNjRWY2bDNlV2tHR3pzNG9NNjN1MkxLVHdTYWlac3hhdGJpb1Ix?=
 =?utf-8?B?ZTFmUkNKYkhTRGZhTUN0Q2lzeDZTSEhmeEc1MlR1N21KRTE0eTVkTFlqSm4z?=
 =?utf-8?B?WDJJNEc4eEJ0YUwzQngvN3Z5enFsa1BDbmV3VWF0ZERLWXVPclkvR1BiaUpL?=
 =?utf-8?B?ME5jM0lHWFAwTGQ2b2grazBsMTdIa3hPbEc1YXRsNGR4ZW5uNHBPcGRNQWFQ?=
 =?utf-8?B?aEJzM084NEJGakJwSjNwMVhBK2w2eDhhVUlxRzF1OEgrSTRZdXdEUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a493241-06f7-4015-00ae-08de68d10ba7
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 18:20:18.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMS/28AcbgGg10PCIYEHqbQJ3UUIuZtO8ugLhlcn5RvH+rd1zGzDrVPU7GSv+k2tLLsIIqiqOoCcDvuV/hehCQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1352-lists,openbmc=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:url,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 7714111E4BF
X-Rspamd-Action: no action

Add a device tree flag for the FMC_WDT2 to be disabled.
Also add a device tree for MSX4 that uses the aforementioned flag.
The MSX4 is a granite rapids based reference hardware platform module
for the CX8 SuperNIC Switchboard. It uses the AST2600 BMC SoC for
out of band management.

Patch 1 adds support for the aspeed_spi.c driver to disable the
FMC_WDT2 via a device tree flag, aspeed,abr-watchdog-disable.

Example usage is as such:
```
&fmc {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_fmcquad_default>;
        aspeed,abr-watchdog-disable;
        status = "okay";

};
```

Patch 2 adds the devicetree for this board.

Reference architecture for the msx4:
https://developer.nvidia.com/blog/nvidia-connectx-8-supernics-advance-ai-platform-architecture-with-pcie-gen6-connectivity/

There was also some discussion of breaking
out espi_init into a seperate function so it can be reused between
different board files. That will be split out into a seperate,
follow-on patch series, since we're no longer creating a new
board file.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Changes in v4:
- Change device tree attirbute to abr-watchdog-disable
- Cleaned up WDT_* references in driver change to FMC_WDT2
- Link to v3: https://lore.kernel.org/r/20251216-msx4-v3-0-14a4b0c3f359@nvidia.com

Changes in v3:
- whitespace fixup in the Makefile changes per Andrew Jeffrey
- cleanup boolean assignment for disabling the fmc wdt2
- cleanup whitespace in changes to spi driver
- keep consistent ordering for status in dts
- Link to v2: https://lore.kernel.org/r/20251202-msx4-v2-0-a605d448bd02@nvidia.com

Changes in v2:
- Switched from using a board file to adding support for disabling FMC_WDT2 to aspeed driver
- Added the new device-tree flag to the MSX4 dts
- Dropped board file for the MSX4
- Link to v1: https://lore.kernel.org/r/20251121-msx4-v1-0-fc0118b666c1@nvidia.com

---
Marc Olberding (2):
      drivers: spi: Add support for disabling FMC_WDT2 for aspeed
      arch: arm: dts: Add dts for the nvidia msx4 board

 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 112 +++++++++++++++++++++++++++++++
 drivers/spi/aspeed_spi.c                 |  18 +++--
 3 files changed, 127 insertions(+), 4 deletions(-)
---
base-commit: 8e15f5c0b1e7b11296ae6c88b686e65d509237d0
change-id: 20251107-msx4-cad1e2e4fa39

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


