Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945299D066
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 17:03:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS0qD678Cz3cY0
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2024 02:03:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::725" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728918213;
	cv=pass; b=GNVv1A/FmsuLYCeT5z7b6AH0DruQWVgUGghGAS+0EEUMrUsjE89VLrefcIFQOI3aKQoM/rFEw2YPBhBQy3xzasCoUehhNUdn1TrZXvh/nfomBaPJIxWvTuw4oWOU6ler1KrrT3QyO8Yn53TtKLUN0CxfXeZlSCfUIJ3X4H7/idHGCNz/kUo78hbybeDrxbnP+RZLrHAIsrLWco+H3T2Z/VkcZhesxPBKXey8jYt7+m6ZYqzDgErDoA+8iWD0GcisqCswhNYYpB8Hab52FQzMBu6CUANKb8RYFzJSuRRZjWRtQqcI3hzhWA87SewZnRK/kM4EdD/+GQIJtnZ9Hc6cWg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728918213; c=relaxed/relaxed;
	bh=2nclub39f5O7yaHC0mr1HmtTiVrl0MhpRp/q1v8VnzM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OCgirFvfpcH7OHMzNu5lxhVum/tNDYSAI4nh4iM0NL1ziu7tBs3FwzCV5W7HDNIJBqxMNYP4u++QLMzlEbu9xil7zACeQZNi3GN89sKc5nOCycwVGuZFjtxdrEDMbft+/XDoznPISVDiSCuT0W8eGhFQdOrAhSX8VsCEsKwVmu2LVoqPK4LjVpVADOKauD4ksoOQvtHUW9OSngOs8TnERdfNOxGU1ljggAil5ZiGF8SE6QqQ2lb+jMh9s9ZewG0JhAUE3xmn+2Qv3oENnZUh2fHhzKWfnHN3PTbx35fZWH2c5C5rg0nj6fE+l+8k0ZhLwbfdSvpwkXMVZ09gsBlJWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=c+JnI8eS reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::725; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=c+JnI8eS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2418::725; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20725.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS0q82fMPz3bbW;
	Tue, 15 Oct 2024 02:03:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAPt2X6syWuUD6zeJnP6dDi9UyzKxiqAZOskLgzrBBQVr0l8LaYfWddYwNjx5tumLT5gDtscLgNikMFDEQKiPkZxaMNdfPlMX1Bg4ABdYSExrvghWuP+XheHxle2WktmLYnnUiV0I4Lq9lk0xSfhvDaZZGQtLC19wnguU1n7/s52Aruj0Tf9UuLdU4nV3uTJOpGeuhe/hYIgnd7/2ubhq64IL625K0CRXxHn17vQwM3om//vVf7xA026Bdge8c0xNBLRAy1QAbeJ0glCHH4YrRYn1yIPjtir385FY9ji3MJ5T9zrhXU8GZcadzZ7FVPZK54oAzLMClLxtVgGetbeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nclub39f5O7yaHC0mr1HmtTiVrl0MhpRp/q1v8VnzM=;
 b=dvQfXJZnGiWQYsfNvIMDt7y7k/Ctj2d6nzgq3VixOaDD5Zjq7gF2SDWPxh2y3jh3POpzyFW9iDgU5OnOg5Wi+OPaknUIgStvWgqkmIv09NyvsmYbqw0dbH4EBAxTxL5sxEQRdHTq/yLC2651t5QEaMvVHsxHDv66q7AdPWUV80syLjKaWWKc00thhq3fngMyExMLD3q3SvGmz4DZ9mZkbXOh35eDhyAmy3RmRhgRZ3qHfXJx1orENd4f4W+Xhi0reMXgAXBOmqyLmeBxRi77RKm1weW/jI8Bm3tpZ9QF/hp9KcEmwgkpx0Ho7qz4jvU0xrCvQXCwffWn9hbzZjlu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nclub39f5O7yaHC0mr1HmtTiVrl0MhpRp/q1v8VnzM=;
 b=c+JnI8eS/SZcKGnsniModWjN4BaYwQJ8Ak2v6CjT2s/d8W/WARFHVRXSshLDWshSnNdg0EhmShxbHiv5RJbimKkJl/sGVL1ClYD4L2bB6I60M2y4ZveUie1aFOVByiAwFYpILczdTswjIzunx7ZbJHErKtXgB00w5xD6j7giQxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH7PR01MB8448.prod.exchangelabs.com (2603:10b6:510:2f3::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Mon, 14 Oct 2024 15:02:56 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 14 Oct 2024
 15:02:56 +0000
Message-ID: <01c3d596-197a-46c6-b56c-05ef602b9c96@amperemail.onmicrosoft.com>
Date: Mon, 14 Oct 2024 22:02:44 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
 <975ab37a-7429-4c52-b1e7-6ec9ba63048a@kernel.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <975ab37a-7429-4c52-b1e7-6ec9ba63048a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:930:d0::13) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH7PR01MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8e3df6-448f-49ac-55d0-08dcec614920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Tmh5SHMyR25odXF3bUJSU3BqTlpKYmRXTkE4S1BqWXcwSWdqNHcxcWdJVFQy?=
 =?utf-8?B?S2JKbjB2M25janRsaTd6Njdwd1dLODhJOFY2VnFxeFpGM1IyOXEzTVBGNFRo?=
 =?utf-8?B?dVR0d3hFdnhnT1FVZThCMU8yLzltb3VRbWhFclhnVVpOQ3Y3MElxZ0pzT3Vi?=
 =?utf-8?B?OStHK0JuL0hNamlTekNkNVJuaG5IMmVhTFRKdGVYaWhPcEsrZWxsSCt2QjJ5?=
 =?utf-8?B?Y2VzcjFEclh4RnFxV0Y1ZnNPcTh6bCtxblVlNVBDMkpMNUs2clhIcW9lUGhF?=
 =?utf-8?B?SWxJcUJ4WlZjQ1NEOXNMMzZQc2djd0RjNkhGWHhPMGwxeXlDT1NGY3lYclpu?=
 =?utf-8?B?dm5XajdBVC83VGYwa3dlZnBlRTh5ZHhpOFNnQTkrOTB1YTRpYmQ2cDh0dExE?=
 =?utf-8?B?dU02b2xlNWwwVUFWN3lWWkFUUkdEdHdYa1VkeGU4YnNCYWVwV0puY01ZZ0FZ?=
 =?utf-8?B?Sm1kdU1JNnZmTnVYZUlUcmhwSURMQklQdVBnbzJUQTA1Q2NKeTlGeTZmRFdz?=
 =?utf-8?B?MDRGTDY1TFJnaUZTK3lPek5DcVpJMFp3cks0Y0N3TGN6YUFUV2Y2dkxVYjcv?=
 =?utf-8?B?NmNrREJwcCtTd0JUY2NRUjI5bCtPYWhSNThvbDVaLzF3M2xkQjluNlZiWi9M?=
 =?utf-8?B?VzFsYmtxYklaOEdMQXZHOVdIYkUzQmtNOW5mdGZ0c2g3LzF1QUxUc2M1ZU9y?=
 =?utf-8?B?RHlFMVZSVUd2N3U0UURXNTBaMkI2WGtUYTRRaXM5d250bGszQjR3N3NJemN2?=
 =?utf-8?B?N3l1MTQydWFnTE05aUVIZllCaVUwdmtmUTloOWk3SUdYU0QxMDBUSHVmQWxu?=
 =?utf-8?B?THFqbEZ4bDV0OEo5VWVhSldOOGc1d1BsY29wSitURVMrYzhQMDZ5K2RuejUz?=
 =?utf-8?B?QTMvaUw3cVplSEdsK2xYa292c3dnL1BaeTVjeWlqdGVHT2NwSWlXWFk3UDM3?=
 =?utf-8?B?dmw5UUxDaTZGa0lKT2pFcWVTamlvSzQ2UTdyTURMNU83OU9pYWxCUExJRjdq?=
 =?utf-8?B?WmU0RVFQMHlmUkRwVEVqcEdRd21HRXc0VENiZThDaHE1K2hKYXQ5cE5HQkt0?=
 =?utf-8?B?YXhueDVHVGpiK1ZwRVJqMkFQdVFHay8rMkVNaE9ZNk9BYXpsbkROcUx5VHE3?=
 =?utf-8?B?M0doOHl2UlVTOTdiNnBaZVdYNkZHVzRqNzdJTnVRWEtoV1E1a1QwU2w0L0pr?=
 =?utf-8?B?anNuWDRnTVVRVFJkblFKVGdGbUY3cmtveDNlS3Q5V0NWNXdOb0tja3ZKaEpv?=
 =?utf-8?B?WW1wc2RENmpoL1dHc1R6MVIwK3dpU2FGMG1TOFVpdVVHVU5ibUU5d2RiLzAw?=
 =?utf-8?B?SVhKQXkwU0VJenROY1pjYkd3amIxOGk2S2UzRFd2Y2lNYW9TNytTblh3TG5h?=
 =?utf-8?B?MFFBRnJnT01CbnRqMGFiL3REWTdvQ3VLUXV3ejZ3Qks4d2M4MjdlQjkwNjUv?=
 =?utf-8?B?ekZiZkUyZWc4d2V2dGFEZWZmenA5d1Vpek9HVllnVUtzaUpTR1E0bUpLSHpL?=
 =?utf-8?B?WHBqZTl1YTFFZTAyZm1INjJBR1dVMDhVNGZYT2d2aWk0MXNvRVY2VUI3R0xD?=
 =?utf-8?B?dlNORnk2MjY2MVVIdldtT2UyTWYwaTlHZk0xVnRoSkJCT3lGalU5RlNzRmU3?=
 =?utf-8?B?blk5UXVVdm9MbWRrc1dGRVZPdXBIdkN1WjBRVGJQY3ZWUENHOVBzWWlLMzFX?=
 =?utf-8?B?YU5ZUEE0Q05PKzhjbFNWbVFLTkVKa1M3d3cvdDRURHdHQ0hXL2dkZWxEZnNj?=
 =?utf-8?Q?Z+hBO23Oh9oOrYQO/TYNlVVIOvT/XixTCUwayTE?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MWJRUm5WbTg0WWg3MXdYdldwMTJXbW9yTnB0eGtGLytaUXlsTnUzZGE0SDdS?=
 =?utf-8?B?bStCbVpEYWwrYnBxd0NTMDR5YnVQZ2dOS3dEc2dSVEx4WWdUQ25ZRkJjdHdR?=
 =?utf-8?B?Q1JNandxTTdmdUR0RjQ5Z0lKRzJoa1h6SFZsRm5kV0NZREczVHVTWmtBendr?=
 =?utf-8?B?V1dhYy9rQ0VvMEd4dTRsZ1JBdjBSNnFpSURWUnZWaHNqdzIwSkp5UmZkWjdU?=
 =?utf-8?B?elY1akU1NlhzVVdXdk4zaENEc1VpNVpYdkY5ZVBrQmIrdHFaL0pXdFpYTFNs?=
 =?utf-8?B?QytOOThxOUp1cktkV0p1MkR6ay9ONEZYMGkwRVAvNXl2K0F6SkJYSXU5NU41?=
 =?utf-8?B?MU1uT2dqSEwyMUcwV3JLNGtRaDJaQ3Y1U0hSNlNob3kyaVFxckFWN0tlZkJV?=
 =?utf-8?B?K3ZyRU81NnBJVGkwbTBsRTlSWjU4aTQraDFaSlVoeEJtdVlWU0F3R2JjMUZz?=
 =?utf-8?B?NVR0ZWJaK1dWY3NsamhacFpudkxjN3JXVVRrNGNNM21KZnlDMkJiSVpkWEVM?=
 =?utf-8?B?TVBGRStYNjFkZWlMeFJVdjdUVzRjVkpib3pmVWVja1N3YkFrajBSTXZLV1FH?=
 =?utf-8?B?cDE2MzBsRzlDMzNDb2ZKNzNwUDd4WXU3Tzgyc01BQi8xZWxOK1prak1Nb2Q4?=
 =?utf-8?B?V3V4ZDVtRmYzbFUwL2FMRDRwUjRpWVkzaFBPSVpnY1VDdlcvQitlZkpBYWpz?=
 =?utf-8?B?WWswK256VnIvY1pOQ0t5MVVkWmJrVkkyMFlsZm4rUy9UdEJ1aTlkODBQcVJa?=
 =?utf-8?B?a2ZlZlIrM1lpU2h5dWx5MHlyam13MmtLSFBKL3hwZ1BXVEdVSTRHanFiOS91?=
 =?utf-8?B?NkMwZHQxQW11dG81bWE4VDN4N0U5bkpWdXZlb0JFa0FTcXBDd3N1dlFZREw1?=
 =?utf-8?B?MHlVTU02eUd1N0c5VkpZUjlldDB0MkI3OFQ1T3pCK08xdGdPUUFjL3VoSm1x?=
 =?utf-8?B?TzVCR2RxQWxZeU1KZ2dOTmhIdFd6ZytLaWZJV1JmTi85dis0NWtKM2d5dkFN?=
 =?utf-8?B?bTczQkRBckhuK2tYVjNCTnRQMGNyWDg0YlU2TFZWK3dLU3NENWRTamtzeHkz?=
 =?utf-8?B?bjRJWGxQMUZvL2VKblFOVktJcmdrakNrdHJPT3V4bDJtTmVYRy9lbnR3bFht?=
 =?utf-8?B?NkhOdWRQc0FBVjZETmRVU1FROWFHaUR3S3Z6Mnc3UkljTmZSd3EyaEs3SFJt?=
 =?utf-8?B?SmxGTkxNaE5KWnkzUEdWSUlaaGd5YXloY3lucTFFTWg4bHBEZy9NZk0rTGdp?=
 =?utf-8?B?cFVaMklpWWdqYVZmbjlpSmpoQWQxRmNrV1lwNmFzemFUdXhoT1FMMElrVFlk?=
 =?utf-8?B?cTBUeE5ST2dRcDJyN09aYVBkVkhuOWgrSFFvcXBxN2JkR2lTeDBsblFIOHA2?=
 =?utf-8?B?SFIrUklQTVpHaFhFdFVJZFZhNnowZU9iVWQ1QnhyOU1MWHBhNURKdkFhazZk?=
 =?utf-8?B?LzhGRVFwa0IyalNBU256a0FPeFJoR3NlamRXUlRReEYwQXNlZmNkbmZPanJ4?=
 =?utf-8?B?SzdUYWdNaCtleWRNRlUvclhlNHhnRjZTckh4MERDNE1sMTYxY2V1eUdHQ0I2?=
 =?utf-8?B?VmZyb09jOG94a041MktKd1ZoT0Y4K0VBOUg0S3lXWXNEMlRkb3FuWXk0Vjd2?=
 =?utf-8?B?anBUUjJKbWorNm1rRGdHcktQUWh5d0JyRlZVSjVES1d5dEdYeHY1a2h4Z2kv?=
 =?utf-8?B?OTM4bU5aQ203SDEzQnlXMzZ3RVNMWGJkbU1ST3loYWk5SmdyWVIvZ0U5MzRo?=
 =?utf-8?B?eTFxZkJuU2w2ZlptTmdJMzY2TEtLcVVDMVdlZjkyQ0luM3RoVE00R0VEWnpX?=
 =?utf-8?B?aDVuRHFmN2pXQVpYSjZodnp5c0JyM0F5ekFNVG1QNHZpZUdVeG9RUkt0WnRo?=
 =?utf-8?B?d09sU0pJSzNCWmVnNGk1OG5wRDBLQ1d0VU0zUGhmN1pjNEdBWGFSYjVNamJa?=
 =?utf-8?B?NEpDSkkxS2gxQmpKQ0NlaVJRSmdBTXcxUkUvOUZ5Z1B3Sm9lWnZuVlZTQndq?=
 =?utf-8?B?Zjl1TmxsWWVKQ1RnL20zZU5jT2FSTlJUQXJ3MzlRenJzNm1xQkJEVkdoZUhm?=
 =?utf-8?B?SzRpZXRFR0VFWFIybTNkVDNjQkd4WHJLRDl5M0Z0ZDV3anR0T1FRN1hYN2ZH?=
 =?utf-8?B?d0tCWjY0SUNBYzZKTVR2NVJVYno2dGVNN0paOXppb0ZVSkNBeDlRTzNjNm9N?=
 =?utf-8?Q?9qJm2x3V8fgN/0R61DxHpwc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8e3df6-448f-49ac-55d0-08dcec614920
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 15:02:56.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zez/jUZn+gPZRLCadUDodMo6aTIe0qukhzl3czeYVlZoCoS1aWoE3d3GeYe5hXoTEbsKxIhJ5nOU0PyWQADAlzCBmMLYApUCgFp7OySXxil8uaVbNGrKXTMksjMelM1Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8448
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 14/10/2024 18:58, Krzysztof Kozlowski wrote:
> On 14/10/2024 12:50, Chanh Nguyen wrote:
>> The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
>> hardware reference platform with AmpereOne(TM)M processor.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>   .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 646 ++++++++++++++++++
>>   2 files changed, 647 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index c4f064e4b073..b1fb0853a789 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-amd-daytonax.dtb \
>>   	aspeed-bmc-amd-ethanolx.dtb \
>>   	aspeed-bmc-ampere-mtjade.dtb \
>> +	aspeed-bmc-ampere-mtjefferson.dtb \
>>   	aspeed-bmc-ampere-mtmitchell.dtb \
>>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>>   	aspeed-bmc-asrock-e3c246d4i.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
>> new file mode 100644
>> index 000000000000..f24111ab9e65
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
>> @@ -0,0 +1,646 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright 2024 Ampere Computing LLC.
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/i2c/i2c.h>
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +	model = "Ampere Mt. Jefferson BMC";
>> +	compatible = "ampere,mtjefferson-bmc", "aspeed,ast2600";
> 
> Missing binding.
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
> 

Thank Krzysztof for your review!

I will add my board to dt-bindings in patch v2.

Follow some previous patches on 
Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml

https://lore.kernel.org/all/20240805-potin-catalina-dts-v7-1-286bfd2ab93b@gmail.com/
https://lore.kernel.org/all/20240522192524.3286237-13-eajames@linux.ibm.com/
https://lore.kernel.org/all/20240502002836.17862-7-zev@bewilderbeest.net/

Best regards,
Chanh

> Best regards,
> Krzysztof
> 

