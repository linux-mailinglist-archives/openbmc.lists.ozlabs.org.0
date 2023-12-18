Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30781688B
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 09:47:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=PkTKQ1Bt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sttjx6XrQz3c20
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 19:47:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=PkTKQ1Bt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::72e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SttjD3sCsz2yMJ;
	Mon, 18 Dec 2023 19:46:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLHrEl5wN3YaFmFN0gg/cgPz4MGFzI7hbcG+gzs7htB/0gn84o/FdD/NeUJLf+Cy+jpYRuaFvee4yiETWqO7lIaaOb6pJ519mifxA/aZXDDJvvgzUlHoTyojT1nXgd1AzCjE6OQivpaKsiw+fx7qebRsmKsh2Z7xLO9enUq7E1VrzlT6PSeQQwUM55Pz8zstWpXerAEhpyQHMyb06XN24x+y24/XjwgibCYnUMY+wkdzR4Jf7ilzvXn67v3f9SoLSCYcwjtYa8o+vNI31poBB0ZXFgnsasjxqCAokh061YlylRT4H0Z37ErEcZks7n0Fqv7hl7sj0dJRwz+rFt91og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIpiW3TCP+qtTISIVXS7rVFEFgiPODM6i3q0cX1O/A0=;
 b=UAko50/nEh6wli0FZdjIQQJZmrWu2rnU5a/tYX+di8n2GnTZ2E4tvwRzhHgkP7B5ThR5EahAZqqzCxdNG7AxmVS2XlqMpfWpGeMac8PU7J462O9biM49VGoBk+1TozeeVNSvz90He2OIZ/TXCth+zwVaofdXzUXIjweXOh2ie19avQGupD6eM5b7QJmdTJK68j26Gw/crSm/LGsxnrDA9GDAWJasKLow1DPuDbHhfuomS3Xs94uzrOkIVAqFVpeAGwKVEZF8+dvP8DgKI4DZC8xR4sSTOfnkKV5gYsQ6GhqMdyGBVNWPdViPc7DyVEQzEs/JnpsVi2ZkKZ4J4mkvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIpiW3TCP+qtTISIVXS7rVFEFgiPODM6i3q0cX1O/A0=;
 b=PkTKQ1BtQkQ0396hlR2osq/2Oqlj1HFHRHdeqzKyYvtC1KXgtXcn6K1sJUv5R6vQtlgNES/USOzzBER/pI2WVI8luGkxzeDNE99g+eZHfQ+8Keu9HWZ39Sq0/e5NN8pUu+mfYOZgknRvQkBbzOxLrBlY8NY+3a4x8EkgMBn7wR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SN4PR01MB7440.prod.exchangelabs.com (2603:10b6:806:1eb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.37; Mon, 18 Dec 2023 08:46:09 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:46:09 +0000
Message-ID: <7dfc99e5-4c76-413b-aabc-81b26e26249e@os.amperecomputing.com>
Date: Mon, 18 Dec 2023 15:45:56 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
Content-Language: en-CA
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
 <20231211102217.2436294-3-quan@os.amperecomputing.com>
 <2eab42cde34723a195e7a0287db08b25f8388a3b.camel@codeconstruct.com.au>
 <54cba87a0df233b8762e43b742afe8e44a77a60c.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <54cba87a0df233b8762e43b742afe8e44a77a60c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:610:75::16) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SN4PR01MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: bc451b3b-4694-4bd8-3c73-08dbffa5c800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ifN4LkZBveMrJclelhbzT+X3jtHeCPUmZV1aHGiSbBylZM8xi+j79yt688ubfbpMsnbPZNRUBLI0w451c/N+mBxlJHaYkhs+uOywXpxGx3n1waotbWNH5ZwfSJrxaFdRuHBQO3cKjuY6fkwUG+EVyqiU6rZp4cq/nCxNy03RYYRS9ScYTz0BC3R+cazQ7nrdP+g4PCc9mZzeDPQJv7cAahTEMrJ8gHxv2t4p+KndwTMzy7Rb0a5GXPIZN+nrCkpBqWrGkZJEO1WcqHL0d+qIphtVa5nlVv1fgiRp4mLBkPTSFUuTT/QBTgH+J8pv7iraJ+KwUIRaEK1wrpPlgiRkZXYSwsA58FOF+kE1kiSJrJcdwMksB71l/0JFH9v0xAf3+w1AL9K+h63jIiy8VvR1PasNlMuEaRuRcCmJT9EepR7gWnWoZbeIH6W+XKi34jfMccqNFi+IW32kS2hS+6m+AE6SQbnTyoAIepVKKkjT9sxe6gZ3jxWp2uQOHiO5L1gm45ArQmwRxBcfNLCHhBYNrZ7EPx7Ek4WybAkJurbTmoP65Vv63MMjoYb6nBi+LRWenTYLH9hwDuGiuvwRUQGSUwAYgpQ4LedeQFBYMPLcDX4KTE1gCEYIXI5KFWubvAWFYqqp/zhcjw8ZWrCMj+ZAOg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(39850400004)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(26005)(6506007)(53546011)(2616005)(107886003)(6512007)(5660300002)(4326008)(41300700001)(4001150100001)(2906002)(7416002)(6666004)(6486002)(478600001)(316002)(110136005)(54906003)(8936002)(8676002)(66556008)(66476007)(66946007)(86362001)(31696002)(38100700002)(921008)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bWxGYWV4MTM4ZVlyQmhTWW9NRlBSekxrclpvSmZjbzZNeEpSMGQ2aGl6Tm1q?=
 =?utf-8?B?Z1JyUnJVSk9WcW5HRjh0VUxIL281dzJQbVhCZnpJcnZHVU9mRE1PN1JVajlo?=
 =?utf-8?B?a0ZRNDZpR0xhSGJEM1FYL1U2cU9TUXlJYmVqMWY5b3dKby9ZbmZlbTVscDhP?=
 =?utf-8?B?S2tkSWVXV2Z1OGhTcmRqTktpeUFjR3FiMDZVNi8wUTU0Zm1rWlROQmJxVnNv?=
 =?utf-8?B?cm1xR21kZGJlY0tMQWJSS3lSWE80ZzdsdEpLT2FRVlBUZ00wODVoN0gxMFdv?=
 =?utf-8?B?eGpvR3BTMldzN1E0Wi9WRmFucEZqZWcwVDRUbEEzUTVJeEJxb3d3cVk0K0ty?=
 =?utf-8?B?bXNyY29NbXRnODBsQVpiNU5WdUF3MmJiYVFqSms5eVpRWDN1dUs3MzFEZXRm?=
 =?utf-8?B?a2c1Ym03T0x0aldNOE51dzB3c0RGT0lxc1JGWnVrT3BFSUVsb0JHRjl5MFFG?=
 =?utf-8?B?WW9jRUNyYjM0YUNsME90Z1pwWko2L2NsVE1VZXJTUEJnWXI3R0IrZDBSN0VW?=
 =?utf-8?B?RTJlbWtuNGd2bFpyRldyai9hbEJPRDQ0aDNoUFdqWW8wTWVhWTlEOUhBQzZi?=
 =?utf-8?B?QjNGQVBmR1Z0WWdQRyt0OEVLRmd6VHlNWlFlRmJGTHlPajVhenBhUUlXdHY5?=
 =?utf-8?B?ZE8zdnVVZGl1ZFlOZURIbUFqLzVJWCt2VXBZNjcvd1ArOFdIcExlN2k5dTZD?=
 =?utf-8?B?RHhOSVRmbmoybExWTXJFUFZsaWNNazFEUnJ0MmVPSUp4VU5DM0tTNk5uOUs4?=
 =?utf-8?B?cDVOQVB5UGJaaDdRT1c4WUZicVVYTlhnYzVIUzRnUG11cURlUDg1V1hWK2ND?=
 =?utf-8?B?Kyt3VHVPZERDcS9pTGlXK3VYNXkwYVI2eVU5K3JqWHZzM1ljRjduS3gzUXEx?=
 =?utf-8?B?TFFvR2JGcExrVkZNbjRNeFpUZ05BRFM3NEpKUkRwS0xvbE9RNmZ3UTVYRE8y?=
 =?utf-8?B?aXRqWU5kaEZLZ0h0VTh2R1VqbFI1R2xhaEhjSkV1WXB2TjhLZ2ExZGxMODJu?=
 =?utf-8?B?eG84ZjBQTzNJcUxXcU4veitqWmJDeDBRcXVOZHJVakcxS28vbkFTUUxwMms0?=
 =?utf-8?B?UFlDcnRDbFlPMDJucmZNMGZtaHExcjhNajFWUU1LY0t4eFJja3JqVFRYUWRS?=
 =?utf-8?B?aGFCa2dGOHZaVHNLVGhlRmlvQm5NUlA1RUJnVld3OFk2K0duaCtQRFZOKzFj?=
 =?utf-8?B?ZE9MZTZCcEV5ZGI2dEM2bGlGeExSWm5jT0lFSENnVHNrTFUvUXd1NFZjMG55?=
 =?utf-8?B?cVp2NFFIa2RaaElnWjdSWkoxVXA1dW9OKzVCNjNGZTI3MG9NMFVUc2N4ckxJ?=
 =?utf-8?B?anRXbndjWWtkbTB5WDQ2UStLSzZwZUZzTE5ZaE10VFJ4OGFyK3RJUGp4K1E2?=
 =?utf-8?B?TVU1MzdzOVVocUlOeGJneDE5U1AyRWNKamxvSS9QaHExZHFnNXhGVC9obHRr?=
 =?utf-8?B?bm1PdHE0SUFxSmFJRitlK2ZSNy85ZDRMNUNjdlAzWHozdC9GNFVxVEVrZ3lJ?=
 =?utf-8?B?Z1htRkQvMFBKYmlYT083OGxJdFdSeWRJWkR0bGJlQnRheGdVTExsRytNQnh6?=
 =?utf-8?B?cS92UzBTbHdmUVJIaXZLTjJxVkltUUFpRDJudW9WajJ2QklvdnVOL3E2UVJq?=
 =?utf-8?B?RjlnbTlOdkRRaDFsTzdyN1cyZXc4Q2t4d2R6Q1g1MmhMdi9QN1NOL25SNmlC?=
 =?utf-8?B?bms5UUNtVllTcURqRldIRGdxT3pOMWJXbTFJbHN2N2xmZTN2Nitrcmt6V1JS?=
 =?utf-8?B?TC93NlF1cUZSZDgyeGNjMU11emdZdndRTTlhOVZXbGNhVWZ2b05BUGJMQ1Jl?=
 =?utf-8?B?Ym5RMTZ0dkxUYzBBQ0txNmxTdUNZZmFPMHZ1SzFHaW0xaTBlMm5pdTZVb1ND?=
 =?utf-8?B?TVI1NFhkcURsOWdnNnpIRlhyYTZjUjhQU3VzVmEzN3Azay9OMXVGK3hkRmtT?=
 =?utf-8?B?a2tFT0pNalVhb0ZIVUw4a2g2d3h4TUhJWFpqa0Q2Tlo3NVRsd29iUWROWXJ4?=
 =?utf-8?B?TytsZ0NyUTQrbEFIb29adVNuRWdHa3BLalNDTEZKR3huUzRYR0U0TjhRTHBw?=
 =?utf-8?B?ZGo0bCtyRnUrcDMxNWpJTE9PQi84VnkranpDVTY3bTVkUW90b1EzbllRbHBU?=
 =?utf-8?B?VWVYWGdBSkI0aERoQlRaMCtudUg3eDVSRVFYejNTZ0NJQnJ4SWxmT1haU3ZS?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc451b3b-4694-4bd8-3c73-08dbffa5c800
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:46:09.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCc6BkizIgUKHA/3mWWwwf6YfHn/CK5UhtFteX9eKTjXHzPPRX7kd0pIthFO8u6b51QjvoFX9MuD2BjPeZYXdHv+6STR9xz6fxs4NfcA7r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR01MB7440
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 15/12/2023 05:21, Andrew Jeffery wrote:
>> On Mon, 2023-12-11 at 17:22 +0700, Quan Nguyen wrote:
>>> Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
>>> interrupt handler") acknowledges most interrupts early before the slave
>>> irq handler is executed, except for the "Receive Done Interrupt status"
>>> which is acknowledged late in the interrupt.
>>> However, it has been observed that the early acknowledgment of "Transmit
>>> Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
>>> be raised in READ REQUEST state, that shows the
>>> "Unexpected ACK on read request." complaint messages.
>>>
>>> Assuming that the "Transmit Done" interrupt should only be acknowledged
>>> once it is truly processed, this commit fixes that issue by acknowledging
>>> interrupts for both ACK and NACK cases late in the interrupt handler.
>>>
>>> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>
>> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> So I just booted this series on v6.7-rc5 under qemu v8.2.0-rc4 and
> found this:
> 
> ```
> $ qemu-system-arm \
> 	-M ast2600-evb \
> 	-kernel build.aspeed_g5/arch/arm/boot/zImage \
> 	-dtb build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb \
> 	-initrd ~/src/buildroot.org/buildroot/output/images/rootfs.cpio.xz \
> 	-nographic 2>&1 \
> 	| ts -s
> ...
> 00:00:03 [    1.089187] Freeing initrd memory: 3308K
> 00:00:05 smbus: error: Unexpected send start condition in state 1
> 00:00:05 smbus: error: Unexpected write in state -1
> 00:00:06 [    3.685731] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 registered, irq 48
> 00:00:06 [    3.688918] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 registered, irq 49
> 00:00:06 [    3.692326] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 registered, irq 50
> 00:00:06 [    3.693757] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 registered, irq 51
> 00:00:06 [    3.695070] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 registered, irq 52
> 00:00:06 [    3.696184] aspeed-i2c-bus 1e78a780.i2c-bus: i2c bus 14 registered, irq 53
> 00:00:06 [    3.697144] aspeed-i2c-bus 1e78a800.i2c-bus: i2c bus 15 registered, irq 54
> 00:00:06 [    3.699061] aspeed-video 1e700000.video: irq 55
> 00:00:06 [    3.699254] aspeed-video 1e700000.video: assigned reserved memory node video
> 00:00:06 [    3.702755] aspeed-video 1e700000.video: alloc mem size(24576) at 0xbc000000 for jpeg header
> 00:00:06 [    3.706139] Driver for 1-wire Dallas network protocol.
> 00:00:07 smbus: error: Unexpected send start condition in state -1
> 00:00:07 smbus: error: Unexpected write in state -1
> 00:00:10 smbus: error: Unexpected send start condition in state -1
> 00:00:10 smbus: error: Unexpected write in state -1
> 00:00:12 smbus: error: Unexpected send start condition in state -1
> 00:00:12 smbus: error: Unexpected write in state -1
> 00:00:14 smbus: error: Unexpected send start condition in state -1
> 00:00:14 smbus: error: Unexpected write in state -1
> 00:00:17 smbus: error: Unexpected send start condition in state -1
> 00:00:17 smbus: error: Unexpected write in state -1
> 00:00:18 [   14.080141] adt7475 7-002e: Error configuring attenuator bypass
> 00:00:19 smbus: error: Unexpected send start condition in state -1
> 00:00:19 smbus: error: Unexpected write in state -1
> 00:00:21 smbus: error: Unexpected send start condition in state -1
> 00:00:21 smbus: error: Unexpected write in state -1
> 00:00:24 smbus: error: Unexpected send start condition in state -1
> 00:00:24 smbus: error: Unexpected write in state -1
> ```
> 
> The smbus errors do not occur if I revert this patch.
> 
> Can you look into qemu to see if it's a bug in the aspeed i2c
> controller model's state machine?
> 

Thanks, Andrew, for testing these patches on qemu.

I'll try to look into it to see if anything can be improved, but I have 
to admit that I'm not so familiar with it. This is my first time trying 
it on qemu. Just did these tests on real HW with waveform captured 
sometimes.

So far I could be able to reproduce the issue and start playing around 
trying to understand the model.

Thanks,
- Quan
