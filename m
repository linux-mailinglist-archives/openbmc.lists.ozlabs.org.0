Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D22BADFC
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 08:49:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cFLD4snxzDqMV
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 16:49:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.37.72; helo=4.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo177.mail-out.ovh.net (4.mo177.mail-out.ovh.net
 [46.105.37.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cFKd5Wb1zDqJh
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 16:49:05 +1000 (AEST)
Received: from player729.ha.ovh.net (unknown [10.108.42.82])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 1FF4F10BA13
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 08:12:44 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 394CCA4034B6;
 Mon, 23 Sep 2019 06:12:42 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 5/6] net: ftgmac100: Ungate RCLK for RMII on
 AST2600
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-6-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <21e873ea-4873-5bac-0433-3f4dbb70be97@kaod.org>
Date: Mon, 23 Sep 2019 08:12:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190922123700.749-6-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7087539916975999746
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 22/09/2019 14:36, Andrew Jeffery wrote:
> The 50MHz RMII RCLK has to be enabled before the interface will function.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 43 ++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 9b7af94a40bb..21a58aad1a19 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -90,6 +90,9 @@ struct ftgmac100 {
>  	struct mii_bus *mii_bus;
>  	struct clk *clk;
>  
> +	/* 2600 RMII clock gate */
> +	struct clk *rclk;
> +
>  	/* Link management */
>  	int cur_speed;
>  	int cur_duplex;
> @@ -1718,11 +1721,27 @@ static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
>  		   nd->link_up ? "up" : "down");
>  }
>  
> -static void ftgmac100_setup_clk(struct ftgmac100 *priv)
> +static int ftgmac100_setup_clk(struct ftgmac100 *priv)
>  {
> -	priv->clk = devm_clk_get(priv->dev, NULL);
> -	if (IS_ERR(priv->clk))
> -		return;
> +	struct clk *clk;
> +	bool is_ast2600;
> +
> +	is_ast2600 = of_device_is_compatible(priv->dev->of_node,
> +					     "aspeed,ast2600-mac");

why is ast2600 particular ? 

> +	clk = devm_clk_get(priv->dev, NULL /* MACCLK */);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	priv->clk = clk;
> +
> +	clk = devm_clk_get_optional(priv->dev, "RCLK");
> +	if (!clk && is_ast2600 && priv->use_ncsi) {
> +		dev_err(priv->dev, "Cannot ungate RCLK");
> +		return -EINVAL;
> +	}
> +
> +	priv->rclk = clk;
> +	clk_prepare_enable(priv->rclk);
>  
>  	clk_prepare_enable(priv->clk);
>  
> @@ -1732,6 +1751,8 @@ static void ftgmac100_setup_clk(struct ftgmac100 *priv)
>  	 */
>  	clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
>  			FTGMAC_100MHZ);
> +
> +	return 0;
>  }
>  
>  static int ftgmac100_probe(struct platform_device *pdev)
> @@ -1853,8 +1874,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  			goto err_setup_mdio;
>  	}
>  
> -	if (priv->is_aspeed)
> -		ftgmac100_setup_clk(priv);
> +	if (priv->is_aspeed) {
> +		err = ftgmac100_setup_clk(priv);
> +		if (err)
> +			goto err_ncsi_dev;
> +	}
>  
>  	/* Default ring sizes */
>  	priv->rx_q_entries = priv->new_rx_q_entries = DEF_RX_QUEUE_ENTRIES;
> @@ -1886,8 +1910,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -err_ncsi_dev:
>  err_register_netdev:
> +	if (priv->rclk)
> +		clk_disable_unprepare(priv->rclk);
> +	clk_disable_unprepare(priv->clk);
> +err_ncsi_dev:
>  	ftgmac100_destroy_mdio(netdev);
>  err_setup_mdio:
>  	iounmap(priv->base);
> @@ -1909,6 +1936,8 @@ static int ftgmac100_remove(struct platform_device *pdev)
>  
>  	unregister_netdev(netdev);
>  
> +	if (priv->rclk)
> +		clk_disable_unprepare(priv->rclk);
>  	clk_disable_unprepare(priv->clk);
>  
>  	/* There's a small chance the reset task will have been re-queued,
> 

