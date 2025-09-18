Return-Path: <openbmc+bounces-659-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12BB8726A
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:34:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS02VVpz2yRZ;
	Fri, 19 Sep 2025 07:34:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231280;
	cv=pass; b=Rij+HGJnK2gtEM8y6DTWfckQLl2YSYOWzvKKJ5iVyOUoyHtcO5TfUUskeyNj3FOU9AbhFCqw6H8eof7YBu4REzzbVpQXcJ5UBKyuEkPxBSChtf13RnfQC8hrKLD5wynXV2iftzxiaWVoD6BSs2h3NpMzVkYXk0f1ZPyIysGmu3NyqXGmytEwgkhQNxMYHFeDFTmdK5lrsVUA8Hs645jwhmQu1nEYnkRGnhuirqDgwdEgccBS4iLIW3r2xnbwbF5b3orrk1+xecNrbB/nWC3iRZEhiWog51O9liK5wzdFg067WImGGoStx6+kLXp7UpFfken8G6Dm95UNgZHPzlqWVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231280; c=relaxed/relaxed;
	bh=2gDVgrOkRlQAG8efALaumiBZ1el58j98ZkMQYUmNEXI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W78XeqlIqc7KB6lu21M3tTOHGVLIz5qKq+BVJXs2U4IUv8t5u3dDZ3zvDfPPvm7d4GlWi8qlDVEJUcePmSjZNhBvGr+SNu3w/YC93tRCiYbsRVTxuQYFgog3aGDIrShGJRcdv4cPiEP9Y7mD1rUN0wfxv7d2euoQVQZsZG35xbkqeThOlzflkLDS0PnS+dm+bvIpA8dEuOochUl3fZ6sAv+Xmfq6BrS4BMZa3L/FTi1EFR3SfJi/PKvsjoQoXn/4odYnc85jxennuFcv3bNfYMFunJzvn4zy4ZO9LtvsQner31SiwqCWHqoX1oyH/VahbJAx0mNPsga8S60ArQM33g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fwJKtARM; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fwJKtARM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTRz29J0z304h
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMfcAsk7/L+1aBv+qCWMBV/GBd7zS34HGr48388Z8ave6nBmDlCL7rSZKhy9buHYhC9/HNXDDWnQ1QuCXu9DYdZJQ40lkuLt0jvaP8IMKopl6N2LA8Eva8VQ9pFek9aZyidT19yK2wmTyEXZP5su9OJ5rr+0D2rt3BvZRMY5V78PThmwdRXOjzWOCmxTzjQ1wssXaCAx+9Z072RQZehuT1tPomSalIOSx39w1i2/I/aiJTrVG429/RlfgbXalhqd3jVyUFd94xCCNyE4rCulb8LJ3U4S911QpSFo0LqUxKFpVIHT2WAe1N1JxHYE2Rav2FLdlngJDK8di6nwBcwOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gDVgrOkRlQAG8efALaumiBZ1el58j98ZkMQYUmNEXI=;
 b=F+sx0a+emoFfgzyn16gMRbKob2eBsKTAxgRt+wAgbQY9xWRipjxd0jkV9jWRlg7mKNcnFEDkZJ0JyrG0ZN47Y7VI6RpoaJJpSK8uuQkXtvROK2OtbWIioqIko1RGl+/fXf6/u6e0CGEAdin6O589xc9xMuLKIXGk92SQ6BklAJmXF0xs+Iu4LTVxuuTebdMXhrzq0oAthrnSWMuNxN9kcFeD6MylPmPt0lNV7S6xoFHZholLN/f5W32RZiPXLLpx/6ZgcTEo9a7SW0XLfFmU2HLfXHJG31kqsuAKQfuUovcZ2UTU0F46v6ULvKON0R3O5DMgPj6s5NT2BwJfNqO+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gDVgrOkRlQAG8efALaumiBZ1el58j98ZkMQYUmNEXI=;
 b=fwJKtARMErgSO6szqmk+oLRBKmq+rwxua+csUSuodph5fV/YuHCuBqjfQLjLQBKgDS9wEViLABaw8Mx4MqJtLNjz/YlyZ8hJQg+3LCBtaTSSUZrQGGTxjQD2xjZ44PbN4vyQoqaaRuneobxpdosP5ETP/iaE5WiEaAIgIfj7Q1osU/wLf53+lWGG6klghaWtfSY4e3GlOn6rxQz8XagF/6wi/a+XSrXB64msqs5T18a0YuucHrpHYfkmlEcGTLpet6DkbWgIsi7LoFkN2V19iVJltkVTzNuTxshOuW3cKqOUQYUPjaHDOEx6r19RXeBf8ULEVKzGrNG6W4jN29NOMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:19 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:19 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:50 -0700
Subject: [PATCH linux dev-6.12 04/14] net: mctp: separate cb from
 direct-addressing routing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-4-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=3475;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=cBGC1UyGNRaJehQAECmQHPoMNdpyMzRqdcJJaenISI8=;
 b=zsx4iToTkHFyjO/7NSGW6/KoCK0ZnnFuyeauDt/oHGIt0exwHy+v0TWazUo3plKTgiq558FBM
 PGL88CjTJL6BqjdS0hSUhqGzH9VqZuCvryv0TMjVn3mUDOTEXm9iFMG
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b33204d-df7c-4565-86bf-08ddf6fb1ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXVodUtzbldGMVJCZUM5ME1XTDV6UE5zeTlTeUt6L3U0THE4WS82UTBWUjdE?=
 =?utf-8?B?T3k2YXRzdmo4WU5OdmxoaVgyRWVSWEtMZmdiVXN6UzJncXBISVp2M1BrOGp4?=
 =?utf-8?B?ZnduaG5HcHBhcWhIcUsvS3pwWDFuY2xKakwycHBzRGxjS0plQ0NZWnBJTDdD?=
 =?utf-8?B?eWF2U1JTUEwwaWxNN3c2MHUrL3VTT0tVV3ZuZ0pyb1VuczlHMDlFbTMrQzdx?=
 =?utf-8?B?N1VDS1h2ekZpeERjbi9EWFpQaC9jZ1JZNE5zTGZIbVFZZEZ3elhueEZmZUFQ?=
 =?utf-8?B?c0dlTG9GbnpSTzJEZ091dW5UWE1WR0w4Mk1VYng0ZGpva3FvYXRGNlZhVVFD?=
 =?utf-8?B?K09vM3YwT3JvY1hiNGRkeFNaVWZrU1ZoYW5BUVBSM2NlVUpjYTU4V290bHIv?=
 =?utf-8?B?dTVTQlRnbnVjbzdjN1JMV3VXUXVSZENMNE9zUVlDTkVsNGY2TXowQmJhSzdu?=
 =?utf-8?B?Q1BUdFJKQ3VYd0pTdnlFWG51SFB1Sm16ajhhRnJ4VFVIU2Y0Vlk3Z0ZBazlk?=
 =?utf-8?B?MGVEMFgvR1lzdGhkSTdFcGs2bzJxZ1lnRTc1bmJKWjh5dDNoa2hNNW1uczZh?=
 =?utf-8?B?bVpFWnFHQUttVHp5THQ2b2ZBU2N4dkZuNlc2Y0dTb0JUbWFscG9MSk1zcXc4?=
 =?utf-8?B?MkRFT0RVR2hkTjY1bzR5TjJvMThmV2p1Z3BxNi91N3U1WGpld0J0VEtVQzhh?=
 =?utf-8?B?WXF4UlduTHp5bFBVTXhYQmE3Wlg2RDdnNjM2VVkyS3ltQmk5dHZaSXJwamo5?=
 =?utf-8?B?UWpnSVZnd1VRV3lZMGZGcXJERFZmbjUwVWxuNW1xc2FsQU0reGs1WmdTMjFP?=
 =?utf-8?B?ZTNTdzdMdmI4RFVWdWxQcTlRcW1kaE5GRk1BSFk5WEhkMkJiSFNGcXNnOXRM?=
 =?utf-8?B?T28yVkVYeXFoNnY3dVNzN0J1U1BZM1FPRzlaOEJlZnYyQTYyTm5mTWFFemNW?=
 =?utf-8?B?S1pBajd2emQyblJFdkZHVXN3QS9YN2pRdEdEY3RZOUwzeFR6UmhGaFdkOXo3?=
 =?utf-8?B?VlpnN2FEZEpMZ0xpbWhiOVlPNzRMODlBdFllbytGcFJZSk9BcStMLysyTGxz?=
 =?utf-8?B?VVExWmswQ0xMUSt3NWlqaUtEQmY5am9PeG9Za0puRlduTGdlZ0NOeC9VMTN1?=
 =?utf-8?B?UTBwQnRpL0FiS2VkZ2NBay9JZWRCREVNMTFSUVhFV0RpTWhJT2xkYUw2cVA5?=
 =?utf-8?B?N2hCa0ZnUGdOR3lLc3RGckVqOHR2bjIzMnNsakIzV0E1UDV6YWk0akYwZElB?=
 =?utf-8?B?OWg5SkJlV05MOWFsSzZ0S2VYU0Q0aS9mdnptR0NEcTRNOG9yMVhUVUhVVU12?=
 =?utf-8?B?Y3JFU1oxYTJwbjhrTVZsczE0TUFLQTU1YkQ1V0ViMjFGeDQxU0F3bkx0MTZy?=
 =?utf-8?B?S0d1bzM0aHIweEN6UTBOMWxhVFVWK2VKMmF5SFVaOEp4WTJyb2dRSW82NUR1?=
 =?utf-8?B?SDFJRlllRXJ4S2pwMWNScGpBV3pBQ1NOWnNkMVJWSHZIWnJVT0F1ckRwWHI3?=
 =?utf-8?B?eUFTWFBFam5hcFFqS2RPRGhsblplY1psblVvemw4MG42aW1YQ0lVWTVEak04?=
 =?utf-8?B?NjZEajVqWGt2b0lRTnRvSlJhMzRBNXhBZVlkSzlKSkpnSVYyL21Nd2V1ekR1?=
 =?utf-8?B?WE04dVVMT2g4eS9nbWg3eG9oOENDeDhWOUhyakRTN0YvMkdMOVR1QTZyYllE?=
 =?utf-8?B?ZEtPVW1MRGVyZFB5Q1d3L3g5UndSU2ZGQk5rYTIvZEVxZ0QyWktKTEMxeCtt?=
 =?utf-8?B?RHlEOUFQMG5RN1Q2Ly9BcGdxNHN3ejd5Q2hZQ2ZnZXU4T0txOUNqMHViR3Fi?=
 =?utf-8?B?eEk1OW8zb1NmVXljYWh3bk1WOUFUcVNObGdoL0dseUZNa3pQR1RtYmhPVXFa?=
 =?utf-8?B?OXpLOXkxNWJFVlVuOFBVNGpKaWFYVWlmR0N5OGF2Z3gwT3ZJa2ZBYTA3TVho?=
 =?utf-8?Q?vbTnTWIKw9U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTAzbVhNank0NGtEbE5BVUtUUzBjUWw3cG1OU2tJNFNYWi8vT0JHYjk5U1Rs?=
 =?utf-8?B?eC9ld0FmZ2d1ZXZRbXJ2WW9rVVZ6RjJPQlFCOEZHVEdtem15M1JWT1ZoREVm?=
 =?utf-8?B?dzlxRUdtd3NrdWlEU0ZkVXFjOXcxRjJsb1pjZUZxRXB1UE4rUFdMMzJHUlBP?=
 =?utf-8?B?UFNQdTlpYmFvSWxsTkJMUVlEV29reGJGUlhpOVhyT1BuUlR6bkJySjc2L2Ro?=
 =?utf-8?B?UG5kNTB4SHVkRjJBcms1T2dHZG54MFl6d2RrdDRDN3lCZjFaSktmemNPMVJr?=
 =?utf-8?B?UFNwOGFzQ1JlUHc4TDUya0IzYnExeSt0b0NpK1F1MFZDNnlBWGhjd2VWWjVF?=
 =?utf-8?B?VlVkQ0duaTlhYmd2Tmw3cmZKNW9QcVM5UGVyQzZLeHB6eVJmWXNBYmZic3J0?=
 =?utf-8?B?Z3JLMng2djFCamFKeHRkVFkwU2I0NStDQXhzTTA5NExuWHJDZFRaWHk2THV2?=
 =?utf-8?B?YXhDRWJyd2llTjVHTTlKZWpZYUVJdElrMDBXV2JDVkJWZXgvYUxiT3BvVDYw?=
 =?utf-8?B?ZnQyOFRacE9yM0NWZ0hQYWxqTW9QWENiZXBIZXd1UUloRWJtalY3blI0QWY5?=
 =?utf-8?B?VWlrTzlRa3NCSTIrY1k1RnNCZlBQcmlERmpGUmJicWdUL2NuQmdNQzZTM1VP?=
 =?utf-8?B?bENhdlE2UXlDWS96aUdOL2RPT1NacHJKVkkzT3hvWGFRS1hHeWJKdnNETXJQ?=
 =?utf-8?B?ZUpVdlFzNFdJamFMOWdUOXpsaDJGRHJ5cy9QakkxVHhpcEhhZ2wvRmZocVRF?=
 =?utf-8?B?RGZ4M0o5dDNxMTh4ZDZSQ3M1dFVSaHRZa24zQnhyOU5ia2EzVTZLQ1J4cWZt?=
 =?utf-8?B?aFRUakg4ZTBxUENIc3E4bGNCblAyQWVIUytBVGxiTVpmbmVVM2RHTkpCaVl3?=
 =?utf-8?B?ZlgyMXJRMjVsdk1QelJBeFJHdlJvM3AzNVlKeVB1R2pKYkdoWDN5alJ5b0s3?=
 =?utf-8?B?eGhnd1dzalQyYzNldWtiZjQ0ZzRBZVgwUURzU2VXeTNXaGxTM1BpZStzRjFq?=
 =?utf-8?B?OFk0ZTdGUmIwYkx1V0p3QjhUWEdFR1J6NXFEYlJ2RFg3ZGhUQ1U0Ym1DdjRQ?=
 =?utf-8?B?SDJ4RHU4M0xzbkdyakQzUm1SMjVQd2tIV3JSWjZ4eXdkV3NIMVpma1VEU3pK?=
 =?utf-8?B?NjBWMXYzRTJBbEs0S3Y1M3FBSVltalJFaXcydjl4NVU4SndHdlE5MjhTR3Ri?=
 =?utf-8?B?cGRXY0pOTEcvdXFxTUZwZm9YMXliYUR1QytYWTJPbDNhWlRycTlvLzFsYUtI?=
 =?utf-8?B?ZjhrTmRycFpOeEszaE5rK1VZMk95dzROOFhRU1BNbVZDL2hvSVZPemtQNnF4?=
 =?utf-8?B?MUlYNzRhU0IraGlJOFJ1eWVLUHNXbjVlWjRwZzRCTW9oNW9TTkJoejRCRXdW?=
 =?utf-8?B?SWp6Yk9maUtvNys2aDJNTWNVR005MlpENEp3NWZ5MXV0cmdnNkp5MVJCM090?=
 =?utf-8?B?ZDAzTU5lZ3JVQW9nQ2hSamJiMnhQVy8zaWU0c1ViY0FaR1crVmx3ajlpLzlu?=
 =?utf-8?B?a1JKYVRpME1BOXRQK1I3cURCWkFEcXpaYm9maGQvR0d1dk5nb3ZPc0RibnBZ?=
 =?utf-8?B?VGw5Q2Rkbnp2Q2Q3aVZGbytXRGl3b3ptTEVqSlhEdDVpd2RtRU5VbHFpRUVZ?=
 =?utf-8?B?bDVxM0t0NkxYSjBmSFZCblRKSzJmRFhEc3c5b3lBWW9IR2R0bzNpeDcyK2Vk?=
 =?utf-8?B?SUFOdkFnRnphekV6S1FtUVR4YjA2MnV2Y0pCd2FQSWtBL1hKMXFnMm9HMytJ?=
 =?utf-8?B?Y2dmeWlZNGxtSVhYb1VSNEo4WjRjbHE0dGtzVUxyTHhsdlovamJva05lVy9v?=
 =?utf-8?B?S1I3SXJadEhmSzArWU9yUCtaZEo4bEt4RitJcTA1YXk0a1JPQ0VXeE9UT243?=
 =?utf-8?B?Z2JIN2xrS1VWdllhaXYxcTdqRzY5S2UzZHltSk9vejdVL3NQNnlRVk1SOUtk?=
 =?utf-8?B?T2RLb05HNjRVVTBXOUwwODUxamFOU1pLVEFwV1JtNmpKbVhrS2N6cUF0anFS?=
 =?utf-8?B?KzFIR2RJREI4Y3kxTFlLOUlRWXZQenVSa3VhVHpFczlFbGsySlNmRVJhMUdV?=
 =?utf-8?B?UmFwZDYybFl2SnVKTGFNSTRnTjBCVW0rV3JlZ0FrVFhMZWtWQlJkK2tPRjdG?=
 =?utf-8?Q?9if1m62BDbpNp/A+ThhOwho8A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b33204d-df7c-4565-86bf-08ddf6fb1ff9
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:19.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVfcabMF4W2r2r8Fa/jMxHxiitZeFnZrzBiZ/hTGd09gqzcga4DRijOCvgB3aau3ySzgrSLQ0Q1hHun/AgPsJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Now that we have the dst->haddr populated by sendmsg (when extended
addressing is in use), we no longer need to stash the link-layer address
in the skb->cb.

Instead, only use skb->cb for incoming lladdr data.

While we're at it: remove cb->src, as was never used.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-4-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 3007f90ec0385304ab5794e9585427b73f40e32f)
---
 include/net/mctp.h |  4 ++--
 net/mctp/route.c   | 21 +++++----------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/include/net/mctp.h b/include/net/mctp.h
index 5bae4664b4dcec3915bb8d032122c8a3819da2a5..5dccf0ab751a12d14c534af8ab8eaa6b495d9f24 100644
--- a/include/net/mctp.h
+++ b/include/net/mctp.h
@@ -183,8 +183,8 @@ struct mctp_sk_key {
 struct mctp_skb_cb {
 	unsigned int	magic;
 	unsigned int	net;
-	int		ifindex; /* extended/direct addressing if set */
-	mctp_eid_t	src;
+	/* fields below provide extended addressing for ingress to recvmsg() */
+	int		ifindex;
 	unsigned char	halen;
 	unsigned char	haddr[MAX_ADDR_LEN];
 };
diff --git a/net/mctp/route.c b/net/mctp/route.c
index 3985388a6035377c04c4e4f183c4fceca8111917..23f339b4364316817b90b4fb2952c9eac445dd24 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -561,35 +561,28 @@ static int mctp_dst_input(struct mctp_dst *dst, struct sk_buff *skb)
 
 static int mctp_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
 {
-	struct mctp_skb_cb *cb = mctp_cb(skb);
 	struct mctp_hdr *hdr = mctp_hdr(skb);
 	char daddr_buf[MAX_ADDR_LEN];
 	char *daddr = NULL;
 	int rc;
 
 	skb->protocol = htons(ETH_P_MCTP);
+	skb->pkt_type = PACKET_OUTGOING;
 
 	if (skb->len > dst->mtu) {
 		kfree_skb(skb);
 		return -EMSGSIZE;
 	}
 
-	/* If we're forwarding, we don't want to use the input path's cb,
-	 * as it holds the *source* hardware addressing information.
-	 *
-	 * We will have a PACKET_HOST skb from the dev, or PACKET_OUTGOING
-	 * from a socket; only use cb in the latter case.
-	 */
-	if (skb->pkt_type == PACKET_OUTGOING && cb->ifindex) {
-		/* direct route; use the hwaddr we stashed in sendmsg */
-		if (cb->halen != skb->dev->addr_len) {
+	/* direct route; use the hwaddr we stashed in sendmsg */
+	if (dst->halen) {
+		if (dst->halen != skb->dev->addr_len) {
 			/* sanity check, sendmsg should have already caught this */
 			kfree_skb(skb);
 			return -EMSGSIZE;
 		}
-		daddr = cb->haddr;
+		daddr = dst->haddr;
 	} else {
-		skb->pkt_type = PACKET_OUTGOING;
 		/* If lookup fails let the device handle daddr==NULL */
 		if (mctp_neigh_lookup(dst->dev, hdr->dest, daddr_buf) == 0)
 			daddr = daddr_buf;
@@ -1009,7 +1002,6 @@ int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 		      struct sk_buff *skb, mctp_eid_t daddr, u8 req_tag)
 {
 	struct mctp_sock *msk = container_of(sk, struct mctp_sock, sk);
-	struct mctp_skb_cb *cb = mctp_cb(skb);
 	struct mctp_sk_key *key;
 	struct mctp_hdr *hdr;
 	unsigned long flags;
@@ -1064,9 +1056,6 @@ int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 	skb_reset_network_header(skb);
 	skb->dev = dst->dev->dev;
 
-	/* cb->net will have been set on initial ingress */
-	cb->src = saddr;
-
 	/* set up common header fields */
 	hdr = mctp_hdr(skb);
 	hdr->ver = 1;

-- 
2.34.1


