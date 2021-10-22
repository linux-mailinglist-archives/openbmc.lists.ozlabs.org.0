Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B276437214
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 08:47:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbFJp0kPrz3c6Q
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 17:47:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jq3iY2JK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=jq3iY2JK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbFJR55H5z2yQB
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 17:47:03 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 488E560F50;
 Fri, 22 Oct 2021 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634885221;
 bh=+Fkp4XMTW4DD+TiuV8fRU7EzH5a/UJyx5ELdTnoO+vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jq3iY2JKlAX0xOntAT8OGpltqeTISuwgz9HM/ViUZxGGBAkGBpWCFtN5QwmUL3Klh
 pfe6nt3IzzL8gQpJixVJyghPQe8Xb47mIFZpYdwC2qrrFLVuf669y7dnCCFN8AgvoV
 4nSyjbrHqJTYIHyauyIpVbelASHdZvypS4/QAP5A=
Date: Fri, 22 Oct 2021 08:46:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXJeYCFJ5DnBB63R@kroah.com>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022020032.26980-5-zev@bewilderbeest.net>
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
Cc: kvm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Rajat Jain <rajatja@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Jianxiong Gao <jxgao@google.com>, Dave Jiang <dave.jiang@intel.com>,
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

On Thu, Oct 21, 2021 at 07:00:31PM -0700, Zev Weiss wrote:
> Devices whose fwnodes are marked as reserved are instantiated, but
> will not have a driver bound to them unless userspace explicitly
> requests it by writing to a 'bind' sysfs file.  This is to enable
> devices that may require special (userspace-mediated) preparation
> before a driver can safely probe them.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/base/bus.c            |  2 +-
>  drivers/base/dd.c             | 13 ++++++++-----
>  drivers/dma/idxd/compat.c     |  3 +--
>  drivers/vfio/mdev/mdev_core.c |  2 +-
>  include/linux/device.h        | 14 +++++++++++++-
>  5 files changed, 24 insertions(+), 10 deletions(-)

Ugh, no, I don't really want to add yet-another-state to the driver core
like this.  Why are these devices even in the kernel with a driver that
wants to bind to them registered if the driver somehow should NOT be
bound to it?  Shouldn't all of that logic be in the crazy driver itself
as that is a very rare and odd thing to do that the driver core should
not care about at all.

And why does a device need userspace interaction at all?  Again, why
would the driver not know about this and handle it all directly?

thanks,

greg k-h
