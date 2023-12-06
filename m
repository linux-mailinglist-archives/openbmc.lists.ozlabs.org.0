Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750C8075AD
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 17:48:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kKki1klJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sljz55z6tz3cVf
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 03:48:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kKki1klJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SljyT5CSgz3c4s
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 03:48:15 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bce78f145so8706977e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701881288; x=1702486088; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGSzAZDHU/n9n4Kl/KgrYsUZ99ohOk5K4a9HJ2xbUCo=;
        b=kKki1klJrwAFa1hLnG3r6OnapzcaYKXpnz4U6Tfm9+x+MMB8AxJ4uai4YTtTnqJBtd
         ottYmyIMlQrc1BgWkA6jq9U0i9P3orwUkZfqixLsMjcuUQTXsT8HelUt/XmVetCk5WC8
         n1g7WZ8ERHBNQ6uGaTrTtKM2+J0HVCHdHe5ZywHgEqRWE5CFWEFtXGBU+dPQD1/QWcV6
         Bne35sOR+MUgnjuVdRzseM4Athvzck/Fo9ec4PwXHhbXvXAXiCBfdvCtAWj7svhN3oas
         JutsNErE1jKm8aKYVVnd6/K0p0cDken9fPdEshuN16IqePTJb1yDQk0Ls0vcdbUMV2Ue
         SpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701881288; x=1702486088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGSzAZDHU/n9n4Kl/KgrYsUZ99ohOk5K4a9HJ2xbUCo=;
        b=UQIb9cJHXK8JqG5/azjcjeknsbHEUdUwVtQX8XnrfmaDP4AimLiRa3IzJWzpkRpRRt
         Bs8LMtc3TgdDi4rNbg0vLaHfUWehFbDh2yLrh4trj01wVQ5cazOYnJ4BIbgf6em6eW2q
         EBxYKGIVuXEFvcn//g1vM/OZgTkA0gebulThZ32z4eqmhMn8xLtY0qm83dqhx4+aeU9n
         9BLZmue17WRy5MXY3gnbBTGx12nsd66V8NVqnjEyj9BiW8Hj/vA/KDsra+oXxXszS2wO
         Mhr2+QRosV4aLV8cJogwKTUekquGjfix7EDWwJIFavwFCRlChtva0YVUoxhbIAPc4fk8
         uOxQ==
X-Gm-Message-State: AOJu0YwFGPurDnS99xhIwrhZcrq/PMo4fsBI4EyWXGwSCOMIgPZzYI6k
	bOlilywVFwTe/my8AnpXciQ=
X-Google-Smtp-Source: AGHT+IGGsCsfCn951B9opx/elkmniv97coLdGTP1IxFSUUNeCLwVpJYe73n4VNAi886eyirSlSS2Sg==
X-Received: by 2002:ac2:5928:0:b0:50b:fdc0:acbb with SMTP id v8-20020ac25928000000b0050bfdc0acbbmr390516lfi.138.1701881288167;
        Wed, 06 Dec 2023 08:48:08 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id n16-20020ac242d0000000b0050bde64af5esm1442481lfl.174.2023.12.06.08.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:48:07 -0800 (PST)
Date: Wed, 6 Dec 2023 19:48:05 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS
 management interface support
Message-ID: <cv6oo27tqbfst3jrgtkg7bcxmeshadtzoomn2xgnzh2arz4nwy@wq5k7oygto6n>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-10-fancer.lancer@gmail.com>
 <20231205133205.3309ab91@device.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205133205.3309ab91@device.home>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Maxime,

On Tue, Dec 05, 2023 at 01:32:05PM +0100, Maxime Chevallier wrote:
> Hi Serge,
> 
> On Tue,  5 Dec 2023 13:35:30 +0300
> Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > Synopsys DesignWare XPCS IP-core can be synthesized with the device CSRs
> > being accessible over MCI or APB3 interface instead of the MDIO bus (see
> > the CSR_INTERFACE HDL parameter). Thus all the PCS registers can be just
> > memory mapped and be a subject of standard MMIO operations of course
> > taking into account the way the Clause C45 CSRs mapping is defined. This
> > commit is about adding a device driver for the DW XPCS Management
> > Interface platform device and registering it in the framework of the
> > kernel MDIO subsystem.
> > 
> > DW XPCS platform device is supposed to be described by the respective
> > compatible string "snps,dw-xpcs-mi", CSRs memory space and optional
> > peripheral bus clock source. Note depending on the INDIRECT_ACCESS DW XPCS
> > IP-core synthesize parameter the memory-mapped reg-space can be
> > represented as either directly or indirectly mapped Clause 45 space. In
> > the former case the particular address is determined based on the MMD
> > device and the registers offset (5 + 16 bits all together) within the
> > device reg-space. In the later case there is only 256 lower address bits
> > are utilized for the registers mapping. The upper bits are supposed to be
> > written into the respective viewport CSR in order to reach the entire C45
> > space.
> 

> Too bad the mdio-regmap driver can't be re-used here, it would deal
> with reg width for you, for example. I guess the main reason would be
> the direct vs indirect accesses ?

Right, it's one of the reasons. I could have used the mdio-regmap
here, but that would have meant to implement an additional abstraction
layer: regspace<->regmap<->mdio-regmap<->mii_bus, instead of just
regspace<->mii_bus. This would have also required to patch the
mdio-remap module somehow in order to have the c45 ops supported. It
would have been much easier to do before the commit 99d5fe9c7f3d ("net:
mdio: Remove support for building C45 muxed addresses"). But since
then MDIO reg-address has no longer had muxed dev-address. Of course I
could have got it back to the mdio-regmap driver only, mix the C22/C45
address in the regmap 'addr' argument, then extract the MMD (for C45)
and reg addresses from the regmap IO ops argument and perform the
respective MMIO access. But as you can see it is much hardware and
would cause additional steps for the address translations, than
just directly implement the C22/C45 IO ops and register the MDIO bus
for them. I couldn't find much benefits to follow that road, sorry.

> 
> I do have a comment tough :
> 
> [...]
> 
> > +static inline ptrdiff_t dw_xpcs_mmio_addr_format(int dev, int reg)
> > +{
> > +	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
> > +}
> > +
> > +static inline u16 dw_xpcs_mmio_addr_page(ptrdiff_t csr)
> > +{
> > +	return FIELD_GET(0x1fff00, csr);
> > +}
> > +
> > +static inline ptrdiff_t dw_xpcs_mmio_addr_offset(ptrdiff_t csr)
> > +{
> > +	return FIELD_GET(0xff, csr);
> > +}
> 

> You shouldn't use inline in C files, only in headers.

Could you please clarify why? I failed to find such requirement in the
coding style doc. Moreover there are multiple examples of using the
static-inline-ers in the C files in the kernel including the net/mdio
subsystem.

-Serge(y)

> 
> Maxime
