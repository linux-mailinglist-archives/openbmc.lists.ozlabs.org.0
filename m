Return-Path: <openbmc+bounces-70-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3306AC69B3
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 14:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6q6b0H8Cz2yRn;
	Wed, 28 May 2025 22:48:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748436486;
	cv=none; b=B0VZpq4SQ4ScyfWZS7A1ahx9LSSNuOXzxbjMbZUc/84Tso9xi1rI2Kkc4tzS5wTU0ukNx75BKgBWNAX85xLx31A9QFFKAgNRHKX9OpyzWVyq70RNYvCDjz2BzdzPjNjBYaLdUGnIBGytmvqInAm9G6JtOTOU1b6fISuxQOiDdaEwIYxaMW5nc0hDFVitFSvjx65LhUjgaUDOEEyiC6N485fmRCNsG892O1zI1KYRQbqo0rbrcjqx4JvwwUqMMEY7lxtP51j+WP4YSW0VpZ3+syM1+xM98glFewsjjhmtYrDEnLEaK2lSuP3khU0lMb11mzwge4WDtogOQgKZlH4rLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748436486; c=relaxed/relaxed;
	bh=kpBCbmssZZU2OxX6932Syq4YOVYfQLXpGhSUVPiLHKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COlzwby+QCzi2sn0ISrDWz6trgzl+AeLm/LHIqXNGTAPOSpZLC1IygrBSWbH7xw1wTJdm6NL8uODMo7brHidSsPFhfSc5suS4i9d3Mclw60vMgfcXaPjC9Q/vJoya0OzEV+PlG2QjVGGYhxYT6fUMGhwTbW/CpPYTuFUv8BK7OcpG4BaN2pEqldNzUooIhRLb+1QPbyvtTrkqtZZK56S50ViKzPPk9dD4yfiPSehQruFJPCuhiXoGuHEFe++x8T8rEtA5dnVKt2csc6cEVVMI4PpYwGSI23xWxttxDARhFNxc3INR1/gNHf5osjvdNl425oYAh+FZUlaXr6ZHzdtqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.44; helo=mail-vs1-f44.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.44; helo=mail-vs1-f44.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6q6Z0jnDz2xGv;
	Wed, 28 May 2025 22:48:05 +1000 (AEST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e5962a0f20so462714137.1;
        Wed, 28 May 2025 05:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436482; x=1749041282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpBCbmssZZU2OxX6932Syq4YOVYfQLXpGhSUVPiLHKA=;
        b=iiKa5svLWEsVYe2OjJnehfKd3P1WM7ZvEQ3JaOKLF+RieG6IbpA5Ylg3IHUGXS3fli
         S6jOMyXrg2QIGFeQ/kLmhYvb8KsjEX9lj23a7LBsp65U0fyd7e5aEw/EV71fbezlcqmd
         GhZ2Yoi5eqHIHkzPEkxQgAYmfpzE6U7wTci3kvYQQmZV4hikgGqd1J7qMn/0e5YyRvOW
         WrrgcOgXWQV0Ik7GwCkirRQxiNmMjEMIOHvxT4KWYrZdlqF9GCAfoYvXAVkYOC7Sq78/
         P73ARJc22DutueJmjSPV6+0LHDR11WDxdiRUQp/cOjmTtrrjXfSM8cJbierEsn6iWI+6
         WCsw==
X-Forwarded-Encrypted: i=1; AJvYcCWkj2uz2zNcxBVV7ZMrjrxGjKF3/J2KrKSMjE0f7WDIRg8b5jTXhajKXgas/SDGK5JL5z450iSGRhyt++g=@lists.ozlabs.org, AJvYcCXpmGfTrbQp0ngwESGwlt7H8FGsylyJrF6yHChLtZK81nXVkdlqeDNufLsNOMG50QOWofSFLt81XQ==@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUFuXQf5Vb/hsQrumIFVf9tHe+BsEcmacSIDlZUZyXt2hfNsyH
	ozpiV7s3Sc6U+j8DHUwBY0lxpbFafavWt112GskwiPrtC46Khk0+nhxXgbUQv79e
X-Gm-Gg: ASbGnctx8J7XVlXvHv4Y6C6OyTKn512V5d/wdNzb80rdtWHFxiz+0gPkHAhRYn3PunX
	OFYNYPeycfjiHEW2CTGrd+eiQt4RINuuhtGXZ2in2a/ziZDUDff8O8rJPSm8vd2dQR9JZQnzQDO
	6zy1svcidxxIJbypuNI+YAs9cLu83Iq+IrNEOCFo9IVBYrSxw8AQoGgq7a3xZZb/GqMNxlmdVkw
	5Bv6VhPPxAywsbnFRYMTQC7/vs9BRWhEArWTeJs8CtdkcYQogt2cCrAGEvN55GbNG3jhq93ILwu
	nF214aqwVfCj4SiKwk3nelbiofCPmHXFZmEtTOocwCYvhqHzm7Q+u6eK7kJdxEJq8EwB76H8IAd
	64m9vhDv1YgTXLw==
X-Google-Smtp-Source: AGHT+IHFWEWP4J9ASAMv0IegC7Rm/+j1ytBatmGEUTI+RBLcSRT+g337IJ7bugXOYRNqAkxIbkdS/Q==
X-Received: by 2002:a05:6102:3c95:b0:4dd:b037:d239 with SMTP id ada2fe7eead31-4e4240d9c18mr13256309137.14.1748436481733;
        Wed, 28 May 2025 05:48:01 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e1f0db9c5sm749570241.22.2025.05.28.05.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:48:01 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87be2373596so1366474241.1;
        Wed, 28 May 2025 05:48:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQC3+tfiMaFTHsNCUT14J8dyKwT0y+miwOr94ucWHaI6zrIwx+TVG8599UnKrbMQjYS5de/NiaDQ==@lists.ozlabs.org, AJvYcCWqJDqUipq6oApQUVAUS0Rs5/X55I/2b+MurAbFfmx2ZG3PzSd6aO0oN9ZeAu7nf7PrmyQCr787rYFGFwk=@lists.ozlabs.org
X-Received: by 2002:a05:6102:3e94:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-4e4240b1619mr13395283137.10.1748436481362; Wed, 28 May 2025
 05:48:01 -0700 (PDT)
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
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:47:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
X-Gm-Features: AX0GCFtImpXXWdP8CtUa2VgvQDuwNbZqXjPeWpaGOsf8DlxmYUgiiqknnvQgxJg
Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
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

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Pin controller core code only stores the pointer to
> 'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
> be changed to pointer to const which makes the code safer, explicit and
> later allows constifying 'pinctrl_desc' allocations in individual
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

