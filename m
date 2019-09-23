Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19FBAD76
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:26:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cCVM3WnpzDqMw
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:26:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RGqLDX1H"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cCTr5YKxzDqK3
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 15:26:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id w14so11260037qto.9
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FKuCCgwN2il3UI1pgwGpVDwO/KHhxYC1LWBiDfVB3LA=;
 b=RGqLDX1HwJiwel0IVQxGQsvyDcGbZUzLqhYWpoMlE3fuVxOam04Oir7EJqhquMw/dC
 2etVPc8EUdlusp3FNGw2lMlx8HsSbovM1N0iKw+55F4axbzt1vXUAfAvdM/IiM/Vfnkm
 tT8qeUikLsm+OfTvD380q3dtawHImvMiYNq6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FKuCCgwN2il3UI1pgwGpVDwO/KHhxYC1LWBiDfVB3LA=;
 b=VYs21E2qIoLyMjFY/SIBniYxHGT/NlKxux3fED0kF4nO9f9vOFvDNv9j3Q9CGs8yIH
 DisD7+dNGgQgQLYdXKYgr6SNIWUW5lkHZ6371rBZ0t6ENs8lYgp83v8kDB2n0y5ubsyA
 tsw7IfODHefUf6HxweinhuY/sSddUxoKsAhyz1aUXBvIBrsXn1jHsChLOyVwm/bFRrJ1
 ZHDJQVAKNM5h7efMKCub3kL++yv4wMhqxLHjpsLiltvzy+Rqh0z24jVHFupv4q/yC7q+
 fR/gEn84x4V147J9nnCSdrFyBX0O+L5v+d5rmP990acnTbP/IHK/VZAaWokimxt7+JQo
 HbDw==
X-Gm-Message-State: APjAAAVk59IMpIfZXJUj+P9ilVEcLRSRVKWRennHYfch1Rdy6xLPJ16J
 tfT39nbIlJZoa21daj+wA0111fppWcmoUnS6F3Q/6w==
X-Google-Smtp-Source: APXvYqzKBwzZCuDjYshXPz9MjM0KZQd+S+oQwUElEpxN7W4bgZMQ2KKsp6QicXGrM99wlTlVbvhrYAckE0geDg2ISQU=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr15309235qtd.255.1569216363965; 
 Sun, 22 Sep 2019 22:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-4-andrew@aj.id.au>
 <CACPK8XdHCM6h52vXFqF-3vzXfG+2--12nYM=3MdQQvdM1rMcGg@mail.gmail.com>
 <e45238b0-e1ad-4de1-9b18-15872ffc520f@www.fastmail.com>
In-Reply-To: <e45238b0-e1ad-4de1-9b18-15872ffc520f@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 05:25:52 +0000
Message-ID: <CACPK8XdK1HYaDkywgFSauU7VCqMNjU49JY2azyqwc7MXPeA49A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 3/6] dt-bindings: clock: Add AST2600 RMII
 RCLK gate definitions
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 23 Sep 2019 at 05:11, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 23 Sep 2019, at 14:28, Joel Stanley wrote:
> > On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The AST2600 has an explicit gate for the RMII RCLK for each of the four
> > > MACs.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Put this in the same patch as the clock driver changes when you respin.
>
> I initially did what you suggested and checkpatch complained. It's explicitly documented that DT header changes should be separate in the dt-specific submitting-patches documentation.

That's silly. I would ignore that recommendation, but it's your call.

>
> > >
> > > +#define ASPEED_CLK_GATE_MAC1RCLK       67
> > > +#define ASPEED_CLK_GATE_MAC2RCLK       68
> > > +#define ASPEED_CLK_GATE_MAC3RCLK       69
> > > +#define ASPEED_CLK_GATE_MAC4RCLK       70
> >
> > Nit: You call them MACnCLK here, but rmmin_clk in is the gate name.
> > Please pick one and use it in both places.
>
> Ack
