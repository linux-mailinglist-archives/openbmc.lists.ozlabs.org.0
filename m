Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46165A4D0E
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:11:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBqj4nB6zDqTN
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:11:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D8CwdeDQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KYCwCzZC"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MBBS6ZJXzDqbq
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:42:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 036693CF;
 Sun,  1 Sep 2019 20:42:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 01 Sep 2019 20:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=sRIKNxUNiDM4JvqFVIu0fV+B55mKOSV
 TqrBuGQAv+X0=; b=D8CwdeDQPECh4W/HY1olr4d6qqn+yspfllqt/horL6cNiqV
 x5QrSIj77GADSo+7y4p1O6aO6km9FHr0vl3OAe5u4sNxN1wv7cyfuRvlHr9wJmPH
 kIsfVkHYkb4IKhC4K6EOW09HcXwnUgGqqIjQ71Ej6kLyWn6UBhrcX/ulhV3qICF1
 3AG1LSoWMe3iS1XWBGoGXCY3FnPA/NgTupaOxUpzG3bp4fGM00EBnjOBgjwEgSmA
 iE6pfhoyCIhNnO/wIZG0RJeUlBNKll+DBPQiQfy3UnmIdG3CbLbvp0UFkygR/rnn
 946V1ABgrD4tnvu2JXk+oY4PcUkrEvyvN5RNspQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sRIKNx
 UNiDM4JvqFVIu0fV+B55mKOSVTqrBuGQAv+X0=; b=KYCwCzZChXOzSV806CQBmN
 wL26WEtZSdXXffCP87Zx7vLlctPBrhxSJVnuQIDNcZisT4NWMzeqw2216qPZHsAD
 sD3SWY75HXfd6VgTTaKzLLkqD5M9YIdlwCaUu+uyR98n1iuu34sVXp+JtWkhW90X
 NJ64gcM4Asi7PQcjidHtrM19BIEX9Ld+xU16DSAs9YyV/N+rvm+7PlgGOIZVG2a3
 tmA/2pQgd3KmGU3hB1PSj90tteW92z/IuM77LhR6dxA3ON18uahbmroTgj96Itju
 CUNYfjs+toSJlukzzEYv0MWfEPxSUuR+XXMTN4sXntFBZwDDzlm6aAuL4bPR/uRA
 ==
X-ME-Sender: <xms:fWVsXS_5s7Wioxhv0TnJtNWP1WTVoKvYBNOcR-h1FXzuQdr1f91GHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:fWVsXdlcqPYDhR0G4eFIcBykHHkEXhzcuFu3hS7fPq7vRi7FkWx1uA>
 <xmx:fWVsXf0-VXLZyv1Utz8WcfszKjmcdy8PwPUl3WqLrOJNG2fluOPtQQ>
 <xmx:fWVsXYotCSr0aCt0biqF-qe47ZA-c_HUuKCZ0BEhfMsUenmDU4R3rw>
 <xmx:fWVsXfVsuSKzp8CDhRY7lGan6xqCKOVul4228KdcUXqbLrGpBwSUeQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A146E00A3; Sun,  1 Sep 2019 20:42:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <f0c4588c-ac85-40dc-8744-e45e19d3c570@www.fastmail.com>
In-Reply-To: <CACPK8XdMfg48O8mmzXXEPBBRcjPm7xhDjJCC3YdO6bAiJ8m1yA@mail.gmail.com>
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-4-andrew@aj.id.au>
 <CACPK8XdMfg48O8mmzXXEPBBRcjPm7xhDjJCC3YdO6bAiJ8m1yA@mail.gmail.com>
Date: Mon, 02 Sep 2019 10:13:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.2_3/5]_mmc:_sdhci-of-aspeed:_Uphold_clo?=
 =?UTF-8?Q?cks-on_post-condition_of_set=5Fclock()?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 2 Sep 2019, at 10:08, Joel Stanley wrote:
> On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The early-exit didn't seem to matter on the AST2500, but on the AST2600
> > the SD clock genuinely may not be running on entry to
> > aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
> > sdhci_enable_clk().
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> I don't quite understand what this was doing in the original patch.
> The fix is good though, I tested it.

What do you mean? You already had questions about it?  Would have been nice
to pipe up at the time if so :D

> 
> Tested-by: Joel Stanley <joel@jms.id.au>

Thanks,

Andrew
