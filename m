Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2E3131E3
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 13:12:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4f63TNJzDqSr
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:12:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HwIpaNjw; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXQGl1N5BzDwlR
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 06:19:56 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id v15so8915194wrx.4
 for <openbmc@lists.ozlabs.org>; Fri, 05 Feb 2021 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jKpWYq7VIIL6VYUoIW5OckVXatPGRV104LzvjFGIr1c=;
 b=HwIpaNjwBxYkUwux2fQ5Do8bhE9RIxKGf3pBtqircLjR/ltu3YBNFOqrISVA9cKWcR
 9LZ/kEg7RcmLgK7zzuGM6Ws9pPX2PHkVBWjx7IaAGU/LGoLG4WajR2fEp/7WTQlSp7Ad
 Qm2lM6PHf5+u73jqSb5tFR4dD3MD2z/riun81VWe0cKVIlc0Ddfjp7OiBOmLWFjVOrZF
 EabzDIVnsRVobIqrdK9/T4ed2N0Y+9XPWyFj+AimPzyyzBk+I1nxbBwpskI6zwL8GDSt
 aDbX+8HiSKRQ4DZoeaTXWnA7xfkWaLrWQdZj0Tysv6O9oTbtpPZD6bTpfDxJJNyB+kiD
 Gswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jKpWYq7VIIL6VYUoIW5OckVXatPGRV104LzvjFGIr1c=;
 b=TOxvjO2pj4oYojO9aUr/d/VpSDTsHmp4FsPpajBClcRNEZRHQlEQK0NcFDlWCjGNJc
 ebiLXBNAmz0jEaqWuQ7sWt0C3WveTGkkZlfkOh2ObvMaE10xjmEFvId51D+T7g5VFhiz
 gYl/6Ivy4usVUZQiwYvOgKYVnALYvSdD/7D/U5Yq1B3zsBhWz49OGBv2gSdC90jVBDla
 NjpAnNu3FvXRWWMCH15u/bub2SCgHv0NglwDdUD/ar2aarerhgmZ9830Jfy0u1GG9dYd
 PU8tm61uNn5HehsoRQa7ueH6z1b3lNStwl7+es7yr3RwOGIJOwknPyjnGaZrVOqsKMVO
 i+vw==
X-Gm-Message-State: AOAM5334kDYm2BA4byGLn2pt47MD8ILkFBfoqqxPfM3ko1LbxoN2V+JK
 f5gB1amXGhtqfxbkOJavrp2yig==
X-Google-Smtp-Source: ABdhPJzCBGvv1VGUurr+4N/vSECBVMAquwr4j/9tJjZbqQkfy05JU+uYe9sEdOTVfMMZi1qhBeuO9w==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr6639112wru.304.1612552791820; 
 Fri, 05 Feb 2021 11:19:51 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id k4sm14244388wrm.53.2021.02.05.11.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 11:19:51 -0800 (PST)
Date: Fri, 5 Feb 2021 19:19:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210205191948.GS2789116@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210203083155.GA2329016@dell>
 <161255130506.76967.8682382463883809207@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161255130506.76967.8682382463883809207@swboyd.mtv.corp.google.com>
X-Mailman-Approved-At: Mon, 08 Feb 2021 22:58:06 +1100
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
Cc: P rashant Gaikwad <pgaikwad@nvidia.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Kumar <rajeev-dlh.kumar@st.com>, Jan Kotas <jank@cadence.com>,
 Russell King <linux@armlinux.org.uk>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-omap@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Loc Ho <lho@apm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Woodruff <r-woodruff2@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Tero Kristo <kristo@kernel.org>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 05 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-03 00:31:55)
> > On Tue, 26 Jan 2021, Lee Jones wrote:
> > 
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > > 
> > > This is the last set.  Clock is clean after this.
> > 
> > Out of interest, what normally happens to the patches which aren't
> > picked up by individual driver Maintainers?
> > 
> 
> I have to go in and figure it out! :)

Thanks mate, much obliged.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
