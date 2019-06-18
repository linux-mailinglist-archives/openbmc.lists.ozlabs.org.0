Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F149C33
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 10:41:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ShQ03nhJzDqdx
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 18:41:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.195; helo=11.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 11.mo4.mail-out.ovh.net (11.mo4.mail-out.ovh.net
 [46.105.34.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ShPD6LqHzDqXS
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 18:40:47 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.109.159.159])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D3EB31F708C
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 10:31:33 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 610F46F102EF;
 Tue, 18 Jun 2019 08:31:27 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] net/ftgmac100: Add NC-SI mode support
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, u-boot@lists.denx.de
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-4-sam@mendozajonas.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cde8f9f2-ee21-6859-0d0b-b072b826c871@kaod.org>
Date: Tue, 18 Jun 2019 10:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618013720.2823-4-sam@mendozajonas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11629701615311096638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiledgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
Cc: joe.hershberger@ni.com, openbmc@lists.ozlabs.org, sjg@chromium.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/06/2019 03:37, Samuel Mendoza-Jonas wrote:
> Update the ftgmac100 driver to support NC-SI instead of an mdio phy
> where available. This is a common setup for Aspeed AST2x00 platforms.
> 
> NC-SI mode is determined from the device-tree if either phy-mode sets it
> or the use-ncsi property exists. If set then normal mdio setup is
> skipped in favour of the NC-SI phy.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>


LGTM. Some very minor remarks below in case you resend.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  drivers/net/ftgmac100.c | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
> index 92c38a81bd..c0100e91c7 100644
> --- a/drivers/net/ftgmac100.c
> +++ b/drivers/net/ftgmac100.c
> @@ -18,6 +18,7 @@
>  #include <wait_bit.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <net/ncsi.h>
>  
>  #include "ftgmac100.h"
>  
> @@ -81,6 +82,7 @@ struct ftgmac100_data {
>  	struct mii_dev *bus;
>  	u32 phy_mode;
>  	u32 max_speed;
> +	bool ncsi_mode;
>  
>  	struct clk_bulk clks;
>  
> @@ -181,7 +183,7 @@ static int ftgmac100_phy_adjust_link(struct ftgmac100_data *priv)
>  	struct phy_device *phydev = priv->phydev;
>  	u32 maccr;
>  
> -	if (!phydev->link) {
> +	if (!phydev->link && !priv->ncsi_mode) {
>  		dev_err(phydev->dev, "No link\n");
>  		return -EREMOTEIO;
>  	}
> @@ -217,7 +219,8 @@ static int ftgmac100_phy_init(struct udevice *dev)
>  	if (!phydev)
>  		return -ENODEV;
>  
> -	phydev->supported &= PHY_GBIT_FEATURES;
> +	if (!priv->ncsi_mode)
> +		phydev->supported &= PHY_GBIT_FEATURES;
>  	if (priv->max_speed) {
>  		ret = phy_set_supported(phydev, priv->max_speed);
>  		if (ret)
> @@ -275,7 +278,8 @@ static void ftgmac100_stop(struct udevice *dev)
>  
>  	writel(0, &ftgmac100->maccr);
>  
> -	phy_shutdown(priv->phydev);
> +	if (!priv->ncsi_mode)
> +		phy_shutdown(priv->phydev);
>  }
>  
>  static int ftgmac100_start(struct udevice *dev)
> @@ -513,6 +517,7 @@ static int ftgmac100_ofdata_to_platdata(struct udevice *dev)
>  	pdata->iobase = devfdt_get_addr(dev);
>  	pdata->phy_interface = -1;
>  	phy_mode = dev_read_string(dev, "phy-mode");
> +
>  	if (phy_mode)
>  		pdata->phy_interface = phy_get_interface_by_name(phy_mode);
>  	if (pdata->phy_interface == -1) {
> @@ -537,8 +542,13 @@ static int ftgmac100_probe(struct udevice *dev)
>  {
>  	struct eth_pdata *pdata = dev_get_platdata(dev);
>  	struct ftgmac100_data *priv = dev_get_priv(dev);
> +	const char *phy_mode;
>  	int ret;
>  
> +	phy_mode = dev_read_string(dev, "phy-mode");
> +	priv->ncsi_mode = dev_read_bool(dev, "use-ncsi") ||
> +		(phy_mode && strcmp(phy_mode, "NC-SI") == 0);

strncmp() may be ? I think a helper routine would make sense. 

> +
>  	priv->iobase = (struct ftgmac100 *)pdata->iobase;
>  	priv->phy_mode = pdata->phy_interface;
>  	priv->max_speed = pdata->max_speed;
> @@ -548,10 +558,15 @@ static int ftgmac100_probe(struct udevice *dev)
>  	if (ret)
>  		goto out;
>  
> -	ret = ftgmac100_mdio_init(dev);
> -	if (ret) {
> -		dev_err(dev, "Failed to initialize mdiobus: %d\n", ret);
> -		goto out;
> +	if (priv->ncsi_mode) {
> +		printf("%s - NCSI detected\n", __func__);

"NC-SI"

> +	} else {
> +		ret = ftgmac100_mdio_init(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize mdiobus: %d\n", ret);
> +			goto out;
> +		}
> +
>  	}
>  
>  	ret = ftgmac100_phy_init(dev);
> @@ -571,9 +586,13 @@ static int ftgmac100_remove(struct udevice *dev)
>  {
>  	struct ftgmac100_data *priv = dev_get_priv(dev);
>  
> -	free(priv->phydev);
> -	mdio_unregister(priv->bus);
> -	mdio_free(priv->bus);
> +	if (!priv->ncsi_mode) {
> +		free(priv->phydev);
> +		mdio_unregister(priv->bus);
> +		mdio_free(priv->bus);
> +	} else {
> +		free(priv->phydev);
> +	}
>  	clk_release_bulk(&priv->clks);
>  
>  	return 0;
> 

