Return-Path: <openbmc+bounces-1094-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884DCF99FC
	for <lists+openbmc@lfdr.de>; Tue, 06 Jan 2026 18:21:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlydW66ZRz2xjb;
	Wed, 07 Jan 2026 04:21:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.20 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767720111;
	cv=pass; b=T/J0We46/VbLX9+GrSPO5jMfS/Hri9k5wSUNidGkzWolFU5Od+20A0ax8m4h3IW3cf0OZNQjppa6ghhH9dSFvE+mzCOSxOUNQAuOnWYNIprreRWr3lLWKy6rTHfFIEOLyg4BaMUua0KjAsNKS5DQlNw18R6gejr47bnhad8jGUQD3hn99J0XhqO+sdKUSSrmog88m0EgOIFH4L5dz3tovHXe8MfcwmaRxxai1K9lC0nHM9JYEQP45piw1AZ7ae287M7jbz1S3c07AN5bDX70y0wsXNyGD0M36jjhHHwM4hPz7XxTWR72q072cdoaeSx04OAqowa50HyeuJZvDj5uZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767720111; c=relaxed/relaxed;
	bh=izRDePS4JcH2jqGfB3zkQlcqBU/CQj/1RuQbE3p+QWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GURRkQzTovkzDST+jgMFHDvxcMcjlsSn5ZJz6ewf5Ek+nor0JYdWZ4+ep3bVXh9KZ7NUzrDq7sCnhW96mwCsPlYfeAhKv7T55ZHFtBa52WwsRaVWWmbWA0sxaekRrVPeFFmOSsVo1yQPF1FZpVpw/CRWTLSVrwdYYlEMPtiZxlhOtTGUqrdAuqUlYmqOIclBd0qv2+3XFDT/CHEhplTlEhW78P4S7G4q5rD82Lw+xDxcRcHpJl0UGsrpBIp+mGgZRVtHauYzXY8OP0AxrJmkr4uh3BEsrWpWJA4aVwE+8VBAH6iTxr1OY/Zl3bNDhdL7pzIc7T902J6+DTLAy9GydQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FJL9rA7Y; dkim-atps=neutral; spf=pass (client-ip=40.107.201.20; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FJL9rA7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.201.20; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlydV41w5z2xGY
	for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 04:21:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfAYHm8SRkDUgjxgsF0r2Aav+xVDqVtUknq5wJ1isB5BhY6gziBk3Ert6wakFjHQvq9IKTZaPEbVFWG7CCQ+UpOaVwyGpR2whxg3+NQGik38PNFD43XPNK7FkckQxefWslXwCu6rAJVQTfPQE51+q+f4oxeyFXf3lo0ocHZSqJFT8twUDk3tSIy0Kl9qly438hUQUQVejwbeh9w+So2Td9v7KTx0sYrNCvl5DGVAtvc0ECpPhgNeT+BGU6BECUVgdCNc5nrAYBvS5PJ/a7UUXn6aw1oeossU6Dd6a9QwU6sQjmK+rX1xvePyPwaZ0SuZ2sG0q/LQTTf/IGQz06+gcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izRDePS4JcH2jqGfB3zkQlcqBU/CQj/1RuQbE3p+QWU=;
 b=s4Htc9BEnRo6A6hWPk2pRjCFwKsU/u0l44hf0/WbB+ooTqGTBqZ7tK1TFrd6NOio1Af+hmRuX3C/HgWKZ7Xk5Xfx3DdNoKovsJqbrO4swsPcTUcIr/2zlmLirvmRW+VpecOlRtv04Jb2k8bAIfSbdD9OEoO3arxLDRClLdTOJEWLrAMq4Id6igR67yGJlVuNnozndlMl/D9PAKYtCLsZ4sxTGwCi2jucqneiAruEvExrlSYJykbTglMKDbz0jwAi8zn0IupTblYl2pqGkKWK8AE72o1/j075O9Qc634JgJXTW2ncGYXVBtJYSbWPTh1yPdKK9zUX/u8V+L/LQKRH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izRDePS4JcH2jqGfB3zkQlcqBU/CQj/1RuQbE3p+QWU=;
 b=FJL9rA7YLedJWmNDDGarb38wMQF7pYxiSx33EJmoQOFn00+aF2ddT9R2d/BsfB/I/vbxqrtZqSGQ/2r+e9sF1sAu4wruLBiZAJFGqSX2lkafZ53riXE8JhxxbRdhSvwCcuPDH3+4OlBPrTGhCWTcg+2pkSf/Lh855s1WHz0GNYJdqUstW0kbhv5l1G/c2MOUG4daTDfvj/wbGqo9p5xZFdtA8hSUSKXklDBPF17uP44QJFwlGrXbrBOCekRNY31AieZS4+EuzLkRZp/Wd+hAT3+KuzCV8A6Fh5HscNmfFvfTrKb4S0hOc8Tl81GhfM/eB3zIoLkjBofJoXzj+W//qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by LV3PR12MB9143.namprd12.prod.outlook.com
 (2603:10b6:408:19e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 17:21:07 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 17:21:07 +0000
Date: Tue, 6 Jan 2026 09:21:05 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Message-ID: <aV1EgXArKQow3XhO@molberding.nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
 <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
 <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
 <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:303:b4::15) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|LV3PR12MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: f351aac2-3af8-4e2b-fb77-08de4d47fa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG9MZ205eUM3VUUxVnZiMU9QUEdtOGxIdzJzbjluaUxFRkdZTmtjM3Fwb1h3?=
 =?utf-8?B?YWl2K2l4SkZQeVZjSWVSa08zYWNxNlpqVy9LU01PSnpCOS9oWm5XWU13dEpY?=
 =?utf-8?B?OWMxRzI3V3plOFNWWnkxMHF1bHA2MmtvNE9hWVdnbE0vWFlOOERTNy9Yc0ZD?=
 =?utf-8?B?M2ZoblZYYUZXZStSVzVZMENqcnd1SXlodllpSzlNaUkwODVqd2Z5UFNsWDZP?=
 =?utf-8?B?VTR5NzkxT29FaktzVGMvK1lQWGk1WUxuTnpQT1hTelc4UHNCZVRtSU5uZVNa?=
 =?utf-8?B?ZUtWOEFRbE1uQll0SlhXWVdueTY1K3owckJoYjJPTjFOa01sbnVxS1ZvWTc3?=
 =?utf-8?B?RlJBZmlYKzBSQm9xenlMeStUbVJSeUdhSFd1OGNUVllpcnFrclE3RW9IYkQ5?=
 =?utf-8?B?SWVtdEE1ZlFCaURIQWJhOTdXK2tYOFdmdXpLNmRqTkVXWks3WWJET0NBUkc3?=
 =?utf-8?B?WDFxTysyLzFudDRibkNhMVZNdVd0TndKOWJ3OGd5cnhTeUZKTHg0WFkxS2dl?=
 =?utf-8?B?OHBnVFNuUXpUVjdza3I4Z3k5cE1HbGxvcVl2S3J0VWV5OHVZV3k1Z2drQkxp?=
 =?utf-8?B?WDZETm9UVlk0VGk2azlwVW5nSU1mQ1JlWHNHaWlpbkhHdVJ0eDUzcEVDcFJX?=
 =?utf-8?B?SjBpWnc5SnEzOWJ1ODZGRE1BbVJBRS9nMkkzeHIrd0JmZDlIb1RaZm5YNTBu?=
 =?utf-8?B?MWUrY2NaZjZSb254U0F3L0xwMFBmRzVoRUtUbEZwY0lHRXFVaG12V1pLYmxW?=
 =?utf-8?B?Z0lRVjhXWVJRWC94dHJNZjJxNVlPS0xrRWc3N2FQSjkvQTFkTFEvY1hJamoy?=
 =?utf-8?B?eGl5VG9PT1ZaNVYwZlh2MmgwdTdod1kyTjVHb0RIT21Bb3Y4S0l0YkRZVStP?=
 =?utf-8?B?SG1QM25xbjNXdU9kaVRFMCtyRW94MEhSQmxraXNzdFUxd2FPQ2ZlYWlsWWwy?=
 =?utf-8?B?QXlyN2djQjV6WnRkcTJsUXorRDkreWtTcU03TVZmSlZJL3ZOSy9lWUVBMjFU?=
 =?utf-8?B?VVZhTXJxUlpBTFlEYW1jU21NL3J4NTR6MEd3S0hMc250SnBqN2pBRERRdWZy?=
 =?utf-8?B?RlF2THdaeW1JWXVsSlQ2VjQvbUE1Y3lPK3E5M2I4UnRFWW9hN3JpQ00zM3BB?=
 =?utf-8?B?NDRNVVk3aFAweXIzS2psTEVHcDd2RFB5a3cyQXZPcXNFSUJ5NUl6ZmtqWkNl?=
 =?utf-8?B?SWk0bDc1dndqb0pwRndTZ2d5a1c2MThxUHc2SnhxZ29rYnRhMldMOC9qL1Rp?=
 =?utf-8?B?U2huQlRqOG5rWGM5TENYbGxNY1o4QmpCWWlNWTZLY3h6dElwYnB5ZzNLZVFL?=
 =?utf-8?B?SkhJbVdMaDZwTVdoQUNKOHQ2RTNzOTNHU3ArRHZjMWxQNTIxUFdseFRnRkla?=
 =?utf-8?B?eUlHK0Z5Tys5SXA4Q3Z4aEhvRmZkc21sL0VSWDRIUVd6b3l3dFlrbkxFMGZz?=
 =?utf-8?B?N216YUk0M0szUms3NnhFbXQrUnRrUlpOWGJURGNFcUlwZStCSXlvdGNxa0Vs?=
 =?utf-8?B?VEp1enNTeW94RTNxczJkZ3RrRFUrOVlmbTFhY1E0a1hBNjVRWEUyaExjKzhq?=
 =?utf-8?B?RXBmRERIaWxWNFByZ2M2RjhLdTZXZ2ZIaXgyYjlyUkJQdEE2NU9LcnBERVp6?=
 =?utf-8?B?TlorM29XUDVMNFJLbmxlVmFYbXV2anIvTC9vQ2VRZndvdFRQR2ZsUThpempZ?=
 =?utf-8?B?ZG5lRmxjNWJLL1ByejBvUVArczQxaEtFbklEbjM4YUFBbkI5My9TRHd5YjdW?=
 =?utf-8?B?OHdhc2RVZEFVYVZiZnNYWDl4WFZiem9zQkM3UE1qVDlrVFgzc1ZVOW1ZdVRZ?=
 =?utf-8?B?cDJvN2QzNEprWnBRc0JINWxuK1ByQWxwVU1xWnE4UlRnTDZwQVFaSmZBTmdj?=
 =?utf-8?B?cWt0SGVTdnlFSEp4VUtVZWhIRHRTUzZCLzRmckQrOVBNNlB3Q1dZbDVsV0Rj?=
 =?utf-8?Q?4sGT3jYbBf90Stg0bUakihX8HolRT2Qj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWp1MmI2OEtrMks1TEdRWHIxRGNkemJxakZKaFF5NFc5ZWRWS0VpMTZXL2Zr?=
 =?utf-8?B?VXZuZWR2QkRTRmJhaUNhTWhiTTU0VUhZK1RRSnNURUxDNUtvamxCMEVraWpY?=
 =?utf-8?B?NXZPM0cvdmovcXBRQmJLenc3REFESCtvYXBQLzNNNDRVSmZXTDhRdTdMZWFX?=
 =?utf-8?B?eWkvQTBxZkRHYlpVVWJmNW1ZZFNqMEcxWC9qKzJlWlRNQkx1dXBYM2xuUXFy?=
 =?utf-8?B?N1BTL2ZmZTkxVVA0a3BuMTA4elYrcEFncXJ6WkRBd0RtZDhDOWx5a241WVRk?=
 =?utf-8?B?eUNXVi9ydFlNTEtkbTVLNDBtL3dWVWlTK1V4VUZPalBlRzZTQUFaeXVPY3Jy?=
 =?utf-8?B?dHFwVklydm1nd2ZNT2s4U0QyVmowSjYyOCt6Smh0ZktMejgzb084TjMySzRD?=
 =?utf-8?B?WmdRZXJJNFVobG4wemxDTTRybmlndGwyakF6T2FzTStjdW9XSEpDMUM3bXpw?=
 =?utf-8?B?bjJmTkYrMXlMNlBWamJBUGV1OHcwa1RHVjNhRmVrMkJiVkZYZHgxNTlMSXgr?=
 =?utf-8?B?Z3EzMWt5QjhOZis4cDl5Y1BUcWJyTVBIVnlQYzJlSEp0SU5EdDNodUxpRGhn?=
 =?utf-8?B?ZXUzcitDRy93Y0ozYmJoWHBGLzBpMyt6bDdubWtUbDN1U3Z0Rzl4aXpaNGxn?=
 =?utf-8?B?NENBbVpSK093UmFaeVFnWkxtVEdqaGowc3NKVU5yWjdsdHR3enRwNUYyczFI?=
 =?utf-8?B?T045WmIrV3d2OEdwQUs0QXZOeklkWUozY2Z2cFgyY1k5ZmJpaHQveHVxSFp4?=
 =?utf-8?B?STJNNFBLRkNjdWx6Zm1XVFBtUHF3ZElBQ3NDTGJTY1pCWHRteHVYRkhsRitm?=
 =?utf-8?B?cnVpQ0JvMjRXQXVsWkxiNkxObVVKM21ORmQvc3F2Nzg2eHZVS2pWSkZBbkdU?=
 =?utf-8?B?bWVnbjJMYkdvcXFUMlVMY1BNQWYxMTduU082NDRpVGVielc1SCtoRWR5ZTMx?=
 =?utf-8?B?RVdETU4yZWsrY1lHSlY3TnUwQ2VvYmxSYmxjTjRNNEUwQS9KWEJNNHF4S2pW?=
 =?utf-8?B?MlBLQXBreFRmSTNoWnR2d2E1OXFLaXd4T1NzUHhzdzFlTDBiODU1Q0VqSEVs?=
 =?utf-8?B?SXFkREp0TDFLamFCNFBiV2FDbnlxUnI1R3NCSG1sYmlPckZyQ0tiVXhoeEM4?=
 =?utf-8?B?Q1Fab3FWQVUraUV2RXgvbFk5ZGEydVdxZ2VTTVNxTFZJRjVFYVZhMUNVb1BH?=
 =?utf-8?B?MGNDa1hUaDduSTdsL1RVZUtZd2VZVHNvNmRONU42ZFcrQjJReWFTamowcUpk?=
 =?utf-8?B?TmNUc1FKdzMwRnpFZmNiT29qbE9kdWJpajFjY1Zab0ZQbzJ2eXV1aElJU2NS?=
 =?utf-8?B?WkhVTFg5aUtpVjFHOTROQWJDaStoeGFpWFFxZ2EwUHc5Q1Z3TC84RWJYUXFR?=
 =?utf-8?B?dWRNcFFXbXpXSVBWbFppaEtOeUVQbTV5eXJiMXFnQnkrN3JHMWdVeFRLMkJ0?=
 =?utf-8?B?bHo4YjB6SCtKS2tGREdvTDM0bWFWbTY4eTdZeTFLamVoT1AyVG01VzJzTW1y?=
 =?utf-8?B?OVF5Q3FLRTRRUVByUFFJUjJtUzdzVDkzNXkzdDRMN0pTT1poNmdvQnpnVDFQ?=
 =?utf-8?B?dTdTMHBCZjBnRG8vS0xYWVpBZnVCTDNDb09qWGF4T0xwQUFmZEpEa2xtNUtY?=
 =?utf-8?B?OEJKNVJYL1NuTy9PTWx5YnB2U0NPVDB2NHE4YkFYcnVzYTRIdUFOb25rZVE1?=
 =?utf-8?B?TUhUZVc1YWRkWCtvU2RsVDBYczFZam1XcjhwQUZSZE5VN09zaDFSd0N2NFZK?=
 =?utf-8?B?Q1ordnF2ZjRXTWpUOUFKNlJyZDVQbmJqZ0RQNGpXUURPT1lLKzZ2OHVNSXBm?=
 =?utf-8?B?QUxkUUxHb3h0L1lpdC9uSjF0Z2dWc002K3R2QmRZNE1yVGN1eUhaRDE1SEhm?=
 =?utf-8?B?YUFvQWswY0FjYUkrbGJDWSt2R2pWOStPSElJcEhhenFvWDA5RlhxYjIwV1E0?=
 =?utf-8?B?ZEZ6Y00wUS9JUVN3cHhpbTJmOExZVUljbG54TTVaUmwrS2dCWi93bkNiQkdv?=
 =?utf-8?B?elFpRUpsVnp6NUJsMDlyajhNNlVlS3hJT0VnNFo0YkVoZGg0ZmpUU1lXU3pG?=
 =?utf-8?B?TEV5YmpmRWlCUFRBRnEwazA0Z05SUDRGL0V1d0lITEdZUEQ5SktVNXJQUXNw?=
 =?utf-8?B?VCtSUVV0Qkc5NnFCbS83KytvR2pvRHI0MzVSa09OdDU3cFloSmFhSzUyQTk2?=
 =?utf-8?B?SVlldVgyR2VTamUrYk5nRnRSUmJSdjJoU3lSSzJvaEp5YnRHa2ovUml5VmV6?=
 =?utf-8?B?Vzd5eGk2QzN6VkxESlhDUmJMc0hHYmh3Ymh2SUVNbjdxWW5XUUVGQ3YyOGJH?=
 =?utf-8?B?NG1kWTI5ZzNMWnNHWGxCblEwK2RSUWIxaEh6SGdsaXFENHhZV2hxUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f351aac2-3af8-4e2b-fb77-08de4d47fa6c
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 17:21:07.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc/Y1ZUoBOSFdU0prATYOb/QZpfviipOlcOqH+BQvn/44N31DTvQ4DTUHc1V638A60Q98cAkaHrGmMTl1qhckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 06, 2026 at 05:52:29PM +0300, Ivan Mikhaylov wrote:
> On Tue, Jan 6, 2026 at 3:05 AM Marc Olberding <molberding@nvidia.com> wrote:
> >
> > On Sat, Jan 03, 2026 at 12:24:07AM +0300, Иван Михайлов wrote:
> > > On Wed, Dec 3, 2025 at 2:53 AM Marc Olberding <molberding@nvidia.com> wrote:
> > > >
> > > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > > a device tree entry in the fmc node.
> > > > Set `aspeed,watchdog-disable` in your device tree to have
> > > > the driver disable it.
> > >
> > > Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
> > > Watchdog with or without ABR still in operational mode.
> > > So, maybe aspeed,abr-disable?
> > >
> > > Below namings probably should be corrected.
> > We aren't disabling ABR mode with this change, right? That's only
> > done through hardware straps or OTP changes. All this is doing is clearing bit 0
> > of FMC64, which per the datasheet disables the watchdog. The idea here is
> > to just allow boot to progress normally, without the watchdog. For ping pong update,
> > userspace can flash the alternative SPI and re-enable the watchdog timer on complete,
> > and the BMC will boot from the new image upon reset. Let me know if I'm misunderstanding
> > your comment.
> >
> 
> Marc, when you clrbits_le on FMC64/FMC_WDT2, then you disable ABR mode, I
> assume you can check it with evb board or ast2600-a3 to prove. On my board
> ast2600-a3 it works in that way I described with enabled OTP strap for ABR.
> 
> Also description of it in 14.2.2 Alternative Boot Recovery Function.
Ack, I see your point. I'll be honest, I don't have a strong opinion on the naming here.
I'll wait for Andrew to chime in since he had provided naming preferences previously and
I'd prefer to avoid churn until people agree on naming. It was aspeed,disable-fmc-wdt2 before,
if I remember correctly, and he had suggested this binding instead. As he is the maintainer and
I didn't have a strong opinion, I changed it to aspeed,disable-watchdog. I see your point,
but at the end of the day Andrew needs to sign off on whatever change I make and we landed on this
binding because of his feedback.

> FMC_WDT2 & WDT2 as far as I know are different, you're not disabling
> WDT2 with disabling FMC_WDT2.

> According to the spec, it's right it disables/enables the watchdog with 0 bit
> but which one. Probably FMC_WDT2, not WDT2, and it still works as should and
> disabling WDT2/WDTX in different sections - WDT0C 0 bit and WDT30.
> 
> Thanks.
The intention here is to disable fmc_wdt2, and to your point ABR,
which the datasheet and testing supports that we're doing with the change.
I have no intention of touching the other watchdogs with this,
support for the existing watchdogs seems to be well plumbed already throughout u-boot and the kernel.

Thanks for the review,
Marc

