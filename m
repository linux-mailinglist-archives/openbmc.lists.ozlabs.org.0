Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818295670D2
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 16:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LclF14MLnz3c34
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 00:20:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=UuzGQ+rw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=UuzGQ+rw;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LclDZ4wBvz2ypb
	for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2022 00:19:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657030783; x=1688566783;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FO22+/GpAsD7xkMdR/AD7mTBjBiyFb7yiHWicwczIqM=;
  b=UuzGQ+rwKs4schc8f1U95U6/w5L1qJ2BeqdQd3LGl31fLXTpp0erPm8z
   bSu3xLTCPuHf5pUaSAfTQafUA8XZUkkWsox2MQZc1fkSLkU59dRGrs0ft
   dXBxzOpHrEdMzZen/6rEUUb97gD7Xjxw6oh2Sow83BH9Y94L/AOGMjcjd
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 05 Jul 2022 07:18:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 07:18:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 07:18:38 -0700
Received: from [10.110.98.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Jul 2022
 07:18:37 -0700
Message-ID: <8bbe2c65-e928-c40d-3ab1-9cbf41b5c3d8@quicinc.com>
Date: Tue, 5 Jul 2022 07:18:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/3] configs: ast2600: add
 Qualcomm DC-SCM V1 defconfig
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
 <20220630200227.2292079-2-quic_jaehyoo@quicinc.com>
 <CACPK8XcJPs5vcs_+r=hmRX475CzfLo+LdofdAtrpoE5bnEbchg@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8XcJPs5vcs_+r=hmRX475CzfLo+LdofdAtrpoE5bnEbchg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Joel,

On 7/4/2022 11:47 PM, Joel Stanley wrote:
> On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Add Qualcomm DC-SCM V1 defconfig which is equipped with AST2600.
> 
> In your commit message you need to justify why your board needs its
> own defconfig.
> 
> Preferably we would use a generic openbmc defconfig and you select the
> device tree for your board at build time.

I expected 'ast2600_openbmc_defconfig' could be used for my non-spl
u-boot but currently the file has been modified for SPL boot too so both
'ast2600_openbmc_defconfig' and 'ast2600_openbmc_spl_defconfig' have SPL
boot configs. Since the 'ast2600_openbmc_defconfig' is being used for
other machines, I can't change the file directly for non-spl defconfig
so it's the reason why I'm trying to upstream this machine specific
defconfig.

Should I use a patch file in 'openbmc/meta-qualcomm/recipe-bsp' to
modify the 'ast2600_openbmc_defconfig' at build time instead?

Thanks,
Jae

>>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> ---
>>   configs/ast2600_qcom_dc_scm_v1_defconfig | 117 +++++++++++++++++++++++
>>   1 file changed, 117 insertions(+)
>>   create mode 100644 configs/ast2600_qcom_dc_scm_v1_defconfig
>>
>> diff --git a/configs/ast2600_qcom_dc_scm_v1_defconfig b/configs/ast2600_qcom_dc_scm_v1_defconfig
>> new file mode 100644
>> index 000000000000..353882deed26
>> --- /dev/null
>> +++ b/configs/ast2600_qcom_dc_scm_v1_defconfig
>> @@ -0,0 +1,117 @@
>> +CONFIG_ARM=y
>> +CONFIG_SYS_DCACHE_OFF=y
>> +CONFIG_ARCH_ASPEED=y
>> +CONFIG_SYS_TEXT_BASE=0x0
>> +CONFIG_ASPEED_AST2600=y
>> +CONFIG_TARGET_AST2600_QUALCOMM_DC_SCM_V1=y
>> +CONFIG_SYS_MALLOC_F_LEN=0x800
>> +CONFIG_ENV_SIZE=0x10000
>> +CONFIG_ENV_OFFSET=0xE0000
>> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
>> +CONFIG_NR_DRAM_BANKS=1
>> +CONFIG_FIT=y
>> +CONFIG_USE_BOOTARGS=y
>> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
>> +CONFIG_USE_BOOTCOMMAND=y
>> +CONFIG_BOOTCOMMAND="bootm 20100000"
>> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
>> +CONFIG_BOARD_LATE_INIT=y
>> +CONFIG_DISPLAY_BOARDINFO_LATE=y
>> +CONFIG_ARCH_EARLY_INIT_R=y
>> +CONFIG_BOARD_EARLY_INIT_F=y
>> +CONFIG_HUSH_PARSER=y
>> +# CONFIG_AUTO_COMPLETE is not set
>> +CONFIG_SYS_PROMPT="ast# "
>> +CONFIG_CMD_BOOTZ=y
>> +# CONFIG_CMD_BOOTEFI is not set
>> +# CONFIG_CMD_ELF is not set
>> +# CONFIG_CMD_IMI is not set
>> +# CONFIG_CMD_XIMG is not set
>> +# CONFIG_CMD_NVEDIT_EFI is not set
>> +CONFIG_CMD_CRC32=y
>> +CONFIG_CRC32_VERIFY=y
>> +# CONFIG_LOOPW is not set
>> +CONFIG_CMD_MD5SUM=y
>> +CONFIG_MD5SUM_VERIFY=y
>> +CONFIG_CMD_MEMINFO=y
>> +CONFIG_CMD_MEMORY=y
>> +CONFIG_CMD_MEMTEST=y
>> +CONFIG_SYS_ALT_MEMTEST=y
>> +CONFIG_CMD_MX_CYCLIC=y
>> +CONFIG_CMD_SHA1SUM=y
>> +CONFIG_SHA1SUM_VERIFY=y
>> +CONFIG_CMD_STRINGS=y
>> +CONFIG_CMD_CLK=y
>> +CONFIG_CMD_GPIO=y
>> +CONFIG_CMD_I2C=y
>> +CONFIG_CMD_MMC=y
>> +CONFIG_CMD_PART=y
>> +CONFIG_CMD_PCI=y
>> +CONFIG_CMD_SF=y
>> +CONFIG_CMD_USB=y
>> +CONFIG_CMD_DHCP=y
>> +CONFIG_CMD_MII=y
>> +CONFIG_CMD_PING=y
>> +CONFIG_CMD_NCSI=y
>> +CONFIG_CMD_EXT2=y
>> +CONFIG_CMD_EXT4=y
>> +CONFIG_CMD_EXT4_WRITE=y
>> +CONFIG_CMD_FAT=y
>> +CONFIG_CMD_FS_GENERIC=y
>> +CONFIG_CMD_MTDPARTS=y
>> +CONFIG_EFI_PARTITION=y
>> +CONFIG_ENV_IS_IN_SPI_FLASH=y
>> +CONFIG_USE_ENV_SPI_BUS=y
>> +CONFIG_ENV_SPI_BUS=0
>> +CONFIG_USE_ENV_SPI_CS=y
>> +CONFIG_ENV_SPI_CS=0
>> +CONFIG_USE_ENV_SPI_MAX_HZ=y
>> +CONFIG_ENV_SPI_MAX_HZ=100000000
>> +CONFIG_NET_RANDOM_ETHADDR=y
>> +CONFIG_REGMAP=y
>> +CONFIG_SYSCON=y
>> +CONFIG_CLK=y
>> +CONFIG_DM_GPIO=y
>> +CONFIG_ASPEED_GPIO=y
>> +CONFIG_DM_I2C=y
>> +CONFIG_SYS_I2C_ASPEED=y
>> +CONFIG_MISC=y
>> +CONFIG_ASPEED_AHBC=y
>> +CONFIG_ASPEED_H2X=y
>> +CONFIG_DM_MMC=y
>> +CONFIG_MMC_SDHCI=y
>> +CONFIG_MMC_SDHCI_ASPEED=y
>> +CONFIG_DM_SPI_FLASH=y
>> +CONFIG_SPI_FLASH=y
>> +CONFIG_SPI_FLASH_GIGADEVICE=y
>> +CONFIG_SPI_FLASH_MACRONIX=y
>> +CONFIG_SPI_FLASH_SPANSION=y
>> +CONFIG_SPI_FLASH_STMICRO=y
>> +CONFIG_SPI_FLASH_WINBOND=y
>> +CONFIG_PHY_BROADCOM=y
>> +CONFIG_PHY_MICREL=y
>> +CONFIG_PHY_MICREL_KSZ90X1=y
>> +CONFIG_PHY_REALTEK=y
>> +CONFIG_PHY_NCSI=y
>> +CONFIG_DM_ETH=y
>> +CONFIG_PHY_GIGE=y
>> +CONFIG_FTGMAC100=y
>> +CONFIG_MDIO=y
>> +CONFIG_PCI=y
>> +CONFIG_DM_PCI=y
>> +CONFIG_PCIE_ASPEED=y
>> +CONFIG_PHY=y
>> +CONFIG_PINCTRL=y
>> +CONFIG_RAM=y
>> +CONFIG_DM_SERIAL=y
>> +CONFIG_SYS_NS16550=y
>> +CONFIG_SPI=y
>> +CONFIG_DM_SPI=y
>> +CONFIG_SYSRESET=y
>> +CONFIG_USB=y
>> +CONFIG_DM_USB=y
>> +CONFIG_USB_EHCI_HCD=y
>> +CONFIG_USB_STORAGE=y
>> +CONFIG_WDT=y
>> +CONFIG_HEXDUMP=y
>> +# CONFIG_GENERATE_SMBIOS_TABLE is not set
>> --
>> 2.25.1
>>
