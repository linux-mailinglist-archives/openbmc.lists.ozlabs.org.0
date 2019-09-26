Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C013BF331
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 14:42:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fF1l4hfKzDqkS
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 22:42:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GN95cINM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gYN9wyCh"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fF0t6YT5zDqTx
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 22:41:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 77311651;
 Thu, 26 Sep 2019 08:41:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 08:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=plvTf/jNa0JhMgfAGElM8Vw62bc6YqX
 x+hHqhWQ66KQ=; b=GN95cINM3ownXKOlk2quBBdxeteddKpCdRXtxg7QVn527AE
 LDfckfyDBcw9wCE6Xsy9zx6cdjcEesKzZ6uszAM8vduL5MVbFDSFGLMEYbXkWnn5
 G2c9t6NxBS+e9kHMRmxkzfu2KZ+bP7AIjMO7C6UoUYHDzG4zHbU6Y5swDx1xTFhX
 dz/E+O7VV1lw67Vr1rpfPcXom0bw4h8jd6ZKFWaMpu+7C6gGJtgxYlQnOUsu+46v
 B9GxkAEJiPXXYoBuoeBRebpsXUG+fcLrsS6pTmIaGNlrEIDVjkuZs0o4gHU0TyIC
 oxMZAfYEr1U9PNRIg+qeM8o09nS6LU1/z3z0srA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=plvTf/
 jNa0JhMgfAGElM8Vw62bc6YqXx+hHqhWQ66KQ=; b=gYN9wyChxMlrJ0PWIFO0SN
 iwwMzyYKhjCD8yzAfEtaMNNWMPtQaemZ9PA9w8kcSb0BI85dZqYSxC0ZqRDS0gud
 K1mREJyoTnciZk7Kh7yvNdTAlH8QzDqAeOWpNMOnupSVCZlivXEvRYx7cExc/N+q
 6W5XaaXClJqPaZnBvJjhxrNd5Tj213mas6Uyp/UL5EOsvJ1UnhfZ3FB2GU8VBZjd
 mZcNN7derwoAds7xrHWNldvP2TMOpKD6dWYv4382B7CP5wpokM1DfnkXftU0+sO2
 0W98N3/PqlcV1x2YGhzqlK+t8+XDfNJTEwAMTgMKXawmXi23VVAYAILfNsi2tC1A
 ==
X-ME-Sender: <xms:-LGMXY9OC80M1382nEhomazpb04ZYWlVeroHaQrCROnn-mK7iv2yyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepohiilhgrsghsrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:-LGMXQoumuN92bqWld04NzchPZoc08p4XHXjRZTHdfGaPNWckrTZ-A>
 <xmx:-LGMXZm0O5s8Y7jBxl2qNj_mWbSOjLyWNG1pvAeh3uayvjs29l6MlQ>
 <xmx:-LGMXdavgUTK1sA1bTSPlEOQV-6z82_SFTMSGn_n33WDINPxlq0jRg>
 <xmx:-bGMXZQasPMgcAHF2RJkJv33zZ3bcYYrQKpldmOUEbmsBQZEfucwLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 511C8E00A5; Thu, 26 Sep 2019 08:41:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <c2557746-2ef5-47ba-91d6-236a36a52e44@www.fastmail.com>
In-Reply-To: <MN2PR04MB66690AB5ACEC2097E729B50CCD860@MN2PR04MB6669.namprd04.prod.outlook.com>
References: <MN2PR04MB66691B6B826B456D250D21E9CD860@MN2PR04MB6669.namprd04.prod.outlook.com>
 <MN2PR04MB66690AB5ACEC2097E729B50CCD860@MN2PR04MB6669.namprd04.prod.outlook.com>
Date: Thu, 26 Sep 2019 22:12:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zheng Bao" <fishbaoz@hotmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: [AST2500]The eth0 interface can not work
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

Hi Zheng,

On Thu, 26 Sep 2019, at 20:19, Zheng Bao wrote:
>  
> The whole dmesg is here.
> 
> root@s2600wf:~# dmesg
> [ 0.000000] Booting Linux on physical CPU 0x0
> [ 0.000000] Linux version 5.2.14-9f4f5ff (oe-user@oe-host) (gcc version 

*snip*

> [ 2.465681] aspeed-smc 1e630000.spi: Using 50 MHz SPI frequency
> [ 2.471803] aspeed-smc 1e630000.spi: unrecognized JEDEC id bytes: 00 00 
> 00 00 00 00
> [ 2.479490] aspeed-smc 1e630000.spi: Aspeed SMC probe failed -2
> [ 2.490339] aspeed-smc: probe of 1e630000.spi failed with error -2
> [ 2.498232] libphy: Fixed MDIO Bus: probed
> [ 2.503372] ftgmac100 1e660000.ethernet: Error applying setting, 
> reverse things back

Your pinmux request for MAC1 failed. What does your devicetree look like?

Building a kernel with CONFIG_DEBUG_PINCTRL=y might help.

> [ 2.511509] ftgmac100 1e660000.ethernet: Generated random MAC address 
> 52:47:da:92:a3:e6
> [ 2.519554] ftgmac100 1e660000.ethernet: Using NCSI interface
> [ 2.526596] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at e846443e
> [ 2.533818] ftgmac100 1e680000.ethernet: Error applying setting, 
> reverse things back

Same issue here

> [ 2.541937] ftgmac100 1e680000.ethernet: Generated random MAC address 
> 0a:4f:a7:ea:22:b3
> [ 2.556726] libphy: ftgmac100_mdio: probed
> [ 2.560953] ftgmac100 1e680000.ethernet (unnamed net_device) 
> (uninitialized): eth%d: no PHY found
> [ 2.569918] ftgmac100 1e680000.ethernet: MII Probe failed!

This kind of failure isn't entirely surprising in light of the above.

> 
> *From:* openbmc <openbmc-bounces+fishbaoz=hotmail.com@lists.ozlabs.org> 
> on behalf of Zheng Bao <fishbaoz@hotmail.com>
> *Sent:* Thursday, September 26, 2019 10:47 AM
> *To:* OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject:* [AST2500]The eth0 interface can not work 
> [ 15.634717] 8021q: adding VLAN 0 to HW filter on device eth0
> [ 32.249877] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found 
> to configure!
> [ 33.289813] ftgmac100 1e660000.ethernet eth0: Wrong NCSI state 0x100 
> in workqueue
> 
>  I tried to use the network on AST2500. Everything seems to be good and 
> I can use ping and webui,
>  until I rebuilt an image.
>  The part of dmesg is above. I can not trace back to a working image.  

Are you building the right image for your hardware? What platform are
you trying your build on? Is it actually an s2600wf? What source tree
are you building from? Beware that Intel have an OpenBMC fork that
contains patches that they haven't yet got merged into upstream
OpenBMC that may provide better support for their platforms:

https://lists.ozlabs.org/pipermail/openbmc/2019-September/018488.html

Andrew
