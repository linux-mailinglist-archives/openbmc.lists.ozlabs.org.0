Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66400EBC2D
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:02:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746SW4qwZzF5cc
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:02:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UHdUwj6J"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HsBbstx0"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746Qy4DsczDqGZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:01:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D62C92221E;
 Thu, 31 Oct 2019 23:01:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 23:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=fDn9JLK251LwA9QlH1+nKiB0KWC0XBe
 ZDM4HPEHHtVs=; b=UHdUwj6JZCws27VbzLc/IVmxFYOFAxdPmge3crb4nrFYeC/
 +UoRmc1n5PhGTQkBfaAYmqANPAYYJG+EawPbIPbuCCb1ujiYOVaUNrW/P18RD/Ow
 coU/tu2N6HS8VEa39i+Xc4E5AzOACfVqsPZW7rzp6WAIqODC7J6sHgCtGNqD51bj
 UW41KLjx0cVMzDONJLdH+VeuV83LSjq2N9s/0eFm4MHvlvsyAMU18HWxm3UsInge
 Uwr7+OBjHUAZeHLf65GYWObnuimCBCnn3HfOx4wTfWmQ/jPHI+Cv7HtJCwADbZRH
 Q4qRbVALP/SnfaUS3wX0HGL9KA84223BNIBomsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fDn9JL
 K251LwA9QlH1+nKiB0KWC0XBeZDM4HPEHHtVs=; b=HsBbstx0WeUTLxxtYZq6Q9
 gQCI09z7Ov8hR6BqYsGKlL3Y0Jb+FyXpPtA2rUW49TwZuNKG4Z0D4uh15Dnn0NY5
 nfTMZ3F3fS5okb7AtI+XNKJB68RYjZZEKtVNVLZLNjRir4qJxVk/qQxKQ1dpvpR5
 ocWMbAji0rV3fgrhGVkKVVjJiOXWh7yAj+If7FxhpbBR8UDDj4TVFizfqoBtuLgy
 rIGiACQmLeiAB2lyVw+d3fWkU/ZxIIex22Os1ub+YODXNtNh3Xm5dLZCbUWLf1H9
 dTyaG5xYDcXbcCs8s8gtuO4rVZ6D/c8uuR5zMU9ss12WkZ9GKIwIwq3k/MsDGW+g
 ==
X-ME-Sender: <xms:B6C7XVT8fcZfjx50qbo6MOAc3ZjsXEL9Xg3NBSooNqGibspIsMo54Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:B6C7XXn1gaiKPFs6zDVGOTxrWuJ4IjQ37lRR7gFUt0RyFYVVZcZeiQ>
 <xmx:B6C7XcLrPVkDfos-qXF46BqtWel2mqN2xZ5ogURLQbjP7JrcyTB-CQ>
 <xmx:B6C7XSSyNM9TTSyTG7J6NwXAHYkNiWKeEVvD0vcLgxQ95hRQVVT26w>
 <xmx:B6C7XR3FNoWtx1quvEiKtN-UtVazhs20-EJZhlA7y06BhiSAlzvWIg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B77DE00A3; Thu, 31 Oct 2019 23:01:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <87292fb8-5f39-438b-83ee-6b1086b99e35@www.fastmail.com>
In-Reply-To: <20191031053625.422-6-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-6-joel@jms.id.au>
Date: Fri, 01 Nov 2019 13:32:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 5/8] fsi: aspeed: Fix types in debugfs
Content-Type: text/plain
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 31 Oct 2019, at 16:06, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
