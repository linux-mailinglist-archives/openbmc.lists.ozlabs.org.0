Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2696962847
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 15:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4Wj6yfDz30Tk
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 23:09:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724850591;
	cv=none; b=TJ5gT/7CWWcqJbk+tT6I1stQtzRLwa6C8wS6RBlXWB9opDLAobcQ0NsJLS6mrIVWbYtRaMhj41NpTCeuM6NbGImIeyde8P2GBBsI1b/Ary4AcM0kG3PR4T3xHyf0EORbkAMnIBZLmsDbWq7V3B/IS6qg1C7bNSKT7vsmkOKONcCrO0yUO0JcUcI+NnRw6TTiNSE9cXz+ctwS7+PGpKHQgnMV4UnwcIhngqHtPs02sB019UV25AOV60tSc3uHpmjKi5P8VaVKUeWxJyKeWfgdC9pDt7N+Z6FuBAk0I1nxStnH5Pu2die/F6EIZtuyvVC4Jk5HA1NxnxZEkEt9L6so9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724850591; c=relaxed/relaxed;
	bh=pn+bgosfQGc/U/4A/vvbZfZVsETzq5wXRPVs5CidOvo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=KI8cJUQm/1W32GN+/beT4dFpKKYPn6K7zwtikZDGRgTflBkrJziYRNuxzXcUaUfQMv9jxo7tUfF/hrrovX27/+H+rZGiAosLIR5k4zD4FOg5dgv+Oz/Fu4cH5xZjyGEVfo3IeHcVbLaWM6PO3MmBI/6Ey3f24ieNw4v4ZA+oNyo6YHeVGgplUgM4D9ar4Vi+2zSgs/fvh4Jx5darB2Ejouo9lOfNi/uqOCWEUt27RUqqXSis4NW+0koKnn5Zdta6x0QpxMU421ImZUxxr5prCEby+OWJQRXM5xfVeE9V5+7Ai2yuwc9LnRpy/IVn9oHeyuNTqOgwbsAwJ7qWuQ/o7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lK2r15D3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lK2r15D3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv4Wf3FQ0z2yZZ
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 23:09:49 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6c130ffa0adso66907247b3.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724850586; x=1725455386; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pn+bgosfQGc/U/4A/vvbZfZVsETzq5wXRPVs5CidOvo=;
        b=lK2r15D36ncM2t3wvn+gVQTIJ6o49g9DCcOmJZ+1m9OzbOyUHCgl778fv2Drvzoek1
         +7breRcFUxPV0w8uMCC0/Rr5ymwhhJBbtDr1FPtfWNAcKe+Y+Vw5Po2yIL1DTX2nybRq
         NqpWq6AR1kDqoV4lVzCtyyI5FFZxe0+I3TmKZ4mZc+jnMwqCXvkalbLL0tzzRR2T0jN8
         wpDvuWYJbcKcIPgqyHy8HrgeIoRhL3dUjaIEuWbdrQBG/tYSnAIWf8M9MSUQSOp7c+HT
         hpJlhKfJo4kDezqM1ooYANf23Ty83o16u55IOiKd1WvLbOb6cOQ5unYlO+S0pau5T79p
         rlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724850586; x=1725455386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pn+bgosfQGc/U/4A/vvbZfZVsETzq5wXRPVs5CidOvo=;
        b=Fy0c8UGTA7kiIo/wvnKVE0xSDspNS24a22DjqHkJ4Ij2XO+k9c4+kpW6v0qZi4cNjK
         btDPrYNNDBR6wyIFmC5Uix1dJXRa1YmqdbgLZKcustFtf02xIFtUZyw3P5xKZ+lJIu+r
         MQlaZL52Bh0gDPPtZaEI+VZZC17XNU9Q6r4h0hc0nNXDU7O5zRkbaKd5NpIk+rvUPpXP
         c6QV/eHahmMLOJ8L/0vZgNKtNNhrHiaWVtc8wWXctJwSCFpODLjGFDj5+x8/g7xEtmy6
         SNLRnyhTAkvSCvsTpRL4TVFhzToarQ0ZDbEsu7Ppva0FTSFSYx456l6TuWURf3wvwDs7
         TAEw==
X-Gm-Message-State: AOJu0YyDbaqPtNDk3So6XfnDCHTrvL7VbNlmUmjS5bzBUBB0RrrfzCKo
	E0ZsXc75IZnUVctG1L+BT6kKNTVEdb+2EsUKHlCBo3a2ZZI9+zzkVEg/R/zVAwec/EAUoc/xtsz
	WNt6+Ykl5NFK2ZWL2PSQY+rbp+aOEWA==
X-Google-Smtp-Source: AGHT+IHBIOn/qTKdcEU5wMm2p7AdcljvoX4yR3j5hvJzp7BQdxmMnkpvlbBJSDJRThLv5/KVGqi9LnEoJ6lYDq7IzKA=
X-Received: by 2002:a05:690c:6ac2:b0:6af:fd49:67e0 with SMTP id
 00721157ae682-6d171e6329amr18649317b3.46.1724850586549; Wed, 28 Aug 2024
 06:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240827133501.3451302-1-tmaimon77@gmail.com> <20240827133501.3451302-4-tmaimon77@gmail.com>
 <7b9f4c904b3a6e8775726c071f7fb4831854f352.camel@codeconstruct.com.au>
In-Reply-To: <7b9f4c904b3a6e8775726c071f7fb4831854f352.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 28 Aug 2024 16:09:35 +0300
Message-ID: <CAP6Zq1jS6v3UF8D=Knq5rarnbQOAZBgHbOeu2VZe_kvApVFinw@mail.gmail.com>
Subject: Re: [linux dev-6.6 v3 3/3] clk: npcm8xx: add clock controller
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks for your comments,

Send V4 with fixed exceed line length.

Tomer


On Wed, 28 Aug 2024 at 04:48, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2024-08-27 at 16:35 +0300, Tomer Maimon wrote:
> > Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> > integrated clock controller which generates and supplies clocks to all
> > modules within the BMC.
> >
> > The NPCM8xx clock controller is created using the auxiliary device
> > framework and set up in the npcm reset driver since the NPCM8xx clock is
> > using the same register region.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > Tested-by: Benjamin Fair <benjaminfair@google.com>
>
> So checkpatch still warns on this one, though I think whitespace is
> less of a problem.
>
> For what it's worth, here's the output I get:
>
>    Executing: ./scripts/checkpatch.pl --strict -g HEAD
>    WARNING: please write a help paragraph that fully describes the config symbol
>    #33: FILE: drivers/clk/Kconfig:328:
>    +config COMMON_CLK_NPCM8XX
>    +       tristate "Clock driver for the NPCM8XX SoC Family"
>    +       depends on ARCH_NPCM || COMPILE_TEST
>    +       help
>    +         This driver supports the clocks on the Nuvoton BMC NPCM8XX SoC Family,
>    +         all the clocks are initialized by the bootloader, so this driver
>    +         allows only reading of current settings directly from the hardware.
>    +
>
>    WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>    #57:
>    new file mode 100644
>
>    WARNING: line length of 112 exceeds 100 columns
>    #252: FILE: drivers/clk/clk-npcm8xx.c:191:
>    +       { NPCM8XX_CLKDIV1, 26, 2, "ahb", &hw_pre_clk, CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB },
>
>    WARNING: line length of 137 exceeds 100 columns
>    #257: FILE: drivers/clk/clk-npcm8xx.c:196:
>    +       { NPCM8XX_CLKDIV1, 28, 3, "adc", &npcm8xx_pre_divs[0].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC },
>
>    WARNING: line length of 107 exceeds 100 columns
>    #259: FILE: drivers/clk/clk-npcm8xx.c:198:
>    +       { NPCM8XX_CLKDIV1, 11, 5, "mmc", &npcm8xx_muxes[2].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_MMC },
>
>    WARNING: line length of 106 exceeds 100 columns
>    #261: FILE: drivers/clk/clk-npcm8xx.c:200:
>    +       { NPCM8XX_CLKDIV1, 2, 4, "pci", &npcm8xx_muxes[7].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PCI },
>
>    WARNING: line length of 139 exceeds 100 columns
>    #263: FILE: drivers/clk/clk-npcm8xx.c:202:
>    +       { NPCM8XX_CLKDIV2, 30, 2, "apb4", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB4 },
>
>    WARNING: line length of 139 exceeds 100 columns
>    #264: FILE: drivers/clk/clk-npcm8xx.c:203:
>    +       { NPCM8XX_CLKDIV2, 28, 2, "apb3", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB3 },
>
>    WARNING: line length of 139 exceeds 100 columns
>    #265: FILE: drivers/clk/clk-npcm8xx.c:204:
>    +       { NPCM8XX_CLKDIV2, 26, 2, "apb2", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB2 },
>
>    WARNING: line length of 139 exceeds 100 columns
>    #266: FILE: drivers/clk/clk-npcm8xx.c:205:
>    +       { NPCM8XX_CLKDIV2, 24, 2, "apb1", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB1 },
>
>    WARNING: line length of 139 exceeds 100 columns
>    #267: FILE: drivers/clk/clk-npcm8xx.c:206:
>    +       { NPCM8XX_CLKDIV2, 22, 2, "apb5", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB5 },
>
>    WARNING: line length of 113 exceeds 100 columns
>    #268: FILE: drivers/clk/clk-npcm8xx.c:207:
>    +       { NPCM8XX_CLKDIV2, 16, 5, "clkout", &npcm8xx_muxes[8].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT },
>
>    WARNING: line length of 107 exceeds 100 columns
>    #269: FILE: drivers/clk/clk-npcm8xx.c:208:
>    +       { NPCM8XX_CLKDIV2, 13, 3, "gfx", &npcm8xx_muxes[7].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_GFX },
>
>    WARNING: line length of 112 exceeds 100 columns
>    #270: FILE: drivers/clk/clk-npcm8xx.c:209:
>    +       { NPCM8XX_CLKDIV2, 8, 5, "usb_bridge", &npcm8xx_muxes[4].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU },
>
>    WARNING: line length of 112 exceeds 100 columns
>    #271: FILE: drivers/clk/clk-npcm8xx.c:210:
>    +       { NPCM8XX_CLKDIV2, 4, 4, "usb_host", &npcm8xx_muxes[4].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48 },
>
>    WARNING: line length of 108 exceeds 100 columns
>    #272: FILE: drivers/clk/clk-npcm8xx.c:211:
>    +       { NPCM8XX_CLKDIV2, 0, 4, "sdhc", &npcm8xx_muxes[2].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SDHC },
>
>    WARNING: line length of 112 exceeds 100 columns
>    #274: FILE: drivers/clk/clk-npcm8xx.c:213:
>    +       { NPCM8XX_CLKDIV3, 16, 8, "spi1", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1 },
>
>    WARNING: line length of 111 exceeds 100 columns
>    #275: FILE: drivers/clk/clk-npcm8xx.c:214:
>    +       { NPCM8XX_CLKDIV3, 11, 5, "uart2", &npcm8xx_muxes[3].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART2 },
>
>    WARNING: line length of 111 exceeds 100 columns
>    #276: FILE: drivers/clk/clk-npcm8xx.c:215:
>    +       { NPCM8XX_CLKDIV3, 6, 5, "spi0", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0 },
>
>    WARNING: line length of 111 exceeds 100 columns
>    #277: FILE: drivers/clk/clk-npcm8xx.c:216:
>    +       { NPCM8XX_CLKDIV3, 1, 5, "spix", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX },
>
>    WARNING: line length of 106 exceeds 100 columns
>    #279: FILE: drivers/clk/clk-npcm8xx.c:218:
>    +       { NPCM8XX_CLKDIV4, 28, 4, "rg", &npcm8xx_muxes[11].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RG },
>
>    WARNING: line length of 108 exceeds 100 columns
>    #280: FILE: drivers/clk/clk-npcm8xx.c:219:
>    +       { NPCM8XX_CLKDIV4, 12, 4, "rcp", &npcm8xx_muxes[12].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RCP },
>
>    WARNING: line length of 133 exceeds 100 columns
>    #282: FILE: drivers/clk/clk-npcm8xx.c:221:
>    +       { NPCM8XX_THRTL_CNT, 0, 2, "th", &npcm8xx_muxes[0].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH },
>
>    WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
>    #490: FILE: drivers/clk/clk-npcm8xx.c:429:
>    +MODULE_LICENSE("GPL v2");
>
>    total: 0 errors, 24 warnings, 0 checks, 450 lines checked
>
> Andrew
