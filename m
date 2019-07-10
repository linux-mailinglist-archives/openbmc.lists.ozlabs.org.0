Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4C64A93
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 18:15:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPRG1hVMzDqY6
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 02:15:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.180; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0180.hostedemail.com
 [216.40.44.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNp10xlGzDqVN;
 Thu, 11 Jul 2019 01:46:14 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id C502F1802912E;
 Wed, 10 Jul 2019 15:46:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2692:2731:2828:2917:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6691:6742:7875:7904:10004:10400:10848:11026:11232:11473:11658:11914:12296:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:21080:21220:21326:21451:21627:30012:30034:30054:30056:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: range96_50d7d845d712e
X-Filterd-Recvd-Size: 3121
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 15:45:54 +0000 (UTC)
Message-ID: <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: Joe Perches <joe@perches.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Johannes Berg
 <johannes@sipsolutions.net>
Date: Wed, 10 Jul 2019 08:45:53 -0700
In-Reply-To: <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
 <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devel@driverdev.osuosl.org, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-10 at 10:43 +0100, Russell King - ARM Linux admin wrote:
> On Wed, Jul 10, 2019 at 11:17:31AM +0200, Johannes Berg wrote:
> > On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > > These GENMASK uses are inverted argument order and the
> > > actual masks produced are incorrect.  Fix them.
> > > 
> > > Add checkpatch tests to help avoid more misuses too.
> > > 
> > > Joe Perches (12):
> > >   checkpatch: Add GENMASK tests
> > 
> > IMHO this doesn't make a lot of sense as a checkpatch test - just throw
> > in a BUILD_BUG_ON()?

I tried that.

It'd can't be done as it's used in declarations
and included in asm files and it uses the UL()
macro.

I also tried just making it do the right thing
whatever the argument order.

Oh well.

> My personal take on this is that GENMASK() is really not useful, it's
> just pure obfuscation and leads to exactly these kinds of mistakes.
> 
> Yes, I fully understand the argument that you can just specify the
> start and end bits, and it _in theory_ makes the code more readable.
> 
> However, the problem is when writing code.  GENMASK(a, b).  Is a the
> starting bit or ending bit?  Is b the number of bits?  It's confusing
> and causes mistakes resulting in incorrect code.  A BUILD_BUG_ON()
> can catch some of the cases, but not all of them.

It's a horrid little macro and I agree with Russell.

I also think if it existed at all it should have been
GENMASK(low, high) not GENMASK(high, low).

I

