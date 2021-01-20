Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8982FCA52
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:12:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLDDY0bFXzDqwF
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:12:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Wv0+9VAT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WPZH20IU; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLDBw00qqzDqBl;
 Wed, 20 Jan 2021 16:11:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 94268580655;
 Wed, 20 Jan 2021 00:11:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 00:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ZZ+Isl3JErTgV
 YzHxSVJeJQJkE/efLPrQzoT7Tl5B4g=; b=Wv0+9VATtvODiO3qBH20SgMuFIRd+
 SnkoQopJ4jVTvH7dMgCCJNK7QNFkU/7R6tYsQ8OO9lpFM1VwNTATe7JXFS+cADbQ
 F9lk9hielYRT6zZFsZNGizoH99rc/PYkyVUwfoN0RlUAQL/Rn7BAFxY45zvbZM/u
 ZjCciRMBm4z5irbaIxCaMXs8Rw194GA9ru4GEf+eK3dkMyuBO4sbGLMRD7rNen7m
 lmQNlcpvg8GelSdtfPMOqPcIS1t8ns/DhEXXB/7H/8ptEOjcCSPi/7xDIZ88j3+X
 Pj/yz26dkURlJJ7L9by6dZEqtHZInjh5l7b557c9xulqLYbvMOFZYPBlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ZZ+Isl3JErTgVYzHxSVJeJQJkE/efLPrQzoT7Tl5B4g=; b=WPZH20IU
 Qoj04uldMWmsW8AyTxqhEICyVTxbyHmxvI41XwOg27ZSu61j9WVQkzUPsmVTbCmg
 LWHd7TR1YqHV/vlb1GpO3WOTbzUFMcT/STFflkdIVxekjC4a09P4jxi+xKHcZYvs
 ve6Rh6u2EZsxx8TvbHsrEep1Qao4MRAQJlC+xoG89cGl2gmpoUpckgEmWyC6irzR
 GvG40jWKdNQOtP4AAR8e53lci42fy70lK4UjLB9DTuG+bFOUEb+m3Rpct3mQdVj0
 snEqrewmLENA9FgrLl/awPIcNe8Hf9WtgmEgttVd54i2VysF5GggK9y6792Hr4Rr
 xOQX6mfl6B/21A==
X-ME-Sender: <xms:dLsHYKYjiezCTpPIKiQvgqlvY66QZuDabMpEnZqbI_aWM9Ole_10FA>
 <xme:dLsHYNZtaQXADo_Yxq3X2lk1w4-oK7aCQiDWJ0i_XbevULFjeki8z3jmQsr-y9VW6
 CdNBQt5n28IHsv9qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdejrdeggeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:dLsHYE9gOtMm22JjnNNl3XXotQkd6ZiY_V17HidNlgGRwmUwQvJg3Q>
 <xmx:dLsHYMpnGfLeInrQHf23Y6JF_TC9GhaSR18ryDOZ20l1rZaB_Ux3YA>
 <xmx:dLsHYFpxjP7zTb2DdetPbiIsnCZjUcl_T8ED-p2jSSVGpxotWPg3JQ>
 <xmx:dbsHYG6IiDOIFLQ_6Be9kCEJ23p4l7STJR7If9dG0qx3pZj-SvDGAA>
Received: from localhost.localdomain
 (ppp14-2-107-44.adl-apt-pir-bras32.tpg.internode.on.net [14.2.107.44])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04FBF1080063;
 Wed, 20 Jan 2021 00:11:10 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: chiawei_wang@aspeedtech.com
Subject: [PATCH v5 5/5] soc: aspeed: Adapt to new LPC device tree layout
Date: Wed, 20 Jan 2021 15:40:56 +1030
Message-Id: <20210120051056.712222-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210114131622.8951-6-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-6-chiawei_wang@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, BMC-SW@aspeedtech.com,
 minyard@acm.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 andrew@aj.id.au, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, lee.jones@linaro.org,
 cyrilbur@gmail.com, haiyue.wang@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 20 ++++++++++++++------
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 23 +++++++++++++++--------

In the future please do separate patches for separate drivers, but for now:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
