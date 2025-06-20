Return-Path: <openbmc+bounces-265-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8AAE152C
	for <lists+openbmc@lfdr.de>; Fri, 20 Jun 2025 09:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqG51Ggqz30MY;
	Fri, 20 Jun 2025 17:43:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750405389;
	cv=none; b=fxuNVCwEh8PmA0n5uFSTPw03rU38CHVQhPEjtcwBMRtBP3oDI2PGmRFkyyTeYUKhxae7kQi2kRi1XWnKYQVKDBawoQ2kF8zC0VSYWI2y5Kuu3j4JCZCSI8GSPGi7+z+UMattU+pZVkpTqmuh9LuPS66N6FQSoWipolPRTBpP0l1BJLwAD7w9m7ChvWTd2lwPg7WnjgcdAU04UesPdhzbDTYj2GKXgjmCewjXqcNHOy3eCDCwUy68tR7a4HmJc+s/Z9J2a8Ha0svGDwJOyDvSw+Jfu3uh3d5beUXExcynsc2uZpbqIXB7BFCXIncZCGYOnHDOZUVveCejooZmXWmYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750405389; c=relaxed/relaxed;
	bh=i7/0+Wyt/F5MZdrfVE3XpgV5j2JngVJirMoqeFq65mM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oKR/SpehBxBru5Qa0wpglKr2XP0LSPu67/xum1hJsWA/zeC1p4UvDFO9DP2GOtqHm24MzKEftYZzwPGrertOAjQNn6HxTmKQhMS7WpywNqDLbu+7KX67z6fyFmvN5PbQERoKPbBIHHX2La7Hmc6BJkbPJsgxJvZRW2m94nb6bI9t7hrfQQb7sTBNQ5rPFIwoh2IAFxB/H2a/SpQ6X+WG5Fz3NPYkMirYKslmAwJnVA7yWC7zVTqM7rGPxl47EEKIWCGQlR3lBTNZ4brlNsU1YgQr4P5gdMuvJ3iMgc1eF4jGEm3uhN9ihUeuKGzQ/43LgwovWezPxsrDsswxmND/3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Upnbze+o; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Upnbze+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNqG43jBCz2yF1;
	Fri, 20 Jun 2025 17:43:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750405387;
	bh=i7/0+Wyt/F5MZdrfVE3XpgV5j2JngVJirMoqeFq65mM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Upnbze+oVWrWajZF7Trx4o5DhGMK8sIHMGHpedbaCKqqtEzEprWId2j66qzhef1bm
	 J9uJtaYs+/1SEB2aSPJ9pceE+xxxmsSko5D6WB3iFM1HLjGZWSt+9KPdnTLLLmU8v8
	 Fqc/fkKtMQ4w0EMq9aVmDZI+7Od1rYSluSUwxzxU/M2xS0oFV5F9nElZaS1moTpqZm
	 8LvfocHfXNLAHQK3gqFaVP8IgmZjRUFNNU6KRhYoLpAxsFaFBC4dvdhesOQb6epLmi
	 tq02Jf4MQiyKjrB9dwKawzpt+7BRh/oBrud9XU2qj6pQi9T8DY8m3UhcNz2LLEj8bL
	 hjekzPsCkiziQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D16F3640A0;
	Fri, 20 Jun 2025 15:43:06 +0800 (AWST)
Message-ID: <2d17ec4f5f9e2cfd75902217a8dd621538a73bc2.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset
 can't be cleared issue.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "ulf.hansson@linaro.org"
 <ulf.hansson@linaro.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Fri, 20 Jun 2025 17:13:06 +0930
In-Reply-To: <TYSPR06MB7068A5F04CE0A5BDB03073C0957DA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-2-cool_lee@aspeedtech.com>
	 <80f56269175d8658ba1ab4a1fe9a43d18294ca60.camel@codeconstruct.com.au>
	 <TYSPR06MB7068A5F04CE0A5BDB03073C0957DA@TYSPR06MB7068.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On Thu, 2025-06-19 at 06:53 +0000, Cool Lee wrote:
>=20
> > > Replace sdhci software reset by scu reset from top.
> > >=20
> > > Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> >=20
> > Can you please add a Fixes: tag?
> This patch wasn't used to fix a commit. This is a workaround for a hardwa=
re bug.

A hardware bug in which SoCs? AST2400-AST2700? Or just the AST2700?

> For this condition, do I need a Fixes?

If the bug exists for all SoCs it's a deficiency in the original driver
and so should have a Fixes: tag.

> >=20

> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < ARRAY_SIZE(reg_array); i++)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sdh=
ci_writel(host, save_array[i],
> > > +reg_array[i]);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0sdhci_writew(host, tran_mode,
> > SDHCI_TRANSFER_MODE);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0writel(mmc8_mode, aspeed_sdc->regs);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0aspeed_sdhci_set_clock(host, host->clock);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sdhci_reset(host, mask);
> >=20
> > Given that we do this after the SCU reset above, what exactly is the SC=
U reset
> > fixing? Can you provide more details?
> The issue is sdhci Software Reset ALL (0x12C[24]) cannot complete which m=
eans it's always being 1 and not back to 0.
> The root cause is when sdhci dma operates, it might hold some state signa=
ls which is not well cleared by Software Reset. These signals prevent Softw=
are Reset to be cleared.
> This is a hardware issue so that the workaround is resetting whole SDHCI =
controller from SCU reset.

Can you please put these details in the commit message?

>=20
> >=20
> > > +}
> > > +
> > > =C2=A0static const struct sdhci_ops aspeed_sdhci_ops =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read_l =3D aspeed_sd=
hci_readl,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.set_clock =3D aspeed=
_sdhci_set_clock,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_max_clock =3D as=
peed_sdhci_get_max_clock,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.set_bus_width =3D as=
peed_sdhci_set_bus_width,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_timeout_clock =
=3D sdhci_pltfm_clk_get_max_clock,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.reset =3D sdhci_reset,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.reset =3D aspeed_sdhci_re=
set,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.set_uhs_signaling =
=3D sdhci_set_uhs_signaling,
> > > =C2=A0};
> > >=20
> > > @@ -535,6 +582,12 @@ static int aspeed_sdc_probe(struct
> > > platform_device *pdev)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_init(&sdc->=
lock);
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sdc->rst =3D devm_reset_co=
ntrol_get(&pdev->dev, NULL);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!IS_ERR(sdc->rst)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0reset_control_assert(sdc->rst);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0reset_control_deassert(sdc->rst);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> >=20
> > The clock driver for the AST2400, AST2500 and AST2600 manages the reset=
 as
> > part of managing the clock[1][2].
> >=20
> > [1]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers
> > /clk/clk-aspeed.c?h=3Dv6.16-rc2#n71
> > [2]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers
> > /clk/clk-aspeed.c?h=3Dv6.16-rc2#n209
> >=20
> > What you have here asks for a resets property, but that's not currently
> > specified in the devicetree binding.
> >=20
> > So: is the clock driver not doing the right thing given we enable the c=
lock
> > directly below this hunk? If not, should we fix that instead?
> >=20
> > We can add the resets property to the binding, but I'd also like a bett=
er
> > explanation of the problem.
> For legacy projects, the clock property handles reset simultaneously in t=
he clock driver.
> For new project AST2700, clock and reset are separated, and we add a rese=
t property to the binding.
> Hence, the patch won't affect until the reset property to the binding.
> Should I add the reset property in this patch serious?

Yes, please.

Andrew

