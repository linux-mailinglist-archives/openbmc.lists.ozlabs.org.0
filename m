Return-Path: <openbmc+bounces-1043-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BBCC5B49
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 02:35:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWGZr6QGqz2yMJ;
	Wed, 17 Dec 2025 12:35:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.53.34 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765935332;
	cv=pass; b=PktTdF3yX01ZvSuC1Vs42pvAr0pFCBRIDdRjqNc4Q8s+HhTeLseP3PrzgvACnK/HGdmyfEvAbC3KynNDePZKr4DNF3iTOho/hwic1l7qPXqRayvN8VlFQOnPeAbmFFUaIyE8Sng332cFwk2G1hCh++RbvxiWVLSyu+b5QDzAShN3tjuclAvsDNe2ng3+mM+SlzSg2wBlQNa0TuXlW3kjrGtfwHvS5tY0BnR1RrJM4kOXdro6urOzoYcsqK6ugk8Fmi3y4blSLul+nbdLVYKmpQT8jz8AWU7itF0gSNVQGdD1ac1PJ1ZJNi6ID3jo8mmY4dlQj8x6H8eum5887XyfRw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765935332; c=relaxed/relaxed;
	bh=E80ckgra3eS+eLOV9vMOQBKyOAv33ESAruT/8LNBw14=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:MIME-Version; b=Xx6j9M5CMvB36xi3Lu4bx/LzjxSR3CflKyqgsg0VgACvyBqMwf+JxOVaWLn+8htyTYfnS6nDYwCRVMqWBgkGpRNE4unXkq+vTGojjaW4MnXXyPEu7y475mJcz72Bq188T9RXmHTVW8pvnSrxXmVgMP+R7YWb18OZtv1WbcM0JhSHgWJhvy1cbJYeQmyqg6r6+3aZMcjn2Ks8VunFUqq0vkp3f6e8tsX2jluHnCXN7RzRIhobNH11697Ua0Qb5keCGMeY7KrD9U7239nXWL2vDgPvOhQAgnzT3mCiqm+bHrNZmcD0iILupGOK/ljqprA+iXSfpp0SBCTW2/wyuqBujQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RbjZYbso; dkim-atps=neutral; spf=pass (client-ip=52.101.53.34; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RbjZYbso;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.53.34; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWGZr0gPMz2yPM
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 12:35:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXysVM7TxtWHPyfX6a1x8ZjuOTEcFtGBX5jaQ1SYsVrlsiR9W7SxvC/Mrkoa+MKOzhG2HHuGU5q/cti+bdx/gWyUrhZzeO+2/R6syZ3swtkSiiIBfupDYxNZmj/y8a3BWmqsVga0YVoxnLC5UD66asd/fEyEftCuGkV/1AauMvsXUd50qRJInDfhouTNQZbuIhygu8rBEih68zWgPzOpKb1od27SqLvmCUez9vCZCSIWIvjdodYqVMCDVi12k1rPv5X5OZBEQm4Ko61tM98ezNqjjoG2GYzdFIs/WiSL0EQBxkKnDEnk3luLS4AMadvaS4cl225NwM2xL/jYhm3tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E80ckgra3eS+eLOV9vMOQBKyOAv33ESAruT/8LNBw14=;
 b=sdFT7z1dOP8/um/J/X76kH3yMDh7OWuRfJNpkzqdSsLZ1ji8zC9g1iY7BpOPyNe6n1qsDw6YxWZ0NoML47+MHje+2MFHQ1b5G16wChMuGBdtVajZ5woGTem+EqEoCn1CjEDSfIvc8QGcWCD9aNf8GB+WktCbwBVYT18ea4UTpeV3hbZneJO/KOI/r11/Vw6aytMCSH2oeQfXSSMFC9+2uMkE2fGUufnixcRTKDE2f8+S/xb5RFBiG4/5MsPfLLDkvtDL6XHRZFkVn9W0VM4eg7nbEvHJw4WNpfxRcpRaSYe5NgiJyaA7oYEBPQH6HdGNGAttZzLqrUlr6A0lyfRRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E80ckgra3eS+eLOV9vMOQBKyOAv33ESAruT/8LNBw14=;
 b=RbjZYbsoR44XCadQ1ZRxTtp+JEr3o2uTuUU/F6SF83IaYxiM3BUc7j1GsKtKELaWs0ZTO0L9EKKv40iQ13nPBK5EQxeqGBEKoVuMVOQLDp0abHCkXvlhmHSYkA/TXoE/qxLCkc3o15puO7kMfwHPOSaU6OVxuM2NEa/JUzPITrZfr2Tu7BN0sU5lI2yqP9t9LstkzPPERyLQGYyti4jUdW7ZguQCd6VgV4IKoPoQ7KFPCiK+cA1rjBnB0z58/99uL0Hq/FrtlBk7P3UJXATAXnZVcyZ9keNwChl1fiTM7F7FX76tWFiChQI8SZbl4+ZewftTBDnLOw3So12qWSteOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by LV2PR12MB5848.namprd12.prod.outlook.com
 (2603:10b6:408:173::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:34:52 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:34:52 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 16 Dec 2025 17:34:38 -0800
Subject: [PATCH u-boot v3 2/2] arch: arm: dts: Add dts for the nvidia msx4
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-msx4-v3-2-14a4b0c3f359@nvidia.com>
References: <20251216-msx4-v3-0-14a4b0c3f359@nvidia.com>
In-Reply-To: <20251216-msx4-v3-0-14a4b0c3f359@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, 
 to=andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765935285; l=2864;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=RorQtN2VK1hZq9J5NQ1D/PUk1y4WlgRzdZPNvAknOaU=;
 b=NJyJZoYXgOFV/PTcYgPbXXqLWWtTwYtRwu+aYyyHzwhsXCLuRK94D1KKiViR4Hll+FwDNplEG
 gLCYeCf+saNCu/qfn8uu7D4IPMZzktso5W7iaRCupfUHxI2rYDYLwlL
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: cf17bb71-87c3-4ff7-f012-08de3d0c795b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTBNV3R3VmpCUVczeHV2Z0h2bzB6ZENQYWdyWEp3Q0lMMEpUME4veXUyak1a?=
 =?utf-8?B?WHFPdDdTdENuaE50UGxJSXltdmxNSXM4Wkhlb3UvOE1WSU9lN1NuTzRlSTl1?=
 =?utf-8?B?OWtxYmNYL1ZndVB4MXoyNFh6blpDbEN4cVdycEkzNWVLSmphMDlLemhnTS9t?=
 =?utf-8?B?S3hNYWo0dFBDN0FTS1pjUmNpSFRwT3Zqd0pVQzloTmM2THZYUnptVXZRTkdL?=
 =?utf-8?B?QmFDdGFib1pEKzdzQmdrU0RGVGFyNW9ubjVrdGE1NTJEQUFrMWFkZ2E0T3h5?=
 =?utf-8?B?QlRxMWFod1hneUp3TEl2YTRSRFlTclc4cmliNk15Z2pxbUpRWUV0THBBS0o1?=
 =?utf-8?B?NzgrU3RwZWFKclptd0k0MFlWbWF4OVkwcVlJSDZzb2VndkJScHp0WGc3NTdR?=
 =?utf-8?B?Ny9LQ1pPelBIaGNtcmJVaG1oMCs2bTV2K090K2dNMDV2UENjYWF5UjRWcmoz?=
 =?utf-8?B?eVRPYmtRSFNaOWxzd1R3cXVMSCtsRTFlZkJ4MkpKUkUzam5uOGp6WkRTQkpT?=
 =?utf-8?B?OXd5YWF4NFhPYys3dU56eFdSL3M4bnFEVXJNQWVCcENRSHFCaXhXdjBYd3RI?=
 =?utf-8?B?K25KYnZxb1JLZGMxcmhDeGVEeGc3N2ZHUDVFNk1QWWZvc3Z0b1I3cFZmTmtF?=
 =?utf-8?B?OE0xbjM2b21wMXhTU08zTXJZd2ZneVFPT3RQRG9mcXd2d3ZYeXN1OGpTZ3BR?=
 =?utf-8?B?clpoZTNWQmdkbWxYMFE4US9oVDBKWFFIY1l6Mnc1K0ZoaU5Vb0dXV2kxY1VM?=
 =?utf-8?B?U0ROZFZ1VUsrUXcyRHpxVjdWQTlkNjNKenZLVys4dnFZZ0ZGcitFS3BxcElD?=
 =?utf-8?B?SHJmVklPVzFsQ3FuQXpxVGdTbkhtN3h5SHk5aVhPOHpnRWhVVDVra2xUbXJw?=
 =?utf-8?B?eVArTGJzZy9nUVV1amNya3Rvb0pxcTZwS0VZZEEzQ0tycnBMbXhRc0NsTHU5?=
 =?utf-8?B?UFkvTjU2Z3p6V2RHTERVWThQYlVoQi9WeTgxT29pUlJBRmYzZjZGRTZrSUpp?=
 =?utf-8?B?MmxpTnFaNXJXV0xYeVVXQkZUSzk4eFlBZzVYOXFlSWZxU0xla05XUWhNckFz?=
 =?utf-8?B?Mm1KVHlPRC9NL3pObHVtVVlMK0pRN2wvMFRzSHBsZGxpMlVIRXZGM0FBd3g5?=
 =?utf-8?B?UGFqSHdnSlJLRmdsTVhzRU1zVFF1djg0ZDJvRTJVTXRRdjc5V2l1dCtGWlJB?=
 =?utf-8?B?Y3JLRzlxTnR1R2tuRE1jSEVtanJmVzFHYUtoUlRyKzNPa1R6a20xR1p6Vy9p?=
 =?utf-8?B?bUpSbXE0L3JVWXhIL2s1ZHJmWXdqYVM2ZDVlR0xFclkwL2FKU3dYWno5T29I?=
 =?utf-8?B?UmpKZGpWRGV1a3NNbmVHcDNQVjBLd0o3NTMyZkwrdXBHeWpIT0pza2xYMit5?=
 =?utf-8?B?dXVVQVZkSE9JcWo3ZElGZDhzMmpDT29zTEw3L2FLNFI0cHdXQm1jU3Z1citC?=
 =?utf-8?B?ajZ3Zng0QWErbm1FQnMxcHE1VU9aRG5pWUNkeGN1N0kveU4yS0dDYndId016?=
 =?utf-8?B?WVlxbU8wUGJLdUk0elJYWGhCNGtoWDdnU1pKQVZJVC9zSGpYQ2FZZ1pnbzBF?=
 =?utf-8?B?akw1NmdBL05xdEJQcEdwclRQV3I5aEV6QUNHQjQvMzVNbXBiMUZZQy8wc2tm?=
 =?utf-8?B?NkNTeW5nT3NYa1hWc1I2UDhqR0VpMVJaRUo3Ty8xanV4NkFheDN2TTFnV0h6?=
 =?utf-8?B?YnZDVHBRbVNqZWJSMEFKS2c4NXpxWVN4ZWRNNm9rZEJFa291UHZTekhhM1pL?=
 =?utf-8?B?M3BhQ0RvMXF3R0QxZzdFOFZNZDhKa0lhbU5Bc3oxTzdUR0hUb041aW5QVkVu?=
 =?utf-8?B?UE1GRGZGaHQxZWlEM2VraEFvRVJSMFFNSkttTkM2eHNJeWhtY1RzVGI5dkN0?=
 =?utf-8?B?QnoyNDUreTlmVTFQVEIyR2V1dTZHK0EwQmd4OEErUlNMa1YrejNjaFhBV0o4?=
 =?utf-8?Q?j+H09booGbm1Lf4fZwNOKWhvMc2pPUiI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFRoVkRjbjJ3YVU3T1Q3eHFHWjZ2TGRGdEJuSVZSNW00M29FdzBjdXFnbnJP?=
 =?utf-8?B?cC9qRm5kWmRaQjVjQzc4Z3krTXB4UTFHVytsV05ORHQ2bzF6TTcxdWZocnVK?=
 =?utf-8?B?K1hFNWlSRVc0RE5acmMzWmE3ZjZwMSs2emNuR2paMnlCY0l4NU9TaUJ4bGJp?=
 =?utf-8?B?Y052T2dFdGloOUdDMmlsZ05sdlJnRkg1MTc0bk4vTUd3aW5kRmtCVmpKNklX?=
 =?utf-8?B?UlJmSmVhTUFXZUJENlcwbjZVWWYzQ1h6WTVrTFB3QzBPVU4ydXVkT2hHYVFR?=
 =?utf-8?B?MTY3bG5DZDF1dUk4VkJzMnZiUVI3THl5RHlNMHlLdHNjSENoWlh4V0ZZR0RY?=
 =?utf-8?B?Z3BJenpqR3UwLzcyN2xEZEN2S21XcU1MM2JPVWRPb3NvREQ0UFZzaXZBc1Nx?=
 =?utf-8?B?TEVreXJ3dUljdklTUUs3ckErckl6L3FrVHRMWXBCQUdyZnF3SnoyY0MvcGo0?=
 =?utf-8?B?dkE0NGRlZ21wNm56blR0MWZOZEJxcTRJTC9hNWVmb25ldHJ1VVpXM0taTElw?=
 =?utf-8?B?OTF5bHMyWnhNSVdYdDAyaUVjUFZza1d2NDJFSC9hWlZWcldWRUFaWjZwNElv?=
 =?utf-8?B?b1F2V3hSZFpHSlNsQi80R1JXS3RWRDBQNktxU0FIaDNDZWV1T0UrdHhjZWhQ?=
 =?utf-8?B?aWZqUFMzemE1V2JqY2xaUFhzMHBBb01xZzVUcytOZ3JCMjI0Vk81aU9QWDR5?=
 =?utf-8?B?K3RUb0VLZU96VGxROEhkRFRjMXJ1QTJMa0ZnWDhPVGlvRk5FRSs0clR2alY3?=
 =?utf-8?B?SUh6S3h2Y0M0VzJ4NTJWbW90VzErMVk0QmhnaG5zMTB4WU9KL0QvQkhnaGht?=
 =?utf-8?B?OHFrNVJLcGdoeld2bWMrRUVvblVYVTZvRmkxK0dHRW9aU2ZWeHNkUG90S2Uy?=
 =?utf-8?B?bVd4SklMZmpoQU1VcHJmbUNMQVpyNUZWL0RtN1h2eWFISWk0ZnlKYVltUGlo?=
 =?utf-8?B?dVh3ZkZLZEQrR3oyUVVEM3JBSHFZUTJZSy84N3dvbGtPZG5pWXhLVGNCYzdL?=
 =?utf-8?B?UVdqaGNaUHZUUXp6RjR5NnNzemJaUlZzSnE4VWRDVWg5dVlER0Y4ektUZXZP?=
 =?utf-8?B?c2RpYmMzWFlKbjRWeWl0WlZrTndieGZjQmlOMmwwS0pnOWRzY0JTQnhyUzF0?=
 =?utf-8?B?OGZ3NUhYVm9vbjhCV0g3cGdIZzRsMk9BQndiMTc0Zmg4UzJpUnRnMzQxaElW?=
 =?utf-8?B?RnNHQzRHMDdRblZERXh0aGc0a0g0Mmp6L0ppUWlKNVZZZXB5VVlYdjR2ZXFy?=
 =?utf-8?B?VERCN08zWTBya3VoellKbWx1djRCN1c3enlrZUlLeUs0bHFvSElXLzBueGtr?=
 =?utf-8?B?OEZSSHhjVm1vZ0w3TUs5UVlqbE4vV0FlZ2ptdDVpdDlyazlhWXcxWWJDSnY1?=
 =?utf-8?B?cEJ2M3VXY085Z3AwU0F6bzhaeEpoNFpicjU0RCtSS2lHV28vWXJjaTZ4VElB?=
 =?utf-8?B?bGQ3bTg5QVM1dDM4WG14U3ZrdHNSUTFQMjRTZE40RTZ3WFAwZHJ3dUhrWHdQ?=
 =?utf-8?B?Z1p5V1k2WS8xMDNXYWpZMU9sTzdqelpoR2QyZWluZ0VlOGFNUjBjNWlTNXM0?=
 =?utf-8?B?K2Y5bkpkWUdnTTJ5VmQ1RE53Mmd2Z3RwYmZWeExXTkh3RXJwbGI4NW51VEpB?=
 =?utf-8?B?eDlEYVl6MDRBWGtmdGRWZ2p6Z1pacFR1QW9KSk5qd0JpU2hOQ0pPTzdXZVNM?=
 =?utf-8?B?WG5FSnpEYlNrOEJiYU1Ma0drbG1yb2dwSiswNnhxRTJlNkw0eStNN3kyMEtY?=
 =?utf-8?B?UEUvYVNvOStMVDN1YUlaWldzdVYwbjB2UllVbGRFaGRSN09aZDFPeHQvL1JV?=
 =?utf-8?B?bDhuSFdrRTZ2TkVWUGVCWGdOSnRpeEd2bzh1ZFQ1UjZoYjZua21mSmFWMWNi?=
 =?utf-8?B?VVFxaE01NzdqWnBCNHI5dDZoTzk2dGNXTXBiNzVIaWg3ampFYThNNkZjTVVJ?=
 =?utf-8?B?UGM2VTVIMGVybExxbzB2MEZXRi9DQ1dWaXVIclc5WThndktGQVFzbmJxRENr?=
 =?utf-8?B?cUxkM1JRVUpSOVd0bWZOUzZKWk5ublJZS2p4MC8xcElncXNXQnArVERLVlI2?=
 =?utf-8?B?a0FzWkwrUDBtTGYxSnVCZTZoa1c3UWlKZ1lCQ3lncTdUb1NsVGNKSXVBemJp?=
 =?utf-8?Q?Npi2ersK9TmPDbeZOhUxRO2kq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf17bb71-87c3-4ff7-f012-08de3d0c795b
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:34:51.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7r62qYQF/xiZzgqtUIUrKRpOvnx+as3MGRpCIV1ijkPTmMP+wUSuE0wfNKEpop8XASeZkcU4DpBnw/P9nngALA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds a dts for the nvidia msx4 board, a granite rapids based motherboard

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 112 +++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index dbb2fafc4f4c13302a02875cd678477ab95334cb..5141c3dc3aa025e2f5c9b2bb98216ee5c72cdf70 100755
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
index 0000000000000000000000000000000000000000..d83616ac4b2238ec39e1355487989153ab685b02
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
+	aspeed,watchdog-disable;
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


