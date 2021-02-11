Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C070031B34A
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3Gq61Ymz3bcs
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:24:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pGXBmhZf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pGXBmhZf; dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc8S83sChzDsgZ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 08:11:01 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id j11so6726759wmi.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 13:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jS8uFEKJN3Q7z1nnFUZphS+85VjJXUxSu7oHf1ltyB0=;
 b=pGXBmhZfxNzpUj3DU9XcdDqUsNIvFlQva7eCXTEz7Joxs93CRthvAWsMPl1oWP2n/g
 8zadPY+2YOwrErplgbDWZMFrWbWBL1XjQLxrj4iEs/eGplAth/DV6vHCTvETe0cKQcmS
 DnNyvgOUd31g2Xs9O206WfLVjzQQpI/elwoisiJlmKGo0sihidiD+QOJZAeX0aWHphz+
 q/aK/ZU+IID6tZ1cciI7dFecLh3LfdynBqW/QIuhGGLDLfCXBY+FsmX9jpdUs1GJsG7D
 ZlymHM76hmC80hAggXMs4oaui/l/NiVXXlXes79L1BHNy9rGno3L8PVIKwoydaGf9Ra+
 qDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jS8uFEKJN3Q7z1nnFUZphS+85VjJXUxSu7oHf1ltyB0=;
 b=mX52KmwKKxIxQV2fCORTOejRIvuePK6k7AXkUmQGi2V1h6YcpYRHJDKJe8KeSuPIX1
 LlXATtLmum1ltKL2oDK/vMFrok7OfPyXyc9k66q9opWB2H9U9WY8NmRBhN/wz4KWtLFc
 LrygU+BOXMGLu5HAVXMhfpozlhMu8vxIUwGt01gBenMZFEytM2Yan/Jc/JqtwgvEIo2G
 cSGitAR6FzsaNQRAXGTvFGWPU6dQlwl7xG3C49DfwimVh9RdBKQ90nDt7fFFOaNxLiiR
 rwLrpt7OBS7NSGKRKB6P4jqTSNt7sKUB9nFFpJrGeEtjrj3hUtgVJ9UkySzl43BtTmUg
 EZ9A==
X-Gm-Message-State: AOAM530AxpkFVimfWbKUCneDsqvmThAXEuR2/JTENTagyJWu/gNUnkOU
 GGs0LO8tFqwRCR910dcCWenjsA==
X-Google-Smtp-Source: ABdhPJw8JfvQOF+sCQO0uk/DNBEk4iFr6tFX4elV5/TCX1Zcujns/8wiUYi2u3IgXDuQprbG6IFt5Q==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr1885311wmb.134.1613077857539; 
 Thu, 11 Feb 2021 13:10:57 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id f7sm6932559wrm.92.2021.02.11.13.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 13:10:56 -0800 (PST)
Date: Thu, 11 Feb 2021 21:10:54 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210211211054.GD4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
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

> Quoting Lee Jones (2021-01-26 04:45:19)
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > This is the last set.  Clock is clean after this.
> 
> Is it possible to slam in some patch that makes W=1 the default for the
> clk directory? I'm trying to avoid seeing this patch series again.

One of my main goals of this project is that everyone (contributors,
maintainers auto-builder robots etc) will be enabling W=1 builds
*locally*.

This isn't something you'll want to do at a global (i.e. in Mainline)
level.  That's kinda the point of W=1.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
