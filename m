Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39A439E9C
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 20:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdNwZ4vtfz2yKN
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 05:37:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1mZo0buW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1mZo0buW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdNw76CY3z2y7V
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 05:36:54 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8163460FC2;
 Mon, 25 Oct 2021 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635187011;
 bh=jIprGbQQGmCBYkXpWgtIIUsn7k/Yq53REA+NhZj7hPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1mZo0buWeicna4EeDy7pCWTVfV7Pypgz3V4SqexKw3u/P2XFpmyTIxKzBZkRkyhTk
 l3DauXemQGppDSo2cWDvwDK3j8ZIEf7jrXqhJ0uOyPRS+3oxKmXSyUSZf6mKp36V+S
 yK9EHmPPGBBoSsvzcFfWPPA4a/tid9yAcwSxs1eE=
Date: Mon, 25 Oct 2021 20:36:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXb5P6D8qB1cQrxh@kroah.com>
References: <YXPOSZPA41f+EUvM@kroah.com>
 <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
 <YXZLjTvGevAXcidW@kroah.com> <YXaYmie/CUHnixtX@heinlein>
 <YXap8V/jMM3Ksj7x@smile.fi.intel.com> <YXavBWTNYsufqj8u@heinlein>
 <YXayTeJiQvpRutU0@kroah.com> <YXa5AExKg+k0MmHV@heinlein>
 <YXa6t/ifxZGGSCNj@kroah.com> <YXbTLYzHadphE5ZN@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXbTLYzHadphE5ZN@heinlein>
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

On Mon, Oct 25, 2021 at 10:54:21AM -0500, Patrick Williams wrote:
> On Mon, Oct 25, 2021 at 04:09:59PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 25, 2021 at 09:02:40AM -0500, Patrick Williams wrote:
> > > On Mon, Oct 25, 2021 at 03:34:05PM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Oct 25, 2021 at 08:20:05AM -0500, Patrick Williams wrote:
> > > > I think "it" is "something needs to be the moderator between the two
> > > > operating systems".  What is the external entity that handles the
> > > > switching between the two?
> > > 
> > > Ah, ok.
> > > 
> > > Those usually end up being system / device specific.  In the case of the BIOS
> > > flash, most designs I've seen use a SPI mux between the BMC and the host
> > > processor or IO hub (PCH on Xeons).  The BMC has a GPIO to control the mux.
> > > 
> > > As far as state, the BMC on start-up will go through a set of discovery code to
> > > figure out where it left the system prior to getting reset.  That involves
> > > looking at the power subsystem and usually doing some kind of query to the host
> > > to see if it is alive.  These queries are mostly system / host-processor design
> > > specific.  I've seen anything from an IPMI/IPMB message alert from the BMC to
> > > the BIOS to ask "are you alive" to reading host processor state over JTAG to
> > > figure out if the processors are "making progress".
> > 
> > But which processor is "in control" here over the hardware?  
> 
> The BMC.  It owns the GPIO that controls the SPI mux.  
> 
> But, the BMC is responsible for doing all operations in a way that doesn't mess
> up the running host processor(s).  Pulling away the SPI flash containing the
> BIOS code at an incorrect time might do that.
> 
> > What method
> > is used to pass the device from one CPU to another from a logical point
> > of view?  
> 
> The state of the server as a whole is determined and maintained by the BMC.  I'm
> simplifying here a bit but the operation "turn on the host processors" implies
> "the host processors will access the BIOS" so the BMC must ensure "SPI mux is
> switched towards the host" before "turn on the host processors".
> 
> > Sounds like it is another driver that needs to handle all of
> > this, so why not have that be the one that adds/removes the devices
> > under control here?
> 
> If what you're describing is moving all of the state control logic into the
> kernel, I don't think that is feasible.  For some systems it would mean moving
> yet another entire IPMI stack into the kernel tree.  On others it might be
> somewhat simpler, but it is still a good amount of code.  We could probably
> write up more details on the scope of this.
> 
> If what you're describing is a small driver, similar to the board support
> drivers that were used before the device tree, that instantiates subordinate
> devices it doesn't seem like an unreasonable alternative to DT overlays to me
> (for whatever my limited kernel contribution experience counts for).
> 

Something has to be here doing the mediation between the two processors
and keeping things straight as to what processor is handling the
hardware when.  I suggest you focus on that first...

Good luck!

greg k-h
