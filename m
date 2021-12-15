Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F398C478345
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYBh5zV8z3cN3
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=dmjXC1Y9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=benettiengineering.com (client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dmjXC1Y9; dkim-atps=neutral
X-Greylist: delayed 362 seconds by postgrey-1.36 at boromir;
 Wed, 15 Dec 2021 23:19:27 AEDT
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JDZ732nwKz2xsY
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 23:19:26 +1100 (AEDT)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xT8nmW0AHNi3cxT8nmfsor; Wed, 15 Dec 2021 13:12:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639570341; bh=PXUCaT5Hx0rn5dmqCyfyhDzo6R27hhryzLJ94Uw/Eb4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=dmjXC1Y9dA3BGWRHdvdFavMny1CPPzYmbMT3+O6zjWRvpzpyYxAf9Ey4bCqk/mswx
 C3iawEHyT29p11aULoIUal3Re/jYKlHvlCEcbiaVUSQUGW5dc9lxuUI0sxVIiYAQg2
 Y8+z9zgzmSJfIJb5kODpgvt3Nsu9U2XLIUpKvQUVHumnPHcbTpSkmuww1DUofOS3WR
 4IQCVti8RTHiPK7pWGZyc+cZ5KCt76MZddablrQsGUCm/eP3oZCQh/slZfXPCCJbUW
 XJ6wCh5/oSsK0kKqcst9X31n2KHcWTLKaLu+t1xWUgoEYnjEVQ3tKwwyHJSV9m/y3h
 mfRZ6Acuat4yA==
Subject: Re: [PATCH v1 1/9] arm: nuvoton: Add support for Nuvoton NPCM845 BMC
To: Stanley Chu <stanley.chuys@gmail.com>, lukma@denx.de,
 jagan@amarulasolutions.com, andre.przywara@arm.com, festevam@denx.de,
 narmstrong@baylibre.com, pbrobinson@gmail.com, tharvey@gateworks.com,
 christianshewitt@gmail.com, lokeshvutla@ti.com, sjg@chromium.org,
 sr@denx.de, michal.simek@xilinx.com, hs@denx.de, weijie.gao@mediatek.com,
 hannes.schmelzer@br-automation.com, harm.berntsen@nedap.com,
 sebastian.reichel@collabora.com, stephan@gerhold.net, fangyuanseu@gmail.com,
 kettenis@openbsd.org, seanga2@gmail.com, dsankouski@gmail.com,
 vabhav.sharma@nxp.com, bmeng.cn@gmail.com, patrick@blueri.se,
 samuel@sholland.org, mr.bossman075@gmail.com, yschu@nuvoton.com,
 kwliu@nuvoton.com, ctcchien@nuvoton.com, avifishman70@gmail.com,
 tmaimon77@gmail.com
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-2-yschu@nuvoton.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b6ecfd1c-b801-8976-2e55-7b0987e4e8f7@benettiengineering.com>
Date: Wed, 15 Dec 2021 13:12:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215025800.26918-2-yschu@nuvoton.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO1Dim8Y0MI1N6J2+kaKQt5dJ99DalBRRfuSNyC2YB9E9umqtgJxzuAC8/5YHmt7r25+xm0mmwouvIijx7wuOFBBbEZqi8ICUOcUtDtj56lZeeBFvzy/
 cmKrhcan+xcdLrHHP3RqDyFyyxEtUdQIClnnd00/2WqgYYNrk0T7JMhwy8Y7yB4oyN2kWMNK/qRwqoWsv4QbKvp05bAIjmMzzpMW/SFjwFY965F3Nx2/iMpd
 zCP7u/I1vZUBPpoRIH08gmp2DCYCGdEe4NSJuIoSVJHtEF7FtNTLmmuug/fkf9rzaHZS8KRmGQ/KSN9pV5ph74uyjQYxrKAFTBJ9ZyqPSEwaJbSOzjMAUeM4
 6Wi5dmvsBbAepFXhuoRhgHrJ83FzY/85bZUvR6nZv/ALkNtHLstNVw9fqlP2R6yT3L7zA0YXGAVGjJAafrMjWM9vc+DEJDI9wpMSxrW+iRW5E1urR3CsJ87y
 cADfRmecUNxgZ8GLdWFlVDdkpwoY2rj+TrYiE1bHrI1VQ8inTPkrAsu0TLDZyYUD1yD3CXbYMpuvfQGOdXpx+9O12E6MxrnbAT271QXdtxcGbCg+xAgyBHK0
 IyTQ2UPqeEOyPX0t+8n3g63+9b+dxLR1Nd55CC+0b0TvUDrDTeJUZ87p0boo5rtZcNfuA4WN8v9G6Sf8k5+rxN24Tqd9fvwxzS0vUFuuhWZLlpBlXIXHf0aT
 yNY4ca3Ke2Hm2h+O9jsyKUTRogPbBXm47R1+davtBRESNTo6pCYpg37Kd8mmT/gVf9u6b41nqDy4ycuCXEGriDFmbfzWRZBnBqguIH+bzmODWjI9b2VY2X9D
 U9DVrEqZNSotSXFP5/moDHUTziV7jin968qarIDJqvt2AgV/BeXUIX0iTAJEkFe3fFm8LDoQpWL/qlBaX4jJGj7FAOOZ351G2HD566KPx2A6rpw4q9lby6Fj
 Fj8BXJP3Fm4fIrOhUn1hBxRckWR1CJTOJtEkMtJaWqksC32tBmq33PttblZzJbxFuyAM99uJHwAJfGMfwsDxd0OjcACemOfCTzhWoQ6/5H/yLsay5/zwv/eS
 4CTX8WtbPkhINfi48dhyyU3myuB2zrZuZw+ZefQN0IdAaaKwdzXIOqldE1O4zDkMovQz1CyFxS0bgEhDpaA/qP9tZawMlsakwX3h2RHPWXfRP6H8zQZLWnGi
 ne+mQ6zCtLYYDAK5TGzWlqO5cSZOrirjRwNtPp2yT8hoq5eZcyIhxAUNqBmQofpXbcCSlu+Jq+Jzjio+AlPpLqF9MFR1SHI1tTgQ3EZaxwSB4akN0LQ12INT
 XLU4ZGnd
X-Mailman-Approved-At: Fri, 17 Dec 2021 13:39:52 +1100
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
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stanley,

On 15/12/21 03:57, Stanley Chu wrote:
> Add basic support for the Nuvoton NPCM845 BMC.
> 
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>   arch/arm/Kconfig                          |   9 +
>   arch/arm/Makefile                         |   1 +
>   arch/arm/include/asm/arch-npcm8xx/clock.h | 164 ++++++++++++
>   arch/arm/include/asm/arch-npcm8xx/espi.h  |  23 ++
>   arch/arm/include/asm/arch-npcm8xx/gcr.h   | 313 ++++++++++++++++++++++
>   arch/arm/include/asm/arch-npcm8xx/gpio.h  |  11 +
>   arch/arm/include/asm/arch-npcm8xx/rst.h   |  32 +++
>   arch/arm/mach-nuvoton/Kconfig             |  24 ++
>   arch/arm/mach-nuvoton/Makefile            |   1 +
>   arch/arm/mach-nuvoton/npcm8xx/Kconfig     |  18 ++
>   arch/arm/mach-nuvoton/npcm8xx/Makefile    |   1 +
>   arch/arm/mach-nuvoton/npcm8xx/cpu.c       | 170 ++++++++++++

Here ^^^ you setup timer, but it should be a separate driver IMHO. At 
least this is what I've done for imxrt.
Same goes for clock, there is no clock driver and you setup spi clock 
directly inside the same file with npcm_sysintf_init() while that should 
be part of the clock driver.

Also all defines regarding to clocks and peripherals should go into 
their driver.

>   arch/arm/mach-nuvoton/npcm8xx/reset.c     |  51 ++++

Here you've mixed up the architecture(above) and the board(below) in a 
single patch.

>   board/nuvoton/arbel/Kconfig               |  18 ++
>   board/nuvoton/arbel/Makefile              |   1 +
>   board/nuvoton/arbel/arbel.c               |  33 +++
>   include/configs/arbel.h                   |  54 ++++

arbel should be arbel-evk

I stop here, because there could be big changes if others agree.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>   17 files changed, 924 insertions(+)
>   create mode 100644 arch/arm/include/asm/arch-npcm8xx/clock.h
>   create mode 100644 arch/arm/include/asm/arch-npcm8xx/espi.h
>   create mode 100644 arch/arm/include/asm/arch-npcm8xx/gcr.h
>   create mode 100644 arch/arm/include/asm/arch-npcm8xx/gpio.h
>   create mode 100644 arch/arm/include/asm/arch-npcm8xx/rst.h
>   create mode 100644 arch/arm/mach-nuvoton/Kconfig
>   create mode 100644 arch/arm/mach-nuvoton/Makefile
>   create mode 100644 arch/arm/mach-nuvoton/npcm8xx/Kconfig
>   create mode 100644 arch/arm/mach-nuvoton/npcm8xx/Makefile
>   create mode 100644 arch/arm/mach-nuvoton/npcm8xx/cpu.c
>   create mode 100644 arch/arm/mach-nuvoton/npcm8xx/reset.c
>   create mode 100644 board/nuvoton/arbel/Kconfig
>   create mode 100644 board/nuvoton/arbel/Makefile
>   create mode 100644 board/nuvoton/arbel/arbel.c
>   create mode 100644 include/configs/arbel.h
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f7f03837fe..80ec42f6be 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1952,6 +1952,13 @@ config TARGET_XENGUEST_ARM64
>   	select LINUX_KERNEL_IMAGE_HEADER
>   	select XEN_SERIAL
>   	select SSCANF
> +
> +config ARCH_NPCM
> +	bool "Support Nuvoton SoCs"
> +	select DM
> +	select OF_CONTROL
> +	imply CMD_DM
> +
>   endchoice
>   
>   config SUPPORT_PASSING_ATAGS
> @@ -2150,6 +2157,8 @@ source "arch/arm/mach-imx/Kconfig"
>   
>   source "arch/arm/mach-nexell/Kconfig"
>   
> +source "arch/arm/mach-nuvoton/Kconfig"
> +
>   source "board/armltd/total_compute/Kconfig"
>   
>   source "board/bosch/shc/Kconfig"
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index ad757e982e..29a0250ab6 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -92,6 +92,7 @@ machine-$(CONFIG_ARCH_VERSAL)		+= versal
>   machine-$(CONFIG_ARCH_ZYNQ)		+= zynq
>   machine-$(CONFIG_ARCH_ZYNQMP)		+= zynqmp
>   machine-$(CONFIG_ARCH_ZYNQMP_R5)	+= zynqmp-r5
> +machine-$(CONFIG_ARCH_NPCM)		+= nuvoton
>   
>   machdirs := $(patsubst %,arch/arm/mach-%/,$(machine-y))
>   
> diff --git a/arch/arm/include/asm/arch-npcm8xx/clock.h b/arch/arm/include/asm/arch-npcm8xx/clock.h
> new file mode 100644
> index 0000000000..088b536b7b
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-npcm8xx/clock.h
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#ifndef _NPCM_CLOCK_H_
> +#define _NPCM_CLOCK_H_
> +
> +#define NPCM_CLK_BA		0xF0801000
> +enum {
> +	APB1  = 1,
> +	APB2  = 2,
> +	APB3  = 3,
> +	APB4  = 4,
> +	APB5  = 5,
> +	SPI0  = 10,
> +	SPI1  = 11,
> +	SPI3  = 13,
> +	SPIX  = 14,
> +};
> +
> +/* Clock Select Register (CLKSEL) */
> +#define CLKSEL_RCPCKSEL             27
> +#define CLKSEL_RGSEL                25
> +#define CLKSEL_GFXMSEL              21
> +#define CLKSEL_CLKOUTSEL            18
> +#define CLKSEL_PCICKSEL             16
> +#define CLKSEL_ADCCKSEL             14
> +#define CLKSEL_MCCKSEL              12
> +#define CLKSEL_SUCKSEL              10
> +#define CLKSEL_UARTCKSEL            8
> +#define CLKSEL_SDCKSEL              6
> +#define CLKSEL_PIXCKSEL             4
> +#define CLKSEL_CPUCKSEL             0
> +
> +/* Clock Divider Control Register 1 (CLKDIV1) */
> +#define CLKDIV1_ADCCKDIV            28
> +#define CLKDIV1_CLK4DIV             26
> +#define CLKDIV1_PRE_ADCCKDIV        21
> +#define CLKDIV1_UARTDIV             16
> +#define CLKDIV1_MMCCKDIV            11
> +#define CLKDIV1_SPI3CKDIV           6
> +#define CLKDIV1_PCICKDIV            2
> +
> +/* Clock Divider Control Register 2 (CLKDIV2) */
> +#define CLKDIV2_APB4CKDIV           30
> +#define CLKDIV2_APB3CKDIV           28
> +#define CLKDIV2_APB2CKDIV           26
> +#define CLKDIV2_APB1CKDIV           24
> +#define CLKDIV2_APB5CKDIV           22
> +#define CLKDIV2_CLKOUTDIV           16
> +#define CLKDIV2_GFXCKDIV            13
> +#define CLKDIV2_SUCKDIV             8
> +#define CLKDIV2_SU48CKDIV           4
> +
> +/* PLL Control Register 2 (PLLCON2) */
> +#define PLLCON_LOKI                31
> +#define PLLCON_LOKS                30
> +#define PLLCON_FBDV                16
> +#define PLLCON_OTDV2               13
> +#define PLLCON_PWDEN               12
> +#define PLLCON_OTDV1               8
> +#define PLLCON_INDV                0
> +
> +/* CPUCKSEL (CPU/AMBA/MC Clock Source Select Bit) */
> +#define CLKSEL_CPUCKSEL_PLL0        0x00   /* 0 0: PLL0 clock*/
> +#define CLKSEL_CPUCKSEL_PLL1        0x01   /* 0 1: PLL1 clock */
> +#define CLKSEL_CPUCKSEL_CLKREF      0x02   /* 1 0: CLKREF input (25 MHZ, default) */
> +#define CLKSEL_CPUCKSEL_SYSBPCK     0x03   /* 1 1: Bypass clock from pin SYSBPCK */
> +
> +/* UARTCKSEL (Core and Host UART Clock Source Select Bit). */
> +#define CLKSEL_UARTCKSEL_PLL0       0x00  /* 0 0: PLL0    clock. */
> +#define CLKSEL_UARTCKSEL_PLL1       0x01  /* 0 1: PLL1    clock. */
> +#define CLKSEL_UARTCKSEL_CLKREF     0x02  /* 1 0: CLKREF  clock (25 MHZ, default). */
> +#define CLKSEL_UARTCKSEL_PLL2       0x03  /* 1 1: PLL2    clock divided by 2. */
> +
> +/* SDCKSEL (SDHC Clock Source Select Bit). */
> +#define CLKSEL_SDCKSEL_PLL0         0x00   /* 0 0: PLL0    clock.  */
> +#define CLKSEL_SDCKSEL_PLL1         0x01   /* 0 1: PLL1    clock.  */
> +#define CLKSEL_SDCKSEL_CLKREF       0x02   /* 1 0: CLKREF clock (25 MHZ, default).  */
> +#define CLKSEL_SDCKSEL_PLL2         0x03   /* 1 1: PLL2    clock divided by 2.  */
> +
> +/* IP Software Reset Register 1 (IPSRST1), offset 0x20 */
> +#define IPSRST1_USBDEV1             5
> +#define IPSRST1_USBDEV2             8
> +#define IPSRST1_USBDEV3             25
> +#define IPSRST1_USBDEV4             22
> +#define IPSRST1_USBDEV5             23
> +#define IPSRST1_USBDEV6             24
> +#define IPSRST1_GMAC4               21
> +#define IPSRST1_GMAC3               6
> +
> +/* IP Software Reset Register 2 (IPSRST2), offset 0x24 */
> +#define IPSRST2_GMAC1               28
> +#define IPSRST2_GMAC2               25
> +#define IPSRST2_USBHOST1            26
> +#define IPSRST2_SDHC                9
> +#define IPSRST2_MMC                 8
> +
> +/* IP Software Reset Register 3 (IPSRST3), offset 0x34 */
> +#define IPSRST3_USBPHY1             24
> +#define IPSRST3_USBPHY2             25
> +#define IPSRST3_USBHUB              8
> +#define IPSRST3_USBDEV9             7
> +#define IPSRST3_USBDEV8             6
> +#define IPSRST3_USBDEV7             5
> +#define IPSRST3_USBDEV0             4
> +
> +/* IP Software Reset Register 4 (IPSRST4), offset 0x74 */
> +#define IPSRST4_USBHOST2            31
> +#define IPSRST4_USBPHY3             25
> +
> +#define EXT_CLOCK_FREQUENCY_KHZ	    25 * 1000 * 1UL
> +#define EXT_CLOCK_FREQUENCY_MHZ	    25
> +
> +struct clk_ctl {
> +	unsigned int  clken1;
> +	unsigned int  clksel;
> +	unsigned int  clkdiv1;
> +	unsigned int  pllcon0;
> +	unsigned int  pllcon1;
> +	unsigned int  swrstr;
> +	unsigned char res1[0x8];
> +	unsigned int  ipsrst1;
> +	unsigned int  ipsrst2;
> +	unsigned int  clken2;
> +	unsigned int  clkdiv2;
> +	unsigned int  clken3;
> +	unsigned int  ipsrst3;
> +	unsigned int  wd0rcr;
> +	unsigned int  wd1rcr;
> +	unsigned int  wd2rcr;
> +	unsigned int  swrstc1;
> +	unsigned int  swrstc2;
> +	unsigned int  swrstc3;
> +	unsigned int  tiprstc;
> +	unsigned int  pllcon2;
> +	unsigned int  clkdiv3;
> +	unsigned int  corstc;
> +	unsigned int  pllcong;
> +	unsigned int  ahbckfi;
> +	unsigned int  seccnt;
> +	unsigned int  cntr25m;
> +	unsigned int  clken4;
> +	unsigned int  ipsrst4;
> +	unsigned int  busto;
> +	unsigned int  clkdiv4;
> +	unsigned int  wd0rcrb;
> +	unsigned int  wd1rcrb;
> +	unsigned int  wd2rcrb;
> +	unsigned int  swrstc1b;
> +	unsigned int  swrstc2b;
> +	unsigned int  swrstc3b;
> +	unsigned int  tiprstcb;
> +	unsigned int  corstcb;
> +	unsigned int  ipsrstdis1;
> +	unsigned int  ipsrstdis2;
> +	unsigned int  ipsrstdis3;
> +	unsigned int  ipsrstdis4;
> +	unsigned char res2[0x10];
> +	unsigned int  thrtl_cnt;
> +};
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-npcm8xx/espi.h b/arch/arm/include/asm/arch-npcm8xx/espi.h
> new file mode 100644
> index 0000000000..d4de012b02
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-npcm8xx/espi.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _NPCM_ESPI_H_
> +#define _NPCM_ESPI_H_
> +
> +#define NPCM_ESPI_BA		0xF009F000
> +/* Register offsets */
> +#define ESPICFG			0x04
> +#define ESPIHINDP		0x80
> +
> +/* Channel Supported */
> +#define ESPICFG_CHNSUPP_MASK	0x0F
> +#define ESPICFG_CHNSUPP_SHFT	24
> +
> +/* I/O Mode Supported */
> +#define ESPICFG_IOMODE_SHIFT		8
> +#define ESPI_IO_MODE_SINGLE_DUAL_QUAD	3
> +
> +/* Maximum Frequency Supported */
> +#define ESPICFG_MAXFREQ_SHIFT		10
> +#define ESPI_MAX_33_MHZ			2
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-npcm8xx/gcr.h b/arch/arm/include/asm/arch-npcm8xx/gcr.h
> new file mode 100644
> index 0000000000..14a4b2dbfb
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-npcm8xx/gcr.h
> @@ -0,0 +1,313 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#ifndef _NPCM_GCR_H_
> +#define _NPCM_GCR_H_
> +
> +#define NPCM_GCR_BA		0xF0800000
> +/* On-Chip ARBEL NPCM8XX VERSIONS */
> +
> +#define ARBEL_Z1			0x00A35850
> +#define ARBEL_A1			0x04a35850
> +#define ARBEL_NPCM845			0x00000000
> +#define ARBEL_NPCM830			0x00300395
> +#define ARBEL_NPCM810			0x00000220
> +
> +/* Function Lock Register 2 (FLOCKR2) */
> +#define FLOCKR2_MMCRST               12
> +#define FLOCKR2_MMCRSTLK             13
> +#define FLOCKR2_G35DA2P              18
> +
> +/* Power-On Setting Register (PWRON) */
> +#define PWRON_BSPA			4         /* STRAP5 */
> +#define PWRON_SECEN			7         /* STRAP8 */
> +
> +/* Multiple Function Pin Select Register 1 (MFSEL1) */
> +#define MFSEL1_SIRQSE               31
> +#define MFSEL1_IOX1SEL              30
> +#define MFSEL1_HSI2BSEL             29
> +#define MFSEL1_HSI1BSEL             28
> +#define MFSEL1_DVH1SEL              27
> +#define MFSEL1_LPCSEL               26
> +#define MFSEL1_PECIB                25
> +#define MFSEL1_GSPISEL              24
> +#define MFSEL1_SMISEL               22
> +#define MFSEL1_CLKOSEL              21
> +#define MFSEL1_DVOSEL               18
> +#define MFSEL1_KBCICSEL             17
> +#define MFSEL1_R2MDSEL              16
> +#define MFSEL1_R2ERRSEL             15
> +#define MFSEL1_RMII2SEL             14
> +#define MFSEL1_R1MDSEL              13
> +#define MFSEL1_R1ERRSEL             12
> +#define MFSEL1_HSI2ASEL             11
> +#define MFSEL1_HSI1ASEL             10
> +#define MFSEL1_BSPSEL               9
> +#define MFSEL1_SMB2SEL              8
> +#define MFSEL1_SMB1SEL              7
> +#define MFSEL1_SMB0SEL              6
> +#define MFSEL1_HSI2CSEL             5
> +#define MFSEL1_HSI1CSEL             4
> +#define MFSEL1_S0CS1SEL             3
> +#define MFSEL1_SMB5SEL              2
> +#define MFSEL1_SMB4SEL              1
> +#define MFSEL1_SMB3SEL              0
> +
> +/* Multiple Function Pin Select Register 3 (MFSEL3) */
> +#define MFSEL3_DVODEDLY             27
> +#define MFSEL3_DDRDVOSEL            26
> +#define MFSEL3_MMCCDSEL             25
> +#define MFSEL3_BU1SEL               24
> +#define MFSEL3_I3C5SEL              22
> +#define MFSEL3_WDO2SEL              20
> +#define MFSEL3_WDO1SEL              19
> +#define MFSEL3_IOXHSEL              18
> +#define MFSEL3_PCIEPUSE             17
> +#define MFSEL3_CLKRUNSEL            16
> +#define MFSEL3_IOX2SEL              14
> +#define MFSEL3_PSPISEL              13
> +#define MFSEL3_MMC8SEL              11
> +#define MFSEL3_MMCSEL               10
> +#define MFSEL3_RMII1SEL             9
> +#define MFSEL3_SMB15SEL             8
> +#define MFSEL3_SMB14SEL             7
> +#define MFSEL3_SMB13SEL             6
> +#define MFSEL3_SMB12SEL             5
> +#define MFSEL3_SPI1SEL              4
> +#define MFSEL3_FIN1916SELB          3
> +#define MFSEL3_SMB7SEL              2
> +#define MFSEL3_SMB6SEL              1
> +#define MFSEL3_SCISEL               0
> +
> +/* Multiple Function Pin Select Register 4 (MFSEL4) */
> +#define MFSEL4_SMB11DDC             29
> +#define MFSEL4_SXCS1SEL             28
> +#define MFSEL4_SPXSEL               27
> +#define MFSEL4_RG2SEL               24
> +#define MFSEL4_RG2MSEL              23
> +#define MFSEL4_BU2SELB              22
> +#define MFSEL4_SG1MSEL              21
> +#define MFSEL4_SP3QSEL              20
> +#define MFSEL4_S3CS3SEL             19
> +#define MFSEL4_S3CS2SEL             18
> +#define MFSEL4_S3CS1SEL             17
> +#define MFSEL4_SP3SEL               16
> +#define MFSEL4_SP0QSEL              15
> +#define MFSEL4_SMB11SEL             14
> +#define MFSEL4_SMB10SEL             13
> +#define MFSEL4_SMB9SEL              12
> +#define MFSEL4_SMB8SEL              11
> +#define MFSEL4_DBGTRSEL             10
> +#define MFSEL4_CKRQSEL              9
> +#define MFSEL4_ESPISEL              8
> +#define MFSEL4_MMCRSEL              6
> +#define MFSEL4_SD1PSEL              5
> +#define MFSEL4_ROSEL                4
> +#define MFSEL4_ESPIPMESEL           2
> +#define MFSEL4_BSPASEL              1
> +#define MFSEL4_JTAG2SEL             0
> +
> +/* Multiple Function Pin Select Register 5 (MFSEL5) */
> +#define MFSEL5_R3OENSEL             14
> +#define MFSEL5_RMII3SEL             11
> +#define MFSEL5_R2OENSEL             10
> +#define MFSEL5_R1OENSEL             9
> +#define MFSEL5_NSPI1CS3SEL          5
> +#define MFSEL5_NSPI1CS2SEL          4
> +#define MFSEL5_SPI1D23SEL           3
> +#define MFSEL5_NSPI1CS1SEL          0
> +
> +/* Multiple Function Pin Select Register 6 (MFSEL6) */
> +#define MFSEL6_GPIO1836SEL          19
> +#define MFSEL6_FM1SEL               17
> +
> +/* Multiple Function Pin Select Register 7 (MFSEL7) */
> +#define MFSEL7_SMB15SELB            27
> +#define MFSEL7_GPIO1889SEL          25
> +
> +/* USB PHY1 Control Register (USB1PHYCTL) */
> +#define USB1PHYCTL_RS				28
> +/* USB PHY2 Control Register (USB2PHYCTL) */
> +#define USB2PHYCTL_RS				28
> +/* USB PHY2 Control Register (USB3PHYCTL) */
> +#define USB3PHYCTL_RS				28
> +
> +/* Integration Control Register (INTCR) */
> +#define  INTCR_DUDKSMOD             30
> +#define  INTCR_DDC3I                29
> +#define  INTCR_KVMSI                28
> +#define  INTCR_DEHS                 27
> +#define  INTCR_GGPCT2_0             24
> +#define  INTCR_SGC2                 23
> +#define  INTCR_DSNS_TRIG            21
> +#define  INTCR_DAC_SNS              20
> +#define  INTCR_SGC1                 19
> +#define  INTCR_LDDRB                18
> +#define  INTCR_GIRST                17
> +#define  INTCR_DUDKSEN              16
> +#define  INTCR_DACOFF               15
> +#define  INTCR_DACSEL               14
> +#define  INTCR_GFXINT               12
> +#define  INTCR_DACOSOVR             10
> +#define  INTCR_GFXIFDIS             8
> +#define  INTCR_H2RQDIS              9
> +#define  INTCR_H2DISPOFF            8
> +#define  INTCR_GFXINT2              7
> +#define  INTCR_VGAIOEN              6
> +#define  INTCR_PSPIFEN              4
> +#define  INTCR_HIFEN                3
> +#define  INTCR_SMBFEN               2
> +#define  INTCR_MFTFEN               1
> +#define  INTCR_KCSRST_MODE          0
> +
> +/* Integration Control Register (INTCR2) */
> +#define  INTCR2_WDC                   21
> +
> +/* Integration Control Register (INTCR3) */
> +#define  INTCR3_USBLPBK2              31          /* USB loop-backed HOST 1/2 */
> +#define  INTCR3_USBLPBK               24          /* USB loop-backed mode on/off */
> +#define  INTCR3_USBPHY3SW             14          /* 2 bits */
> +#define  INTCR3_USBPHY2SW             12          /* 2 bits */
> +#define  INTCR3_USBPPS                6
> +#define  INTCR3_UHUB_RWUD             5
> +
> +/* Integration Control Register (INTCR4) */
> +#define  INTCR4_GMMAP1                24
> +#define  INTCR4_GMMAP0                16
> +#define  INTCR4_R3EN                  14
> +#define  INTCR4_R2EN                  13
> +#define  INTCR4_R1EN                  12
> +#define  INTCR4_RGMIIREF              6
> +
> +/* I2C Segment Pin Select Register (I2CSEGSEL) */
> +#define I2CSEGSEL_S0DECFG			3
> +#define I2CSEGSEL_S4DECFG			17
> +
> +/* I2C Segment Control Register (I2CSEGCTL) */
> +#define I2CSEGCTL_S0DEN				20
> +#define I2CSEGCTL_S0DWE				21
> +#define I2CSEGCTL_S4DEN				24
> +#define I2CSEGCTL_S4DWE				25
> +#define I2CSEGCTL_INIT_VAL		0x9333F000
> +
> +struct npcm_gcr {
> +	unsigned int  pdid;
> +	unsigned int  pwron;
> +	unsigned int  swstrps;
> +	unsigned int  rsvd1[2];
> +	unsigned int  miscpe;
> +	unsigned int  spldcnt;
> +	unsigned int  rsvd2[1];
> +	unsigned int  flockr2;
> +	unsigned int  flockr3;
> +	unsigned int  rsvd3[3];
> +	unsigned int  a35_mode;
> +	unsigned int  spswc;
> +	unsigned int  intcr;
> +	unsigned int  intsr;
> +	unsigned int  obscr1;
> +	unsigned int  obsdr1;
> +	unsigned int  rsvd4[1];
> +	unsigned int  hifcr;
> +	unsigned int  rsvd5[3];
> +	unsigned int  intcr2;
> +	unsigned int  rsvd6[1];
> +	unsigned int  srcnt;
> +	unsigned int  ressr;
> +	unsigned int  rlockr1;
> +	unsigned int  flockr1;
> +	unsigned int  dscnt;
> +	unsigned int  mdlr;
> +	unsigned int  scrpad_c;
> +	/* scrpad_b: holds the active dram size (value set by bootblock) */
> +	unsigned int  scrpad_b;
> +	unsigned int  rsvd7[4];
> +	unsigned int  daclvlr;
> +	unsigned int  intcr3;
> +	unsigned int  pcirctl;
> +	unsigned int  rsvd8[2];
> +	unsigned int  vsintr;
> +	unsigned int  rsvd9[1];
> +	unsigned int  sd2sur1;
> +	unsigned int  sd2sur2;
> +	unsigned int  sd2irv3;
> +	unsigned int  intcr4;
> +	unsigned int  obscr2;
> +	unsigned int  obsdr2;
> +	unsigned int  rsvd10[5];
> +	unsigned int  i2csegsel;
> +	unsigned int  i2csegctl;
> +	unsigned int  vsrcr;
> +	unsigned int  mlockr;
> +	unsigned int  rsvd11[8];
> +	unsigned int  etsr;
> +	unsigned int  dft1r;
> +	unsigned int  dft2r;
> +	unsigned int  dft3r;
> +	unsigned int  edffsr;
> +	unsigned int  rsvd12[1];
> +	unsigned int  intcrpce3;
> +	unsigned int  intcrpce2;
> +	unsigned int  intcrpce0;
> +	unsigned int  intcrpce1;
> +	unsigned int  dactest;
> +	unsigned int  scrpad;
> +	unsigned int  usb1phyctl;
> +	unsigned int  usb2phyctl;
> +	unsigned int  usb3phyctl;
> +	unsigned int  intsr2;
> +	unsigned int  intcrpce2b;
> +	unsigned int  intcrpce0b;
> +	unsigned int  intcrpce1b;
> +	unsigned int  intcrpce3b;
> +	unsigned int  rsvd13[4];
> +	unsigned int  intcrpce2c;
> +	unsigned int  intcrpce0c;
> +	unsigned int  intcrpce1c;
> +	unsigned int  intcrpce3c;
> +	unsigned int  rsvd14[40];
> +	unsigned int  sd2irv4;
> +	unsigned int  sd2irv5;
> +	unsigned int  sd2irv6;
> +	unsigned int  sd2irv7;
> +	unsigned int  sd2irv8;
> +	unsigned int  sd2irv9;
> +	unsigned int  sd2irv10;
> +	unsigned int  sd2irv11;
> +	unsigned int  rsvd15[8];
> +	unsigned int  mfsel1;
> +	unsigned int  mfsel2;
> +	unsigned int  mfsel3;
> +	unsigned int  mfsel4;
> +	unsigned int  mfsel5;
> +	unsigned int  mfsel6;
> +	unsigned int  mfsel7;
> +	unsigned int  rsvd16[1];
> +	unsigned int  mfsel_lk1;
> +	unsigned int  mfsel_lk2;
> +	unsigned int  mfsel_lk3;
> +	unsigned int  mfsel_lk4;
> +	unsigned int  mfsel_lk5;
> +	unsigned int  mfsel_lk6;
> +	unsigned int  mfsel_lk7;
> +	unsigned int  rsvd17[1];
> +	unsigned int  mfsel_set1;
> +	unsigned int  mfsel_set2;
> +	unsigned int  mfsel_set3;
> +	unsigned int  mfsel_set4;
> +	unsigned int  mfsel_set5;
> +	unsigned int  mfsel_set6;
> +	unsigned int  mfsel_set7;
> +	unsigned int  rsvd18[1];
> +	unsigned int  mfsel_clr1;
> +	unsigned int  mfsel_clr2;
> +	unsigned int  mfsel_clr3;
> +	unsigned int  mfsel_clr4;
> +	unsigned int  mfsel_clr5;
> +	unsigned int  mfsel_clr6;
> +	unsigned int  mfsel_clr7;
> +	};
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-npcm8xx/gpio.h b/arch/arm/include/asm/arch-npcm8xx/gpio.h
> new file mode 100644
> index 0000000000..234a1d3de9
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-npcm8xx/gpio.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#ifndef _NPCM_GPIO_H_
> +#define _NPCM_GPIO_H_
> +
> +#define NPCM_GPIO_BA		0xF0010000
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-npcm8xx/rst.h b/arch/arm/include/asm/arch-npcm8xx/rst.h
> new file mode 100644
> index 0000000000..ffaff50fe2
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-npcm8xx/rst.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _NPCM_RST_H_
> +#define _NPCM_RST_H_
> +
> +enum reset_type {
> +	PORST_TYPE    = 0x01,
> +	CORST_TYPE    = 0x02,
> +	WD0RST_TYPE   = 0x03,
> +	SWR1ST_TYPE   = 0x04,
> +	SWR2ST_TYPE   = 0x05,
> +	SWR3ST_TYPE   = 0x06,
> +	SWR4ST_TYPE   = 0x07,
> +	WD1RST_TYPE   = 0x08,
> +	WD2RST_TYPE   = 0x09,
> +	UNKNOWN_TYPE  = 0x10,
> +};
> +
> +#define PORST 0x80000000
> +#define CORST 0x40000000
> +#define WD0RST 0x20000000
> +#define SWR1ST 0x10000000
> +#define SWR2ST 0x08000000
> +#define SWR3ST 0x04000000
> +#define SWR4ST 0x02000000
> +#define WD1RST 0x01000000
> +#define WD2RST 0x00800000
> +#define RESSR_MASK 0xff800000
> +
> +enum reset_type npcm8xx_reset_reason(void);
> +
> +#endif
> diff --git a/arch/arm/mach-nuvoton/Kconfig b/arch/arm/mach-nuvoton/Kconfig
> new file mode 100644
> index 0000000000..e014dd4b79
> --- /dev/null
> +++ b/arch/arm/mach-nuvoton/Kconfig
> @@ -0,0 +1,24 @@
> +if ARCH_NPCM
> +
> +config SYS_ARCH
> +	default "arm"
> +
> +config SYS_TEXT_BASE
> +	default 0x8000
> +
> +choice
> +	prompt "Nuvoton SoC select"
> +	default ARCH_NPCM8XX
> +
> +config ARCH_NPCM8XX
> +	bool "Support Nuvoton NPCM8xx SoC"
> +	select ARM64
> +	help
> +	  General support for NPCM8xx BMC (Arbel).
> +	  Nuvoton NPCM8xx BMC is based on the Cortex A35.
> +
> +endchoice
> +
> +source "arch/arm/mach-nuvoton/npcm8xx/Kconfig"
> +
> +endif
> diff --git a/arch/arm/mach-nuvoton/Makefile b/arch/arm/mach-nuvoton/Makefile
> new file mode 100644
> index 0000000000..e75689a1a0
> --- /dev/null
> +++ b/arch/arm/mach-nuvoton/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_ARCH_NPCM8XX) += npcm8xx/
> diff --git a/arch/arm/mach-nuvoton/npcm8xx/Kconfig b/arch/arm/mach-nuvoton/npcm8xx/Kconfig
> new file mode 100644
> index 0000000000..478a046ad5
> --- /dev/null
> +++ b/arch/arm/mach-nuvoton/npcm8xx/Kconfig
> @@ -0,0 +1,18 @@
> +if ARCH_NPCM8XX
> +
> +config SYS_CPU
> +	default "armv8"
> +
> +config SYS_SOC
> +	default "npcm8xx"
> +
> +config TARGET_ARBEL_EVB
> +	bool "Arbel-EVB"
> +	help
> +	  ARBEL_EVB is Nuvoton evaluation board for NPCM845 SoC,
> +	  supports general functions of Basebase Management Controller
> +	  (BMC).
> +
> +source "board/nuvoton/arbel/Kconfig"
> +
> +endif
> diff --git a/arch/arm/mach-nuvoton/npcm8xx/Makefile b/arch/arm/mach-nuvoton/npcm8xx/Makefile
> new file mode 100644
> index 0000000000..c62a4aa20a
> --- /dev/null
> +++ b/arch/arm/mach-nuvoton/npcm8xx/Makefile
> @@ -0,0 +1 @@
> +obj-y += reset.o cpu.o
> diff --git a/arch/arm/mach-nuvoton/npcm8xx/cpu.c b/arch/arm/mach-nuvoton/npcm8xx/cpu.c
> new file mode 100644
> index 0000000000..8a7315d535
> --- /dev/null
> +++ b/arch/arm/mach-nuvoton/npcm8xx/cpu.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <cpu_func.h>
> +#include <asm/io.h>
> +#include <asm/arch/gcr.h>
> +#include <asm/arch/espi.h>
> +#include <asm/armv8/mmu.h>
> +#include <asm/system.h>
> +#include <asm/global_data.h>
> +
> +/* System Counter */
> +struct sctr_regs {
> +	u32 cntcr;
> +	u32 cntsr;
> +	u32 cntcv1;
> +	u32 cntcv2;
> +	u32 resv1[4];
> +	u32 cntfid0;
> +	u32 cntfid1;
> +	u32 cntfid2;
> +	u32 resv2[1001];
> +	u32 counterid[1];
> +};
> +
> +#define SC_CNTCR_ENABLE		BIT(0)
> +#define SC_CNTCR_HDBG		BIT(1)
> +#define SC_CNTCR_FREQ0		BIT(8)
> +#define SC_CNTCR_FREQ1		BIT(9)
> +
> +#define SYSCNT_CTRL_BASE_ADDR   0xF07FC000
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +int print_cpuinfo(void)
> +{
> +	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
> +	unsigned int id = 0;
> +	unsigned long mpidr_val = 0;
> +	unsigned int mdlr = 0;
> +
> +	asm volatile("mrs %0, mpidr_el1" : "=r" (mpidr_val));
> +
> +	mdlr = readl(&gcr->mdlr);
> +
> +	printf("CPU-%d: ", (unsigned int)(mpidr_val & 0x3));
> +
> +	switch (mdlr) {
> +	case ARBEL_NPCM845:
> +		printf("NPCM845 ");
> +		break;
> +	case ARBEL_NPCM830:
> +		printf("NPCM830 ");
> +		break;
> +	case ARBEL_NPCM810:
> +		printf("NPCM810 ");
> +		break;
> +	default:
> +		printf("NPCM8XX ");
> +		break;
> +	}
> +
> +	id = readl(&gcr->pdid);
> +	switch (id) {
> +	case ARBEL_Z1:
> +		printf("Z1 @ ");
> +		break;
> +	case ARBEL_A1:
> +		printf("A1 @ ");
> +		break;
> +	default:
> +		printf("Unknown\n");
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static void npcm_sysintf_init(void)
> +{
> +	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
> +	u32 espi_ch_supp, val;
> +
> +	espi_ch_supp = ofnode_conf_read_int("espi-channel-support", 0);
> +
> +	if (espi_ch_supp) {
> +		/* Use eSPI function and initialize ESPICFG */
> +		u32 hindp = 0x00011110 | espi_ch_supp;
> +
> +		writel((readl(&gcr->mfsel4) | (1 << MFSEL4_ESPISEL)), &gcr->mfsel4);
> +		writel(hindp, NPCM_ESPI_BA + ESPIHINDP);
> +		val = readl(NPCM_ESPI_BA + ESPICFG);
> +		val |= ESPI_IO_MODE_SINGLE_DUAL_QUAD << ESPICFG_IOMODE_SHIFT;
> +		val |= ESPI_MAX_33_MHZ << ESPICFG_MAXFREQ_SHIFT;
> +		val |= ((espi_ch_supp & ESPICFG_CHNSUPP_MASK) << ESPICFG_CHNSUPP_SHFT);
> +		writel(val, NPCM_ESPI_BA + ESPICFG);
> +	} else {
> +		/* Use LPC function */
> +		writel((readl(&gcr->mfsel1) | (1 << MFSEL1_LPCSEL)), &gcr->mfsel1);
> +	}
> +}
> +
> +int arch_cpu_init(void)
> +{
> +	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
> +
> +	if (!IS_ENABLED(CONFIG_SYS_DCACHE_OFF)) {
> +		/* enable cache to speed up system running */
> +		if (get_sctlr() & CR_M)
> +			return 0;
> +
> +		icache_enable();
> +		__asm_invalidate_dcache_all();
> +		__asm_invalidate_tlb_all();
> +		set_sctlr(get_sctlr() | CR_C);
> +	}
> +
> +	/* Power voltage select setup */
> +	setbits_le32(&gcr->vsrcr, BIT(30));
> +
> +	npcm_sysintf_init();
> +
> +	return 0;
> +}
> +
> +static struct mm_region npcm_mem_map[1 + CONFIG_NR_DRAM_BANKS + 1] = {
> +	{
> +		/* DRAM */
> +		.phys = 0x0UL,
> +		.virt = 0x0UL,
> +		.size = 0x80000000UL,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
> +			 PTE_BLOCK_INNER_SHARE
> +	},
> +	{
> +		.phys = 0x80000000UL,
> +		.virt = 0x80000000UL,
> +		.size = 0x80000000UL,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	},
> +	{
> +		/* List terminator */
> +		0,
> +	}
> +};
> +
> +struct mm_region *mem_map = npcm_mem_map;
> +
> +int timer_init(void)
> +{
> +	struct sctr_regs *sctr = (struct sctr_regs *)SYSCNT_CTRL_BASE_ADDR;
> +	unsigned int cntfrq_el0;
> +
> +	__asm__ __volatile__("mrs %0, CNTFRQ_EL0\n\t" : "=r" (cntfrq_el0) : : "memory");
> +	writel(cntfrq_el0, &sctr->cntfid0);
> +
> +	clrsetbits_le32(&sctr->cntcr, SC_CNTCR_FREQ0 | SC_CNTCR_FREQ1,
> +			SC_CNTCR_ENABLE | SC_CNTCR_HDBG);
> +
> +	gd->arch.tbl = 0;
> +	gd->arch.tbu = 0;
> +
> +	return 0;
> +}
> diff --git a/arch/arm/mach-nuvoton/npcm8xx/reset.c b/arch/arm/mach-nuvoton/npcm8xx/reset.c
> new file mode 100644
> index 0000000000..7fbed7ba76
> --- /dev/null
> +++ b/arch/arm/mach-nuvoton/npcm8xx/reset.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#include <common.h>
> +#include <asm/io.h>
> +#include <asm/arch/rst.h>
> +#include <asm/arch/gcr.h>
> +
> +void reset_cpu(void)
> +{
> +	/* Watcdog reset - WTCR register set  WTE-BIT7 WTRE-BIT1 WTR-BIT0 */
> +	writel(0x83, 0xf000801c);
> +
> +	while (1)
> +		;
> +}
> +
> +void reset_misc(void)
> +{
> +	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
> +
> +	/* clear WDC */
> +	writel(readl(&gcr->intcr2) & ~(1 << INTCR2_WDC), &gcr->intcr2);
> +}
> +
> +enum reset_type npcm8xx_reset_reason(void)
> +{
> +	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
> +	enum reset_type type = UNKNOWN_TYPE;
> +	u32 value = readl(&gcr->ressr);
> +
> +	if (value == 0)
> +		value = ~readl(&gcr->intcr2);
> +
> +	value &= RESSR_MASK;
> +
> +	if (value & CORST)
> +		type = CORST;
> +	if (value & WD0RST)
> +		type = WD0RST;
> +	if (value & WD1RST)
> +		type = WD1RST;
> +	if (value & WD2RST)
> +		type = WD2RST;
> +	if (value & PORST)
> +		type = PORST;
> +
> +	return type;
> +}
> diff --git a/board/nuvoton/arbel/Kconfig b/board/nuvoton/arbel/Kconfig
> new file mode 100644
> index 0000000000..4a03ea1abf
> --- /dev/null
> +++ b/board/nuvoton/arbel/Kconfig
> @@ -0,0 +1,18 @@
> +if TARGET_ARBEL_EVB
> +
> +config SYS_BOARD
> +	default "arbel"
> +
> +config SYS_VENDOR
> +	default "nuvoton"
> +
> +config SYS_CONFIG_NAME
> +	default "arbel"
> +
> +config SYS_MEM_TOP_HIDE
> +	hex "Reserved TOP memory"
> +	default 0xB000000
> +	help
> +	  Reserve memory for ECC/GFX/VCD/ECE.
> +
> +endif
> diff --git a/board/nuvoton/arbel/Makefile b/board/nuvoton/arbel/Makefile
> new file mode 100644
> index 0000000000..f9ad1dea34
> --- /dev/null
> +++ b/board/nuvoton/arbel/Makefile
> @@ -0,0 +1 @@
> +obj-y	+= arbel.o
> diff --git a/board/nuvoton/arbel/arbel.c b/board/nuvoton/arbel/arbel.c
> new file mode 100644
> index 0000000000..86cef98c5f
> --- /dev/null
> +++ b/board/nuvoton/arbel/arbel.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <asm/io.h>
> +#include <asm/arch/gcr.h>
> +#include <asm/mach-types.h>
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +int board_init(void)
> +{
> +	gd->bd->bi_arch_number = MACH_TYPE_NPCMX50;
> +	gd->bd->bi_boot_params = (CONFIG_SYS_SDRAM_BASE + 0x100UL);
> +
> +	return 0;
> +}
> +
> +int dram_init(void)
> +{
> +	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
> +
> +	/*
> +	 * get dram active size value from bootblock.
> +	 * Value sent using scrpad_02 register.
> +	 */
> +	gd->ram_size = readl(&gcr->scrpad_b);
> +
> +	return 0;
> +}
> diff --git a/include/configs/arbel.h b/include/configs/arbel.h
> new file mode 100644
> index 0000000000..2cb658c3e6
> --- /dev/null
> +++ b/include/configs/arbel.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (c) 2021 Nuvoton Technology Corp.
> + */
> +
> +#ifndef __CONFIG_ARBEL_H
> +#define __CONFIG_ARBEL_H
> +
> +#define CONFIG_GICV2
> +#define GICD_BASE			(0xDFFF9000)
> +#define GICC_BASE			(0xDFFFA000)
> +
> +#define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS   1
> +#define CONFIG_USB_OHCI_NEW
> +#define CONFIG_SETUP_MEMORY_TAGS
> +#define CONFIG_INITRD_TAG
> +#define CONFIG_SYS_MAXARGS              32
> +#define CONFIG_SYS_CBSIZE               256
> +#define CONFIG_SYS_PBSIZE               (CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
> +#define CONFIG_SYS_PROMPT_HUSH_PS2	    "> "
> +#define CONFIG_SYS_BOOTM_LEN            (20 << 20)
> +#define CONFIG_SYS_BOOTMAPSZ            (20 << 20)
> +#define CONFIG_SYS_SDRAM_BASE           0x0
> +#define CONFIG_SYS_INIT_SP_ADDR         (0x00008000 - GENERATED_GBL_DATA_SIZE)
> +#define CONFIG_SYS_MONITOR_LEN          (256 << 10)
> +#define CONFIG_SYS_MONITOR_BASE	        CONFIG_SYS_TEXT_BASE
> +#define CONFIG_BAUDRATE                 115200
> +#define CONFIG_SYS_HZ                   1000
> +#define CONFIG_BITBANGMII_MULTI
> +
> +/* Default environemnt variables */
> +#define CONFIG_BOOTCOMMAND "run common_bootargs; run romboot"
> +#define CONFIG_EXTRA_ENV_SETTINGS   "uimage_flash_addr=80200000\0"   \
> +		"stdin=serial\0"   \
> +		"stdout=serial\0"   \
> +		"stderr=serial\0"    \
> +		"ethact=gmac1\0"   \
> +		"autostart=no\0"   \
> +		"ethaddr=00:00:F7:A0:00:FC\0"    \
> +		"eth1addr=00:00:F7:A0:00:FD\0"   \
> +		"eth2addr=00:00:F7:A0:00:FE\0"    \
> +		"eth3addr=00:00:F7:A0:00:FF\0"    \
> +		"gatewayip=192.168.0.17\0"    \
> +		"serverip=192.168.0.17\0"    \
> +		"ipaddr=192.168.0.15\0"    \
> +		"romboot=echo Booting Kernel from flash at 0x${uimage_flash_addr}; " \
> +		"echo Using bootargs: ${bootargs};bootm ${uimage_flash_addr}\0" \
> +		"earlycon=uart8250,mmio32,0xf0000000\0" \
> +		"console=ttyS0,115200n8\0" \
> +		"common_bootargs=setenv bootargs earlycon=${earlycon} root=/dev/ram " \
> +		"console=${console} ramdisk_size=48000\0" \
> +		"\0"
> +
> +#endif
> 

