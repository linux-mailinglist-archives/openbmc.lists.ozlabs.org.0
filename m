Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226EB579FC
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 05:31:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z5660hQ4zDqdc
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 13:31:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HhoUPy+/"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z55R2KMqzDqcj;
 Thu, 27 Jun 2019 13:30:50 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id d15so542546qkl.4;
 Wed, 26 Jun 2019 20:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PH4AXqM58x9vuCT5X/Gjbq2w5DxoKAA6BzmWgUbnGec=;
 b=HhoUPy+/s+uM198lB0sSRK5RzLmFemtOSgwIVThA4XV/JBpMKO7XSJKKiUEjIoMHYI
 cPFhuenDq2eWZI4Nc/J+ol5jiFNl/EJgg+gsRQawWfY78OzG23qrGq4pjTadJccD7LoB
 Zs00YKlSYCsPNNJISz1TfBni2Pugj6cU1yg1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PH4AXqM58x9vuCT5X/Gjbq2w5DxoKAA6BzmWgUbnGec=;
 b=mhKvfVe4YfyqZkvg7PUQIOOyFQyNbkaxJymFyANB0z14pH6FBWOAv+ZrLwlPSgNLS9
 AwF9+HzIxzYuZnShtGZvPJimCeCn3K/ALO1JoKv8UzUOdRwSkg9IxeYYhcOI1WFFnUTO
 vWqEoNaaOReiqkAvVdTgQbpd+s4RzHZNr3+2LbZ2BaRfgQI27fleu+9Zt0qd7oqIbcX5
 zUZQwPXtGeqYzV1/4c+MsOxnW8GdWuV3ZonBY2ys9CTR6SfaPAUTEhaFSZrkwTk+VwnF
 K0iW/8E9HqijKH3mNtaLsh5Zi7twpZ12xsE/7ECtp6JErEOlbZA9/qCQe/LXajTBjC3b
 K0sg==
X-Gm-Message-State: APjAAAV7FhUjC/24q0Tuyb1Wqa7LlhL9ba6z5eup3nLTgqyKUT7wEAqF
 uGBmyAkKsIoSLImF+am7sQ01f8GsTcwA3ioG9H8=
X-Google-Smtp-Source: APXvYqzytvrGwxA5InkHOne1NbDI8ndj6XRhPb/DQ8p6hv1uX1zDjyqrKfJPGYZgR1BJKTI5rjNaxEJb8lx/mqSfFe4=
X-Received: by 2002:ae9:f010:: with SMTP id l16mr1341881qkg.292.1561606246697; 
 Wed, 26 Jun 2019 20:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-6-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-6-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jun 2019 03:30:35 +0000
Message-ID: <CACPK8XcPxJAOBAnKMKxtiG4Fkz8BPf8KtW1Kc3A9tU_emQviVg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: aspeed: Correct comment that is no longer
 true
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jun 2019 at 07:16, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> We have handled the GFX register case for quite some time now.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> index 4b06ddbc6aec..c5918c4a087c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -240,8 +240,7 @@
>   * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
>   * reference registers beyond those dedicated to pinmux, such as the system
>   * reset control and MAC clock configuration registers. The AST2500 goes a step

AST2600 too?

Acked-by: Joel Stanley <joel@jms.id.au>

> - * further and references registers in the graphics IP block, but that isn't
> - * handled yet.
> + * further and references registers in the graphics IP block.
>   */
>  #define SCU2C           0x2C /* Misc. Control Register */
>  #define SCU3C           0x3C /* System Reset Control/Status Register */
> --
> 2.20.1
>
