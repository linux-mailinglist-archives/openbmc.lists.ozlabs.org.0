Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2ED566361
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 08:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcYD64lNPz3bt2
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 16:48:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A7coXkTv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A7coXkTv;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcYCf6PDQz2yn5
	for <openbmc@lists.ozlabs.org>; Tue,  5 Jul 2022 16:48:13 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id s1so16066328wra.9
        for <openbmc@lists.ozlabs.org>; Mon, 04 Jul 2022 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8VN+9i3H/qvn2fuAxOp9IjnVj+nRznL01vb2QrP6PHA=;
        b=A7coXkTvipeCCo9tyIMbyTYCFbw/x3dxl5WNCb7/Fs4ZrqQR9U8s342VBXTkTVLv+j
         Y8hvC7CZTFwaIqF3WSPpP1N++Wh+x9xr77YKD6UBuW+MEBizfWEJIgZPaKhJZuPW3gcJ
         iuCeiqFrfCLvrzsF9PBHyn4A2wb07EAw2TG78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8VN+9i3H/qvn2fuAxOp9IjnVj+nRznL01vb2QrP6PHA=;
        b=w+xr1vPcl2SEy21n1zGAMncd6S/QrXZOwypBvQOntXRcpVPu6u+3lnDOl/wflwIFxi
         h26vqZgjhkgtHB/qY07XDDNO6i6EkwP/LO/mgOkeHMVtd2k/ZUaOyn9JapRkXDiZZksr
         98lEQrJElHYIp5CLnTyY6Y3QjOcM9kbkyNtljewxJyYuePmDIBNNJlgIyfTHX0mY2ae4
         Yc9U5rQqudjZYMgpLohvGEHfENzjxKI0DN2Q+upENwfHn31QuOk/cMewswIvZ73B9y7A
         pBXisOm8tykf2nHRnzemj09hwf6pbu/sA6ovifLSgcMryidMjI4HFjAgpqyLS3v7CiM+
         mVkg==
X-Gm-Message-State: AJIora9FcbIeQsED4ffs0emm4ys8RVPHAaA/HtlM9okCjbgMuJw2Gh86
	BaaDDFuiADggleWIjde1TCIsbzZ8hmpHK28tZwQ=
X-Google-Smtp-Source: AGRyM1uX8BC2jw7D3VMTV7iiuhdWlHd3NZ0bgfaG+xCXhwkU2qUYkLbO/hUeTZm58tgHJmecSpQdi+uOEWFQzXwLgtA=
X-Received: by 2002:a05:6000:1869:b0:21d:6e78:3f4d with SMTP id
 d9-20020a056000186900b0021d6e783f4dmr4627656wri.549.1657003687747; Mon, 04
 Jul 2022 23:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com> <20220630200227.2292079-2-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220630200227.2292079-2-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Jul 2022 06:47:54 +0000
Message-ID: <CACPK8XcJPs5vcs_+r=hmRX475CzfLo+LdofdAtrpoE5bnEbchg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/3] configs: ast2600: add
 Qualcomm DC-SCM V1 defconfig
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Add Qualcomm DC-SCM V1 defconfig which is equipped with AST2600.

In your commit message you need to justify why your board needs its
own defconfig.

Preferably we would use a generic openbmc defconfig and you select the
device tree for your board at build time.

>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  configs/ast2600_qcom_dc_scm_v1_defconfig | 117 +++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 configs/ast2600_qcom_dc_scm_v1_defconfig
>
> diff --git a/configs/ast2600_qcom_dc_scm_v1_defconfig b/configs/ast2600_qcom_dc_scm_v1_defconfig
> new file mode 100644
> index 000000000000..353882deed26
> --- /dev/null
> +++ b/configs/ast2600_qcom_dc_scm_v1_defconfig
> @@ -0,0 +1,117 @@
> +CONFIG_ARM=y
> +CONFIG_SYS_DCACHE_OFF=y
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_SYS_TEXT_BASE=0x0
> +CONFIG_ASPEED_AST2600=y
> +CONFIG_TARGET_AST2600_QUALCOMM_DC_SCM_V1=y
> +CONFIG_SYS_MALLOC_F_LEN=0x800
> +CONFIG_ENV_SIZE=0x10000
> +CONFIG_ENV_OFFSET=0xE0000
> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_FIT=y
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="bootm 20100000"
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> +CONFIG_BOARD_LATE_INIT=y
> +CONFIG_DISPLAY_BOARDINFO_LATE=y
> +CONFIG_ARCH_EARLY_INIT_R=y
> +CONFIG_BOARD_EARLY_INIT_F=y
> +CONFIG_HUSH_PARSER=y
> +# CONFIG_AUTO_COMPLETE is not set
> +CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTZ=y
> +# CONFIG_CMD_BOOTEFI is not set
> +# CONFIG_CMD_ELF is not set
> +# CONFIG_CMD_IMI is not set
> +# CONFIG_CMD_XIMG is not set
> +# CONFIG_CMD_NVEDIT_EFI is not set
> +CONFIG_CMD_CRC32=y
> +CONFIG_CRC32_VERIFY=y
> +# CONFIG_LOOPW is not set
> +CONFIG_CMD_MD5SUM=y
> +CONFIG_MD5SUM_VERIFY=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_MEMORY=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_SYS_ALT_MEMTEST=y
> +CONFIG_CMD_MX_CYCLIC=y
> +CONFIG_CMD_SHA1SUM=y
> +CONFIG_SHA1SUM_VERIFY=y
> +CONFIG_CMD_STRINGS=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_PART=y
> +CONFIG_CMD_PCI=y
> +CONFIG_CMD_SF=y
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_MII=y
> +CONFIG_CMD_PING=y
> +CONFIG_CMD_NCSI=y
> +CONFIG_CMD_EXT2=y
> +CONFIG_CMD_EXT4=y
> +CONFIG_CMD_EXT4_WRITE=y
> +CONFIG_CMD_FAT=y
> +CONFIG_CMD_FS_GENERIC=y
> +CONFIG_CMD_MTDPARTS=y
> +CONFIG_EFI_PARTITION=y
> +CONFIG_ENV_IS_IN_SPI_FLASH=y
> +CONFIG_USE_ENV_SPI_BUS=y
> +CONFIG_ENV_SPI_BUS=0
> +CONFIG_USE_ENV_SPI_CS=y
> +CONFIG_ENV_SPI_CS=0
> +CONFIG_USE_ENV_SPI_MAX_HZ=y
> +CONFIG_ENV_SPI_MAX_HZ=100000000
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_REGMAP=y
> +CONFIG_SYSCON=y
> +CONFIG_CLK=y
> +CONFIG_DM_GPIO=y
> +CONFIG_ASPEED_GPIO=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_ASPEED=y
> +CONFIG_MISC=y
> +CONFIG_ASPEED_AHBC=y
> +CONFIG_ASPEED_H2X=y
> +CONFIG_DM_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_ASPEED=y
> +CONFIG_DM_SPI_FLASH=y
> +CONFIG_SPI_FLASH=y
> +CONFIG_SPI_FLASH_GIGADEVICE=y
> +CONFIG_SPI_FLASH_MACRONIX=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_SPI_FLASH_STMICRO=y
> +CONFIG_SPI_FLASH_WINBOND=y
> +CONFIG_PHY_BROADCOM=y
> +CONFIG_PHY_MICREL=y
> +CONFIG_PHY_MICREL_KSZ90X1=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
> +CONFIG_DM_ETH=y
> +CONFIG_PHY_GIGE=y
> +CONFIG_FTGMAC100=y
> +CONFIG_MDIO=y
> +CONFIG_PCI=y
> +CONFIG_DM_PCI=y
> +CONFIG_PCIE_ASPEED=y
> +CONFIG_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_RAM=y
> +CONFIG_DM_SERIAL=y
> +CONFIG_SYS_NS16550=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_SYSRESET=y
> +CONFIG_USB=y
> +CONFIG_DM_USB=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_WDT=y
> +CONFIG_HEXDUMP=y
> +# CONFIG_GENERATE_SMBIOS_TABLE is not set
> --
> 2.25.1
>
