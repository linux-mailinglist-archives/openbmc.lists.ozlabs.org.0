Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50B2E0256
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 23:10:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0DFC5cvMzDqQw
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 09:10:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BEoPU/Hm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0DDD6D3hzDqKW;
 Tue, 22 Dec 2020 09:10:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E28BE22A85;
 Mon, 21 Dec 2020 22:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608588601;
 bh=uDT47mqlwZJogTvzDKTcNjDb5AtGGqiU+C0elNRtlUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BEoPU/HmBBjQweFz6iJ5YNRI+fF9rXp8BVBPrL0gvz8h8Qp/q7n0hw358NiGxm94H
 mMdgMphnGCXZWZS8q2gfonobPE/pKTT30kH4dzjs/h8+b1e8Kw+UU0HSHEseDB3JWN
 nFGErKGVeBHOhKCNwVlo2h0SZ9t0rjmmvvmW2mpNuy6GXxlPexI4myc3F/2q3tOoI3
 91je3V4hNVMIv1uHidqVt2Fzf17bJId4c0nPlpcij+0U9XnZxUu54rpd4odOxnEycU
 h43qYLu5R54xsdBi+0YYBYVLGuAQh23CHEMPgNP3ZUBfUiucktqCD5tsWKMrE+u3PA
 4amqDED6SP1zw==
Date: Mon, 21 Dec 2020 14:09:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Hongwei Zhang <hongweiz@ami.com>
Subject: Re: [Aspeed,ncsi-rx, v2 1/1] net: ftgmac100: Fix AST2600 EVB NCSI
 RX issue
Message-ID: <20201221140959.793449e8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201221194026.30715-2-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
 <20201221194026.30715-2-hongweiz@ami.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 netdev <netdev@vger.kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, David S Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Dec 2020 14:40:26 -0500 Hongwei Zhang wrote:
> When FTGMAC100 driver is used on other NCSI Ethernet controllers, few

When you say NCSI Ethernet controller here you mean the main system
NIC, right? The MAC on the NCSI side is FTGMAC100, correct?

In that case I'm not sure how user is supposed to control this setting
at build time. The system NIC is often pluggable on the PCIe bus, and
can be changed at will.

> controllers have compatible issue, removing FTGMAC100_RXDES0_RX_ERR bit
> from RXDES0_ANY_ERROR can fix the issue.
> 
> Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")

Please fix the commit hash, this hash does not exist upstream:

Commit: 8711d4ef64fa ("net: ftgmac100: Fix AST2600 EVB NCSI RX issue")
	Fixes tag: Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
	Has these problem(s):
		- Target SHA1 does not exist

> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  drivers/net/ethernet/faraday/Kconfig     | 9 +++++++++
>  drivers/net/ethernet/faraday/ftgmac100.h | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/Kconfig b/drivers/net/ethernet/faraday/Kconfig
> index c2677ec0564d..ccd0c30be0db 100644
> --- a/drivers/net/ethernet/faraday/Kconfig
> +++ b/drivers/net/ethernet/faraday/Kconfig
> @@ -38,4 +38,13 @@ config FTGMAC100
>  	  from Faraday. It is used on Faraday A369, Andes AG102 and some
>  	  other ARM/NDS32 SoC's.
>  
> +config FTGMAC100_RXDES0_RX_ERR_CHK
> +	bool "Include FTGMAC100_RXDES0_RX_ERR in RXDES0_ANY_ERROR"
> +	default y
> +	depends on FTGMAC100
> +	help
> +	  Say N here if the NCSI controller on your platform has compatible
> +	  issue with FTGMAC100, thus always trigger RXDES0_RX_ERR. Exclude
> +	  this bit can fix the issue.
> +
>  endif # NET_VENDOR_FARADAY
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
> index 63b3e02fab16..59e1bd52d261 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -251,12 +251,20 @@ struct ftgmac100_rxdes {
>  #define FTGMAC100_RXDES0_RXPKT_RDY	(1 << 31)
>  
>  /* Errors we care about for dropping packets */
> +#ifdef CONFIG_FTGMAC100_RXDES0_RX_ERR_CHK
>  #define RXDES0_ANY_ERROR		( \
>  	FTGMAC100_RXDES0_RX_ERR		| \
>  	FTGMAC100_RXDES0_CRC_ERR	| \
>  	FTGMAC100_RXDES0_FTL		| \
>  	FTGMAC100_RXDES0_RUNT		| \
>  	FTGMAC100_RXDES0_RX_ODD_NB)
> +#else
> +#define RXDES0_ANY_ERROR		( \
> +	FTGMAC100_RXDES0_CRC_ERR	| \
> +	FTGMAC100_RXDES0_FTL		| \
> +	FTGMAC100_RXDES0_RUNT		| \
> +	FTGMAC100_RXDES0_RX_ODD_NB)
> +#endif
>  
>  #define FTGMAC100_RXDES1_VLANTAG_CI	0xffff
>  #define FTGMAC100_RXDES1_PROT_MASK	(0x3 << 20)

