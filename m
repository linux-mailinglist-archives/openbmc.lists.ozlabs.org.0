Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A29507FF7E2
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 18:16:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kNXWy7Ah;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh2sS0x0Wz3cNV
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 04:16:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kNXWy7Ah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh2rp0K1Fz2yDY
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 04:15:36 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d3c7ef7b31so2752867b3.3
        for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701364533; x=1701969333; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rUEJMCiwK1IimuLmpZAvnaV23jPetFgYdyhHNBMmmMM=;
        b=kNXWy7AhGkQZFkQXMFJKiJPWm/pXmTsRl5Tx0DVPvaj3J5GBabvjFQgv5A1wjgawrR
         T43Zk4t5oWdCDfYURaaB6O7ozJq61EH/JxeLed/KCkWKrRhhEtCUhbMVttKNcs5O3U61
         /wMvRzs0fn8IuliwPiohigrI1ThgnmlnrA/xwIoLWoZVyeTAoVcleLnWeszToqaJtgVW
         uR2m7uJDRGiavE8jD4bSUQuiZjYVCJVxpmqndM+C9Av4TFqdHt/krvl5jlzHidxpRaKX
         F6Z85QBND3PNHn1fTARP3dFstrKgyTDd1KnFmwQnoFA5h2P1fHsglXtTSiP5nBMv+Z6K
         yBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701364533; x=1701969333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUEJMCiwK1IimuLmpZAvnaV23jPetFgYdyhHNBMmmMM=;
        b=WO/DnNvZRDRdwQbyC1An+AlNvRL6sS0+8sBGuLttxuZMEbi8+1qzvtYFevZO6efLTW
         k5xE7YyxzwlefsyfGvW3KV7myd6jFJLL4g1y7a/+lQAqVFA9eClYTaYEEnJitMQKkq0v
         Ph9p3XXKutu47klC352IRNwo5UVA5KDYGjdupmeeVmcL3ywhGhnMdsI71HJB6EaRTdAc
         dn0HwnqKi6diHxH21gSQahy3J/KojrQI2/ckiSnqkZBN/y4HbIonjxpiSGjMGWO0maVh
         CLNRrBkIW8sSybLQOPAioyJyrUKPcYFS9dUWim2uhG6ZktqrX3Gf/r8fglrRQjI+SG2r
         vIWA==
X-Gm-Message-State: AOJu0Yw357zkNZhd/o3vco0OIRukF7KuwIa6te+Ns0iSBa2NC1oBAcVQ
	0sbmu30FXOeEXTyqf1GVwU+VQQRHkfn/6iewRtg=
X-Google-Smtp-Source: AGHT+IErvA2RyH4g/m74oMEXpowU9Ue1ZkuQKHoyzXHdNG4/HUE13vw8TPWvMWjjM1lDHYhxc1hrEUPuGNakOFAxacU=
X-Received: by 2002:a81:ad1c:0:b0:5cb:ee2d:5f5d with SMTP id
 l28-20020a81ad1c000000b005cbee2d5f5dmr18972117ywh.39.1701364533098; Thu, 30
 Nov 2023 09:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <ZVzQh9ykusyknGgP@shell.armlinux.org.uk> <CAP6Zq1gzAhp9BZNX1MOozUfQc82Vi_S==on5_nOfVfpvtgnN2g@mail.gmail.com>
 <ZWS8m66LrrRQpbLO@shell.armlinux.org.uk>
In-Reply-To: <ZWS8m66LrrRQpbLO@shell.armlinux.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Nov 2023 19:15:21 +0200
Message-ID: <CAP6Zq1gLmOmtQ6081CubDsG4_CNvjBSMGdA2TTE4o+QJX8c=ZA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: alexandre.torgue@foss.st.com, tali.perry1@gmail.com, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com, benjaminfair@google.com, openbmc@lists.ozlabs.org, joabreu@synopsys.com, joel@jms.id.au, devicetree@vger.kernel.org, j.neuschaefer@gmx.net, robh+dt@kernel.org, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Russell,

On Mon, 27 Nov 2023 at 17:58, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Nov 22, 2023 at 07:23:28PM +0200, Tomer Maimon wrote:
> > Hi Russell,
> >
> > Thanks for your comments.
> >
> > On Tue, 21 Nov 2023 at 17:45, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Tue, Nov 21, 2023 at 05:17:33PM +0200, Tomer Maimon wrote:
> > > > Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.
> > > >
> > > > And modify MAINTAINERS to add a new F: entry for this driver.
> > > >
> > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > >
> > > A few comments on this...
> > >
> > > > +#define IND_AC_BA_REG                0x1FE
> > > > +#define SR_MII_CTRL          0x3E0000
> > > > +
> > > > +#define PCS_SR_MII_CTRL_REG  0x0
> > > > +#define PCS_SPEED_SELECT6    BIT(6)
> > > > +#define PCS_AN_ENABLE                BIT(12)
> > > > +#define PCS_SPEED_SELECT13   BIT(13)
> > > > +#define PCS_RST                      BIT(15)
> > >
> > > include/uapi/linux/mii.h:
> > >
> > > #define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
> > > #define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
> > > #define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
> > > #define BMCR_RESET              0x8000  /* Reset to default state      */
> > >
> > > Look familiar? Maybe use the standard definitions for a standardised
> > > register?
> > >
> > > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > > +                      struct plat_stmmacenet_data *plat_dat)
> > > > +{
> > > > +     u16 val;
> > > > +
> > > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +     val |= PCS_RST;
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +
> > > > +     while (val & PCS_RST)
> > > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > >
> > > What if the PCS never clears its reset bit? Maybe use
> > > read_poll_timeout() ?
> > >
> > > > +
> > > > +     val &= ~(PCS_AN_ENABLE);
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +}
> > >
> > > Also, maybe it's time to require new stmmac platform support to start
> > > making use of the phylink PCS support rather than continuing to code its
> > > own?
> > >
> > > I notice, however, that you always disable inband signalling - please
> > > explain why. Also, what protocol does the PCS use when communicating
> > > with the PHY?
> > With disable inband signalling you mean disable auto negotiation?
>
> Over a SGMII, 1000base-X, USXGMII etc link, there is an inband
> signalling method. Whether it is "auto negotiation" depends on your
> point of view.
>
> With 1000base-X, it is "auto negotiation" because the two link partners
> advertise their abilities, and resolve the operational link parameters.
> In essence, there is a negotiation between both ends.
>
> In the case of e.g. Cisco SGMII, "auto negotiation" is a total misnomer.
> There is no "negotiation". The SGMII PHY side re-purposes the 1000base-X
> inband 16-bit control word to inform the MAC about the negotiated
> speed and duplex settings, and the MAC can only say "yes thank you for
> that" back to the PHY. There is no "and this is what I'm doing" to it.
> So there's no "negotiation" in SGMII.
>
> So, I prefer using "inband signalling" because that more accurately
> describes both of these situations, whereas "auto negotiation" does
> not.
>
> Note also that whenever I see "SGMII", that means Cisco's SGMII,
> which is 1000base-X modified by Cisco, and doesn't include the IEEE
> 802.3 1000base-X.
>
> > if
> > yes it is because the PCS sgmii is connected to the external phy AN
> > and is not working between the PCS and external phy.
>
> What if the external PHY wants to use Cisco SGMII inband signalling?
This is not working with the external PHY we using (BCM54210S) and
this is why we disable the inband signalling in the PCS.
> > accessing the PCS registers is indirect. The top 13 bits (bits 21-9)
> > of the offset have to be written to Indirect Access Base register
> > bits 12:0 before indirectly accessing the target register with the
> > offset of the bottom 9 bits (8:0) of the offset
>
> I'm not sure how this connects with my email. I asked what protocol
> is used between the PCS and PHY, and I _think_ you've said that it's
> Cisco SGMII.
>
> Please give details of which PHY is being used - I'd like to know
> more about why the inband signalling isn't being used.
We are using BRCM PHY, BCM54210S.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks,

Tomer
