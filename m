Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1245646
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 09:27:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QBxt5n81zDrTF
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 17:26:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.195; helo=11.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Jun 2019 17:25:53 AEST
Received: from 11.mo4.mail-out.ovh.net (11.mo4.mail-out.ovh.net
 [46.105.34.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QBwd44SbzDrHy
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 17:25:49 +1000 (AEST)
Received: from player750.ha.ovh.net (unknown [10.108.57.49])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id C709A1F46C1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 09:06:11 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 547646ED1BBD;
 Fri, 14 Jun 2019 07:06:06 +0000 (UTC)
Subject: Re: [u-boot, v2016.07-aspeed-openbmc v1] aspeed/flash: add winbond
 SPI support
To: Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <1559767965-21037-1-git-send-email-hongweiz@ami.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5d0a22fd-a4fc-3b71-c725-862c7662eb2d@kaod.org>
Date: Fri, 14 Jun 2019 09:06:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559767965-21037-1-git-send-email-hongweiz@ami.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5143955202856553218
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeitddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 05/06/2019 22:52, Hongwei Zhang wrote:
> Add Winbond SPI flash W25M512JV support to u-boot.

For which board do you need this support ? 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  a/arch/arm/mach-aspeed/flash.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
> index db69d51..eefa6cd 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> @@ -84,6 +84,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
>  #define AT25DF161		0x02461F
>  #define AT25DF321		0x01471F
>  #define MT25QL01GB		0x21ba20
> +#define W25M512JV		0x1971ef
>  
>  /* SPI Define */
>  #define CS0_CTRL			0x10
> @@ -1156,6 +1157,20 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
>  			info->address32 = 1;
>  			break;
>  
> +		case W25M512JV:
> +			info->sector_count = 512;
> +			info->size = 0x2000000;
> +			erase_region_size  = 0x10000;
> +			info->readcmd = 0x0b;
> +			info->dualport = 1;
> +			info->dummybyte = 1;
> +			info->buffersize = 256;
> +			WriteClk = 50;
> +			EraseClk = 20;
> +			ReadClk  = 50;
> +			info->address32 = 1;
> +			break;
> +
>  		default:	/* use JEDEC ID */
>  			printf("Unsupported SPI Flash!! 0x%08lx\n", info->flash_id);
>  			erase_region_size  = 0x10000;
> 

