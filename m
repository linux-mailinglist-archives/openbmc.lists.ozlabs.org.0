Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F0958F81
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 03:01:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zdl301J7zDqdD
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 11:01:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MyBHZuXx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aOvbE5MW"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZdkR1WHDzDqch;
 Fri, 28 Jun 2019 11:01:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2A3631448;
 Thu, 27 Jun 2019 21:01:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 21:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=6QkdIpPNZcez0nWZJny4hrwMOIoRT7+
 z3YW1PJJsa+0=; b=MyBHZuXxdmX/5SpLOi1pAk1sCtJy3enfybuFzaWKTrrihqf
 fjNZULa6ESDWG9Nb1IhjNaUOpYZKHFIDcgFyiFPg4JC97AXqbNcayZ0rTx2sGaZ2
 zQCnMf7nezIurCkUGAugjDNs4PXdf9Mha1OwOLdIRy2JuJnmOrIKCu5dWMRve7ny
 IHU5fjAUSZCjOCDUTaJO0hOwf1aHHz8yh64OjkbITBempZkcG9vMe0kchf7gViUc
 q6wJasjAVeHjWXYKG2uB5UjyTlH+3+p4iL28aEN82uexhYbGjCX9iIlFx5Bb8E0x
 Dt5XRi/Mqf0398zbAzSg9WVWxEeo5ebcPkwZeCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6QkdIp
 PNZcez0nWZJny4hrwMOIoRT7+z3YW1PJJsa+0=; b=aOvbE5MWRlWu77Pg+XZaA/
 u4PlEqmN0NQRyeeEAHI37JRT5naI2Yzcgh5r+3Ovx+A6tOZ0YUE69dSLNvvnlgtC
 0rr+BGnl0AmCuryqoZyldci7C9uWKjCRB7RYblWj70Akm9wL8e7Yfpa4nAE+9RVZ
 47G8Q4DC8RfQSoughbd67uc4HGwhmNZVA6ZxBve8RQERZ29ep0tQFWEfmZS1kYyB
 mckAxPBzpheOfqxG/Q54sP+aGp0V3afVQY8wAZrr6TFdxwVo1PbUmUoJc8dS6Vs+
 Tafs4h/6x+M7+MM80WUPi/WmfEUXhGkYriNoBojwrgVVuDYKaVoDDkVAjsDhmzIA
 ==
X-ME-Sender: <xms:2mYVXZRh07v3m3dtSpcqvSBZhb3GnfbHz-u-bsw1kRb6Mvs22kxfdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:2mYVXQRnCamIqGoCcwQ4HGTSFXWpd7-rjjS744xveIwEbLYzbV5eiw>
 <xmx:2mYVXRdoBHmREkPzHUUNTFrBhroqsf2TSy20snTyK8odUSz6fSUTAQ>
 <xmx:2mYVXWdJECu90yIqi6uBcSVlaESB7fOX6doZKI4a18B3urbJj8mAUg>
 <xmx:3GYVXdkcWIdXmwbmCLrdk1-KHTzuUFRg8uGxViV45__3yffNc6InwA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 17816E00A3; Thu, 27 Jun 2019 21:01:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <67703d84-a827-4a5c-bf75-37a619f1de94@www.fastmail.com>
In-Reply-To: <CACRpkdZtTy-HHu2O4aOaqV5ZdxcYYPFRuxK2jjnw+_O1xcF1rg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
 <CACRpkdZtTy-HHu2O4aOaqV5ZdxcYYPFRuxK2jjnw+_O1xcF1rg@mail.gmail.com>
Date: Fri, 28 Jun 2019 10:31:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_1/8]_dt-bindings:_pinctrl:_aspeed:_Split_bindings_d?=
 =?UTF-8?Q?ocument_in_two?=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 27 Jun 2019, at 20:56, Linus Walleij wrote:
> On Thu, Jun 27, 2019 at 4:32 AM Joel Stanley <joel@jms.id.au> wrote:
> 
> > I think we can use this as an opportunity to drop the unused g4-scu
> > compatible from the bindings. Similarly for the g5.
> >
> > Acked-by: Joel Stanley <joel@jms.id.au>
> 
> I assume I should wait for a new version of the patches that does
> this?

I'll take a look at the gX compatibles more broadly in a separate series.
I'm cleaning up the current series wrt Rob's comments and I hope to
send it out shortly.

Andrew
