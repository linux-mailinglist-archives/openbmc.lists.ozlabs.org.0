Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B957F963E10
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 10:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvYpm5KhSz30WR
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 18:09:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724918974;
	cv=none; b=iqd/ShYTep7JOUlBZx4r2JTfWDptoE5B1yVMmDG/xNcCBzEl2CY6dvB+JXdTG4s93T9yF8xWQhu3kJRQOCqVCaKxstsoVTE4MDbMSfsjve4/+dr8rKU8RY6yshRInHN9wE37YMo19pFT029AehHNDlxxzBBeHp0uwV+uGFZYMZFlR9C1uUCM0vNWFxeNp213fFL4EzdpjRSiJMVKdgrgveSXWJTLOBUWcKtBOKPHbFDVmU+uKVtgasRQSayUuEUdS+4ChG4ov5gLgnG4624VWOsehYJ7+Wo1YAonYmaIO3/opz+6cewAII2yFNg0pWG0vSm2rUOfZw2nIzFSVpHQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724918974; c=relaxed/relaxed;
	bh=KJBbN9/YLlv7DYqiOWb2EItFbjLZaFV1NQ5csSfn3qk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=RMW7aoVb+de9FJq7S/QGWTYmTrE+x+J0ynNny/mBH5ajRyDvHtWF1El2Im7ERFg74SkAmEiCDEIP7ZGx5eP7y6+Xq6a7o//+pspuAvN/pio7IqG6ZJrqDPsbP/YC1BpQyVoyqFT38sJHPASPjgj9xICYnUhZbWIN444Ji6VK9Zzyz4E2EXZ4RA8jrMqMn/uXvLq/SdXmUwfupRmABcn+Fb2TQFbWrL0zNaX56f5m9WQE7ZgXXYeEv1fseOa4i0f/udZqHSEnceAERomX4gQeRuykJNgkRcz7zl/IyM0OnaP7s/wRen6VuR8QItuxPhc1nbCjzYNgtn55jy2S7wfgzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RX8rG+As; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RX8rG+As;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvYpj6w4Xz2ysb
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 18:09:33 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6c0adbbf2eeso3626377b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724918970; x=1725523770; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJBbN9/YLlv7DYqiOWb2EItFbjLZaFV1NQ5csSfn3qk=;
        b=RX8rG+AsD43LHtaOUyNkt/FCsm9Tl3t+jjUlYe3Baq0H2w7wDy7wvXF8k9N7wtKUS6
         LsgynvqZR+J0uwJnQlbz+FMne88eXhbyQHShj/uywqpiGuoR6aLF9VpUSH7iBd6Ofs7I
         5Fumgc8aWqrnqcxTR5xnDQxiFsSdaIBqvix+kzP/hVeCmUL3sQeB0L+TRZ0wLZbbBpkk
         GN2UmQLV4zNLlTOvU6/PPxcRmNi12mqtMBiNeEf9JFuz6kx+qRnFjlTix17PbF/3Ohis
         LDnKJumFeem398vguJturLdJRj+Ul14dHHggyaDkgbiZ7D6ZxZ1H+eNlADIoCJFgl0pY
         u4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918970; x=1725523770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJBbN9/YLlv7DYqiOWb2EItFbjLZaFV1NQ5csSfn3qk=;
        b=u/BJEB/UubS+RObCqkXk9gttItz/ZhHtyO4Tx2m7DfvRnw0XokHV1S8zVZUm+eWh/O
         GQy7F9xS345MNrjJHQ9XvH8UCEw1GYlkAhR+deE/Na4iDXr2SNWKcHYttOcMCMOBf8tZ
         mTggGvWhbaMnI2sOzbKklFX5x6dcKSAC952rbB++XHt2K+KsxQGUmEtFgyGYM743iEa4
         r60XjPAsl+arhBMm3XUyQpgKYhchIO+zUVxVwGTfkKKeKazkLxLCDSvT2uk81msWHOVD
         igJsKqNeL39H2DEpZRZ7GNLN89z9TzJeMYtqdvwWEtklX8++JkmxuG+Vf4EV3lsTjp7I
         /wRw==
X-Gm-Message-State: AOJu0YwXmOV31bHhVIZ6rqm7b6BBLqZV7MLnZJgJuuZP0DDVQMjO+6iD
	Lmr+fvTAmqkvNtdVWN26T6Zsa952hV0N0o+Xigb5pk0j5iGBf8z5y9S18MFB19xlj7p+AkyBJM9
	ozH9MJbre6I35tCNLiMNq9g5NYX8=
X-Google-Smtp-Source: AGHT+IGTQZhLnGaXV//KLc12tTddXhJRPgxpBBwjCy20TNPX5WobJFdahLhca1Xfc4JxhuyO7WILIxnlVVx3WHj/aMY=
X-Received: by 2002:a05:690c:f:b0:6c1:2ea1:c24d with SMTP id
 00721157ae682-6d2769e44ccmr19830747b3.26.1724918970486; Thu, 29 Aug 2024
 01:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240827133501.3451302-1-tmaimon77@gmail.com> <20240827133501.3451302-4-tmaimon77@gmail.com>
 <7b9f4c904b3a6e8775726c071f7fb4831854f352.camel@codeconstruct.com.au> <CAP6Zq1jS6v3UF8D=Knq5rarnbQOAZBgHbOeu2VZe_kvApVFinw@mail.gmail.com>
In-Reply-To: <CAP6Zq1jS6v3UF8D=Knq5rarnbQOAZBgHbOeu2VZe_kvApVFinw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 29 Aug 2024 11:09:19 +0300
Message-ID: <CAP6Zq1hO-fZMvG1sHJGVzF-JCwVwqrMtBGSCAHtVOYjeR1PfBg@mail.gmail.com>
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

the clock maintainer has approved the driver in V3 :-)

So I think we are good to go.

Thanks,

Tomer

On Wed, 28 Aug 2024 at 16:09, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Andrew,
>
> Thanks for your comments,
>
> Send V4 with fixed exceed line length.
>
> Tomer
>
>
> On Wed, 28 Aug 2024 at 04:48, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >
> > On Tue, 2024-08-27 at 16:35 +0300, Tomer Maimon wrote:
> > > Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> > > integrated clock controller which generates and supplies clocks to all
> > > modules within the BMC.
> > >
> > > The NPCM8xx clock controller is created using the auxiliary device
> > > framework and set up in the npcm reset driver since the NPCM8xx clock is
> > > using the same register region.
> > >
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > Tested-by: Benjamin Fair <benjaminfair@google.com>
> >
> > So checkpatch still warns on this one, though I think whitespace is
> > less of a problem.
> >
> > For what it's worth, here's the output I get:
> >
> >    Executing: ./scripts/checkpatch.pl --strict -g HEAD
> >    WARNING: please write a help paragraph that fully describes the config symbol
> >    #33: FILE: drivers/clk/Kconfig:328:
> >    +config COMMON_CLK_NPCM8XX
> >    +       tristate "Clock driver for the NPCM8XX SoC Family"
> >    +       depends on ARCH_NPCM || COMPILE_TEST
> >    +       help
> >    +         This driver supports the clocks on the Nuvoton BMC NPCM8XX SoC Family,
> >    +         all the clocks are initialized by the bootloader, so this driver
> >    +         allows only reading of current settings directly from the hardware.
> >    +
> >
> >    WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> >    #57:
> >    new file mode 100644
> >
> >    WARNING: line length of 112 exceeds 100 columns
> >    #252: FILE: drivers/clk/clk-npcm8xx.c:191:
> >    +       { NPCM8XX_CLKDIV1, 26, 2, "ahb", &hw_pre_clk, CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB },
> >
> >    WARNING: line length of 137 exceeds 100 columns
> >    #257: FILE: drivers/clk/clk-npcm8xx.c:196:
> >    +       { NPCM8XX_CLKDIV1, 28, 3, "adc", &npcm8xx_pre_divs[0].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC },
> >
> >    WARNING: line length of 107 exceeds 100 columns
> >    #259: FILE: drivers/clk/clk-npcm8xx.c:198:
> >    +       { NPCM8XX_CLKDIV1, 11, 5, "mmc", &npcm8xx_muxes[2].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_MMC },
> >
> >    WARNING: line length of 106 exceeds 100 columns
> >    #261: FILE: drivers/clk/clk-npcm8xx.c:200:
> >    +       { NPCM8XX_CLKDIV1, 2, 4, "pci", &npcm8xx_muxes[7].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PCI },
> >
> >    WARNING: line length of 139 exceeds 100 columns
> >    #263: FILE: drivers/clk/clk-npcm8xx.c:202:
> >    +       { NPCM8XX_CLKDIV2, 30, 2, "apb4", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB4 },
> >
> >    WARNING: line length of 139 exceeds 100 columns
> >    #264: FILE: drivers/clk/clk-npcm8xx.c:203:
> >    +       { NPCM8XX_CLKDIV2, 28, 2, "apb3", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB3 },
> >
> >    WARNING: line length of 139 exceeds 100 columns
> >    #265: FILE: drivers/clk/clk-npcm8xx.c:204:
> >    +       { NPCM8XX_CLKDIV2, 26, 2, "apb2", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB2 },
> >
> >    WARNING: line length of 139 exceeds 100 columns
> >    #266: FILE: drivers/clk/clk-npcm8xx.c:205:
> >    +       { NPCM8XX_CLKDIV2, 24, 2, "apb1", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB1 },
> >
> >    WARNING: line length of 139 exceeds 100 columns
> >    #267: FILE: drivers/clk/clk-npcm8xx.c:206:
> >    +       { NPCM8XX_CLKDIV2, 22, 2, "apb5", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB5 },
> >
> >    WARNING: line length of 113 exceeds 100 columns
> >    #268: FILE: drivers/clk/clk-npcm8xx.c:207:
> >    +       { NPCM8XX_CLKDIV2, 16, 5, "clkout", &npcm8xx_muxes[8].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT },
> >
> >    WARNING: line length of 107 exceeds 100 columns
> >    #269: FILE: drivers/clk/clk-npcm8xx.c:208:
> >    +       { NPCM8XX_CLKDIV2, 13, 3, "gfx", &npcm8xx_muxes[7].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_GFX },
> >
> >    WARNING: line length of 112 exceeds 100 columns
> >    #270: FILE: drivers/clk/clk-npcm8xx.c:209:
> >    +       { NPCM8XX_CLKDIV2, 8, 5, "usb_bridge", &npcm8xx_muxes[4].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU },
> >
> >    WARNING: line length of 112 exceeds 100 columns
> >    #271: FILE: drivers/clk/clk-npcm8xx.c:210:
> >    +       { NPCM8XX_CLKDIV2, 4, 4, "usb_host", &npcm8xx_muxes[4].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48 },
> >
> >    WARNING: line length of 108 exceeds 100 columns
> >    #272: FILE: drivers/clk/clk-npcm8xx.c:211:
> >    +       { NPCM8XX_CLKDIV2, 0, 4, "sdhc", &npcm8xx_muxes[2].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SDHC },
> >
> >    WARNING: line length of 112 exceeds 100 columns
> >    #274: FILE: drivers/clk/clk-npcm8xx.c:213:
> >    +       { NPCM8XX_CLKDIV3, 16, 8, "spi1", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1 },
> >
> >    WARNING: line length of 111 exceeds 100 columns
> >    #275: FILE: drivers/clk/clk-npcm8xx.c:214:
> >    +       { NPCM8XX_CLKDIV3, 11, 5, "uart2", &npcm8xx_muxes[3].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART2 },
> >
> >    WARNING: line length of 111 exceeds 100 columns
> >    #276: FILE: drivers/clk/clk-npcm8xx.c:215:
> >    +       { NPCM8XX_CLKDIV3, 6, 5, "spi0", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0 },
> >
> >    WARNING: line length of 111 exceeds 100 columns
> >    #277: FILE: drivers/clk/clk-npcm8xx.c:216:
> >    +       { NPCM8XX_CLKDIV3, 1, 5, "spix", &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX },
> >
> >    WARNING: line length of 106 exceeds 100 columns
> >    #279: FILE: drivers/clk/clk-npcm8xx.c:218:
> >    +       { NPCM8XX_CLKDIV4, 28, 4, "rg", &npcm8xx_muxes[11].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RG },
> >
> >    WARNING: line length of 108 exceeds 100 columns
> >    #280: FILE: drivers/clk/clk-npcm8xx.c:219:
> >    +       { NPCM8XX_CLKDIV4, 12, 4, "rcp", &npcm8xx_muxes[12].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RCP },
> >
> >    WARNING: line length of 133 exceeds 100 columns
> >    #282: FILE: drivers/clk/clk-npcm8xx.c:221:
> >    +       { NPCM8XX_THRTL_CNT, 0, 2, "th", &npcm8xx_muxes[0].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH },
> >
> >    WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> >    #490: FILE: drivers/clk/clk-npcm8xx.c:429:
> >    +MODULE_LICENSE("GPL v2");
> >
> >    total: 0 errors, 24 warnings, 0 checks, 450 lines checked
> >
> > Andrew
