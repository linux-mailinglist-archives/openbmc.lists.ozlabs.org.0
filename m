Return-Path: <openbmc+bounces-382-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43457B0A1E5
	for <lists+openbmc@lfdr.de>; Fri, 18 Jul 2025 13:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bk6vw6PlFz2xfR;
	Fri, 18 Jul 2025 21:27:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=180.181.231.80
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752838044;
	cv=none; b=C5updZW9noxBJUvWr7akVrzZR619kDZMCBiJTZuq0oM2mt0W9pipMbf86pXl/nEHBLsXuMu7ZzWZqo0Cbe+OAsLTMJXfzOW0f/mDZyBHNQahcycUkP+Y8GxgE+yDibaBiAQFTsSFV70AHtXdGlNJ8/7415UGS0dJyvHzeD0n98Bv/2Q/IhruVKbp8tq60ylaImGAYUmgoFitiAIg+lIK3zmwtV0C6gk7hGRug3t085boHPln5XBTEkEksh9mINKHW5knofhUaB7UJLOA52Xt/MqUctwYCS49pWe88fjhr4iFCz3Y7NN9a+tGwEccWmXpbREaQ1O+3bQgsA7SjLkbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752838044; c=relaxed/relaxed;
	bh=ZAzXiiY/YIuQ/9uY0l8462fgPlzoh4f7KxWN0ebvqKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT/+wt/SfDft/ibjDpLm3jztiZLj1CCzLMEoLQ+M/2QI4KgwJOQ9T/SoJNEuWtedOBi7gyB3eLSUagFPzfwosluvXZttgcgkF0DH9spluNHO8/BM9onOZr4uxXqeQ6eKnHRX5vRDPJHKQNqDCXWJXR+nXgQrrGTc095qe5YxOGjULIAgOBHkEYHMQYV4vfs17g7jrWQkBRtW0+wqbJCEdHtGKBAk4UamcqDKOYryXCUO7btSeXrtBeBvnYL8jDZGoC/SX7hoe27Y8dnY61J5/V3NfPMrFy0fagx3HhzGiGEGcKu7EJry1aYtGpdT0hzaYqzvdFDm0LT457RW5O5eCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=gl6/Zd5H; dkim-atps=neutral; spf=pass (client-ip=180.181.231.80; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=gl6/Zd5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=180.181.231.80; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 1650 seconds by postgrey-1.37 at boromir; Fri, 18 Jul 2025 21:27:23 AEST
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bk6vv3743z2xWc
	for <openbmc@lists.ozlabs.org>; Fri, 18 Jul 2025 21:27:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZAzXiiY/YIuQ/9uY0l8462fgPlzoh4f7KxWN0ebvqKE=; b=gl6/Zd5HCQjexfoJQ5QZ7wWbAN
	hbTSGnGqU1GFUKmrbFD5jj5vmYPGtEhp2sd/JvCtZM6Ey182276LgB1rE6/Y4aUV+YP9bKd8D1GaR
	zFO93R0YQ/tC9nTkcRMnuZTdZ9Df6EvDXbhwS0lu+KiAp/tqI1sLtvSsK9OUIfEHv9h1Zgc9fUTSy
	FhsdvvJ9w0SYBxvit/U5QBdoDkz+FyLZGvo+Wpy+Ut0aSr8T8A7G2SLLgJJQxnRDa/M20K8u0rMGO
	zTuIwFdckQDDn1z7Fu0M5YEidFHCWP3HUT1OuutOK5JjiGBlgmO95iGw2o9kaSi+0Jbt6qJZK+hZB
	84nBPNsA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uciYM-007yZr-27;
	Fri, 18 Jul 2025 18:58:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Jul 2025 20:58:55 +1000
Date: Fri, 18 Jul 2025 20:58:55 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Hadar Gat <hadar.gat@arm.com>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Marek Vasut <marex@denx.de>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 05/80] hwrng: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aHoo71TbepQD2Nsd@gondor.apana.org.au>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 04, 2025 at 10:53:59AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/char/hw_random/atmel-rng.c     | 1 -
>  drivers/char/hw_random/cctrng.c        | 1 -
>  drivers/char/hw_random/mtk-rng.c       | 1 -
>  drivers/char/hw_random/npcm-rng.c      | 1 -
>  drivers/char/hw_random/omap3-rom-rng.c | 1 -
>  drivers/char/hw_random/rockchip-rng.c  | 3 ---
>  drivers/char/hw_random/stm32-rng.c     | 1 -
>  7 files changed, 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

