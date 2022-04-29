Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268251403F
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 03:29:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqFJz17lHz3bdP
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 11:29:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qKdUTEd5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=qKdUTEd5; dkim-atps=neutral
X-Greylist: delayed 1584 seconds by postgrey-1.36 at boromir;
 Fri, 29 Apr 2022 11:29:15 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqFJW5qh0z2yHX
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 11:29:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7Kgksz1U+mpR5yolnT7/amlugtDRmACOMUcwglvKJUc=; b=qKdUTEd5nyy93U0dp1Dz1gWDVZ
 gF+ddv0L6PzIaNwv4iRlOuv9idXs1gNYlZzsEYCl3Azlk9WGiwxoUDeysOdMcKgGw85BfX3YdAYcC
 taV00TYA8wNY0fupmJwcH8YGrUiH1W+Zh6rK0oKVhKo6mpA8ar5Mx8zbPEBOZZ5RUheo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nkF1j-000Oz9-FZ; Fri, 29 Apr 2022 03:02:31 +0200
Date: Fri, 29 Apr 2022 03:02:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH net] net: ftgmac100: Disable hardware checksum on AST2600
Message-ID: <Yms5JzcVMKDYpR5H@lunn.ch>
References: <20220428082858.545176-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428082858.545176-1-joel@jms.id.au>
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
Cc: David Wilder <dwilder@us.ibm.com>, openbmc@lists.ozlabs.org,
 David Wilder <wilder@us.ibm.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
> Reported-by: David Wilder <wilder@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Net maintainers, if no one has a counter proposal I would like this
> merged as a fix. Please give Dylan from Aspeed a chance to reply before
> applying the patch.

What has phy-handle got to do with this? You might want to add an
explanation why you picked that as a Fixes: commit, if it is in fact
correct.


     Andrew
