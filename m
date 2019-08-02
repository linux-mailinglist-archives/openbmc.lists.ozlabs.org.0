Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A72887FCC6
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 16:52:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460VWV5WL8zDrF1
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 00:52:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460VSv59V0zDr0P
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 00:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wFufv2A3VsleW9NhhqWmZQk/O8vzeBMOQMi+FRL3uZk=; b=sSq7JSiLEkL/Qu7pBt+3s/Obzj
 G8JwPwZS1T0WVqB57yZXxCvVf2QIIawUP6uxAzuXsQq0kzkgixEE5dG0/bwZeBJsAEYi4apzeYV+q
 AoKjNmoU+H7PbtN1VDnh/6vE0bi1lHbWKn/LJ4w1MHHyykhWmM2YgsOSAtjW4Z4wRUns=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1htYsl-0001GD-Kc; Fri, 02 Aug 2019 16:50:11 +0200
Date: Fri, 2 Aug 2019 16:50:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net-next v2] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
Message-ID: <20190802145011.GH2099@lunn.ch>
References: <20190801235839.290689-1-taoren@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801235839.290689-1-taoren@fb.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, Arun Parameswaran <arun.parameswaran@broadcom.com>,
 linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> +static int bcm54616s_read_status(struct phy_device *phydev)
> +{
> +	int err;
> +
> +	err = genphy_read_status(phydev);
> +
> +	/* 1000Base-X register set doesn't provide speed fields: the
> +	 * link speed is always 1000 Mb/s as long as link is up.
> +	 */
> +	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX &&
> +	    phydev->link)
> +		phydev->speed = SPEED_1000;
> +
> +	return err;
> +}

This function is equivalent to bcm5482_read_status(). You should use
it, rather than add a new function.

    Andrew
