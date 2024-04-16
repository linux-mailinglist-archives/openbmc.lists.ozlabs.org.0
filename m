Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C78A6300
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 07:28:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=vGaUhvh3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJXck1QKQz3dWD
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 15:28:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=vGaUhvh3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2009::701; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJXcB10b1z30hQ
	for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2024 15:27:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpRrw/GxdoWqJ10FBxecEcPIcnRd9OV9FKkx2/drSGkTYJu5Tpl2aLHZO3nl4/QYWzDdgueMHAxrMHluB/vffbZcYvVxEYc6fTBhnLtuYD8gDuJ81Un01/BBDCkqVQFsTs6IuhqzPs8AK7mnVVx+jT+YB6WfLiPwHuLpLn9FZZrs1tILMYkCKEjLKVcWo+wLz7DANc86a8DKifsTZKX53wUiZTwD8tMgZgRjm9AyUGEYl0Fz8rBk2CAbTZoiR0rtCXQxHJyD+IYfd1j8z+FcwYSEeNhvMhvHG5YPzrJ5GMyQKbCBuRTgKEVWcVeIWPyN4Hqk/6ZjXUS61vTli8S1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qVIdD2bQvBDcCJfiAvDy9yVXrGvZ2DHZIGsXp53+3M=;
 b=fc5qbrd3rk8vtOQrQm4Av0ItM6h4cBZylqAaXdFui9exmM5a1UWhYTiTVHbvUzWo46Wwn8qdEpjPvGJdhWbIXQ864OK61pSvK3BU1qU5Zejj/KKwCDjQE93JRlwD8q9GxdZtNh+twGpslWUHdLK8o4hF7JYYuQp7e9qLgzfxx8fabbILieSvHUo9rtxTOZq3uXzsMxH9MYPdO+Y0Z3fqcWpNXSBiG6paIcqThM00qWNbfae01vfnIA7Oc7DBugO+Ls3bt1kEyK4sJi5xJ9LD6fkL40Lubcvmp5DK3TQH0Usvv6xCvRDAU4atf+pAgXvhvZP7mBemqQ7cUhqjN5nJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qVIdD2bQvBDcCJfiAvDy9yVXrGvZ2DHZIGsXp53+3M=;
 b=vGaUhvh39JzM6WthBonWtwmfTGZCTI38gHegB2QX886xV5D2XRs+rFQ+qiZJKl3IRBR0zuge0Pn53YcfcfABFe5GF0fTbdh471UY3I+yjZTU4zDmGH8tGLPDE1xpFT9PdLG0xG/msKW10yhKHwmZL+9O0vUSnYBkYDP1/vCeFzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 DM8PR01MB7096.prod.exchangelabs.com (2603:10b6:5:315::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 05:27:12 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 05:27:11 +0000
Message-ID: <9bc38f67-01e0-4a38-8db8-4086a215b474@amperemail.onmicrosoft.com>
Date: Tue, 16 Apr 2024 12:27:01 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (max31790): Support config PWM output
 becomes TACH
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-3-chanh@os.amperecomputing.com>
 <79bef664-b191-4905-896c-afab341b982b@wanadoo.fr>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <79bef664-b191-4905-896c-afab341b982b@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::12) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|DM8PR01MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 921bc17d-6f4c-4aec-02d4-08dc5dd5dde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dVxz5kTFlPF/gx35IxN5AR1C6sY4bZTGWh4zOoQ3tL1AALWi7Gn0KCe9cWPl2FEpBLcw5jA0vXqNpb4PjxPSz5dwRDrA2vv8YjnzBAolEZ0m+OrS4kEJxWaaDB2X8HinzLSVuwdg27IqLKDLWZWfbslD9iA3AbimkXD74NrTBzjIZC9KnsS0vgyS/7puK4FDg72y/jrF2qyft+DZEyPfBJyXK/80ADTjGE00yIRFX2RHJMpOg2YzYUnEI+XyhC25Io6RtP6/J1oohiBpkeogm8kZt4chMkyW9MeI1hqjUNS6bB8LXxhOegXQDnzphtJUqsQf06gvR6eHU+4kgl4HWhotgUNxclTeU1cuX/sPJtRvuHsFCXE1gSUUxhSvR74Gu4vqt+2CEp0TcX/y3ph43ZMLSReI4kuufaqRdhKQX4mAPlLW1i9iccLSyzOntPoHpvWVm+7deZdjaPVZ/O15+96eWGtW2ZQDkaMlWA2Bdto6PkH5kKaM6dnjI7+MgJRcMAFyoJNVnwJ43ufXyouO5gYt74ZA3Ab2zQO1RG7UmPRjPQ2fKNfCo0WqAUjTuGTPKw24nfZgTBv31AG0ITrbPFkXeQsdHQTEk3syFCtA2OYzdF/EseIz282adTEeh2rOcOG3Wvh6Jo51qXVObhUQQzB3UjfAs9XfU9/PDrOrgPDvPcCK81U44KvXs7bWiuuDDbFqMXpQ4hQ7PT+kiPV8qg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YlA0Q2prYjhwVE1udlk0Mkg0aUtVd3J4OXJjQlArRzJJTnJjY0c0WnZaa1Fa?=
 =?utf-8?B?VUVHUm53Nkx3aVc4NDFTZGgyOHAxRDJ2Rmw2OGVoOEl5Q3FkVWliUnN0UHdp?=
 =?utf-8?B?QU5EVVYvUnJHZjBPU1dCM0tWckpmQ3Y1aHJpNGZzU1N2N0N2RTFwa2haUHZT?=
 =?utf-8?B?K3NtWURSYW5tTlpQTCsxQ1VaYnpPVlpITWVRNTV3YXh4Z0NxZ2VQa0szZStC?=
 =?utf-8?B?SlpackpWak1MaGtRcm4yb29hSnJaNmFwdThQbkxpR2lCL3JlRGpTVDUvSnFE?=
 =?utf-8?B?QmhFWjlOdVNWb1gyYmVJL2wvRzVnak5EcHdjM1Jzc1c2VXA0dy92WGZJR2Nt?=
 =?utf-8?B?U3FncDFnRUlHb2RyazFKc21nNXQ1clcyUHdPUUlqS3gvNjVYRFFDMFAvcFpt?=
 =?utf-8?B?YkhDY0t4ZVJlaGVYdEkvMkluVVd6aUczY2dCZUxOaVc0R0tXOSs4WkdudjNv?=
 =?utf-8?B?SmRNT2l5VVZqQStBYXA5WHJCdXlnaG5Ia2tyWCsyM3MzbThKVUwxYXJqbVZY?=
 =?utf-8?B?UGZHbkM4MWFGb1pXUG5zanU5U0djVU5KTk9nb0F0alA1SEErM2RFb2kzSmFq?=
 =?utf-8?B?WExObXgrUHBGcnFEWGI1RFZFSk5zZlVHZGpnemRNNngyVDlINUkvQWZQbDJI?=
 =?utf-8?B?UHJQa0dqeVJ6M252ZDZVdUNLNnV2dFp4bStWUFp4ejk4WkxabXhNQm9RSXZw?=
 =?utf-8?B?SUJVYmJJTTJTQVFoR3dLNGtkdDJ6VGtxNlRKRWpGR1VrRUUrZkprOWh4ck0w?=
 =?utf-8?B?eS8wb3dsd09yaFpyZXgxR3BDcnliUmJBMXR3MzBjc2E2bkFOL2gzS004MS9j?=
 =?utf-8?B?Y2Y5eW10NXJPTkNSaU42YWw4bWVUb21GdHZ2RHhDdFU2UWVNSTVTS3RkdG01?=
 =?utf-8?B?SUdjSlhUVTJIK3BaeGo3MDNra1lrcXR2OWpqZDJCY1FvVnVlb0NGZy9IWEpy?=
 =?utf-8?B?Y25IRTZKdGdxU1V4elZuT0FKNEpXWTFVOEIxQk5WU3poUTI4eDZBYW9WK25s?=
 =?utf-8?B?OUFmcWpyNjk0NVhndnhaOVdrNDJ4SmwwZUxmMjlxMjl1RVh2SFlnd0s1eFRY?=
 =?utf-8?B?VGZNaE9wNFBJd0owM0xSMmltNnk4OUxuUVNNSXdOY2piWDdtbDc3bGZHellO?=
 =?utf-8?B?bjVNeHBoTHhwb0c4aXpkcUl3WExLRmtXTEFqckxONUUyZTk5ckVka3hUUDdq?=
 =?utf-8?B?R0liaGtWTnY3OVE5QVFzOHZrTG5rdjRjM1ZrMFQyQmk0WnZOKzIrZnNXdUha?=
 =?utf-8?B?SWQ1bGV5NFNxc3B1TUhlM1IwK2FEMU1OM25Gci84ZGZ1Z3loMEdPS1JqeTJI?=
 =?utf-8?B?Z0tGVTExYXFFMVVVWHpQYzBHSUdFNDJJdHMyUDEzM2hiVDNBWXRrK2p5RVp3?=
 =?utf-8?B?Zk1RZGRadlduRFJBaHpzZmQxck8zbExrOFVaQVZBMEFPVHljU0ZoN3JnRW1u?=
 =?utf-8?B?Q25IK1JTRFJhUWMzTHRxa3hyazNGK3cyNlNUcFA2d0NQbnc3OXp5Q1lTZXNx?=
 =?utf-8?B?ZFd1NkRxMGlvVEEyTGUwK2ZIVWFvNHdKSVhGazhRWS9HSVpjeFRhS1VkakFa?=
 =?utf-8?B?VXFVYVhPTkxaU0tMNjZjZ3BmVkxHZzI3YXQvbUdMTmp1eTVHTGorak10dCta?=
 =?utf-8?B?MEUwN3VmTHZtczBvem50UUtYR25TRHpqMzkySEFjTXh0VjFhRDE3cjhuZGlt?=
 =?utf-8?B?cXN0YjdyREJDZERQS3BaYzdiL2JYRllHKzJ2UG14U1hqZkd2YlJhSDZwRG5j?=
 =?utf-8?B?ZklpYlBiZzR0M3ArTE4ybHNQN0Z4UHhsQXZ5aEV2UUt5bWdiV1pNTzhaUHh3?=
 =?utf-8?B?QVcxSHlMM0VDSWYzaDJKdHVpeDdFamNHazhiUU1sNnRyejBERHNRSXBJdHFZ?=
 =?utf-8?B?VEZ4T0dhWTdKdGhraEE4cHhqZy9STHdjTHg4aUh4ZXNUY0RKc212NzRkTGtm?=
 =?utf-8?B?MzR2VUxHTkwwbGR6ekVrZVJLTmpzd0FhUDMvVDdKVllmQy9RSzcyZnhhUFVN?=
 =?utf-8?B?dEw0UnRaUC9jY2NtSWdtUG9sM3pSMXdiYjRCcnRTQTlSSFM5RzRMcUVZSTZS?=
 =?utf-8?B?Zlo4aWUwUllVK04xUzllZUhlMm82Q3NxLzIzR0RldTdwb3VqdHpXL25Gekg4?=
 =?utf-8?B?TTdaQU9iekd6aHhGT2tiVlo1RWR2aDB2bE5hbFFKclN4ay9qRGRDaitxZDVh?=
 =?utf-8?Q?+jpatPtMwwxt8sVNA1ecFtU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921bc17d-6f4c-4aec-02d4-08dc5dd5dde0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 05:27:11.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkXFXt6Y0afNPwDnsVpdmHcUrbPwmLV1pvgOS1i7ndL0T7Szc9ss5yj0WqbdFuoczev1auyZ7TmpMy3nL6VQ+4sAaZbZ77FMvqWGhUBdAtMCP0izGQE+mDvSug2lPsgn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7096
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 14/04/2024 15:03, Christophe JAILLET wrote:
> Le 14/04/2024 à 06:22, Chanh Nguyen a écrit :
>> PWMOUT pins on MAX31790 can be configured as a tachometer input pin by
>> setting bit[0] in the Configuration Register. When the bit[0] of a 
>> channel
>> is set, the PWMOUT pin becomes the tach input pin for the channel plus 
>> six.
>>
>> This commit allows the kernel to set those pins when necessary if the
>> maxim,pwmout-pin-as-tach-input DT property exists.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>> Changes in v2:
>>   - Update the vendor property name to 
>> "maxim,pwmout-pin-as-tach-input"   [Rob]
> 
> ...

Hi CJ, what does it mean?
> 
>> @@ -528,6 +532,33 @@ static int max31790_probe(struct i2c_client *client)
>>       if (err)
>>           return err;
>> +    if (device_property_present(dev, 
>> "maxim,pwmout-pin-as-tach-input")) {
>> +        err = device_property_read_u8_array(dev, 
>> "maxim,pwmout-pin-as-tach-input",
>> +                            pwmout_to_tach, NR_CHANNEL);
>> +        if (err) {
>> +            /* The maxim,pwmout-pin-as-tach-input is an array of six 
>> values */
>> +            dev_warn(dev, "The maxim,pwmout-pin-as-tach-input 
>> property exist but malform");
> 
> Nit: exists
> Nit: malformed or "is malformed"
> 

Thank CJ,

I'll update that in the patch v3

> CJ
