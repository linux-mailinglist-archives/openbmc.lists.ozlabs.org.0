Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0AA2E9B
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 06:38:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KRZN4hB3zF0bZ
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 14:38:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d5mar1g+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZKQgmG4I"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KRYg4gbQzDvJ4
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 14:38:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5563421B81;
 Fri, 30 Aug 2019 00:38:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 00:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=VoFRdFkHmKwf+NUstKgtSIfB0BAm4LX
 QDe0GX0LVeTA=; b=d5mar1g+B81WIChu49UWZLKfN/nNr+X19LsJmbRNs+Z8m6b
 4M3f5n6xiDl3KBerX1nPs8U6uBoCqdczighNVEwPvKaNdESkUrUpoXbks6ha/ttP
 T4NSmHQ49vOvLCcxYxEet/KgasgWLfUR7r+zIiOJnXqQDZVv6FCh/VZtnNloAAri
 Pj09ZxxfuN9NpxY2+oc+QhJmwMHlwHe6RWGSrn+qjfa5+gkT3irq1tBg6Y2+DOaE
 xW1AE2M+k0DPFVEYkkc+QLSAaihcQeP3ie3zKcnZv+tZRbRdRSLYrXY12LZx5tE9
 E5CyCeNPZ5gOf389Zdr2lcghFB4ss05sKLi1VpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VoFRdF
 kHmKwf+NUstKgtSIfB0BAm4LXQDe0GX0LVeTA=; b=ZKQgmG4Igjrnpj7QCsZxqd
 B9iaxIUlj1FJoGPvmvLYz5UBPIOamCJBk9bxF1DJyZzQ9nNshtXneM1LNZ5szzzP
 cTGruuf49bZ3FfsrlMGnLL4kuCztCPptYyeBIZLS6xiYR2FMGIQaGKjSgsmNZzpx
 MEysqdgrWV/fMTfTMmz5qSwLvhmZ3/4BEGhkL9a523KSMm5W1EKtcuZbP+lwAVys
 BjURtxwlpjqkVbSefXPI+Lvj7rfnVQ+Hm6KotFJFrdA1xyfDijCf+OANbjoebwJb
 kEVK6a7tGJF3arxwk6mguSawsyrVo0iiMUcSWnvJ8RlZRl8A4GUU1hxuqp3Au56A
 ==
X-ME-Sender: <xms:MqhoXcoGOolxmaj4NXqJyiot__3yu31gr1gWSrwSCOV_vYI7AUomSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:MqhoXYxDkfsLO0zTq1a5yaiXH4aygGoBfkSp4almXyjtYyK-1UdYbA>
 <xmx:MqhoXXs8yxbtZ0xV0Y71ktHgDu2wGDQrA_U2U20wno8WrKF3IiQ2Hw>
 <xmx:MqhoXd7X24hAs4QqA7YwlU6wtTFwgKzkP0N5L8jjEucadvtrONLjWA>
 <xmx:M6hoXe2PV1HPCrnvxTVOwlA-cP1RSibAGWTGyF_JaiK3wOmLxni9-A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 370AFE00A3; Fri, 30 Aug 2019 00:38:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <defb09dd-eb15-4f71-a245-dde58a1a3358@www.fastmail.com>
In-Reply-To: <20190829071738.2523-1-andrew@aj.id.au>
References: <20190829071738.2523-1-andrew@aj.id.au>
Date: Fri, 30 Aug 2019 14:08:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, "Joel Stanley" <joel@jms.id.au>,
 "John Wang" <wangzqbj@inspur.com>
Subject: =?UTF-8?Q?Re:_[PATCH_pinctrl/fixes]_pinctrl:_aspeed:_Fix_spurious_mux_fa?=
 =?UTF-8?Q?ilures_on_the_AST2500?=
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

On Thu, 29 Aug 2019, at 16:47, Andrew Jeffery wrote:
> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> was determined to be a partial fix to the problem of acquiring the LPC
> Host Controller and GFX regmaps: The AST2500 pin controller may need to
> fetch syscon regmaps during expression evaluation as well as when
> setting mux state. For example, this case is hit by attempting to export
> pins exposing the LPC Host Controller as GPIOs.
> 
> An optional eval() hook is added to the Aspeed pinmux operation struct
> and called from aspeed_sig_expr_eval() if the pointer is set by the
> SoC-specific driver. This enables the AST2500 to perform the custom
> action of acquiring its regmap dependencies as required.
> 
> John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
> where the issue was found, and I've booted the fix on Witherspoon
> (AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
> under QEMU by forcing mux configurations via devmem before exporting
> GPIOs to exercise the driver.
> 
> Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and 
> GFX controllers")
> Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> Reported-by: John Wang <wangzqbj@inspur.com>
> Tested-by: John Wang <wangzqbj@inspur.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 

I've applied this change to dev-5.2

Andrew
