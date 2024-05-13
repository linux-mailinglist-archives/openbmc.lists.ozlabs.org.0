Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999F8C4961
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 00:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdYNR0QCwz3cTl
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 08:01:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.173; helo=mail-pf1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdJ266p7pz2yvr;
	Mon, 13 May 2024 21:59:42 +1000 (AEST)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f4dcc3eeb3so2207446b3a.0;
        Mon, 13 May 2024 04:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601578; x=1716206378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
        b=RtbUfP8D1RXxtp5+Q3pkoXVBail++AvA0Wpwm6rlPmqw+s/GpcYPQZV/RXXvEAojFL
         tORQYdnQyu8nbcXmgfvMsVokIrzy189rq7b4C6T1nyyE5A0pHU6CLGr8RrcP7hafXqBa
         XLpxad9MTA2WsSYB1nruxeBPM6S60mTDo0IMWWnd4oXfaFQTqqq/VYgP1A7uTbC+o5Pd
         g8eIfEj0wiQZKzP0kxVms0HMexsYDHmB+60TIXJs23k1qgbrDs9KqiebW4vhALUBM9ri
         NkFejDY29skQ7eNVJJonrHMqW6jkP+NB62KxAHaGMb1UhcsqSZpHiZaLjyH8GCeBqw0O
         H4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVy5ZZ6pc9vq781OIqShcTJGUiIctmZqBMmZPRRfE00O3QY1IzcqZm1u5YP37HXw7dCLBg/Htu3x/Gtdz5/dt3wGWy+fMJV8YpXaFQyVo+HL/UzPmJT2nuNXHHZ4WNQD9d0O0WRltta
X-Gm-Message-State: AOJu0Yz21YHF9KxConYhNOsW+r/2BBuKf9ET4gTyK/ISt0PGr8jwqwN4
	pgKM7X+HxONi/K/B52SzSDp+VP3AiBMmTHVKl3rYayZ54VppiSMRxbcuVhOW
X-Google-Smtp-Source: AGHT+IF6kJxuhjXdKHPJ7wEjDH/SPY9RQwPo1uK/etuaJI7vID3dD3RC3EzAH7/6h8kkd//FNoYIYA==
X-Received: by 2002:a05:6a21:398a:b0:1af:f875:63b0 with SMTP id adf61e73a8af0-1aff875682bmr2418727637.48.1715601578208;
        Mon, 13 May 2024 04:59:38 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2bccsm7803641b3a.170.2024.05.13.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b273cbbdfdso3356964a91.1;
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsHTa8XP2cRMWCb8xKqrcnpIkfHa3qiDEPT60ZAOEB34BrO8q82gI3tdQEiExQO0vbwLdjzbyPwC4Oykk88H2f9MV/SfDzNf6VkYuL+nFaK2X24Zh5/aGPLBFYVqMvqrdYZjzBQXAE
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 May 2024 08:01:11 +1000
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.h
 uang@starfivetech.com>, linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Peng,

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c

You missed one trivial conversion, presumably because no error handling
and thus no of_node_put() is involved?

@@ -737,13 +737,12 @@ static int rzn1_pinctrl_parse_groups(struct
device_node *np,

 static int rzn1_pinctrl_count_function_groups(struct device_node *np)
 {
-       struct device_node *child;
        int count =3D 0;

        if (of_property_count_u32_elems(np, RZN1_PINS_PROP) > 0)
                count++;

-       for_each_child_of_node(np, child) {
+       for_each_child_of_node_scoped(np, child) {
                if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
                        count++;
        }

If you prefer not to include this, I will send a small patch myself later.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
