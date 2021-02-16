Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22C31E2A2
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 23:42:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgtBk4VbSz30MG
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 09:42:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V+USs4SN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=V+USs4SN; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dfv7G5Pqsz30J4
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 19:20:55 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id v15so11909405wrx.4
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KKS3mm60WVea5SPhQi4hdtnoG3z+A2HjNVoJZwC0MIY=;
 b=V+USs4SNTFDKkTKblk5EQSbgBy9+OQlZ7dMb5/oxFQ8yc930tIWzrfZeEYnXoEuEUX
 8KyzcXaqo9XY2Pj2wNoXPdWT68qxIxf2c8fhkc9H3Sas+S+8ZEm+VLVTzO0LDz5bk9EF
 rwGKBdpgyBRzhSD762tKTqJ5UwrKtFMj6udokMjDGhrDyuRqSYgyNbyk/xMr0kYHofjD
 rQHOw5KHcQSff1rpA2z+dTbcTpfiPuuwWY9HPH6qq9Rowd/Jw4y5OHSicLNzs27EKLV8
 8cRO/HOFzG3l4CvsDtG8VsV8EVbgs9ikc7BCqoX4peqYpnb9w4ktGh1DH6xiH54NlRCB
 RrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KKS3mm60WVea5SPhQi4hdtnoG3z+A2HjNVoJZwC0MIY=;
 b=mmVcWK45ZqoIbq6e2Sf9HfGnmK1rphWT8y2T/dyRj9KuED/jHUYdVVLxpW/nQIKRio
 9KzEZV8/2zW96Cu4yp1EK/BjqCorThw0IV3grTW8MiMd5Dw/XU5rrT/pBlV0B1jZM0vz
 t1mvJwuUj78CNfAsQaPqhiC8d8cB8SLHwwy7mirjvnNrA5DrLN0rgqvnZjWKR+mOMur2
 1/ECYnZJzd/CdDxfs9FcYY/mpOYVuRI0H1fiJxRr9q60LNtIL1DdJaso2GPotXTBZpAp
 L/i3JTNw6z+QVAYzSKaVrIONF7DONlFae1cLcnEBlIScLG2rRepbDSfykbNTTzf4ZOdC
 H0TA==
X-Gm-Message-State: AOAM530G7VBOVn4C1xwU42b5bIkqm61m74BbXKocTrZ4YcfRoKgg86lq
 wpGqMk7SFB5zTGAxYpALLlR7UQ==
X-Google-Smtp-Source: ABdhPJzmArPGlwjG+vZMBP5b+78FxkLwYjxyYaijAK0x7nUBtsPckPTKlS5li+Bv3M/6zI/ofh8kxw==
X-Received: by 2002:adf:ab11:: with SMTP id q17mr22837604wrc.192.1613463649320; 
 Tue, 16 Feb 2021 00:20:49 -0800 (PST)
Received: from dell ([91.110.221.165])
 by smtp.gmail.com with ESMTPSA id c22sm29673333wrb.91.2021.02.16.00.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 00:20:48 -0800 (PST)
Date: Tue, 16 Feb 2021 08:20:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210216082046.GA4803@dell>
References: <20210212212503.GC179940@dell> <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
 <YCf4kkMsX+Ymgy6N@lunn.ch>
 <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
 <YCmUOHTtc+j4eLkO@lunn.ch> <20210215084952.GF179940@dell>
 <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailman-Approved-At: Thu, 18 Feb 2021 09:42:10 +1100
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

On Mon, 15 Feb 2021, Jakub Kicinski wrote:

> On Mon, 15 Feb 2021 08:49:52 +0000 Lee Jones wrote:
> > > Jakub can explain how he added these checks.  
> > 
> > Yes, please share.
> 
> https://github.com/kuba-moo/nipa

Thanks for this.

Oh, I see.  So you conduct tests locally, then post them up in a
section called 'Checks' using the provided API.  I assume that
Patchwork does not alert the user when something has gone awry?  Is
this something Nipa does?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
