Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A792B424D1B
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 08:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ1G44JB0z2yYS
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 17:13:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eym2bM4O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=eym2bM4O; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ1Fj6BPWz2xg6
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 17:12:41 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3749611AE;
 Thu,  7 Oct 2021 06:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633587159;
 bh=4bNba4XP77DpWNOzvphD9BElhgRpTGFdKWEav49aN7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eym2bM4OT795k6yVuj2jToVv0MuAZgGMIIrbX679g22jNsQAHlR93GgJmqrBFU+aE
 thCSFgesuQacFzqnvYS/wpa0/H+XV0Uu742osGel8y+OZGs+D7Hwfzb9bNQcU0DfwB
 iTF4VhLvfGYb1hebuAgyeMZdsi1fzkIH6IdLeaGE=
Date: Thu, 7 Oct 2021 08:12:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 1/9] sysfs: add sysfs_remove_bin_file_self() function
Message-ID: <YV6P1dM6U6sSsefc@kroah.com>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-2-zev@bewilderbeest.net>
 <YV6EVcKUQj5DNiXZ@kroah.com>
 <YV6Moz5eCsf6ZZWb@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV6Moz5eCsf6ZZWb@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 10:58:59PM -0700, Zev Weiss wrote:
> On Wed, Oct 06, 2021 at 10:23:33PM PDT, Greg Kroah-Hartman wrote:
> > On Wed, Oct 06, 2021 at 05:09:46PM -0700, Zev Weiss wrote:
> > > This is simply the bin_attribute analog to sysfs_remove_file_self().
> > 
> > No, no binary sysfs file should be triggering a remove.
> > 
> > binary sysfs files are "pass-through-only" from userspace to hardware,
> > the kernel should not be even knowing what is read/written to them.
> > 
> > What do you think this is needed for?
> > 
> 
> So, I initially set out to be able to activate/deactivate specific DT nodes
> at runtime by using the device-tree "reserved" status as defined in the spec
> (but not currently used anywhere in the kernel) to mean essentially "create
> a device for this but don't bind a driver to it" (leaving it to userspace to
> invoke bind/unbind or similar), and added initial support for the specific
> driver I'm concerned with at the moment (aspeed-smc) -- that was the
> previous patch series linked in the cover letter of this one.
> 
> In the discussion of that series, Rob suggested as an alternate approach:
> 
> > Another possibility is making 'status' writeable from userspace. It is
> > just a sysfs file.
> 
> That seemed sort of appealing to me, and this seemed like the most obvious
> way to go about implementing it.  Given that DT properties are binary
> attributes, I gather you'd consider that a non-starter though?

Why would a text attribute of "status" be a binary sysfs file?  That
feels really wrong as again, binary sysfs files are not supposed to be
parsed or handled by the kernel at all, they are only a pass-through.

thanks,

greg k-h
