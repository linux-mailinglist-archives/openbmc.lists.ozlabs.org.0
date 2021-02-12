Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5231B34F
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3JF54nWz3cLv
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:25:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QFvzjb1G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QFvzjb1G; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcSdp08J5zDwwH
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 20:20:24 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id o15so284604wmq.5
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 01:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bqamNlgMJwnX1NfLFZzeEkJ+qDBnsfEzOwlb2Z22/gs=;
 b=QFvzjb1GkmDAeWGmn0HBsLlJ5qWtRzXU3LQZdoxoTZf9a7D0uxaXnwTzEi3yg3K+R6
 0KxRGJAJ40ru1Jy+eFG3H628g1eUsLyx62qGM9QYm3wRfMsp2GN045FaOhN8hM++OVa6
 9FmtkdB8GGwPPcX3fBFQiEzdjM0yiklqoeJZS3RxJdYdeWoU6cxjyqVMcdmt0asZRjlD
 cWNvyF51ci/nq/9S/KpoRK3wKuMMN2LcrjgBWQ355U+hBe1RHZKPgxjejrHDvUIK/QRZ
 UUHuVY3UTJBxhEoGoYvYIDX2kMO8XxAv52ByEvaY6JnnjJacsF9cwmlvuWp1vrsd08GC
 9DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bqamNlgMJwnX1NfLFZzeEkJ+qDBnsfEzOwlb2Z22/gs=;
 b=fZ/4Yo+rHhkWNLYTK8zoS9uw3UEhpcamiWMYKcSouzUhMVBvU5ajkt/fE/JM/kqvm4
 TQ3aHTw9xbTAiH/e5X7nP2cFvfOrsrlY0cjlkkRRpW+qt9CBkv5xO6cGFFxAlEx+Kbb7
 MNxQjCX3Cug1qx67IRgGLw/k16Y4v4PkxeQhwm9i2+L8u7LECAlHXglnOpVWnmrqu+j4
 UPcBBho6iToo1gAhXHDR/GmoSF1xq9SV8FZ1MmKevfGh09fss6iOXHMbE3bX9Ug7nP35
 FmXwmadLBwRqHEbbqk/FCfI40modnQy29AiJgPMB7+tARDcyOvqVJ7fjt5OwZye+lRiI
 eCXQ==
X-Gm-Message-State: AOAM533M0DmEL/Ia7IIs0HvyfFJ5lYC3FtCVfZBshxqhpMPyb80BeTP1
 oOM9US80gFG0/kdjB+qb6R4gdQ==
X-Google-Smtp-Source: ABdhPJzfB+2m0CuwIvKupkk6mtJvy2bOkvYMQcFwy8G4Q2gLr8baAJCjDmApyqiyqqb9nNKw9aR0fQ==
X-Received: by 2002:a1c:113:: with SMTP id 19mr1795873wmb.7.1613121619466;
 Fri, 12 Feb 2021 01:20:19 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id x4sm9178784wrn.64.2021.02.12.01.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 01:20:19 -0800 (PST)
Date: Fri, 12 Feb 2021 09:20:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210212092016.GF4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
X-Mailman-Approved-At: Mon, 15 Feb 2021 10:22:39 +1100
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
 Russell King <linux@armlinux.org.uk>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Loc Ho <lho@apm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Woodruff <r-woodruff2@ti.com>, Tali Perry <tali.perry1@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Tero Kristo <kristo@kernel.org>,
 Rajan Vaja <rajan.vaja@xilinx.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 11 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-11 13:10:54)
> > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > 
> > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > > 
> > > > This is the last set.  Clock is clean after this.
> > > 
> > > Is it possible to slam in some patch that makes W=1 the default for the
> > > clk directory? I'm trying to avoid seeing this patch series again.
> > 
> > One of my main goals of this project is that everyone (contributors,
> > maintainers auto-builder robots etc) will be enabling W=1 builds
> > *locally*.
> > 
> > This isn't something you'll want to do at a global (i.e. in Mainline)
> > level.  That's kinda the point of W=1.
> > 
> 
> Agreed, but is it possible to pass W=1 in the drivers/clk/Makefile?

That would circumvent the point of W=1.  Level-1 warnings are deemed,
and I'm paraphrasing/making this up "not worth rejecting pull-requests
over".  In contrast, if Linus catches any W=0 warnings at pull-time,
he will reject the pull-request as 'untested'.

W=1 is defiantly something you'll want to enable locally though, and
subsequently push back on contributors submitting code adding new
ones.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
