Return-Path: <openbmc+bounces-69-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A8AC6999
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 14:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6pzM4m49z2yMw;
	Wed, 28 May 2025 22:41:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748436111;
	cv=none; b=jlhUialZLz97qBoyvitzgZq7vx4TcuzgZwHEetgdX0U0Bj4hDOiAUA6vsjrEUa5mRbXhmUr2VoBXGdmw54gXFVPbGo8VeTXa30o7hy6ruS9uPumgnHSyLRWUdHf9Ay9bu15dxznd0C30kIPeQSnJc6nsplRd4mnLewkAXNfuqj8TRDpz3ixqOKGMFSk7reDCFRAMeNUmwLnQAkBd5fNpL49jZ5esk+N4vXcK6DlvWpWIudH2Ude63IxtzM5jsKj2XaIA2t+FOZu2irm1qz5JIQN4u75w5JZl8svoMp9MOjBI6+xveECV4377GBViQC44kf7C77c4/wBX8nO2KGFmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748436111; c=relaxed/relaxed;
	bh=EttMl+UEO23MQ5/zgKZh51X1fkqP6brx9qDrKYFmyoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrUXuX9tOex7lVC9+2dHUholfY/vVjF0uSa3Gbgv+codWHWNY3ttwDZQGyVBU4xRLtCCKrAxpghJgqv5VKvfYJl5GRXxsOmEEeybN6viIMBkStfFeDIHsRSW49beIMMR7UplxXky9TPkA9VTF+G85hkeXXjtSh9q40iQMYz+FKWoEr66HvgKIYVN5WFsT3yJtYwZXNg0HQeupsQlp2wn+tC4MW9HuAB+OoEilg72z9CwTrLqTdZD4p3OpRJ5vPTEfGH+AlAq+b+iZ3HJjEmpuW/6MSTmclIIy0A7o5MiekNlJMVfJTSHu32UbqCe31hlwKyi04p0/pnB3iOVoylGyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.210.177; helo=mail-pf1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.177; helo=mail-pf1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6pzL0s49z2xGv;
	Wed, 28 May 2025 22:41:49 +1000 (AEST)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4454754b3a.2;
        Wed, 28 May 2025 05:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436107; x=1749040907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EttMl+UEO23MQ5/zgKZh51X1fkqP6brx9qDrKYFmyoA=;
        b=JdJm/VgINNu0rSTucH/IB98Vv45acb7mrfaPrTZFOsqAEw18sPJgHtieKN0G5KdKtI
         3Po68HMmxclo9oYfuHYpdfojHE8hKu2J4eHimyUs22/yk/dYhVzdnjdAb0ZCUzwXqJ6G
         muGMqEPbc9OUIIEcTWrfhSUVEoPbsTIJBZXJLJMmPlGmkeIiuSjrecGifxe5a9VSN/dj
         4AOtrFqYCBEGP0590J+jNvss8TCpUBybqciuxzVVuLBrdZTr5J4kf7prawU+AXoz2bt2
         +N4YeQjxGGkcNPdcvzwigW5/pRYbgNYsyr6ZRSwd/IL34w3+cx6qAx6ZYJc3jP+J4gcW
         VSTw==
X-Forwarded-Encrypted: i=1; AJvYcCWflQ7N1Yi72sRyCZBImDpmkw6BYKbh42wpOieUc3Qxv3sRv+6WbEujZGSljkztVasInigY2GMNFw0LeoM=@lists.ozlabs.org, AJvYcCXCPQyjvUMVTsUutSRbrNrg/kZVo/4/+VnYDyrKWRGMQ5s+bKw4If9tY/gTEKR6PzvwrZM/A9xAdg==@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwijgYM9LVf08oY9DQLlwi8kz3Uo6bGbWP9+jx84AWn/W7XmfZ1
	SGc9GqaoQC1r3xEqt1PnelpWxuljKNPM60wrS5cYyUkIpawuqLeW4URL7oBHRVSr
X-Gm-Gg: ASbGncvIpHGJYLKWCiwy2Co6gVqZV3nh0x/WVt25LGQ+Ew0Xwe43iAaaEydQiSaCDs3
	iviMax4Rl5PaEJmWukvDZBZk0Uqs2R4u3883juwAg5uUsHEwsm4j24GmjXi2l6HXQ/5CtxaNzYn
	1OM/mCT6CD4iJCmjkmvHJy19v4kbOFCa+bCrucNDT/iTpKui+tctN+Gbsb7MvgnE9MIp68Yyyoc
	vg5kDFVWQdwTf6qmsKBWiVNn/wtCDw1Uqrs8sgU7CD7jKYG7m3ZbvMIpA0dyL+Xw6nBj4epfZ+R
	YeegL12IZU4CjwlxJwreRZOD413eQOskn+XdJBSKdoavtlN5iNJ11+S6HduBvrtVCT/+1tcSRDJ
	zCIhcoQ07Xt3NsBUNcckqgHz/rk2f
X-Google-Smtp-Source: AGHT+IGBwZRdUn3EHHPqixO/5rLo7GCaIX66zv+ivkjCUrrKDBuFm9eRz4NJpuPyxkCELP+EiHcr4A==
X-Received: by 2002:a17:902:f611:b0:231:d0dc:f2d4 with SMTP id d9443c01a7336-23414f49096mr260841335ad.2.1748436106573;
        Wed, 28 May 2025 05:41:46 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35ac97dsm10850285ad.191.2025.05.28.05.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:41:46 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4454729b3a.2;
        Wed, 28 May 2025 05:41:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0PHCYFYlOslajCtFxqQxDl4lsdisCeXRf24lvwrXqQMslr9FXAi8g+fgv/J9C9YOAkPRgszE8BQ==@lists.ozlabs.org, AJvYcCXMrcDFdf+/ACIALoAj67ZaX7kiMh/erhi9ZwDLnCrrlJJPfu9DNt53qArf5sCXNAawxFQmZ9zHOHTnNGk=@lists.ozlabs.org
X-Received: by 2002:a05:6102:3e95:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e42415db7dmr12024574137.16.1748435792883; Wed, 28 May 2025
 05:36:32 -0700 (PDT)
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
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
X-Gm-Features: AX0GCFvOxqSsQb6hAAUjvGh24-ydFSS3wze_W2Lj6wpwfm4mEoNhN1lAYOnpqvg
Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] pinctrl: starfive: Allow compile testing on other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since all of its Kconfig entries are already

... since its Makefile doesn't build anything if no Starfive-specific
pin control Kconfig options are enabled?

> have "depends on SOC_STARFIVE".  This allows compile testing on other
> architectures with allyesconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -82,7 +82,7 @@ obj-y                         += sophgo/
>  obj-y                          += spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>  obj-y                          += sprd/
> -obj-$(CONFIG_SOC_STARFIVE)     += starfive/
> +obj-y                          += starfive/
>  obj-$(CONFIG_PINCTRL_STM32)    += stm32/
>  obj-y                          += sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)    += sunxi/

The actual change LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

