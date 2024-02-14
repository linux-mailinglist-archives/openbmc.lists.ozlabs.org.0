Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53785573D
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:25:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=yfTWt3rT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvSm34hWz3dV9
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:25:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=yfTWt3rT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a00:1098:ed:100::25; helo=madrid.collaboradmins.com; envelope-from=angelogioacchino.delregno@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 457 seconds by postgrey-1.37 at boromir; Wed, 14 Feb 2024 20:50:57 AEDT
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZYNd24Wnz30YL;
	Wed, 14 Feb 2024 20:50:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707903788;
	bh=/5hVSHktuXKBdFSneU+sqS55ktsDEcZtWY02THLUTWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yfTWt3rThwEwUs2ZhQXKOg/ftYHcebsEIvFiVe9kcFlJsq3PvOoV5aTO1Ut0cTEb+
	 4LpagApuIW8w6OMGDwh/OFgCdSgzZ+Pl6Rvh9l+9Svfv5yZBcmUThzaqS12BLBP986
	 5Kn3zsAPkhY/4Asr5Azpq/DFjitOUdoLq88z5P00ESykYqhZXXvvCD1D/dCizNpyqr
	 CGwG6rXsUKk4C4NvWCi5V7GXqB19sVHXfFTK8P+hlqeIWYS2YU6u7a4G/04Kro5fbX
	 ta9AZTeZatefM84NA0SvCaSfIhCejpWRssvwGIGJRcslQ2YRVm2jbD3uUSjeCVhrf4
	 tXmJ9S86cqstA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 81E293781FEF;
	Wed, 14 Feb 2024 09:43:05 +0000 (UTC)
Message-ID: <50342623-9955-4471-869c-1343abe4a2c0@collabora.com>
Date: Wed, 14 Feb 2024 10:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: Fix dtc interrupt_provider warnings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 15 Feb 2024 10:16:12 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Il 13/02/24 20:34, Rob Herring ha scritto:
> The dtc interrupt_provider warning is off by default. Fix all the warnings
> so it can be enabled.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # 
MediaTek

