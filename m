Return-Path: <openbmc+bounces-1044-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37762CC5B4C
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 02:36:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWGbR5RQhz2yPM;
	Wed, 17 Dec 2025 12:36:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.53.50 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765935363;
	cv=pass; b=cQtpHF7zp0u/FBFmtBJtp9g6IDt1Tj9kjtp+kqE0P2y/d00UIo6W4zNocgoF/5NyRmfndVHSzEURJk2HzgwmQDVhLC83kI5IW7IHJ/1qqI8OS2gohbwZPcGyjrwN+t+R9O++4ayEB7uwinQN17wpK4aFsHe8ePpyUuueJXS7yPn3GSGEHGQS/fn8okVjdSyMgQd2n98kOybfCN4e6Dl6t2YvMBjci/fS0zFB5plUnEbE9Z8l6UqKL++yO3/xahYurm9Ub723oT+8S+GT76vUkGDhESRK0XwXlC6w/gPZX44SyrPNhEFJh6WTj0+gPcEbkfAsPkeuT6gXXHf0Wj1MSA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765935363; c=relaxed/relaxed;
	bh=ZIr5Y8SvKVv+6M2zJChUeBQDp19zZmfgr+Q2QrC8RQE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:MIME-Version; b=CS9l2fk/1v4TTcD1nmyrQT5ZhFxoquar3p9YwbksDIRR8fUb1nCTPvCbv4bQG1hPdNnsfhYKT/jipTccaQAco5c9zYnUQlikMGAf8+Wq8db9DPjTti8eIzETgBAOcHydwE/CkxdtjSnvsV6azTYu9Wem0dmr5/UEoASbyOxADSKl/N1biLLopuCqXr/z7LDDhfprcMINdCT8pOwh3YJpYVogG7LXsvQ4qZhwjkDNmoCOkG3TZ9zFeJqqB5UZSKDhopd0ERJpXSXu8ek5WXAfo2hQcMtA3HfGLCp/dSX+N0CctUVO5MWhsfdjG22Eyv0pz6B1aVeICew6lZ7SOyNiXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r5TVsE27; dkim-atps=neutral; spf=pass (client-ip=52.101.53.50; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r5TVsE27;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.53.50; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWGbQ5SxWz2yNJ
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 12:36:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISbuZNqyFw+TWil/Wn0n9H3FWZPDlSfXmkZFSEIA4RFdatHVcUeQAJga3+cd+U/4etxoS/9DLNV45slhLNZ76SA9pZUZeNuor3UXZv/1LWTw2yJu7eIMXHCOaTDC8ujRvF1FEe8Wn83wjPV0dEH2/sU9IG2mY2SZYXIQ2ns7zYDbaRTzMCunfOhUXO0Z5c8WSUsisHr2bQMUqrAFqwbFqlJQTx63G1hK3jPGw8+UzfLss8Zbxu7XEa0iI3TsEeQ0H+/Od0Y5eCPE0kVjJHt6Oz6Ur6mDeQsv82TVdzXDZaZrX77MXaS9LooKS/mRtRpkHBUyzzXm7NjeIUeMDEXYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIr5Y8SvKVv+6M2zJChUeBQDp19zZmfgr+Q2QrC8RQE=;
 b=njIAlhe53I7wsbUUoxjXfS/wLYyMAVzAKLIWixhXA7NToGuiEHC8oBkLbgUPX5kwN8UHmOpexYsRaZJ8MP9DUltoM7r8ZmGZAmQaaDNxO3Je+i82+uGoW84M6+0OxiJ6VEkmUqhnCmtoZCuvG9I3gLdsh/2MRqEUuStnRPFPAQ+z2rvt7y+u3uO+actGiwu2bXl2Qgtbc9UExIS4pf9IHMgcbpqSeM1E94Hv9kpAyY8/XrFDdHXBxV+60k77gjYO1edLIJyH6AZD0zKVjALvMHeYIPd8Oy9XSwO7YkdQ8nFpb0GUia4tSN20WeC9UXBGy9PjYUFoc6Oe1Dd4FP6vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIr5Y8SvKVv+6M2zJChUeBQDp19zZmfgr+Q2QrC8RQE=;
 b=r5TVsE276yjbUCnnfuJFhuvCjx1Y6QePqv4XB2RxA6vvrs5Z712m8S2cxoDgF6ZjLKEBM18IvudxxYvLe4ie4bSpNne4JMu94GgB6tFPvgmOueb2qib0PS440DEFKuWG9+PdQlhtX2ZhTARqEEmEgc8IQYtCeEyJbCS/sNHpMZ/PWsi0hroqaAOEOsHNlczfyQlsshHBqQOtUOKE65q1wP4tDxUiZ/DXKjSlWwqMWMJhubmPGRABjF1zgYWQuIT63OPQ4lHdYy/0mfLKkyJ1DBLHAK+EjZyMXaGnRe2ExOMu4IcaPxHhk8LBidIDtEkTCd0WNaQi8RQu0/jpzwy5dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by LV2PR12MB5848.namprd12.prod.outlook.com
 (2603:10b6:408:173::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:34:50 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:34:50 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 16 Dec 2025 17:34:37 -0800
Subject: [PATCH u-boot v3 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-msx4-v3-1-14a4b0c3f359@nvidia.com>
References: <20251216-msx4-v3-0-14a4b0c3f359@nvidia.com>
In-Reply-To: <20251216-msx4-v3-0-14a4b0c3f359@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, 
 to=andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765935285; l=3034;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=seajQeXLPvxMEGJrgo0jh7pCJLtAhO/K5WG0s0uTtvg=;
 b=U3M1eOwMOu+uBLaeufFXYszlXayChQZFc3wJrWKCKxSl9LC/RiKOv2pcPe/tJKul2Ix/nHptG
 XQQH6tzMJ3mBxfj6KErljG6MHrsCt+dAc/JdfwMjf4eKku9xnSYvSHU
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0263.namprd04.prod.outlook.com
 (2603:10b6:303:88::28) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7894dd-7750-410c-a4a6-08de3d0c7861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHRMNm90NDFOUnRaeWN6Y0N2R3J6SWtYbkhKcE5ZMThBT29uQlNlbk4wMTJC?=
 =?utf-8?B?RkNPUG8vMmlNVkJENHFVbC9URkswQ3BXdGZPTThicHo1bU5sQzRzcnNBcXkr?=
 =?utf-8?B?Ylo1K0dnelkyZHRPajhLWWRkRkkwdGpNUmIyT3dhYW9DeGhIVzFUOEwrVjN6?=
 =?utf-8?B?ejNDZjVRWDlKRE9oZmVrZ2RwYURYMGtTUGV2bnI2d2ZNYk5RSmovU0p0NDgx?=
 =?utf-8?B?dmRxa0lUS2ZSR2g2U1BTZFEwcXQvVDdEMjcvRXB3TDN2cjc1WkJPYTN0Nmx4?=
 =?utf-8?B?S3ZaUTc1dk5YeCtoeCs5VkNudmNjRW9IWmhtdmhKN0tmSE1Db0xHeHJSbVhK?=
 =?utf-8?B?T3JjU3FxODdEdXdyRUxRUEtLdSs4OUxQRTVDRVA2VGJQN3FCMUVkQjEwZjFW?=
 =?utf-8?B?YlFwSlB4U2l5WmpPOUlqY2JpbmlFYVNXWm9WT0l2Qk9Ebks2Mjc0U2JEUDQ0?=
 =?utf-8?B?ekl4cnN2aXR2TFloUUxGT1pQWmpzaUh3Nm9tNHZQdmpJNk4xN3VnNUxFT1lU?=
 =?utf-8?B?YVREMnRTR2VPWElPRlNvVHAzZmRIQkdOenJCYTVlUkRnbFBGZ1dSUWRPYjZ0?=
 =?utf-8?B?QWpjejc4SjB5SmVwa2xNVzdaVDdSbnBDQ0xQNzNsQnVZTmRIOE1rMXFZNWsz?=
 =?utf-8?B?eUxWYXdYbE1SeVRKNk5XUllhWXRDYVNsanAwSnA4OUpQTXNLMStBbitXU3BN?=
 =?utf-8?B?VEdPVHFtUXpoWWdLbFcwZERYL2kyNS9Qbi9UMStEcE15SlNNOFc3djczQjEr?=
 =?utf-8?B?V2JPdDlkUjlqOUZ4bnZ3UUxVWExEUVF1dGllbWM5NThvdGZDS1h1c2gwUGlE?=
 =?utf-8?B?ZllGUzRzenQ4UmdaQnFtNVoxbHNmWVo5SkZDUTU2QVhLL1VLWDFGMERlVkxP?=
 =?utf-8?B?czlCNEwrZ3lBNk8rWkhYRkF1TzFtNzNXU2c5R2NRclczRG5YcXBOVFF5RnN2?=
 =?utf-8?B?ZWRTWU9Vd3JEek1qS0RYb0NCZDZpeVJPVFdwc2tuVitxaTZkRGVubXFYYzVN?=
 =?utf-8?B?S3VQQjJPM2RiUjhNRE50TjBQeVJ2NW04MU1nQVFkZndYRnR2MUtKZTV4WUtZ?=
 =?utf-8?B?VUVGbHhjdDBjYU80SmpvSFJBekx4Z2p0a3BkbGh5Q3VjSm1zcHpSYjlIalRB?=
 =?utf-8?B?RkZBZGhnUnQ5Q3VlL0p0K0FRY0N4eTNCTE5QKzA1eFByNGZ0M2hub1NKVFpH?=
 =?utf-8?B?aUFVQ1FVOUZ6clQvSGlha0xYQWI4NXE0dWxRblJJcWV0WVRYeERwY1JKWGdP?=
 =?utf-8?B?aldRbndkVnNvdlM4Sm9KKzNNOGllem5ZMkd2NjJkUXhWVGZuc0NIb3k4OTNL?=
 =?utf-8?B?eGRwR3dCVll0eElhM0JwNXExZW5WbU82a0FISG0vSW9VVnhrSTduUGFPSUV2?=
 =?utf-8?B?cExlbElMelFnSTVqL2plcDJ2ZGQ5NnlaRVFxaXZiaTlFTUZubk9VWS9iTVpp?=
 =?utf-8?B?ZkRnd1RZdlJDSGV0K0F1MkZtZEhiTDRYeUx5am41ZkswSTNwd0hVeERsb2ph?=
 =?utf-8?B?Vmt3dHB3L0Z4ZjVUdWFhbmVmbC95N0tkZjU0S3JMenc2NnhIQldYRTFoaE1B?=
 =?utf-8?B?RlV6YnBSajM5YXg1MDBoWTEwYTlRSEZqaGgyQUsrcGE5TFVMTUVqS1RPZzl1?=
 =?utf-8?B?Z1BvZXlDeDY3YmQ1UXpmM3IxVFV6UCtLbVZJSUkwR25ncExURWc4d3M0UlRF?=
 =?utf-8?B?TEJqYThVVXpYT3ZyZDBnL3NQMHRZMzZBdVVIOXpEcTl0R3ZFcktMSFcwbFpO?=
 =?utf-8?B?eXRYcFJnZ2pNUGJNNldpZE1tcUkvUWRaZFd1OCtJbmFTdGlTMHpxN2lObkhw?=
 =?utf-8?B?VzhCeEJCeTVINXlwd2pXRkViUkI4cUc0NGdBdDF4THkwVElDNzdMVU4yVXFs?=
 =?utf-8?B?SEFxZllTRXROa3NjTG5IUkVHT0hZdjZOaCtjSytoRUw0M0p2Rlh1ZkRMRnky?=
 =?utf-8?Q?xr4hWwlOIvZHzGiNBH6/VoPQcZ6Sd0Rw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pYYlpNcysydGtOTUVFUEZNVTBqNFRuRWsvZm10WUlJc2FvVzJNZXAyRFVX?=
 =?utf-8?B?elZYaUxhUkx5Y1Jjci9NYnd0bXoraGZQQVNSdStkMFc5WWExZzZBbGV2Ynl5?=
 =?utf-8?B?MldiSWlqWnVvK3FQdytYUGRTRmkrWWdySXVKdUUydHUvSE1zSmhZZjcvQjZR?=
 =?utf-8?B?Yng0N0VkOVh2OWtWMFQ2c3NOdkVmOXNHOEtkWXArSVFtTGdUMEo3MlVrKzFH?=
 =?utf-8?B?MFVLRm54QjJ6c1N3eE1Mdk5lWFpTaDV3eXdOT3ZCckp5QWVLNWxFdFpIRjZE?=
 =?utf-8?B?TC9lb2l5WnhWY0FXUVh6Z3ZIRlkzWWZBQmR1M0hxdHlFR29DQ0huL21DQ2xy?=
 =?utf-8?B?bGVtQ24wQVJwclptOWtqdnBabzNXRStiZlZYbkQ0cVFMNGxyTytaR3FiNXdm?=
 =?utf-8?B?MEZPT1JCZEF5Q1BURVkwdlVpZVp0aW91K1V6cUg2Z0pOUDdLT2FzNjI1bUdL?=
 =?utf-8?B?WGNxS3M5TTh0MVc5UDZRTjEvL0cwaGg1c3NseVdNMXhiQ0hUSHdleXdUVTFU?=
 =?utf-8?B?UkYrdnNoeFRaaE9xZEdabXlpM3E0OFc3SVJoaDcyUEFiQlREbUxHMVhheE1i?=
 =?utf-8?B?T2hENHRHaWcwejNUcC9ralcwQTkwVE12SWhjbWtudTRDYkljNC94MzgycEZz?=
 =?utf-8?B?VlBCVkF4ZjdlUlRIVnlMc0cwcHNMQ1Q3RkY3Y29KTmxFWHEwRWlLKzZleEdO?=
 =?utf-8?B?RWZSU2s2WXpuMlVYRGswOFl5aUpnNzhqYVhlUEpGWGZnYXRvNGxQOE1aZEp5?=
 =?utf-8?B?TTdISDRycUNkeW5CSlFrUEZ4QWVpZjN2QjNtUGdGOWw5Y0lHRis1WEtsZmJR?=
 =?utf-8?B?Vk9KQlpQM0FwS1MxeVhLMytwb29nY0ZjbFFUTERjcWYvWUFJUEM1NE43QzdG?=
 =?utf-8?B?T0U1QUdLR2FqSEtVTE55S0VUM2ZwalNaVmtQcDlFcDhuTjN0Y0Z0WjlhdmQ5?=
 =?utf-8?B?RjJTN1pMSzE3Smx0cjZQa1REaEI0aXQ5SHZqemIxaURhRXR5a1JvT2wrcFl4?=
 =?utf-8?B?Tkx3Z3h1eW9kOFhSUUYwbSs2bXo4eEYvK3JLZ2N2dlFnWGhjdHd1WmJ2NGQx?=
 =?utf-8?B?eDk1R28xaXN5MWp5YStUUWpONER6QktCQ2F4YVZ3UmRVNm1zL3FTbGpRV0I0?=
 =?utf-8?B?R1NidFVrM1NKOTlwNDdnekxRUmdiTytpN3FwTzNJSTV2c3ZvRktxUmdCblAr?=
 =?utf-8?B?ZmJJWVlldkgzWEJpRXBYSFN4S3ZibTlCRXdyV2x5ZXdOYytPOU9veEs3cDVk?=
 =?utf-8?B?SUlYcmx1d0UxcGhsbVZCbmpBWXBVSjZjOENWaE5na1FSOThVWGhhR0VsN05i?=
 =?utf-8?B?NVRZNTNHTDFwWnE1RjdNMUhxd1BzODlNK0N1amRkUW41UHg5SmNETGZyK0Vh?=
 =?utf-8?B?ZUdaa2NNOGs2QTlORWQ3RG5TV1hhQ3BNTXgzZlNPYUlVckhnc05GUWpHdGx1?=
 =?utf-8?B?aEhIV2Q4YUpEbnVJRXNnQUgxR3o3K01kaE00b1cwQkZ3V2R6UnFQVnE1cG5E?=
 =?utf-8?B?QlV6TGNESEphKzNxZURraC8zOGhKVWdqeXhHb210UHdLWnFCSys1Smg2ek56?=
 =?utf-8?B?dW1VTlpyN3A0a0E5anBrZksrNTBzRGNWY3Z3aGhWZUtFdkRpQ0xvbUdqYnRo?=
 =?utf-8?B?dEMyS292cFBHVnhSY0g4SjZ4dU1TRGdZOGpsdU1KcUhDcENvczBaRHFyUzBO?=
 =?utf-8?B?eTBYemJqWmRCSzI0WWwxQWFpNmhCVW1wSUFHeW42dnBPSDVydURFUll1a3RW?=
 =?utf-8?B?ZnVuWU5tR1ZPOXZnUGNVQlorbExHTG1PWFBaZ1phVmxoVm8zUTVDbFpkU1c0?=
 =?utf-8?B?NG14WStaZDJ4RkJYVTMvaHdQWTJFWnFIWUNNdCtrWlA1dUlpTjFGL0RhNHU5?=
 =?utf-8?B?eXcrcDIzWEE2bXhCODdZVVN6U2N6Vkx3YStNU21KV2VIcDdRWkdLdWxocVc5?=
 =?utf-8?B?WVcwUEJ3d3RkK1Y4ZmNzVlNLaHF6YnpMMUZNQ2V1Q1JoMWw0TFFBRUJLTlFa?=
 =?utf-8?B?TTJJKzZzMDJhVy9aekhIaVZxVms1Ym1qSmpXbldzV0FkVysrVGs3cXhXT2FB?=
 =?utf-8?B?YTNKV1JCYXU2T1Q3Sm9oaHphcTUrb0ZpTmJFNkxnRjB5Qy9nalFvdUtVbHll?=
 =?utf-8?Q?XVS7qsBS6u88yuo2cnpY2viEF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7894dd-7750-410c-a4a6-08de3d0c7861
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:34:50.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvclg162kMetPTVG2KehJ0KBqpgswMJq4poBZ7Bwuyi+R5ApxoyZziXTcgDCnQNlFWIOvWmSq21VMLPEB/ZiGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds support for disabling the ast2600 FMC_WDT2 through
a device tree entry in the fmc node.
Set `aspeed,watchdog-disable` in your device tree to have
the driver disable it.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 drivers/spi/aspeed_spi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
index 54520122f1c48c8b2052b4b1e47445a9b990d25e..24fb465066543c1659c7d4a05c7b3f0e59c39265 100644
--- a/drivers/spi/aspeed_spi.c
+++ b/drivers/spi/aspeed_spi.c
@@ -30,14 +30,16 @@ struct aspeed_spi_regs {
 					/* 0x30 .. 0x38 Segment Address */
 	u32 _reserved1[5];		/* .. */
 	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset Command Control */
-	u32 _reserved2[11];		/* .. */
+	u32 _reserved2[4];		/* .. */
+	u32 wdt2_ctrl;			/* 0x64 FMC_WDT2 control */
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
+#define WDT2_ENABLE		BIT(0)
 /*
  * flash related info
  */
@@ -267,6 +270,7 @@ struct aspeed_spi_priv {
 	ulong hclk_rate; /* AHB clock rate */
 	u8 num_cs;
 	bool is_fmc;
+	bool disable_wdt;
 
 	struct aspeed_spi_flash flashes[ASPEED_SPI_MAX_CS];
 	u32 flash_count;
@@ -683,6 +687,9 @@ static int aspeed_spi_controller_init(struct aspeed_spi_priv *priv)
 	setbits_le32(&priv->regs->conf,
 		     CONF_ENABLE_W2 | CONF_ENABLE_W1 | CONF_ENABLE_W0);
 
+	if (priv->is_fmc && priv->disable_wdt)
+		clrbits_le32(&priv->regs->wdt2_ctrl, WDT2_ENABLE);
+
 	/*
 	 * Set safe default settings for each device. These will be
 	 * tuned after the SPI flash devices are probed.
@@ -1907,6 +1914,8 @@ static int aspeed_spi_probe(struct udevice *bus)
 	 * SPI controllers
 	 */
 	priv->is_fmc = dev_get_driver_data(bus);
+	priv->disable_wdt = device_is_compatible(bus, "aspeed,ast2600-fmc") &&
+	    dev_read_bool(bus, "aspeed,watchdog-disable");
 
 	ret = aspeed_spi_controller_init(priv);
 	if (ret)

-- 
2.34.1


