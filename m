Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26E578E1
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 03:09:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z1yH2J0jzDqWx
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 11:09:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BrQd3vXr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="x28MdS6a"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z1xZ0JmZzDqFS;
 Thu, 27 Jun 2019 11:08:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C99512212;
 Wed, 26 Jun 2019 21:08:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 21:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ZiI3xxfYKmvDILJvqB7fVk8L/I2NP9d
 zhcO3iE+B9zo=; b=BrQd3vXrWK9cQIP8itJI4yLnYhOACmlwPP91fUYKHYbtLHN
 0ogcNMGV9W8splCz6t+XZdCMVtGizKYBnKF6spbmNMI1eNJ6r+zmg0k/+6d1W4q7
 +k6I7itFCu1bItE/yvKsMYtBMQbyf7ltQhuQNYElu9gTFj+zsRAICpm4ZS3tjhSO
 8KyHLX8mudpz7eKttQhCLCyBwkrhEGeoJnAWoKEEPhEBLvIUpP4H96wTd8IEJ2ZZ
 LX5xaOVrj7Rhsd0+tt7yoGhVBceeevSXkUP0PmG4wUmk0duMN1c4jl9K34kW1Pta
 3zBsro14GpbO11VWv70wehz/6gPZQ0EQNjl1Piw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZiI3xx
 fYKmvDILJvqB7fVk8L/I2NP9dzhcO3iE+B9zo=; b=x28MdS6aAMJjnWtjtB7WWg
 2siByivl2x8w5XEtXmNUvuYl+f7lY2HcDQ86cOF1asYgl4kcNcg1cZt4i7zxB5jt
 QLsmQfxgwN/OVfIho5k3aZXV16b3jTI9CGMsq+mLV2Mw+Cru7l+nAhf6g6scykvS
 CyOmU//+0e1r94HNCD1RhlilF5TDfmJxqfxE6RufpkkVCZOakaa4O1t0F9bog91/
 dsylEeldN0KuO6YCmLCDGMdG5MVJSV7fIU6bJdjmwrepQbWMvRtZOsjWqPt5BYIe
 Tr2y1WFdqUMW48LKh7xQOcYHCDELGsFjj0dIFABn9Z9DM3Z8p7qh4W+IeQt01QsA
 ==
X-ME-Sender: <xms:HBcUXX9FfhoRdrZDn36epoq77XF1EsuU37NtY6YFC6mM-c415dWkyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:HBcUXUa9j9KOY8Ak6gZmtFfiRtd6UUY3gCF_-AYMovCK0o5If44DJQ>
 <xmx:HBcUXQHivyoiGtCZ9rm7PPsGCC4-WmZYREdnJi8mTclO6S1TV9k9Yw>
 <xmx:HBcUXTfyfDK7LxhQ-rnDeLeXIxlh1SBIgW46klopWxzc6IF3JiH6uQ>
 <xmx:HhcUXdmMuLkZk_6WEw1ZXYe924zdtpZ1RXGCq9Fe19peV19V36hFLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CAAE4E00A2; Wed, 26 Jun 2019 21:08:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <fa54f9a1-481e-4146-a4c2-7c43cf9a26e8@www.fastmail.com>
In-Reply-To: <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
Date: Thu, 27 Jun 2019 10:38:44 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Preparation for AST2600
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 26 Jun 2019, at 17:25, Linus Walleij wrote:
> On Wed, Jun 26, 2019 at 9:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The ASPEED AST2600 is in the pipeline, and we have enough information to start
> > preparing to upstream support for it. This series lays some ground work;
> > splitting the bindings and dicing the implementation up a little further to
> > facilitate differences between the 2600 and previous SoC generations.
> 
> All looks good to me, but Rob should have a glance at the DT bindings
> and YAML syntax before I proceed to apply them.

Thanks for the quick review. Rob's responded, looks like I'll need to send a v2 at
least. Might need a hand sorting out describing generic pinctrl dt bits (subnodes
with function and group properties).

Cheers,

Andrew
