Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CDB962B42
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 17:08:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv78D4njfz30TZ
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 01:08:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724857689;
	cv=pass; b=o1BO/zoPnO9HdfJwIKpjXbdb+gfG3WYdM6suIK8yuaO54adrxRzFCg4pBwu5kBYI8PFDc7bEkcmDC5pPBoYF8H08VvfuKARX14+W+nO8NSuGd5VvcDu9D7NusjskbKgji7xvn7+9R3jDHHyUwgpP+qIyQUJOfZ0N8vMMTZwww1Uct1Ced2cWzxmXvJJQpvv5ImpmNaRJNkiNM2X+TIyJdugJn1uhtEodelovqrzyJTSnAC15DS5RGZoeo2XUxrF88mrccAVL4RsRjKfRIfZPxWcBXzdEqk4sBp/BacSCZJsVp42mHcW8mH9C0m2G1I2vU0heDRH1VFHpWhR+dLEGjg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724857689; c=relaxed/relaxed;
	bh=2QBqdMviYgIZbQdAzK0apq8nfk+AD4Mf8rk+LNjS1fg=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:Message-ID:Date:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YKZiL+dX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::610; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YKZiL+dX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::610; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv7880M9Nz2xQD
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 01:08:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpuh0KR+3yEzp3AMfRAGeU/7DrJXcOcLYeQoH3Fd4fheJ10PYo/9GKSNT5RnU+whT0yW8bilnoCzXpg5Oiyap1bDI6emJvXRc/9UqeiOPdyqbneuwUSvNFZNrVU4Me94xe5C1XO0CSPN3g0aRM8Nra197fI77uhrzkomkLxDT5Tqe5P+Ga+hwo4Lf6L3iXDZskSGdClVAEQcK+yFzho1J8AOUt35OrtoJbRUtGPO7zJUc+MALWEA1Cj5tzkgu3CZhH6vrcNCATVw1NMCAcuI11qLgo/nHQrPVXxf6jTLyHcG4jgF/ZGGbhcjjGgEr8jnusJUxA1xj/oi9Stkp54Qmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QBqdMviYgIZbQdAzK0apq8nfk+AD4Mf8rk+LNjS1fg=;
 b=Vg12oE23+f4oZ/lUjhtE9jEIsdF0+5jA5YauN123YXOuKA6vETby3OzxseBlDWMsZln30oxQS8Eq+JNiVPxpOPEnO+L5M0+A14iVxIbXEhq/+ZwNcp3a+xGd6x8AsHyhyKeyrK+G4ea8uluT83KnCnxaexrhPkRUejRv357gy2xHQpm1gkmiKUuZMbjv1AjiCUBEm6wXzWFGICHybbAj8TP18Et/K2nqmwcrfJSWU+N7IyrE2Kd+qUP0wsZx0pCYEMVxRKiehj3ajvDdQqiydmY+fUND9qg7tmFeg1kYWaehKeV3LooR5iseZSZn2D5kNqMJih/YPLm3mRx0uLF9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QBqdMviYgIZbQdAzK0apq8nfk+AD4Mf8rk+LNjS1fg=;
 b=YKZiL+dXdrifchR+9VGCw8z8syu3rr4CGFBqVBfOT3qIEDeNmhln72orji+6Rm+fNafobG8ruU4q0JlAHQ2NX4JM5nDEsyYpA1fswlLRw0sbNOi3J9eE7uZ5tYpK+gSwIaI3KnOI15ySdDSZMHL2P9O7ZqNvmVpB95nejKvNyKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 15:07:40 +0000
Received: from CYXPR12MB9318.namprd12.prod.outlook.com
 ([fe80::19ac:96fa:4fe5:d379]) by CYXPR12MB9318.namprd12.prod.outlook.com
 ([fe80::19ac:96fa:4fe5:d379%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 15:07:38 +0000
Message-ID: <5f7bfeaf-8294-420b-9be7-1866fed43d53@amd.com>
Date: Wed, 28 Aug 2024 10:07:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Plea for help with GPIO pin naming
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
References: <ZszK_Zj1QpH--xv1@vault.lan>
 <76955a65-9716-4d32-81d7-377df0d7b25e@linux.intel.com>
Content-Language: en-US
From: Supreeth Venkatesh <supvenka@amd.com>
In-Reply-To: <76955a65-9716-4d32-81d7-377df0d7b25e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:806:a7::30) To CYXPR12MB9318.namprd12.prod.outlook.com
 (2603:10b6:930:de::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYXPR12MB9318:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 503a9b5f-73b8-4336-d10a-08dcc7732803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?aEduYStTZk14b2lLc3hXUkE0cy80UVl2dG9KUFJZbTZNc0dmekZQZEZJTGxr?=
 =?utf-8?B?dXlOcVg5RFhLS1ZueEViNWN6Z2g5ZzdhdWNiZkRBMUU1QXZSaVl5bkx6b0VE?=
 =?utf-8?B?UytER2tQTVp5c1hoUGVqMlFQQzFqcE9tUlF1N0JCZFdLQU45Y3RuaWIzSkpV?=
 =?utf-8?B?c3RTQlMycFErT0JFaGdlZkxaTVlZa09XUUx5b3hVV1ZrTTYvdWVzMGxlWjA5?=
 =?utf-8?B?bjcwcWliY28xS1dORGE3STVFUTJNZTl1anpOOFZJWmI2c2FMMHRxUktPejhV?=
 =?utf-8?B?NGdHa1J0cnJOcXhGU1lIM2lwb3lvbXl6Q2ZNTWwrdzFISjh2UUJCaThrdWZo?=
 =?utf-8?B?Wk9vejJhaGo4TkxjNU16Nm9vcWZPMjEwcVcxY3RSNXRSSDVwK01rcmgyaFBU?=
 =?utf-8?B?UzZ6bzZGc1BOek5paFgwalg1ZUd6dll0aHZid1g0bFBqRUtQRDRPQTAzS0pX?=
 =?utf-8?B?aEUzR3QrckltcWRJWEZOb0RsT29wSW15RnNwaUdrdHA3dWc3aS9HZUFJYmxW?=
 =?utf-8?B?Ums1WDRlTGU3ZFdRcU44bmhpeVBtRnB6Yk5xdXhVS0dMbWpGeHl2SG9zRHE3?=
 =?utf-8?B?QlR6aXRrek5VRDc5amlya0lWMlh0NTE4QTI0engwemVvck9yeko5SkFPK2gy?=
 =?utf-8?B?OG1mMFZsSlBpN1JJNDZMRSt1aEJBNVpQcitmWmhKdDV2UzB4RmxFMFBmeTcv?=
 =?utf-8?B?NGZMNkpZNm5wbVFqMGg5WTFnLzR1bW1FMzJlMzNJM2RjRGc4SWVPRnA4MlRu?=
 =?utf-8?B?dWpSQVd2ZXNmV3YwZFNIdHpESkdRaVd1NkU1ZGVKa3JwbzFwYUdnU3p5bGRR?=
 =?utf-8?B?ZUVjaEh3V0Q3SWRFTWgxdW9CMkZrdVFpR280Sk9HTlVROFQvOFRIRktnSldz?=
 =?utf-8?B?Zmp3SFBoVmhaa2NUTzZ5czB3U0t6eFFlMEFtdUxBZGNtQjJXZCtEMmd6bGVw?=
 =?utf-8?B?b0hhT2MzRXpSQWRFWVlkY3VabTE3UFNkS1pPb2F4andzLzN4ZmMweG1hMGRy?=
 =?utf-8?B?MGJjcDlzbCt5OWJ5Y3RrT2tTYVh5Z1FlOG10eWp1YXhVdG9EMms0c24yQ1Nn?=
 =?utf-8?B?WjBPOThPNGREZFRCR1RaYk5uTGNIaVFpdnU3U2FQcWhJRHU3YTU4dE0rSUdE?=
 =?utf-8?B?ZExKdU9SQXpIVUkxMlY1S0NJanR4RlduMFhud25BSXprSE5vTXpTeFFHcUM1?=
 =?utf-8?B?aUwzVjZSY2RmWHI4WUU0QXhHMVVnU1AvS05ZZy9tQWUvKzhKM3pqcEJUWWxq?=
 =?utf-8?B?a0lLMG1hUGpGa1hMYTRVWDN5aDZJZjFlTVcrZ0NrMnZKT0FOdHBrUlByM2d3?=
 =?utf-8?B?ZGNoOVYyT0tQQzNHMHRVRU9rMlVWdmNEdDkwSGRFSUQxZTVDNWFlTEl5QWV6?=
 =?utf-8?B?bnBzYnNYZ3I3L0FUTCszOU5GWVkzMk5ZaVRjZEQ1TTB0aktQelA0MWJBejY0?=
 =?utf-8?B?c200enFocWNXZXA0dHAveXpoMjBMNG9tRzNLQWplUUVybDZLWkIwaTcrS0o1?=
 =?utf-8?B?Q202aGRFYlhZdUZSbnlwclZzZE1XRXVSc016WFkxdFlaK2lWVTJ1Wlkra1Fn?=
 =?utf-8?B?Ums4dkdDRU4rVkZQaERIMmkzZGRmVk4xSmhPWTFHOGJwdWFkU2IxbHVrVVVL?=
 =?utf-8?B?NXpxeDVSdGl4TVEzYWluY2FpSyttYmliUlBlZVRhZG9FNVRuck5ISmpOem9G?=
 =?utf-8?B?a0lSVzk4MURXcXdTQXg5Qk1xaHJuSHc1UzVaRnR1bzNlRDNoUENZYzlFd0s1?=
 =?utf-8?Q?XRvAasL7Eagh0vT77TCtXD/N2J0ph/jDihq3JTg?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9318.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UEVYVnUyZUMwWTV5ZWRmQ1ZmT0dMRkpEcnNxZmkzeDF6ZkhKd2VUN09XYkpJ?=
 =?utf-8?B?dmhySlljUy9tNi9pdWJ1aUJ5YmVtcG54S2FDWVpyTXZnOHF0ck5CbjVPQTY0?=
 =?utf-8?B?aU1UWUY3NG9sR3NYY21qMlRUajFwTno1NkJrUDZEM0czcWhyRmk2d1FwR1Jl?=
 =?utf-8?B?ajZVVnhkbHJ5eVI1NUhJZmZKWFhXWHJ4aThyUHVoUm85aFZWM2tUYU5IdEps?=
 =?utf-8?B?MVZ3MHVLNE4zbll5WUU2S1FMVURxTE9jc2pqbmlKSEtqZ3RWMDVaL2ZCWnc1?=
 =?utf-8?B?dG9wWXAvVkRXZWFBNEExbzR3eEpqdFhhb3E3WXllZmc2YjVSTnhwTmxidGpl?=
 =?utf-8?B?SEU4dCtDdE9IZ0JoUlBhM1JicFFBL2tXMmdRaHhDSUI5aU82Zlp1ZXFKR09P?=
 =?utf-8?B?Zm12cnlPRVAxMmZ0YlluTDFGam1YN04yQ0c5bFhDSWlmQjRiNG02ZHZKNlhh?=
 =?utf-8?B?NmZhWXI3R2p4RnhqYlNmRTYxSkxxSzNlTWU0U0tKMGx5N0k4T1QwWlovYndG?=
 =?utf-8?B?ak5mQ29wMk5WUEhjU1ZNeTNNeXhLZW5vbWowRDc0Wmh4K1h4aVNYMERmZmdE?=
 =?utf-8?B?ajd1NnMzd1VWcTJzMEx6QThBViswdzYzK1NUeVo5UkxQbFRvOVg0dFlpTHBw?=
 =?utf-8?B?cU53KzQ5eVBTU2ZyN3BLTmUrNnhPeG5tcnowRmkyMXFBZFhZQSt6VFZ1Mkcz?=
 =?utf-8?B?UmtoSDVhZHhKZFljbTNQTmROOVpGbVk1dzBWVWpyKzBmWXlwSWMwQXl5eGk1?=
 =?utf-8?B?bXhEcU12eVE2c0tWTEprVGp6WllBRGFFaGpxbFhHNkZkWFJTVGtXMXJ4dVFQ?=
 =?utf-8?B?aXp2U0MxS2xta25ybndoQTQyMGxqaDRkemJ0d2lqZHVZYVY5SGRXYmJhSGJp?=
 =?utf-8?B?b256VFBPQUt4MGlocXZIRXV5alNSdVIrb01SM0VrVlkzam5kUE9LcmJFbndo?=
 =?utf-8?B?Z1BMM3VOTXFoYWtOcjdqMkdGYXFiR2tEM3NmNkI3Rzc4cFVJaWRRcFBsRmRM?=
 =?utf-8?B?bmE1dUovUU9CWE9QWGFZNDhrTmU2ZE52aTlhQmpnam9jcnF5cXdzN1VvbU12?=
 =?utf-8?B?dFRveFVGUG13SVd6T09GUjkzYnZKcUprMTNtMnliZzRBVW1ISEs4SXJPWjJV?=
 =?utf-8?B?TlgxZXhlUWJ6T2x5QUNoTjNlOW1kVmNDN0tqSU5FNTFVWWVWa09KYWFjQm9G?=
 =?utf-8?B?aVUyN0JROGdsUnFRUzR1WFdoZUVJYUpTcnZDdkFhNWhlYVRkMUVlVHJ3QWZZ?=
 =?utf-8?B?cHltZVlKbHRFU0J6bERKNUF3Y1l1M3BJSTY1N1VpaTlNQkhvOGtzVkVHRE13?=
 =?utf-8?B?VWJRWXEvTUdYUmJqa0E1N0FydnpxN3h6cGRpYWFybnJsbnphWWJmSU1ObXR4?=
 =?utf-8?B?T3B1N0tpQjBoQmMvWWh5dU5VVEhGeURlYWZaSXJkekFNbkg5amtKYzAvMHFO?=
 =?utf-8?B?VEltUDNCdkttbGQ0TDI2cWxmWWloclZRUVNwbEtkWGJEOXhyWXpmNGFVejZv?=
 =?utf-8?B?cVZrS0g5L2RXVmhjeFlWMkN1T1hhUUY0cDF3aHFwZTFNdDhmZDRzNktHMngy?=
 =?utf-8?B?clhhaWducHRINXdXT3paeis1TXpVaDkrdlFUdDlOaXllbHVEU2F2YkZQbHVD?=
 =?utf-8?B?RWplUURiZ05FRmFNZ3NSMUpzMTZvWHcyeWlsVG5nV1E0Y0gxRnZlalhqY3FG?=
 =?utf-8?B?dWhxbEZ5Wlh3b0ZCMzYzdkQxYTVvUE9VN3pXYnBYeVIwT2doa1h3Y3BDeW1k?=
 =?utf-8?B?VHZYVzdKM0pGUW1aRERTRnkvSjVxTHM2UFFqT01mRC9ZTEdXMGI2R0E5RTNa?=
 =?utf-8?B?cEY2Qi9DbnBPbHFaZVFCaXNWUEgwcTFoOVgrcFZlNk1rVGVYZ1hGR0lnUDFV?=
 =?utf-8?B?T3d4Y25ScGFXMTE4aVZOb2s4UnVUbzZZdFZVQkVBcG5wY3U4cVlxbUlRdWY2?=
 =?utf-8?B?MXhwdS9McURJWDFFZ1VPcit2TjM1NEh6YkY1aFlpVFpqQzZvL3hBbURnR2wx?=
 =?utf-8?B?dDdyMjFNcDZMSUM1c29LRE1UOHJybkF5UVhaYnU0bVRqdnk1c0tRMVc0Q0Zm?=
 =?utf-8?B?VTFCZWVUVjQrZnVOZ21JdGx1UXY5d01SU1ZkNmdvbEFzVDFMdWhDMkxlcXFk?=
 =?utf-8?Q?DvrWORjXKy8JEK7DyK5OdlFSz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503a9b5f-73b8-4336-d10a-08dcc7732803
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9318.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 15:07:38.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syj4W1iiKCDEltr/w7kC9SuswuLYKHkriCasyaauCsRBBWun2GD3M0GPnyokm7o08l29VJsmLJ8yu3XfRjDOuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/26/24 15:46, Bills, Jason M wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
>
>
> On 8/26/2024 12:35 PM, Johannes Truschnigg wrote:
>> Dear list,
>>
>> in my ongoing hobbyist quest to port OpenBMC to the Gigabyte 
>> MC12-LE0, I face
>> some challenges that leave me scratching my head - hence me posting 
>> here.
>> Today's questions concern GPIO line names and x86-power-control aka
>> /usr/bin/power-control.
>>
>> I've been reverse-engineering my board's GPIO pins for a while now, 
>> and once I
>> figure out what a particular pin is (probably) actually good and used 
>> for, I
>> most of the time have a hard time identifying the proper name/label 
>> for that
>> particular pin.
>>
>> I don't have a background in electronics, much less PCB design, but I 
>> guess
>> most line names in OpenBMC's DTS files are lifted verbatim from board
>> schematics, which I do not have for my board. That, as well as the 
>> sprawl of
>> pin labels and names used between existing platforms and boards, 
>> makes it very
>> hard for me to infer the meaning of most pins defined for supported 
>> OpenBMC
>> machines.
>
> The original thought in x86-power-control was for the GPIO names to
> remain static and be routed to the correct pin in the DTS. This didn't
> turn out to be the direction, so the config file was created later to
> allow specifying GPIO names.My research led me to a design document 
> from 2020 with the promising title
> "Device Tree GPIO Naming in OpenBMC"[0], but since I can't seem to 
> find the
> proposed names in any of OpenBMC meta layers, I guess it always 
> remained a
> proposal, without proper uptake in the real world? This hunch of mine is
> somewhat exacerbated by the fact that the x86-power-control package 
> assumes
> very different pin names in its default example config file[1] 
> (although a
> GitHub issue[2] exists that makes it somewhat plausible that might not 
> be 100%
> deliberate)...
>
> The GPIO names in x86-power-control pre-date the proposal and would just
> need some transition with backward-compatibility to move to the proposed
> names, if the community would like to go that direction.
>
> If I understand that GitHub issue, it's just that the README doesn't
> list all the GPIOs that must be defined (which doesn't really apply
> anymore since the config file allows any GPIO name). But it may be good
> to update the README overall.

>
>>
>> What I'd like to have is a solid guideline on how to interpret 
>> existing boards'
>> DTS pin names (unfortunately, I don't know what either of 
>> SIO_POWER_GOOD or
>> PS_PWROK exactly describe, or what the difference between the 
>> concepts the two
>> strings of characters map to in the physical world might be), 
>> assuming little
>> prior knowledge of these dark arts. Is there material on the web that 
>> isn't
>> buried under mountains of mainboard-designer-specific NDAs that could 
>> help me
>> with making sense of all the jargon I don't know? I'd be very 
>> thankful if
>> someone could point me a way!
>
> I won't be able to help with general guidelines for existing boards'
> DTSes, but I can definitely help with what x86-power-control uses.
>
> SIO_POWER_GOOD is named for the POWER_GOOD pin on the Aspeed BMC SIO
> signal block (probably a poor name in hindsight). On every system I have
> worked on, the CPU Power Good signal has been connected to that BMC pin.
> In x86-power-control, this signals that the system is fully powered and
> running.
>
> PS_PWROK is the Power Good or Power OK signal from the power supplies.
> In x86-power-control, this signals that the power supplies are enabled
> and supplying power to the system.
There was some effort to standardize the boot sequence by providing an 
example in open compute project DC-SCM specification.
Please refer to Section 3.5.15 Power States and Boot Sequence in 
https://www.opencompute.org/documents/ocp-dc-scm-2-0-ver-1-0-pdf
which may help decode plethora of pin names.
>
>>
>> Thanks very much for reading this far! :)
>>
>> [0]: 
>> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>> [1]: 
>> https://github.com/openbmc/x86-power-control/blob/master/config/power-config-host0.json
>> [2]: https://github.com/openbmc/x86-power-control/issues/4
>>
