Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F830645F
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 20:46:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQvHw6mdhzDr1c
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 06:46:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m7VCk984; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQvHB2wpJzDqbq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 06:46:13 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RJZG3K183282; Wed, 27 Jan 2021 14:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rhC0i3VLCh8sfyW5AnWyyWqfZIx+kW3TVdyfls80RqU=;
 b=m7VCk984w+LxCjvaoxLeVJ4nKkdfhIWu4Ud252dOqOAOt/ggs5PU26hZTNelwiSL0eq9
 9qNMKiAIAcSfI37SQKTPiiGHo9EnKuIt+vyZvd3LJzwNkcrNMWG3hoEMxXl0nmaUJJer
 UmakPJCSTpPmwWP/A055PrKr9LLrIuzPId0bR9JXIPweZWsnhCN0OEuV/1W1I8FTyw12
 76q1vcX/kEIlP3cg7PRVR7STgpGdIH8SLgOB0MZLIBd0OlI8XKKLqT755Dogf+ssr2yD
 /tq2ZQfjhGtaZ+9kO3wsggzdAw0jyJaOQIgY0tfCC3N9GVC24w117XQUrJvCVDFUDvKE Ng== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b503s4t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:46:02 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RJh6rW016785;
 Wed, 27 Jan 2021 19:46:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 36ag3yb2yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 19:46:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RJk09432899492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 19:46:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82BEAAC059;
 Wed, 27 Jan 2021 19:46:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B6EAC05B;
 Wed, 27 Jan 2021 19:45:59 +0000 (GMT)
Received: from [9.80.207.30] (unknown [9.80.207.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 19:45:59 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 6/6] config: ast2600:
 Reduce SPL image size
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-7-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <bcd01e55-03ee-a642-bf39-a633e23f647e@linux.vnet.ibm.com>
Date: Wed, 27 Jan 2021 16:45:58 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127070054.81719-7-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270093
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

Hi Joel,

On 1/27/2021 4:00 AM, Joel Stanley wrote:
> This modifies some features of the SPL to ensure it fits in the 64KB
> payload size.
> 
> This set of options reduceds the binary size by 4760 bytes with GCC 10.
typo here..


> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   configs/ast2600_openbmc_spl_emmc_defconfig | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index c55a70c5c1c9..345225131075 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -2,8 +2,9 @@ CONFIG_ARM=y
>   CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
>   CONFIG_SYS_DCACHE_OFF=y
>   CONFIG_POSITION_INDEPENDENT=y
> -CONFIG_SPL_SYS_THUMB_BUILD=y
Are we sure this is reducing the size? From the Kconfig file..
"Thumb instruction set provides better code density"

>   CONFIG_SYS_THUMB_BUILD=y
> +# CONFIG_SPL_USE_ARCH_MEMCPY is not set
> +# CONFIG_SPL_USE_ARCH_MEMSET is not set
Ack, sounds good.

>   CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
>   CONFIG_ARCH_ASPEED=y
>   CONFIG_SYS_TEXT_BASE=0x10000
> @@ -51,6 +52,8 @@ CONFIG_BOARD_EARLY_INIT_F=y
>   CONFIG_SPL_SYS_MALLOC_SIMPLE=y
>   CONFIG_SPL_STACK_R=y
>   CONFIG_SPL_SEPARATE_BSS=y
> +# CONFIG_TPL_BANNER_PRINT is not set
Is this unrelated?

> +CONFIG_SPL_FIT_IMAGE_TINY=y
I am unsure about this one. I know that we *may* need that to
secureboot, but we may loose good tracking of the image that
was actually loaded in the fdt, which sounds like a desirable
feature in secureboot scenarios, specially where we don't have
a TPM for measurements.

I'd put that low on the priority list (i.e., below the ymodem support)?

>   CONFIG_SPL_DM_RESET=y
>   CONFIG_SPL_RAM_SUPPORT=y
>   CONFIG_SPL_RAM_DEVICE=y
> @@ -130,6 +133,7 @@ CONFIG_SYSRESET=y
>   CONFIG_WDT=y
>   CONFIG_USE_TINY_PRINTF=y
>   # CONFIG_REGEX is not set
bikeshedding, but I'd recommend combining the necessary changes to make
SPL fit the 64KB size in one patch, and enable the SPL signing in another
patch in the same set, while leaving out unrelated / optional changes
to another set.

> +CONFIG_SPL_TINY_MEMSET=y
ack

>   CONFIG_TPM=y
>   CONFIG_SPL_TPM=y
>   # CONFIG_EFI_LOADER is not set

Thanks,

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
