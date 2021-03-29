Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8634DBF4
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 00:37:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8SBX66bWz303F
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 09:37:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=e1yUwA7x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=e1yUwA7x; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8SBJ6KlHz2yRK
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 09:37:10 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id g20so14119579qkk.1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Mar 2021 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3LZFdF5YvJWwAl17IRXjpmJ8TzQHtGRs0aUTrBvQ6Y=;
 b=e1yUwA7xcXtPaI+E+8kZ3r9vug2W0bkWsuPB8S49KYp/b87gSuClUOBizW6egNoMlp
 ELzRQriOHnjRYYm/z1+RUSRvm+U/IzyvrH4IrJgyfXMLLk1X6b39tl/Jt9kDGXc8rIBb
 gs9qBRI8oniiq5lgYIS/VSX7HrnJgrLYN92oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3LZFdF5YvJWwAl17IRXjpmJ8TzQHtGRs0aUTrBvQ6Y=;
 b=WU9JFUkK7zoC0g8Ld9CW2nC2zHrqfu5CVnXpJ5Y1uvZL8TqL1lAfnlsx7poWLWwQnN
 vcqPI2rwoY0N9btyxXT4CU8vzQv0fkNT5vxnvyFmPkKJdeD/Pb/94AQeVU7GTn0DP8zj
 HwhkVfoHm/64sggfCkoG4G2uv7pr4KWprSP3oPmhB0wq+u9Q87x8n8FkqLH973sSu7zP
 2QqJcpJZ+hCWLzyG5i9tssp6kfR0r+9Qz001wqPNkaevfQ0n2csFV/eplwGXkvEUXt76
 fDsq9WkhPGuyUnR9TtFhSg7ufzMDU5Yflk3E2YuJ0eQA9KLt5dummWL4Q2CmpCRo1dnX
 TA1A==
X-Gm-Message-State: AOAM533izfTpEDoqnCaDuZVgAVBWAcJ+ANNIQiXV/eokIapnVnHeo5FE
 DMDv8mXl9TYN0mtDGaBPhvuLwCey4lLbI3e5xm8=
X-Google-Smtp-Source: ABdhPJw6J6aZXXwXYa6t/ytEVSYlmzuH8GF3tMk3L1J6Kt8ijjsJy1N5D0bJixd+ZCa45k9w7SRzC5Q+8jH96ylVnOk=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr27513436qkj.465.1617057428127; 
 Mon, 29 Mar 2021 15:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210327004920.388957-1-wak@google.com>
In-Reply-To: <20210327004920.388957-1-wak@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Mar 2021 22:36:55 +0000
Message-ID: <CACPK8XeLbxOX1-FGDqqepY4vuP=QR8tRAVvR0AoX=V-eVWWwiQ@mail.gmail.com>
Subject: Re: [[PATCH linux dev-5.10] net: npcm: Support for fixed PHYs
To: "William A. Kennington III" <wak@google.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 27 Mar 2021 at 00:49, William A. Kennington III <wak@google.com> wrote:
>
> Most of our machines don't have PHYs between the NIC and the BMC over
> their NC-SI port. We don't want to use the kernel NC-SI machinery, but
> we do want phyless support.
>
> Signed-off-by: William A. Kennington III <wak@google.com>

This looks fine to me. Tomer, Avi, can I please get a review from
someone at Nuvoton?

Reviewed-by: Joel Stanley <joel@jms.id.au>

It would be great to see this driver submitted upstream too!

> ---
>  drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 31 +++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> index f07449e2f68d..1dc871a72180 100644
> --- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> +++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> @@ -26,6 +26,7 @@
>  #include <linux/of.h>
>  #include <linux/of_net.h>
>  #include <linux/of_device.h>
> +#include <linux/of_mdio.h>
>  #include <linux/dma-mapping.h>
>
>  #include <linux/regmap.h>
> @@ -242,6 +243,7 @@ struct  npcm7xx_ether {
>         struct net_device *ndev;
>         struct resource *res;
>         unsigned int msg_enable;
> +       struct device_node *phy_dn;
>         struct mii_bus *mii_bus;
>         struct phy_device *phy_dev;
>         struct napi_struct napi;
> @@ -1774,6 +1776,17 @@ static int npcm7xx_mii_setup(struct net_device *dev)
>
>         pdev = ether->pdev;
>
> +       if (ether->phy_dn) {
> +               ether->phy_dev = of_phy_connect(dev, ether->phy_dn,
> +                                       &adjust_link, 0, 0);
> +               if (!ether->phy_dn) {
> +                       dev_err(&dev->dev, "could not connect to phy %pOF\n",
> +                               ether->phy_dn);
> +                       return -ENODEV;
> +               }
> +               return 0;
> +       }
> +
>         ether->mii_bus = mdiobus_alloc();
>         if (!ether->mii_bus) {
>                 err = -ENOMEM;
> @@ -2011,6 +2024,15 @@ static int npcm7xx_ether_probe(struct platform_device *pdev)
>                 }
>         } else {
>                 ether->use_ncsi = false;
> +
> +               ether->phy_dn = of_parse_phandle(np, "phy-handle", 0);
> +               if (!ether->phy_dn && of_phy_is_fixed_link(np)) {
> +                       error = of_phy_register_fixed_link(np);
> +                       if (error < 0)
> +                               goto failed_free_napi;
> +                       ether->phy_dn = of_node_get(np);
> +               }
> +
>         error = npcm7xx_mii_setup(dev);
>         if (error < 0) {
>                 dev_err(&pdev->dev, "npcm7xx_mii_setup err\n");
> @@ -2032,6 +2054,9 @@ static int npcm7xx_ether_probe(struct platform_device *pdev)
>         return 0;
>
>  failed_free_napi:
> +       of_node_put(ether->phy_dn);
> +       if (of_phy_is_fixed_link(np))
> +               of_phy_deregister_fixed_link(np);
>         netif_napi_del(&ether->napi);
>         platform_set_drvdata(pdev, NULL);
>  failed_free_io:
> @@ -2048,13 +2073,17 @@ static int npcm7xx_ether_remove(struct platform_device *pdev)
>  {
>         struct net_device *dev = platform_get_drvdata(pdev);
>         struct npcm7xx_ether *ether = netdev_priv(dev);
> +       struct device_node *np = pdev->dev.of_node;
>
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove_recursive(ether->dbgfs_dir);
>  #endif
> -
>         unregister_netdev(dev);
>
> +       of_node_put(ether->phy_dn);
> +       if (of_phy_is_fixed_link(np))
> +               of_phy_deregister_fixed_link(np);
> +
>         free_irq(ether->txirq, dev);
>         free_irq(ether->rxirq, dev);
>
> --
> 2.31.0.291.g576ba9dcdaf-goog
>
