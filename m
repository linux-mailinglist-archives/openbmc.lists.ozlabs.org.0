Return-Path: <openbmc+bounces-631-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0861B51E23
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 18:47:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMRRs20fbz3dCt;
	Thu, 11 Sep 2025 02:47:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757522825;
	cv=pass; b=Qbk244N+OfZ5uUilhDBa1qCZ+7zhE6IHgLdIRmQpfNjXolQ4tyoTqjUVrtLPH/3+deZweCzXhI75b5MKm499XxQXQ70Y4yg6Tw+wKDow0Fl0hBolT2pg5gsWax72OIlV2FPFa26MbarA3LdYg0rMH5Qly7W63RGIFcYny2Z/AGEHIkiQJURneFIMcxi36Dij8chAuUxyjk39wqcasb7hxO2RVReo7pgJc7deC9wkHX0IjZWx2NCmdOk/X1UTe0yK88P4ret8i5Wo5K6pCd7/tUcJ3MwCbGZIDDdcc7dD+aVum7W6DFNTjeTFYgGMH+faUrnCX/a0hdA0+yJixtuO6g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757522825; c=relaxed/relaxed;
	bh=wgyXfohafEVWnvUNtbplW9NjjPdVY9kTrIhSlSSYMvs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ju2kGrNhYPLGaVatZqSJK5HKKvAwNbzZua8HvsQKuQtLmBTW6e482/ry7P1I/1sdJqTIQPqrzBbDL4kXBjRKW+QsOPNH/gA9Rrn+gOSWca70kQJLHS19zaBNsKdaB8tTyjcgfgJkCPiIyRyZceQETTI4aYFsBPr7L2knH8CxAkPjjYRFATjDWSpA/AMPIqbn3jFgu8mt7bizLMa8rC/7brB0bYJ0n5s5cYTr8FbqGRWfSiO2bFfEmWq/4jg5jnF5PFzuVigZrTVWHxh+MJL8a6+yXUjEfXYz1MpnxBANx58FudUH21BB92vAfzQliONjkEqCKE+7wJFuq3V943GoUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S6JSYCS0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::60a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S6JSYCS0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::60a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMRRq1R77z30Pl;
	Thu, 11 Sep 2025 02:47:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCHOU3ojqKY8hSNC8a7QyAVK2gW9yr8/cS5ksW5xgsIECy4COj9XGP7xEZqSR5cwS64zmzIaQuywGVZosCiA6tM/dTCM1XcCnldzug1MrYjE/JBctJA0jDL2n7QIVgBYkM4uobR+dPpitilUZYmCdrkEeDu94RdBFpbT7FCcOsliR9NcDY6b0Luaj1NCEbf6gjBFv4FAYWtA3GTSu27bjFyVqkVqn3iZEed2sOWRyngXcV76kNPH05SUFJrxeZaEkVkS9mbHhYR+EKCPk5F8qSHAKFMdutGWNmY0sUmttvhS34ESMLl8fR4niu1SRQAXHynxzLn1U8u8dNAg31uW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgyXfohafEVWnvUNtbplW9NjjPdVY9kTrIhSlSSYMvs=;
 b=kNdfGbDljj5uXYNugXHwJZMgN3k4+RxzDukA955d7S82P3cbBZQTGIk4Q2OrSFvoFkeoa41RD8Ev089MJSNFkyxUbbbii9xl1ugPwdkYK0WCCE1azsVpvrmzBKqhOKs+sqYWXsPG8NmebvTH7YRBsTbBvMSe61pEO1JzD2n/1ZroDoB64UlEmv+EDjCzhSy+pphzM1MyEyyUc6o3WYYn57V2xdfOi/z19kTV7MahggdarqCYjPUUe860ZQCp1drdT0jcMAPN6ac0RErxwudg2BeEDm/tngTp0BhVjbYsNDDRe86W/CEJNZAAdSXbQGLdCoH5vVOKBZSEwaL4HuVzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgyXfohafEVWnvUNtbplW9NjjPdVY9kTrIhSlSSYMvs=;
 b=S6JSYCS0rm0Rwvhr8+F/r4bTdBBtHdEswA9PC1sRROEfIkFhoEtD/muCONack9tD+z5UeKd3XE3MEU1YK8K7aaoRgrhTrSE0wuj1P0iAPM4H0Uxnky+bYphbWmxw8H0uGvl91ucaGKcaRmK5eqtJM1F6/uniSpsbKeziAazUiPJipz/sPVwKKVCNmGhrL9xPA/3lteJbdPE+2+YjJBVcglQGPZzlWXhZdEyKX6FQWBafRDh6JLHhuidg1zoNhj7wtyROcwgWDEMJ7tUw2IAdvF56zg70DJ2YzRTy9467fcLyAcWgxzvwsQA+xppm8TehT83LXsBhPcZoXsVXgFTXMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:46:40 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:46:37 +0000
Message-ID: <f0b75151-d355-4d03-a356-dfbfb7a9e803@nvidia.com>
Date: Wed, 10 Sep 2025 09:46:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
From: Donald Shannon <donalds@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, etanous@nvidia.com
References: <20250822203818.4062595-1-donalds@nvidia.com>
 <20250822203818.4062595-3-donalds@nvidia.com>
 <f9cd6015c47d390eef9c689d2cb4fcd301c4d123.camel@codeconstruct.com.au>
 <fcd64668-4232-4d7b-98ec-5326d40d19d7@nvidia.com>
Content-Language: en-US
In-Reply-To: <fcd64668-4232-4d7b-98ec-5326d40d19d7@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To PH7PR12MB7282.namprd12.prod.outlook.com
 (2603:10b6:510:209::7)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: c16e9618-f91e-46e2-a2e5-08ddf0899be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFVjYWtHcUE5MCtCTGtpRmdXaVkrbU1Id0FyZGhud3lYVXNLem9tc3NrZHFw?=
 =?utf-8?B?ak5GMVJqTWpOMVlJUlp6R1gzMVc3TzZpR2I0OEVKM01lSlV4eUNUY3NQWEhx?=
 =?utf-8?B?cUtHd3ZpQys4aGxjSUZNbnNrRFJQZlNnSmYwV044aEp4dGpwVWYxRGp6MG5w?=
 =?utf-8?B?U2FLM2l4QlVFZmpkbEtuRmtVQ0ZxbExzbFNZUFc2S3ZRNmE0cGRVaW9Zb0Uw?=
 =?utf-8?B?b0ViNXRzNDhOSkZZMnhtSUUwY1dkMTVMN3FSdHZENzJxQXJIN2lDL2xWSXZL?=
 =?utf-8?B?dEY1eHl1ZzFCMHNDM0tncWEzci9UbTc3Tm1VY0VUQ2txa3AxOUY2U0IwM1Ro?=
 =?utf-8?B?Q1B5ZEFtTUZBYjBKZnVnejFYUThxUmk0VkhnMTRONU92YXRiSE9Od25QVlFI?=
 =?utf-8?B?NHVnQU1ITVhaYS9FUSt6cSsrWG1KdlU5Q3RReVEzUWNsQUxoa1dIMGswRU15?=
 =?utf-8?B?dHpCSFErazZQZHlVNi9obXc2RW1tTXY0ZFdnRVFSZzhJUGNudXE4ZHRKNVRo?=
 =?utf-8?B?bUJ0Q0FPZ3Zzb3ZLbzNmQnlKVmFWUkh2SS9rNHdCc2lDNkR0SFEyUTBNbkFj?=
 =?utf-8?B?UnpPNDlid0RjeHRURnpNVVdjeHpwS3FiaWR0NjV1ajVUdHppZEZGcWp5OENF?=
 =?utf-8?B?TnEyY3hxL3BmajdybmMzdU1nS2dubzFyYzcyK1RSZUhMSnd5MnBtWE1ockJn?=
 =?utf-8?B?TFN1N1BDTVhhNWhrU1VUeGZqUm5ZdlVXVnhKa0hHd3ZOdXphYnBHRWpGVHR0?=
 =?utf-8?B?ZGxQVmtlOGl6dmZWNm1WZnhaRDZBTkd2U1RDd2JEL3RFOUhyUUlncUVOeWJh?=
 =?utf-8?B?b29IMUZBeXJTRGR2eUhQakVORDVYK1BuU251Q1Q4Vzg1MDdJbHpheXdodkVm?=
 =?utf-8?B?Y2c2aU81OGl5T3NXNndnSjluVG1MZm5ac0tZenFrZFJxbXUyMVRnNG8xaktK?=
 =?utf-8?B?eEd5cUt2cjZFYzNCanRhVU5aZnNsVWRiVWUvUlFrUTc2UWdRSE1WanFPei9D?=
 =?utf-8?B?UWlLYmVzdWdzcWNqVEJwZTN5OWxmWnBhejVEdlB2YTJ2NWlnbDlyYWg5UUg2?=
 =?utf-8?B?Sy9jMHRXNzBjUk5wRFlsazF2WDBrS3kyNW0vQ3Zld1MrNWRBOGRiZzBpUGJ2?=
 =?utf-8?B?RVRSc2ZEVEhLa1B2VXVZTDRKZytvSDQ3dDlzNVVqbEhVUm9Gdko5LzJ2aHFq?=
 =?utf-8?B?cWM1dVpPdnI0cDR2bExJUk1JcEF4SU1Rb2ZGNlBVdmFoWVE3dmh4aTdjSlZU?=
 =?utf-8?B?RWpOQUdYSnEyVnE5VERtNVh4Z292VXdYaVF5ZjRuR3BWUU55OGJreThrMVBX?=
 =?utf-8?B?RDloVEIxZ0EvTy9TZzF1QVpIUklSVEFreFZnUDMyNC9RRDdVY2xpNlQ1ZjFI?=
 =?utf-8?B?eFhkbExLdHBuRzJEaFFqQmNxcVZWQ3FYVE9wNnJLSk5zZU5KQ2E3eFh6L3Nk?=
 =?utf-8?B?ai8rTkpVUmF1WExLSEJjd2xyKyt3VmVaSFBTU01SR0h0ZnV1QzZtaXJCTHQ5?=
 =?utf-8?B?SUlUQXBvNjBqK0xVMFowZXB2cFFWUGhHQWZkdFFRNEIyYnk2VkdacHdZOFkv?=
 =?utf-8?B?SnptYXkzUFZjWGNERVdLVXpIRXcyT1B0M2l2dHppZnh1dTdnSzFnR2UyUWhW?=
 =?utf-8?B?N0lGc3JDbmljaGd4RldxNklGM1hsTTFaQk9DS1lES2dORDZycFVxNTFjSDJF?=
 =?utf-8?B?UXc1SnN5VWFZTzFQWm1pVXcxSkNoWW9PV3JFRFZVNXpVRDFEdFRjTnBXSGow?=
 =?utf-8?B?Kyt5SnQ2WjJpaDNkSWEyakdndklkMUhaK1NyR1NoSzR6TFd2QVJBVXVjMzJs?=
 =?utf-8?B?T05FMnNnRCtNdjBtcHJKemVlV0JoTndJSDJnYVFiYU16NC9HZmlFbXZsTXE2?=
 =?utf-8?B?d1dDb1pEdWFHUmZYVGxUVThUR2hpbWYrRkJ3c1NuS1ZEam9Wbkd6Z0lHc2FI?=
 =?utf-8?Q?YJf+sKbkiYc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlIxejc1MUZOSjJMNHNudHpvSml3R3VQRWtubkkwWTBYUjZqejk0ejR3UUdI?=
 =?utf-8?B?cHl4S3lkSnpaT3dDQ2NZSzRtbGt5ZjBqRnZWaXhmVEV0MG9oNE80c3BQR2hy?=
 =?utf-8?B?STFpRVVEL09OM1VraDRWQkk3aGY1L1diT1dUYUozSXhnTElDdHM4R3FQelZn?=
 =?utf-8?B?U29sRXVaSmRCTlBhaDZrTWhGaTB4b3I3ZTI4YzFqTmtiVDltR0FjVitFcHhm?=
 =?utf-8?B?LzkzN2RsVGFNRExtNzMvWlV2cm9xMkpveDBZbks1d3NxaDlkSmJhRUY4b0s5?=
 =?utf-8?B?Yzc4MWF6MVNpdHVUQTdxVWNPbENkcExYd0gwOE1WRTJUUzRLV3RZS3BnTXVh?=
 =?utf-8?B?N2t6Y2ZWTFNYemppZHVxZHhGNGIzN0ZJMHhsTG8xNGgxYlczK2lqeUlIRHVM?=
 =?utf-8?B?NWs3WFBRSDlXeXFVSjdYczFWWDRYWlBQcGNjRGR0b3ZGblI0dUJsZVNSWDlw?=
 =?utf-8?B?NFlzaitZcnR4WW1CRHlxMjFKdDZoV1FNM2g4RFFrK0FuczJVS1VHdDM5bnpT?=
 =?utf-8?B?ZWc3ak9xaytDMWVMM2ZRZGxKcmZyOUFaQU1iYVFPbGxzVFlvKytHS0RiNEhV?=
 =?utf-8?B?SVpqdTZ5YmdPZVdUU0VIUzlrQWlqekg5SzB5bmFJNmh3SXhzcDl2TWpiY0FU?=
 =?utf-8?B?YXJEUmkzbzF3WXR5RTJENjA0MlhPbGxOV3Q4WldBdXhUMVlQYmdHbzRBT1RO?=
 =?utf-8?B?SGRWQ2UxRHl0VWp1MWQ4UVRpYjQwZXJNMFY4V25ydjZtN2hhSnp4T3Rmc2d4?=
 =?utf-8?B?RHRxSmJVTE9ZSGEvUWtRRG13b3UyNXRNcUd1NUxCZWpaNmNVVUR4NU5OamRs?=
 =?utf-8?B?TFFYRW9WNEU3eklWNXFaVGI1bEhwNS9aaUNDWE5wRCtXSUZqYVhQY1diUzVL?=
 =?utf-8?B?MHRMQTNQenpQd2dtSXdWS01pbk9ORk9mY2Z5b3Q0ZDF5RGduaE1md0RlajdE?=
 =?utf-8?B?amxPRGpiMUljSFVlOTA0MXRMdVVhNDBXd1RPZXVhbDhPSDVGTVBCU1Z3eFVa?=
 =?utf-8?B?NHp5ZDlUTzNMbmdvd3ZCVFh0eFVjTzZUTVRYN3Jlak1XWUtmbGw5dWRWZ2JX?=
 =?utf-8?B?NXE0TVM1d2wxMFZIRFQwelltUFN1UC8xNVJNOWhqWEFtUDFpQTg2YzFQQjBt?=
 =?utf-8?B?TmxHUS96Y3g3TVErS0h1ZFdKd0tFYmo3Vk1MVDRwMG11L2VhRzFoUXk4K1pB?=
 =?utf-8?B?VmVEaHZUZnI4cnRSNWgrcFpIelhQNmR5UFB4RjJKbDBqNEowUC9qd2dWeTNp?=
 =?utf-8?B?ckJLL2hMQTdMcm8xdjlkNGlNU2dxbWdHZFRURUNrWkV1MkFpL1pBREtUVFBM?=
 =?utf-8?B?ZlZMYks1aDRpUTY2ZUhaajFscDBXVmRITDRMbXZuSUxUdnJWU0I1VkZNbDNp?=
 =?utf-8?B?U0dIQ1BPT040d2thTDg5MzZnS1ZNNGlHSUR6cVlldWNpekxQaVRiSGNOcVB6?=
 =?utf-8?B?dGVhdHhZR3NaMVlBUTIzeE5USjJROVVhTU8zbWtadXE0Yi95dXRIbGVOcnk3?=
 =?utf-8?B?R2lOVFQxVjloVU9sRUJtRkd3NEpWUWoyUUlTNjJ0c1lDY1ZIU0VLS0VYb3Zx?=
 =?utf-8?B?T0o3UjMyNDhmWTlMWHJoenpiQzBaelJVcDNhSEdFbUlNV2RITlRZampsdnAy?=
 =?utf-8?B?emJlVEg0TDFWK2QrOWpWUVNzd1hJOVVVV3M3a3FDZ01pU1J6VGR5QXRtSG0z?=
 =?utf-8?B?ZkhnQ296SHh4MXppWHdRTVkwaFA3SW8rckZDSkI0bERiTlkzWlBKUTZSVzdY?=
 =?utf-8?B?aFBwdFNyK2ZRSnV4OG9ES3ArYms3UkdRNkd5UTJUVWRuMnBTMzRyWGFsc1lq?=
 =?utf-8?B?b0FjVTJNbC9nNmRoWTREblNuK0dUYURneTBwYThjSlQzWjlrUzl6WE5Sa1hX?=
 =?utf-8?B?Y3RTTFZqSXRaWk1sdE9STDhhMjhUdmVlRVYwSHZBd3NXK2hodDhUN0R2WklI?=
 =?utf-8?B?OXFxZUo0d1dDOFBEUHJ1dWpRY01nQTNXZ3lzZ1ZiK3ZIWm12Nkx6ZTY2THJ1?=
 =?utf-8?B?MDFKUHFISnlGK2hVd2NMZjVBWDJZaDRITmJxRVRqOHNSM1g3ejlneWh3WFZv?=
 =?utf-8?B?TUZzS0hESmYzVCtEbW81ak9FZXFsRnpvU0Iva21hTnd3SDZSeUZEQnVSZjY4?=
 =?utf-8?Q?ohmvjiw0SDGhoILH2jF2ywDSb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16e9618-f91e-46e2-a2e5-08ddf0899be4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:46:37.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3cZSMU5FPqUp8r6Z/RipuTH5GD7lkVZZjRew/ewwsnLPyptFp94yC/aiGHCRXpobRQi1eXta9JKMhxjxrqBIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/9/25 16:05, Donald Shannon wrote:
> On 9/3/25 00:07, Andrew Jeffery wrote:
>
>> Hi Donald,
>>
>> On Fri, 2025-08-22 at 13:38 -0700, Donald Shannon wrote:
>>> This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
>>> Platform.
>>>
>>> Reference to Ast2600 SOC [1].
>>> Reference to DC-SCM Spec [2].
>>>
>>> Link: https://www.aspeedtech.com/server_ast2600/ [1]
>>> Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]
>>>
>>> Signed-off-by: Donald Shannon <donalds@nvidia.com>
>>> ---
>>>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>>   .../dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts | 779 ++++++++++++++++++
>>>   2 files changed, 780 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>>> index 8062c685f7e8..b479824c434b 100644
>>> --- a/arch/arm/boot/dts/aspeed/Makefile
>>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>>> @@ -55,6 +55,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>          aspeed-bmc-lenovo-hr855xg2.dtb \
>>>          aspeed-bmc-microsoft-olympus.dtb \
>>>          aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
>>> +       aspeed-bmc-nvidia-vr144nvl.dtb \
>>>          aspeed-bmc-opp-lanyang.dtb \
>>>          aspeed-bmc-opp-mowgli.dtb \
>>>          aspeed-bmc-opp-nicole.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
>>> new file mode 100644
>>> index 000000000000..5984984b5109
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
>>> @@ -0,0 +1,779 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-g6.dtsi"
>>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/leds/common.h>
>>> +
>>> +/ {
>>> +       model = "AST2600 VR144NVL BMC";
>>> +       compatible = "nvidia,vr144nvl-bmc", "aspeed,ast2600";
>>> +
>>> +       aliases {
>>> +               serial2 = &uart3;
>>> +               serial4 = &uart5;
>>> +               i2c16 = &c0uphy0;
>>> +               i2c17 = &c0uphy2;
>>> +               i2c24 = &c1uphy0;
>>> +               i2c25 = &c1uphy2;
>>> +               i2c32 = &i2c_usb_hub;
>>> +               i2c33 = &i2c_tpm;
>>> +               i2c34 = &i2c_dp;
>>> +               i2c35 = &i2c_rtc;
>>> +       };
>>> +
>>> +       buttons {
>>> +               compatible = "gpio-keys";
>>> +               button-power {
>>> +                       label = "power_btn";
>>> +                       linux,code = <KEY_POWER>;
>>> +                       gpios = <&exp7 9 GPIO_ACTIVE_LOW>;
>>> +               };
>>> +               button-uid {
>>> +                       label = "uid_btn";
>>> +                       linux,code = <KEY_FN_1>;
>>> +                       gpios = <&exp7 11 GPIO_ACTIVE_LOW>;
>>> +               };
>>> +       };
>>> +
>>> +       chosen {
>>> +               stdout-path = &uart5;
>>> +       };
>>> +
>>> +       leds {
>>> +               compatible = "gpio-leds";
>>> +               hb-led {
>>> +                       gpios = <&gpio0 127 GPIO_ACTIVE_LOW>;
>>> +                       function = LED_FUNCTION_HEARTBEAT;
>>> +                       color = <LED_COLOR_ID_GREEN>;
>>> +                       label = "bmc-hbled";
>>> +                       linux,default-trigger = "heartbeat";
>>> +                       default-state = "on";
>>> +                       retain-state-suspended;
>>> +                       retain-state-shutdown;
>>> +               };
>>> +               pwr-led {
>>> +                       gpios = <&exp7 8 GPIO_ACTIVE_LOW>;
>>> +                       function = LED_FUNCTION_POWER;
>>> +                       color = <LED_COLOR_ID_WHITE>;
>>> +                       label = "pwr-led";
>>> +                       linux,default-trigger = "default-on";
>>> +                       default-state = "on";
>>> +                       retain-state-suspended;
>>> +                       retain-state-shutdown;
>>> +               };
>>> +               uid-led {
>>> +                       gpios = <&exp7 10 GPIO_ACTIVE_LOW>;
>>> +                       function = LED_FUNCTION_INDICATOR;
>>> +                       color = <LED_COLOR_ID_BLUE>;
>>> +                       label = "uid-led";
>>> +                       default-state = "off";
>>> +                       retain-state-suspended;
>>> +                       retain-state-shutdown;
>>> +               };
>>> +               fault-led {
>>> +                       gpios = <&exp7 12 GPIO_ACTIVE_LOW>;
>>> +                       function = LED_FUNCTION_PANIC;
>>> +                       color = <LED_COLOR_ID_WHITE>;
>>> +                       label = "fault-led";
>>> +                       default-state = "off";
>>> +                       retain-state-suspended;
>>> +                       retain-state-shutdown;
>>> +                       panic-indicator;
>>> +               };
>>> +               warn-led {
>>> +                       gpios = <&exp7 15 GPIO_ACTIVE_LOW>;
>>> +                       function = LED_FUNCTION_PANIC;
>>> +                       color = <LED_COLOR_ID_RED>;
>>> +                       label = "warn-led";
>>> +                       default-state = "off";
>>> +                       retain-state-suspended;
>>> +                       retain-state-shutdown;
>>> +               }; 
>> To be consistent with my request on your other devicetree series, can
>> you please order nodes that either have no unit address or reference a
>> label alphabetically, in line with the DTS style guide?
>>
>>> +       };
>>> +
>>> +       memory@80000000 {
>>> +               device_type = "memory";
>>> +               reg = <0x80000000 0x80000000>;
>>> +       };
>>> +
>>> +       reg_3v3_stby: regulator-3v3-standby {
>>> +               compatible = "regulator-fixed";
>>> +               regulator-name = "3v3-standby";
>>> +               regulator-min-microvolt = <3300000>;
>>> +               regulator-max-microvolt = <3300000>;
>>> +               gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
>>> +               enable-active-high;
>>> +               regulator-always-on;
>>> +       };
>>> +
>>> +       reserved-memory {
>>> +               #address-cells = <1>;
>>> +               #size-cells = <1>;
>>> +               ranges;
>>> +
>>> +               vga_memory: framebuffer@9f000000 {
>>> +                       no-map;
>>> +                       reg = <0x9f000000 0x01000000>; /* 16M */
>>> +               };
>>> +
>>> +               ramoops@a0000000 {
>>> +                       compatible = "ramoops";
>>> +                       reg = <0xa0000000 0x100000>; /* 1MB */
>>> +                       record-size = <0x10000>; /* 64KB */
>>> +                       max-reason = <2>; /* KMSG_DUMP_OOPS */
>>> +               };
>>> +
>>> +               gfx_memory: framebuffer {
>>> +                       compatible = "shared-dma-pool";
>>> +                       reusable;
>>> +                       size = <0x01000000>;
>>> +                       alignment = <0x01000000>;
>>> +               };
>>> +
>>> +               video_engine_memory: jpegbuffer {
>>> +                       compatible = "shared-dma-pool";
>>> +                       reusable;
>>> +                       size = <0x02000000>;    /* 32M */
>>> +                       alignment = <0x01000000>;
>>> +               };
>>> +       };
>>> +};
>>> +
>>> +// Enable Primary flash on FMC for bring up activity
>>> +&fmc {
>>> +       status = "okay";
>>> +       flash@0 {
>>> +               compatible = "jedec,spi-nor";
>>> +               label = "bmc";
>>> +               spi-max-frequency = <50000000>;
>>> +               status = "okay";
>>> +               partitions {
>>> +                       compatible = "fixed-partitions";
>>> +                       #address-cells = <1>;
>>> +                       #size-cells = <1>;
>>> +
>>> +                       u-boot@0 {
>>> +                               // 896KB
>>> +                               reg = <0x0 0xe0000>;
>>> +                               label = "u-boot";
>>> +                       };
>>> +
>>> +                       kernel@100000 {
>>> +                               // 9MB
>>> +                               reg = <0x100000 0x900000>;
>>> +                               label = "kernel";
>>> +                       };
>>> +
>>> +                       rofs@a00000 {
>>> +                               // 55292KB (extends to end of 64MB SPI - 4KB)
>>> +                               reg = <0xa00000 0x35FF000>;
>>> +                               label = "rofs";
>>> +                       };
>>> +               }; 
>> This isn't using one of the usual OpenBMC flash layouts? Can you add a
>> comment as to why?
>>
>>> +       };
>>> +};
>>> +
>>> +&spi2 {
>>> +       pinctrl-names = "default";
>>> +       pinctrl-0 = <&pinctrl_spi2_default>;
>>> +       status = "okay";
>>> +       // Data SPI is 64MB in size
>>> +       flash@0 {
>>> +               compatible = "jedec,spi-nor";
>>> +               label = "config";
>>> +               spi-max-frequency = <50000000>;
>>> +               status = "okay";
>>> +               partitions {
>>> +                       compatible = "fixed-partitions";
>>> +                       #address-cells = <1>;
>>> +                       #size-cells = <1>;
>>> +
>>> +                       u-boot-env@0 {
>>> +                               // 256KB
>>> +                               reg = <0x0 0x40000>;
>>> +                               label = "u-boot-env";
>>> +                       };
>>> +
>>> +                       rwfs@40000 {
>>> +                               // 16MB
>>> +                               reg = <0x40000 0x1000000>;
>>> +                               label = "rwfs";
>>> +                       };
>>> +
>>> +                       log@1040000 {
>>> +                               // 40MB
>>> +                               reg = <0x1040000 0x2800000>;
>>> +                               label = "log";
>>> +                       };
>>> +               };
>>> +       };
>>> +};
>>> +
>>> +&mdio0 {
>>> +       status = "okay";
>>> +       ethphy0: ethernet-phy@0 {
>>> +               compatible = "ethernet-phy-ieee802.3-c22";
>>> +               reg = <0>;
>>> +       };
>>> +};
>>> +
>>> +&mac0 {
>>> +       pinctrl-names = "default";
>>> +       phy-mode = "rgmii-id"; 
>> Is this correct, in the context of the query here?
>>
>> https://lore.kernel.org/all/6a3d7eb4-c091-437f-98f8-2b8577e539a7@lunn.ch/
>>
>> If not, please drop the node from the patch until the MAC driver is
>> fixed with respect to the RGMII delays.
>>
>> Andrew 
>
> Hi Andrew,
>
> I will change this to alphabetical order.
>
> The extra space in our flash is for root of trust application. I will note this in the next patch.
>
> I see that the ftgmac100 drivers do not use the phy-mode parameter so I will leave it out.
>
> Thanks,
> Don
>

Hi Andrew,

I am getting conflicting messages in my v3 patch series and want to confirm what the consensus
is for removing or keeping the unused phy-mode parameter. There is some inconsistency in
the existing dts-es as well.

Our board phy implements tx and rx delay, so -id would be the appropriate one to use if we
decide to use it.

Should I keep it or remove it?

Thanks,
Don


