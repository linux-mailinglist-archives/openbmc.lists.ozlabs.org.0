Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF995961B98
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 03:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtnPv1KR2z30T7
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 11:48:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724809726;
	cv=none; b=JHiJWzyWJg37savsoM9fvsjrn53I1+hMGRnOmTGPGc6NaNhz7NvckKNyMbIPdxRIy8MFGrlSX0E+HLUO66UHZgovPZms0MmUEfj5mZ9wS/iZtA+WzC2lVlE7WT4yutHvzPhb7/S8wqrTNByC5nM3QUI4M7XIN4Zjcb+sKpKyV5HR3XAo+FA12HUN368f0pI7Gt1EUhM5jvIsZi2/Pn3XAa+9/kZozvrI0NWPe81K674YiTmj1YFhGZ2DW3zCsyZycVYs02wRcuo2lxuzAacyntrWEyamTPep3YEOexDhmg1hTwjCLpjk8I9JSjzD9KBM56bjo1Di4jhbr9SYOUOYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724809726; c=relaxed/relaxed;
	bh=2MBt+/v5Elo9Ye1w0Hk1+Dsd02K+NBDcBYjisiuiCC4=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=iON1eXC7rXXH17eNjS1SAFaY3U5cnL4BvHHsCyLGsyDuek1temXhsnavd72aMekgOd8G6k6iH1nZJ2tj7tnZ/BQM7vePyESH4LSg6y1wx8dr0U9Zvq4+FEUE3CuegGKKoarlSapHCtdLkPDTeKwWpuZWI3+C1goV+g8zbsszXsMGjO55aVWg0DXpd1Q2iFC9FcVK18YOvIUmi18pwzRmdfikiMzyRd9JAnxJBpKGwjT+/wfHyx+MSLoKt9ejUqAFQw2wZRb+KrDsGYxBcyHRMVDRfgM10YlcwIoSwoTcOYA+13U07BaEQf+Y3etii8FV6sPamM5Tti/H1XgdJjGaZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DzQBNnCs; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DzQBNnCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtnPp0NDPz2xbd
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 11:48:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724809725;
	bh=2MBt+/v5Elo9Ye1w0Hk1+Dsd02K+NBDcBYjisiuiCC4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DzQBNnCsfVIYfprBf5qU3DhXmPpwWTMkMLclNIkEMu7q2bMJIK7sX+oCtF5iJ5gsY
	 RhQ8vZAwBPKByxIZFqn6QGKJzw/Rw9VvAXdFhr9xObT5knccLpUMqoT3nBJYGXpCpn
	 cIeTSWdqbcx+mC351aoZrQtVphgg+esoH6Yiuc/4W1Thxky3oQUev0LrUCSbywDgUF
	 Kpy9AsW/9i06HZRmo0Ao6SasRPOT+WntfuaHqV6mw20txOjr+pDAvPZDpxkUDEZskS
	 zpmo0+TQ9xy3VoR0j9aDQ8Fd/e0L9ODoKK49+jetyb9FEyhNN5rbupxrtiYLLfFkPn
	 Jby5f2lHG3T7A==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 203EC6506F;
	Wed, 28 Aug 2024 09:48:45 +0800 (AWST)
Message-ID: <7b9f4c904b3a6e8775726c071f7fb4831854f352.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v3 3/3] clk: npcm8xx: add clock controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Aug 2024 11:18:44 +0930
In-Reply-To: <20240827133501.3451302-4-tmaimon77@gmail.com>
References: <20240827133501.3451302-1-tmaimon77@gmail.com>
	 <20240827133501.3451302-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-08-27 at 16:35 +0300, Tomer Maimon wrote:
> Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> integrated clock controller which generates and supplies clocks to all
> modules within the BMC.
>=20
> The NPCM8xx clock controller is created using the auxiliary device
> framework and set up in the npcm reset driver since the NPCM8xx clock is
> using the same register region.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>

So checkpatch still warns on this one, though I think whitespace is
less of a problem.

For what it's worth, here's the output I get:

   Executing: ./scripts/checkpatch.pl --strict -g HEAD
   WARNING: please write a help paragraph that fully describes the config s=
ymbol
   #33: FILE: drivers/clk/Kconfig:328:
   +config COMMON_CLK_NPCM8XX
   +       tristate "Clock driver for the NPCM8XX SoC Family"
   +       depends on ARCH_NPCM || COMPILE_TEST
   +       help
   +         This driver supports the clocks on the Nuvoton BMC NPCM8XX SoC=
 Family,
   +         all the clocks are initialized by the bootloader, so this driv=
er
   +         allows only reading of current settings directly from the hard=
ware.
   +
  =20
   WARNING: added, moved or deleted file(s), does MAINTAINERS need updating=
?
   #57:
   new file mode 100644
  =20
   WARNING: line length of 112 exceeds 100 columns
   #252: FILE: drivers/clk/clk-npcm8xx.c:191:
   +       { NPCM8XX_CLKDIV1, 26, 2, "ahb", &hw_pre_clk, CLK_DIVIDER_READ_O=
NLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB },
  =20
   WARNING: line length of 137 exceeds 100 columns
   #257: FILE: drivers/clk/clk-npcm8xx.c:196:
   +       { NPCM8XX_CLKDIV1, 28, 3, "adc", &npcm8xx_pre_divs[0].hw, CLK_DI=
VIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC },
  =20
   WARNING: line length of 107 exceeds 100 columns
   #259: FILE: drivers/clk/clk-npcm8xx.c:198:
   +       { NPCM8XX_CLKDIV1, 11, 5, "mmc", &npcm8xx_muxes[2].hw, CLK_DIVID=
ER_READ_ONLY, 0, NPCM8XX_CLK_MMC },
  =20
   WARNING: line length of 106 exceeds 100 columns
   #261: FILE: drivers/clk/clk-npcm8xx.c:200:
   +       { NPCM8XX_CLKDIV1, 2, 4, "pci", &npcm8xx_muxes[7].hw, CLK_DIVIDE=
R_READ_ONLY, 0, NPCM8XX_CLK_PCI },
  =20
   WARNING: line length of 139 exceeds 100 columns
   #263: FILE: drivers/clk/clk-npcm8xx.c:202:
   +       { NPCM8XX_CLKDIV2, 30, 2, "apb4", &npcm8xx_pre_divs[1].hw, CLK_D=
IVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB4 },
  =20
   WARNING: line length of 139 exceeds 100 columns
   #264: FILE: drivers/clk/clk-npcm8xx.c:203:
   +       { NPCM8XX_CLKDIV2, 28, 2, "apb3", &npcm8xx_pre_divs[1].hw, CLK_D=
IVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB3 },
  =20
   WARNING: line length of 139 exceeds 100 columns
   #265: FILE: drivers/clk/clk-npcm8xx.c:204:
   +       { NPCM8XX_CLKDIV2, 26, 2, "apb2", &npcm8xx_pre_divs[1].hw, CLK_D=
IVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB2 },
  =20
   WARNING: line length of 139 exceeds 100 columns
   #266: FILE: drivers/clk/clk-npcm8xx.c:205:
   +       { NPCM8XX_CLKDIV2, 24, 2, "apb1", &npcm8xx_pre_divs[1].hw, CLK_D=
IVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB1 },
  =20
   WARNING: line length of 139 exceeds 100 columns
   #267: FILE: drivers/clk/clk-npcm8xx.c:206:
   +       { NPCM8XX_CLKDIV2, 22, 2, "apb5", &npcm8xx_pre_divs[1].hw, CLK_D=
IVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB5 },
  =20
   WARNING: line length of 113 exceeds 100 columns
   #268: FILE: drivers/clk/clk-npcm8xx.c:207:
   +       { NPCM8XX_CLKDIV2, 16, 5, "clkout", &npcm8xx_muxes[8].hw, CLK_DI=
VIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT },
  =20
   WARNING: line length of 107 exceeds 100 columns
   #269: FILE: drivers/clk/clk-npcm8xx.c:208:
   +       { NPCM8XX_CLKDIV2, 13, 3, "gfx", &npcm8xx_muxes[7].hw, CLK_DIVID=
ER_READ_ONLY, 0, NPCM8XX_CLK_GFX },
  =20
   WARNING: line length of 112 exceeds 100 columns
   #270: FILE: drivers/clk/clk-npcm8xx.c:209:
   +       { NPCM8XX_CLKDIV2, 8, 5, "usb_bridge", &npcm8xx_muxes[4].hw, CLK=
_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU },
  =20
   WARNING: line length of 112 exceeds 100 columns
   #271: FILE: drivers/clk/clk-npcm8xx.c:210:
   +       { NPCM8XX_CLKDIV2, 4, 4, "usb_host", &npcm8xx_muxes[4].hw, CLK_D=
IVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48 },
  =20
   WARNING: line length of 108 exceeds 100 columns
   #272: FILE: drivers/clk/clk-npcm8xx.c:211:
   +       { NPCM8XX_CLKDIV2, 0, 4, "sdhc", &npcm8xx_muxes[2].hw, CLK_DIVID=
ER_READ_ONLY, 0, NPCM8XX_CLK_SDHC },
  =20
   WARNING: line length of 112 exceeds 100 columns
   #274: FILE: drivers/clk/clk-npcm8xx.c:213:
   +       { NPCM8XX_CLKDIV3, 16, 8, "spi1", &npcm8xx_pre_divs[1].hw, CLK_D=
IVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1 },
  =20
   WARNING: line length of 111 exceeds 100 columns
   #275: FILE: drivers/clk/clk-npcm8xx.c:214:
   +       { NPCM8XX_CLKDIV3, 11, 5, "uart2", &npcm8xx_muxes[3].hw, CLK_DIV=
IDER_READ_ONLY, 0, NPCM8XX_CLK_UART2 },
  =20
   WARNING: line length of 111 exceeds 100 columns
   #276: FILE: drivers/clk/clk-npcm8xx.c:215:
   +       { NPCM8XX_CLKDIV3, 6, 5, "spi0", &npcm8xx_pre_divs[1].hw, CLK_DI=
VIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0 },
  =20
   WARNING: line length of 111 exceeds 100 columns
   #277: FILE: drivers/clk/clk-npcm8xx.c:216:
   +       { NPCM8XX_CLKDIV3, 1, 5, "spix", &npcm8xx_pre_divs[1].hw, CLK_DI=
VIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX },
  =20
   WARNING: line length of 106 exceeds 100 columns
   #279: FILE: drivers/clk/clk-npcm8xx.c:218:
   +       { NPCM8XX_CLKDIV4, 28, 4, "rg", &npcm8xx_muxes[11].hw, CLK_DIVID=
ER_READ_ONLY, 0, NPCM8XX_CLK_RG },
  =20
   WARNING: line length of 108 exceeds 100 columns
   #280: FILE: drivers/clk/clk-npcm8xx.c:219:
   +       { NPCM8XX_CLKDIV4, 12, 4, "rcp", &npcm8xx_muxes[12].hw, CLK_DIVI=
DER_READ_ONLY, 0, NPCM8XX_CLK_RCP },
  =20
   WARNING: line length of 133 exceeds 100 columns
   #282: FILE: drivers/clk/clk-npcm8xx.c:221:
   +       { NPCM8XX_THRTL_CNT, 0, 2, "th", &npcm8xx_muxes[0].hw, CLK_DIVID=
ER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH },
  =20
   WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: =
Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
   #490: FILE: drivers/clk/clk-npcm8xx.c:429:
   +MODULE_LICENSE("GPL v2");
  =20
   total: 0 errors, 24 warnings, 0 checks, 450 lines checked

Andrew
