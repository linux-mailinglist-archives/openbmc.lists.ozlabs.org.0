Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39D5181D2
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 11:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KswQm3MmZz3bfc
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 19:58:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KswQV4PmFz2xnG
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 19:58:42 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aed95.dynamic.kabel-deutschland.de
 [95.90.237.149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id E8DB461EA193F;
 Tue,  3 May 2022 11:58:38 +0200 (CEST)
Message-ID: <d09f0131-65e2-d382-27b9-29ded4f47d84@molgen.mpg.de>
Date: Tue, 3 May 2022 11:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>
References: <20220503094728.926-1-ctcchien@nuvoton.com>
 <20220503094728.926-4-ctcchien@nuvoton.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220503094728.926-4-ctcchien@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Medad,


Thank you for v8.

Am 03.05.22 um 11:47 schrieb Medad CChien:
> Add memory controller support for Nuvoton NPCM SoC.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> Reviewed-by: Borislav Petkov <bp@alien8.de>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Reported-by: kernel test robot <lkp@intel.com>

This line is confusing.

> error:
>     macro "edac_printk" requires 4 arguments, but only 2 given
> 
> warnings:
>     performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>     logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
>     mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
> 
> Note:
>     you can force an ecc event by writing a string to edac sysfs node
>     and remember to define CONFIG_EDAC_DEBUG to enable this feature
>     example: force a correctable event on checkcode bit 0
>     echo "CE checkcode 0" > /sys/devices/system/edac/mc/mc0/forced_ecc_error

Shouldn’t this go above all the tags?

> ---
>   drivers/edac/Kconfig     |   9 +
>   drivers/edac/Makefile    |   1 +
>   drivers/edac/npcm_edac.c | 680 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 690 insertions(+)
>   create mode 100644 drivers/edac/npcm_edac.c
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 58ab63642e72..64149b524f98 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -539,4 +539,13 @@ config EDAC_DMC520
>   	  Support for error detection and correction on the
>   	  SoCs with ARM DMC-520 DRAM controller.
>   
> +config EDAC_NPCM
> +	tristate "Nuvoton NPCM DDR Memory Controller"
> +	depends on (ARCH_NPCM || COMPILE_TEST)
> +	help
> +	  Support for error detection and correction on the Nuvoton NPCM DDR
> +	  memory controller.

Please add a blank line below.

> +	  First, ECC must be configured in the BootBlock header. Then, this driver
> +	  will expose error counters via the EDAC kernel framework.
> +
>   endif # EDAC

[…]
> +module_platform_driver(npcm_edac_mc_driver);
> +
> +MODULE_AUTHOR("Medad CChien<ctcchien@nuvoton.com>");

Please add a space before the <.

> +MODULE_DESCRIPTION("Nuvoton NPCM EDAC Driver");
> +MODULE_LICENSE("GPL v2");


Kind regards,

Paul
