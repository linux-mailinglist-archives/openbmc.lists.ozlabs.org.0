Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41651404E
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 03:40:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqFYW6Pntz3bcn
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 11:40:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ez1bInSF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=Ez1bInSF; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqFYB2NbSz2xgJ
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 11:40:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Oe0OrgHnXO1atGl84DOheHPrpv5NgL2S7w3gvQvSD04=; b=Ez1bInSFT4ZvYvQAgFYLxFFajJ
 YII/5/40WXf6X2HxQwj56dGWgbE0AfIWxpc0uX22wa5MufX3DkP7EjlbAo7R6FMEhRpboM4RE4NDe
 nQCEWC/9ApbCAweG8Pp7Axz61MKl3MQNxPCJk7vpSM/DMf01MNJBeVpeuUVYgR++jaew=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nkFc5-000PG2-9v; Fri, 29 Apr 2022 03:40:05 +0200
Date: Fri, 29 Apr 2022 03:40:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH net] net: ftgmac100: Disable hardware checksum on AST2600
Message-ID: <YmtB9QcMjOGL2lIa@lunn.ch>
References: <20220428082858.545176-1-joel@jms.id.au> <Yms5JzcVMKDYpR5H@lunn.ch>
 <CACPK8Xeq8MLmRmYW=qo7+FDRG_bwaSTMQtrHhPCwGJ8-ZeFp=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xeq8MLmRmYW=qo7+FDRG_bwaSTMQtrHhPCwGJ8-ZeFp=A@mail.gmail.com>
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
Cc: David Wilder <dwilder@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, David Wilder <wilder@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 29, 2022 at 01:35:43AM +0000, Joel Stanley wrote:
> On Fri, 29 Apr 2022 at 01:02, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
> > > Reported-by: David Wilder <wilder@us.ibm.com>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > > Net maintainers, if no one has a counter proposal I would like this
> > > merged as a fix. Please give Dylan from Aspeed a chance to reply before
> > > applying the patch.
> >
> > What has phy-handle got to do with this? You might want to add an
> > explanation why you picked that as a Fixes: commit, if it is in fact
> > correct.
> 
> If you have a look at that commit, you can see that was where ast2600
> support was added to the driver.

O.K, so please do add an explanation, because it is not obvious. I'm
partially to blame, i should of asked for that patch to be split in
two.

     Andrew
