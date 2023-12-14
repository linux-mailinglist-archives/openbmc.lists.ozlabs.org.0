Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85F812F96
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 13:01:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EIavmE1G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrWCH0y92z3cX0
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 23:00:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EIavmE1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrWBg6kzNz3cCt
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 23:00:27 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1f653e3c3dso887753166b.2
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 04:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702555219; x=1703160019; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uAVjKqO7t1SHEAhnbN0gUIgoq1UKlAq8GC08s1NGUV8=;
        b=EIavmE1G2NWftHv1lj649zNB0e1NHOiqXW4IbBly2KL3f8SlfG8ZNMj2dVeCXoC9sU
         hz29suw20wVVWhJyFB2X59NW7WsGSh3/P6P580eUw57KQwnoFarhHj8Or3PRiM7s2YM6
         V9Bc4anyVhCW3KhzhqyyuhKCwM2sm8//CmduS3pnori6p6WxqTzXh1/n0xxkxL8Ob6VL
         gSSW8y1G76mEo8KGMr/iSLPHi63AaI3cVd52QH0UMv1gW/p5rdxqfJL3DhQkpspe6Ezn
         TjshG+BpTYywftKnLQluGXoRVamuMreE8Y+kXlMsUUWVfkDTbiJhwCyeVrI/15pt9m9k
         KZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702555219; x=1703160019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAVjKqO7t1SHEAhnbN0gUIgoq1UKlAq8GC08s1NGUV8=;
        b=awHZ5mLuVg59mNOHwZOOcDob/W+NtQ4IuoAVpmFvNpSSc4uvyPqAYZTpEhnKC7QrPy
         Dff9grBdVQxN0GMeCbMsY+RMM4+iRNMuSp15AxtcvB4fcyPwo/lGSAHQwK131GNZFrof
         0csSovteSKjcAYw4hiJf3l1corvO3cWC4uq5yqDodcm4wtilzcFtSX19PGRxLL99UURU
         PPGQPlvthDAjNTs4bpAAupaHMLXuSU8bfHYCkchKvgAaGy0SxCHktRm2QoMLqSrO5FVH
         r7z8BRhiYpQ1WQeL8ouKS+NNgZ3U10oj+b5W2896Ijz7qPENAbDFqn2U/NyKy4FOXEwh
         HWqw==
X-Gm-Message-State: AOJu0YzWxHNnGk2D8NP35ncA5Auo4noY5+wpI0cr0c59O2rsD7ZGodrt
	rIHfsU5MUhJxzRjDmJ/Ec70=
X-Google-Smtp-Source: AGHT+IFkAF8xyyVRvjbkhV0Imar1p4RnoaCvAzq2XlE+nsr9Wcq6xdWObgKdx8piQfIZ52SF7bMauQ==
X-Received: by 2002:a17:906:74d6:b0:a23:fb2:e6c4 with SMTP id z22-20020a17090674d600b00a230fb2e6c4mr186158ejl.233.1702555219291;
        Thu, 14 Dec 2023 04:00:19 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id ss27-20020a170907c01b00b00a1d9afe42f0sm9248350ejc.35.2023.12.14.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:00:19 -0800 (PST)
Date: Thu, 14 Dec 2023 14:00:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS
 MDIO-device support
Message-ID: <20231214120016.wgeip3mdro5ihnxe@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-11-fancer.lancer@gmail.com>
 <20231205111351.xjjuwpbf7kwg3vuh@skbuf>
 <uivunnjv5vi3w3fkc5w2f4lem5bingrgajgjfsu2ih7fuhz6hd@3naeubr5spak>
 <20231205122316.ihhpklv222f5giz3@skbuf>
 <nflj4ajgx3byqhwna2eslldwulbbafmcwba4dwgxo65o5c7pmj@zbgqt2zje4ix>
 <20231208163343.5s74bmirfna3o7yw@skbuf>
 <xhj7jchcv63y2bmnedxqffnmh3fvdxirccdugnnljruemuiurz@ceafs7mivbqp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhj7jchcv63y2bmnedxqffnmh3fvdxirccdugnnljruemuiurz@ceafs7mivbqp>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023 at 02:54:00PM +0300, Serge Semin wrote:
> > > > The pcs-rzn1-miic.c driver puts a device_link to the MAC to at least
> > > > tear down the whole thing when the PCS is unbound, which is saner than
> > > > crashing the kernel. I don't see the equivalent protection mechanism here?
> > > 
> > > You are right. I don't have any equivalent protection here. Thanks for
> > > suggesting a solution.
> > 
> > I think that a device link between the "ethernet" device and the "mdio"
> > device (controller, parent of the PHY or PCS), if the Ethernet is not a
> > parent of the MDIO controller, could also solve that. But it would also
> > require ACK from PHY maintainers, who may have grander plans to address
> > this snag.
> 
> Ok. I'll add it in v2. Let's see what the maintainers think about
> that.

Are you not following the parallel discussion on the topic of PCS
devices having bound drivers?
https://lore.kernel.org/netdev/ZXnV%2FPk1PYxAm%2FjS@shell.armlinux.org.uk/

Sadly I don't have much spare time to join that discussion, but it looks
like you could.
