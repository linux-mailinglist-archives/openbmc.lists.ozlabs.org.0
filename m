Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7034A344BE9
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 17:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F40cp38sxz3dJY
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 03:41:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HeuRTAbv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HeuRTAbv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F40cL1S1Gz3dFs
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 03:40:49 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MGY443162555; Mon, 22 Mar 2021 12:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rvwoGaWkMPlXAxeJokhNBP6QiTGrRqGvYMuDy6KP4Ow=;
 b=HeuRTAbvKLZwbahB1xooaCCKKdrAjzdwOMnXfa25DV3gvU9jQkjgGT6ERx0CIkV2cxYi
 3Yx3OVdGKFyuBRf7aSbfXHPWe4/GDno0ENj1dgN9sQ1YEG28YtvP4vkV919li+d0recJ
 UL+YCUkP5NAoTcP/9vxAaTQdUjPLkukMyZ0TUA2TUnyTN7nXulBUXyK7TQFN7wDxEYuC
 uKVi8KqKvY7zgyHvC9ldrumSpXvd3JdDB1IsLKSYNQEsAmv5TtkBtKtziL+nYSDG2vJS
 cs5hJiM7o+Sr5wlkGrNgkmcasnqBK6pCOfrQb+QiEyQhwbXL1fw8sl5tO1N0j0a5crC7 nw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ef53ypsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 12:40:42 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MGdD6p016332;
 Mon, 22 Mar 2021 16:40:42 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 37equd3hu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 16:40:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MGee2W12648936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 16:40:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B93D7C605D;
 Mon, 22 Mar 2021 16:40:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74A9CC605B;
 Mon, 22 Mar 2021 16:40:40 +0000 (GMT)
Received: from [9.211.32.185] (unknown [9.211.32.185])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 16:40:40 +0000 (GMT)
Subject: Re: [PATCH linux-next tag: next-20210322] ARM: aspeed: Add CPU
 hotplug callbacks for kexec support
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20210322155720.2161941-1-bruce.mitchell@linux.vnet.ibm.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <ddb2757d-36df-8695-ce9b-ab9e26f3d457@linux.vnet.ibm.com>
Date: Mon, 22 Mar 2021 09:40:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322155720.2161941-1-bruce.mitchell@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_08:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220118
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/22/2021 08:57, Bruce Mitchell wrote:
> These callbacks are required for kexec to function. The AST2600 does not
> expose any controls for powering down it's CPU cores, so we borrow the
> approach taken from socfpga and wait in the idle loop.
> 
> Author: Joel Stanley <joel@jms.id.au>
> 
> Signed-off-by: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
> ---
>   arch/arm/mach-aspeed/platsmp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/platsmp.c b/arch/arm/mach-aspeed/platsmp.c
> index 2324becf7991..1ae3ff5a9701 100644
> --- a/arch/arm/mach-aspeed/platsmp.c
> +++ b/arch/arm/mach-aspeed/platsmp.c
> @@ -7,6 +7,8 @@
>   #include <linux/of.h>
>   #include <linux/smp.h>
> 
> +#include <asm/proc-fns.h>
> +
>   #define BOOT_ADDR	0x00
>   #define BOOT_SIG	0x04
> 
> @@ -53,9 +55,27 @@ static void __init aspeed_g6_smp_prepare_cpus(unsigned int max_cpus)
>   	iounmap(base);
>   }
> 
> +#ifdef CONFIG_HOTPLUG_CPU
> +static void aspeed_g6_cpu_die(unsigned int cpu)
> +{
> +        /* Do WFI. If we wake up early, go back into WFI */
> +        while (1)
> +                cpu_do_idle();
> +}
> +
> +static int aspeed_g6_cpu_kill(unsigned int cpu)
> +{
> +        return 1;
> +}
> +#endif
> +
>   static const struct smp_operations aspeed_smp_ops __initconst = {
>   	.smp_prepare_cpus	= aspeed_g6_smp_prepare_cpus,
>   	.smp_boot_secondary	= aspeed_g6_boot_secondary,
> +#ifdef CONFIG_HOTPLUG_CPU
> +	.cpu_die		= aspeed_g6_cpu_die,
> +	.cpu_kill		= aspeed_g6_cpu_kill,
> +#endif
>   };
> 
>   CPU_METHOD_OF_DECLARE(aspeed_smp, "aspeed,ast2600-smp", &aspeed_smp_ops);
> 

Adding Andrew Jeffery and Eddie James to the CC list.

-- 
Bruce
