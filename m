Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE652A0F5E
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 21:23:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNDJf3HLfzDqwL
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 07:22:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNDHs5hbyzDqnV
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 07:22:16 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kYauN-004PUq-Ho; Fri, 30 Oct 2020 21:21:59 +0100
Date: Fri, 30 Oct 2020 21:21:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: net: ftgmac100: describe phy-handle
 and MDIO
Message-ID: <20201030202159.GG1042051@lunn.ch>
References: <20201030133707.12099-1-i.mikhaylov@yadro.com>
 <20201030133707.12099-4-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030133707.12099-4-i.mikhaylov@yadro.com>
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

On Fri, Oct 30, 2020 at 04:37:07PM +0300, Ivan Mikhaylov wrote:
> Add the phy-handle and MDIO description and add the example with
> PHY and MDIO nodes.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
