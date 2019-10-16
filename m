Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B8D8772
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:31:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tK9m66RHzDqcj
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 15:31:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LnscKXlY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lCdCtzl6"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tK981d1XzDqLj
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 15:30:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6804B21C39;
 Wed, 16 Oct 2019 00:30:33 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 00:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=4d7y+oiDZ6RZuFniA3eUl4Mz/LwxGZI
 IcR2SMb2NQxU=; b=LnscKXlY22y6WmSww8vnAdDrqqHshT+spvMxVUIZRFOQ2RJ
 iEcSRs9xWikDWfP2wFQraVot+gh4aIijnm5XoXQ6bACymXfsNE2LTj+Gso4eTUPW
 T1WvBcbinx8dQpKY08gguxSPuJDHjLWCzCL4R3MECWlqM0S1rrLe2FJPhYhzGFWO
 oHXLB20IldsgE6h5yyR7ZJY64dPo49Hgr/1R0HCQocViJziQvwpCOQ6VPLisXRid
 QSfEcgfisnmPI6f+9yD+Uzo0Hv/hMvrYvRES8Bng9i/9HVjDxDr65mtlIua2OvG6
 UVr9Kqn2zBElWUGdJ5nc44mVVpMQV9W9kAJ7GNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4d7y+o
 iDZ6RZuFniA3eUl4Mz/LwxGZIIcR2SMb2NQxU=; b=lCdCtzl67yTVXdDmBi8/bk
 xLZB/D2AbqiAb7kFX0JoWHlftExyIf12PL7iUnmi7LPis9A6Dy84xO6k+ORUmSVP
 j0xazOYO/G7NNRywljo0G6pnC6+ALZvMQe/cwB71y1xqqNjJkceS/Q5wVg2w2Xyp
 nSA+ENsEG/LfCY6k/17r8BfW8G3EmEvw7kaSH3jxqFyoc78dijprjaRUutzGRaTZ
 v9nv+QoJg/3e6gYGrhO0bMvuZD/RNiy4MG2Y0mJGcI/aceeTt5VVxKVOkRZsb5Ud
 plGqHXIeCChC7hH1HwOgIklXH4XraBOjllG88Q0/VYAsr7foSIqZb+gw7tw01v5w
 ==
X-ME-Sender: <xms:6JymXRm7L9S7vyZ0gN4URKTrF93aQ9ypZ8-5EsqdxMqvgJ2moAcSvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeggdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:6JymXTIXD1XaO8_51X0XS7VEiWIKZnB5v3UUBd2xGDXOpkQ-PQEtbw>
 <xmx:6JymXVOHx41ygh3YZD0M-l4R5TikYlOik1loiO8XCXbCHn6POMBQsQ>
 <xmx:6JymXV5ZGbqpxfbqA1_dkuOlm-3rvBebRu4EG587tBF7s1gTUzKPLg>
 <xmx:6ZymXRLlDmQhnwPK5mr1OxoI2NNHSfQqDOxeNxjiWI_ssLLydqFOKg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 485ACE00A5; Wed, 16 Oct 2019 00:30:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <5c9e4117-ead0-4c10-b6ae-4ac638e841d7@www.fastmail.com>
In-Reply-To: <20191016040811.6999-1-joel@jms.id.au>
References: <20191016040811.6999-1-joel@jms.id.au>
Date: Wed, 16 Oct 2019 15:01:29 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3]_ARM:_dts:_aspeed:_ast2600evb:_Enable?=
 =?UTF-8?Q?_i2c_buses?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 16 Oct 2019, at 14:38, Joel Stanley wrote:
> With the exception of i2c10 and i2c11 which conflict with the pins
> for the third and forth MDIO controllers.
> 
> i2c0 comes has an ADT7490 fan controller/thermal monitor device

Drop "comes"?

> connected. The bus that it appears on depends on jumper settings, so it
> may not be present on all EVBs. It is included to assist testing of I2C.

Initially I read this paragraph as a statement about the hardware rather than
the devicetree and was slightly confused. Maybe say "The devicetree describes
an adt7490 on i2c0, however ..."?

Anyway, with the "comes" grammar fixed:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
