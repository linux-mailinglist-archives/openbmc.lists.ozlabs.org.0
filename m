Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 563434BD50C
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:20:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29cL5N2bz3c5g
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:20:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=AODrkKVS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=AODrkKVS; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1gLG3Smzz2yLX
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 20:36:38 +1100 (AEDT)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B88A6402FD
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645349795;
 bh=LePQseFU9KkFZIr2PZSkEhdx+6kX03cW7zQvAw4RWg4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=AODrkKVSrlAuTmNPYvL2FFpkgmqE5Gv6kA0xnIXWLNS/ShSjkApibJjETSi9QTeKd
 8wSIidow2FqxeevrCr2oIBWLAB6J5eIUDZdMJ/Z8uAekHF1amqUH3kw9pK0vkKAUJt
 rbRyl6Vo1gKwRkw83m9byBvtHA1CByqO4jDbORzWxgFUVb/oVIqOv4X541II3FMw6S
 wiKBYC31F7WDiQceCsu17wvL1jl4tKyhjnLHlzTQsJFdBPvBEb+q95bI2miXSN1DAf
 1PxwOkrwh7g0lOSsc9MLQwsXyerQUMUcL3u2wWuQ0Bsfw/jLhCho2/q6w+z7GYnSp6
 uyu8JrOlPa73w==
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so5680807wrg.19
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 01:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LePQseFU9KkFZIr2PZSkEhdx+6kX03cW7zQvAw4RWg4=;
 b=3jrhhMvrUt+2BD2YV5uw3/V74RKGeZ7eVeLldUYn7mQSkre4ts4lngXOhjttTOdiM7
 ZrNTHCEsirmt+k2ojmxMx3C/epvlRwwMmNaLyrR2BLyxRv5MuH/2B2faBLc+FQe3di+B
 VwDSjby0IEuE5OEt9F6srAw+oFZ/uXlZaoxpVy317ML8KhoLj4sND6EUwYg70L9vuZKW
 Zl0jTfvHhX/E3AzbD3U9OMUodOhPluAaDojRwV52iCLTdg4dbWumIoddDpz56FfQvw94
 xDwdM1/CO2avHmOFYQ9YCr97VfFUhpM4edsFje9QJOgDTocyCslZsdotYvreQFZZoGsg
 B5Pg==
X-Gm-Message-State: AOAM532Zepbpm8g019MzbBj3TtPKa3Dd2AYcltrlRst7RBKM7ODBy+6S
 fagwIrh9y+lv3apEl/et/eKwog3/bdH1b6W+s1j6XZHzMedTsfE64kfo1OTg/eN8IEcZfI1lVcL
 ycBjl5f7IH/H6BprfyNVfH/NHUSrPWb8I+6ZX
X-Received: by 2002:a5d:6d0e:0:b0:1e2:fa3d:7f22 with SMTP id
 e14-20020a5d6d0e000000b001e2fa3d7f22mr11961943wrq.142.1645349794254; 
 Sun, 20 Feb 2022 01:36:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwirmZy7S2pWU943BOtjlEkOfxkLQLpQso7yDIB5X+bes0fyRGnOL9B7PBSY3OljiTG2BQN2g==
X-Received: by 2002:a5d:6d0e:0:b0:1e2:fa3d:7f22 with SMTP id
 e14-20020a5d6d0e000000b001e2fa3d7f22mr11961910wrq.142.1645349794068; 
 Sun, 20 Feb 2022 01:36:34 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id l15sm4308967wmi.29.2022.02.20.01.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 01:36:33 -0800 (PST)
Message-ID: <888977e0-03bb-3a6b-eca3-7fbf35f53ffc@canonical.com>
Date: Sun, 20 Feb 2022 10:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 11/11] i2c: npcm: Support NPCM845
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-12-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220035321.3870-12-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20/02/2022 04:53, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig       |  8 +--
>  drivers/i2c/busses/Makefile      |  2 +-
>  drivers/i2c/busses/i2c-npcm7xx.c | 87 ++++++++++++++++++++++----------
>  3 files changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..ab9ee2de5e00 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -817,13 +817,13 @@ config I2C_NOMADIK
>  	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
>  	  as well as the STA2X11 PCIe I/O HUB.
>  
> -config I2C_NPCM7XX
> +config I2C_NPCM
>  	tristate "Nuvoton I2C Controller"
> -	depends on ARCH_NPCM7XX || COMPILE_TEST
> +	depends on ARCH_NPCM || COMPILE_TEST
>  	help
>  	  If you say yes to this option, support will be included for the
> -	  Nuvoton I2C controller, which is available on the NPCM7xx BMC
> -	  controller.
> +	  Nuvoton I2C controller, which is available on the NPCM BMC
> +	  controllers.
>  	  Driver can also support slave mode (select I2C_SLAVE).
>  
>  config I2C_OCORES
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1d00dce77098..01fdf74a5565 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
>  obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
>  obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
>  obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
> -obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
> +obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
>  obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
>  obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
>  obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2cbf9c679aed..b281e0424e3e 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -17,6 +17,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> @@ -91,7 +92,7 @@ enum i2c_addr {
>  
>  /* init register and default value required to enable module */
>  #define NPCM_I2CSEGCTL			0xE4
> -#define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
> +#define NPCM_I2CSEGCTL_INIT_VAL		bus->data->segctl_init_val
>  
>  /* Common regs */
>  #define NPCM_I2CSDA			0x00
> @@ -228,8 +229,7 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
>  #define NPCM_I2CFIF_CTS_CLR_FIFO	BIT(6)
>  #define NPCM_I2CFIF_CTS_SLVRSTR		BIT(7)
>  
> -/* NPCM_I2CTXF_CTL reg fields */
> -#define NPCM_I2CTXF_CTL_TX_THR		GENMASK(4, 0)
> +/* NPCM_I2CTXF_CTL reg field */
>  #define NPCM_I2CTXF_CTL_THR_TXIE	BIT(6)
>  
>  /* NPCM_I2CT_OUT reg fields */
> @@ -238,22 +238,22 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
>  #define NPCM_I2CT_OUT_T_OUTST		BIT(7)
>  
>  /* NPCM_I2CTXF_STS reg fields */
> -#define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(4, 0)
> +#define NPCM_I2CTXF_STS_TX_BYTES	bus->data->txf_sts_tx_bytes

It's not a clean code to use defines for complex types. It's not a
constant anymore, so just use bus->data->txf_sts_tx_bytes directly.

The same in other places.

>  #define NPCM_I2CTXF_STS_TX_THST		BIT(6)
>  

Best regards,
Krzysztof
