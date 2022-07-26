Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E31581A67
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 21:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsnP536kVz3c3N
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 05:42:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YMoEDzJy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YMoEDzJy;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsnNg3c43z3bgR
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 05:41:54 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id m12so23036470lfj.4
        for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y73Cbks80QRaio2NF1SNbgs1LhYqx782nVW2SB+9Lm4=;
        b=YMoEDzJyIqDGYPZ7iyFn6c9nULvNilXBrX/9GQARqgB2M+Gw+IDQUWwSP33U/JwZA/
         zkvgFKTc2ZWYboqN9FgfIzWIsSD1SpICZ+zI0IvASGms9JPe03pkdssCEg1q3fcFieh9
         a9REYm5D7TTl2U2DGrPtvO/eWDMhlCoBrBoaf/WzIvnt26kUBMTQKBKjCn8GwC4Bt5wq
         wgf/UdQ/wOa9bHyzxAmPvNZAFF+lkIY24NvmB5nkHqfHDxe1gQBHobhcPfR85vuO2EFS
         edv35OOfF4PzLxANBkVcMOZTgIAw8MDq3zF54npNNZldaMPgaY0Pa/DKKz651AMpIZUh
         5dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y73Cbks80QRaio2NF1SNbgs1LhYqx782nVW2SB+9Lm4=;
        b=5ikgYNwDo1BSwNeSti0TuJb7RD5h5mZR49SF3UxjvGWotFY8dpo3onKeYrkif+T4Vx
         w6puwhkN0kJ1Kd/DgtVm1TTNoI+dXvuhTxudMkWeAy6x08kUMEiAUpuI0hv2aIh6zj6I
         /SCHLIrBatdA6iPzJ2O2xhkEGvp9uORBB3FVznEXjHXGtY6mUKl9SEx304ytoZEaioE9
         31UNKfKLMvmeCLMlsqJJAyjHTxGVD0NRihtt+IyUb2zl5hLC5T3ihrUymIbp8ONg0Xmo
         VfJ3UcZpBjPJgsqND8P/PfgnbWzdw7XRJqoRomlAfjrJIes60wvDwMEdTPqBOtvBlike
         VAVQ==
X-Gm-Message-State: AJIora84IfAwSCKNmSX/zAkxauPpKzMsOPPzog7p3ZpFt0bzyp0qgBqb
	O/3znIe/EufMrNFv3YchAWpkdL7SH5ZS5dDheaQ=
X-Google-Smtp-Source: AGRyM1uzC0o9Fyo0i233ZCX1c9oID7O1iPLRwqGSKX/Inr4uy4oQP80W/cr5a9qufJPHij/iX4kvsXVp2LMZnvRL62o=
X-Received: by 2002:a05:6512:22d2:b0:48a:1ec7:2220 with SMTP id
 g18-20020a05651222d200b0048a1ec72220mr6678625lfu.668.1658864510492; Tue, 26
 Jul 2022 12:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220717121124.154734-1-tmaimon77@gmail.com> <20220718125155.GA40038@minyard.net>
In-Reply-To: <20220718125155.GA40038@minyard.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 26 Jul 2022 22:41:38 +0300
Message-ID: <CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] char: ipmi: kcs: add Arbel NPCM8XX support
To: minyard@acm.org
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,


On Mon, 18 Jul 2022 at 15:51, Corey Minyard <minyard@acm.org> wrote:
>
> On Sun, Jul 17, 2022 at 03:11:22PM +0300, Tomer Maimon wrote:
> > This patch set adds Arbel NPCM8XX Keyboard Controller Style (KCS) support to
> > KCS NPCM driver.
> >
> > The NPCM KCS driver tested on NPCM845 evaluation board.
>
> This seems reasonable, I've pulled it into my tree.  If anyone has any
> issues with this, please respond.
>
> -corey
>
> >
> > Tomer Maimon (2):
> >   dt-bindings: ipmi: Add npcm845 compatible
> >   char: ipmi: modify NPCM KCS configuration
> >
> >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 5 +++--
> >  drivers/char/ipmi/Kconfig                                  | 6 +++---
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> >
> > --
> > 2.33.0
> >

Sorry but I need to do a little fix in the document file.

Can I do it or have you already applied the patches?

Thanks,

Tomer
