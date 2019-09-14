Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F15B2BB3
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 16:48:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VwNr6KsYzF602
	for <lists+openbmc@lfdr.de>; Sun, 15 Sep 2019 00:48:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="nyPTJsIq"; 
 dkim-atps=neutral
X-Greylist: delayed 1783 seconds by postgrey-1.36 at bilbo;
 Sun, 15 Sep 2019 00:47:49 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VwN52g2lzF5yV
 for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2019 00:47:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Z1jO0nsHRh4rObU5dMZe/5cCeCRCh92lPqbmxPuZnc=; b=nyPTJsIqcIONf/ruvBFUNjyy+y
 jxrYxl/AyHlYC0E9bpP6RypaIpEZpRZduJLth2Nq5osk3lIRSh2LIyy/5zUJMwIWyfhBHSfzJdPCk
 UlUR+434o+OJnOcK+j8IwjgspMHyho0EkdRUYghxgmzaa6lDxSOHXhKKEv4e5j1lN3V8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1i98s4-0007Qf-RV; Sat, 14 Sep 2019 16:17:52 +0200
Date: Sat, 14 Sep 2019 16:17:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net-next v8 2/3] net: phy: add support for clause 37
 auto-negotiation
Message-ID: <20190914141752.GC27922@lunn.ch>
References: <20190909204906.2191290-1-taoren@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190909204906.2191290-1-taoren@fb.com>
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

On Mon, Sep 09, 2019 at 01:49:06PM -0700, Tao Ren wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> This patch adds support for clause 37 1000Base-X auto-negotiation.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Tao Ren <taoren@fb.com>
> Tested-by: René van Dorst <opensource@vdorst.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
