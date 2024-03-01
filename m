Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3286EAC1
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 21:55:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=G8tOXy2T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmgMw1ppXz3cFX
	for <lists+openbmc@lfdr.de>; Sat,  2 Mar 2024 07:55:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=G8tOXy2T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmgMK6q3Bz30gn;
	Sat,  2 Mar 2024 07:54:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBsyEKOW7Keyiu88hHlxynvZw49bv44r+Iy/xGaJmoJ7KGjHF36e2iiSPmPA96gNx52Ae/af0kvj9qBXUVoS9UGZz62Iq5ZVABH0kXFq7UggBV/nt2HcW1PnowV1XcMnKlCTIgSJuGfjqPNthH1Q95dR/W+jCxksdJ+/FfzjRchbu9bNH12oNQzzOE8iR4OVJ/17evtVYk4f/4Gku0Spu9ZaYNvSw6VthurGSzYr+5k7ZsS9bTFxiWMKRL0bqvwcAazeG4yM6NmfznQzLv6HEMjxwvXto5DVG6xdUhAwtWg272DK9sFlFahBqKYBezONqASw/cH5EistaO6yN8ltgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaNUUCR6lQpLknE7OXZ07kF6dac/+kDdEcRPGKfrTOk=;
 b=NSsLfo86b1p3olcQBQ5aBWkcOy8bfTTDAFvjRynyvJZBUDIwN/x/KnBfu0edk9nmZdRMFMTnTvQRi6060bT0mHC9dbr8B0Z2YU9t1UJYJ4xYrWIMfqyD0gvCf1g6ivQzSoHVba9zKMZEsxjQpsBql1LotkbwqoXkaH6wnakpYNKv7NtZGtgWuY/6z7oeGIEwQp+64gR8z+wguo6Y7I5peUIjwKx8qA/P/vTvDevipLS5mDub3xUOexT9BPv+z2wl14TYZGBbAsGS6tziOcdvs1WtLyty18u/CwQ9lJU+B9WQgrvjVPuKdtx5ccIRPkcg94jXI4dMqRYg+mLOnDordw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaNUUCR6lQpLknE7OXZ07kF6dac/+kDdEcRPGKfrTOk=;
 b=G8tOXy2TuphSWvD30FUOFz0r5UoC5HEeqd96L/zrOaeejLvK2xrM/mjLfvNWxcDa5sVreCmuqMcQBtpqoQfmuUww7EcoyN7NBuLBxjpvgjjwCUY9xWg68U6R/j+hB0Jdf6Q6i/zvMZAeXMRxaQOQmmN77MRwdCrPBIvpz1SKDXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Fri, 1 Mar
 2024 20:54:28 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::80ac:576:f125:1d72]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::80ac:576:f125:1d72%5]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 20:54:28 +0000
Message-ID: <21ee5e7e-bddc-48ae-82f8-c8fb611d0a12@amd.com>
Date: Fri, 1 Mar 2024 14:54:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
 <572d53516dee6db5af7089090056185abb4e78c7.camel@codeconstruct.com.au>
 <74cd8a61-3d9f-437e-8e3a-22139e23bda5@molgen.mpg.de>
Content-Language: en-US
From: Supreeth Venkatesh <supvenka@amd.com>
In-Reply-To: <74cd8a61-3d9f-437e-8e3a-22139e23bda5@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::22) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 6885683a-a454-4eec-1c8c-08dc3a31c95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xSjtwy7oj02cr1iu6UwjcPZqrFVBj2EMW5gIKz3srm9C3xVXks6FoR045zfQ8R6agVw8w2djcW6LIAfE9z+CXZ8GMgdzEr/v/bdy4nYfS7T96qlbqRTDoIGGN/cE3wVHn8yDLJaJM6YWfHwKv5VQ/Al5KbpBF+lsuMt92j2W7BlGCwOwTnTAUho1Vugc3ImwKupdeIGQQPPdrg2DzPsi8fqOReNp9wxRTQoyEhmcPy1EPZDrz9IyLOQdNDEZ8rc4Utp+F3aO3olX9vYtTMVHSrvqOoHu90g0v1IpZJTEs27tQM6ribvz9RX0RUrWvWIHtYhKOIo4Ah6O/8F6QBn7mxvJ4ERBUYdg4d+ynR+FWI67dGxIGLVsfAiUlXHq0HaZL/39+b7L1WCYd19LFN0lmgha6jrU3YWu6QR+aD/WHlG6b+dXdF11O5y08G8Hczw9JkJ/QcFXw6ARzJ22+eoYPmYo1765JlKzTB/sB0KllWGhIl1sTSiR2Grjl8Ziz8Y1PhVa8nK1wj0x17ZVKKUqdoVOAikuTsHMvfcnfkjqYCkRsM7d4hkUxUokPz6jF0oPqpYE3/4EErfUECxPVZssZcaE1GZORNAiphsmJIuVhYMhcfUxEWAQutchxKefAnrEUZMG40jWc/JzYDz2/NH9kg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?N1JScCtDRFczZXJ6NHF6MXhFN0l1SERsQjRCSGp2NFdnS0lnRDBrQUhId2xu?=
 =?utf-8?B?czI5UmtTS3dKT3l1aWVZQUJHK3dVb0E4RUdHWUlnUnM3RUJSOHREOGNVY0Zs?=
 =?utf-8?B?KzZNVmJhOUQ3dUltSlUxNVhDSkN6RUU5dWRCc3B0dTkrMktMVnFtcEJmdTZD?=
 =?utf-8?B?TzJhZk1Sd3pHRkhPUVoxUDUrZ2dGaEM4SFFVYnJxYVY3ek94WW1RdFFFTzcv?=
 =?utf-8?B?NFg3YmFVM1NkUm4xTnFNYk51K3dodUJXTWhEZnVmd2tDZldVeCtRWS9Ma2xh?=
 =?utf-8?B?V2crdzFQOEk1M1R2cmtzcldLVWVmYS9lYmdTakdXUmFkMU0zNDlWNXdGeDZZ?=
 =?utf-8?B?QmpMTktaenVaNFRvc0lhZlFiYXo1SmtqaG04VmY1TUlFNEZGQS9PU1lwV2Mz?=
 =?utf-8?B?VmhaMFNFRDdvRDlyeU8wOXBpUDAzcEFITzk3YWtHcmdITUROaE0yaW5XNDFv?=
 =?utf-8?B?L2k2UTVYSHZ3WVFWQXlOYSt3SHZaNnRVcFR2czdxRTdhYjJYRUJSVXp0L3Qw?=
 =?utf-8?B?TVBtakFoYyszYU5OcEJIUWlRbXRKeldjcDB5U2F3U0tiS1N5VnZCbTJlY0Qr?=
 =?utf-8?B?N0xoREowNG9EWUhITlZmeW14Y3lDdzdHZmJHYjk5eVgrOVFSanBCa0g2YnVB?=
 =?utf-8?B?YWZKMDQ4d0J4Y2RoQ1B1S2wweGpyRkl3MjJ5eU53cm16UlRVVTZoY1NyQ1BN?=
 =?utf-8?B?T21xNThEeTJ4VU16WEgwWGtGZ3RRaHlVd2dndHlmbzlsN1VFR3dYWEtRVGxY?=
 =?utf-8?B?R2wxVE51UzYrWVUxKzMraGkweThlT0hqc09mTEJpK2VtRzBwVTlMaE9ueEd0?=
 =?utf-8?B?VlhiSWp6a01kYXNRMGlUTGJaY2djT012dW5TZVRtc2N3a01aMHZUTnYweXdk?=
 =?utf-8?B?anR6NzZoa3lZZUl5ZTU2N2hicllXU3c3cmcycGo4M05BZXp0aUw2blBTVFVU?=
 =?utf-8?B?bGVDdHhGOVZwWjc5RGFSNUtaa1FTUzZFd3NLenU5L3JKdTNmYm56YVJZd3Zl?=
 =?utf-8?B?OVpmOWQySGdISGFSMW1ieXFNNkNZcWtXT0V1SEd0QzNicWl1V0hUZVd6V0Rk?=
 =?utf-8?B?QllZc3JFRmN5cFBRNEZnUGlxcFBKczBOWEdhcDVFN1BySGZwcndqc1VqUHNl?=
 =?utf-8?B?b1VFUUFqN2RBL3R1VVpBYTJ4Zi9LMTNYNCtmMXVWVEE0eDZPV3NLNVpESUIw?=
 =?utf-8?B?RkJLdTNYM29ma3l5MkhWKzBzUzJQWTZhSkh1N1VDbzJHSkZsRlpTYWYwVFFx?=
 =?utf-8?B?V3pTOEw1SHhXc1VNcjFIZGJTNUp2QWZTb0ExZm94WjhFVGpmNGd3YTdpU2hL?=
 =?utf-8?B?VWNjNnVjSnQzQ2RCUTgyazhicmxvcHJHRmdYdUxSRkRIN2Q2Z1QwZ1B3WWFI?=
 =?utf-8?B?QzhUdEw0TXNwZmNrV0Jodnl3Y05VZFE1eUNjMTlFczlTbmMxOTFtOFcveVVJ?=
 =?utf-8?B?b1cyRnJJSyt2VVlJTWExc2VaZ0w2VGNUNkxVNXRSb0JYZmIrQVk4eXVzdWk2?=
 =?utf-8?B?bFNudXE0TGxoa2g1aEVJNWdpYzNmQjJQSUJIb2N1WDZucG9oUnNLNGVMbThx?=
 =?utf-8?B?cEZIQVIrMEFiejFOOUdIeUkwUWM4dnh2c00xam8yMC9NQ3VjbkNBMnEvZkNh?=
 =?utf-8?B?c3p3K0h6NlNXRG1FcHVDbDVLTVY3MXptenB3OHh6WmhyTjJFN2JISCtHNC9M?=
 =?utf-8?B?QVovcTVURTBvdFU4SDdIc2ZIT1JrdzZ6RlpYMVVkdnpCQnZhejhMbmJsVXhl?=
 =?utf-8?B?b3U0UERuUndDdmNpcllleFVyRnVkNU9jVG1obGtmQ0J6VC9zKzExWGo0MzFV?=
 =?utf-8?B?RFNldDd3YnY0anpNTDlEeDFieXhsRDdJR0VyMkx5a1AyNG5oellQY0k0bU44?=
 =?utf-8?B?c2k5UUdaTDRvc2VMUGJqOGpLNjEweHR2aVBXRlhjTitZYjBiVW9najVzYjRt?=
 =?utf-8?B?UEs5RlFURDRrd1VLZXgwcnZ1Q1EyNDNlWmtTMGVjcHM2YzRHa2YveXVVcE5E?=
 =?utf-8?B?dkdUWnhXdzFZbk4rNWpYUmZKL2J4YjlKRXBXTDJ5UGlDL25KdkpwenYyWjRy?=
 =?utf-8?B?V3VzMVNxYU41Q3RsQUUxVWFGS1JRSGVZTXgybzNlSUQybWhhak1aNmQ2QTMx?=
 =?utf-8?Q?unHQDJdId0Towl8bHtPggwmu+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6885683a-a454-4eec-1c8c-08dc3a31c95d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 20:54:28.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Oo/ZKBih0jKHYztNUWuC9YEod9vR/G0vNypXldL6H/JBlNAJHBLawCAl7JnkP8RyFlZBqwjxa5WLIIB2lmfpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2/26/24 01:10, Paul Menzel wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
>
>
> Dear Supreeth,
>
>
> Thank you for your patch. Should you resent three more nits.
>
> Am 26.02.24 um 07:55 schrieb Andrew Jeffery:
>> On Tue, 2024-01-09 at 21:35 -0600, Supreeth Venkatesh wrote:
>>> This patch adds initial device tree and makefile updates for
>>> AMD Onyx platform.
>>>
>>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>>> ast2600 BMC manufactured by AMD.
>>> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
>>> present on AMD Onyx platform.
>
> I’d capitalize I2Cs, UARTs, and MAC, but would write fans.
Thank you. will incorporate in v2.
>
> Also, could you please make the summary a statement by adding a verb in
> imperative mood. Maybe:
>
> Add initial device tree for AMD Onyx Platform
Thank you. will incorporate in v2.
>
> I’d also add spaces after the colons in the commit message summary.
>
> […]
>
>
> Kind regards,
>
> Paul
