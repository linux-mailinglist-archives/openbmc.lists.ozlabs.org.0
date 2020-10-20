Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B14ED29358C
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 09:14:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFlHB462VzDqVl
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 18:14:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XzEidc1j; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFlGG4W7gzDqQt;
 Tue, 20 Oct 2020 18:13:22 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id bl9so416883qvb.10;
 Tue, 20 Oct 2020 00:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PA9Wa1SiY6hyH8FIU50gSMSHYgRTDfYciP+5Dx8W34s=;
 b=XzEidc1j3N/4sD7YZjTcKaCT5N+dqpIimWd6+RnFSCNH5kdHm+AYT1mNcciLT7VlVJ
 POc6hqBRw1mP+KNalXcEdAgAZDdgQWBWLXL0zm1166LDpoVqYVJeAn3XstkYuvL3Qzge
 JEy+ZczvzwOxpLdKHGKpCVHWWvFgwoC/zPCrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PA9Wa1SiY6hyH8FIU50gSMSHYgRTDfYciP+5Dx8W34s=;
 b=bA8E58iZZ2uMsuJSqSXJuPEW96gukcGlIricJcViSs8Tb6Wff39YkpKGTbzPren+YO
 HATp6PHYDSKFou68wYsPQKOI4v6V0pajYwWshY+s27/H9JayKJbrhDLQvHATx97/3Ag3
 vblW58dpPp58Xae5JlCWeU0Oc/WUFAEh7Z9r5mFXa/j0679wLwVaSy0fGmzeue/sKpRa
 O1dUwE8wSaO5D5vqKkdSVzf4JQWlxtUlM5HsFO8WEeBejyka4+ZnufE/WV+znRknayA2
 27KFNlK7MkH4GiyEhj1YXL5wvcE5ylGpnZ4tsvSEY3Nr3tv9wyViZtu2U2dm9CP5eaHG
 DLDA==
X-Gm-Message-State: AOAM533oO78+uMaWO/f62pIQe5LYegOM7rt8MJQ0B1tG2ZOZrTuE9R++
 /leq2KliP5Xnru8RisKL/qavmTdZDAt4qkr+rYY=
X-Google-Smtp-Source: ABdhPJw4XY9rW9EJ2taaPzlNLDZ3itQS/JkWnqB6+HKcVZOvGs56YafEB2G9/ugJ6/j5nkkwiDJQwWKU/EUOxf5hYE4=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr1682340qvu.61.1603177997875; 
 Tue, 20 Oct 2020 00:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-2-dylan_hung@aspeedtech.com>
 <be7a978c48c9f1c6c29583350dee6168385c3039.camel@kernel.crashing.org>
 <CACPK8XdECaKwdQgWFQ=sRBiCjDLXHtMKo=o-xQZPmMZyevOukQ@mail.gmail.com>
 <d5c4682b3e049f7dac66b17e7a726b8c20ee5789.camel@kernel.crashing.org>
In-Reply-To: <d5c4682b3e049f7dac66b17e7a726b8c20ee5789.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Oct 2020 07:13:05 +0000
Message-ID: <CACPK8Xdyw7eSw6RqJcku_PHANviovmkbjNSONAB4_K+_+Tt1KQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ftgmac100: Fix race issue on TX descriptor[0]
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dylan Hung <dylan_hung@aspeedtech.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 20 Oct 2020 at 06:23, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Tue, 2020-10-20 at 04:13 +0000, Joel Stanley wrote:
> > On Mon, 19 Oct 2020 at 23:20, Benjamin Herrenschmidt
> > <benh@kernel.crashing.org> wrote:
> > >
> > > On Mon, 2020-10-19 at 16:57 +0800, Dylan Hung wrote:
> > > > These rules must be followed when accessing the TX descriptor:
> > > >
> > > > 1. A TX descriptor is "cleanable" only when its value is non-zero
> > > > and the owner bit is set to "software"
> > >
> > > Can you elaborate ? What is the point of that change ? The owner
> > > bit
> > > should be sufficient, why do we need to check other fields ?
> >
> > I would like Dylan to clarify too. The datasheet has a footnote below
> > the descriptor layout:
> >
> >  - TXDES#0: Bits 27 ~ 14 are valid only when FTS = 1
> >  - TXDES#1: Bits 31 ~ 0 are valid only when FTS = 1
> >
> > So the ownership bit (31) is not valid unless FTS is set. However,
> > this isn't what his patch does. It adds checks for EDOTR.
>
> No I think it adds a check for everything except EDOTR which just marks
> the end of ring and needs to be ignored in the comparison.

Of course. I missed the invert.

I did some testing with just this patch (and "[4/4] ftgmac100: Restart
MAC HW once") from Dylan. It seemed to resolve the hang, but there
were occasional retries. Putting in some tracing I only hit the
condition in ftgmac100_tx_complete_packet, never in
ftgmac100_hard_start_xmit.

> That said, we do need a better explanation.
>
> One potential bug I did find by looking at my code however is:
>
> static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
> {
>         struct net_device *netdev = priv->netdev;
>         struct ftgmac100_txdes *txdes;
>         struct sk_buff *skb;
>         unsigned int pointer;
>         u32 ctl_stat;
>
>         pointer = priv->tx_clean_pointer;
>         txdes = &priv->txdes[pointer];
>
>         ctl_stat = le32_to_cpu(txdes->txdes0);
>         if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
>                 return false;
>
>         skb = priv->tx_skbs[pointer];
>         netdev->stats.tx_packets++;
>         netdev->stats.tx_bytes += skb->len;
>         ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
>         txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);
>
>   ^^^^ There should probably be an smp_wmb() here to ensure that all the above
> stores are visible before the tx clean pointer is updated.
>
>         priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);
>
>         return true;
> }
>
> Similarly we probablu should have one before setting tx_pointer in start_xmit().

I added the two smp_wmb you suggested (with only 4/4 applied). This
did the trick; iperf on a gigabit link is running well with no
retries.

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
b/drivers/net/ethernet/faraday/ftgmac100.c
index 331d4bdd4a67..15cdfeb135b0 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct
ftgmac100 *priv)
     ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
     txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);

+    /* Ensure the descriptor config is visible before setting the tx
+     * pointer.
+     */
+    smp_wmb();
+
     priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);

     return true;
@@ -806,6 +811,11 @@ static netdev_tx_t
ftgmac100_hard_start_xmit(struct sk_buff *skb,
     dma_wmb();
     first->txdes0 = cpu_to_le32(f_ctl_stat);

+    /* Ensure the descriptor config is visible before setting the tx
+     * pointer.
+     */
+    smp_wmb();
+
     /* Update next TX pointer */
     priv->tx_pointer = pointer;

I left the test running while writing this email and I did start to
see some retries. I'm not sure if that's because my laptop is one of
the test machines, or if we have another issue.

I will do some further testing over night.

Cheers,

Joel

>
> As for the read side of this, I'm not 100% sure, I'll have to think more about
> it, it *think* the existing barriers are sufficient at first sight.
>
> Cheers,
> Ben.
>
> > >
> > > > 2. A TX descriptor is "writable" only when its value is zero
> > > > regardless the edotr mask.
> > >
> > > Again, why is that ? Can you elaborate ? What race are you trying
> > > to
> > > address here ?
> > >
> > > Cheers,
> > > Ben.
> > >
> > > > Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
> > > > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > > ---
> > > >  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > index 00024dd41147..7cacbe4aecb7 100644
> > > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > @@ -647,6 +647,9 @@ static bool
> > > > ftgmac100_tx_complete_packet(struct
> > > > ftgmac100 *priv)
> > > >       if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
> > > >               return false;
> > > >
> > > > +     if ((ctl_stat & ~(priv->txdes0_edotr_mask)) == 0)
> > > > +             return false;
> > > > +
> > > >       skb = priv->tx_skbs[pointer];
> > > >       netdev->stats.tx_packets++;
> > > >       netdev->stats.tx_bytes += skb->len;
> > > > @@ -756,6 +759,9 @@ static netdev_tx_t
> > > > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > > >       pointer = priv->tx_pointer;
> > > >       txdes = first = &priv->txdes[pointer];
> > > >
> > > > +     if (le32_to_cpu(txdes->txdes0) & ~priv->txdes0_edotr_mask)
> > > > +             goto drop;
> > > > +
> > > >       /* Setup it up with the packet head. Don't write the head
> > > > to
> > > > the
> > > >        * ring just yet
> > > >        */
> > > > @@ -787,6 +793,10 @@ static netdev_tx_t
> > > > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > > >               /* Setup descriptor */
> > > >               priv->tx_skbs[pointer] = skb;
> > > >               txdes = &priv->txdes[pointer];
> > > > +
> > > > +             if (le32_to_cpu(txdes->txdes0) & ~priv-
> > > > > txdes0_edotr_mask)
> > > >
> > > > +                     goto dma_err;
> > > > +
> > > >               ctl_stat = ftgmac100_base_tx_ctlstat(priv,
> > > > pointer);
> > > >               ctl_stat |= FTGMAC100_TXDES0_TXDMA_OWN;
> > > >               ctl_stat |= FTGMAC100_TXDES0_TXBUF_SIZE(len);
>
