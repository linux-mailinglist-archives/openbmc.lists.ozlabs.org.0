Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645181301E
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 13:29:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PPwYybh5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrWrS62mZz2yN8
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 23:29:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PPwYybh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrWqt1vkRz2yGv
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 23:29:13 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2cc259392a6so55893011fa.2
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 04:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702556948; x=1703161748; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hKkOlqtXnQi1CXioJeNrKbuA1zxevHtK9i/pmWXuhPs=;
        b=PPwYybh5hsMATtsqRz4eADWpy0ObXfL80nHWKwQR18cGmclQpjt6Dje3xe24Wn3ddW
         K6KqubVqhL2+1fuXJcXCw5OfXFd8vUFx67yCmPurHPklIQG2o88Pt5H1qc4mhui/l7Rj
         82cAo4XicDbiov00j3U9OQm1WhHraWBtYUmt2EYvmPhR3IYnXvA3W54/RvK1DSWIIB93
         meaKWSWoFMgEsX7uTs2vnlyvyzTFdlVC+sCejjgk4p6udzhyBPSRoCCpmoA9oPZRwxs7
         y3KAJ/v9JqDWPuBJIDyn+khaYY9rL64/QjEIlYfs5BRHECAuYusStLFN6MEXfXBN+2M+
         4pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556948; x=1703161748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKkOlqtXnQi1CXioJeNrKbuA1zxevHtK9i/pmWXuhPs=;
        b=h2fsZCDeqx06tkE0fE+Kr1F2hrERQHQBCiRC7deO+Ctj6sTmA4TD27bvf/gDDj+atZ
         eCCFNAE6Zv2nXWo+jnbGSvinPFSpZSll+63DRLwplwVMWOgtp7Ne+SzANxnjQWJJBuYH
         er6xA6dZcvloFO3trABKpuikaxJAFC2HwpdbuNNT52lUrvf7GcP/qIqt6F9oEJ/VQJZ2
         hm9phXLK0MRvjrCo2ZmmfppD2QVQLzphGc59JyElpMUdIFqLPh80sP70ex9pkFFJHVgp
         /I+XE3pXzEZVAhvawR5Z78Rh3EWg79xWQ7cT+oyn4DgFNiAdRKJPFSYVVIJEkA7qEsoy
         SGqA==
X-Gm-Message-State: AOJu0YzXn918Su67qVXZ0bc//xqbmNVOoKpjFgoCd8aoLyIwmGtUqoEu
	qQl0Ikr5qsWSP3R2/TemN18=
X-Google-Smtp-Source: AGHT+IHT6Syfor5yq9T7eo4jSSMy2o+vRuqPr7cfTtYXt59vOt5802fiJ9vq9yDDRmVoosxtqQtXEg==
X-Received: by 2002:a05:651c:2221:b0:2cc:2012:7509 with SMTP id y33-20020a05651c222100b002cc20127509mr3762737ljq.98.1702556948246;
        Thu, 14 Dec 2023 04:29:08 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id j1-20020a2e8241000000b002c9f70a0419sm2040940ljh.140.2023.12.14.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:29:03 -0800 (PST)
Date: Thu, 14 Dec 2023 15:28:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS
 MDIO-device support
Message-ID: <wz7h5lvxnhw2rav6s54dhv2xbxsks6tlpx3hvywjn3afmkf2av@tbiigyupuga7>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-11-fancer.lancer@gmail.com>
 <20231205111351.xjjuwpbf7kwg3vuh@skbuf>
 <uivunnjv5vi3w3fkc5w2f4lem5bingrgajgjfsu2ih7fuhz6hd@3naeubr5spak>
 <20231205122316.ihhpklv222f5giz3@skbuf>
 <nflj4ajgx3byqhwna2eslldwulbbafmcwba4dwgxo65o5c7pmj@zbgqt2zje4ix>
 <20231208163343.5s74bmirfna3o7yw@skbuf>
 <xhj7jchcv63y2bmnedxqffnmh3fvdxirccdugnnljruemuiurz@ceafs7mivbqp>
 <20231214120016.wgeip3mdro5ihnxe@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214120016.wgeip3mdro5ihnxe@skbuf>
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

On Thu, Dec 14, 2023 at 02:00:16PM +0200, Vladimir Oltean wrote:
> On Thu, Dec 14, 2023 at 02:54:00PM +0300, Serge Semin wrote:
> > > > > The pcs-rzn1-miic.c driver puts a device_link to the MAC to at least
> > > > > tear down the whole thing when the PCS is unbound, which is saner than
> > > > > crashing the kernel. I don't see the equivalent protection mechanism here?
> > > > 
> > > > You are right. I don't have any equivalent protection here. Thanks for
> > > > suggesting a solution.
> > > 
> > > I think that a device link between the "ethernet" device and the "mdio"
> > > device (controller, parent of the PHY or PCS), if the Ethernet is not a
> > > parent of the MDIO controller, could also solve that. But it would also
> > > require ACK from PHY maintainers, who may have grander plans to address
> > > this snag.
> > 
> > Ok. I'll add it in v2. Let's see what the maintainers think about
> > that.
> 
> Are you not following the parallel discussion on the topic of PCS
> devices having bound drivers?
> https://lore.kernel.org/netdev/ZXnV%2FPk1PYxAm%2FjS@shell.armlinux.org.uk/
> 
> Sadly I don't have much spare time to join that discussion, but it looks
> like you could.

Ok. Thanks for sharing the link. At least I'll follow up the
discussion in order to pick up/wait for a solution they'll come up
with.

-Serge(y)
