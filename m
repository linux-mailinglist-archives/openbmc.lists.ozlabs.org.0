Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D4290E93
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 04:43:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCnQP3tJNzDr2F
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 13:43:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
X-Greylist: delayed 1937 seconds by postgrey-1.36 at bilbo;
 Sat, 17 Oct 2020 13:43:05 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCnPj5ZrGzDqpv
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 13:43:05 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kTbfl-002683-KH; Sat, 17 Oct 2020 04:10:17 +0200
Date: Sat, 17 Oct 2020 04:10:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH 1/1] net: ftgmac100: add handling of mdio/phy nodes for
 ast2400/2500
Message-ID: <20201017021017.GH456889@lunn.ch>
References: <20201013124014.2989-1-i.mikhaylov@yadro.com>
 <20201013124014.2989-2-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013124014.2989-2-i.mikhaylov@yadro.com>
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
Cc: Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> +		if (priv->is_aspeed &&
> +		    phy_intf != PHY_INTERFACE_MODE_RMII &&
> +		    phy_intf != PHY_INTERFACE_MODE_RGMII &&
> +		    phy_intf != PHY_INTERFACE_MODE_RGMII_ID &&
> +		    phy_intf != PHY_INTERFACE_MODE_RGMII_RXID &&
> +		    phy_intf != PHY_INTERFACE_MODE_RGMII_TXID) {


phy_interface_mode_is_rgmii()

	Andrew
