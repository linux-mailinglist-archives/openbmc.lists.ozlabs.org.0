Return-Path: <openbmc+bounces-221-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF996ADA495
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jn3ZDjz30GV;
	Mon, 16 Jun 2025 09:21:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749900305;
	cv=none; b=aHKcl+gQhO3V4ebv2ldM653JdQPAMU6MWwcG/YFyvUECOKsr9hoz1L4QwM0Qt4N3sf+Sb4TuYemnvyzXdB47p3cvjw4mu30DaPubeW1Zcl4SI6AfoCDzB179v0EjjB/fOBFL1AdQjxENSB9JIiqYNw61MoEtZ+CVpjhrpgj0ZJYOsZFtQ5czlMW/8I7JwhNPg3zs6+JIzXU5g6rOZ4mFzIMjgOiDEu+Vyph3IYW/S030vts+nb0mBbBlXohbMooEV3mMhWBUSN8MSLuIg+8D/2sofpKOKDLv9ajIdn9v4fOah1SKDYh7C/J+C6uWL2hiuyIotNE8ZXAhvSBLgO3thA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749900305; c=relaxed/relaxed;
	bh=RPZ3RlrueAMYij2NSwOGonjmf8MVh3if82AjaQDL10Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3Zvu/tt30euY+QWTbhtcflK+PD3/EdbBxZ5a+KyDmbO294alzQ7536oW0p0x+Ky3zfObscHv3NI3llq7v0il8Cb2mBr1bPviAYbUvuSyn6hL2UenFnLEYDNxpmnBqPVsUGXiLBry8/eFDa17lHOnlWBu8Bz3c/52rwIvC5TM5cRpVnCZnTgNtp19UtjVAaKpEMYYRRESY3YM29gWPNWxRwfJ7kfwM8GrcePYrtepvc7cpGwODFtuhiruCuPc9fLkklx0EZJMs39R2Is+o+ADM3t3Y+SIzceFNRcs9TZmrC7vW0cozXm8/EXeZcsSrGY5gM1YY9p+VAuNbCoj1zYaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (3072-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.ea087b header.b=Lca7QKh6; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (3072-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.ea087b header.b=Lca7QKh6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 463 seconds by postgrey-1.37 at boromir; Sat, 14 Jun 2025 21:25:04 AEST
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKDSw3PL9z2xHZ
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 21:25:04 +1000 (AEST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DCE58240101
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 13:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1749899832;
	bh=d4gNp/0M9SMRUX5Vo9jyFaZjMh959oqzUg9NU3r341s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Lca7QKh6j957WM9z2uGhxtJ0SvljdRqwb2jlCuWb67exWTonQombxmqnjTCtYsFh5
	 6wowc8OD7y1uR6Sw0DHc7nc4rp52t+Rbn3jb8JHD0rUjXbYpYuHB6gfPsHghCVQg1k
	 eoJ2CP6AwhUzFU59QB2uLKmOd0CwOSpJvr0YtHsIyquoZKeJuhyOZNpWCPA4H4ipdP
	 KEYfc6osVgjdgmG7N53P3rDmLbHF3QmOvxWttVVH1aYepo6ts9ge+t/1ITkpW3xiIE
	 OHDYljxwR+Lhl8ZCW+tPbDXSFrQr2DSLCWhJX3lyb+i+/pdDQS+Ax41Ro/PF3TLz9K
	 y2dTiXxYmjplrVYGQDEaSFRCtGqFFCT9vExXL/7K/c1Y2Z6bK2+IJ6VSkVp5GvKZjh
	 Bn/uUwVyKxJfvKsYREBojzFDxPlooV9wHrXo+vNfSvVFZ3+IvmSSjjFfG6mUDw76eY
	 lsDFOq2AlyLTUZ+oeOO8HjF1lzN2TVUesC7UWC4oFZB9vL+7jLv
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bKDHh1hfPz6tsf;
	Sat, 14 Jun 2025 13:17:04 +0200 (CEST)
Date: Sat, 14 Jun 2025 11:17:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Michal Simek <michal.simek@amd.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 06/17] pinctrl: nuvoton: Constify static 'pinctrl_desc'
Message-ID: <aE1aL_ff1230w2DL@probook>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 11, 2025 at 08:13:38AM +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: J. Neuschäfer <j.ne@posteo.net>

Thanks!


> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index dfd32feb34286b7a4d807e9033a11f507e277dce..b8872d8f5930ad931dad208afec4e08a23c3d653 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1817,7 +1817,7 @@ static const struct pinconf_ops npcm7xx_pinconf_ops = {
>  };
>  
>  /* pinctrl_desc */
> -static struct pinctrl_desc npcm7xx_pinctrl_desc = {
> +static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
>  	.name = "npcm7xx-pinctrl",
>  	.pins = npcm7xx_pins,
>  	.npins = ARRAY_SIZE(npcm7xx_pins),
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> index be3db8ab406c416f0709d06eb864e33e3208541a..3c3b9d8d3681c64c21927615e1bb49f157f156b5 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -2299,7 +2299,7 @@ static const struct pinconf_ops npcm8xx_pinconf_ops = {
>  };
>  
>  /* pinctrl_desc */
> -static struct pinctrl_desc npcm8xx_pinctrl_desc = {
> +static const struct pinctrl_desc npcm8xx_pinctrl_desc = {
>  	.name = "npcm8xx-pinctrl",
>  	.pins = npcm8xx_pins,
>  	.npins = ARRAY_SIZE(npcm8xx_pins),
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> index 4264ca749175a2ce0f3603c1d7aa271d98e6cd89..8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -989,7 +989,7 @@ static const struct pinconf_ops wpcm450_pinconf_ops = {
>  	.pin_config_set = wpcm450_config_set,
>  };
>  
> -static struct pinctrl_desc wpcm450_pinctrl_desc = {
> +static const struct pinctrl_desc wpcm450_pinctrl_desc = {
>  	.name = "wpcm450-pinctrl",
>  	.pins = wpcm450_pins,
>  	.npins = ARRAY_SIZE(wpcm450_pins),
> 
> -- 
> 2.45.2
> 

