Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F32933DA
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 06:15:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFgJh5SgCzDqVm
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 15:15:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CfVX7lB8; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFgHN59yMzDqVB;
 Tue, 20 Oct 2020 15:14:06 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id c5so230259qtw.3;
 Mon, 19 Oct 2020 21:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRPCIqgVp7JxtQIwMiyZjjVI3vzOaxsFkudHQAakCTE=;
 b=CfVX7lB8vevBGCqExwTh3APKc1v2ezK78tU6+t1yX1lK9mrdPWEcTaJoUOE7QoFs8p
 GJ7Ri9qfdszlYlCd3pUwR3z8S97ruE2/106lhkHvPIw+vCqbKWayS+atwy8X/gkS2SQ4
 /mOsaA24Kj7yBhJXUdi69luiVxNI7XhEu6UME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRPCIqgVp7JxtQIwMiyZjjVI3vzOaxsFkudHQAakCTE=;
 b=kbKVDIqJ853FctedOkE/2GkBcZ2rna2obsi14xBfEfD3NmOeXUxatjN0P96egjmhPr
 gHZSY3eO6prwfjYVf577zoHipTCixWTpw5cOZeRa81jof1LAtTnFr/Y2bDZukhn8go5H
 kdBD4TO5UIS3JPnJbRjFHHVxwDcmWEjprIoChAb09EOORwyR8WgLvYL+FhajGOdP2b+z
 Xdqyhxsyo4qyHRBDDPWMTWwUIEXw8thyfOCreyOfl6RPZOA5EN9bniDtzKxxDBmh2Lm0
 k4ezkzICXQqu/0vwFYuaFCnslZ+3BrzkqCy8QDstMdYJq78eAu3TYxtg/YTLxoyUhwxx
 cmPg==
X-Gm-Message-State: AOAM531+II7QgpMJMmbCUhlYCsfTI7SYFZf2by7D+kMzGlX+ppC1FTnA
 yIVaQrgBT3JNSO3pWwasJbqfcfY1cqXtzbAW7Oc=
X-Google-Smtp-Source: ABdhPJzfgWHW/dSSaO154QYtrEdfjSG/f3sH5C15wXCfARnDLbzc/MhtJX+jfb8/wRvEhAaYvobhKCrue9XWKekWqUY=
X-Received: by 2002:aed:3325:: with SMTP id u34mr826567qtd.263.1603167242677; 
 Mon, 19 Oct 2020 21:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-2-dylan_hung@aspeedtech.com>
 <be7a978c48c9f1c6c29583350dee6168385c3039.camel@kernel.crashing.org>
In-Reply-To: <be7a978c48c9f1c6c29583350dee6168385c3039.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Oct 2020 04:13:49 +0000
Message-ID: <CACPK8XdECaKwdQgWFQ=sRBiCjDLXHtMKo=o-xQZPmMZyevOukQ@mail.gmail.com>
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

On Mon, 19 Oct 2020 at 23:20, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Mon, 2020-10-19 at 16:57 +0800, Dylan Hung wrote:
> > These rules must be followed when accessing the TX descriptor:
> >
> > 1. A TX descriptor is "cleanable" only when its value is non-zero
> > and the owner bit is set to "software"
>
> Can you elaborate ? What is the point of that change ? The owner bit
> should be sufficient, why do we need to check other fields ?

I would like Dylan to clarify too. The datasheet has a footnote below
the descriptor layout:

 - TXDES#0: Bits 27 ~ 14 are valid only when FTS = 1
 - TXDES#1: Bits 31 ~ 0 are valid only when FTS = 1

So the ownership bit (31) is not valid unless FTS is set. However,
this isn't what his patch does. It adds checks for EDOTR.

>
> > 2. A TX descriptor is "writable" only when its value is zero
> > regardless the edotr mask.
>
> Again, why is that ? Can you elaborate ? What race are you trying to
> address here ?
>
> Cheers,
> Ben.
>
> > Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
> > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > b/drivers/net/ethernet/faraday/ftgmac100.c
> > index 00024dd41147..7cacbe4aecb7 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -647,6 +647,9 @@ static bool ftgmac100_tx_complete_packet(struct
> > ftgmac100 *priv)
> >       if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
> >               return false;
> >
> > +     if ((ctl_stat & ~(priv->txdes0_edotr_mask)) == 0)
> > +             return false;
> > +
> >       skb = priv->tx_skbs[pointer];
> >       netdev->stats.tx_packets++;
> >       netdev->stats.tx_bytes += skb->len;
> > @@ -756,6 +759,9 @@ static netdev_tx_t
> > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> >       pointer = priv->tx_pointer;
> >       txdes = first = &priv->txdes[pointer];
> >
> > +     if (le32_to_cpu(txdes->txdes0) & ~priv->txdes0_edotr_mask)
> > +             goto drop;
> > +
> >       /* Setup it up with the packet head. Don't write the head to
> > the
> >        * ring just yet
> >        */
> > @@ -787,6 +793,10 @@ static netdev_tx_t
> > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> >               /* Setup descriptor */
> >               priv->tx_skbs[pointer] = skb;
> >               txdes = &priv->txdes[pointer];
> > +
> > +             if (le32_to_cpu(txdes->txdes0) & ~priv-
> > >txdes0_edotr_mask)
> > +                     goto dma_err;
> > +
> >               ctl_stat = ftgmac100_base_tx_ctlstat(priv, pointer);
> >               ctl_stat |= FTGMAC100_TXDES0_TXDMA_OWN;
> >               ctl_stat |= FTGMAC100_TXDES0_TXBUF_SIZE(len);
>
