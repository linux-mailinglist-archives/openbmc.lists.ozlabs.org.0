Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAF8D7DE9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 10:55:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MWfag30I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt6xF516wz3cTp
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 18:54:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MWfag30I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt6wj2Qn5z30TC
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 18:54:29 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52965199234so4608859e87.2
        for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2024 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717404866; x=1718009666; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NY422RM8D/dbgd/9UPZ5mROW0tVlpPtXiW4z+0KlNnE=;
        b=MWfag30Iq16qC2zBGrCcHh3f1u96OjDzkFbhdWx4XhRh+JhUScE+8wzRDGG9e0LcuO
         kuf3VOuvQ0XNOHQKNmNrDPm0TvaA0V941pCn74DObYGj6hggjs0vZAZE3g093xlXUJAu
         suyNaJ1DPIkw+AR/jtVp0Y075kXTRjGdn3szEjwUX/g01Qv8ErNjBkoV6MPX4+FfCaS4
         /Ob/hkieVpR1lhtKO4WP2P5OhcbP1uQSny6IeLJ+RacSWLen+ZmKtVTzYHIlLM89THV1
         PWMlUMRupBPi3BtX/o1ch4kTOxcmAUJ5AiiGr6utFQs90IOlrCIszQQghHNqRLFMV6rv
         rLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717404866; x=1718009666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY422RM8D/dbgd/9UPZ5mROW0tVlpPtXiW4z+0KlNnE=;
        b=JroRqsxh8ZfwjVW0MMze1IPekaKzUa0rSdwMfzYFrzrPCBVV5mov7lddOsQDCU6DHb
         og0Ga8JCzYTyJUcl2UGOwzSylbDqsJ6GsMdPEpYnCJqmfgCXUYrnXGsp/uNXcv8jGz0v
         UIQBptK6IVCanbIinaMZ9OGRfQqG1PTE9vbEzgAtD8vT4vMjkAryPoEW+CkXr4k14RlR
         ESJ8JZUOKOj+GrvFfm0wOqhgqaar9WwslQDS2luwfdkZV9hpUq+a3imCeAQP+EED6lDH
         zTAs2xpl3NArKbWOTNi47VdcPV4Ly0Pfr/YORaXEbev1oomqOFfIpc4v1hylNFdR9dSv
         8c+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkXVEpGE3SFk7QygxgtVZvl9hjNy6OdSaQhBqQL+Hbw3lYLJC7fMODgIF9xYSE+tpMQWUsrXVWNUltqBPX3pKbMLNZnkHh+O8=
X-Gm-Message-State: AOJu0Yyd9OWD1NPiCiet7eijxiz3cjSNz+p2/INB4CLh/P4D+V1c3vri
	4ySj6euK3MCVHD/QHZnaZbFfKEQpYdzEyOP80gt0NNu2lMknq0N8
X-Google-Smtp-Source: AGHT+IGmEy0pYkF0twnrOuWMhktsYiK7HkcxKp/i55MnzurvZ0bHVnO1byEssKtiE9Jq5GqpgYVslA==
X-Received: by 2002:a05:6512:1152:b0:52b:9c8a:735a with SMTP id 2adb3069b0e04-52b9c8a74fcmr1011745e87.40.1717404866030;
        Mon, 03 Jun 2024 01:54:26 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b97571ba8sm437665e87.205.2024.06.03.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:54:25 -0700 (PDT)
Date: Mon, 3 Jun 2024 11:54:22 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH net-next v2 10/10] net: stmmac: Add DW XPCS specified via
 "pcs-handle" support
Message-ID: <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602143636.5839-11-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 02, 2024 at 05:36:24PM +0300, Serge Semin wrote:
> Recently the DW XPCS DT-bindings have been introduced and the DW XPCS
> driver has been altered to support the DW XPCS registered as a platform
> device. In order to have the DW XPCS DT-device accessed from the STMMAC
> driver let's alter the STMMAC PCS-setup procedure to support the
> "pcs-handle" property containing the phandle reference to the DW XPCS
> device DT-node. The respective fwnode will be then passed to the
> xpcs_create_fwnode() function which in its turn will create the DW XPCS
> descriptor utilized in the main driver for the PCS-related setups.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 807789d7309a..dc040051aa53 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -497,15 +497,22 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  
>  int stmmac_pcs_setup(struct net_device *ndev)
>  {
> +	struct fwnode_handle *devnode, *pcsnode;
>  	struct dw_xpcs *xpcs = NULL;
>  	struct stmmac_priv *priv;
>  	int addr, mode, ret;
>  
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
> +	devnode = priv->plat->port_node;
>  
>  	if (priv->plat->pcs_init) {
>  		ret = priv->plat->pcs_init(priv);

> +	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> +		xpcs = xpcs_create_fwnode(pcsnode, mode);
> +		fwnode_handle_put(pcsnode);
> +		ret = PTR_ERR_OR_ZERO(xpcs);

Just figured, we might wish to be a bit more portable in the
"pcs-handle" property semantics implementation seeing there can be at
least three different PCS attached:
DW XPCS
Lynx PCS
Renesas RZ/N1 MII

Any suggestion of how to distinguish the passed handle? Perhaps
named-property, phandle argument, by the compatible string or the
node-name?

-Serge(y)

>  	} else if (priv->plat->mdio_bus_data &&
>  		   priv->plat->mdio_bus_data->has_xpcs) {
>  		addr = priv->plat->mdio_bus_data->xpcs_addr;
> @@ -515,10 +522,8 @@ int stmmac_pcs_setup(struct net_device *ndev)
>  		return 0;
>  	}
>  
> -	if (ret) {
> -		dev_warn(priv->device, "No xPCS found\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->device, ret, "No xPCS found\n");
>  
>  	priv->hw->xpcs = xpcs;
>  
> -- 
> 2.43.0
> 
