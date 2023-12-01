Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23960800A0E
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 12:48:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iJI/UJEk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShWYD4lNdz3cVM
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 22:48:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iJI/UJEk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShWXd1n5Xz3bPM
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 22:48:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeaqnCuawHplK7r4lJ67O147qJ7qkh00mxWY/ft2B8Yg6Dlx5uo9j8bA9Zjjb3sIDa5urZL+WaVF3xDAlKZ+6MivaFj3ubVLBb6eQ3TT+JPH71nuP0hDH+6Ogl10jvgJAUuMNK3ZnrssRZHw7wLT1N2ECVEz6sVpq06U4JzBhg+BThS+8n/EHLLmLe3cYipKUhxP2H2WXuYIkKMcUtAFaEfHAaEvkUHL/ovgABllVno93Fany7yO9dQTK08La9u2zZzSigpcuumc9smzS9/lsCUC7/T8id+7QOcoUqK0fiTseSaYYhx5hQjvFFhceooj/9T9x+uKx6C9Dvfy1QNMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFr1jpKsgFiQb1zKGpJYGDRzzvvwmikdActxjMcxcWY=;
 b=b+1SyEyVISKkwgvE3AkA71QXQ7AICiVB/3d6klvWDht92oJKoTQm4yTsgw3QLSWYWGOc31rONhqdb5gApoZSKn7zVjKBZRucYSvq83pXkil+0Acp42GmtGWVpmxZxzvQ4vj+BMrclbKJ8G/Bo/IUzUUYj7UjilKeRbfryWl8Cb7wQCrkoa6ElK9HukLianQ8Cdjorbq8DEccGoOBqTEewoVf6Wje5gYK/65jCDun4uJ3GKmgu3PnuDtR3JiJEdUmqQ6Ks6NB8qxbmx6902nGf0qtcpHFt1m07LQ5/3oAYUIF70IY6Eidv4zQQ4zHV0tcH5uqyiedZmRBE1g5Twvquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFr1jpKsgFiQb1zKGpJYGDRzzvvwmikdActxjMcxcWY=;
 b=iJI/UJEkndR4EeSmd3h1mC5L4NzpDA5kd67sLxeRQEUpX0bppyaDrI+OzjpgtQHyFY7maMnuhUEhhC1uKse1T9g2NP4zFHy58ZiegtgEVWGJffogwuJ/XcO5jpZmnROB390PQyd2c2VAXhdbzxssQZBjwEoC28ENpBUSkDzI498=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DS0PR01MB7963.prod.exchangelabs.com (2603:10b6:8:14d::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Fri, 1 Dec 2023 11:47:41 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 11:47:40 +0000
Message-ID: <a1cd2239-d8b7-412e-bca6-ebcf3a19ed65@os.amperecomputing.com>
Date: Fri, 1 Dec 2023 18:47:30 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mctp i2c: Requeue the packet when arbitration is lost
Content-Language: en-CA
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20231130075247.3078931-1-quan@os.amperecomputing.com>
 <473048522551f1cae5273eb4cd31b732d6e33e53.camel@codeconstruct.com.au>
 <706506b7-a89c-4dfc-b233-be7822eb056e@os.amperecomputing.com>
 <852eaa7b5040124049e51ceba2d13a5799cb6748.camel@codeconstruct.com.au>
 <3e8b18e6-673c-4ee6-a56b-08641c605efc@os.amperecomputing.com>
 <10491ca5819563f98e2f4414836fd4da0c84c753.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <10491ca5819563f98e2f4414836fd4da0c84c753.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR19CA0020.namprd19.prod.outlook.com
 (2603:10b6:610:4d::30) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DS0PR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: eeda1e2c-faf2-42c6-8794-08dbf263529e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QWx/55LmHFAWeayHCgtaXcqAazKtSNJNzXlbGJQ+iD5dhhKtMjDoQZKUaM60NNh7k+GTIZzl55PK54exGHKiwJtJsZJ86AoNyowintALffN9zHY0b5pivjzOioLbWIOKalWPziPf0s31eQEjDbG1KYkTzBoaoq7/C5Eg6zQgx5gusWqPNfJglWdN+R834LsFSb1oeRASiGTMiDHqYp9GbZJ1FDgz/OU6hN6YA+xCJSAyojq/kg5RvGGRBcvNBRo6pY37L44skyLqoftNCq3CS4pHw2mwMjUpCTvrtO2iQPg5WZ1vLmQOPfVtfoe1DCRe7nBdaoKlWUjeqqc2+0nKLRqWS9sggCqsoNVqm6XW3fJXC6aMmoixsai1qjKCqcVPOjYkcxegl6OjUrt3d+RCvuYWhFy5vsNO8btX4TTu5pVPqo6JGTmTKG19wEKgTC5HPR7cezCVdW/6BoIj43q3fyyXNy5MfWzyXAK8hPVYaoHcxF3rVmR66ZKQH9U+s0s4qgFUVavrUe9MwdMW+NBlf10nYtkIiYCj7LO1dC8PIQF7oykn2oOVak6lu15F9Xskngc9DW5UDbF8eOBnXBIX76gw5SSXhFgDrqJg+VGY3d+bqSF3bPQzdbgGQS9k9p6C
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39850400004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31686004)(6666004)(107886003)(6512007)(26005)(2616005)(38100700002)(86362001)(31696002)(921008)(5660300002)(2906002)(41300700001)(6506007)(53546011)(478600001)(4326008)(8676002)(66946007)(316002)(66476007)(66556008)(54906003)(8936002)(6486002)(110136005)(966005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WUF0TnBjSURmcUVYNENoNEhRYXBoNkVDQ1VOYUd5TGZYVnZTM0t5MUtBQmdJ?=
 =?utf-8?B?aWRVVXBacEhEU29oWllOYm9CcnMzWHgwZVc3WCtFcnhVdmlIUitseFpPUEl3?=
 =?utf-8?B?Y0RXa0JBT0RWLzB3c1J5QW1tOUZpOUFRVmxZL0pyVG9GVjNEU3Y1K0dzbjNQ?=
 =?utf-8?B?QkFwV2FJL01MSmtScWlKRmE3aVQ2NnQrbjIwNmd1alRLUkQ0MGw4UW0rckF6?=
 =?utf-8?B?Ym9wNjN6SE14TEtSdG56aGJDZ1kxMkRiOW4xUklzVTlXVWUrQVVjZHpVNGFV?=
 =?utf-8?B?UHNVcEZBaWt6WnBEOGMzOGdLRFcwN20veGNCUzA0eFpScTZkNEdjTWhFdTdI?=
 =?utf-8?B?VndKcjNWUE1kbFVzcFRQcFNma1ZxTElYTENHZnNhYzhCM2NTN3c2eG8zZndi?=
 =?utf-8?B?emZ3Y0wySThZUzYvWmRrc2RQNStGcDgxNE1zRlhjR0lVZk96Q2k5M3dNVllI?=
 =?utf-8?B?VUJ5Nm1jRWo0TXlPWWF5YlVhNjYxYjBRdnZDZHlCZjZhelpOTmZpdFN6Qlo3?=
 =?utf-8?B?Ry9FVm84WE5iNU1EMUlvczJCWDE0MHZVQzcrNzEwc2xpdC9FK0xiUVZuOUZr?=
 =?utf-8?B?QlNXTEEvdGx0bDI0eEJGMTB6OURNVXI5T1dkdURYTWMyVEhndnlnR2c5YUlV?=
 =?utf-8?B?Rks5Qlh3NFJ3dTg5OHhGUTFJOW15RjhhVkYyNmZFSUk5SUx6Vnk4M0E2Y1VW?=
 =?utf-8?B?UTFKTS9CaUpoTFZBcXBRWjNlazVGTUgrTFpnem56MGNZSjR1d1RrZHNZaGsw?=
 =?utf-8?B?TTZKK3oyTHVhWVZlemg5bWlpUzN2Q24rYUJlc1BFTXlFT3NSck5WRjZjbzVo?=
 =?utf-8?B?UUhCdC95T25oK1N4UnNsSmpXRUJtakg1cU9Idy9NVHFSd0VKTmM5b0UrSWxQ?=
 =?utf-8?B?a1RyeG5RVjRXYktvYjhVVjNHR25MNURrNXY2QUd1ckpHckpQRVA2MWFRQ0wx?=
 =?utf-8?B?MVYzZ1paenBKOVlldVlvU3RGNk5OT0JaWlpHN1grZzlyVFZCZUJKWWxSYlZi?=
 =?utf-8?B?YkZOVnBLRkU1U1hhMzFlMDVxZDZlZ3BKQ2t3K0tkZ0hyb1cwdTl0MExlM2Fi?=
 =?utf-8?B?Sm56YkhsQ1RnWlBIV3JlcElIZTVweWtwcnhnY3dmQjdZcjVNZ0EzOHRNWmls?=
 =?utf-8?B?RjJUSjZvNzRoeTZHU1oramtGTEFTMGZCeXkwRnlSeWFXRStWaVlVcFRJcFB3?=
 =?utf-8?B?M0dqZUREWlB0L2tYTTBvdmFXbC9laGpxZm5uQnlQSGpjK2JKdjhpYlEyZm9y?=
 =?utf-8?B?cys3USthaXBqYkZVa0NWRnVoaGxzRzlTdzJxY0t6RnFkNlQ0eS9kM21sSHF5?=
 =?utf-8?B?WExrRUNtNHJhZUlyWXRlVC95aldoZjdhR3F4cTdPcjhZZHRPMTVBVDVTa0lw?=
 =?utf-8?B?OFVlZ29WT2JMU1FjSGJVSnVvYkFEVCs4L2d0WUIwazRZdU54U1NJYzJWL2tx?=
 =?utf-8?B?RWpXanJPejRQNG9BODNjMFNsZWwyNkVzRlhrdzRaZ2JEZnFnS2RET3lUVFpL?=
 =?utf-8?B?T1MvbC9mQ0N0eGI1aTRDR21NOXk2azdMZFIrRUc2NzlrY3Q3STlRWFZhbkJa?=
 =?utf-8?B?djBvV3o0Y0RYTXNLSU5pNlA1eTg3VFk5YUhGUUFnMWxJdW9QN29rMjVEMjJs?=
 =?utf-8?B?WWtSaTh6T2Y4Y2tnTTFCQjdJZ3A0bmRabFZJRllvQ2ZUUEFJNFNBdEtEQzBt?=
 =?utf-8?B?b0ZWSWVicGZ6SWR0dVhXYzhFMnluVnpBSzRoS0pDNDNPK1FlK0NvNXdIbzFL?=
 =?utf-8?B?MEViQ2ZKTWthcmhaVWhGczh0aDFmUm9RL2FlK0lvL05Oc1JTUU1WK2dQL1dw?=
 =?utf-8?B?ZlpPdE1ud1dDR3NzVDhZbWJWbmQ2QXFlMGxISWg1amo0Y3pDS3dYNUthbmVo?=
 =?utf-8?B?cE5JQWF0dzNKcmpHN0ZnV205ZlJTTzlESFl2d1Q5RVM3a0xxODd1R0lRVU9q?=
 =?utf-8?B?cTRmcDRVRUVBcENBRkZRTlpjTEpNb0NuRVBDYWt2ZHM2b0hObXMxN1dEOG04?=
 =?utf-8?B?a3ZVZVRKQ0docTVmT0loM1dmSURmZVR4L1pmbmVLWTFpS1lwTFlyRFZzUm9z?=
 =?utf-8?B?bnZIbWpmY0UyejNDM3JURWFvZVc4TTgrWFNyRENMQUEzU1dCUlZmNzBvcnJi?=
 =?utf-8?B?WS9DcXBYbkJ6RTB0Uk96VCtuK1U2b0xOdTZmMHBQUlVTYXJBR3BOSnpERWZK?=
 =?utf-8?Q?fbylirROov361hSgWNHxPTI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeda1e2c-faf2-42c6-8794-08dbf263529e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 11:47:40.7068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OW4vKbk21x9ANkTXErXCKvx7cAgSgBkuh9FfzdXz0eHr0Ck1CEUAE5ob1TFG0rxhEfifRKSAFioJxZcZS4UtuMvE/VjjLX9QS1hprnrmRlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR01MB7963
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
Cc: Dung Cao <dung@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/12/2023 15:38, Jeremy Kerr wrote:
> Hi Quan,
> 
>> As per [1], __i2c_transfer() will retry for adap->retries times
>> consecutively (without any wait) within the amount of time specified
>> by adap->timeout.
>>
>> So as per my observation, once it loses the arbitration, the next
>> retry is most likely still lost as another controller who win the
>> arbitration may still be using the bus.
> 
> In general (and specifically with your hardware setup), the controller
> should be waiting for a bus-idle state before attempting the
> retransmission. You may well hit another arbitration loss after that,
> but it won't be from the same bus activity.
> 

Yes, that is the correct behaviour and I think that is why 
__i2c_transfer() return -EAGAIN when arbitration loss.

One example I could find in kernel tree is here [a], and, it seems not 
to totally rely on the retry mechanism implemented in i2c core.

[a] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c#n157

Anyway, it's been great to discuss on this topic. To answer your 
questions I did have to dig around and have learn a lot. :-)

My sincere thanks to you,
- Quan
