Return-Path: <openbmc+bounces-107-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D77AC89CF
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 10:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7wvn39Qgz2xCC;
	Fri, 30 May 2025 18:12:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748592757;
	cv=none; b=fmJ3uA/L01ljHOQoeJZkPKAVWM/fqpa3rACzntzxwc2XqdP00fwRAFQDzDslB3T8Xi3SmDrrC6Gb/+mzBwpwyV2irtHM4KHzTwFstOxkFKCtMV95JI7A8Y6tjHGyuR3EEYKN6VafkyWzpGgd/03ZKPnkAZ6AqIBkiWD44aOLo10vAr50bHGMu3NPNt1+L3Z8TnLJufotaXwkKTBqCZQdxcyw0ySkB3LYM2+L1Zu6osqY4CoW9IExvPpGgvRvWuikULpWCgJ2JuuKE/4v0npUEDgLZQt9Z2iIzZesg6tlhfoKheyVOY5gCOawjJ912v6bzXSdogZ9hJGA8Q0nmQpxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748592757; c=relaxed/relaxed;
	bh=UODADZBFNNuhdOjNi7w1d1lWaPaCSwIUX58mKie6mVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAt27Re+sExD3C/v43k+RGkxGYWICh3RJnXqYpqiHWu6w31jP6HzUX4o4RZoQWHW2Emdpr1ZAskLBEgpjkuZ7ZWotsTrrqVngG0VUUJmSK4nE8eDlGeR9rttHWV+sNUw8KhjUxWjUwI2kRdPXvJQhpVu+yrHNxw4jDAn6NFoay3eCxjiRUaaByhhLQQ5YYxwMtDMNG4C7fVAZ/vmw2FB44hoQngIKHvcE5s0nS40L6iZxL7RkIA1479v3v4+HVRi9lHpYAH4P+GSxZFr5It0x+d+E0DyNqRBvMBQD0Uvy3cjY3rfX0sUtTeZFvNrym4BTOYN0st5/3jcl7hhvE8ZRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.161.41; helo=mail-oo1-f41.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.41; helo=mail-oo1-f41.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7wvl5DXCz2x9N;
	Fri, 30 May 2025 18:12:34 +1000 (AEST)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6066c02cd92so851072eaf.2;
        Fri, 30 May 2025 01:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748592752; x=1749197552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UODADZBFNNuhdOjNi7w1d1lWaPaCSwIUX58mKie6mVI=;
        b=Jo81SFSadKvcKrMLx5KufEFTIITCrd2MM2wYzKLRWBl96/1hK7w8MwsdoCmaniruor
         OzlRY/0fBhtNHBfmoSXarQ+3ebVChSjcv1t+TUO430fsGI5Spe0CWYqLQF9gh3J6o61M
         mUO8nb0nA0cTR5hN+e55Y/7e8c31sK3BsTLK9+gXIHoKS67Vcv7jGynETmNM9VBNAr8D
         pc2S0Fa/v8urfL2wSjfGtxYrDIzx4VLo3hkmHWxP3Ap4GBPuJSTRxtMNdgGlcmPiTOFG
         xI9ODam5dG1geN4ZiyDKbqIKA4g6pa77DUKT8Qty0jGp3vXG4P9nLoLDAFoFRoOdvr5Q
         F+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVLOtaFCRUlI2cOXps1kx3zTqKYUWonxENA2GQ+XGkfq9ljm3A7PGoTY4AYTteXJV3njWM7f5tf5PmC5/A=@lists.ozlabs.org, AJvYcCXQwV410xOj/LLXC6ILpliMHhvnFvetg2bWciGlhJo9TC3Up1bDDKCCUvfBnNujyjEFDHewBj59Ow==@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpiAVwkm4b1t6ujk0XIbadJ3TUwJB0cQziYrEUPGbikGx7skoZ
	v2tzOES3dkTfWS1AgbfmPPXkZni6lrJprLU3BrwOTosL16CBqwub5X0GfX5ddYUA
X-Gm-Gg: ASbGnctPWOlXdAJa4vTD0UrpxnZiR9YzJkmdT/NMWSslujQJIVGTc4vdtxHQYmBW47m
	uSuOk03VrSMwD4l2EXWsJN5w/xXSps2G87d2xnrzVQt8MI1ohu53eBxy5dvwWCabUQkgaRF6678
	DK8tckApX0ZcZvYGSKoWWKRhVDcUTUOV8UfYRjqIbN29Wa0zjoS25COtDDOEJCQ5pmilnPk/zi8
	LAiWh/NDTfTCEU8RjZ1vbigSn+f0V1wM05b1+6TYD1JzicWAZnEuIl3XZG8iu0dG8+kkx3yhxeW
	SWqPVHUc3apW5DabZrDcGRqL0QWBc0ubcXhwzR+ZJK1qYYJ+swcsVHRKGYeWtG9Aa96I3QTbmc+
	XTC/xpXoG3zqqwRSP03oceONGrFVSUThWUrBU/zc=
X-Google-Smtp-Source: AGHT+IHnDAJ+wHE5jBUe7dICHcyJFLnnPKRPwH1THP/L39Tx/JZsfp6LaklIs9jwWXau93nBdKqTFQ==
X-Received: by 2002:a05:6820:1e03:b0:60a:4cf:a7a0 with SMTP id 006d021491bc7-60c4d714d5fmr1457452eaf.7.1748592751664;
        Fri, 30 May 2025 01:12:31 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c42c3bsm304884eaf.5.2025.05.30.01.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:12:31 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so1171440b6e.3;
        Fri, 30 May 2025 01:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD4qT2Ir3DgfksZFetQgfnZU+q74kKeZvjlkTF5tYG/HEP0NO7iBEVG88VrThYn+eTlHa55VVZP+A6+aQ=@lists.ozlabs.org, AJvYcCXsCGhzFArlaj7EOa8sooSZX5QbA4GcmPdrft5ZyJJcirwqzjm82aMIb9zHFfvAu1Apm5pZ/XWvrw==@lists.ozlabs.org
X-Received: by 2002:a05:6122:17aa:b0:530:677b:1e93 with SMTP id
 71dfb90a1353d-53080df1088mr2012964e0c.0.1748592388616; Fri, 30 May 2025
 01:06:28 -0700 (PDT)
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
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
 <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com> <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
In-Reply-To: <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 10:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
X-Gm-Features: AX0GCFuCNZIpijI8V-LFtD11RdEuCtx09JrM6Rph_c1WT65W3SrLJtlImd30cUI
Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
Subject: Re: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
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
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

CC wsa

On Wed, 28 May 2025 at 19:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/05/2025 14:54, Geert Uytterhoeven wrote:
> >>         .pmxops = &rzn1_pmx_ops,
> >>         .confops = &rzn1_pinconf_ops,
> >>         .owner = THIS_MODULE,
> >> +       .pins = rzn1_pins,
> >> +       .npins = ARRAY_SIZE(rzn1_pins),
> >>  };
> >>
> >>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> >> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
> >>
> >>         ipctl->dev = &pdev->dev;
> >>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
> >
> > ... if you would replace this assignment by a hardcoded name
> > like "pinctrl-rzn1".
>
> I saw it, but this would not be equivalent. dev_name includes platform
> bus id, e.g. pinctrl-rzn1.0 which might matter here - conflict of names.
> Are you sure this would work fine?

There can be only one anyway.
Most drivers used a fixed name:

drivers/pinctrl/renesas/pinctrl-rza1.c: rza1_pctl->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rza2.c: priv->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rzg2l.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzn1.c: rzn1_pinctrl_desc.name =
dev_name(&pdev->dev);
drivers/pinctrl/renesas/pinctrl-rzt2h.c: desc->name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzv2m.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl.c: pmx->pctl_desc.name = DRV_NAME;

It might change the path in debugfs (/sys/kernel/debug/pinctrl/) though.
Wolfram?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

