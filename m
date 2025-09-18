Return-Path: <openbmc+bounces-663-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABDB87279
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS42bb9z3cYP;
	Fri, 19 Sep 2025 07:34:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231284;
	cv=pass; b=DIST3vhwnbqIjilWYCmkDvhxIW0YZzFf622em0QmphPMeNocWg8Z+NjIJCAEPk/6wDkR6g2WzA5l4WI+FVVDaAMlLibb1nBMk8sGc9MDMraX+MJaw4XB0Vt84ZE5BAxlg8SxUc5YQZ1bX2L36BjkqBIxqbRyguwW+CzKlyDw3swOoHjpj0eaUco08ORwvCy8LJDLfJyl6Pu0upSwdMEwqWfYJbNRckciKE8A/0ZsdHiJ0yL+XGu0NSYphgiIRr+X8GsDGh+f06whmgRkpSe10CwHwUJNsHetdWKJyv/u5jJESjBR9IViphGvK96y9dW9lAeAhcwemvhGUE3SjdwLVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231284; c=relaxed/relaxed;
	bh=sB8p3kEH+SQzQtm8PM9yXOiz4OU7ogbOqD2c0sj7bvE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZGaDoL4dtAfiNwcWItiol+eCm3gMU1HSOKb+gIxd+wJKgdn9QA8XQVw+FS3xjjtwKWnbHhj5iIxV2Cuksooh2FFLXaXEhyhZR9+TB4Ne3BrZArIAEREAlZmSFKWQB2s0nB7XBRQhUEiSZX9pSZRDamXGvqYI4WY5mHcaDwd1JKQYQfZ3+sopRF7vKba56DV0qbOS1Z4cAVWMrhfu1V4yO/B6wIKOpFabtGLfExfx4Aw44zYbqQoQv+EAgD7rKg61vP3Rrck18M9obJV+jhO1XLpHbh+3ngNK/arS/fft6WnCJhT1OVDKJ5di9twUIYUs1CvmhmqzAJXtWpWx40fUng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CSEGxVWR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CSEGxVWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS32Vhpz3cZ0
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNfxP1OSZpuNrBSvLo8bZcvoYNpQ5ZQ/ZX5HMCYodQ/9Xn0tHIzLvSHjMsr5cJZhRZko4DlCTemCX8BoOZz+WafB6OOVvJEp5BZT7z6sfsGtsFJl2db+2uuQXux6abeBQWijv2suZVE/LKwNVKgu66zGjZjCZF8AD/uBZtaJP5hkO0sSwNEXGAQgRnH+7+Tkpuz7pNuCi8m6GODnMPlUsBMVl+xazXCYAoj5OkI2W8AhLeF/KYVSnZJ5Q0aV8YUaFQz5DfkbaYABDr9WM63rOeFEWtPmn70no+DE/A0vWADNYLbl6JCrJ+dOrJHyWnC8BVM3oUJ+t6zo2gbsFTLb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB8p3kEH+SQzQtm8PM9yXOiz4OU7ogbOqD2c0sj7bvE=;
 b=XbBl3BO6Z79V6G9v4yLuMrumEw0XPdaZyXiZn9FhJSGbD7HRoz+WtxXMwXvSK6GYnx0c+9yONN1SY0tPi1z88eyj4+OvBkwFoMAtkbMfwvoojdCN2vyqpmvGXA13gMbK53PTyk91z/ktz7nD+4DAEaznUC4e07MvMiAVowX+Jz4Ntrja46QqiDX/SwRFW6LVCMl30aGfWPLGmH8o3wTbzwuYYPi6l8l262BHKYBHgmJ3688lhK3dgrQhGgeF0d3z/FcYXhoHF9yWl2itbt06GPhTAXfihEWpwLy5JkvErIwx7iQbujL7/hoOHf1uIMi62Mr2H5kX8ee0H4lFxap6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB8p3kEH+SQzQtm8PM9yXOiz4OU7ogbOqD2c0sj7bvE=;
 b=CSEGxVWRaLt9bKKuqw1re27+lMQmHIx9TuUxqMv58PcKtXxV9skLmI7iWDCSth/qxL9Ck40phgSgGYgi8iNi6UXPbQLohS1UwoNxXGL7hgrO8tW+5xF9Zcs1dT51N7/CUEnJ9QYhLJvHzmZXgfFn6jCwQJw8Pe7VsTRcHTBntkghSl1/r2GZo7sgqcNIvNmWaSCn+sxJCnp5/WfT1NdpjDYt+L6pCkNopA/noamhMK3Vzxp8VgSzZnIt+5pi+x0w0c+KMywsv3KD8fZjAG8Xw7EoX9UXn9tviYFtTAx1Bf8nmHua8ABnpwIyAtNa2UAJMqG/c/VlRQnpMTGeaDyRvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:18 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:17 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:49 -0700
Subject: [PATCH linux dev-6.12 03/14] net: mctp: separate routing database
 from routing operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-3-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231249; l=42693;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=1wgjrWWncA3MuQg91kAcfdTZPABmPe+KP+kUrOyx4/4=;
 b=/rfv+QUOLX2gd1SBuFaPUdpChseQtIkCUzFLVlzi2HAo8Gq2vlMoNFKX5QTKL+3TiWzt82j6w
 gKkEFPrwCWLCm4hv1Bi7SHv0lRTgixHU4iq2Rsoqg9zCmIZna8F6d8E
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0376.namprd04.prod.outlook.com
 (2603:10b6:303:81::21) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ec71040e-a21f-43c0-b1bd-08ddf6fb1f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3NYREVhSkdlQ04wTUx1ekFqeUlsTit5TVhTb1I1K3U3bGYwakdpNXdBTmM3?=
 =?utf-8?B?NytDcFk0dHlNSGEvRStSRHI0WXYrRnF2QTJOM1ExYWhBNGRYTkM1WC8zTnhW?=
 =?utf-8?B?Y3pJUXdFTFB1UGZhWGNTQkk4bktjeUdKcTJxQ2hPMU5HUmwvdGJtdUg3bTVZ?=
 =?utf-8?B?RVlWekZRdjh2ZGRZbm9waGpHR3ZaZXhTc1VsbHk1STBSSDhlV2VMeW9MelZ6?=
 =?utf-8?B?U1dHZHBuL0Qxa1FCN25JS1E0amVDV0FIWEExcHJVc3VPa2xReW9qNVRjcW1T?=
 =?utf-8?B?QzBXWEZsQnlKUkwvdHAvOSt6ZGhwQmhFUUNleGtRQXpHWHBZQUpLMURnSGxQ?=
 =?utf-8?B?OVBMQ0Ztc011NEs1KzJoVVBxNTlmeEdJeUFBMXY2Y2ZBZWsyNzRRUEtoVlI4?=
 =?utf-8?B?ZGZjTDcwOUp6WGhERFdCOXlNYWE2SVUrTjB4T0FqMm1PeFFkVUQ3ajBXZEY4?=
 =?utf-8?B?SzVvcGM1ZzhrV0FiQkRRSHJpSjlTUitDRWQ5Vjk0OVN5NmpFZ0dmRytZVkwv?=
 =?utf-8?B?cjBlenRRVGlQN0lEUGNnZFFnWHJ0M29FaFd3K2k1Z3crOS9GT2YvZDkzamV3?=
 =?utf-8?B?d08rd1dodGU5MDNXNmwyNkNtd3hPSDdTTDlhbTZsdFVVRDZOK2xOVWFjT2I2?=
 =?utf-8?B?TFpDYUpFR05QZkhsODV3WFQydTI2eUwzaE5LN21kQjJ2c2RCT0xvQ0hCOHBJ?=
 =?utf-8?B?aTh3eHk2bmFnWHNLb3V0MkszU0NiVHp5TVd2bFF6ZmlVaWo2b1RLVWljRWVW?=
 =?utf-8?B?bzBvTS82YzdXWnBiWStGVEtFWW5Pa3pWTFBYbG1ZcWovSGE2b1J4aGxpNC83?=
 =?utf-8?B?a3JBSFNmNGN4c3FQSTkvS2k3b08wcHY2eWREcDlqMlJIRlJ3RnE0bDB2VmlF?=
 =?utf-8?B?ckZDSW1CcDJKV3BRQmJ2ekJuNzJlUDgvcVdPVGt5NEFoV2ZmNGwySmFoYUVG?=
 =?utf-8?B?SFlYcis4ZEVQQWZyOS95bnFjTHlkMTBMUHVZVlJaSndkSWxhZkpsSjFxaEl4?=
 =?utf-8?B?eWhwZUZwbXlVSXFORVEwcDBoNFBFcGFkRkcwKzhOM1pydjhHTWQ0TVViZnpx?=
 =?utf-8?B?Zng3QzQxSlB1Q2hqSW1ubDRreWRuQWdUTDJDRndGV0tRUm0yVU9LSnFrbGNm?=
 =?utf-8?B?M0R3NHRoY1VKeSt0L043TEE5ZzlpdFh6cXFBc0NBY3dxR0UrSlQ5WHdwWk5C?=
 =?utf-8?B?ZlMxcG1UQjdGbFRyVVFLazAxelJOQTJwNzluY2o4RzdOUm91dXluNTI5SWdN?=
 =?utf-8?B?UXpYTEU4bktWeW5YQm83eHhOYmVhNVN6b1oyQW1uZGtZRWUyOWRiRTQ4cG1S?=
 =?utf-8?B?eVBKdXM2RzNDN0FuU0t4WWRmbncxSXRSZkZkTFdTRnoyZi9TQytHZnF3ZG4z?=
 =?utf-8?B?dDVqVElubFRZSkdPQmdsVDR5R1o5eDJqamx1eWJsdFVweE1ka05Tc0hVMzJK?=
 =?utf-8?B?VDBZUnQwT1Y5UjA5eldrNG4rSytlRllxNnNtOW9UUTYyRUVsNTBzQVR0TTZR?=
 =?utf-8?B?TXlwSzV3YkZXVTh6NzBqZUFaSy9YZEpaTzh6QlhjQ0JndHFVZWpMaVJWRWI4?=
 =?utf-8?B?Um1FYksyQkVNOFNxcnlYTS9Xd3NPUklkVGFyVDh3cDBzYlNjNkIwOHpHOFBQ?=
 =?utf-8?B?MGMwem9ESkM4TzZDSjMyUHJWeFlYc0RBRHVCenlTUUtrc0F2TWFma09xY3hv?=
 =?utf-8?B?TjFoYTErYXFoTmV3Z2ZZZ3hoSldQQnQyYjdRUXkrY0dCTGlDOEJ4QVZENmJk?=
 =?utf-8?B?Z2YyY3dqajM4WUFVWldYdWhUNG9IbTJpaDNaKyswdkNHdUhsenBpVy9XUkxQ?=
 =?utf-8?B?WjF1Nm53dDFCbG1qbmxQZTJyaGRDZWMyWHRCWjQ2SUtCNnpTNGkrVnhkMk5T?=
 =?utf-8?B?RUg3Q2QvcXV5S2NrTmhkbFk4eFdqT0NRT29CdHBFL2dvc09UNGNFRXU0Y0li?=
 =?utf-8?Q?hJFQmCvu28k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U09nblJ3VWQ4U2QyOFRtWnRSOGNDQThCeng3Qlgvd3FoNk5yK1UrcUNuVFpU?=
 =?utf-8?B?L3o1MGVKMWZVMno0eDlMV0lSMjV6NlBPM2szNWR5aEtTaFNUOUV4R0VBVThQ?=
 =?utf-8?B?NTlWUGtCOStsZmhpbTNvVzZIUlA4ZW1QQ1BzelhSSVhNWGNUKzBBWmMvbks0?=
 =?utf-8?B?dVQxUXUvKzA4Tk9YZGhOYU1ZSG0xWUNPZkx1ZjNLQ3JPdTM4NUt5MHNYemVm?=
 =?utf-8?B?cnQ1LzJlSGw0RVY4VFc1Y0JPRmlnL1VrTWlTWXRTTlZ4WWpFNjdvdjV0d3Vu?=
 =?utf-8?B?bk12Zm5EUkZHMXNZOXlDMktQUXh6MDRkMFZXQStqbzRFWS9hOXhhbG54dzQ5?=
 =?utf-8?B?bnhQa2JXcE9GR3gybmhQaVpTTklFakhvMDVxNHBpNWxZa2RRK3QyV0hUcG9m?=
 =?utf-8?B?Q1UvdUdCeGc2R2RubGdUaEZxcS9IajlnbXRTbWQxRUsvTGVaR3lHRXRpSERQ?=
 =?utf-8?B?VzhKQlJWTTk5c3MxdFVlT1RxbC9JSmR4aVhKOWNVMDh2YWsrakJidlFsYlI5?=
 =?utf-8?B?eTE2N3dtWUFLQk1JM3ZsVEFWcHJBZXFYcFVFNEVXN2VMdjFIQUJUNXgwb0xL?=
 =?utf-8?B?WmRrcjJPYmNQT05mQXJjYk4zN0R3dzcybUFWRXRPOGNhYTgrRGZJL0lrOWxw?=
 =?utf-8?B?VzdqZnRDbWkrcVNlZFRQNnZ1aldYQm5zNDFVNWJRY2V4UjJBOEVFeTlSdmdy?=
 =?utf-8?B?WjN4c0llVWlRR2ZqZVhaWnh1M1RHdTdDRlVYS1BBbjlWbzNPR3R6Y0QrZ2NF?=
 =?utf-8?B?UXhyZkxpaTVnNkU4a0tLZlU0cEE1UDQxYnlmYUwyWXZkRjRSbkNWbkFTRkxV?=
 =?utf-8?B?UXNRanM2QTRzV1lhQ2EzRTh1TVMreXNiOUpzaWh0NzVhMU16OFFIR3ZXTkRq?=
 =?utf-8?B?ZG5kNkFkZTZ3bWQwVWRIL3BNaWF6c0dZcEZYYW92QzZLaGZ6T3lUeFVPZlNE?=
 =?utf-8?B?QVg4NnNNZ1lQZ0pqQmdzWDhjRi82ODFhOXV6bXJhZ2h1VlRkUlVHdFRsWlh3?=
 =?utf-8?B?c1Vsd3BpQU1yM1labXFiTlZXMDdDUit2cVVscFQxMXg0THVPUFdiaVJkTVJy?=
 =?utf-8?B?WmNqZlVPOHQxWmMrNlBUUXhBcDBFMDN2QTJQSEdZYTVER3A0STYzVGxiQjQ1?=
 =?utf-8?B?bGM3ZUNmbzBLK1VFcC9SU3NtUUdPZmxTRzhvbnRlTDMxTi93a1E4WlhKNVNR?=
 =?utf-8?B?ek55TG5NNnNFS0o3TUd6bjFYanVzOXRkdkhWZGxwUU1zSWRpanFyaEtvR0ht?=
 =?utf-8?B?OEtqZjdiNWkraUpZMmk1aTc5ckh1cit1MFpwUG1kbkYvV2NKZDQvL2YvU0Nh?=
 =?utf-8?B?MThiYVYrRlk5Y1JuM1EvMW9lOXNVYmtsUDMxcDZjT2VFcGpqZCtsM254MW1o?=
 =?utf-8?B?bEZoOGVGOUZ6a21qSlh3SkFmYmQrMVp0NDBkT2JpdC8zN01DUUR0aWQ2aGRB?=
 =?utf-8?B?NjdPSDJ1V01qaEN5MG5GazFqVkVmb3pDV0UzODVNL2o1LzluaTlBais3NnNM?=
 =?utf-8?B?ejRqY0ljSDJOS2tmYXl2ZEIwTW9QU0pBUFg2ak1YSDNnc0VjVEJqa1p0YkZP?=
 =?utf-8?B?aW40SE1GZSt2c1YwZVRXZkY4eTRtYXpjTXFONXVlM092LytjRXlQTmJockdh?=
 =?utf-8?B?N1FXd3REUndaeEV1Y1kxd2IyRDB2Sndoc1AxdVh1cEJBZGI4OVlFKytQM3BL?=
 =?utf-8?B?QnNmdGYzMW1GVVNGS3h1ZzAwa1ZNcjRLUnEwb2ltTm9uQ2lJUUtrMmhvRTFG?=
 =?utf-8?B?UjRKZEVJRlFwQ1g5OHhqZEtxcXNXMmVFSTM4TDRCTjlSNDFiSkM2ejE1Ymsr?=
 =?utf-8?B?ZFNJYlhwTjh2Z2ZPR2dYb2ZTTDhSSmJBclZtR0ZYZ2gwejU5RGZHcmtMTmNX?=
 =?utf-8?B?YWFMa20rUHZDdVhzd3VHK3BGOThJMSt4VU1ZbmlyTnVVNDlJeERuK29WbzNn?=
 =?utf-8?B?ZEt5Mm9xMUF4S0tvb3BjMUcrSUxqOGJBUUlDTlBVWnkzb3d0bWZFY25tZDFL?=
 =?utf-8?B?WmFtazBDczRmRFlVZzQ1SEtKelBweVhVSEJXZGV2MUh2RktjT0V6OVB5VnlH?=
 =?utf-8?B?SmRnb2luM3BNajY3VFdKbGtpeVRqNmU5bkVQajF6YUlpQi9JSDNsVGFLT2l4?=
 =?utf-8?Q?wxmuyk9q6qpe+QtlVaxeJI0L/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec71040e-a21f-43c0-b1bd-08ddf6fb1f01
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:17.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5xKaC6IM1G959aDnT8l/Lz74ekIEMKEUqaZehOVDTlwM7gnZ/dxH5xnDJ7J174Uxm6J/BLSdYvgRHg3Ur83XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

This change adds a struct mctp_dst, representing the result of a routing
lookup. This decouples the struct mctp_route from the actual
implementation of a routing operation.

This will allow for future routing changes which may require more
involved lookup logic, such as gateway routing - which may require
multiple traversals of the routing table.

Since we only use the struct mctp_route at lookup time, we no longer
hold routes over a routing operation, as we only need it to populate the
dst. However, we do hold the dev while the dst is active.

This requires some changes to the route test infrastructure, as we no
longer have a mock route to handle the route output operation, and
transient dsts are created by the routing code, so we can't override
them as easily.

Instead, we use kunit->priv to stash a packet queue, and a custom
dst_output function queues into that packet queue, which we can use for
later expectations.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-3-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 269936db5eb3962fe290b1dc4dbf1859cd5a04dd)
---
 include/net/mctp.h         |  35 +++++--
 net/mctp/af_mctp.c         |  62 ++++--------
 net/mctp/route.c           | 210 ++++++++++++++++++++------------------
 net/mctp/test/route-test.c | 245 ++++++++++++++++++++++++++++-----------------
 4 files changed, 313 insertions(+), 239 deletions(-)

diff --git a/include/net/mctp.h b/include/net/mctp.h
index 1ecbff7116f62dd7eb2f9ac8273a162d7e7a3357..5bae4664b4dcec3915bb8d032122c8a3819da2a5 100644
--- a/include/net/mctp.h
+++ b/include/net/mctp.h
@@ -222,6 +222,8 @@ struct mctp_flow {
 	struct mctp_sk_key *key;
 };
 
+struct mctp_dst;
+
 /* Route definition.
  *
  * These are held in the pernet->mctp.routes list, with RCU protection for
@@ -229,8 +231,7 @@ struct mctp_flow {
  * dropped on NETDEV_UNREGISTER events.
  *
  * Updates to the route table are performed under rtnl; all reads under RCU,
- * so routes cannot be referenced over a RCU grace period. Specifically: A
- * caller cannot block between mctp_route_lookup and mctp_route_release()
+ * so routes cannot be referenced over a RCU grace period.
  */
 struct mctp_route {
 	mctp_eid_t		min, max;
@@ -238,7 +239,7 @@ struct mctp_route {
 	unsigned char		type;
 	unsigned int		mtu;
 	struct mctp_dev		*dev;
-	int			(*output)(struct mctp_route *route,
+	int			(*output)(struct mctp_dst *dst,
 					  struct sk_buff *skb);
 
 	struct list_head	list;
@@ -246,12 +247,34 @@ struct mctp_route {
 	struct rcu_head		rcu;
 };
 
+/* Route lookup result: dst. Represents the results of a routing decision,
+ * but is only held over the individual routing operation.
+ *
+ * Will typically be stored on the caller stack, and must be released after
+ * usage.
+ */
+struct mctp_dst {
+	struct mctp_dev *dev;
+	unsigned int mtu;
+
+	/* set for direct addressing */
+	unsigned char halen;
+	unsigned char haddr[MAX_ADDR_LEN];
+
+	int (*output)(struct mctp_dst *dst, struct sk_buff *skb);
+};
+
+int mctp_dst_from_extaddr(struct mctp_dst *dst, struct net *net, int ifindex,
+			  unsigned char halen, const unsigned char *haddr);
+
 /* route interfaces */
-struct mctp_route *mctp_route_lookup(struct net *net, unsigned int dnet,
-				     mctp_eid_t daddr);
+int mctp_route_lookup(struct net *net, unsigned int dnet,
+		      mctp_eid_t daddr, struct mctp_dst *dst);
+
+void mctp_dst_release(struct mctp_dst *dst);
 
 /* always takes ownership of skb */
-int mctp_local_output(struct sock *sk, struct mctp_route *rt,
+int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 		      struct sk_buff *skb, mctp_eid_t daddr, u8 req_tag);
 
 void mctp_key_unref(struct mctp_sk_key *key);
diff --git a/net/mctp/af_mctp.c b/net/mctp/af_mctp.c
index 70aeebfc4182e12d07065d3f040b35c35918733c..19193c3915e6ac0afc8c0686f443c442afd03a3a 100644
--- a/net/mctp/af_mctp.c
+++ b/net/mctp/af_mctp.c
@@ -96,8 +96,8 @@ static int mctp_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	struct sock *sk = sock->sk;
 	struct mctp_sock *msk = container_of(sk, struct mctp_sock, sk);
 	struct mctp_skb_cb *cb;
-	struct mctp_route *rt;
 	struct sk_buff *skb = NULL;
+	struct mctp_dst dst;
 	int hlen;
 
 	if (addr) {
@@ -132,34 +132,30 @@ static int mctp_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	if (msk->addr_ext && addrlen >= sizeof(struct sockaddr_mctp_ext)) {
 		DECLARE_SOCKADDR(struct sockaddr_mctp_ext *,
 				 extaddr, msg->msg_name);
-		struct net_device *dev;
-
-		rc = -EINVAL;
-		rcu_read_lock();
-		dev = dev_get_by_index_rcu(sock_net(sk), extaddr->smctp_ifindex);
-		/* check for correct halen */
-		if (dev && extaddr->smctp_halen == dev->addr_len) {
-			hlen = LL_RESERVED_SPACE(dev) + sizeof(struct mctp_hdr);
-			rc = 0;
-		}
-		rcu_read_unlock();
+
+		if (!mctp_sockaddr_ext_is_ok(extaddr))
+			return -EINVAL;
+
+		rc = mctp_dst_from_extaddr(&dst, sock_net(sk),
+					   extaddr->smctp_ifindex,
+					   extaddr->smctp_halen,
+					   extaddr->smctp_haddr);
 		if (rc)
-			goto err_free;
-		rt = NULL;
+			return rc;
+
 	} else {
-		rt = mctp_route_lookup(sock_net(sk), addr->smctp_network,
-				       addr->smctp_addr.s_addr);
-		if (!rt) {
-			rc = -EHOSTUNREACH;
-			goto err_free;
-		}
-		hlen = LL_RESERVED_SPACE(rt->dev->dev) + sizeof(struct mctp_hdr);
+		rc = mctp_route_lookup(sock_net(sk), addr->smctp_network,
+				       addr->smctp_addr.s_addr, &dst);
+		if (rc)
+			return rc;
 	}
 
+	hlen = LL_RESERVED_SPACE(dst.dev->dev) + sizeof(struct mctp_hdr);
+
 	skb = sock_alloc_send_skb(sk, hlen + 1 + len,
 				  msg->msg_flags & MSG_DONTWAIT, &rc);
 	if (!skb)
-		return rc;
+		goto err_release_dst;
 
 	skb_reserve(skb, hlen);
 
@@ -174,30 +170,16 @@ static int mctp_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	cb = __mctp_cb(skb);
 	cb->net = addr->smctp_network;
 
-	if (!rt) {
-		/* fill extended address in cb */
-		DECLARE_SOCKADDR(struct sockaddr_mctp_ext *,
-				 extaddr, msg->msg_name);
-
-		if (!mctp_sockaddr_ext_is_ok(extaddr) ||
-		    extaddr->smctp_halen > sizeof(cb->haddr)) {
-			rc = -EINVAL;
-			goto err_free;
-		}
-
-		cb->ifindex = extaddr->smctp_ifindex;
-		/* smctp_halen is checked above */
-		cb->halen = extaddr->smctp_halen;
-		memcpy(cb->haddr, extaddr->smctp_haddr, cb->halen);
-	}
-
-	rc = mctp_local_output(sk, rt, skb, addr->smctp_addr.s_addr,
+	rc = mctp_local_output(sk, &dst, skb, addr->smctp_addr.s_addr,
 			       addr->smctp_tag);
 
+	mctp_dst_release(&dst);
 	return rc ? : len;
 
 err_free:
 	kfree_skb(skb);
+err_release_dst:
+	mctp_dst_release(&dst);
 	return rc;
 }
 
diff --git a/net/mctp/route.c b/net/mctp/route.c
index 128ac46dda5eb882994960b8c0eb671007ad8583..3985388a6035377c04c4e4f183c4fceca8111917 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -32,7 +32,7 @@ static const unsigned long mctp_key_lifetime = 6 * CONFIG_HZ;
 static void mctp_flow_prepare_output(struct sk_buff *skb, struct mctp_dev *dev);
 
 /* route output callbacks */
-static int mctp_route_discard(struct mctp_route *route, struct sk_buff *skb)
+static int mctp_dst_discard(struct mctp_dst *dst, struct sk_buff *skb)
 {
 	kfree_skb(skb);
 	return 0;
@@ -368,7 +368,7 @@ static int mctp_frag_queue(struct mctp_sk_key *key, struct sk_buff *skb)
 	return 0;
 }
 
-static int mctp_route_input(struct mctp_route *route, struct sk_buff *skb)
+static int mctp_dst_input(struct mctp_dst *dst, struct sk_buff *skb)
 {
 	struct mctp_sk_key *key, *any_key = NULL;
 	struct net *net = dev_net(skb->dev);
@@ -559,24 +559,17 @@ static int mctp_route_input(struct mctp_route *route, struct sk_buff *skb)
 	return rc;
 }
 
-static unsigned int mctp_route_mtu(struct mctp_route *rt)
-{
-	return rt->mtu ?: READ_ONCE(rt->dev->dev->mtu);
-}
-
-static int mctp_route_output(struct mctp_route *route, struct sk_buff *skb)
+static int mctp_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
 {
 	struct mctp_skb_cb *cb = mctp_cb(skb);
 	struct mctp_hdr *hdr = mctp_hdr(skb);
 	char daddr_buf[MAX_ADDR_LEN];
 	char *daddr = NULL;
-	unsigned int mtu;
 	int rc;
 
 	skb->protocol = htons(ETH_P_MCTP);
 
-	mtu = READ_ONCE(skb->dev->mtu);
-	if (skb->len > mtu) {
+	if (skb->len > dst->mtu) {
 		kfree_skb(skb);
 		return -EMSGSIZE;
 	}
@@ -598,7 +591,7 @@ static int mctp_route_output(struct mctp_route *route, struct sk_buff *skb)
 	} else {
 		skb->pkt_type = PACKET_OUTGOING;
 		/* If lookup fails let the device handle daddr==NULL */
-		if (mctp_neigh_lookup(route->dev, hdr->dest, daddr_buf) == 0)
+		if (mctp_neigh_lookup(dst->dev, hdr->dest, daddr_buf) == 0)
 			daddr = daddr_buf;
 	}
 
@@ -609,7 +602,7 @@ static int mctp_route_output(struct mctp_route *route, struct sk_buff *skb)
 		return -EHOSTUNREACH;
 	}
 
-	mctp_flow_prepare_output(skb, route->dev);
+	mctp_flow_prepare_output(skb, dst->dev);
 
 	rc = dev_queue_xmit(skb);
 	if (rc)
@@ -638,7 +631,7 @@ static struct mctp_route *mctp_route_alloc(void)
 
 	INIT_LIST_HEAD(&rt->list);
 	refcount_set(&rt->refs, 1);
-	rt->output = mctp_route_discard;
+	rt->output = mctp_dst_discard;
 
 	return rt;
 }
@@ -828,49 +821,106 @@ static bool mctp_rt_compare_exact(struct mctp_route *rt1,
 		rt1->max == rt2->max;
 }
 
-struct mctp_route *mctp_route_lookup(struct net *net, unsigned int dnet,
-				     mctp_eid_t daddr)
+static void mctp_dst_from_route(struct mctp_dst *dst, struct mctp_route *route)
+{
+	mctp_dev_hold(route->dev);
+	dst->dev = route->dev;
+	dst->mtu = route->mtu ?: READ_ONCE(dst->dev->dev->mtu);
+	dst->halen = 0;
+	dst->output = route->output;
+}
+
+int mctp_dst_from_extaddr(struct mctp_dst *dst, struct net *net, int ifindex,
+			  unsigned char halen, const unsigned char *haddr)
 {
-	struct mctp_route *tmp, *rt = NULL;
+	struct net_device *netdev;
+	struct mctp_dev *dev;
+	int rc = -ENOENT;
+
+	if (halen > sizeof(dst->haddr))
+		return -EINVAL;
 
 	rcu_read_lock();
 
-	list_for_each_entry_rcu(tmp, &net->mctp.routes, list) {
+	netdev = dev_get_by_index_rcu(net, ifindex);
+	if (!netdev)
+		goto out_unlock;
+
+	if (netdev->addr_len != halen) {
+		rc = -EINVAL;
+		goto out_unlock;
+	}
+
+	dev = __mctp_dev_get(netdev);
+	if (!dev)
+		goto out_unlock;
+
+	dst->dev = dev;
+	dst->mtu = READ_ONCE(netdev->mtu);
+	dst->halen = halen;
+	dst->output = mctp_dst_output;
+	memcpy(dst->haddr, haddr, halen);
+
+	rc = 0;
+
+out_unlock:
+	rcu_read_unlock();
+	return rc;
+}
+
+void mctp_dst_release(struct mctp_dst *dst)
+{
+	mctp_dev_put(dst->dev);
+}
+
+/* populates *dst on successful lookup, if set */
+int mctp_route_lookup(struct net *net, unsigned int dnet,
+		      mctp_eid_t daddr, struct mctp_dst *dst)
+{
+	int rc = -EHOSTUNREACH;
+	struct mctp_route *rt;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(rt, &net->mctp.routes, list) {
 		/* TODO: add metrics */
-		if (mctp_rt_match_eid(tmp, dnet, daddr)) {
-			if (refcount_inc_not_zero(&tmp->refs)) {
-				rt = tmp;
-				break;
-			}
-		}
+		if (!mctp_rt_match_eid(rt, dnet, daddr))
+			continue;
+
+		if (dst)
+			mctp_dst_from_route(dst, rt);
+		rc = 0;
+		break;
 	}
 
 	rcu_read_unlock();
 
-	return rt;
+	return rc;
 }
 
-static struct mctp_route *mctp_route_lookup_null(struct net *net,
-						 struct net_device *dev)
+static int mctp_route_lookup_null(struct net *net, struct net_device *dev,
+				  struct mctp_dst *dst)
 {
-	struct mctp_route *tmp, *rt = NULL;
+	int rc = -EHOSTUNREACH;
+	struct mctp_route *rt;
 
 	rcu_read_lock();
 
-	list_for_each_entry_rcu(tmp, &net->mctp.routes, list) {
-		if (tmp->dev->dev == dev && tmp->type == RTN_LOCAL &&
-		    refcount_inc_not_zero(&tmp->refs)) {
-			rt = tmp;
-			break;
-		}
+	list_for_each_entry_rcu(rt, &net->mctp.routes, list) {
+		if (rt->dev->dev != dev || rt->type != RTN_LOCAL)
+			continue;
+
+		mctp_dst_from_route(dst, rt);
+		rc = 0;
+		break;
 	}
 
 	rcu_read_unlock();
 
-	return rt;
+	return rc;
 }
 
-static int mctp_do_fragment_route(struct mctp_route *rt, struct sk_buff *skb,
+static int mctp_do_fragment_route(struct mctp_dst *dst, struct sk_buff *skb,
 				  unsigned int mtu, u8 tag)
 {
 	const unsigned int hlen = sizeof(struct mctp_hdr);
@@ -943,7 +993,7 @@ static int mctp_do_fragment_route(struct mctp_route *rt, struct sk_buff *skb,
 		skb_ext_copy(skb2, skb);
 
 		/* do route */
-		rc = rt->output(rt, skb2);
+		rc = dst->output(dst, skb2);
 		if (rc)
 			break;
 
@@ -955,68 +1005,32 @@ static int mctp_do_fragment_route(struct mctp_route *rt, struct sk_buff *skb,
 	return rc;
 }
 
-int mctp_local_output(struct sock *sk, struct mctp_route *rt,
+int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 		      struct sk_buff *skb, mctp_eid_t daddr, u8 req_tag)
 {
 	struct mctp_sock *msk = container_of(sk, struct mctp_sock, sk);
 	struct mctp_skb_cb *cb = mctp_cb(skb);
-	struct mctp_route tmp_rt = {0};
 	struct mctp_sk_key *key;
 	struct mctp_hdr *hdr;
 	unsigned long flags;
 	unsigned int netid;
 	unsigned int mtu;
 	mctp_eid_t saddr;
-	bool ext_rt;
 	int rc;
 	u8 tag;
 
 	rc = -ENODEV;
 
-	if (rt) {
-		ext_rt = false;
-		if (WARN_ON(!rt->dev))
-			goto out_release;
-
-	} else if (cb->ifindex) {
-		struct net_device *dev;
-
-		ext_rt = true;
-		rt = &tmp_rt;
-
-		rcu_read_lock();
-		dev = dev_get_by_index_rcu(sock_net(sk), cb->ifindex);
-		if (!dev) {
-			rcu_read_unlock();
-			goto out_free;
-		}
-		rt->dev = __mctp_dev_get(dev);
-		rcu_read_unlock();
-
-		if (!rt->dev)
-			goto out_release;
-
-		/* establish temporary route - we set up enough to keep
-		 * mctp_route_output happy
-		 */
-		rt->output = mctp_route_output;
-		rt->mtu = 0;
-
-	} else {
-		rc = -EINVAL;
-		goto out_free;
-	}
-
-	spin_lock_irqsave(&rt->dev->addrs_lock, flags);
-	if (rt->dev->num_addrs == 0) {
+	spin_lock_irqsave(&dst->dev->addrs_lock, flags);
+	if (dst->dev->num_addrs == 0) {
 		rc = -EHOSTUNREACH;
 	} else {
 		/* use the outbound interface's first address as our source */
-		saddr = rt->dev->addrs[0];
+		saddr = dst->dev->addrs[0];
 		rc = 0;
 	}
-	spin_unlock_irqrestore(&rt->dev->addrs_lock, flags);
-	netid = READ_ONCE(rt->dev->net);
+	spin_unlock_irqrestore(&dst->dev->addrs_lock, flags);
+	netid = READ_ONCE(dst->dev->net);
 
 	if (rc)
 		goto out_release;
@@ -1048,7 +1062,7 @@ int mctp_local_output(struct sock *sk, struct mctp_route *rt,
 	skb_reset_transport_header(skb);
 	skb_push(skb, sizeof(struct mctp_hdr));
 	skb_reset_network_header(skb);
-	skb->dev = rt->dev->dev;
+	skb->dev = dst->dev->dev;
 
 	/* cb->net will have been set on initial ingress */
 	cb->src = saddr;
@@ -1059,26 +1073,20 @@ int mctp_local_output(struct sock *sk, struct mctp_route *rt,
 	hdr->dest = daddr;
 	hdr->src = saddr;
 
-	mtu = mctp_route_mtu(rt);
+	mtu = dst->mtu;
 
 	if (skb->len + sizeof(struct mctp_hdr) <= mtu) {
 		hdr->flags_seq_tag = MCTP_HDR_FLAG_SOM |
 			MCTP_HDR_FLAG_EOM | tag;
-		rc = rt->output(rt, skb);
+		rc = dst->output(dst, skb);
 	} else {
-		rc = mctp_do_fragment_route(rt, skb, mtu, tag);
+		rc = mctp_do_fragment_route(dst, skb, mtu, tag);
 	}
 
 	/* route output functions consume the skb, even on error */
 	skb = NULL;
 
 out_release:
-	if (!ext_rt)
-		mctp_route_release(rt);
-
-	mctp_dev_put(tmp_rt.dev);
-
-out_free:
 	kfree_skb(skb);
 	return rc;
 }
@@ -1088,7 +1096,7 @@ static int mctp_route_add(struct mctp_dev *mdev, mctp_eid_t daddr_start,
 			  unsigned int daddr_extent, unsigned int mtu,
 			  unsigned char type)
 {
-	int (*rtfn)(struct mctp_route *rt, struct sk_buff *skb);
+	int (*rtfn)(struct mctp_dst *dst, struct sk_buff *skb);
 	struct net *net = dev_net(mdev->dev);
 	struct mctp_route *rt, *ert;
 
@@ -1100,15 +1108,17 @@ static int mctp_route_add(struct mctp_dev *mdev, mctp_eid_t daddr_start,
 
 	switch (type) {
 	case RTN_LOCAL:
-		rtfn = mctp_route_input;
+		rtfn = mctp_dst_input;
 		break;
 	case RTN_UNICAST:
-		rtfn = mctp_route_output;
+		rtfn = mctp_dst_output;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	ASSERT_RTNL();
+
 	rt = mctp_route_alloc();
 	if (!rt)
 		return -ENOMEM;
@@ -1121,7 +1131,6 @@ static int mctp_route_add(struct mctp_dev *mdev, mctp_eid_t daddr_start,
 	rt->type = type;
 	rt->output = rtfn;
 
-	ASSERT_RTNL();
 	/* Prevent duplicate identical routes. */
 	list_for_each_entry(ert, &net->mctp.routes, list) {
 		if (mctp_rt_compare_exact(rt, ert)) {
@@ -1200,8 +1209,9 @@ static int mctp_pkttype_receive(struct sk_buff *skb, struct net_device *dev,
 	struct net *net = dev_net(dev);
 	struct mctp_dev *mdev;
 	struct mctp_skb_cb *cb;
-	struct mctp_route *rt;
+	struct mctp_dst dst;
 	struct mctp_hdr *mh;
+	int rc;
 
 	rcu_read_lock();
 	mdev = __mctp_dev_get(dev);
@@ -1243,17 +1253,17 @@ static int mctp_pkttype_receive(struct sk_buff *skb, struct net_device *dev,
 	cb->net = READ_ONCE(mdev->net);
 	cb->ifindex = dev->ifindex;
 
-	rt = mctp_route_lookup(net, cb->net, mh->dest);
+	rc = mctp_route_lookup(net, cb->net, mh->dest, &dst);
 
 	/* NULL EID, but addressed to our physical address */
-	if (!rt && mh->dest == MCTP_ADDR_NULL && skb->pkt_type == PACKET_HOST)
-		rt = mctp_route_lookup_null(net, dev);
+	if (rc && mh->dest == MCTP_ADDR_NULL && skb->pkt_type == PACKET_HOST)
+		rc = mctp_route_lookup_null(net, dev, &dst);
 
-	if (!rt)
+	if (rc)
 		goto err_drop;
 
-	rt->output(rt, skb);
-	mctp_route_release(rt);
+	dst.output(&dst, skb);
+	mctp_dst_release(&dst);
 	mctp_dev_put(mdev);
 
 	return NET_RX_SUCCESS;
diff --git a/net/mctp/test/route-test.c b/net/mctp/test/route-test.c
index 44ebc8e4e30c6a8f91360926ede99510df2576b2..7a1eba463fe77e4419dfeb94341562541a13fe8a 100644
--- a/net/mctp/test/route-test.c
+++ b/net/mctp/test/route-test.c
@@ -2,18 +2,37 @@
 
 #include <kunit/test.h>
 
+/* keep clangd happy when compiled outside of the route.c include */
+#include <net/mctp.h>
+#include <net/mctpdevice.h>
+
 #include "utils.h"
 
 struct mctp_test_route {
 	struct mctp_route	rt;
-	struct sk_buff_head	pkts;
 };
 
-static int mctp_test_route_output(struct mctp_route *rt, struct sk_buff *skb)
+static const unsigned int test_pktqueue_magic = 0x5f713aef;
+
+struct mctp_test_pktqueue {
+	unsigned int magic;
+	struct sk_buff_head pkts;
+};
+
+static void mctp_test_pktqueue_init(struct mctp_test_pktqueue *tpq)
+{
+	tpq->magic = test_pktqueue_magic;
+	skb_queue_head_init(&tpq->pkts);
+}
+
+static int mctp_test_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
 {
-	struct mctp_test_route *test_rt = container_of(rt, struct mctp_test_route, rt);
+	struct kunit *test = current->kunit_test;
+	struct mctp_test_pktqueue *tpq = test->priv;
+
+	KUNIT_ASSERT_EQ(test, tpq->magic, test_pktqueue_magic);
 
-	skb_queue_tail(&test_rt->pkts, skb);
+	skb_queue_tail(&tpq->pkts, skb);
 
 	return 0;
 }
@@ -29,9 +48,7 @@ static struct mctp_test_route *mctp_route_test_alloc(void)
 
 	INIT_LIST_HEAD(&rt->rt.list);
 	refcount_set(&rt->rt.refs, 1);
-	rt->rt.output = mctp_test_route_output;
-
-	skb_queue_head_init(&rt->pkts);
+	rt->rt.output = mctp_test_dst_output;
 
 	return rt;
 }
@@ -60,6 +77,32 @@ static struct mctp_test_route *mctp_test_create_route(struct net *net,
 	return rt;
 }
 
+/* Convenience function for our test dst; release with mctp_test_dst_release()
+ */
+static void mctp_test_dst_setup(struct kunit *test, struct mctp_dst *dst,
+				struct mctp_test_dev *dev,
+				struct mctp_test_pktqueue *tpq,
+				unsigned int mtu)
+{
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);
+
+	memset(dst, 0, sizeof(*dst));
+
+	dst->dev = dev->mdev;
+	__mctp_dev_get(dst->dev->dev);
+	dst->mtu = mtu;
+	dst->output = mctp_test_dst_output;
+	mctp_test_pktqueue_init(tpq);
+	test->priv = tpq;
+}
+
+static void mctp_test_dst_release(struct mctp_dst *dst,
+				  struct mctp_test_pktqueue *tpq)
+{
+	mctp_dst_release(dst);
+	skb_queue_purge(&tpq->pkts);
+}
+
 static void mctp_test_route_destroy(struct kunit *test,
 				    struct mctp_test_route *rt)
 {
@@ -69,7 +112,6 @@ static void mctp_test_route_destroy(struct kunit *test,
 	list_del_rcu(&rt->rt.list);
 	rtnl_unlock();
 
-	skb_queue_purge(&rt->pkts);
 	if (rt->rt.dev)
 		mctp_dev_put(rt->rt.dev);
 
@@ -141,8 +183,10 @@ struct mctp_frag_test {
 static void mctp_test_fragment(struct kunit *test)
 {
 	const struct mctp_frag_test *params;
+	struct mctp_test_pktqueue tpq;
 	int rc, i, n, mtu, msgsize;
-	struct mctp_test_route *rt;
+	struct mctp_test_dev *dev;
+	struct mctp_dst dst;
 	struct sk_buff *skb;
 	struct mctp_hdr hdr;
 	u8 seq;
@@ -159,13 +203,15 @@ static void mctp_test_fragment(struct kunit *test)
 	skb = mctp_test_create_skb(&hdr, msgsize);
 	KUNIT_ASSERT_TRUE(test, skb);
 
-	rt = mctp_test_create_route(&init_net, NULL, 10, mtu);
-	KUNIT_ASSERT_TRUE(test, rt);
+	dev = mctp_test_create_dev();
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	mctp_test_dst_setup(test, &dst, dev, &tpq, mtu);
 
-	rc = mctp_do_fragment_route(&rt->rt, skb, mtu, MCTP_TAG_OWNER);
+	rc = mctp_do_fragment_route(&dst, skb, mtu, MCTP_TAG_OWNER);
 	KUNIT_EXPECT_FALSE(test, rc);
 
-	n = rt->pkts.qlen;
+	n = tpq.pkts.qlen;
 
 	KUNIT_EXPECT_EQ(test, n, params->n_frags);
 
@@ -178,7 +224,7 @@ static void mctp_test_fragment(struct kunit *test)
 		first = i == 0;
 		last = i == (n - 1);
 
-		skb2 = skb_dequeue(&rt->pkts);
+		skb2 = skb_dequeue(&tpq.pkts);
 
 		if (!skb2)
 			break;
@@ -216,7 +262,8 @@ static void mctp_test_fragment(struct kunit *test)
 		kfree_skb(skb2);
 	}
 
-	mctp_test_route_destroy(test, rt);
+	mctp_test_dst_release(&dst, &tpq);
+	mctp_test_destroy_dev(dev);
 }
 
 static const struct mctp_frag_test mctp_frag_tests[] = {
@@ -246,11 +293,13 @@ struct mctp_rx_input_test {
 static void mctp_test_rx_input(struct kunit *test)
 {
 	const struct mctp_rx_input_test *params;
+	struct mctp_test_pktqueue tpq;
 	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
 	struct sk_buff *skb;
 
 	params = test->param_value;
+	test->priv = &tpq;
 
 	dev = mctp_test_create_dev();
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
@@ -261,10 +310,13 @@ static void mctp_test_rx_input(struct kunit *test)
 	skb = mctp_test_create_skb(&params->hdr, 1);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
 
+	mctp_test_pktqueue_init(&tpq);
+
 	mctp_pkttype_receive(skb, dev->ndev, &mctp_packet_type, NULL);
 
-	KUNIT_EXPECT_EQ(test, !!rt->pkts.qlen, params->input);
+	KUNIT_EXPECT_EQ(test, !!tpq.pkts.qlen, params->input);
 
+	skb_queue_purge(&tpq.pkts);
 	mctp_test_route_destroy(test, rt);
 	mctp_test_destroy_dev(dev);
 }
@@ -292,12 +344,12 @@ KUNIT_ARRAY_PARAM(mctp_rx_input, mctp_rx_input_tests,
 /* set up a local dev, route on EID 8, and a socket listening on type 0 */
 static void __mctp_route_test_init(struct kunit *test,
 				   struct mctp_test_dev **devp,
-				   struct mctp_test_route **rtp,
+				   struct mctp_dst *dst,
+				   struct mctp_test_pktqueue *tpq,
 				   struct socket **sockp,
 				   unsigned int netid)
 {
 	struct sockaddr_mctp addr = {0};
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
 	struct socket *sock;
 	int rc;
@@ -307,8 +359,7 @@ static void __mctp_route_test_init(struct kunit *test,
 	if (netid != MCTP_NET_ANY)
 		WRITE_ONCE(dev->mdev->net, netid);
 
-	rt = mctp_test_create_route(&init_net, dev->mdev, 8, 68);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt);
+	mctp_test_dst_setup(test, dst, dev, tpq, 68);
 
 	rc = sock_create_kern(&init_net, AF_MCTP, SOCK_DGRAM, 0, &sock);
 	KUNIT_ASSERT_EQ(test, rc, 0);
@@ -320,18 +371,18 @@ static void __mctp_route_test_init(struct kunit *test,
 	rc = kernel_bind(sock, (struct sockaddr *)&addr, sizeof(addr));
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
-	*rtp = rt;
 	*devp = dev;
 	*sockp = sock;
 }
 
 static void __mctp_route_test_fini(struct kunit *test,
 				   struct mctp_test_dev *dev,
-				   struct mctp_test_route *rt,
+				   struct mctp_dst *dst,
+				   struct mctp_test_pktqueue *tpq,
 				   struct socket *sock)
 {
 	sock_release(sock);
-	mctp_test_route_destroy(test, rt);
+	mctp_test_dst_release(dst, tpq);
 	mctp_test_destroy_dev(dev);
 }
 
@@ -344,22 +395,24 @@ struct mctp_route_input_sk_test {
 static void mctp_test_route_input_sk(struct kunit *test)
 {
 	const struct mctp_route_input_sk_test *params;
+	struct mctp_test_pktqueue tpq;
 	struct sk_buff *skb, *skb2;
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
+	struct mctp_dst dst;
 	struct socket *sock;
 	int rc;
 
 	params = test->param_value;
 
-	__mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);
+	__mctp_route_test_init(test, &dev, &dst, &tpq, &sock, MCTP_NET_ANY);
 
 	skb = mctp_test_create_skb_data(&params->hdr, &params->type);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
 
 	mctp_test_skb_set_dev(skb, dev);
+	mctp_test_pktqueue_init(&tpq);
 
-	rc = mctp_route_input(&rt->rt, skb);
+	rc = mctp_dst_input(&dst, skb);
 
 	if (params->deliver) {
 		KUNIT_EXPECT_EQ(test, rc, 0);
@@ -376,7 +429,7 @@ static void mctp_test_route_input_sk(struct kunit *test)
 		KUNIT_EXPECT_NULL(test, skb2);
 	}
 
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, &dst, &tpq, sock);
 }
 
 #define FL_S	(MCTP_HDR_FLAG_SOM)
@@ -413,16 +466,17 @@ struct mctp_route_input_sk_reasm_test {
 static void mctp_test_route_input_sk_reasm(struct kunit *test)
 {
 	const struct mctp_route_input_sk_reasm_test *params;
+	struct mctp_test_pktqueue tpq;
 	struct sk_buff *skb, *skb2;
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
+	struct mctp_dst dst;
 	struct socket *sock;
 	int i, rc;
 	u8 c;
 
 	params = test->param_value;
 
-	__mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);
+	__mctp_route_test_init(test, &dev, &dst, &tpq, &sock, MCTP_NET_ANY);
 
 	for (i = 0; i < params->n_hdrs; i++) {
 		c = i;
@@ -431,7 +485,7 @@ static void mctp_test_route_input_sk_reasm(struct kunit *test)
 
 		mctp_test_skb_set_dev(skb, dev);
 
-		rc = mctp_route_input(&rt->rt, skb);
+		rc = mctp_dst_input(&dst, skb);
 	}
 
 	skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
@@ -445,7 +499,7 @@ static void mctp_test_route_input_sk_reasm(struct kunit *test)
 		KUNIT_EXPECT_NULL(test, skb2);
 	}
 
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, &dst, &tpq, sock);
 }
 
 #define RX_FRAG(f, s) RX_HDR(1, 10, 8, FL_TO | (f) | ((s) << MCTP_HDR_SEQ_SHIFT))
@@ -547,7 +601,7 @@ struct mctp_route_input_sk_keys_test {
 static void mctp_test_route_input_sk_keys(struct kunit *test)
 {
 	const struct mctp_route_input_sk_keys_test *params;
-	struct mctp_test_route *rt;
+	struct mctp_test_pktqueue tpq;
 	struct sk_buff *skb, *skb2;
 	struct mctp_test_dev *dev;
 	struct mctp_sk_key *key;
@@ -555,6 +609,7 @@ static void mctp_test_route_input_sk_keys(struct kunit *test)
 	struct mctp_sock *msk;
 	struct socket *sock;
 	unsigned long flags;
+	struct mctp_dst dst;
 	unsigned int net;
 	int rc;
 	u8 c;
@@ -565,8 +620,7 @@ static void mctp_test_route_input_sk_keys(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 	net = READ_ONCE(dev->mdev->net);
 
-	rt = mctp_test_create_route(&init_net, dev->mdev, 8, 68);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt);
+	mctp_test_dst_setup(test, &dst, dev, &tpq, 68);
 
 	rc = sock_create_kern(&init_net, AF_MCTP, SOCK_DGRAM, 0, &sock);
 	KUNIT_ASSERT_EQ(test, rc, 0);
@@ -592,7 +646,7 @@ static void mctp_test_route_input_sk_keys(struct kunit *test)
 
 	mctp_test_skb_set_dev(skb, dev);
 
-	rc = mctp_route_input(&rt->rt, skb);
+	rc = mctp_dst_input(&dst, skb);
 
 	/* (potentially) receive message */
 	skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
@@ -606,7 +660,7 @@ static void mctp_test_route_input_sk_keys(struct kunit *test)
 		skb_free_datagram(sock->sk, skb2);
 
 	mctp_key_unref(key);
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, &dst, &tpq, sock);
 }
 
 static const struct mctp_route_input_sk_keys_test mctp_route_input_sk_keys_tests[] = {
@@ -681,7 +735,8 @@ KUNIT_ARRAY_PARAM(mctp_route_input_sk_keys, mctp_route_input_sk_keys_tests,
 struct test_net {
 	unsigned int netid;
 	struct mctp_test_dev *dev;
-	struct mctp_test_route *rt;
+	struct mctp_test_pktqueue tpq;
+	struct mctp_dst dst;
 	struct socket *sock;
 	struct sk_buff *skb;
 	struct mctp_sk_key *key;
@@ -699,18 +754,20 @@ mctp_test_route_input_multiple_nets_bind_init(struct kunit *test,
 
 	t->msg.data = t->netid;
 
-	__mctp_route_test_init(test, &t->dev, &t->rt, &t->sock, t->netid);
+	__mctp_route_test_init(test, &t->dev, &t->dst, &t->tpq, &t->sock,
+			       t->netid);
 
 	t->skb = mctp_test_create_skb_data(&hdr, &t->msg);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, t->skb);
 	mctp_test_skb_set_dev(t->skb, t->dev);
+	mctp_test_pktqueue_init(&t->tpq);
 }
 
 static void
 mctp_test_route_input_multiple_nets_bind_fini(struct kunit *test,
 					      struct test_net *t)
 {
-	__mctp_route_test_fini(test, t->dev, t->rt, t->sock);
+	__mctp_route_test_fini(test, t->dev, &t->dst, &t->tpq, t->sock);
 }
 
 /* Test that skbs from different nets (otherwise identical) get routed to their
@@ -731,9 +788,9 @@ static void mctp_test_route_input_multiple_nets_bind(struct kunit *test)
 	mctp_test_route_input_multiple_nets_bind_init(test, &t1);
 	mctp_test_route_input_multiple_nets_bind_init(test, &t2);
 
-	rc = mctp_route_input(&t1.rt->rt, t1.skb);
+	rc = mctp_dst_input(&t1.dst, t1.skb);
 	KUNIT_ASSERT_EQ(test, rc, 0);
-	rc = mctp_route_input(&t2.rt->rt, t2.skb);
+	rc = mctp_dst_input(&t2.dst, t2.skb);
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
 	rx_skb1 = skb_recv_datagram(t1.sock->sk, MSG_DONTWAIT, &rc);
@@ -767,7 +824,8 @@ mctp_test_route_input_multiple_nets_key_init(struct kunit *test,
 
 	t->msg.data = t->netid;
 
-	__mctp_route_test_init(test, &t->dev, &t->rt, &t->sock, t->netid);
+	__mctp_route_test_init(test, &t->dev, &t->dst, &t->tpq, &t->sock,
+			       t->netid);
 
 	msk = container_of(t->sock->sk, struct mctp_sock, sk);
 
@@ -790,7 +848,7 @@ mctp_test_route_input_multiple_nets_key_fini(struct kunit *test,
 					     struct test_net *t)
 {
 	mctp_key_unref(t->key);
-	__mctp_route_test_fini(test, t->dev, t->rt, t->sock);
+	__mctp_route_test_fini(test, t->dev, &t->dst, &t->tpq, t->sock);
 }
 
 /* test that skbs from different nets (otherwise identical) get routed to their
@@ -812,9 +870,9 @@ static void mctp_test_route_input_multiple_nets_key(struct kunit *test)
 	mctp_test_route_input_multiple_nets_key_init(test, &t1);
 	mctp_test_route_input_multiple_nets_key_init(test, &t2);
 
-	rc = mctp_route_input(&t1.rt->rt, t1.skb);
+	rc = mctp_dst_input(&t1.dst, t1.skb);
 	KUNIT_ASSERT_EQ(test, rc, 0);
-	rc = mctp_route_input(&t2.rt->rt, t2.skb);
+	rc = mctp_dst_input(&t2.dst, t2.skb);
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
 	rx_skb1 = skb_recv_datagram(t1.sock->sk, MSG_DONTWAIT, &rc);
@@ -843,13 +901,14 @@ static void mctp_test_route_input_multiple_nets_key(struct kunit *test)
 static void mctp_test_route_input_sk_fail_single(struct kunit *test)
 {
 	const struct mctp_hdr hdr = RX_HDR(1, 10, 8, FL_S | FL_E | FL_TO);
-	struct mctp_test_route *rt;
+	struct mctp_test_pktqueue tpq;
 	struct mctp_test_dev *dev;
+	struct mctp_dst dst;
 	struct socket *sock;
 	struct sk_buff *skb;
 	int rc;
 
-	__mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);
+	__mctp_route_test_init(test, &dev, &dst, &tpq, &sock, MCTP_NET_ANY);
 
 	/* No rcvbuf space, so delivery should fail. __sock_set_rcvbuf will
 	 * clamp the minimum to SOCK_MIN_RCVBUF, so we open-code this.
@@ -865,14 +924,14 @@ static void mctp_test_route_input_sk_fail_single(struct kunit *test)
 	mctp_test_skb_set_dev(skb, dev);
 
 	/* do route input, which should fail */
-	rc = mctp_route_input(&rt->rt, skb);
+	rc = mctp_dst_input(&dst, skb);
 	KUNIT_EXPECT_NE(test, rc, 0);
 
 	/* we should hold the only reference to skb */
 	KUNIT_EXPECT_EQ(test, refcount_read(&skb->users), 1);
 	kfree_skb(skb);
 
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, &dst, &tpq, sock);
 }
 
 /* Input route to socket, using a fragmented message, where sock delivery fails.
@@ -880,14 +939,15 @@ static void mctp_test_route_input_sk_fail_single(struct kunit *test)
 static void mctp_test_route_input_sk_fail_frag(struct kunit *test)
 {
 	const struct mctp_hdr hdrs[2] = { RX_FRAG(FL_S, 0), RX_FRAG(FL_E, 1) };
-	struct mctp_test_route *rt;
+	struct mctp_test_pktqueue tpq;
 	struct mctp_test_dev *dev;
 	struct sk_buff *skbs[2];
+	struct mctp_dst dst;
 	struct socket *sock;
 	unsigned int i;
 	int rc;
 
-	__mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);
+	__mctp_route_test_init(test, &dev, &dst, &tpq, &sock, MCTP_NET_ANY);
 
 	lock_sock(sock->sk);
 	WRITE_ONCE(sock->sk->sk_rcvbuf, 0);
@@ -904,11 +964,11 @@ static void mctp_test_route_input_sk_fail_frag(struct kunit *test)
 	/* first route input should succeed, we're only queueing to the
 	 * frag list
 	 */
-	rc = mctp_route_input(&rt->rt, skbs[0]);
+	rc = mctp_dst_input(&dst, skbs[0]);
 	KUNIT_EXPECT_EQ(test, rc, 0);
 
 	/* final route input should fail to deliver to the socket */
-	rc = mctp_route_input(&rt->rt, skbs[1]);
+	rc = mctp_dst_input(&dst, skbs[1]);
 	KUNIT_EXPECT_NE(test, rc, 0);
 
 	/* we should hold the only reference to both skbs */
@@ -918,7 +978,7 @@ static void mctp_test_route_input_sk_fail_frag(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, refcount_read(&skbs[1]->users), 1);
 	kfree_skb(skbs[1]);
 
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, &dst, &tpq, sock);
 }
 
 /* Input route to socket, using a fragmented message created from clones.
@@ -936,10 +996,11 @@ static void mctp_test_route_input_cloned_frag(struct kunit *test)
 	const size_t data_len = 3; /* arbitrary */
 	u8 compare[3 * ARRAY_SIZE(hdrs)];
 	u8 flat[3 * ARRAY_SIZE(hdrs)];
-	struct mctp_test_route *rt;
+	struct mctp_test_pktqueue tpq;
 	struct mctp_test_dev *dev;
 	struct sk_buff *skb[5];
 	struct sk_buff *rx_skb;
+	struct mctp_dst dst;
 	struct socket *sock;
 	size_t total;
 	void *p;
@@ -947,7 +1008,7 @@ static void mctp_test_route_input_cloned_frag(struct kunit *test)
 
 	total = data_len + sizeof(struct mctp_hdr);
 
-	__mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);
+	__mctp_route_test_init(test, &dev, &dst, &tpq, &sock, MCTP_NET_ANY);
 
 	/* Create a single skb initially with concatenated packets */
 	skb[0] = mctp_test_create_skb(&hdrs[0], 5 * total);
@@ -986,7 +1047,7 @@ static void mctp_test_route_input_cloned_frag(struct kunit *test)
 
 	/* Feed the fragments into MCTP core */
 	for (int i = 0; i < 5; i++) {
-		rc = mctp_route_input(&rt->rt, skb[i]);
+		rc = mctp_dst_input(&dst, skb[i]);
 		KUNIT_EXPECT_EQ(test, rc, 0);
 	}
 
@@ -1024,29 +1085,29 @@ static void mctp_test_route_input_cloned_frag(struct kunit *test)
 		kfree_skb(skb[i]);
 	}
 
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, &dst, &tpq, sock);
 }
 
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 
 static void mctp_test_flow_init(struct kunit *test,
 				struct mctp_test_dev **devp,
-				struct mctp_test_route **rtp,
+				struct mctp_dst *dst,
+				struct mctp_test_pktqueue *tpq,
 				struct socket **sock,
 				struct sk_buff **skbp,
 				unsigned int len)
 {
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
 	struct sk_buff *skb;
 
 	/* we have a slightly odd routing setup here; the test route
 	 * is for EID 8, which is our local EID. We don't do a routing
 	 * lookup, so that's fine - all we require is a path through
-	 * mctp_local_output, which will call rt->output on whatever
+	 * mctp_local_output, which will call dst->output on whatever
 	 * route we provide
 	 */
-	__mctp_route_test_init(test, &dev, &rt, sock, MCTP_NET_ANY);
+	__mctp_route_test_init(test, &dev, dst, tpq, sock, MCTP_NET_ANY);
 
 	/* Assign a single EID. ->addrs is freed on mctp netdev release */
 	dev->mdev->addrs = kmalloc(sizeof(u8), GFP_KERNEL);
@@ -1059,42 +1120,41 @@ static void mctp_test_flow_init(struct kunit *test,
 	skb_reserve(skb, sizeof(struct mctp_hdr) + 1);
 	memset(skb_put(skb, len), 0, len);
 
-	/* take a ref for the route, we'll decrement in local output */
-	refcount_inc(&rt->rt.refs);
 
 	*devp = dev;
-	*rtp = rt;
 	*skbp = skb;
 }
 
 static void mctp_test_flow_fini(struct kunit *test,
 				struct mctp_test_dev *dev,
-				struct mctp_test_route *rt,
+				struct mctp_dst *dst,
+				struct mctp_test_pktqueue *tpq,
 				struct socket *sock)
 {
-	__mctp_route_test_fini(test, dev, rt, sock);
+	__mctp_route_test_fini(test, dev, dst, tpq, sock);
 }
 
 /* test that an outgoing skb has the correct MCTP extension data set */
 static void mctp_test_packet_flow(struct kunit *test)
 {
+	struct mctp_test_pktqueue tpq;
 	struct sk_buff *skb, *skb2;
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
+	struct mctp_dst dst;
 	struct mctp_flow *flow;
 	struct socket *sock;
-	u8 dst = 8;
+	u8 dst_eid = 8;
 	int n, rc;
 
-	mctp_test_flow_init(test, &dev, &rt, &sock, &skb, 30);
+	mctp_test_flow_init(test, &dev, &dst, &tpq, &sock, &skb, 30);
 
-	rc = mctp_local_output(sock->sk, &rt->rt, skb, dst, MCTP_TAG_OWNER);
+	rc = mctp_local_output(sock->sk, &dst, skb, dst_eid, MCTP_TAG_OWNER);
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
-	n = rt->pkts.qlen;
+	n = tpq.pkts.qlen;
 	KUNIT_ASSERT_EQ(test, n, 1);
 
-	skb2 = skb_dequeue(&rt->pkts);
+	skb2 = skb_dequeue(&tpq.pkts);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb2);
 
 	flow = skb_ext_find(skb2, SKB_EXT_MCTP);
@@ -1103,7 +1163,7 @@ static void mctp_test_packet_flow(struct kunit *test)
 	KUNIT_ASSERT_PTR_EQ(test, flow->key->sk, sock->sk);
 
 	kfree_skb(skb2);
-	mctp_test_flow_fini(test, dev, rt, sock);
+	mctp_test_flow_fini(test, dev, &dst, &tpq, sock);
 }
 
 /* test that outgoing skbs, after fragmentation, all have the correct MCTP
@@ -1111,26 +1171,27 @@ static void mctp_test_packet_flow(struct kunit *test)
  */
 static void mctp_test_fragment_flow(struct kunit *test)
 {
+	struct mctp_test_pktqueue tpq;
 	struct mctp_flow *flows[2];
 	struct sk_buff *tx_skbs[2];
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
+	struct mctp_dst dst;
 	struct sk_buff *skb;
 	struct socket *sock;
-	u8 dst = 8;
+	u8 dst_eid = 8;
 	int n, rc;
 
-	mctp_test_flow_init(test, &dev, &rt, &sock, &skb, 100);
+	mctp_test_flow_init(test, &dev, &dst, &tpq, &sock, &skb, 100);
 
-	rc = mctp_local_output(sock->sk, &rt->rt, skb, dst, MCTP_TAG_OWNER);
+	rc = mctp_local_output(sock->sk, &dst, skb, dst_eid, MCTP_TAG_OWNER);
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
-	n = rt->pkts.qlen;
+	n = tpq.pkts.qlen;
 	KUNIT_ASSERT_EQ(test, n, 2);
 
 	/* both resulting packets should have the same flow data */
-	tx_skbs[0] = skb_dequeue(&rt->pkts);
-	tx_skbs[1] = skb_dequeue(&rt->pkts);
+	tx_skbs[0] = skb_dequeue(&tpq.pkts);
+	tx_skbs[1] = skb_dequeue(&tpq.pkts);
 
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tx_skbs[0]);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tx_skbs[1]);
@@ -1146,7 +1207,7 @@ static void mctp_test_fragment_flow(struct kunit *test)
 
 	kfree_skb(tx_skbs[0]);
 	kfree_skb(tx_skbs[1]);
-	mctp_test_flow_fini(test, dev, rt, sock);
+	mctp_test_flow_fini(test, dev, &dst, &tpq, sock);
 }
 
 #else
@@ -1164,15 +1225,16 @@ static void mctp_test_fragment_flow(struct kunit *test)
 /* Test that outgoing skbs cause a suitable tag to be created */
 static void mctp_test_route_output_key_create(struct kunit *test)
 {
+	const u8 dst_eid = 26, src_eid = 15;
+	struct mctp_test_pktqueue tpq;
 	const unsigned int netid = 50;
-	const u8 dst = 26, src = 15;
-	struct mctp_test_route *rt;
 	struct mctp_test_dev *dev;
 	struct mctp_sk_key *key;
 	struct netns_mctp *mns;
 	unsigned long flags;
 	struct socket *sock;
 	struct sk_buff *skb;
+	struct mctp_dst dst;
 	bool empty, single;
 	const int len = 2;
 	int rc;
@@ -1181,15 +1243,14 @@ static void mctp_test_route_output_key_create(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 	WRITE_ONCE(dev->mdev->net, netid);
 
-	rt = mctp_test_create_route(&init_net, dev->mdev, dst, 68);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt);
+	mctp_test_dst_setup(test, &dst, dev, &tpq, 68);
 
 	rc = sock_create_kern(&init_net, AF_MCTP, SOCK_DGRAM, 0, &sock);
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
 	dev->mdev->addrs = kmalloc(sizeof(u8), GFP_KERNEL);
 	dev->mdev->num_addrs = 1;
-	dev->mdev->addrs[0] = src;
+	dev->mdev->addrs[0] = src_eid;
 
 	skb = alloc_skb(sizeof(struct mctp_hdr) + 1 + len, GFP_KERNEL);
 	KUNIT_ASSERT_TRUE(test, skb);
@@ -1197,8 +1258,6 @@ static void mctp_test_route_output_key_create(struct kunit *test)
 	skb_reserve(skb, sizeof(struct mctp_hdr) + 1 + len);
 	memset(skb_put(skb, len), 0, len);
 
-	refcount_inc(&rt->rt.refs);
-
 	mns = &sock_net(sock->sk)->mctp;
 
 	/* We assume we're starting from an empty keys list, which requires
@@ -1209,7 +1268,7 @@ static void mctp_test_route_output_key_create(struct kunit *test)
 	spin_unlock_irqrestore(&mns->keys_lock, flags);
 	KUNIT_ASSERT_TRUE(test, empty);
 
-	rc = mctp_local_output(sock->sk, &rt->rt, skb, dst, MCTP_TAG_OWNER);
+	rc = mctp_local_output(sock->sk, &dst, skb, dst_eid, MCTP_TAG_OWNER);
 	KUNIT_ASSERT_EQ(test, rc, 0);
 
 	key = NULL;
@@ -1225,13 +1284,13 @@ static void mctp_test_route_output_key_create(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, single);
 
 	KUNIT_EXPECT_EQ(test, key->net, netid);
-	KUNIT_EXPECT_EQ(test, key->local_addr, src);
-	KUNIT_EXPECT_EQ(test, key->peer_addr, dst);
+	KUNIT_EXPECT_EQ(test, key->local_addr, src_eid);
+	KUNIT_EXPECT_EQ(test, key->peer_addr, dst_eid);
 	/* key has incoming tag, so inverse of what we sent */
 	KUNIT_EXPECT_FALSE(test, key->tag & MCTP_TAG_OWNER);
 
 	sock_release(sock);
-	mctp_test_route_destroy(test, rt);
+	mctp_test_dst_release(&dst, &tpq);
 	mctp_test_destroy_dev(dev);
 }
 

-- 
2.34.1


