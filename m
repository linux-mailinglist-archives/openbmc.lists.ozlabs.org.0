Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F864AA1
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 18:19:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPXp3vkgzDqs8
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 02:19:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.152; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0152.hostedemail.com
 [216.40.44.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kPDn1yl1zDqqK
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 02:01:35 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id A05E28368EF4;
 Wed, 10 Jul 2019 16:01:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: balls52_46dfd74d6cd5c
X-Filterd-Recvd-Size: 2713
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 16:01:26 +0000 (UTC)
Message-ID: <c94a0a50c41c7530354b4a662ee945212424c8c7.camel@perches.com>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: Joe Perches <joe@perches.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Johannes Berg
 <johannes@sipsolutions.net>
Date: Wed, 10 Jul 2019 09:01:25 -0700
In-Reply-To: <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
 <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
 <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
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

On Wed, 2019-07-10 at 08:45 -0700, Joe Perches wrote:
> On Wed, 2019-07-10 at 10:43 +0100, Russell King - ARM Linux admin wrote:
> > On Wed, Jul 10, 2019 at 11:17:31AM +0200, Johannes Berg wrote:
> > > On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > > > These GENMASK uses are inverted argument order and the
> > > > actual masks produced are incorrect.  Fix them.
> > > > 
> > > > Add checkpatch tests to help avoid more misuses too.
> > > > 
> > > > Joe Perches (12):
> > > >   checkpatch: Add GENMASK tests
> > > 
> > > IMHO this doesn't make a lot of sense as a checkpatch test - just throw
> > > in a BUILD_BUG_ON()?
> 
> I tried that.
> 
> It'd can't be done as it's used in declarations
> and included in asm files and it uses the UL()
> macro.
> 
> I also tried just making it do the right thing
> whatever the argument order.

I forgot.

I also made all those arguments when it was
introduced in 2013.

https://lore.kernel.org/patchwork/patch/414248/

> Oh well.

yeah.


