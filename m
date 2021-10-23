Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 287EA43827B
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 10:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hbw864XyHz2xtT
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 19:57:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lOgCEGtb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=lOgCEGtb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hbw7l2Ycbz2xt1
 for <openbmc@lists.ozlabs.org>; Sat, 23 Oct 2021 19:56:51 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A1EB60FE3;
 Sat, 23 Oct 2021 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634979409;
 bh=MQ6wVrxyRcZanowXUW3z8SklNft5GH7I+NPAlmFZ89U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lOgCEGtbsXU9ZmPHmlxnRHjXHmdadZCFqhdfjCjqh4b2K//kn9T1Ta5bkvrsjk8Jb
 NJQXChCKVkfabcQNV5BPInS0yPuMdgsYBDItULN76AoDIYT/WA57772ivr4Pgu4oy5
 1cud104Tcdd25BmP5ub1A5ZIQIXvmtr2eXrV8SMo=
Date: Sat, 23 Oct 2021 10:56:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXPOSZPA41f+EUvM@kroah.com>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net>
 <YXJeYCFJ5DnBB63R@kroah.com>
 <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
 <YXJ88eARBE3vU1aA@kroah.com> <YXLWMyleiTFDDZgm@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXLWMyleiTFDDZgm@heinlein>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Rajat Jain <rajatja@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Jianxiong Gao <jxgao@google.com>, Dave Jiang <dave.jiang@intel.com>,
 kvm@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 22, 2021 at 10:18:11AM -0500, Patrick Williams wrote:
> Hi Greg,
> 
> On Fri, Oct 22, 2021 at 10:57:21AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Oct 22, 2021 at 01:32:32AM -0700, Zev Weiss wrote:
> > > On Thu, Oct 21, 2021 at 11:46:56PM PDT, Greg Kroah-Hartman wrote:
> > > > On Thu, Oct 21, 2021 at 07:00:31PM -0700, Zev Weiss wrote:
> 
> > > So we want the kernel to be aware of the device's existence (so that we
> > > *can* bind a driver to it when needed), but we don't want it touching the
> > > device unless we really ask for it.
> > > 
> > > Does that help clarify the motivation for wanting this functionality?
> > 
> > Sure, then just do this type of thing in the driver itself.  Do not have
> > any matching "ids" for this hardware it so that the bus will never call
> > the probe function for this hardware _until_ a manual write happens to
> > the driver's "bind" sysfs file.
> 
> It sounds like you're suggesting a change to one particular driver to satisfy
> this one particular case (and maybe I'm just not understanding your suggestion).
> For a BMC, this is a pretty regular situation and not just as one-off as Zev's
> example.
> 
> Another good example is where a system can have optional riser cards with a
> whole tree of devices that might be on that riser card (and there might be
> different variants of a riser card that could go in the same slot).  Usually
> there is an EEPROM of some sort at a well-known address that can be parsed to
> identify which kind of riser card it is and then the appropriate sub-devices can
> be enumerated.  That EEPROM parsing is something that is currently done in
> userspace due to the complexity and often vendor-specific nature of it.
> 
> Many of these devices require quite a bit more configuration information than
> can be passed along a `bind` call.  I believe it has been suggested previously
> that this riser-card scenario could also be solved with dynamic loading of DT
> snippets, but that support seems simple pretty far from being merged.

Then work to get the DT code merged!  Do not try to create
yet-another-way of doing things here if DT overlays is the correct
solution here (and it seems like it is.)

thanks,

greg k-h
