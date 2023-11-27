Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0D7FA570
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 16:59:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=KeHHAhdK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf9JJ0xdyz3cYN
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 02:59:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=KeHHAhdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf9Hg6TYdz3cCl
	for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2023 02:58:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/x+K0NohDOju58WZmfchmXWiIvrloK7WVCcvOl3plTM=; b=KeHHAhdKhbHXQbBQZBTXeU04DU
	2L+5oNvqRgW8p15KQLGI0HmNhiXLoWa5eRi5tfOJ1NilEdyoU36JZrDuqefdREEd1/zmYwR4NPec2
	EYj2j7Z5FNoym+r68w6KCUcBEKxTO0Hza9OHNOlnKvT+iiSCbL0G55/9m23FQlDIAnk6pHyzFpqtm
	apTNcHm5ZXA4YYnRjKvK4nDV5nQTPhCpxZEeexKOIeY5zLbxdkUY0k3/fdCjH5S6RgKA9SteH31Qo
	YFhm20KUKy6/Tna/RJSXxJ1mEmWCJ2JOoY+qFhrRl/l6TXcoW2lwwyJTW0MEquJqX+hREB/YB0YOM
	vmDgHwzA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49996)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r7e04-00068P-2v;
	Mon, 27 Nov 2023 15:58:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r7e03-00022H-C0; Mon, 27 Nov 2023 15:58:19 +0000
Date: Mon, 27 Nov 2023 15:58:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <ZWS8m66LrrRQpbLO@shell.armlinux.org.uk>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
 <CAP6Zq1gzAhp9BZNX1MOozUfQc82Vi_S==on5_nOfVfpvtgnN2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gzAhp9BZNX1MOozUfQc82Vi_S==on5_nOfVfpvtgnN2g@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 07:23:28PM +0200, Tomer Maimon wrote:
> Hi Russell,
> 
> Thanks for your comments.
> 
> On Tue, 21 Nov 2023 at 17:45, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Tue, Nov 21, 2023 at 05:17:33PM +0200, Tomer Maimon wrote:
> > > Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.
> > >
> > > And modify MAINTAINERS to add a new F: entry for this driver.
> > >
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >
> > A few comments on this...
> >
> > > +#define IND_AC_BA_REG                0x1FE
> > > +#define SR_MII_CTRL          0x3E0000
> > > +
> > > +#define PCS_SR_MII_CTRL_REG  0x0
> > > +#define PCS_SPEED_SELECT6    BIT(6)
> > > +#define PCS_AN_ENABLE                BIT(12)
> > > +#define PCS_SPEED_SELECT13   BIT(13)
> > > +#define PCS_RST                      BIT(15)
> >
> > include/uapi/linux/mii.h:
> >
> > #define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
> > #define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
> > #define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
> > #define BMCR_RESET              0x8000  /* Reset to default state      */
> >
> > Look familiar? Maybe use the standard definitions for a standardised
> > register?
> >
> > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > +                      struct plat_stmmacenet_data *plat_dat)
> > > +{
> > > +     u16 val;
> > > +
> > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +     val |= PCS_RST;
> > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +
> > > +     while (val & PCS_RST)
> > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> >
> > What if the PCS never clears its reset bit? Maybe use
> > read_poll_timeout() ?
> >
> > > +
> > > +     val &= ~(PCS_AN_ENABLE);
> > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +}
> >
> > Also, maybe it's time to require new stmmac platform support to start
> > making use of the phylink PCS support rather than continuing to code its
> > own?
> >
> > I notice, however, that you always disable inband signalling - please
> > explain why. Also, what protocol does the PCS use when communicating
> > with the PHY?
> With disable inband signalling you mean disable auto negotiation?

Over a SGMII, 1000base-X, USXGMII etc link, there is an inband
signalling method. Whether it is "auto negotiation" depends on your
point of view.

With 1000base-X, it is "auto negotiation" because the two link partners
advertise their abilities, and resolve the operational link parameters.
In essence, there is a negotiation between both ends.

In the case of e.g. Cisco SGMII, "auto negotiation" is a total misnomer.
There is no "negotiation". The SGMII PHY side re-purposes the 1000base-X
inband 16-bit control word to inform the MAC about the negotiated
speed and duplex settings, and the MAC can only say "yes thank you for
that" back to the PHY. There is no "and this is what I'm doing" to it.
So there's no "negotiation" in SGMII.

So, I prefer using "inband signalling" because that more accurately
describes both of these situations, whereas "auto negotiation" does
not.

Note also that whenever I see "SGMII", that means Cisco's SGMII,
which is 1000base-X modified by Cisco, and doesn't include the IEEE
802.3 1000base-X.

> if
> yes it is because the PCS sgmii is connected to the external phy AN
> and is not working between the PCS and external phy.

What if the external PHY wants to use Cisco SGMII inband signalling?

> accessing the PCS registers is indirect. The top 13 bits (bits 21-9)
> of the offset have to be written to Indirect Access Base register
> bits 12:0 before indirectly accessing the target register with the
> offset of the bottom 9 bits (8:0) of the offset

I'm not sure how this connects with my email. I asked what protocol
is used between the PCS and PHY, and I _think_ you've said that it's
Cisco SGMII.

Please give details of which PHY is being used - I'd like to know
more about why the inband signalling isn't being used.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
