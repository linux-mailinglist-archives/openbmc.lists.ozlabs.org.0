Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3DD2B96AF
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 16:47:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcPFn3L3qzDqnG
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 02:47:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=eJFgy/ER; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcPDb6vpRzDqlr
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 02:46:39 +1100 (AEDT)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 813182224A;
 Thu, 19 Nov 2020 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605800796;
 bh=ZvKprxlPeDR11nAv0IeB4RNZKc7/A57CYBYK8dwYGvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eJFgy/ERDAHnV44gummxbYRBsX1kbc6TtE7RiXMtxbNIkKe7OhRg5AJfcPrxFKqjD
 RvGoJEuoxmZSF+VACQj2A8eU2SVNDpagHniFKlgF8AkQdfRkaQSpgD5aLptwItPHad
 ogoqmgOfEn08wfYIcOdiAOnWKZDBDMa2FN3swJpI=
Date: Thu, 19 Nov 2020 07:46:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring
Message-ID: <20201119074634.2e9cb21b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201119012653.GA249502@roeck-us.net>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
 <20201119010119.GA248686@roeck-us.net>
 <20201119012653.GA249502@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Jean Delvare <jdelvare@suse.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, taoren@fb.com, Tao Ren <rentao.bupt@gmail.com>,
 bpf@vger.kernel.org, mikechoi@fb.com, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 18 Nov 2020 17:26:53 -0800 Guenter Roeck wrote:
> On Wed, Nov 18, 2020 at 05:01:19PM -0800, Guenter Roeck wrote:
> > On Wed, Nov 18, 2020 at 03:42:53PM -0800, Tao Ren wrote:  
> > > On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:  
> > > > On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:  
> > > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > > 
> > > > > The patch series adds hardware monitoring driver for the Maxim MAX127
> > > > > chip.  
> > > > 
> > > > Hi Tao
> > > > 
> > > > Why are using sending a hwmon driver to the networking mailing list?
> > > > 
> > > >     Andrew  
> > > 
> > > Hi Andrew,
> > > 
> > > I added netdev because the mailing list is included in "get_maintainer.pl
> > > Documentation/hwmon/index.rst" output. Is it the right command to find
> > > reviewers? Could you please suggest? Thank you.  
> > 
> > I have no idea why running get_maintainer.pl on
> > Documentation/hwmon/index.rst returns such a large list of mailing
> > lists and people. For some reason it includes everyone in the XDP
> > maintainer list. If anyone has an idea how that happens, please
> > let me know - we'll want to get this fixed to avoid the same problem
> > in the future.
> 
> I found it. The XDP maintainer entry has:
> 
> K:    xdp
> 
> This matches Documentation/hwmon/index.rst.
> 
> $ grep xdp Documentation/hwmon/index.rst
>    xdpe12284
> 
> It seems to me that a context match such as "xdp" in MAINTAINERS isn't
> really appropriate. "xdp" matches a total of 348 files in the kernel.
> The large majority of those is not XDP related. The maintainers
> of XDP (and all the listed mailing lists) should not be surprised
> to get a large number of odd review requests if they want to review
> every single patch on files which include the term "xdp".

Agreed, we should fix this. For maintainers with high patch volume life
would be so much easier if people CCed the right folks to get reviews,
so we should try our best to fix get_maintainer.

XDP folks, any opposition to changing the keyword / filename to:

	[^a-z0-9]xdp[^a-z0-9]

?
