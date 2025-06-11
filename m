Return-Path: <openbmc+bounces-162-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE5AD50CA
	for <lists+openbmc@lfdr.de>; Wed, 11 Jun 2025 12:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHLpP3BDYz30GV;
	Wed, 11 Jun 2025 20:03:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=178.79.152.223
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749636221;
	cv=none; b=EIGhdAythUk6qqCHS80UQv3wishEDtVgjjGJcpXtXJU6t3J/iMClNEcV52p6FLpTyBRHmsph1e/UCPQyoKax0knLPeu75dWgjXZKk6ViCVB8OMeBay1mc3qmOxkSNK/eKbiBS5CgQJ615j04bWnvRDd1EpUx+61SoBHbKL50UtjvXh0P5Ws0CDgP+c9ZsggGP/4rTiHtVFW2ZRzPNi2NVmayPEO1wuyfhdGeT9xWfZUIc+XRLLYB6M2V5JJAixpEm2vKV4G41j0RyfeEUkbGScOWsGo8YdZ1TcaJgynVDqKDMC3WX2rXFHS+6XF3q2+BSIXQm3ZX92F6yWkO7q9ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749636221; c=relaxed/relaxed;
	bh=dDt7ez3i6z0BSsshI76a7nThQr3BMVLTBBzfDYTA6pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/uawaYXpKMmepyl0S8lq1C2kQKK3TOtAuvtD7cAA1br26zHzjApD2hcqJQThTHt7Llsal/JlvUHegBF8IJocUMAFLPM0FIi8XVB198u1lt7uzsFil/X73EsUNWkGnn8D86d8XCUCA97WEoMHpruNYIO9trZkI7WVtMQu5qdrrqWO2dzbVqm82gN/q0hMAYHlX46+VcQrnephmC032wAiI9oCIjTNy2lG3ICgHaT/DpUjiCatgXFC55duxXH0WfCb/ZMb1YvU3t5bKBc0dh7kwEY/5feH90odXdk341yX0M5Iix6JKdVa9EAp2rElzAZedIRAQkyljyS7HzNLQk4Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=mleia.com; dkim=pass (2048-bit key; unprotected) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=Jxt6xsAg; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=Jxt6xsAg; dkim-atps=neutral; spf=none (client-ip=178.79.152.223; helo=mail.mleia.com; envelope-from=vz@mleia.com; receiver=lists.ozlabs.org) smtp.mailfrom=mleia.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=Jxt6xsAg;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=Jxt6xsAg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=mleia.com (client-ip=178.79.152.223; helo=mail.mleia.com; envelope-from=vz@mleia.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 550 seconds by postgrey-1.37 at boromir; Wed, 11 Jun 2025 20:03:39 AEST
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHLpM3FCnz2xBb;
	Wed, 11 Jun 2025 20:03:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
	 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
	 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
	 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
	 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
	 fGRPXfFbZHprg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 964313C153A;
	Wed, 11 Jun 2025 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
	 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
	 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
	 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
	 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
	 fGRPXfFbZHprg==
Message-ID: <2ae6aa29-ea42-4fdf-a0ae-8cd088c88786@mleia.com>
Date: Wed, 11 Jun 2025 12:54:21 +0300
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250611_095425_660571_DE75DF41 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message. 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 6/11/25 09:13, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/berlin/berlin.c                    | 2 +-
>   drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>   drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>   drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>   drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>   drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

>   drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>   drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>   drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
> 

--
Best wishes,
Vladimir

