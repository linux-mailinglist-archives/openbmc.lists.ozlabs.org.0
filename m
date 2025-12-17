Return-Path: <openbmc+bounces-1042-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D62DCC5B46
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 02:35:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWGZq5xgHz2yNG;
	Wed, 17 Dec 2025 12:35:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.53.34 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765935331;
	cv=pass; b=Tivq6kzf1e5Tq55qDdzNv8VRsARuBOf47gRilcXK/bn3erCYAwPaOCnN77zz98p/h59dsdyjeHhk1NU4e4K9LWQ61lwIcXrwz8LcCzVZMx+iBnXzC1U94yYlbLLDyKVidL0llDTfBocaVDXaswcfHyjoX9Yo68Qgmp/YemMaqHIPkF1lGkSJDUw7wrIHqaelkY0SG6YE2Om4NQbAD1ZChSoI1xsIEAqoUTcFvFS7yZtgw89kvo68648MyYk1XvkMNC/O1JO1q5M0GHIdGnSN9ekEXAzvdpRwhgmzyYaG2HWkSGbBnGcYqzGKp4ly3HQ95fi5UNcLy4mtk64uDB1l1w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765935331; c=relaxed/relaxed;
	bh=Xy4RVDqJYG+5p9J84Rnf9RiYsy9W4i7Ak+h9f7LwV1s=;
	h=From:Subject:Date:Message-Id:Content-Type:To:MIME-Version; b=P8nYxeaS0c4jR3N6DxboHuPftdlejK32IsqNxq+QcV4PIKycPqeuoF4RGLwBdXNWBiBO5IlHVSV+SZCGwJG2oukNijS7AdQdxFy84kKADERWlvL5ACg9Ybu6VvKR/S8TEb2B3/5aqlwTBWBJKCpJrEXNkn4kI/IUvde+iK3kHQR+91jUdXgBW+LPyfWLKzA/dIGcgaeWzdC24SIw+rT+V/xg/B6K/6FK47UJKM8NYAriFY/ZNuNQEhGIDIKY1S3NTE3Er0sD7yXq65n7VQBEKlF+mQfOM6H6ZZTd4pvH/e5YAh0T3qDTystqoOnDuJtPSQRZjUc+hg0Gqgzb1UvS3Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kOo875N8; dkim-atps=neutral; spf=pass (client-ip=52.101.53.34; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kOo875N8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.53.34; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWGZp56bWz2yMJ
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 12:35:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeLB8Ndx5XZ9kqe0WyVXWWQjhQuUDTWEUscrX/KsiocujO7XLspnBLU6wXKMklNvaixEjfqH0JDy+3zbFeMVyQBp26zzaZWAfOjYVsMz6MiWI+rBg0ROjFElI1KQqElcVimYJZxrrSrxgN13PCyv67Srfvy+aonNBfuyGp9ONe/G4yAnFK4DOOlIpJXYBxpntHjJ5Wg4ikKVRWHIyDo7I8pYTJDK0N4RSgM52qLNMJLiyO0too9ykrr0xm3ipt4fpqmsfavfojJfCMK/XtOT5wpvLCCLuWJA77deZoq3F+ayMwyZq4fMJxtfZcldQI9VboDsj5SNgHSvL8mkwrrdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy4RVDqJYG+5p9J84Rnf9RiYsy9W4i7Ak+h9f7LwV1s=;
 b=pTmWdsa+Rusy/8HCmRr3apFDDec65c0EUUm/olnLnM+BEbig+5TeEN7GLEbmpGoinGKC8tpMSQcbRFoxHcGRh9ozD2jMqf5b1XWrUDstogXrbhnSa8ECF4voSP6eyFR1LmosRGa6sqU5B3iuKlk8CUMdaabQeNf+g+PuVuopXKxEFAOoCBhsUF3rcIuoRHqH7SXE4ztnESw1XNEo9bjmHSYA6rK4fCx3OdnIFmws9+pZWC5XwntZAJ8wZ2DOC8RAI6ZoX0LNujpKAJacdbR/bMxwX9LYGbr/9+i89ZVWBOKinSNldQyqh3/l6+/Un0C8NZeYTD7XcqqRMPTeQCXX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy4RVDqJYG+5p9J84Rnf9RiYsy9W4i7Ak+h9f7LwV1s=;
 b=kOo875N8xRSxy21HieFkRcYnKuStkM/hmK2CNdcTaCDNNPPzVe2T54dhYtQ+fg3w+6TAQAyoGQlf06KQpOpWBE1RW/WVwHFhBSNWQD7a/zR26Vo7p+lg2BmHY+m2kgsWKIVLthqckyfW2inyXbHXp3uIx/sAnw813dK0iQ0XmHw2SIjuFL+yi8EACcEIi6+boGqHkuUAv+K42TZ+oLss+w+zncIpGH0kwRB14HoxsMD+5ZCF+nWVeud6+zdMlP562LMa6jecqg6HE5aivd4cXPc93lHPxd1ynx0W3CrWJ5wGX3GMn/U25Am/bXHnlxfr326Vrsyb0NLYOLKxsboPoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by LV2PR12MB5848.namprd12.prod.outlook.com
 (2603:10b6:408:173::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:34:49 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:34:48 +0000
From: Marc Olberding <molberding@nvidia.com>
Subject: [PATCH u-boot v3 0/2] aspeed: Add support for MSX4
Date: Tue, 16 Dec 2025 17:34:36 -0800
Message-Id: <20251216-msx4-v3-0-14a4b0c3f359@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwIQmkC/1WMQQ7CIBBFr9LMWgxDKVZX3sO4oEDtLFoMVFLT9
 O4SamLc/OT/mfdWiC6Qi3CpVgguUSQ/5VIfKjCDnh6Okc0dBBcNIj+xMS6SGW3RCSd7XZ8hvz6
 D62kpmhu8WOf9DPe8DxRnH97FnrBcd5HAXZSQcdYbjth2SimD1ymRJX00fiyGJH5Uji8lMqUVb
 6yUbWe5+KO2bfsAIFaQjdcAAAA=
X-Change-ID: 20251107-msx4-cad1e2e4fa39
To: openbmc@lists.ozlabs.org, joel@jms.id.au, 
 to=andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765935285; l=2289;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=SYPH9tWfYDk7lec9vYHQob9Sy0Kdb6NNbeLkidBxzCY=;
 b=W6bvf6bXipbhJTmxq/OijLLrLS4zEe19LclY17M5erLTADjbF5jyXhnxrk3Vj9qUjVHp4NPgc
 q273kKIUQcCDEPB9q4wmc7FXhRkXLI9MbjyIjdf5IFI2ZzG6t2SsWTP
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: a7f8095c-97b3-4be8-a7fd-08de3d0c7779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk53UVpjaTJUbnVRVVZDbzFVZ1ZRQWVERFduY0k2V2FreGFucEtLb0QyQVgx?=
 =?utf-8?B?SXB2MVdQVHhmcGltV1R1SzVNQkU4dWZDL0RPV2FPc3Jtdk9ydGh3NHJNMG9W?=
 =?utf-8?B?ZURZMTlxWlloNWdCWnZUaHZjUkVuWmFNWGtqRDFWU2lFRVgwb1FDRSsxdEpS?=
 =?utf-8?B?bDh1TGh3SGZCL3RjcE1HeXQ0cVlqdlRuNy9PbFoxK2RLYnpLalR0YjA4M0Rj?=
 =?utf-8?B?WS8rYnU1OVBYZm1IMHR3MzRRK3dTcmhpS0V1U0wzNzBqb1pSbkhCU2J3YzRx?=
 =?utf-8?B?NXFONmlHQVdKQjFtSm9kWVBlQ3c3MEVPVlRjQ3o4WlJ5V05GUW1pRWJHVllF?=
 =?utf-8?B?OUdkWXd6aGhTRy9HOGJYS3ZPRkNLeWd1MEl0VDJPa0Y3ci9kbGlmbVNLMnBW?=
 =?utf-8?B?enR3dDFVWVhpYnpDdFYzaWNzUEV2L2I0eEduVVlLb1JlUDFQa2RMaU51Um1K?=
 =?utf-8?B?Uzg1a1FGcDZ1OThkRkNPQ2dMVnlsU3hLR1dnSUZlQ3ZZcTUrd3RiUHNTcG8w?=
 =?utf-8?B?YkU5U2FXVW1NeWJBREpUM20zR0krQ3NMdEpLb3hFQ0R6VjhnbHNDdVhDMVk2?=
 =?utf-8?B?cXo3Y3dlU2I2L3htVkFBV2Q0V2lFaUdsL1E0OHp0QXNLNVc1cisvbC9hTlUx?=
 =?utf-8?B?bXJjTHphY1RjVWdjNUtiUS9DaGFvYXVzNk9qSTJZRHQwN1dqVStiRFBKM3A0?=
 =?utf-8?B?dWZSdDVrbm1qZ3VJdkpJWlpaZVo1WDZ5RkNqc0NOd1Z3NjJVeUtVeHo0eDlm?=
 =?utf-8?B?ZUt5M3UrYUI3eFVwVjJ2eXAwOHM4U0I2aDRwR0pCQmNuSjFLV2s2dDZBdVl1?=
 =?utf-8?B?dnJ5YU0yMFFEYVd2cjBQeU9LNTJmOUJHZVVuU3puUnd1aFJpZUxOZm11OVNP?=
 =?utf-8?B?WjFvWUF5dDlSRUwveUZoNzJDUUE0bEFuN2sxc09JbHdVUHRkZFF0Z3daNmZT?=
 =?utf-8?B?VVBDWW5qTE1VNnZ3VGNsek9lSXFpZVRnS2ZlNVcwZnJjUGM4TllYUVBBMUFY?=
 =?utf-8?B?T1VMVnNrUEZDWDNrdVlsbEVUVXR5VUVyWitPcHNmQ3FjbUlHWG84Nkl0OExn?=
 =?utf-8?B?cGxSZHRXNWM3SGJqWEVpTGRMbjZlT2w5UXZ1NiszaldibjQ2VW5rUHRjYnVj?=
 =?utf-8?B?Z1owRi9tNDQ5TWRzVkIzdXM1V21RZXI0b1RjSEVmb3BHOFJQV0g2eFVCbi9S?=
 =?utf-8?B?YUR4YlZIYzVoN04rb3ZpU2pnSTl0d0MxYzR4QWR5Q0lXSjI5UWduSjFhNU9Z?=
 =?utf-8?B?UXB5Uk0yQnFNWGNiMDNqV1NCa3VRWGNjRXFBWkpXa2FqejF3MDVWNWRZZTB5?=
 =?utf-8?B?ZDR3Q2hwcjJ0TnJwbG8yRzFjWVkwTFhKTHlpSm0weDRrOUFZZHJiZG11bERk?=
 =?utf-8?B?a2UwTVlFWDJuYTJzeGpBb2RNN1FDZ0xxcERBSmoyZzZxYkZtUGFyNWFmMDlo?=
 =?utf-8?B?K1hKaTNuVS9KZ1VndTVwZXNkdkFKQms4b0JhYjcxaXgrWDJQSStYR0wvRWxo?=
 =?utf-8?B?OXhLQ1J3TmpOZXdwZ0VmemJQVXFQVHBqVHlQMTNndXpmbnlNY0F0T3pvU2Ev?=
 =?utf-8?B?T1E0SjVOS2wvdjRFK0kxcnhqQmRoVFcxYU13c2MxMkxYVUxXb0J3MHFTUU4v?=
 =?utf-8?B?R2NReHhrQ3lSY1hJVGUzcGYrVVJaeTltZS8xZ0FWUUp6VFEyWU5CUm15enhC?=
 =?utf-8?B?ckhCUVVkenkzOVdyelFVejZVa1BYOHFzbmQ1dUhmWWtscU9PVkM5ZVZaY3FL?=
 =?utf-8?B?SnBkQ2pFVEdEa0lVckpoV1hWUkVoV3J4UElBYlJtMkpBZ2FiZ0dOa3JHY0U4?=
 =?utf-8?B?TnZhSGkxV1QwT1RRVHZhNVhQdHhCU0NsT2kzL1NUQTgydHRiREJybjJzU3Rm?=
 =?utf-8?B?SHNyK0J4ekwycXVvdnczMnczZE5ZR2Vqb2hqNnpaWGhoNHQ1azVKM0xXLzRT?=
 =?utf-8?B?dkxNcmFmQlBqTkphRjdlZVBsTFNRdmovN0R1azkzcWl4WVlBMW1DeklsV1o3?=
 =?utf-8?B?YysxTEs1c0V3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3dneFg5T3B0Y016VVV6OW5XWTRDR1hycGRlK1VtSXVUVUdFOUpjNHdXK0sw?=
 =?utf-8?B?RVBHR0QxWGR0eVlpcEhGaGtuelQ0VkJZMXU1TmNoSTdZc2hFQ1FkUVdPeUpW?=
 =?utf-8?B?b20yL0s3WWRWY0N5YWJTNXhXdldyWnFzamhFR2N3ODhhOUZEM015ekxvemN4?=
 =?utf-8?B?UmxkS044QVJZOUd0VDBMODZ3OXc3eUJ2blV3NDdKcWJ5V1k4dzI1dkdBdEJE?=
 =?utf-8?B?RmdGSzFtV2x4Y0YrU09ObGlTLzNFbnBrYW1VVk4xYTkvdTRSYXBBWUxuUjVy?=
 =?utf-8?B?YlFvOFZzektwVHNQQ29rQklOTGhxQ1JaT0lQWk5naGRWT0puVkhzbFQ4QVlj?=
 =?utf-8?B?dXoxVWZGcVBySjF6TTM1Nk1NZCtKQm9OR0t3V25qNk1MZm5qZ2hyeEd2Wjk4?=
 =?utf-8?B?eERmWHVzaFlhS05Kc2ZEc3JmdlpQTmxWMXRZeVNXVUFvZElEOWU4aUY0MFQ2?=
 =?utf-8?B?akFjdWFaaUdVeXNVUTBjeWcvTncvbmpUSEJkME9jRytIc2FmcDFHMzVXNzVU?=
 =?utf-8?B?cllrMTRPS1B3ZkF5aFRHUHdERDFtTU1CZFJYeko1bFE0Tk4vdFZSQWdyVjNX?=
 =?utf-8?B?dHZzNFQ2VEtjM2NKd0NqcUNTTzZoYlBDVGIyaThsQUVYT002R3Bka2NydFpw?=
 =?utf-8?B?bS84NnJ2MHovN2hXWGdZQ3FXOS8xQTJYaVdzMWdvMHdTcWNwdWw3d2l5UGV6?=
 =?utf-8?B?M1lMRHZmMWswaVVYeWxhcHBzK085NkVENlZmY21DNTVzbkZzd2gwV2E5NHZj?=
 =?utf-8?B?TklUTFFNb0RYZk1GdVlVRjRMMmpzMmROS2FaTjdLT0tPSUR0RlVEdTRRUndN?=
 =?utf-8?B?V0tDTHp3M0xLUEJteVRKOXlNR1d3SGVoblhzRGxzdkZkWVlKQjNGODdZcHhl?=
 =?utf-8?B?NzlRL3RNNWxzWG0vOW1KYzBjdVVjczM0ZGQ3K1ZnQnBucElGNGcvaEN2ZVlE?=
 =?utf-8?B?TUhaMlFKb2xXd2taQmhKYzA0WGh3azFaU0FGZWl5WjllRmNYdnFrZU9TY2tI?=
 =?utf-8?B?TjN2Z2tHb3A4TndtK2ttODdmNlRIOEkwdjFGTXJLWWc3dE9lOFQva3QwVFJw?=
 =?utf-8?B?Q2gzWHNTenRWK3N1SGVyZ0d2MDRkZDBtVmMzSE9pMzVDMlJiOStGRktXa200?=
 =?utf-8?B?MXJ5NUhhSkdNbjRtWS96N1RSUEtmSkwwREIwZU1SWE5mRTRuYnNwbnIrUVFR?=
 =?utf-8?B?RDZlSEh4TG5nbEZlU0tRTjI5UTRwdzZJaVpudXJ5ZnU1aDNJUDlIOHFhdTFa?=
 =?utf-8?B?bDN1S0svZXhZeDkzd0pHckpOdUNlUWErK29GUVJGUUN0QkVVODJWRW9MMkVx?=
 =?utf-8?B?NkM4ZXlybGVjSzYyMWd0d0M5M0txejBTUFFYS0J6VkdIWHd5K2Fhcmt3UTR1?=
 =?utf-8?B?UlFNejZWS3NtZkxyRENMRFBWeDZ0TnBORHBUTzVFeDI4Q0kybVlyYjR5bm4w?=
 =?utf-8?B?UlVjaVdqUjRNcGp4SVExVnBVazJnME43TllCaWJOVWNoY2ZSc2krbm5KcEVB?=
 =?utf-8?B?WTQ0VDh6cEVJbzJhdnRhbncrb0poajlXdnlxSmtJendSa1FWT3BrU3d3MWxa?=
 =?utf-8?B?SklVb3VxeGZqZEcxanVhNC9WeStDb2VIMlBFSmxyc0V6dmN1S0hLWkt6UHdz?=
 =?utf-8?B?OXNUNmpWZ200VnVjRExuVFd3NDdCazIzR2NiMnEwMXNIY1EyNUoxa0FnbDM3?=
 =?utf-8?B?VEVKeEVGMWRKWnhESXdSZVVMVnpUNGdLMlpqTmZWUlFxaFk0YTU3NTA4Rm5p?=
 =?utf-8?B?TUNmdUZlWS9oVms5ZURHSVl3c1o1TXhmcFMxZ1RBZS9VOWRpS3ZFaEgyaGwz?=
 =?utf-8?B?WEFIWXIySHJIQUUwcGU3a05GbW4zdVN3anJVb1U5MXpqR2FuTEliUGt1OTVP?=
 =?utf-8?B?M0lDV0dJYmU2NEU0b0w1aU1qekVJUzlHUWFGL0VpSmh6VndleUNUckNSbTR3?=
 =?utf-8?B?cFQ1eW5mYlNEcmovV3VmWjRpR3hWZVp0RVlkcUt0ekEzc1B0cUYwZDRkVFhM?=
 =?utf-8?B?MzRxS0Vmb0NZbEFzQjMzN25PS3k1RVpnWmZvbmswS2xMcmVqWjcycU9VZHpj?=
 =?utf-8?B?TEE0a2dsQXlrQ05RZWVLOXFmQWhkYWdaZWJ5bjYvOUpmUDRQT1lacWc1ci93?=
 =?utf-8?Q?fdKPm4z5NYTXjmzlOuIJVjo8x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f8095c-97b3-4be8-a7fd-08de3d0c7779
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:34:48.8354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+vIMvW/bXgJDxFieDZA7qIrs2jMmgRmFhfZ+IbcNNZdvOQyBZmPnc5iaJY/r2dQQSchJves5QBYSfjsEXD0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a device tree flag for the FMC_WDT2 to be disabled.
Also add a device tree for MSX4 that uses the aforementioned flag.
The MSX4 is a granite rapids based reference hardware platform module
for the CX8 SuperNIC Switchboard. It uses the AST2600 BMC SoC for
out of band management.

Patch 1 adds support for the aspeed_spi.c driver to disable the
FMC_WDT2 via a device tree flag, aspeed,watchdog-disable.

Example usage is as such:
```
&fmc {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_fmcquad_default>;
        aspeed,watchdog-disable;
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
 drivers/spi/aspeed_spi.c                 |  17 +++--
 3 files changed, 126 insertions(+), 4 deletions(-)
---
base-commit: 8e15f5c0b1e7b11296ae6c88b686e65d509237d0
change-id: 20251107-msx4-cad1e2e4fa39

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


