Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559752E671
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 09:44:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Jdb2jkZz3bld
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 17:44:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Gs7yNQsG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Gs7yNQsG; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4JdC4kfCz306J
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 17:43:59 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9340A4FC;
 Fri, 20 May 2022 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1653032637;
 bh=h5q0PgUqrDVv9IWUkPbHbUenx9ytZsFFrV5/D0uavj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gs7yNQsGX/Z+SJpirTyGjqAN958sbIxZdKPdv6gq4AMurwk1NNsaq6V+jbgOJdp7R
 n1nYAbPg2NYOdTjHjCiL6Q3+Xt2joj4ceO3QyfPwPqIusIvabpQ8xfPqmP3a6iXTuU
 mRToo25RZ1wjIFN0rOIan4jMRO4wsYu6ZfkimFAQ=
Date: Fri, 20 May 2022 00:43:51 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 3/3] configs: Add IBM
 Genesis3 defconfig
Message-ID: <YodGtyz9YJSQe2r2@hatter.bewilderbeest.net>
References: <20220519150719.22338-1-patrick.rudolph@9elements.com>
 <20220519150719.22338-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519150719.22338-4-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 08:07:19AM PDT, Patrick Rudolph wrote:
> Use the evb-ast2500_defconfig as reference to add support for the
> IBM genesis3 board.
> 
> Changes compared to evb-ast2500_defconfig are:
> - Route debug uart to TXD1/RXD1
> - Disable MMC and I2C support
> - Use DTB ast2500-ibm-genesis3
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  configs/ibm_genesis3_defconfig | 74 ++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 configs/ibm_genesis3_defconfig
> 

As Joel mentioned in another thread earlier, having a bunch of 
system-specific defconfigs accumulating doesn't seem ideal; maybe just 
put whatever system-specific stuff genesis3 needs into an add-on *.cfg 
via a bbappend in an openbmc meta layer?

> diff --git a/configs/ibm_genesis3_defconfig b/configs/ibm_genesis3_defconfig
> new file mode 100644
> index 0000000000..1a81b66c62
> --- /dev/null
> +++ b/configs/ibm_genesis3_defconfig
> @@ -0,0 +1,74 @@
> +CONFIG_SPI_BOOT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_LOG=y
> +CONFIG_BOOTCOMMAND="bootm 20080000"
> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw earlycon"
> +# CONFIG_SYS_I2C_ASPEED is not set
> +CONFIG_ASPEED_AHBC=y
> +CONFIG_ARM=y
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_SYS_TEXT_BASE=0x0
> +CONFIG_SYS_MALLOC_F_LEN=0x2000
> +CONFIG_ENV_SIZE=0x20000
> +CONFIG_ENV_OFFSET=0x60000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_FIT=y
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_PRE_CONSOLE_BUFFER=y
> +CONFIG_PRE_CON_BUF_ADDR=0x1e720000
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> +CONFIG_HUSH_PARSER=y
> +# CONFIG_AUTO_COMPLETE is not set
> +CONFIG_SYS_PROMPT="ast# "
> +# CONFIG_CMD_IMI is not set
> +# CONFIG_CMD_XIMG is not set
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_SYS_ALT_MEMTEST=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_SF=y
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_MII=y
> +CONFIG_CMD_PING=y
> +CONFIG_DEFAULT_DEVICE_TREE="ast2500-ibm-genesis3"
> +CONFIG_ENV_IS_IN_SPI_FLASH=y
> +CONFIG_USE_ENV_SPI_BUS=y
> +CONFIG_ENV_SPI_BUS=0
> +CONFIG_USE_ENV_SPI_CS=y
> +CONFIG_ENV_SPI_CS=0
> +CONFIG_USE_ENV_SPI_MAX_HZ=y
> +CONFIG_ENV_SPI_MAX_HZ=50000000
> +CONFIG_SF_DEFAULT_SPEED=50000000
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_REGMAP=y
> +CONFIG_CLK=y
> +CONFIG_DM_GPIO=y
> +CONFIG_ASPEED_GPIO=y
> +# CONFIG_DM_I2C is not set
> +CONFIG_MISC=y
> +# CONFIG_DM_MMC is not set
> +# CONFIG_MMC is not set
> +# CONFIG_CMD_MMC is not set
> +# CONFIG_MMC_SDHCI is not set
> +# CONFIG_MMC_SDHCI_ASPEED is not set
> +# CONFIG_MMC_HW_PARTITIONING is not set
> +CONFIG_SPI_FLASH_SFDP_SUPPORT=y
> +CONFIG_DM_SPI_FLASH=y
> +CONFIG_SPI_FLASH=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_DM_ETH=y
> +CONFIG_FTGMAC100=y
> +# CONFIG_PHY is not set
> +CONFIG_PINCTRL=y
> +CONFIG_DM_SERIAL=y
> +CONFIG_SYS_NS16550=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_SYSRESET=y
> +CONFIG_TIMER=y
> +CONFIG_WDT=y
> +CONFIG_WDT_ASPEED=y
> +# CONFIG_EFI_LOADER is not set
> +CONFIG_DRAM_UART_TO_UART1=y
> +CONFIG_FIRMWARE_2ND_BOOT=y
> -- 
> 2.35.3
> 
