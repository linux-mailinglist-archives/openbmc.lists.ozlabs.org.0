Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B8438F41
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 08:16:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd4VC4dp3z2yHb
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 17:16:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QcD21YYG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=QcD21YYG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd4T85DR3z2yHL
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 17:15:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C87160C4B;
 Mon, 25 Oct 2021 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635142552;
 bh=u9RFlgxwvggAHpp7I4+HRdZrg6XEuwYHqHQWNGfxSN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcD21YYGVBBXK0h72/zv5Qxuw9Yl0WUj3Wnm092zX6gBExTHPK8PxzzU9Yu00Ln09
 epbz6ZBrDNhM4Wk82l6Vd7RDb59BnHIYiaGAcz/Ijwa0t5okU981n6iDmwMCyVJeur
 W855A2NWAW9yAO4gGBSoAz8A6OMUMPoRDK3igEww=
Date: Mon, 25 Oct 2021 08:15:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXZLjTvGevAXcidW@kroah.com>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net>
 <YXJeYCFJ5DnBB63R@kroah.com>
 <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
 <YXJ88eARBE3vU1aA@kroah.com> <YXLWMyleiTFDDZgm@heinlein>
 <YXPOSZPA41f+EUvM@kroah.com>
 <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
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
 Rajat Jain <rajatja@google.com>, Jianxiong Gao <jxgao@google.com>,
 Dave Jiang <dave.jiang@intel.com>, kvm@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>,
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

On Mon, Oct 25, 2021 at 12:38:08AM -0500, Frank Rowand wrote:
> On 10/23/21 3:56 AM, Greg Kroah-Hartman wrote:
> > On Fri, Oct 22, 2021 at 10:18:11AM -0500, Patrick Williams wrote:
> >> Hi Greg,
> >>
> >> On Fri, Oct 22, 2021 at 10:57:21AM +0200, Greg Kroah-Hartman wrote:
> >>> On Fri, Oct 22, 2021 at 01:32:32AM -0700, Zev Weiss wrote:
> >>>> On Thu, Oct 21, 2021 at 11:46:56PM PDT, Greg Kroah-Hartman wrote:
> >>>>> On Thu, Oct 21, 2021 at 07:00:31PM -0700, Zev Weiss wrote:
> >>
> >>>> So we want the kernel to be aware of the device's existence (so that we
> >>>> *can* bind a driver to it when needed), but we don't want it touching the
> >>>> device unless we really ask for it.
> >>>>
> >>>> Does that help clarify the motivation for wanting this functionality?
> >>>
> >>> Sure, then just do this type of thing in the driver itself.  Do not have
> >>> any matching "ids" for this hardware it so that the bus will never call
> >>> the probe function for this hardware _until_ a manual write happens to
> >>> the driver's "bind" sysfs file.
> >>
> >> It sounds like you're suggesting a change to one particular driver to satisfy
> >> this one particular case (and maybe I'm just not understanding your suggestion).
> >> For a BMC, this is a pretty regular situation and not just as one-off as Zev's
> >> example.
> >>
> >> Another good example is where a system can have optional riser cards with a
> >> whole tree of devices that might be on that riser card (and there might be
> >> different variants of a riser card that could go in the same slot).  Usually
> >> there is an EEPROM of some sort at a well-known address that can be parsed to
> >> identify which kind of riser card it is and then the appropriate sub-devices can
> >> be enumerated.  That EEPROM parsing is something that is currently done in
> >> userspace due to the complexity and often vendor-specific nature of it.
> >>
> >> Many of these devices require quite a bit more configuration information than
> >> can be passed along a `bind` call.  I believe it has been suggested previously
> >> that this riser-card scenario could also be solved with dynamic loading of DT
> >> snippets, but that support seems simple pretty far from being merged.
> > 
> > Then work to get the DT code merged!  Do not try to create
> > yet-another-way of doing things here if DT overlays is the correct
> > solution here (and it seems like it is.)
> 
> I don't think this is a case that fits the overlay model.
> 
> We know what the description of the device is (which is what devicetree
> is all about), but the device is to be shared between the Linux kernel
> and some other entity, such as the firmware or another OS.  The issue
> to be resolved is how to describe that the device is to be shared (in
> this case exclusively by the kernel _or_ by the other entity at any
> given moment), and how to move ownership of the device between the
> Linux kernel and the other entity.
> 
> In the scenario presented by Zev, it is suggested that a user space
> agent will be involved in deciding which entity owns the device and
> to tell the Linux kernel when to take ownership of the device (and
> presumably when to relinquish ownership, although we haven't seen
> the implementation of relinquishing ownership yet).  One could
> imagine direct communication between the driver and the other
> entity to mediate ownership.  That seems like a driver specific
> defined choice to me, though if there are enough different drivers
> facing this situation then eventually a shared framework would
> make sense.

We have the bind/unbind ability today, from userspace, that can control
this.  Why not just have Linux grab the device when it boots, and then
when userspace wants to "give the device up", it writes to "unbind" in
sysfs, and then when all is done, it writes to the "bind" file and then
Linux takes back over.

Unless for some reason Linux should _not_ grab the device when booting,
then things get messier, as we have seen in this thread.

thanks,

greg k-h
