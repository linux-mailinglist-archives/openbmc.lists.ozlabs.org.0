Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187AA7F4FDE
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 19:46:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=p702r9em;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb9Dm138Kz3dJs
	for <lists+openbmc@lfdr.de>; Thu, 23 Nov 2023 05:46:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=p702r9em;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb9DB5HBJz3d97
	for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2023 05:45:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y1fBGTaRbSsoTo5doogPTMVmvkDbZKH9bppQF/sgZqE=; b=p702r9emhkbRvBPO7sN3lEkiso
	/rQFsZ6XCANykAc95fAd27zoV5bytiHkSvzmB691lItmkNeldjgv/Ra/V+XaDFG1s0YVy8iLLUJBy
	2/8q9JbfiTYx3FuHTMgNAHpa18lX4BM8lLM6QbpZS6V7U2hFtWIq2TTc2wDZPtvkhJbU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5sDs-000uBk-Dl; Wed, 22 Nov 2023 19:45:16 +0100
Date: Wed, 22 Nov 2023 19:45:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 07:50:57PM +0200, Tomer Maimon wrote:
> Hi Andrew,
> 
> Thanks for your comments
> 
> On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
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
> > > +
> > > +     val &= ~(PCS_AN_ENABLE);
> > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +}
> >
> > Is this a licensed PCS implementation? Or home grown? If its been
> > licensed from somebody, it maybe should live in driver/net/pcs, so
> > others can reuse it when they license the same core.

> we are using DWC PCS, I don't see support for DWC PCS and I am not
> sure it is supposed to be supported at /drivers/net/pcs

I've not followed the naming used by Synopsys. Is DWC PCS the same as
XPCS? Does Synopsys have multiple PCS implementations?

> I do see a patch set to support DWC PCS but I don't think it answers my needs
> https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/

I _think_ this patch eventually got turned into
driver/net/pcs/pcs-xpcs.c

What exactly does it not do for you?

     Andrew
