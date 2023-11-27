Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639717FA446
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 16:20:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOMCYZNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf8Qp66bCz3cYV
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 02:20:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOMCYZNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf8QD3LL6z2yN3
	for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2023 02:19:30 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so3988565276.1
        for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2023 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701098367; x=1701703167; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIKMvlIRYtS1WvbUoM+vWJ1z9I2GYsx2bfxFTfmC+TQ=;
        b=fOMCYZNQweBgyJc2OSeFNbBNHkoZ9VeZd0/8BML/0lHB95IIDeSetASrn2rBqevfjA
         bAlJw49WgGoITd1x0nN+VRDBV0v1yuyxEh4ElY/xO60SbHaL2ezSUmByUJ/Jq5tvpNSK
         yYc6fJdA/Yf9Fg/J+lLoLFJRHYbDmr7x1j4Pf8SDkls6bzkNzDTZfv9KvAWJjC841UiI
         2tTCaPPTz5/O/h8+QV0lOkXkU0AozfcqcmKTm7IGpoth0mxlh0Sg0iF3RHG28ha55u5h
         /LOqXtjmntxH92/qfWKoSKj212vYJMpiBpKU+/hNpkMhQQC99/JIOJuSOUFN0RUmrjsF
         d/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701098367; x=1701703167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIKMvlIRYtS1WvbUoM+vWJ1z9I2GYsx2bfxFTfmC+TQ=;
        b=b3qjTk3zf2RZYPLTfO8tMe05Cm8jOX/1DafiyOqSVa+dcZ1QuOlfjrDru5Uxtf4j0i
         82b8SsqRrjXnKXQi7vVVGvXPsZny8/Ygfm0zjiqBb6RJYg+tJXzL/d/NRY3sZBatyWOz
         Dvr8irqbcgvnB2u69O0I7r1O9ouR54NjfMpVPIoGYWHBVYeipg/jHlMBU621BzYO+WzF
         KlD2v9oYH/joRntP2A449AEpAdt7O9e16JW5L1Dq1eMbB957hUV3vdPnJ+Z4CrI9/SNl
         HB8jfOPeBCP7WdMVShaNmp52bZP8dRBS+3KkWtr2Wt5GG8BXmdTexhrZ4DKXoK7b3Vwo
         gNKg==
X-Gm-Message-State: AOJu0Yxh2ef1DkPtM7oZPAc045qldVOqKJJeK2+WJzevlUao1zVD18Dk
	UNrOf0hsq1L0DjnABqumAwMJC+SBH6jkkBPmDCY=
X-Google-Smtp-Source: AGHT+IE/rFqsV0KKN1gYLmgiErQUf25fY8S0FvfOygtZwLf5Ah7JOJcfJbDXf3oSBTUYCLBu/J8CZ1DTNOo/phyIfOI=
X-Received: by 2002:a25:4b02:0:b0:db0:23d8:780 with SMTP id
 y2-20020a254b02000000b00db023d80780mr9466434yba.60.1701098366826; Mon, 27 Nov
 2023 07:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch> <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch> <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
In-Reply-To: <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Nov 2023 17:19:15 +0200
Message-ID: <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
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

I took a look at the xpcs driver and the stmmac driver and it doesn't
cover NPCM use.

in the NPCM case the stmmac ID=0x37 therefore the driver is linked to DWMAC1000
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/hwif.c#L139

to enable the xpcs, the stmmac should support xgmac or gmac4 and in
the NPCM is support only gmac.
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L555
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L573

and the most important thing is that the XPCS is handled through an
indirect register access and not through MDIO. the MDIO is connected
to the external PHY and not to the XPCS.

In that case, I think the best way to handle the XPCS is through the
NPCM glue layer, what do you think?

Thanks,

Tomer

On Thu, 23 Nov 2023 at 15:50, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Andrew,
>
> On Wed, 22 Nov 2023 at 20:45, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Nov 22, 2023 at 07:50:57PM +0200, Tomer Maimon wrote:
> > > Hi Andrew,
> > >
> > > Thanks for your comments
> > >
> > > On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > > > +                      struct plat_stmmacenet_data *plat_dat)
> > > > > +{
> > > > > +     u16 val;
> > > > > +
> > > > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +     val |= PCS_RST;
> > > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +
> > > > > +     while (val & PCS_RST)
> > > > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +
> > > > > +     val &= ~(PCS_AN_ENABLE);
> > > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +}
> > > >
> > > > Is this a licensed PCS implementation? Or home grown? If its been
> > > > licensed from somebody, it maybe should live in driver/net/pcs, so
> > > > others can reuse it when they license the same core.
> >
> > > we are using DWC PCS, I don't see support for DWC PCS and I am not
> > > sure it is supposed to be supported at /drivers/net/pcs
> >
> > I've not followed the naming used by Synopsys. Is DWC PCS the same as
> > XPCS? Does Synopsys have multiple PCS implementations?
> >
> > > I do see a patch set to support DWC PCS but I don't think it answers my needs
> > > https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/
> >
> > I _think_ this patch eventually got turned into
> > driver/net/pcs/pcs-xpcs.c
> >
> > What exactly does it not do for you?
> Thanks for pointing me to Synopsys (DWC) PCS in pcs-xpcs.c I need to
> check if the driver follows all our SGMII needs
> >
> >      Andrew
>
> Best regards,
>
> Tomer
