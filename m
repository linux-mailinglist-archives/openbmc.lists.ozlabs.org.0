Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF21C500E
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 10:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXdg3bxQzDqTb
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 18:17:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=moBRUot/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3NY8joF+; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWXc4jgbzDqYd
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 17:27:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 84D856CC;
 Tue,  5 May 2020 03:27:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 05 May 2020 03:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=Unqa23sxeK96peI8Nb1PYGhmE+
 0JSyaDDedeQTaXtDk=; b=moBRUot/r2gkiNwH/BSxXio4e2EWnZ3+CHE6V21cVY
 NyjyGFdPp5Eo+Y3x2Z3QSzddnnM2gUxjmlDDnhvZ3UlYvcKzJiqpZAJLNw/M1HXP
 Em0hkDMOpEdX8rFuhtMxgm9OqCktYU3YN8uS7x+j2MSaSpL9wS6W3Yn+rI4tBuJj
 TCgN/nwjbyaFfAdkE3V/DZzhR5o24ColqE1e/eaMz3k9iXzvQNO3tg7dfxx2ADGi
 6hLh1TvKgRXVDTGWPK1K3BIX95HMqGU7JaTMOdX2002jVjM1dWTeHs83VFC5fvwb
 UauzjEf8loCo/uF8f1oe6ChTItrqqDw4r8INe4I3Jb2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Unqa23sxeK96peI8N
 b1PYGhmE+0JSyaDDedeQTaXtDk=; b=3NY8joF+j0A6jZxquaDubCToatmf06LF+
 K8DbqhJjvnD6rngNG0F4x4rvCqDEOZDTRE4McqyVIP/5jhYwWpoqcRRnjwQohokp
 yctndJ53v7SlznT+MOUQ7UsXbJdALrXaGdu80a44AdWMFeLtKN0pnCPLx4UddeIF
 sgge9/ngvuA9n0dTU2FRWTQ7jgK/kjeNkXCT7pnp0FPMO6j7Gzsr4Ce9b3Uqrg3V
 aqysB+jbH0AanXhGmLn+Fkf35j+9omQR9yQQcl4CeaBfdswHCliKjFOhq3meM9op
 nXgckmjiO+rmh6EwNpOuy0ZuE3X1Pvq3HVl/B9hdeKWFEnID22NTg==
X-ME-Sender: <xms:ehWxXl3LsGwiX8tZovJl9_DoCtZFLgz3lQeYw6s0FKpxXQXVRdyUQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppedugedrvddrjeehrdekgeenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrg
 hjrdhiugdrrghu
X-ME-Proxy: <xmx:ehWxXmoyoqv1K6spVwdxuo2m66T88814AxZ4HO9MjIKSozP7Zq4LDw>
 <xmx:ehWxXifBMgwpMaOM0gmaCVt3L2O2HyqD_hgZLL6qGuL0tY-pE6yKaA>
 <xmx:ehWxXlp9Wlqe9SAc-7G3uURzHKnN8ux4CjJWZVZsG9DG5rN4-MhpJw>
 <xmx:exWxXjOWPcREtT15ANI_QOotX4U6-9WLQen8f0JClPFmxMZb5vv8AQ>
Received: from localhost.localdomain
 (ppp14-2-75-84.adl-apt-pir-bras31.tpg.internode.on.net [14.2.75.84])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1BD1C3066033;
 Tue,  5 May 2020 03:27:52 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.4 0/3] AST2600's Y23 heartbeat to pinctrl
Date: Tue,  5 May 2020 16:57:39 +0930
Message-Id: <20200505072742.350305-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: elkowals@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This short series adds the "heartbeat" function to ball Y23 on the AST2600,
which is the default function for the pin (not GPIO as described by previous
datasheets). It's necessary to describe the heartbeat function in order to
export the pin as GPIOP7.

Further, work-around the heartbeat behaviour for Rainer by hogging the GPIO so
that we're not messing with the microcontroller to which it is routed.

I'd like to let these patches bake for a period in the OpenBMC kernel tree
until we can verify the behaviour on hardware.

Cheers,

Andrew

Andrew Jeffery (3):
  dt-bindings: pinctrl: Add HEARTBEAT to ASPEED AST2600
  pinctrl: aspeed: Describe the heartbeat function on ball Y23
  ARM: dts: rainier: Configure ball Y23 as GPIOP7 for MCLR_VPP

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 87 ++++++++++---------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  7 ++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |  7 +-
 3 files changed, 57 insertions(+), 44 deletions(-)

-- 
2.25.1

