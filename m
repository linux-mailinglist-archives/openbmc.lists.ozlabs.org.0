Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E927ED8452
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 01:16:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tBBD1YxkzDr4L
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 10:16:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pOvZ0FZe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZFBL3HUg"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tB9R5RG5zDqyl
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 10:15:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8AF5E7BA
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:15:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 15 Oct 2019 19:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=rvfiWOXeJrdcxN8B7eii+1EgQMGvcV3
 vBAxgJaEihbw=; b=pOvZ0FZe7SRZAMoPuveFl/12D124AjaIlHrqZpaLSHmhBxR
 ddgPU4+XtQColcZMf/OIv6YSBh67h+PlCKZgS1TEx2T6yhF9T+ha6F46d19KeNIn
 NgteyvldlxsXuu8Vdp59tWNqAPgPGz425q3XgsLNREDiFETYHKMO9qQnTDleg8AN
 aT6u4D2og/X74yzcnCTa5RkwJuim6OqLD50YIUpllC4AT0ZQUrqAlBU8gQKaq18P
 6u399n34FuAv1rJmByhvMUutMiLffoKBy/GUyidsUTMBsAt4sC/DiReNCheTpBmZ
 QMiKT573Y1hAMbbZ8EmSZ2hDC+qCWfGrJLBHTyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rvfiWO
 XeJrdcxN8B7eii+1EgQMGvcV3vBAxgJaEihbw=; b=ZFBL3HUgt9j0GmCHogXt0S
 hIxpuT4E5ZP3Fsz3+WFoNfgtuOfkXm1so4YkM2NiNdwjrwfZ9ez7VZaCPTZl5yS4
 VXLCwIIpAK20FtsFHxBAyDpuh0wA2bb1PkPNHrn+czkey99ige+MEsgpigO/F+V9
 L1NsC4vKF+RDtvh9xzXbPD5nC4+/zqoKg6mYcrbII9Rsw2E6i/B6e7uAINZYAvmA
 wFy9x3XwCdM9wIV1kEizrY2oPfVSAA/cybMTUSuERLMicOHgTonJSqLaXIoikm2S
 LIlBqqK5VwQoXUt5USnFXUFdbBcxHkwhoKccHKPKa8LGkrwc9eswvZcZuFT31hKw
 ==
X-ME-Sender: <xms:CFOmXeGpFEPHJu7UNzsq2YtDCqVyQHoXaExWJvZS0WSpOa9s-ts_Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeggddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtrdhorhhgnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:CFOmXTlw_XqmzD5ialPK5Q6JptQKMVct3GGLy0x0DVA9aWZs-cgR7Q>
 <xmx:CFOmXTLr8rShMSS2a6i0gOdbUlmnXLvIG6D2NgFjVDMciNAAKsqW0g>
 <xmx:CFOmXcYZ1IdsyLJG7V3bz7kLF6fEcJNf-JhjP_pq4Ev1Ufh-DiZ4KQ>
 <xmx:CVOmXaOg9DepJNnWH8HtygY4eMMG5XJ0rXAWGknumZ3b4gaY5kX29w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 96050E00BB; Tue, 15 Oct 2019 19:15:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <b5413723-b877-4b48-b607-e1551399ff74@www.fastmail.com>
In-Reply-To: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
References: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
Date: Wed, 16 Oct 2019 09:46:00 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_Recommendations_for_development_platforms_for_the_ASPEED_A?=
 =?UTF-8?Q?ST2500_&_AST2600=3F?=
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

Hi Bruce

On Wed, 16 Oct 2019, at 05:14, Bruce Mitchell wrote:
>  
> Hello,
> 
> 
> I am Bruce Mitchell and I work for Phoenix Technologies Ltd. as a BMC 
> firmware Engineer.
> 
> Phoenix Technologies Ltd. is developing an OpenBMC 
> (https://www.openbmc.org/ , not the Facebook flavor) product.

FYI, the projects have united (and the result lives under the Linux Foundation).
> 
> Our intent is also to be a valuable contributing member to the OpenBMC project.

Great! Looking forward to your contributions.

> 
> 
> We will be initially developing for the ASPEED Technology Inc. AST2500 
> followed by the AST2600 BMC SoC.
> 
> Do you have any suggestion of available hardware development platforms 
> for the ASPEED AST2500 & AST2600?

Unfortunately there isn't anything that is both cheap and easy to acquire that
I'm aware of. Hopefully others can chime in if they know things that I don't, but
this is an issue that's cropped up in the past and hasn't been resolved.

I think the cheapest anyone has found was a system (motherboard, cheap x86-64
CPU and RAM) that was about $800AU, but I'd have to dig out the details on what
that was exactly (and it may have been AST2400-based).

Sorry I don't have better answers.

Andrew
