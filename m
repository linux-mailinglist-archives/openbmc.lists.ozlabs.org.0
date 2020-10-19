Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BD2931E4
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 01:21:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFXnR0sV7zDqTJ
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 10:21:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFXmD56GgzDqH5;
 Tue, 20 Oct 2020 10:20:08 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09JNJQN2024225
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2020 18:19:37 -0500
Message-ID: <be7a978c48c9f1c6c29583350dee6168385c3039.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/4] ftgmac100: Fix race issue on TX descriptor[0]
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>, davem@davemloft.net,
 kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ratbert@faraday-tech.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Date: Tue, 20 Oct 2020 10:19:25 +1100
In-Reply-To: <20201019085717.32413-2-dylan_hung@aspeedtech.com>
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-2-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-10-19 at 16:57 +0800, Dylan Hung wrote:
> These rules must be followed when accessing the TX descriptor:
> 
> 1. A TX descriptor is "cleanable" only when its value is non-zero
> and the owner bit is set to "software"

Can you elaborate ? What is the point of that change ? The owner bit
should be sufficient, why do we need to check other fields ?

> 2. A TX descriptor is "writable" only when its value is zero
> regardless the edotr mask.

Again, why is that ? Can you elaborate ? What race are you trying to
address here ?

Cheers,
Ben.

> Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index 00024dd41147..7cacbe4aecb7 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -647,6 +647,9 @@ static bool ftgmac100_tx_complete_packet(struct
> ftgmac100 *priv)
>  	if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
>  		return false;
>  
> +	if ((ctl_stat & ~(priv->txdes0_edotr_mask)) == 0)
> +		return false;
> +
>  	skb = priv->tx_skbs[pointer];
>  	netdev->stats.tx_packets++;
>  	netdev->stats.tx_bytes += skb->len;
> @@ -756,6 +759,9 @@ static netdev_tx_t
> ftgmac100_hard_start_xmit(struct sk_buff *skb,
>  	pointer = priv->tx_pointer;
>  	txdes = first = &priv->txdes[pointer];
>  
> +	if (le32_to_cpu(txdes->txdes0) & ~priv->txdes0_edotr_mask)
> +		goto drop;
> +
>  	/* Setup it up with the packet head. Don't write the head to
> the
>  	 * ring just yet
>  	 */
> @@ -787,6 +793,10 @@ static netdev_tx_t
> ftgmac100_hard_start_xmit(struct sk_buff *skb,
>  		/* Setup descriptor */
>  		priv->tx_skbs[pointer] = skb;
>  		txdes = &priv->txdes[pointer];
> +
> +		if (le32_to_cpu(txdes->txdes0) & ~priv-
> >txdes0_edotr_mask)
> +			goto dma_err;
> +
>  		ctl_stat = ftgmac100_base_tx_ctlstat(priv, pointer);
>  		ctl_stat |= FTGMAC100_TXDES0_TXDMA_OWN;
>  		ctl_stat |= FTGMAC100_TXDES0_TXBUF_SIZE(len);

