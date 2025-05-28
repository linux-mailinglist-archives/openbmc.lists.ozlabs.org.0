Return-Path: <openbmc+bounces-71-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB2AC69D9
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 14:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6qGX1CmFz2ySP;
	Wed, 28 May 2025 22:55:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748436900;
	cv=none; b=YDsdFPBOceW5KAryHTAhJroZVYgP7hsWeceeWZd/7NyNKI+xuL/EQMYwASzPQ3gKJZ5bK4DF+YSTuYH3+gQO6SrFgxPWKCc2ySpYecOTmypaGbKs4qoJtQO45amz+mbEFQhKDqBEDNjGnSvBwge/TGclwPILtiFP7UMsZsHNwplE6CLFLuLEx8OOY5XtTAad3852UuYSvvoQQr6T6rgJ/QgtMbiSNpbrUOakdG/Zbgv0RVwjWUwPF2RDpa+81ZtNoESGOJveJxKewnnbvnxcl+l7SGEl9je3b3XmvDpdk+Fq6q0BPDo8SdpyieG+Im/pxxQz7Wll1d4z7XSh1075ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748436900; c=relaxed/relaxed;
	bh=IbSvaL2uho5iBNc6UnxSmb8ikoxZVNAuMK5QOEf9/rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rp5aL6Bse2FwtLaSLjJ3LfR1FMXKNQEQCnlKo1cOSNvJMRdLEgCkvRgHhefkBlXC1tJxKq199Gzh57fgPjte9QutesaNnvtL+mOvVbSfMox+d5v4IVdcNJRuEMngHD5G9WMg6H0kOt1z4r3JhsZOg6Vge1vn3s2trQpOwciDB1BypRfhPE9pD/hxVmF2YOuI1BQE/BafhbVbYqjqrnHqZI/cm9eJH05+uwYas8O2PkHixxjj2WUt7tThx5ZnpQgbHaUizSZk7ZnVgqpVrBzOb7ZM1hPihZRKLDkXm0oqzBRUe1+gmftbmoWaeZCfHoP2UiSGtHDVGKYW0r8y7wLmXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.50; helo=mail-vs1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.50; helo=mail-vs1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6qGW1zZtz2xgp;
	Wed, 28 May 2025 22:54:58 +1000 (AEST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e5962a0f20so465318137.1;
        Wed, 28 May 2025 05:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436895; x=1749041695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbSvaL2uho5iBNc6UnxSmb8ikoxZVNAuMK5QOEf9/rc=;
        b=CPa7MD+mmdGxm4qxuu5hajMMFDwmwntyt8KlojATviE+Wp0K0dCJI4fQJGQ701gfaN
         EjuBf/eqBKXnydfHpQJEbFkkxWkqK0KB7DxOan8yByODQa3X1M+UEHCPt8V9+LfMM3+P
         DssZv74VhZNHn/HaXbnZj30zDXVzH05/jXqNy2me+yGglGYLnNL59etuv6XjiWOoaF9l
         Irnm4Z7C5IR+0V7R/08xLVyCtK1ierc4Lsvm5wQy02Z7QjV2y3pZ52zrm3VtL5tYRUJQ
         tMHxsvbMSbH2/LmWjc8Pwc8CQynidRdZdEu7SJyIt2nGapI0zrS9ryjK8qfmHKBoqccK
         E4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVELVl3bq5JkKpDWLwkyaFK5BRbNWc5Eu9ELOqZ9aM2PlaejAeflwX62n9pjMP/uSIYtQqVtb7lA==@lists.ozlabs.org, AJvYcCXwLHOPGiHdmQjv/J0N/bYKfppnkkG+5IEIekM8USHaxMAz5Kk0492GzYouUjiIVMzlHorVzjeZZYyitCQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQ2/yiVmjC+jdCXNjCisrgUJfLvoB1WINMJRHQI7MNZUYOnips
	/TsqNSAapKNx4OOY+MSah7vyZhYlTarCt0fH+GSTqhUyW2AYNGG9FAuDWT1lgiLz
X-Gm-Gg: ASbGncuPnzXUFae/uVD4rCiih1BojcIQsTCOFDqSA4JWcTJ2HG/p9bUtVNHThCaDRbj
	ZngGkh2wxac4mwSENFm8fJEbTFumO2IkaRfwxqnmS/Gxf0YxgSn+94aMDhJKuA/WHQFD8czd85h
	cafEShTq0zdQSHnf3Oju5z9XhCu0OPChVJKizcr07Fsw7P4ngSGN60zLESOy1YwcpMhiB3Jrz9D
	o9usPzgY0C2x+GFLt9NfHGkb0DyRhUW/xrnmI5yEOZQjLL7ggfxeD7I4bC1pqdAB/SF7o4lzmIh
	hyUptaPbgKnskPbBKcVBQK1bv9bwMaA1b2Q6NGi5xNYKK65n6iX2waDdqFYTASfjrkchw94UTKe
	o7bLQt1GTaJ4TrQ==
X-Google-Smtp-Source: AGHT+IHSMhL+0xgLQIab7HgFA8EyveTxgKCU6YYbKPqdO4u8EchV4Am9BkF+cMo6lY01yNN8Z5z7sQ==
X-Received: by 2002:a05:6102:3f56:b0:4e2:aafe:1bde with SMTP id ada2fe7eead31-4e4240b0ed0mr13211690137.9.1748436894739;
        Wed, 28 May 2025 05:54:54 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e59fc12830sm704981137.2.2025.05.28.05.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:54:54 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87df4dc0e54so918062241.0;
        Wed, 28 May 2025 05:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrtU5e+5+Nw5EoX+GCBalNNqntFg+ZNaJnijJRG0thmylmFRLCxuGwq/4uPcFU9vIKxwsjAYuvow==@lists.ozlabs.org, AJvYcCWzxMMAWsQrUlkKYxJs5ZKdslOBuMPSoP0q+tzbie4JihINX1WLQs55BrCRupeOQmiVdDbDRHumlyJhBrA=@lists.ozlabs.org
X-Received: by 2002:a05:6102:2911:b0:4df:93e0:fb7 with SMTP id
 ada2fe7eead31-4e42419b8c0mr12541235137.25.1748436893682; Wed, 28 May 2025
 05:54:53 -0700 (PDT)
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
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:54:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
X-Gm-Features: AX0GCFu5yojjEPsbiWTwjJJQ5khyE5KBTwGS5B0aqZkGtvZvOhYOGPRkjlMB-4Q
Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
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
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

On Wed, 28 May 2025 at 12:42, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Assign 'struct pinctrl_desc' .pins and .npins members in definition to
> make clear that number of pins is fixed and have less code in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {

This structure could be made const...

>         .pmxops = &rzn1_pmx_ops,
>         .confops = &rzn1_pinconf_ops,
>         .owner = THIS_MODULE,
> +       .pins = rzn1_pins,
> +       .npins = ARRAY_SIZE(rzn1_pins),
>  };
>
>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
>
>         ipctl->dev = &pdev->dev;
>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);

... if you would replace this assignment by a hardcoded name
like "pinctrl-rzn1".

> -       rzn1_pinctrl_desc.pins = rzn1_pins;
> -       rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
>
>         ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
>         if (ret) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

