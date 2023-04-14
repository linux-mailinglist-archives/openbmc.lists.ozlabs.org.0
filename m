Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3586E1F0C
	for <lists+openbmc@lfdr.de>; Fri, 14 Apr 2023 11:10:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyVyk1nyHz3fB4
	for <lists+openbmc@lfdr.de>; Fri, 14 Apr 2023 19:10:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pfnBK13x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pfnBK13x;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyVyB1Wxfz3cFt
	for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2023 19:09:35 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id y16so3048123ybb.2
        for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2023 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681463364; x=1684055364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F81GLoXLZtL8vSYDorqAiL9CnEzuuMOCcLiXsP3TrCA=;
        b=pfnBK13xoj6MOIemvnh+e0VZmwkcUJ+TfhPfedGgirQgO5YLUTQmosJzSNe/gHWo/1
         ubKpJ+UjeNxA0eSLk5uTboLOoZ9CVbVps5jQPOuhddVcfEKIRj36V9F6j/Uvfkh+TPpH
         TbQifVNV4ANZnCz2cCmhsbu7MeK1YAI1WPcIgpMyBNuUbh+3rF6x2e5kF/6sSyEanncz
         84fruTtD5nT1/ka61tFRLkbHsJzoaWR7jznJ/7MVP0nShZDKy6/Vq8Fpf9Vled7Z2UhU
         anNFj2syL0/CaF4FpMeFmRw6ZmyAYU8Rq1jnzZZISGDvS81vlH7jZVdZy3oZB7lF9Jbn
         xrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681463364; x=1684055364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F81GLoXLZtL8vSYDorqAiL9CnEzuuMOCcLiXsP3TrCA=;
        b=P2WL18zSCgtj0HHBfc6dWqEL20Z2R9fUXssofWs1p6YdYII+UU98rtqb+mK0zoKBxy
         utvbSnjSvG/+gGO1I9atxQCGSJmQAAjT7TOIuOx3ZVmKEdxRsrFwXhmAC4no4m5yDZ+v
         1wNciUBvdeu9XBXEEomvjW7Q+VBLTtNm6owK0pqyqpr3nG4K4r7tRXjYg3XLHHvha8xe
         Yax0pfjrQNi+T8K1BS79VFLTqVQvh8NVyhN0xEOvjvNXYbBdHzPU8T6qn1rAlxqAyr8H
         gdjtpwTg0qoEnmKxAUFN+giqcyybJ8MtOIXDRIU80vaUYmzPzNKo0jP76I/I3VcnnQdr
         iMDw==
X-Gm-Message-State: AAQBX9eVkeF4kwBdYA5+cib2GMFm1jNrdT6tCGtbi84gQbdwACp9QSNi
	vVEgMQN3wUnpgJh9ACqAKOOsMjoSqDAHipCSnxwIbg==
X-Google-Smtp-Source: AKy350bIQo/9mA1ytvcDNUEaapfEg+kfYekEH3BIQxSuBh0eEJRichKnj01FOdNlxlgxYYScjklm2+r1l0zhYAyvmps=
X-Received: by 2002:a25:d40a:0:b0:b8f:32c4:5cc4 with SMTP id
 m10-20020a25d40a000000b00b8f32c45cc4mr3383651ybf.4.1681463364094; Fri, 14 Apr
 2023 02:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
In-Reply-To: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 11:09:12 +0200
Message-ID: <CACRpkda8Lp2j_-RWfDb2AppRvkSQ0fdyS56RXS9_OsmeEXqxKg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Convert low hanging pinctrl irqchips to be immutable
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
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
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 4, 2023 at 11:43=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This repeats the two-fold exercise in the GPIO subsystem
> by doing the same for pin control: let's switch over all
> easily identifiable irqchips to be immutable.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (9):
>       pinctrl: iproc: Convert to immutable irq_chip
>       pinctrl: nsp: Convert to immutable irq_chip
>       pinctrl: armada-37xx: Convert to immutable irq_chip
>       pinctrl: npcm7xx: Convert to immutable irq_chip
>       pinctrl: equilibrium: Convert to immutable irq_chip
>       pinctrl: mcp23s08: Convert to immutable irq_chip
>       pinctrl: st: Convert to immutable irq_chip
>       pinctrl: stmfx: Convert to immutable irq_chip
>       pinctrl: sx150x: Convert to immutable irq_chip

No reaction to these patches, so I just merged them.

Yours,
Linus Walleij
