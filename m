Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3C7FF800
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 18:18:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PrWjqHJs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh2vg6RYMz3cVX
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 04:18:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PrWjqHJs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh2v5559Nz2xPd
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 04:17:37 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d279bcce64so13649327b3.3
        for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 09:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701364654; x=1701969454; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4ItrsGzT/WvTQH/WrTuyHNbLnHImVbBz/zIs/Lb/tg=;
        b=PrWjqHJs1sk0own6yGoxbK7VubStVipoKY4sU1OHBX2sA9KaLlBei2qDP+9rmOeV3/
         yZ857EdAni8A+5o5hSRn1ILAnJ3KGql/1z65zUAXhPDeN4nCElLMd8Me+OUe5DjvnLcl
         ry5cm1QU1L0F5/yAxNAbmW3MpisOHisBD6NPcnBJPX5BslpR/Xlv9tveHluUsYEuqvTS
         pIPxvz3cTZOlwbbElM/OKC7xdSRbGkAacd9r9y2Ko3xwZLvW2YjZw2VMBk58skxUqKIM
         Pj0qWwpacUssejgCS0ss1+957NLXwkF2DYe+9ycZfLleqeEgKs0BR14bBGGcBxxHIm4U
         hQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701364654; x=1701969454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4ItrsGzT/WvTQH/WrTuyHNbLnHImVbBz/zIs/Lb/tg=;
        b=pGwyxQxmFZYM8YOhJoIOS/yl3VRscKQVbwyh7S0cV4r97i8GWliJfbIvY4zXGd3mjw
         o60AsII30CDovSqyoQrKl89CvtxXKfnBevnip1RyxW2OWoBRMPRzGfyhEVpO3M5HpQs9
         KM+vogw5Ch4+JUfxvRzd5PUQmxfLjqU+ifta9dhPt8W4967HQqjG80dVJa/GkPuioltF
         KZu3WWUSabWkCVRmpl7uzVOlRAWy0I/pITrg7e987OVIZQlsFAl399u6gQMalIMqxO2B
         U0KAQ1Yxdab/z2LTAzmGDt/Eggg5cbKjQBx58rx5F2jgFzJaUXP1f6CuUYEkgIiZsaT1
         YicA==
X-Gm-Message-State: AOJu0Yxm+apeCf5jny9fkSNq+xP7uJC6tRvYJIcYjlxJbalKjOA2kr4j
	Mt0pDBS8hA17HysnEXVSRbUjg/XwA2uCuYcvIb0=
X-Google-Smtp-Source: AGHT+IFRYlx8Y2pZgDDnTjk34oWVAWqB8FSjJ3g/yr2nSX2rg4cTZh7j2qWaWLqE1aKFFeAOp9O2b/2sC6qDD70RNAw=
X-Received: by 2002:a0d:f2c7:0:b0:5cd:3d82:1ac6 with SMTP id
 b190-20020a0df2c7000000b005cd3d821ac6mr21961033ywf.42.1701364653930; Thu, 30
 Nov 2023 09:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch> <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch> <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com> <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
In-Reply-To: <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Nov 2023 19:17:22 +0200
Message-ID: <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
To: Andrew Lunn <andrew@lunn.ch>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, robh+dt@kernel.org, tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com, joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,


On Wed, 29 Nov 2023 at 01:31, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Nov 27, 2023 at 05:19:15PM +0200, Tomer Maimon wrote:
> > Hi Andrew,
> >
> > I took a look at the xpcs driver and the stmmac driver and it doesn't
> > cover NPCM use.
> >
> > in the NPCM case the stmmac ID=0x37 therefore the driver is linked to DWMAC1000
> > https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/hwif.c#L139
> >
> > to enable the xpcs, the stmmac should support xgmac or gmac4 and in
> > the NPCM is support only gmac.
> > https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L555
> > https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L573
> >
> > and the most important thing is that the XPCS is handled through an
> > indirect register access and not through MDIO. the MDIO is connected
> > to the external PHY and not to the XPCS.
>
> What really matters here is, is the PCS hardware block you have an
> XPCS? We don't want two drivers for the same block of hardware.
>
> MDIO vs indirect register access can be solved with a bit of
> layering. That is not a reason to write a second driver.
I will check with the xpcs maintainer how can we add indirect access
to the xpcs module.
>
>         Andrew

Thanks.

Tomer
