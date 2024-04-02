Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23B895FA2
	for <lists+openbmc@lfdr.de>; Wed,  3 Apr 2024 00:34:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mhvzoqMi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8N3b1w5Tz3vdc
	for <lists+openbmc@lfdr.de>; Wed,  3 Apr 2024 09:34:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mhvzoqMi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V86mQ0Zlwz3d2j
	for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2024 23:35:32 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so4749689276.2
        for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2024 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061329; x=1712666129; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=mhvzoqMiiZ9JHFTwocYixF4nYxnGGOtK6SEnWjouxE8+THvz6H3OBdbUjRsuhZDQbP
         Pb8NQZGLkZf7bXWvu8j4Jhjaw30Kkko5UK+qe8iIOlT6bQv3qEDyZlUOakxZtS0M6AF2
         gWNrnsPDv+HrXE3PefCbq5kh5WcfUd8QfzPbhN1Z++prjwpWqDgjl3fiK8gctp/3gqta
         XhLIt9nuTGBo9lsHPGf/DbtQSg0CKKKWwjDcJWQI7gs4ZRS8NWA4J3cX9AJXciXwsW7l
         Z6vcXobYmBwvuCqm4fgFvFz4VMWoFWxcXIIJhijLwUgyYcHGmwZmnPyazmjM+q4t6lvH
         2+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061329; x=1712666129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=BVvZNzJI5GKTAAr78Td4pHXDo3fwmLl8pj/AdAiqn86gb1eiXJ3tskHUdUtaqzaDB7
         4t0UZcxVvmdlsw3U48Z15k8kAdyI4yEo/ydSmyK0rEFkggCPZYTxp8t2OqKjf09uHJZn
         jj/i6yeTH87EYb7iXa2BuIRqQ4ZOr4JlIGNvZiwKvr/Ho50M7lgYV+uAUMAkBxiqbl+e
         zFRulFaW1MUkDo3soY/2kiORUEejxY3ncnvOs21dpOeariDDNHBYbaiVdcd0TxyDKmph
         2nR++aEJScJw8pLUIidlIM3vIEz6sUQL4XsmLcm9C81K3TMAPwaz1wQ5AUwsGalJxJ+1
         9UHw==
X-Forwarded-Encrypted: i=1; AJvYcCX6qoCDoBNyu7J98SKZy3NYdn+KZViKJRweQFGQu6jEu6y8kc1KXmdwpINgl5fQ/JeEXv4g5kK/wls8VSAL6naaQ1GEHXZYp+E=
X-Gm-Message-State: AOJu0YzAFw1e/kCPRyDekV8fVYoiwEnMxEXprgdyCFb3ybjTJvs5+WZD
	seSrr2jtQaqWBW09eJ5EqkYh/JeNp9hStg+3KgfyQS2r0f6IAod0DKRC+d3c8pDwd7bUV6G7qd3
	B7rAwgwM1wI/nN+784f2hXNiaiAvgJMyBA/iY+A==
X-Google-Smtp-Source: AGHT+IG5hxT/EMYnHoU6u7S6MkbvLw5l9U/Ss0P2rks8Fb0m+zQTGqjqkjSlSz0lY1KsLwpjx1moujtIXAN3uBffPV8=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr10687728ybc.29.1712061328813; Tue, 02
 Apr 2024 05:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com> <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:35:17 +0200
Message-ID: <CACRpkdbtRoDtWN4mnyZY_yEfWQFPCQaVudjBki8N1sOXxXWupQ@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Apr 2024 09:33:38 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Michael Ellerman <mpe@ellerman.id.au>, Khalil Blaiech <kblaiech@nvidia.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, chrome-
 platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>, linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@
 rosenzweig.io>, Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@google.com>, Michal Simek <michal.simek@amd.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 2:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
