Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B59022934F0
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 08:24:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFkB95xHjzDqV4
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 17:24:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFk9D2DPDzDqRc;
 Tue, 20 Oct 2020 17:24:00 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09K6NX2W029493
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 20 Oct 2020 01:23:38 -0500
Message-ID: <d5c4682b3e049f7dac66b17e7a726b8c20ee5789.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/4] ftgmac100: Fix race issue on TX descriptor[0]
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Oct 2020 17:23:33 +1100
In-Reply-To: <CACPK8XdECaKwdQgWFQ=sRBiCjDLXHtMKo=o-xQZPmMZyevOukQ@mail.gmail.com>
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-2-dylan_hung@aspeedtech.com>
 <be7a978c48c9f1c6c29583350dee6168385c3039.camel@kernel.crashing.org>
 <CACPK8XdECaKwdQgWFQ=sRBiCjDLXHtMKo=o-xQZPmMZyevOukQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dylan Hung <dylan_hung@aspeedtech.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-10-20 at 04:13 +0000, Joel Stanley wrote:
> On Mon, 19 Oct 2020 at 23:20, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > 
> > On Mon, 2020-10-19 at 16:57 +0800, Dylan Hung wrote:
> > > These rules must be followed when accessing the TX descriptor:
> > > 
> > > 1. A TX descriptor is "cleanable" only when its value is non-zero
> > > and the owner bit is set to "software"
> > 
> > Can you elaborate ? What is the point of that change ? The owner
> > bit
> > should be sufficient, why do we need to check other fields ?
> 
> I would like Dylan to clarify too. The datasheet has a footnote below
> the descriptor layout:
> 
>  - TXDES#0: Bits 27 ~ 14 are valid only when FTS = 1
>  - TXDES#1: Bits 31 ~ 0 are valid only when FTS = 1
> 
> So the ownership bit (31) is not valid unless FTS is set. However,
> this isn't what his patch does. It adds checks for EDOTR.

No I think it adds a check for everything except EDOTR which just marks
the end of ring and needs to be ignored in the comparison.

That said, we do need a better explanation.

One potential bug I did find by looking at my code however is:

static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
{
	struct net_device *netdev = priv->netdev;
	struct ftgmac100_txdes *txdes;
	struct sk_buff *skb;
	unsigned int pointer;
	u32 ctl_stat;

	pointer = priv->tx_clean_pointer;
	txdes = &priv->txdes[pointer];

	ctl_stat = le32_to_cpu(txdes->txdes0);
	if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
		return false;

	skb = priv->tx_skbs[pointer];
	netdev->stats.tx_packets++;
	netdev->stats.tx_bytes += skb->len;
	ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
	txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);

  ^^^^ There should probably be an smp_wmb() here to ensure that all the above
stores are visible before the tx clean pointer is updated.

	priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);

	return true;
}

Similarly we probablu should have one before setting tx_pointer in start_xmit().

As for the read side of this, I'm not 100% sure, I'll have to think more about
it, it *think* the existing barriers are sufficient at first sight.

Cheers,
Ben.

> > 
> > > 2. A TX descriptor is "writable" only when its value is zero
> > > regardless the edotr mask.
> > 
> > Again, why is that ? Can you elaborate ? What race are you trying
> > to
> > address here ?
> > 
> > Cheers,
> > Ben.
> > 
> > > Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
> > > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > index 00024dd41147..7cacbe4aecb7 100644
> > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > @@ -647,6 +647,9 @@ static bool
> > > ftgmac100_tx_complete_packet(struct
> > > ftgmac100 *priv)
> > >       if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
> > >               return false;
> > > 
> > > +     if ((ctl_stat & ~(priv->txdes0_edotr_mask)) == 0)
> > > +             return false;
> > > +
> > >       skb = priv->tx_skbs[pointer];
> > >       netdev->stats.tx_packets++;
> > >       netdev->stats.tx_bytes += skb->len;
> > > @@ -756,6 +759,9 @@ static netdev_tx_t
> > > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > >       pointer = priv->tx_pointer;
> > >       txdes = first = &priv->txdes[pointer];
> > > 
> > > +     if (le32_to_cpu(txdes->txdes0) & ~priv->txdes0_edotr_mask)
> > > +             goto drop;
> > > +
> > >       /* Setup it up with the packet head. Don't write the head
> > > to
> > > the
> > >        * ring just yet
> > >        */
> > > @@ -787,6 +793,10 @@ static netdev_tx_t
> > > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > >               /* Setup descriptor */
> > >               priv->tx_skbs[pointer] = skb;
> > >               txdes = &priv->txdes[pointer];
> > > +
> > > +             if (le32_to_cpu(txdes->txdes0) & ~priv-
> > > > txdes0_edotr_mask)
> > > 
> > > +                     goto dma_err;
> > > +
> > >               ctl_stat = ftgmac100_base_tx_ctlstat(priv,
> > > pointer);
> > >               ctl_stat |= FTGMAC100_TXDES0_TXDMA_OWN;
> > >               ctl_stat |= FTGMAC100_TXDES0_TXBUF_SIZE(len);

