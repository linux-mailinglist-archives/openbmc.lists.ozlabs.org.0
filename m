Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B483293368
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 04:58:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFdbw6BnCzDqWL
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 13:58:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hhwqmsA1; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFdZw5R8vzDqT1;
 Tue, 20 Oct 2020 13:57:28 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 208DF222E9;
 Tue, 20 Oct 2020 02:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603162645;
 bh=qwSN9blogEZVLec+dCJS+sFeJavpar63X669kQYp8rY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hhwqmsA1cgEsFROQBL4byLwoaqAmG2QBWW0ddmocqhrtuk7Rr8x6JMM9GM4fq1HPa
 uzuzs1UkoYq/1DXJb5TuShJqcK5svitoMD+7JZ//UQfv2N59j4olJJIN6NdaZ7Sg2V
 UoBNpABhyynRdhwZqKJIsWIgo6z7AhEo6VDDiYpA=
Date: Mon, 19 Oct 2020 19:57:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
Message-ID: <20201019195723.41a5591f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1a02e57b6b7d425a19dc59f84091c38ca4edcf47.camel@kernel.crashing.org>
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <1a02e57b6b7d425a19dc59f84091c38ca4edcf47.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Dylan Hung <dylan_hung@aspeedtech.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 20 Oct 2020 10:23:41 +1100 Benjamin Herrenschmidt wrote:
> On Mon, 2020-10-19 at 12:00 -0700, Jakub Kicinski wrote:
> > On Mon, 19 Oct 2020 08:57:03 +0000 Joel Stanley wrote:  
> > > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > index 00024dd41147..9a99a87f29f3 100644
> > > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > @@ -804,7 +804,8 @@ static netdev_tx_t
> > > > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > > >          * before setting the OWN bit on the first descriptor.
> > > >          */
> > > >         dma_wmb();
> > > > -       first->txdes0 = cpu_to_le32(f_ctl_stat);
> > > > +       WRITE_ONCE(first->txdes0, cpu_to_le32(f_ctl_stat));
> > > > +       READ_ONCE(first->txdes0);    
> > > 
> > > I understand what you're trying to do here, but I'm not sure that
> > > this
> > > is the correct way to go about it.
> > > 
> > > It does cause the compiler to produce a store and then a load.  
> > 
> > +1 @first is system memory from dma_alloc_coherent(), right?
> > 
> > You shouldn't have to do this. Is coherent DMA memory broken 
> > on your platform?  
> 
> I suspect the problem is that the HW (and yes this would be a HW bug)
> doesn't order the CPU -> memory and the CPU -> MMIO path.
> 
> What I think happens is that the store to txde0 is potentially still in
> a buffer somewhere on its way to memory, gets bypassed by the store to
> MMIO, causing the MAC to try to read the descriptor, and getting the
> "old" data from memory.

I see, but in general this sort of a problem should be resolved by
adding an appropriate memory barrier. And in fact such barrier should
(these days) be implied by a writel (I'm not 100% clear on why this
driver uses iowrite, and if it matters).

> It's ... fishy, but that isn't the first time an Aspeed chip has that
> type of bug (there's a similar one in the USB device controler iirc).

Argh.
