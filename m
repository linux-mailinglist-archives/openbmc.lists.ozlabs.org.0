Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A807FFBE3
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 21:00:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P/WuL10x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh6Vr1vXHz2yDY
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 07:00:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P/WuL10x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh6VF6Yhkz3cR3
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 06:59:47 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9b9191722so18234381fa.1
        for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 11:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701374375; x=1701979175; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VOrjiusb1CkTjaA85Fcf3elk7qFz3xbmkdXxylcNE28=;
        b=P/WuL10xilJ41XX6siJDo9EplcQKA94KWT7/A03TzA8Y05lGPeadxFonBzWJGJj6Ba
         anT8guiEW8FXGZs/9ylJZ/7KHzwskH5CvQ1DvP8rcH0vYvHgAl0E6KflwbRslRteby1G
         OM4ZAJRcdebXL1yId4/myvdy2gwZhzN+6Fc4Wu08MogtHssD8KHnpW20I+729lvPdQW0
         DVa2UNWMYJYAtqWZq+OfQvdeqLkGSfNL4jkkoP15TsKgHgpIb8UwrO/F3ZyOZ6WDyBgB
         telz8MqaGWIn4UEbvdqqVwqhsw1zqPJV1p8ZgrDZIkX/FZRaRsN8PyNs1LEabpxjfAmw
         Kj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701374375; x=1701979175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOrjiusb1CkTjaA85Fcf3elk7qFz3xbmkdXxylcNE28=;
        b=Y9BrvymSFeMCFtBknvV19YNEDNu9QO+mE+EdH6AStpc4oa5OndjQzfVe0xODWdKBYJ
         DH3QokJC5iBkmmvq+dFn4+YoLAiVdLGuAsK6skP3JbEXSTx+ym0MOhXBRbc67J1RWRWt
         UwMTv0EhldTdwTPpZ7mZmLnmHwKU5X0ET7zvwheJcOBT12CDLEcMmHcUBo0kWOskfUnG
         oNGQheX9Jrz2sZwxvEX9EMHF2QwD5Qc8LOXHs5OMMDlEpJGzfU8BvSGZjIoO6zMP/shR
         TWVDR1lu7fD4XC0i2MMTEf5uLgnkRf3Flz7CxsXT3hN2s4OnCDG7wlI7j5QYNECYNKuG
         vCZQ==
X-Gm-Message-State: AOJu0Yy9UcFY0kdzc4jtekT4DPlqJm66WDWGxI+xz3fmNhIB0ccU/CtC
	H5CB3U0CkQQ+XkeIwV18DPQ=
X-Google-Smtp-Source: AGHT+IHUjij89dN7TIrQl0G91Pfh+h20hbyKUIOT6zGRwQNGTZnnP7/pfZPelhLBC+F8nHc0nEECjw==
X-Received: by 2002:a2e:9219:0:b0:2c9:d874:20c4 with SMTP id k25-20020a2e9219000000b002c9d87420c4mr62616ljg.78.1701374375270;
        Thu, 30 Nov 2023 11:59:35 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id i17-20020a2e8091000000b002b9e5fe86dasm227571ljg.81.2023.11.30.11.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 11:59:34 -0800 (PST)
Date: Thu, 30 Nov 2023 22:59:32 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <xvy2coamb6cl3wcbkl32f6w7kksoxfocyd63t7k7bz4pne2gyx@lktivhqovy7p>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
 <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
 <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, davem@davemloft.net, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, robh+dt@kernel.org, tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com, joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 30, 2023 at 06:26:13PM +0100, Andrew Lunn wrote:
> > I will check with the xpcs maintainer how can we add indirect access
> > to the xpcs module.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
> 
> It creates a regmap for the memory range. On top of that it creates an
> MDIO bus. You can then access the PCS in the normal way.

Actually Synopsys DW XPCS can be synthesized with two types of the CSR
interfaces:
1. MDIO: device looks as a normal MDIO device. This option is currently
   supported by the STMMAC MDIO driver.
2. MCI/APB3: device MMD CSRs are directly (all CSRs are visible) or
   indirectly (paged-base access) accessible over the system memory bus.

In addition to the above XPCS device can be equipped with separate
clock sources (at least to feed the MCI or APB3 interface) and may
have dedicated IRQ line to signal various events like link
establishing, failures, etc. From that perspective XPCS in both cases
looks as a normal platform device for which would be better to have a
special DT-node defined with all those resources supplied. Then the
XPCS DT-node could be passed to the DW MAC DT-node via the already
standardized "pcs-handle" DT-property.

I have such approach implemented in my local repo. If you consider
this as a proper solution, after a small modification I'll be able to
submit a patchset for review tomorrow.

-Serge(y)

> 
> 	Andrew
> 
