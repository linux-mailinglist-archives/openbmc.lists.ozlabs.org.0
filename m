Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA75B32ABE
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 10:26:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HSnf3KlkzDqRF
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 18:26:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.109.111; helo=2.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8785 seconds by postgrey-1.36 at bilbo;
 Mon, 03 Jun 2019 18:26:04 AEST
Received: from 2.mo5.mail-out.ovh.net (2.mo5.mail-out.ovh.net [178.33.109.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HSn80Tq2zDqK1
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 18:25:59 +1000 (AEST)
Received: from player755.ha.ovh.net (unknown [10.109.160.153])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3ADB123B9AC
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 07:59:29 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id 2861C67E7374;
 Mon,  3 Jun 2019 05:59:26 +0000 (UTC)
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed/flash: Add
 MX66L1G45G chip
To: Adriana Kobylak <anoo@linux.ibm.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org
References: <1559156179-60850-1-git-send-email-anoo@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <43d1d93d-44a6-4aed-4918-aa87ad38e2b7@kaod.org>
Date: Mon, 3 Jun 2019 07:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559156179-60850-1-git-send-email-anoo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13204835584810257288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudefiedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/05/2019 20:56, Adriana Kobylak wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> The MX66L1G45G is a 128MB SPI NOR flash chip to be used in
> Swift machines which are AST2500 systems.

It looks correct to me.



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  arch/arm/mach-aspeed/flash.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
> index db69d51..cc59707 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> @@ -78,6 +78,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
>  #define MX25L12805D		0x1820C2
>  #define MX25L25635E		0x1920C2
>  #define MX66L51235F		0x1A20C2
> +#define MX66L1G45G		0x1B20C2
>  #define SST25VF016B		0x4125bf
>  #define SST25VF064C		0x4b25bf
>  #define SST25VF040B		0x8d25bf
> @@ -1077,6 +1078,20 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
>  			ReadClk  = 50;
>  			break;
>  
> +		case MX66L1G45G:
> +			info->sector_count = 2048;
> +			info->size = 0x8000000;
> +			erase_region_size  = 0x10000;
> +			info->readcmd = 0x0b;
> +			info->dualport = 0;
> +			info->dummybyte = 1;
> +			info->buffersize = 256;
> +			WriteClk = 50;
> +			EraseClk = 25;
> +			ReadClk  = 50;
> +			info->address32 = 1;
> +			break;
> +
>  		case SST25VF016B:
>  			info->sector_count = 32;
>  			info->size = 0x200000;
> 

