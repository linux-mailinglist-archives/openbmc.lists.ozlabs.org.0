Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F4B9C6DB
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 02:33:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GtK802B8zDqbr
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 10:33:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Mbj0yx4+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W2GWZAWE"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GtJK48NBzDqRZ
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 10:32:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D7AD1361;
 Sun, 25 Aug 2019 20:32:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 20:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=KNHLr7FpZDkONrdrTMfgmWkJVs32l5q
 8UBEbVZ4NYT8=; b=Mbj0yx4+wNqHRoHG+iAspGJVik+Psof6M2v51rjkPWup/po
 lhjMguKxq16rsanQPp9T+k9GRZ0FQ0TW0+2o3PzZoDjNoSC4U+H5Y3yQlRX2isJC
 0llXpS/z4f21JP0UYgJ1QoD6PspmE4MhEu+9WKBJmUxP/vmc/ORVf1zAue3MVfQ9
 l1x5ll4QNg+ldtLjdYsx/irC9ZiMN+X+AhOBbkO6oFnmIwxMbEg088VENGcmRLtO
 Bug+Th2q1pk+JlwdAryjmCSF/fw1n5mLs8utcZPONDPw4chby6X4WkYhnPoi49+y
 8W9Rr3cF1xUh0+bNRrmpCdx90ePQIj2gPMerI1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KNHLr7
 FpZDkONrdrTMfgmWkJVs32l5q8UBEbVZ4NYT8=; b=W2GWZAWE661SpzT+G/2dUk
 LcBxzHhqno7+cBAZyD3dKAwG1X25cjzISVqvcc+pmfjiYMS3+5mG6l/htEp5jCcI
 Ax+d4ffu4GxEaqli1zY6DYG9Cfv7og+zN9zYytkWC1BCqgKp3HehDRHolWKkkY+D
 H6vSU6qXZ1PDvx6e1YvPTUS1h/2Fvde5L1chreamWJjm+pzChzBanOd5f3XgnJkY
 v790OiNDmPXMM3cv5oIPKhIkjD//7o+1jFsiLYzCMtF/mfJThethgiIn//1JXuLT
 QbKlj+HRARF/yDXGVToHWmRHNNHFALOUDD2Fo/iHg0MHF8PXVM86/3K3d5FLFs5w
 ==
X-ME-Sender: <xms:qShjXQ0o5rrKpbIUP2-vaEi52kayCGyE0j7In7aTXbM4l7VLA9LpLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:qShjXTv_RIXNn0ZVxUfIqUll46rQ1ukejRaF-7yKxPGV9pmX0l642g>
 <xmx:qShjXQWB-CaQJjdIpirzWdLz9a8ds68nebKqKPImJEAVJvNMcJagTg>
 <xmx:qShjXTyIIPKpeqJfpmhKpvgF0MMbiaOJWIovEpKg_Ma-aPzA4ZpCRA>
 <xmx:qihjXVudugTCHyi1VSVKdCsLpbS7nmXOxj56_VKZPJHPuCMMVAGscQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F39B0E00A3; Sun, 25 Aug 2019 20:32:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <ba3f204a-aa11-4a81-97ab-cf8e7eca7e94@www.fastmail.com>
In-Reply-To: <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
Date: Mon, 26 Aug 2019 10:03:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Weinberger" <richard.weinberger@gmail.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 26 Aug 2019, at 04:53, Richard Weinberger wrote:
> On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > Looks like a lack of robustness to filesystem corruption to me. LWN
> 
> What exactly makes you think so?

It was a bit of guess from a brief inspection of the stack trace (that was probably
unhelpful in the overall scheme of things). Sorry for the noise.

Andrew
