Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707431C435
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 00:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dffy922Wzz30Qv
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 10:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QElcvSo2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QElcvSo2; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfHqL6C3vz30KF
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2021 19:50:03 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id g6so7880992wrs.11
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2021 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/rH+YIEvuGeVBC9R5oz2oGMVMVZR0r1QY2ZB5B8+/9o=;
 b=QElcvSo2Qv1gpUhrggGEBhMfVDFIiJErGnpOzPBq7Y1hK7ebTnUVO4yrQ6+BZToA8P
 LeBi2VldpEIICxzmwlCdbaWUYxgl6A43254lN07jWS9V4f9k9WWMl3zaK59M8ftA8kYi
 FxX6NZUUrIeAX1NqEVylT9X9LJBoMdQeA5ZLZAmVxb4eDMcTioSMerbG6rDRRIQ8wQOg
 GtY3lOmcmeYhT9uG2zWjqTM1DEXVN7Si2ErvqnmxKPq84J1u43yRAQcycmhMRQDJD66c
 r2a1ekDorwBQyIFCtiRmMxy3JCieZeO97HT+zpC69Elq7MWTh5QElJKfDQZjaVcsKQk1
 n5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/rH+YIEvuGeVBC9R5oz2oGMVMVZR0r1QY2ZB5B8+/9o=;
 b=J1GxtvTOvXc6ExEzPr81k6vJKfUVu4xYm8Yzeum3Qm5UBeLnDijzu1Eh9UBbebYi7N
 AG3F008UFtmesRk2gMONn3hnsC0rnvpZ2ahLPiHYf3GgP+jOhYOlihGbJgZacjSefjj2
 j90/XJGMblEvEYYfmaosbzLwKp0KcYhBxqxKPKpbSl/3vR4msIyT6iedoEQbyuc+9zUG
 DxUaS8jX4An5iAJXoLn3HtvGY+2Aetb63gYT5+st4ygtQYB3WKYRRixQTVx1FY/XboJr
 hqQUN4hIvpm3t7A8X4kYTiB+xgvvhQC3VsYtjBecWrjFpMGGtlNCjMrAxIUuZybPcEyA
 tT+Q==
X-Gm-Message-State: AOAM532dgzfRd9QEaEOBR8iBz0hGKdL3XP5pZOaNN2a/eXdLGpqEq9VQ
 avsMPo80+pGId2EXF+kJUnVqHA==
X-Google-Smtp-Source: ABdhPJxhaNjeFloYjkS8tVt5DeKpLQ+BaxHlwfJeH3jEEaYMRN3v4bXqekkv2M0W9w0ynZuJJwcArQ==
X-Received: by 2002:adf:f543:: with SMTP id j3mr17591804wrp.203.1613378995318; 
 Mon, 15 Feb 2021 00:49:55 -0800 (PST)
Received: from dell ([91.110.221.146])
 by smtp.gmail.com with ESMTPSA id p12sm21981604wmq.1.2021.02.15.00.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 00:49:54 -0800 (PST)
Date: Mon, 15 Feb 2021 08:49:52 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210215084952.GF179940@dell>
References: <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell> <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
 <YCf4kkMsX+Ymgy6N@lunn.ch>
 <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
 <YCmUOHTtc+j4eLkO@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCmUOHTtc+j4eLkO@lunn.ch>
X-Mailman-Approved-At: Tue, 16 Feb 2021 10:12:04 +1100
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
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Tomer Maimon <tmaimon77@gmail.com>,
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
 Loc Ho <lho@apm.com>, Jakub Kicinski <kuba@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Richard Woodruff <r-woodruff2@ti.com>,
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

On Sun, 14 Feb 2021, Andrew Lunn wrote:

> On Sun, Feb 14, 2021 at 01:00:42PM -0800, Stephen Boyd wrote:
> > Quoting Andrew Lunn (2021-02-13 08:04:34)
> > > > I'm trying to see if we can make lives better for everyone by exposing
> > > > the warnings by default in the drivers/clk/ directory now that there are
> > > > supposedly none left. Shouldn't we tighten the screws now that we've
> > > > cleaned them?
> > > 
> > > Do you use patchwork? netdev has a bot attached which applies the
> > > patch and does a W=1 build, and will report any new warnings. But it
> > > does not email the developer, as far as i know. It is up to you as the
> > > maintainer to reject the patch and say why.
> > > 
> > 
> > Yes the kernel.org patchwork instance is used but I don't see any bot
> > putting test results there. How is that done?
> > 
> > https://patchwork.kernel.org/project/linux-clk/list/
> 
> Compare this with for example:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20210213175257.28642-1-ap420073@gmail.com/

Oh, that's nice.

> Jakub can explain how he added these checks.

Yes, please share.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
