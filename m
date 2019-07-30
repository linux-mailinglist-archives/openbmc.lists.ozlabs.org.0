Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57079F8E
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 05:36:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yMg23gbyzDqMV
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 13:36:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="HcmR7vDD"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yMfM5lrVzDqM2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 13:36:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DnRQYGUn98qmHApRiqr5In9coT/SMPR+4lxU8rq+yus=; b=HcmR7vDDBUMagJx/HRjSXqbrOw
 uUCCuhMLhgO+RgUejNlhQPDsGV0XIGJMdJ5BKY7w1pn4R4dNqnuSAdV6Cv8EoTOK7yDVYUbyDnkJS
 Yn3IGdfwOmH1sZGvil2Gup038de264kxZDwH9gyE4Vmg+9wX0JFyMMkTQ9FzseDrzdpg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hsIve-0005XU-Pz; Tue, 30 Jul 2019 05:35:58 +0200
Date: Tue, 30 Jul 2019 05:35:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net-next 1/2] net: phy: broadcom: set features explicitly
 for BCM54616S
Message-ID: <20190730033558.GB20628@lunn.ch>
References: <20190730002532.85509-1-taoren@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730002532.85509-1-taoren@fb.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 05:25:32PM -0700, Tao Ren wrote:
> BCM54616S feature "PHY_GBIT_FEATURES" was removed by commit dcdecdcfe1fc
> ("net: phy: switch drivers to use dynamic feature detection"). As dynamic
> feature detection doesn't work when BCM54616S is working in RGMII-Fiber
> mode (different sets of MII Control/Status registers being used), let's
> set "PHY_GBIT_FEATURES" for BCM54616S explicitly.

Hi Tao

What exactly does it get wrong?

     Thanks
	Andrew
