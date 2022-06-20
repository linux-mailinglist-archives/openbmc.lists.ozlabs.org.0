Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD9551144
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 09:17:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRLZg0vyJz2ypb
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 17:17:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=R8Y5kgRl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::72e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=R8Y5kgRl;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRLZ45Vmhz3bl2;
	Mon, 20 Jun 2022 17:17:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH+B0hzBwh5ikW/IXOJqXcGUbs3wwiyNzEE/K/2RLCNDuoNHwk+bFJww1hinIIRjNwxiV7ObFYvQIgSG6zXnqSBPQt9TI9Kw+YyJ/rWgOkIt4ZChRI/2HLPzDuIsafNiGnr/44j1KBOGHa2BWZyszH7XesyWl9l7dgihdvFIZO9Ejfgdjj4kaXiW9e+LSY/w9xqmWZIvD1FrL7MUZa1EleFajp4h8u5MFqtZjCwlOYJ7WIXYpv0V/r1GAFV2WsIMLbxzHC06BDj0Ke43wbT5Q67UKk+3gzAkZS5c2aX9Di5ZY6b/ZpFgrxAOfxoZga23aVxQ5WBl98sKc+YFb9DoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2bNy4D4ZGTYBpozLztCuEEp0erKvR2Z02I5t4sTO3s=;
 b=k79mzlUN6u4nbbIM2bi8MfxCECKAlFjfjyncKoQnUXDQb3m6CLYe6+YZ9pPJZeg3rD5mCxk0mLbRd1LM1zvTRxJyoW7UEFq5QhelwFUvcFnT3fNa3IW5RRqmpFqr7ageYTiRWNvYcPICCJsVncy0gHsAia+VN4ftMSlFczmIgiVaxWep+9srtN0npLYIz0+b44iCs4GcQrktr1abGNVKpBjH67H0UPD8tYYuQw56GGzj0rVbgx4A6NhWU6qVYWR34uGH+mt2Rc7InmDKuluVpL1NgfGel+N6eeA0R8OclEfJQlkTn4Y8O5lOwUtzy/IPfJChvoUPbdx7BG08zlmbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2bNy4D4ZGTYBpozLztCuEEp0erKvR2Z02I5t4sTO3s=;
 b=R8Y5kgRlIiOWaLG+SPinBERNwKgmb90JopZ32GVFHEgavk1C8yuE3QC8qEJXfKSuUqCIbC3MTDC7oVTGjr3cp0b3CvvxP/NbAkJoJSfLsGD0JbxGkRnei5y6XwzQk0YwUwSm4i9eX+SSg0Uk7keGNvY3FSjHINe2lixHUnHuYmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 CO6PR01MB7403.prod.exchangelabs.com (2603:10b6:303:136::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Mon, 20 Jun 2022 07:16:51 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%7]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 07:16:50 +0000
Message-ID: <997aa782-deb0-1d88-c144-8ea4537e55c2@os.amperecomputing.com>
Date: Mon, 20 Jun 2022 14:16:36 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-2-quan@os.amperecomputing.com>
 <7b9923c0-50f0-556a-657c-9cf0ef9af5aa@wanadoo.fr>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <7b9923c0-50f0-556a-657c-9cf0ef9af5aa@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0b3ce7e-b9b9-4d83-1595-08da528cd81d
X-MS-TrafficTypeDiagnostic: CO6PR01MB7403:EE_
X-Microsoft-Antispam-PRVS: 	<CO6PR01MB740351C335603C372706B762F2B09@CO6PR01MB7403.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Se8+vhj+e9QL7sO64WAq7T3JbvmpZsicCRhFXAfLu33MUSwZilRcTFkUv8NWz4z/ZCx10RNS4ypuVOSEPZCkG9zYMPWhK4fcm16BnAbxgzba4eVyjmrf6cPSz0QWcxESkXJZMr5uk31jLaMLgBVr7lTy40uIHIX1pGUI+w89FaEkY/5pTHaQC12UGnhFvluvYi9E3VpqNzSncHrx2HuZMPNrSnGY8khJ8dgdNCUKFDa0wzfy99kOMB7NmGXcHc4lJnOVwTPPErkNwRzZMdFKCyhavNIvLjj7o8oBOZNvbB50V8u9ZHbK6NK+i+mIQN+TAeleo6SVbGflwEYhBaq8J3/y4Vi2AZbUuw9/vXl/z8qj5o6GvcagawaFing11NNHMifAir4461PseMbDvzVYhLs6CPZn/fmNPLLCVulOep+YWfse/7P6qoKbr5RRuKLRN96JpDOBFoHWQ2D3bquxIICofBj5d1wXikH+U/hx7B1iUhZ60ghP6wRxssMEmvnV8Q2lhdHSadLX3c9sdJQB5+f06LDkYbMea0UZ2vaTqGIBjGHA9J5ZTjrQ5yhVU/OcvnK/7Oncb4DaJeEDYos8GlN6E4jzhydR7i2qq3x/wBchzwLfBcvL9ex3xm7rUCwXPXXw54RHtGdxrWFU1Pig2KZCOA03t3LZXml+NnCiKGF9fn7jummoLPv2Cge8ihzYRa+31/RoVoDYx6pMNboR+oeQ0PY0XyQ4fdXX1EN5pxgJEV69XQ+WWIJkSg3RNjRTnt0uhmpOKYkEdn3Z+xRW64nBJ8lpyPqOczEZzGVtbJ2nFW0GnHH6OtpQddHsMmP4
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8936002)(6486002)(83380400001)(966005)(66476007)(66574015)(53546011)(2616005)(31686004)(7416002)(498600001)(186003)(5660300002)(66946007)(86362001)(6666004)(2906002)(38100700002)(6916009)(316002)(8676002)(66556008)(31696002)(6506007)(6512007)(26005)(52116002)(38350700002)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?R0d6d014QVlmTFB0Q21GbDI4RVhyVnMyRU4wOHBMZnNmOXJiSTI1MVBIUjA2?=
 =?utf-8?B?NEU5cW1PcERkVnV6eHJLOGhMSndtTElEeDRsT2xJaDU2ZkIwbkN0MFh5WGk1?=
 =?utf-8?B?eDVIYS94TnNtQUIwVmJhQnM4MlpDMjJyeVRNWklyQnBqOVVRSjlSWmxkQlRC?=
 =?utf-8?B?RkR4WENIdVlLbzZHYnZSb1JuVndsdytyeTVOdTNTSmNsWjZDUTc1SWxLcnk3?=
 =?utf-8?B?Yk5ZalMzUlNwc1Z6dG9IUFpHTWdrbW1QMjB2NjlwR25iN3lteU42RkNwOFRp?=
 =?utf-8?B?RXA0VWhONC9lZ1FESXNJWkR3RkxKdFlOTGs3ZS9weUl0VFd1ZUx6K0hxWEFu?=
 =?utf-8?B?MjgxUTlhMXQraXM3TGhZZ1kxd2VDcVlsMnJ1eGYxYVpvZjdNQURiNzVjdmlI?=
 =?utf-8?B?VDNPL0dRcUJPb1J3dEg5b1RNbG1sMmdUSzA0M1lJcWhkQTNwZDZ3cTBVZTM2?=
 =?utf-8?B?LzlVS0lDaVdxVFFhaTRWRXVNcEk5eWs5eUxvNUV2N3krL3luTURJdnMvanlV?=
 =?utf-8?B?eTJoT1hRbmFwNStFbGZjbXBBWnpzQmZ5VlFGRmppd2V6RFc4RzRqMFIzY3VL?=
 =?utf-8?B?eWhYeG5Ub0lyMmlhQjhmb3Y4VnN2QWQ5ZzZvSm11MXhrWmxiM0FQOUZjQlBY?=
 =?utf-8?B?bXlZRFNnc29Fdmp1NjJKWmlkNDdZZnR5TzdCK3BwRlRBcUJiY2hKUXpJWVpp?=
 =?utf-8?B?S2JGbVlqY2ZDbVhESEdpck9PR3RNSVFnY244WnVXL3ZMaUN2K1BsTng3Ykw0?=
 =?utf-8?B?VWpOVkRKTXdMRkhYQWp5V1ZBY2VoVWpGZ0liRWFKbXpEbDJ2cW00VzViRGtJ?=
 =?utf-8?B?T1hKS3M3SjV5OHcvazBKb1Y1dlB5YUZqTm9XQlh4clUxSnFjakRqM290SkZp?=
 =?utf-8?B?YXdLWWlhcG1qNUNxWHpmbUNKM2VPN25jRVpGcHlXbG82SmxtdTRmb0VydXVr?=
 =?utf-8?B?T1dWTjJlLzZpeG01aEdjL3ExbElOTmZtWkU5TGI3ZmNTTEk4VTFSMUx0bE4x?=
 =?utf-8?B?TXhEb0tObU1NWGsySjkxQVdpaVU2T3JBa25ZMkVCLzBNNXgxdkw0eE96ZmRi?=
 =?utf-8?B?UXNBdmc2WGUvVnVsNWFWcHgwOUdTeVQvZmpoV0xKR0UyVlQrN0NVVXM1Y3NL?=
 =?utf-8?B?NkVtUEhPOGtVeGdGb0VqYzNaQmRLcTBXQjNMendlRVB2RHF4Q25BdUxnU3hV?=
 =?utf-8?B?UlgzM2N0L3Axd0s5eURsSEhhcm5EbVpEZ0x3bVVrNWJIZ2xzdkxici9VNlN0?=
 =?utf-8?B?b0NDZkxwSitrSkMvZzBGbFhmazZac0VBSEttY0NrK21qSlA2dzI2RWdJVTNr?=
 =?utf-8?B?N0NqWkpub3BnblBXMXAzUVJ6OHdHR0g0YXVGSlpmSTUyZ1lsTUU4aWhqMjJC?=
 =?utf-8?B?aW9BSUZVVWxXWGw3bU4yRGpKbHgvcWdhbnpiWDNDVHBKaU5aeFpsVEE2Snk3?=
 =?utf-8?B?eS9iY1k4QnRWK212THROSnlDWkJEN1JZcG5YRHMwcXlKUVBYRlRqWEZXYjNH?=
 =?utf-8?B?a0FhbFRQanFwd25GSmltd3ZSR0JwQ1IyRitlN2lXa1l4QjVQT3IyV21NLzVi?=
 =?utf-8?B?MEkvbVVmekc5dUdvRlNPQjY3MExoMEtTUUNSWUU5RlAwMTFQa3VGY2ZNaTBL?=
 =?utf-8?B?aUEvWjgvM25WdFpZdGdza0ZDcWVjaStCaEN2R2ZkTk51ZjlBaTlZMDRYSXpZ?=
 =?utf-8?B?MkFnOVpJRkpBVVNmY01tSDNUcnFlRndrbkl2L1dLUE96QzhGRkN6Q0xtTG4z?=
 =?utf-8?B?NE1MQk9XVkRLc2hvYk03UHBnNEtvQkRaN2FqUkdVK0MvZFpBc0hqeE9pU2dx?=
 =?utf-8?B?Z0tYWXdRYW1SSDFHd1QvSE1FclNlMDlsUHVVWU53dC85WElDWnowMmhZc0NL?=
 =?utf-8?B?MGJDby9ONFVCUXEvTzdWMUVaWkVYenBZRytuakhyYXp3ODBXeVAwMGV0alZ2?=
 =?utf-8?B?V3JlRTErTmd4dEtzN0VTallpSEZsM3ZNbEZVb3B4TGl2MkFINFc3K0lTU3pD?=
 =?utf-8?B?UlFaTi9DU3pWSHhkZ1ZoaitTSktiNU1BaUkzb01xdVZtemxQbTUwY2gxYVZX?=
 =?utf-8?B?TkRWVEFGUllBUG5nYkZ1RExScm9LdU5OUWRQRFBsbkkvNGIzZk1vZFZSNmda?=
 =?utf-8?B?cXhRMkMvb0dEb055NkZOVy9pcm5aZXdtQWt6U1lCc0pDSEJlbFlqZ3RJVEw3?=
 =?utf-8?B?THpqZFFuMjFSNFlNS1JOcEhpYWFqaWVuNHEyb1U3SDFjNnNLNkpFRTlxaTh3?=
 =?utf-8?B?ZHVSOGtlWGQ1MUhkRVJINC91WXV5UUx2RE9YbEV0Qk9SRVpEQ0w1UWQ1VFVF?=
 =?utf-8?B?K0swYmNuQWNLK05qdmxPWVZzUGdJYmRUTXF1RWMvY2VRUVd2SGpUQWhBRXdX?=
 =?utf-8?Q?eq2IevJVvatIQdKE6CTATZVNegb+3wk/mZ8f3?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b3ce7e-b9b9-4d83-1595-08da528cd81d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 07:16:50.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgZrz7GY/ztCVeXdwhEGpy9wXcNpWwiTOaO5vkW893Y56EOh3eF/93A8KwTvne/WCKist97SjKhrdt76qsAK/x/jMk+c2w8P9Xe/epybJL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR01MB7403
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
Cc: devicetree@vger.kernel.org, minyard@acm.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, brendanhiggins@google.com, linux-kernel@vger.kernel.org, phong@os.amperecomputing.com, wsa@kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openipmi-developer@lists.sourceforge.net, patches@amperecomputing.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17/06/2022 03:47, Christophe JAILLET wrote:
> Le 15/06/2022 à 11:02, Quan Nguyen a écrit :
>> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
>> in-band IPMI communication with their host in management (BMC) side.
>>
>> Thanks Dan for the copy_from_user() fix in the link below.
>>
>> Link: 
>> https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan-shex6MNQR2J/SfDzf78azzKzEDxYleXD@public.gmane.org/ 
>>
>> Signed-off-by: Quan Nguyen 
>> <quan-shex6MNQR2J/SfDzf78azzKzEDxYleXD@public.gmane.org>
>> ---
> 
> Hi,
> 
> a few nitpick below
> 
> [...]
> 
>> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
>> new file mode 100644
>> index 000000000000..0bfd4b9bbaf1
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.c
>> @@ -0,0 +1,880 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + *
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/poll.h>
>> +#include <linux/sched.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/timer.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/ipmi_ssif_bmc.h>
>> +
>> +#define DEVICE_NAME                             "ipmi-ssif-host"
>> +
>> +#define GET_8BIT_ADDR(addr_7bit)                (((addr_7bit) << 1) & 
>> 0xff)
>> +
>> +/* A standard SMBus Transaction is limited to 32 data bytes */
>> +#define MAX_PAYLOAD_PER_TRANSACTION             32
>> +/* Transaction includes the address, the command, the length and the 
>> PEC byte */
>> +#define MAX_TRANSACTION                         
>> (MAX_PAYLOAD_PER_TRANSACTION + 4)
>> +
>> +#define MAX_IPMI_DATA_PER_START_TRANSACTION     30
>> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION    31
>> +
>> +#define SSIF_IPMI_SINGLEPART_WRITE              0x2
>> +#define SSIF_IPMI_SINGLEPART_READ               0x3
>> +#define SSIF_IPMI_MULTIPART_WRITE_START         0x6
>> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE        0x7
>> +#define SSIF_IPMI_MULTIPART_WRITE_END           0x8
>> +#define SSIF_IPMI_MULTIPART_READ_START          0x3
>> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE         0x9
>> +
>> +/*
>> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
>> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
>> + * Recover ssif_bmc from busy state if it takes up to 500ms
>> + */
>> +#define RESPONSE_TIMEOUT                        500 /* ms */
>> +
>> +struct ssif_part_buffer {
>> +    u8 address;
>> +    u8 smbus_cmd;
>> +    u8 length;
>> +    u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
>> +    u8 pec;
>> +    u8 index;
>> +};
>> +
>> +/*
>> + * SSIF internal states:
>> + *   SSIF_READY         0x00 : Ready state
>> + *   SSIF_START         0x01 : Start smbus transaction
>> + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
>> + *   SSIF_REQ_RECVING   0x03 : Receiving request
>> + *   SSIF_RES_SENDING   0x04 : Sending response
>> + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
> 
> If these states are related to the enum just below, 
> s/SSIF_BAD_SMBUS/SSIF_ABORTING/ + description update?
> 
Thank you for this catch.
Will fix in new version.

>> + */
>> +enum ssif_state {
>> +    SSIF_READY,
>> +    SSIF_START,
>> +    SSIF_SMBUS_CMD,
>> +    SSIF_REQ_RECVING,
>> +    SSIF_RES_SENDING,
>> +    SSIF_ABORTING,
>> +    SSIF_STATE_MAX
>> +};
>> +
> 
> [...]
> 
>> +static int ssif_bmc_probe(struct i2c_client *client, const struct 
>> i2c_device_id *id)
>> +{
>> +    struct ssif_bmc_ctx *ssif_bmc;
>> +    int ret;
>> +
>> +    ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), 
>> GFP_KERNEL);
>> +    if (!ssif_bmc)
>> +        return -ENOMEM;
>> +
>> +    spin_lock_init(&ssif_bmc->lock);
>> +
>> +    init_waitqueue_head(&ssif_bmc->wait_queue);
>> +    ssif_bmc->request_available = false;
>> +    ssif_bmc->response_in_progress = false;
>> +    ssif_bmc->busy = false;
>> +    ssif_bmc->response_timer_inited = false;
>> +
>> +    /* Register misc device interface */
>> +    ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
>> +    ssif_bmc->miscdev.name = DEVICE_NAME;
>> +    ssif_bmc->miscdev.fops = &ssif_bmc_fops;
>> +    ssif_bmc->miscdev.parent = &client->dev;
>> +    ret = misc_register(&ssif_bmc->miscdev);
>> +    if (ret)
>> +        goto out;
> 
> Could be "return ret;"
> (see below)
> 
Will change to "return ret;" in next version
>> +
>> +    ssif_bmc->client = client;
>> +    ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
>> +
>> +    /* Register I2C slave */
>> +    i2c_set_clientdata(client, ssif_bmc);
>> +    ret = i2c_slave_register(client, ssif_bmc_cb);
>> +    if (ret) {
>> +        misc_deregister(&ssif_bmc->miscdev);
>> +        goto out;
>> +    }
>> +
>> +    return 0;
>> +out:
>> +    devm_kfree(&client->dev, ssif_bmc);
> 
> This looks useless to me. The whole error handling path could be 
> removed, or updated to only have the "misc_deregister()" above.
> 

Will rewrite as:

     /* Register I2C slave */
     i2c_set_clientdata(client, ssif_bmc);
     ret = i2c_slave_register(client, ssif_bmc_cb);
     if (ret)
         misc_deregister(&ssif_bmc->miscdev);

     return ret;

Thanks for the review.
- Quan

