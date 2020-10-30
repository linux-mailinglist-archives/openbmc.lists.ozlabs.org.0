Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220029FCD5
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 05:47:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMqY92nbVzDqsv
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 15:47:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RUvZPpLV; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMqXH2127zDqfD;
 Fri, 30 Oct 2020 15:46:38 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id i21so3139686qka.12;
 Thu, 29 Oct 2020 21:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzgksPitq4UPlfGWWajj2JVz/dE561nycQDfwW8jv/Q=;
 b=RUvZPpLVywLKx60cuN5lSvJ+mzOhfVU7aPuAxNPxSRMtUGswTg+o7antOx3Wl1SvoX
 rmCERtnGcygp6w6G5WC26TD0SEX3vDuGJ83NSt7E2Cdx0ggltyDUzESq0l6LTeaA8xEa
 BRuFB1wb8WaU0etZepm03Pl0F4KfB0/MEKWBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzgksPitq4UPlfGWWajj2JVz/dE561nycQDfwW8jv/Q=;
 b=RfV7hCYhg4uQXIyoorTE3hlay0ycXBN1GSV/YNTVWta0XGTuJ2Hc6GTiIFIVugJ5VR
 cqQnnRN7t4h057UrELWu9wKKlTc9J0AznSzg7HawqTvpGp6aPej8k5lZ/Ch7luJpmLAF
 cFF7dfAox1IrosCML6sM3D2uFXods6ofrsKRt3PZXTbWRRZoDCyoalhVe0SfLN8SVU2S
 vZqpZteDYs4CkRUFcYdRiL/D+ATp0QWDuo2XBGyVkQ9pPIpYAeM1B8tgP5m9r7I5y5rS
 NeqAYeEyGea9bBPvIrbRfn1nQCgz/Q/UkgaxOVuTe5wSpyNeISuZfZf+35grcRtAn4kc
 DMig==
X-Gm-Message-State: AOAM531lJC84N7KTWSHpfXhri70m0C0YNJr/UnZ+UsIk3T7If3jys7II
 Fz/jLFCXGBrAyxYZW0n5jbSSVWjH0zLpJ3zfCks=
X-Google-Smtp-Source: ABdhPJw9D8ZjdZeQ8bvbkpU8ZXxlO1FOkzIT5AF2J70UORhP8FUuHjJwZykaO/bhfxXI7fXHA+KA0noTFMsBLYhK380=
X-Received: by 2002:ae9:e90d:: with SMTP id x13mr570307qkf.66.1604033195037;
 Thu, 29 Oct 2020 21:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
 <0d5e5d0a-cc74-4cb7-aed0-bb8c62661339@www.fastmail.com>
In-Reply-To: <0d5e5d0a-cc74-4cb7-aed0-bb8c62661339@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Oct 2020 04:46:22 +0000
Message-ID: <CACPK8XdFS957Jnv+S6=ufyjMEmGAd5a1PZNk-ytOCYapSAjPag@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPI only function problem.
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 30 Oct 2020 at 04:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Billy,
>
> On Tue, 27 Oct 2020, at 19:14, Billy Tsai wrote:
> > Some gpio pin at aspeed soc is input only and the prefix name of these
> > pin is "GPI" only. This patch fine-tune the condition of GPIO check from
> > "GPIO" to "GPI".
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> I'd like it if we were a bit more specific in the commit message, and even
> better if we update the comment in the code. A quick look at the code suggests
> this issue affects GPIO banks D and E in the AST2400 and AST2500, and banks T
> and U in the AST2600.
>
> Functionally I think the patch is fine.

Also add this line:

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")

Cheers,

Joel

>
> Cheers,
>
> Andrew
>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > index 53f3f8aec695..a2f5ede3f897 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > @@ -292,7 +292,7 @@ static bool aspeed_expr_is_gpio(const struct
> > aspeed_sig_expr *expr)
> >        *
> >        * expr->signal might look like "GPIOT3" in the GPIO case.
> >        */
> > -     return strncmp(expr->signal, "GPIO", 4) == 0;
> > +     return strncmp(expr->signal, "GPI", 3) == 0;
> >  }
> >
> >  static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> > --
> > 2.17.1
> >
> >
