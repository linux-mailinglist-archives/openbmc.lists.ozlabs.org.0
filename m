Return-Path: <openbmc+bounces-1353-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH12Ghp3i2nuUQAAu9opvQ
	(envelope-from <openbmc+bounces-1353-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 19:21:14 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0411E4C7
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 19:21:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9VHX1Ptwz2xKx;
	Wed, 11 Feb 2026 05:20:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770747656;
	cv=pass; b=QVE9QTRXG6QJ5N8x309WapH3GWJJY2g5TGVLyxjXvGxN2tWG0wPlZuu0LiJLgvnoNDPgA4Y/lbhFpnE1YXu1xEXEeyNC+zrbVuFldsaJsEBQ3CWFqp/o46upbOtdvSgWzhQF8bzBDmimAUinrfAQNApuCmEmzVrQqfIwUSJw0O7jo1Aakz59zCOwXUoLVGfHTvZkJOn1bDsvt2GTPxjab96qrnA15neLENLbf8do9yxRv1yg+aJ/2toKGs6sufKpPTCOJfsWh/13ysaDZa2SrnE+vDq2vwQWQ7lWcv5sqh/iuYC9OtLT+w19siDNb5iMtDY9LOLBSxg9lFOfRBm2Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770747656; c=relaxed/relaxed;
	bh=ErpXGOSBC0Cdbbpa9KjHyhup4KX7MqDLfRGIhaM3/U0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N2EXFlKMEpomxcORfNepNtEzkhANbsVnzJs1581gQiV9XrN+xknURIaoM/4tgRn+KdxdnnDs7hTUE6U9hoh7eLOzH8eB6JwJiuPKTDcsHhUQketpMKVjLeo9rWJPzGzOjAjOMusZp700k9YJzx1e4RVXDHng55aA5ZGWHYGY0uUHSM9p6jjYFrNm4AsWkd1976V3deT9IZRehd2ppOklmrs0NPPgf0IIEWNnu6xTm3NqsiJqR/3ELPiFY6yA2LwHs/m13sw9Gbq30PnmNAqbvzcopjJ6j9OLIjBHpsxZ+Tte/JVfPHvn8PmjJXG/DgmGZOodoPsalCt+qKQP8O2qpw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hLH9Lss1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hLH9Lss1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9VHW0yn4z2xRq
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 05:20:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP//uaM8eHL9N5wIPePyS7IYXGO0uGB0WgzM1Sgt1jPMkDdKK67H0uttmGy0+3VPuQCoEl1xhpPjIGMjMTd1ZAjzca+H9pL3oShI4hfFve0ZFPPyZXQtBysHO03HwVLB2HZbzAn8wMngMR4IzYlzV6resyJJF2Ev+KM5lVHf24be5sCqk03N6LDZrgfH+K04gDTUP5bK9UlN0G4/9QYsdiIrnSuhzlEeRqZwW7hYJcSMB0vR6IrAAS0m8NlLvrLKYIXCT0mAZHUOl29ZkBsUIx4iVKPnlMpEJ/Lft/0LpH72fHP8Y57YMoq3PsrDeSyjIsIChARhUzS6wbwqz48z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErpXGOSBC0Cdbbpa9KjHyhup4KX7MqDLfRGIhaM3/U0=;
 b=sv/2SZRsHgMzPV1IQvmols9A4cFl9J4HKR0Ax98nzfvxcnyusTDQm6K1HmYHGHi8dlLqUkwx8l8jL/taV0CTopfgBP9OE4e9Jxb+SPmRtAASg32z7vlSZA9XSqFEosk9JSq89G5i61q8PVvlY0agmLeTgYHtv5FAwBNobslkHapSfQdkHDg0FgBB6aIlzMDXi36fP+W1F/1PRWsO9JFDiJziNCzlOuDI7vXNxsmndKtJzh3QBWp+YMuCmIWywySUDJ3o/CuvJ8UC/78w/pF0NOTYfh40q30WNYD1NatFHONoN0uZbalqBP90yO5j5oQsxu4gH2EUpsJP43SFKm6doQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErpXGOSBC0Cdbbpa9KjHyhup4KX7MqDLfRGIhaM3/U0=;
 b=hLH9Lss1halDiW8byzNEn+jpi7mObOrqcFa73V3xbkd5nyCosSoiyi5k7mLsT+/KZh3otucAwRbRaKJUY0+cWfQAm7XZX63o4PUIeE0v8JslYT7oOc5K4J+akbP9oJSCgNtHPNYIKHnbymlvMzH6UWiIMH6SrcMuOsnimJZss3Xp5Asl7C+9851xcIhyoUyZ8KJA/RAwxz+F5Fje4Y4ZvBbT1QurJS3W1IUe5R+ZNRn+DaTKzSz6bqfXzDnNalXOuaR/4UZwpRnlmVHLE1mg0r5QbvXJsmrZiSuujiDH/dgOK7kEu36SaEVzysSKMYsGuxMVFd/E80yeMpMoMUW2OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by BL3PR12MB6545.namprd12.prod.outlook.com
 (2603:10b6:208:38c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 18:20:23 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::4558:b58:4d9:de9d]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::4558:b58:4d9:de9d%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 18:20:22 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 10 Feb 2026 10:20:02 -0800
Subject: [PATCH u-boot v4 2/2] arch: arm: dts: Add dts for the nvidia msx4
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-msx4-v4-2-7dbb1e223e49@nvidia.com>
References: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
In-Reply-To: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Marc Olberding <molberding@nvidia.com>, eajames@linux.ibm.com, 
 fr0st61te@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770747617; l=2748;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=kio6FHSn19q6+B1r1kaubItpMlbdHEcui5DS9ZwWqaA=;
 b=XD/qR9hF/kZphXPAJm40XvttJ25ADKiRtsnkIUwBA6PBTC2eDYzjkZHwX1Dl3xN5wixRI+Epl
 23SXxUHvK8SBaPLsUHSA8Rz33MmYeOwgd1+7Xsbw51Ix9B7WSkCV/5t
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0730578a-915d-4e80-8216-08de68d10dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1lJQVNVdnV1OUVJTElKNWl5MGtiRzUwZTVEbFg0SkNBR2dMV2kyYmRPdWtx?=
 =?utf-8?B?dnFVMllraWZCYlh4dGhxamlSVkg3elZUUnFuVzNuVjNhWm1RZkw4STM4NCtQ?=
 =?utf-8?B?R2sxVk1kWUNXTE9FbFZWRXI3MEZnOTY4QTZ1cWpXOGVBR3k1SlNaVkJPcDE3?=
 =?utf-8?B?RVgrOGNnWjdLQTJaS2FiREJ0VElhZlRCaGlzb2lvcm92ODB6UjRNclhhNWpt?=
 =?utf-8?B?cFZVSWhBZjUxU2hKMnZKaGtaUzA5VHlnbnRYbitPTnRnSVFPS0hkSFAwSFRX?=
 =?utf-8?B?anBUUFlyUThTT3ZVSStra3BsU3NRV0xlZmE1eTdDM3Frd3U1ekhEQ3dtV3BQ?=
 =?utf-8?B?MmtWWTMvK25YTm1YcG5FZTBVbHdFbFpBUnNLdUd6dWp5ZE9BOElxYkpUTk53?=
 =?utf-8?B?b1RBaWJkTG5qdXBkYTlVeWh5dDMrOEExYVlCRGlDNUhCOVdwMW1yaXVXOC9M?=
 =?utf-8?B?K1hvN0JoVzQ5bFI2MHpaNm56OHIwczNmNi9IY2E3dTlmRkx0V3JyVzhEVFIv?=
 =?utf-8?B?M08zM2VTaGE0V0tVMmx6cEhmR2JNZHJ2ZndXOHFVNC9POEErWnUzZkhPbkZM?=
 =?utf-8?B?Tkl2amR0Z01EMjVPckRBRU9pRG5MUGZJZ1FvQVFFLzdrNEhYTTVrcUlKWi9u?=
 =?utf-8?B?V1JxSzlQNmxtTmFZS1pZbWtNeXBQb2x1UzYvRzlYQ3VQY3JoRUUvYXQrMzB0?=
 =?utf-8?B?eS9nbzdYeGJLdTJKRzNoSXJsUjNtSERNSVArQmx2MEszdlVhbitEb1NnanRs?=
 =?utf-8?B?TlZMNzk5ZTcwU1hpV0syeG81elR2QWVWdHJQczMya3gzMmgyN09TTUZKNHZQ?=
 =?utf-8?B?akJSeU5VUVN6ZTViWkhXcThKM2kzNG9taWpLaU5kd1VDSU9VWGlib09qY01O?=
 =?utf-8?B?SHlWaVdoSzRRVytyL1ZSYU94eHdPTmRGZzNBOXJMaTIrbk1obXJHdGppWUU0?=
 =?utf-8?B?cExMS203eUMwRHZHangvVHlVSUJlNDhhTndNYTU2WkI4WXZYbFMrTkN2WUVY?=
 =?utf-8?B?WEVubEN1TUR3RjBwWStuYnlDR1ZBQkxKRnovNVMwUnRoK3p6U2Q3Rk5HOUtt?=
 =?utf-8?B?WUJSV2JxV0ZnL3UxWlFZQmh3dVJ3MXdoS1VXWEQwYUFtT1I5MnJ5S1ZNZEdX?=
 =?utf-8?B?Q2Q1QjF5MllKSmR2Mm5lYmVKaFZLaHhzSHZ6VTJaZzh0MUVjejZ4V21YSHFv?=
 =?utf-8?B?anUrS1hWUnZkbDJwaU5jaHY1V0xpM3VrenVWUzgvT0tIdmVEVUVaWmZwS2xS?=
 =?utf-8?B?VGdDUUJCN0FMWDg3eUZSemVRbjVDekJScE9USkZDMFN1NEdkVEZPSmtLS1Yx?=
 =?utf-8?B?NmNhYXZBV3hOOUpkcE5rSk5LRHczVHZIZjhENGgwcHArVXh1VUpYNHc0b3dP?=
 =?utf-8?B?ajhwcC90SDA0THNyQ2pMcmMybXdvdXpZQlNKL2hCNEtlc2VabzlOWVZBZEtx?=
 =?utf-8?B?M09hb0FKMzlCYVdUS3pMSVFaNHhKK0U4YWNFbjMzaTdXNGg4SG1MbEtXWEY4?=
 =?utf-8?B?NHlOc3pEcWN4djNmaHFkWUFMejVETDNXN2xpY2VnTzkzb0FkcDQrRlhsMmhr?=
 =?utf-8?B?eHZ4a0VBYTNvNytSYmo3aENEQXlEVDJuVGVuMmZ3Q2Ftb0hFYk0xZWJ2Rmgr?=
 =?utf-8?B?bzBrMFRPSE1YWGJXQmJUSytCdTB1QkdwUnYzaE9Ud05TMXZPeUg0aXl5eXoy?=
 =?utf-8?B?Yy9XR1VFZXphOXl2MmtVclZnVXA5L1Z2MUFHVEtpb2RkRmdGUVRUTWV4SWEx?=
 =?utf-8?B?UFhSK0tMeW9IRUVvbWlmMmpPeWlUbW5uMEVTTmticXd3bVFXOFpXem95YkRB?=
 =?utf-8?B?c1NRWTlTemZIY3dvSEVqejg1Y1N5QXV5T1cxYkcvSHQrMEl0WElTYWlJaU4w?=
 =?utf-8?B?ODZzVEhuSWlLMVU3WVlqRTFjRElYa2Z1T3ZNTUs5RVpvdTh3d3R3N3V1QjdX?=
 =?utf-8?B?Q0dKSUxCV2RFSnp3SDVYUVozQ1ZyZlVmb3JpVmFlc2J6eVFnbmptT20rZjdE?=
 =?utf-8?B?ZmNET3M5UE5YTUh6dzlVNW5hcGZVSjN3ZVBlRVFtM3ZtaWJFWjh1ck1iOVNt?=
 =?utf-8?B?WUh3a3VrNm1PdTc3S0p2Z2huR0tqNG1yd1d2MmhTaXpFTXFvNDF4WGZrNTFo?=
 =?utf-8?Q?gzKI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFlQdWVBNUZNOXd5TStxWVowNUQ4TlFhS05YYWU3WnovbkwrOEZpNmsvak1K?=
 =?utf-8?B?bkV0amZkZXB0aDBGclg1QXVNMGJlYVFYRnlYamk1d0ZrTW80Yms5dGpMN0ls?=
 =?utf-8?B?UXZxcmI3d1RseWhKRjZRZGlxc3V1SWNlWFI0LzR6ck5Mc3RPYkpWaWxJbnor?=
 =?utf-8?B?R29QcUx5b0tvMkxuS0lBSkQwQ2ZTbnd4WlJGcFVyNElTKzhjT0JmWGFaRnRp?=
 =?utf-8?B?UDVjK2pzVUIvU2hMVlhXQkVHa1ZvakpkczdINk5ZQ3VIS1cvMEtQRVd3V0g4?=
 =?utf-8?B?MjduT29NbXN0TXc1K21oRTJxWU8wV3JXd2FzSzBJN2VtczRTR3o0Y2h1OHVX?=
 =?utf-8?B?UENWcSthM1VXMDRzS1czTkpJMjJFNjFrWHdFbWM2R2haUEZHdHdTc2Vwdzd5?=
 =?utf-8?B?dlFMTWRkYUx4cUVFT0lhQyt1VUYxWk9KVjVDbS8vSmxaSHBkTC9FMWdZTXk1?=
 =?utf-8?B?dlVkMU5IdTlVTmdSTTkyZHZkOXdneExNL2FmL3FEOWRGdHRLZEFDUTd1aisw?=
 =?utf-8?B?RzZlUWtqVWNtK2p4RWR6blRMM21weFdodEJkbEdLTmFseHFVOGwxbitseUlN?=
 =?utf-8?B?R2k5czZPWXFpYUZNYXRKWUdLRXdkSDhHNm9neWtpWTBIc1J2TElWNEJDRUh6?=
 =?utf-8?B?Q3kvL2UwMU9SMnVZMEw2V3prZzgxWEkwT29EdlpvSDRCMzRZdysyWW5yZ3h5?=
 =?utf-8?B?cDdVOTVBQjhaSVUwSW04WDZKUTh3cjc0eUJYNXdZL0N3SGZPV0xpV2R4WlZo?=
 =?utf-8?B?V2dCczJHc2ZyOGRZT0lTcFNCNDdKbVJtY0dKc2UxcnlpUlB6K0NPTW9BeXBF?=
 =?utf-8?B?cXpkcjU1c2RhaWVPNlhZWC9YNTc1MDZTZWtZdmM1cGw2YkMyZjdTWmtsbjQ3?=
 =?utf-8?B?MXdyTFB4aHFkOUdmOEhTcUxQSlRlWkhWOFVhY3FnRlkrenpqK1BaMlpxTFRV?=
 =?utf-8?B?YzVEQmtBeWRWZk5lOW1VZU5MZE5iMThkUm9HN0phKzhlaWVIalQ0c0VVTUVZ?=
 =?utf-8?B?QU5mT0FCRGlLSWpYY3B3Vy84ZzJDUmU5TFB0WXpHaCt0VTZuaWNIbksrb1Bl?=
 =?utf-8?B?R0pVSDFONXR0N0hGeVoybGJUdi83cFVJY1VqaHl1S3ltSEVzc0RHa1dOSTVj?=
 =?utf-8?B?R0dPdGxpckc5cmplaXpWdE9RMDhleHlELzk0cjJOUGN4ejBQYmVHMDdHaVJ2?=
 =?utf-8?B?ZTY3WU5GUk94LzRBQ1hKOHNSZitNbmhBN2RnSXVLUmUwV2hWMGVpaEprOG91?=
 =?utf-8?B?T2lQMkdROWN4eThBeGRhS3ZrM2R0aWM1L1EyYllMSisyRWlYbDdCSXFxclRx?=
 =?utf-8?B?NE15K1A4eWsxUWw5aStLTnF2WndMRzNvd092dkxhaXNvV3NZV2hpSHVmUnkz?=
 =?utf-8?B?ZDJvWDdtSG90dDVlazFpc3ZNcC84WnF5VEsvMkZ6REtuSHNjL2FyaC84Syth?=
 =?utf-8?B?QVlsUTBYVzVkMi83bDh5OXVOMlVNdHZUR0ZlN29pWlJteHZpZnYvdmxuQ3hr?=
 =?utf-8?B?Y0xDdnhQRWF5eFYzSmVwN0ZFdXY3cHlMSWZraUZHeTZHUEx5SjhDa212Qys2?=
 =?utf-8?B?aWZsb2pmMU5SREVvZkZpQW9sNUEwTVoyRzJjWXozbnp4LzcvMjE4VXdYdU1J?=
 =?utf-8?B?YU96Sk5LZ0hXd0hEUEM1U200N1p0dkVVVGIvbllOSjg2djlaTE1oVCt6K3NE?=
 =?utf-8?B?YjlQZUpucExTMHVjQlNWZVhQb0VBVTFCYm1NUm82QmJZRXpsVmoydHBMVWRn?=
 =?utf-8?B?NVpaL0NhcXRlSDZhMWs1YmNyV2J4TGhINGE0TE9UcmJGUlFNZkhwYy9Ib0Zv?=
 =?utf-8?B?QjdrQ2o1OXlhaWxrRHhqdmx3aTJqUUF0TExBcmJRbEp5bzZaMnp4ZmlPalZQ?=
 =?utf-8?B?TVk0cmRwWDlUTEZDbFF1VUM1VUV2QmNCNTlVai8zYjRyaGtvZERwcjNZNTlI?=
 =?utf-8?B?VVJWVWZXMldqaGNsbnd2VE5ZZDZjb0xITHpNdVlRSk1reEIyangxQ2NnNmNB?=
 =?utf-8?B?SUZ3US9Ub3E2ZGgvcEd5dTVuUU4xYnoyckltUjd0U2dUMEJRYjAvMG1peklJ?=
 =?utf-8?B?UjF1Y1N5aTVPMlA0UUJrcHBlaTVpcmxmV0pKWUxsSXNQeE9HWEJ1cnc0S3hs?=
 =?utf-8?B?RkUyU2FSRmJSaWtIRmtVbGVLTnB4Q2dmaGFDMHlRamxqMlVJUlBqYkVtdDRy?=
 =?utf-8?B?dzdvcml0eGI3RUE3NDEyRjhhRmovTkxuN1pkb0poVHZNazNadlUxOG1XYnhP?=
 =?utf-8?B?eU9DdUFrYkN5ZkFPREdreW5vL3paVzNUaFRMRVhObGZub3dGOXRJUUs3bEcz?=
 =?utf-8?B?ZmtlL3A2RHdKelVGUjU2dTFtV0lLUklxbnQvTURObDZYL3c5V3RYQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0730578a-915d-4e80-8216-08de68d10dbc
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 18:20:22.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RqxvpfdZK1tNzQZFZaKwq51CdowIn0E1l/QJE7UWgaMPNyjQAN609fPJ2CbRkQbqO21dGgwCdZDsQlAMCxIpg==
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
	TAGGED_FROM(0.00)[bounces-1353-lists,openbmc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,0.0.0.0:email,0.0.0.1:email,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 55C0411E4C7
X-Rspamd-Action: no action

Adds a dts for the nvidia msx4 board, a granite rapids based motherboard

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 112 +++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index dbb2fafc4f..5141c3dc3a 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -689,6 +689,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-facebook.dtb \
 	ast2600-fpga.dtb \
 	ast2600-gb200nvl-bmc-nvidia.dtb \
+	ast2600-msx4-bmc-nvidia.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
new file mode 100644
index 0000000000..9b64f7e734
--- /dev/null
+++ b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 MSX4 BMC";
+	compatible = "aspeed,ast2600-msx4", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac0;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&display_port {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+	aspeed,abr-watchdog-disable;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <10000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <10000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&hace {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy3: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+	};
+};
+
+&scu {
+	mac0-clk-delay = <0x1d 0x0a
+			  0x1d 0x0a
+			  0x1d 0x0a>;
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+	aspeed,ecc-enabled;
+	aspeed,ecc-size-mb = <0>;
+};
+
+&uart5 {
+	status = "okay";
+	u-boot,dm-pre-reloc;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};

-- 
2.34.1


