Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FCC39B485
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 10:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxFb82K7Hz307g
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 18:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ur14HaR+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ur14HaR+; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxFZq2WXXz2xfk
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 18:01:23 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id n12so5750086lft.10
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jun 2021 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Bw4taStS0TYq1pg5UC4LSk9Au6BM49fh5en5WhcGhE=;
 b=ur14HaR+Deo/iMCQLi4x+4jC05/k1wiyntjUayr32Bcbnj+5gVjebq9KEm/HJEJ8+v
 0p5vibE++OtpvxWXz40k9GbfxEaBflRCeigjtInQQ2bQPi0AiR6CiKvsB6goJowfAQGw
 dOZk5wd/2I155FXqj5h4Kl8bMunugGzElqEwCf4N5NxuTlinMyetl+YLfXr4vGGqC1kI
 QqgTKT0qtNCS/JbMQjXG1Pzdde16POOcPApsifjmoL3okk4PqYyCtlfzgd3eCfakaCph
 Mlfhs0qfhJdK9wd7ssmMRGjuafYUtSkBwxfrEGsgrFs9gSAr5kix4/lkWHoTVI96KZ4e
 eUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Bw4taStS0TYq1pg5UC4LSk9Au6BM49fh5en5WhcGhE=;
 b=ZCbbg53RGBcb1f3mhzZDam4vEkyCFa6aWLswcLGn1XSze/6XFUGRw7jdZIm2oo3/8V
 lev7zddGvfFXNyd/PcnZ9zpO/h//OC4w7iltVD3t6P94kdh+UI+NQDQRs+qir7yFh3vT
 lPH2LKdBKHJJJEJHYI26yjTnLK4f6RzpJTPjRLWHa56UQSM0jMVvUMiqCqGS1zPmIwEl
 QIFs6kQkChxzxAGJ9kZmTUh8loTI/xMsIzVUlVMsfZBaG+I5xjmYIzMEwYRh+taVq8ua
 Gv/yjXaHIKxAJLGoN8zbXA4WE1eaLW/wYMAzdayAW2FXSmaBqVxlZ53FT+yOPDwNVAS+
 SWdQ==
X-Gm-Message-State: AOAM532TCnkGBBGZNNj+qN2o78XVXekmjwNA0V1nwv9wZmJ7w2ggqjOs
 64WabvK3LkEPWwmJUZgDAJn8LozmKzZvUwM1hhRcYQ==
X-Google-Smtp-Source: ABdhPJwBqdYA3oPQgKBi2zU4QEMvIT3pto2rMxLubgXqM5I09bxsqOjHjuGSYlqFDkF4xp8cjxOitNwbigTvKyKt4U4=
X-Received: by 2002:a19:f616:: with SMTP id x22mr1904400lfe.291.1622793678476; 
 Fri, 04 Jun 2021 01:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-4-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-4-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 10:01:07 +0200
Message-ID: <CACRpkdY7AqcE4CMAdZHR-DfV-3ZCO3h9kYUZoZCUodLQmyyfXw@mail.gmail.com>
Subject: Re: [PATCH 3/8] ARM: dts: wpcm450: Add global control registers (GCR)
 node
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The Global Control Registers (GCR) are a block of registers in Nuvoton
> SoCs that expose misc functionality such as chip model and version
> information or pinmux settings.
>
> This patch adds a GCR node to nuvoton-wpcm450.dtsi in preparation for
> enabling pinctrl on this SoC.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

As noted I would name this architecture-neutral with
syscon@...

Yours,
Linus Walleij
