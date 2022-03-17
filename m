Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B408F4DC06B
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 08:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJzjZ3mGPz30DB
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 18:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DAmTDZp/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::71f;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DAmTDZp/; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJzj21Yj7z2xXX;
 Thu, 17 Mar 2022 18:45:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pabr0xoDhvoyEgGT/UYFTo6g57SF9btUbXbYygXh5tN+JTgDCtcD6Ip495D8P4f5bwiL1KawcI2fZtuJDJ4mR0zBImn10yxPWqvL41P6IJZVRs4Cz4o1rLdDcr3Rfd5KQaIRHrvxTPFFcB9JdvZ7mH8csVC/mG7amrxGEq8EpYwCtxByVSG0RA95aMi3KzDWkMDukFfKlFwOmSIWX9P5EwyccgPFTCp8HVBw33inQoznKb5MkqVeFWNvT/nkGo3nDFODPLWq3/Zcxm12jy0RnKgcfl7Aip2aTO/VSz0nfQ4yUIeVOFy9LTiwTwR86Ct+QwDmQCMPSpYM7PNMWFp9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TT1BbLE0dKSi7i9LFluVaG481IREHPR0NXb6VkIQSA=;
 b=iBeSpOTdB6lBK5Ea/OQrPNt4LG7sEWGL9oc8+djr2BbMAxKwQNY5S0aHse7QYXpHjaB2znWjvb7MJKYMVYKC1fCKeOaCKD0cEGFJ1Wf+iBuZMzaBLiQsGGlOSNIKN6g1sUTU8nLyq9k0l+p8aNOzTOvcmsYMWo2e+pivfBcqNsCXVlb8bByHjxV53XlWWYrTNInjNsYziTjPvEEj8Zy14jDbcRik4Pf21nvJ+OzPUAw20llEHDgoOEG+QAmzpwHN8V+g+emdx8mQeF0BtKpS3mtOlCXV1QcWQQeGSxfScCVEkSDSB4Bpzi4GLi8ydwKwQ88ZJYL7+MNnH2/yWPZR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TT1BbLE0dKSi7i9LFluVaG481IREHPR0NXb6VkIQSA=;
 b=DAmTDZp/yzni0PijX7J7JACoFoTEnkNSYARHkI5Rnj0CHnSk+PmLPppGdkpNIb3WzNY2Pxw9nAs2Eb+0jitRJZYB3hLn/HvsUzP7CF0riZB/PJaU/DdOOy2KDR3F2uibNiSm9ehK+hn0SWCAHnXCPVnNqCglvWAcL9vD63LR+5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB4283.prod.exchangelabs.com (2603:10b6:5:1d::27) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.26; Thu, 17 Mar 2022 07:45:32 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 07:45:32 +0000
Message-ID: <db5a879e-5e2f-24f0-c0fb-4971679a45cb@os.amperecomputing.com>
Date: Thu, 17 Mar 2022 14:45:19 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v6 3/4] ipmi: ssif_bmc: Return -EFAULT if copy_from_user()
 fails
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, Wolfram Sang <wsa@kernel.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-4-quan@os.amperecomputing.com>
 <YirzJj/BBUQTbKS3@ninjato>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YirzJj/BBUQTbKS3@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0157.apcprd02.prod.outlook.com
 (2603:1096:201:1f::17) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63223b2b-a7e6-4583-7619-08da07ea1c97
X-MS-TrafficTypeDiagnostic: DM6PR01MB4283:EE_
X-Microsoft-Antispam-PRVS: <DM6PR01MB4283C132FAD0E0D67D14D2F7F2129@DM6PR01MB4283.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +V0CdS9yUxLg2Dqc5BgXYGbS/LcPrbLY4LpUt76yocRgcg1XU0tVAGqRM4/93qeyPaIpepXolGDaxtAZvNDNDo4+CBtEy4Hs0E7KLscwLqj2fkp+v1M4k2c5f9Z/24cV9M6Y6NzS6LBm7JpuewXncnp0pvoOp16Bq18h34kPJVir9agv1Gavh+4tYf8JdxsCFzRMTR3GVmrZhmNWKHVMhhHV1XtpsVJXl8x8ZBfPQmVVkVjecAagWLkigPo+ngmSA9ARajgRJSInTz5d7HXN2g3O0+a3KBTs9gZMtAMJV00P2eWN//irR2IGpzn4prfjIEU4Sx/jvgDwr6TBOA+QJNoKpetuFBnlE42MXJgHUF63KfJkPmWg2dm3YptA/pMoxD9AatI4nQrnS4qIrH1qt3wmtVEt9NKzOB8Ba8IRRwQWSAkEwHM5NmKrF2MJQso0c15IvHdD0N0IRuoUckXHRWQsz6olgyPjcLR69DpAI22t3UQTP3Llzj0sqltHFQPm1yA6AIGFsjrztJcMYdipwBODcaS8KPEjO+673QF+MIJvsjVni5X855yQLr/e5fbPEXA24aSTfZ3CI99Z/MtMKiIUZ9uq+ooRhCquT34HUM+R9cdbE2nZ+g4Qw3Krs/sjCQ2OgwaC2pbQJw8DzHatp8qrGfu4f0lDlHNsXLVaYNZ+2ZAK6ZJou3u3I2715ylqYX9S6NPWRlp0HzLUa/PSRRnbx6zIvEyNrvP1jaRPr7/4MvleJVXW4xfE+mEWhn/T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(8936002)(38100700002)(38350700002)(921005)(66476007)(66946007)(66556008)(86362001)(31696002)(53546011)(6506007)(55236004)(8676002)(6636002)(316002)(52116002)(508600001)(6486002)(6512007)(110136005)(7416002)(2906002)(186003)(26005)(31686004)(5660300002)(2616005)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N21CV2NwWVZTbGZQNDBGeFJ4SFBHOFNMSnZsczFJaktMdkZiamxoMlBNK2p3?=
 =?utf-8?B?UXpyaU1rZ1g0Z1RWUDhZbnZaL1RaRUcrQVU5ZVFTYzZhb3ZOd3IxQTY3SVRB?=
 =?utf-8?B?Q0t5RkhCTGl0akFRS0lkY3VUeVNVUnBNN2FIRzU2dmMweDVhR3B0c0gwc0FW?=
 =?utf-8?B?cUpOQjVMd3FTUTNaaTdmanZPZnVtMjA2Z2dyTENrbWd2MWVJbThHVlVYeGJH?=
 =?utf-8?B?MktudDRGL0MyZ1FkVm1jZEVyajVRV2h1UmZISGpmVU55NXBnYW1tYkFlbGU1?=
 =?utf-8?B?d0F6dCtWL01WK0VUQTBFd3Z4ZnBvenRQeFZRVmNOVjV0TEh4TXJnaS9IaXRw?=
 =?utf-8?B?VjV6c3BOQzhQNmdGT3orOS9OazgvcDhZTDdENHBhT004UGFBOURlL3pSZlVl?=
 =?utf-8?B?b3JiZDZZVHh0N1Z1T3I1M0R6OEZGcFcxVkhHZVR3aWtlNzRsSG1MaVMxYitS?=
 =?utf-8?B?Yi9QZVRhWDJEU0c1d21zY2hMS1ZWVWFTTTA0UXl6Ym5vbUc1L0Q3WW9McVEr?=
 =?utf-8?B?YVJnemg3N0xNcjFkV1hQa3VrUkh6TnhwQVg0dyt4aWdXNklVaDdCOXNzVTVP?=
 =?utf-8?B?cjM1cjR5Nlk4OUowUDBMMm1jWFd6Z0ttcmp3RVdJYk9tQmJWUzA1YWxobmpj?=
 =?utf-8?B?QVRVczVJbmdURi80MkxjSUNZaXk3U0MveGtjM3Jxa2g2Qm5kWUFwN0l0Z0dx?=
 =?utf-8?B?N3dRMkxoRFl2WW1VZ29CMVgrNjNlczhXek0wcG9ZKzk1b0RqOG5CUzBzd3VZ?=
 =?utf-8?B?c3RRQ2xNVENYUUVab1FBN0hyNTMzRm9ybXQ4NDNRaDc5ZkpGOEtCM0Y0M0R0?=
 =?utf-8?B?YTFaYThhekNCcUhYTWtaVDgyNEsxd3pxei9NVXpweUNSTnNaeVBDTVVldGhr?=
 =?utf-8?B?OU1iNGZVMFJuQm8wN1lCOUdkYW8rY3RZTkthK294dW9zQitTcHBqMmQrVFJ6?=
 =?utf-8?B?MTlHelk0andCVVZjeENGRWMyMy9HQzVDMThsOVdSeHRmN05xMFl0NWxybVVB?=
 =?utf-8?B?WHZtaUdNQVVYNkFmcWU3QnpodEFNOURrV0hCWWJFT3Z0ajFwY2t0YkFQcjh4?=
 =?utf-8?B?YUUzUWkweis0dFg0ZUtSUzFnMnc1OGppdDNiWjBEMW1MWjBVN3ZnbFRoTjdP?=
 =?utf-8?B?aU4xbHZNYXhCRXpkZzgvbW1oVUxETW55a2haaTNBbU13S2xVTWlKZzNpQ3gz?=
 =?utf-8?B?d1ZSZlVhS1p0bTFFcWZOVlBkc0ExYXNjRGlubllKemc3WDhINDRXZzRUY2Ru?=
 =?utf-8?B?SVJpSjZvalVPOXR0UytNbHdiMnFHd3FjUUp5SURadFp4TEFTTW1NeTczcjBH?=
 =?utf-8?B?ZHIzblZtbUNuQmUwajFteUdGSW9NNFV1RStnS0FhRWk3ZmUraW9KQ0lwbHJa?=
 =?utf-8?B?Q0M2SDR4clNXNjkxdndpT0VsdnY2WU1oWUZsS0xvMlJUTUlIWE9JbklNMXM4?=
 =?utf-8?B?eWxsYlRmaHVycWRnRDd3WDRZdzNwNG9qZTFSb1picmQ4VWFmTzNacHNYYS9R?=
 =?utf-8?B?bVJTL2JGZUtUdFVlbjlQMi8walBxUWVvRzIzVGdCT0hBNHBURGtqdlVOWDVB?=
 =?utf-8?B?aWV4ckdwSkFZQnE1dCtReGV6QS9vMkJ0cVluNTVNbU9UTVNuZjIwOEpmdW9z?=
 =?utf-8?B?VEFBMlZlanJDczRSTUhOVkdsc1AxM01UMWY0UjJtbGJvUW9qd0VIdDkyTVlN?=
 =?utf-8?B?NEtJK2FHRU43L0tzQjdPMzRTaW9wSk5kS1k2aEI4THE1aGNOM2syZHlVY1lp?=
 =?utf-8?B?RWM5THNDYTNXZjhGejZmbVo0YUVaZWs0R1VBaStSQWNKd1AzVldzZ0dTbUJS?=
 =?utf-8?B?NzBPS2lrTFloWHk0UG1jODlRcGlPUnMwMFJXVW0wVTh5aWNpSGgvUnRWRWc4?=
 =?utf-8?B?YjI5cU9xaGtRV04zWURac1VyQVVJUlhtdmEwV3NJdXBGUXlYVmRGaXFTQ0VV?=
 =?utf-8?B?eDAvNmgrbjdCYjAvM1QyR29RRk5KTUNlWWwwVklQSVBvUVlDekxoWUtHa3Fo?=
 =?utf-8?Q?OsDK9NnnmoCTcfQO9IJjGRbq77Fi+8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63223b2b-a7e6-4583-7619-08da07ea1c97
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 07:45:32.3692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F62kzhaywn6eBDU5aMgP2qM4ZxNsHEaaLtYu1cMzxJXl1dm3+9qtDfjZuHM6XpV4n6m0tCj9eGrhhUpbAJz+6GzFK4sR25WjTxcHuqnEVhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4283
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

Added Dan as I have missed Dan's email address in the first place.
My apologize,
- Quan

On 11/03/2022 13:58, Wolfram Sang wrote:
> On Thu, Mar 10, 2022 at 06:41:18PM +0700, Quan Nguyen wrote:
>> From: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> The copy_from_user() function returns the number of bytes remaining to
>> be copied but we should return -EFAULT here.
>>
>> Fixes: 501c25b59508 ("ipmi: ssif_bmc: Add SSIF BMC driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> It is nice that you want to keep this patch seperate to give Dan
> credits, but I still think it should be merged into patch 1, so the
> initial driver is as flawless as it can be. You could give Dan still
> credits by mentioning him in the commit message IMO. Dan, would you be
> fine with this?
> 
>> v6:
>>    + New add in v6, thanks Dan for the patch     [Dan]
>>
>>   drivers/char/ipmi/ssif_bmc.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
>> index 62db97773654..91ac2cae756e 100644
>> --- a/drivers/char/ipmi/ssif_bmc.c
>> +++ b/drivers/char/ipmi/ssif_bmc.c
>> @@ -87,9 +87,8 @@ static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t
>>   	if (count > sizeof(struct ssif_msg))
>>   		return -EINVAL;
>>   
>> -	ret = copy_from_user(&msg, buf, count);
>> -	if (ret)
>> -		return ret;
>> +	if (copy_from_user(&msg, buf, count))
>> +		return -EFAULT;
>>   
>>   	if (!msg.len || count < ssif_msg_len(&msg))
>>   		return -EINVAL;
>> -- 
>> 2.35.1
>>
