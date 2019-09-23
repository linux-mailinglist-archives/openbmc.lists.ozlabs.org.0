Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5EBBADC2
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 08:27:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cDrP1MGpzDqMp
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 16:27:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="inbXuWBJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TllAOK5f"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cDqc435NzDqLg
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 16:26:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7650C2206E;
 Mon, 23 Sep 2019 02:26:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 23 Sep 2019 02:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=xXlKD
 VcPTYISOQjCV5QKQtw/sqJYoC81tv0W4xO5muM=; b=inbXuWBJx82gNuGRzz86b
 MmW5Q5z4EIdGPijS7l05M3gVn+u3GVj+bNi3qWQzyc7B6StbL9GBGJMTZ4pYxUba
 or0ZZ36cibUU6SAgKCZ36lI3a5wdgEQ3mAKjHNMzcc329i2Yq/7uSxb2+T4uLag8
 gVs/6J0MhhRjRnfXO84Sgu/cdKRlldLC+ZPnEiXbDpvTKhQ29J/NF88SlqQB7WYR
 2iUPnwMzGIbLU3t+Wt7rY8PWUaaE5J3+oa8bna0aykcOzZvgIyh9XWuXER0iKyiu
 OFZWN37v3Que/MyWrnRwGL098VGF2jdboJpr2hriqTQ+xolY65NxgGcm7q9J/pFV
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=xXlKDVcPTYISOQjCV5QKQtw/sqJYoC81tv0W4xO5m
 uM=; b=TllAOK5fkT4DKpRW038iLYnJoYUXaiqOBTu2Z6peB42xY9gH7pTjSNMji
 jcdb8iGGZj3b1Y/b1FhCMoesTZkORUzjgy2dqdsjMf/BxdxqsoYDI68Tv+1l3xDd
 e7QkxyjGEa8fUZyqXRsqp5XtH8O/9Bz2VblQj9Sc9lYDKKdGDS0K2DxRD8PppFvA
 icb7yIC7+BpIXWQ8k7gPBT5+JmGbQCyBzgue7S0tOYPHhBdOgh9Vbdo/XeS+4VJM
 EkcxT6h14rZFQWjM+HyryetCyu592T+DeJagpVOjjCQEb+GQXwvE4BsT5hNzYRC7
 K2aFTNQsMiXEIXQ7oJEhTINcWBwUg==
X-ME-Sender: <xms:lmWIXWQY2fNRbgKsGhzpaG-SfuMx_2QS_4AfPnoYw92aG-GlacDj-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:lmWIXQAwrrQEyrc1aA2MzLbaXscwNxaKHelqnIvyBKfsh9F8mvo1xg>
 <xmx:lmWIXe1c9W555X4b9iC-pkJXcsr1moO5rDsebtwKEEf3nffeE-MzXA>
 <xmx:lmWIXWWIcO-ul3eAwVTsU-oLtmaCzDvucn54xseGKdukyukJx8UlQA>
 <xmx:l2WIXa1wqONl8l9k5YItLsUa-82_rCj903Xzbnv_VWDIahb41UpgtA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 760E7E00A5; Mon, 23 Sep 2019 02:26:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <d36969ea-b675-42ab-9d82-677b9f81015d@www.fastmail.com>
In-Reply-To: <21e873ea-4873-5bac-0433-3f4dbb70be97@kaod.org>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-6-andrew@aj.id.au>
 <21e873ea-4873-5bac-0433-3f4dbb70be97@kaod.org>
Date: Mon, 23 Sep 2019 15:56:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_5/6]_net:_ftgmac100:_Ungate_RCLK_for_?=
 =?UTF-8?Q?RMII_on_AST2600?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Mon, 23 Sep 2019, at 15:42, C=C3=A9dric Le Goater wrote:
> On 22/09/2019 14:36, Andrew Jeffery wrote:
> > The 50MHz RMII RCLK has to be enabled before the interface will func=
tion.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 43 ++++++++++++++++++++-=
---
> >  1 file changed, 36 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/=
ethernet/faraday/ftgmac100.c
> > index 9b7af94a40bb..21a58aad1a19 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -90,6 +90,9 @@ struct ftgmac100 {
> >  	struct mii_bus *mii_bus;
> >  	struct clk *clk;
> > =20
> > +	/* 2600 RMII clock gate */
> > +	struct clk *rclk;
> > +
> >  	/* Link management */
> >  	int cur_speed;
> >  	int cur_duplex;
> > @@ -1718,11 +1721,27 @@ static void ftgmac100_ncsi_handler(struct nc=
si_dev *nd)
> >  		   nd->link_up ? "up" : "down");
> >  }
> > =20
> > -static void ftgmac100_setup_clk(struct ftgmac100 *priv)
> > +static int ftgmac100_setup_clk(struct ftgmac100 *priv)
> >  {
> > -	priv->clk =3D devm_clk_get(priv->dev, NULL);
> > -	if (IS_ERR(priv->clk))
> > -		return;
> > +	struct clk *clk;
> > +	bool is_ast2600;
> > +
> > +	is_ast2600 =3D of_device_is_compatible(priv->dev->of_node,
> > +					     "aspeed,ast2600-mac");
>=20
> why is ast2600 particular ?=20

It isn't, as Joel pointed out. We need this for at least the 2500 as wel=
l, but I didn't think to check as u-boot has been leaving the clock unga=
ted.

>=20
> > +	clk =3D devm_clk_get(priv->dev, NULL /* MACCLK */);
> > +	if (IS_ERR(clk))
> > +		return PTR_ERR(clk);
> > +	priv->clk =3D clk;
> > +
> > +	clk =3D devm_clk_get_optional(priv->dev, "RCLK");
> > +	if (!clk && is_ast2600 && priv->use_ncsi) {
> > +		dev_err(priv->dev, "Cannot ungate RCLK");
> > +		return -EINVAL;
> > +	}
> > +
> > +	priv->rclk =3D clk;
> > +	clk_prepare_enable(priv->rclk);
> > =20
> >  	clk_prepare_enable(priv->clk);
> > =20
> > @@ -1732,6 +1751,8 @@ static void ftgmac100_setup_clk(struct ftgmac1=
00 *priv)
> >  	 */
> >  	clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
> >  			FTGMAC_100MHZ);
> > +
> > +	return 0;
> >  }
> > =20
> >  static int ftgmac100_probe(struct platform_device *pdev)
> > @@ -1853,8 +1874,11 @@ static int ftgmac100_probe(struct platform_de=
vice *pdev)
> >  			goto err_setup_mdio;
> >  	}
> > =20
> > -	if (priv->is_aspeed)
> > -		ftgmac100_setup_clk(priv);
> > +	if (priv->is_aspeed) {
> > +		err =3D ftgmac100_setup_clk(priv);
> > +		if (err)
> > +			goto err_ncsi_dev;
> > +	}
> > =20
> >  	/* Default ring sizes */
> >  	priv->rx_q_entries =3D priv->new_rx_q_entries =3D DEF_RX_QUEUE_ENT=
RIES;
> > @@ -1886,8 +1910,11 @@ static int ftgmac100_probe(struct platform_de=
vice *pdev)
> > =20
> >  	return 0;
> > =20
> > -err_ncsi_dev:
> >  err_register_netdev:
> > +	if (priv->rclk)
> > +		clk_disable_unprepare(priv->rclk);
> > +	clk_disable_unprepare(priv->clk);
> > +err_ncsi_dev:
> >  	ftgmac100_destroy_mdio(netdev);
> >  err_setup_mdio:
> >  	iounmap(priv->base);
> > @@ -1909,6 +1936,8 @@ static int ftgmac100_remove(struct platform_de=
vice *pdev)
> > =20
> >  	unregister_netdev(netdev);
> > =20
> > +	if (priv->rclk)
> > +		clk_disable_unprepare(priv->rclk);
> >  	clk_disable_unprepare(priv->clk);
> > =20
> >  	/* There's a small chance the reset task will have been re-queued,=

> >=20
>=20
>
