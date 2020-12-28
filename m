Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A745F2E6B11
	for <lists+openbmc@lfdr.de>; Mon, 28 Dec 2020 23:02:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4Wjs6QT3zDqFs
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 09:02:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o2H5SkWK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4Whv5gdyzDqC5;
 Tue, 29 Dec 2020 09:01:19 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44CBD22242;
 Mon, 28 Dec 2020 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609192876;
 bh=wec/s1ZvNiaME84+G8xSzIgFQT3HelyHFMLRjeKLA2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o2H5SkWKqEWuONe1tw7qjOrj9Q/Luk3LZobtjzgjtIHN7/kCc0enOEu2AyyWEJzIJ
 jf7YQM+/a+Yn9Dfloar8Gq2iQtkcve5vigwBRs4G4E/RtiUMCZzoxidlEUN9rcZl/a
 qqVmj1NtF7IMu6fALKWnQR/laXZWXR6QhY+iadpgewXKWkEu23EhvVvPFLTtW/mlmS
 0pGhO780BtPKciKT76JX7FN7+Yre8ClPkCLU2YVcJ42Mm+XxSwOTpxGCXVhUBUgo1r
 /qCUrn969nJEbQduH/hCr5rAN24BV8cjXLCx89gISQxRL/08NNYcIB2BXmLdMu6gno
 AGUxiQsF8kzqw==
Date: Mon, 28 Dec 2020 14:01:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Hongwei Zhang <hongweiz@ami.com>
Subject: Re: [Aspeed, v2 2/2] net: ftgmac100: Change the order of getting
 MAC address
Message-ID: <20201228140115.6af4d510@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201222210034.GC3198262@lunn.ch>
References: <20201221205157.31501-2-hongweiz@ami.com>
 <20201222201437.5588-3-hongweiz@ami.com>
 <96c355a2-ab7e-3cf0-57e7-16369da78035@gmail.com>
 <20201222210034.GC3198262@lunn.ch>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 David S Miller <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 22 Dec 2020 22:00:34 +0100 Andrew Lunn wrote:
> On Tue, Dec 22, 2020 at 09:46:52PM +0100, Heiner Kallweit wrote:
> > On 22.12.2020 21:14, Hongwei Zhang wrote:  
> > > Dear Reviewer,
> > > 
> > > Use native MAC address is preferred over other choices, thus change the order
> > > of reading MAC address, try to read it from MAC chip first, if it's not
> > >  availabe, then try to read it from device tree.
> > > 
> > > Hi Heiner,
> > >   
> > >> From:	Heiner Kallweit <hkallweit1@gmail.com>
> > >> Sent:	Monday, December 21, 2020 4:37 PM  
> > >>> Change the order of reading MAC address, try to read it from MAC chip 
> > >>> first, if it's not availabe, then try to read it from device tree.
> > >>>  
> > >> This commit message leaves a number of questions. It seems the change isn't related at all to the 
> > >> change that it's supposed to fix.
> > >>
> > >> - What is the issue that you're trying to fix?
> > >> - And what is wrong with the original change?  
> > > 
> > > There is no bug or something wrong with the original code. This patch is for
> > > improving the code. We thought if the native MAC address is available, then
> > > it's preferred over MAC address from dts (assuming both sources are available).
> > > 
> > > One possible scenario, a MAC address is set in dts and the BMC image is 
> > > compiled and loaded into more than one platform, then the platforms will
> > > have network issue due to the same MAC address they read.
> > >   
> > 
> > Typically the DTS MAC address is overwritten by the boot loader, e.g. uboot.
> > And the boot loader can read it from chip registers. There are more drivers
> > trying to read the MAC address from DTS first. Eventually, I think, the code
> > here will read the same MAC address from chip registers as uboot did before.  
> 
> Do we need to worry about, the chip contains random junk, which passes
> the validitiy test? Before this patch the value from DT would be used,
> and the random junk is ignored. Is this change possibly going to cause
> a regression?

Hongwei, please address Andrew's questions.

Once the discussion is over please repost the patches as
git-format-patch would generate them. The patch 2/2 of this 
series is not really a patch, which confuses all patch handling 
systems.

It also appears that 35c54922dc97 ("ARM: dts: tacoma: Add reserved
memory for ramoops") does not exist upstream.
