Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555031F383
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 02:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhYNC0hJ6z30Qf
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 12:07:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dRsXTrRz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dRsXTrRz; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh8bV1c5kz30KF
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 20:31:17 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id g6so2095329wrs.11
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 01:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VaSKa4DdnHoyZyCFHmPaCow3KCxH2Ne1C09ADbZ1yus=;
 b=dRsXTrRzk7Wc31VNcTbJfc4NgGYL0oYa4TrPkTQZMezCPZJix76Gti85Vp4Yt4U+uY
 qvfk2XL5qC9qgVqCHKJ9gGyJh/v2yDaSoxO5sAkmaNzasrphNDslGJIOOjdGbKAz1QQK
 4xghW/rirIb3npghDbJJSNGXUipsbkyVznUa4nXfrFhP8ZjY8c+Ngpd8ML3l765bhShk
 uP8iWjoRLeekT1gz2uN5nT6zKWr0JErbR50lvlx6YtfOcFshe+PTQqtahpMP8imSEncX
 8m2OjhT/DZN+hMQTXLqi/ott3uA8MLN18PbnxALj4/JHkwpwuvmJoM83JRMCZM5wrFlR
 rwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VaSKa4DdnHoyZyCFHmPaCow3KCxH2Ne1C09ADbZ1yus=;
 b=XJuppka1LSMlCK7V7DzVV7e5SKQjb5EyWu/vp5xvSY9Wk06bQpd1UXe8KZGyioU+5u
 bvERJBtTUw8oez4FfIY+qZbv1JcW3wF/UlXhmU0Mk+7p3DHMKOqvoerfzERJowgFXSzB
 HKz6XAZm4LxgLq3c4EiKgunS50NFaqolOycVBP9ef7MLW6jgcLh4Lfo7QrsKAb3jCuBW
 F55bLpA+yYJ3cYcn6/vAEA4Ryt6S5Cs/kdPNcZ4iQxuNs3NzAUH81m0lWF08b38aybh4
 NZaobrmmnqM6ikBpob2COPNKOMuCKkEB4B7FRL/3BRaCw4qInyXUfhvLohJUJBGzfFTG
 4Hhw==
X-Gm-Message-State: AOAM533BgjdlHfTwcCk60MUnzBbEhsA/AiVgTNqz2NoiomfgLPdhpJR9
 aWUOorSGdX4/qljfXhqTJ5P1ow==
X-Google-Smtp-Source: ABdhPJxE8kmixkGOJBaQqpcOpvjiGzXrQRnCSlhlsVN/0EM3RqJlhWDEhhKX5MEo/csg0r4Y/dUISA==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr3340189wrd.329.1613640671985; 
 Thu, 18 Feb 2021 01:31:11 -0800 (PST)
Received: from dell ([91.110.221.153])
 by smtp.gmail.com with ESMTPSA id m24sm8233954wml.36.2021.02.18.01.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:31:11 -0800 (PST)
Date: Thu, 18 Feb 2021 09:31:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210218093108.GA62231@dell>
References: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
 <YCf4kkMsX+Ymgy6N@lunn.ch>
 <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
 <YCmUOHTtc+j4eLkO@lunn.ch> <20210215084952.GF179940@dell>
 <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210216082046.GA4803@dell>
 <20210217100830.50db2195@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217100830.50db2195@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailman-Approved-At: Fri, 19 Feb 2021 12:07:43 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Kumar <rajeev-dlh.kumar@st.com>, Jan Kotas <jank@cadence.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-omap@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Loc Ho <lho@apm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Woodruff <r-woodruff2@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 17 Feb 2021, Jakub Kicinski wrote:

> On Tue, 16 Feb 2021 08:20:46 +0000 Lee Jones wrote:
> > On Mon, 15 Feb 2021, Jakub Kicinski wrote:
> > > On Mon, 15 Feb 2021 08:49:52 +0000 Lee Jones wrote:  
> > > > Yes, please share.  
> > > 
> > > https://github.com/kuba-moo/nipa  
> > 
> > Thanks for this.
> > 
> > Oh, I see.  So you conduct tests locally, then post them up in a
> > section called 'Checks' using the provided API.  
> 
> For some definition of "locally" - NIPA runs on a rented VM.

Right.  Infrastructure that you control vs by Patchwork.

> > I assume that Patchwork does not alert the user when something has
> > gone awry?  Is this something Nipa does?
> 
> The way we run it on netdev is maintainer-centric, IOW we see 
> the failures in patchwork and complain to people manually.
> The netdev mailing list gets too many messages as is, if NIPA 
> responded with results automatically (which is not that hard
> technically) my concern is that people would be more likely to
> send untested patches to the mailing list and rely on the bot.

That makes sense.  Thank you for the explanation.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
