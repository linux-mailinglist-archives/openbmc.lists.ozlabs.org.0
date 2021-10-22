Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F404373B1
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 10:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbHfh6Ymkz3c87
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 19:33:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=d+0rlGtH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=d+0rlGtH; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbHfF50M8z3c5m
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 19:32:37 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 232EF3F5;
 Fri, 22 Oct 2021 01:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634891554;
 bh=lqkbfmixKdAIZ7NwTV3pl1HORUZPPAa/zIkOK6+t7Qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d+0rlGtHbliW+JQVt48EXvy4ih5dfAUHhgt01WK90mdgJdnnPcQ3kB2PeuNRh8uQO
 F41f+zSfFacuPovblAYpvxD6OjWmzOYPirEiAEf1JRZ/8a+q8L8RXIuiBEkKtibrda
 //21v1EIHl5bio+r9+6Q1C83qvYMwareZ0BwmBGk=
Date: Fri, 22 Oct 2021 01:32:32 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net>
 <YXJeYCFJ5DnBB63R@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXJeYCFJ5DnBB63R@kroah.com>
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

On Thu, Oct 21, 2021 at 11:46:56PM PDT, Greg Kroah-Hartman wrote:
>On Thu, Oct 21, 2021 at 07:00:31PM -0700, Zev Weiss wrote:
>> Devices whose fwnodes are marked as reserved are instantiated, but
>> will not have a driver bound to them unless userspace explicitly
>> requests it by writing to a 'bind' sysfs file.  This is to enable
>> devices that may require special (userspace-mediated) preparation
>> before a driver can safely probe them.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/base/bus.c            |  2 +-
>>  drivers/base/dd.c             | 13 ++++++++-----
>>  drivers/dma/idxd/compat.c     |  3 +--
>>  drivers/vfio/mdev/mdev_core.c |  2 +-
>>  include/linux/device.h        | 14 +++++++++++++-
>>  5 files changed, 24 insertions(+), 10 deletions(-)
>
>Ugh, no, I don't really want to add yet-another-state to the driver core
>like this.  Why are these devices even in the kernel with a driver that
>wants to bind to them registered if the driver somehow should NOT be
>bound to it?  Shouldn't all of that logic be in the crazy driver itself
>as that is a very rare and odd thing to do that the driver core should
>not care about at all.
>
>And why does a device need userspace interaction at all?  Again, why
>would the driver not know about this and handle it all directly?
>

Let me expand a bit more on the details of the specific situation I'm 
dealing with...

On a server motherboard we've got a host CPU (Xeon, Epyc, POWER, etc.) 
and a baseboard management controller, or BMC (typically an ARM SoC, an 
ASPEED AST2500 in my case).  The host CPU's firmware (BIOS/UEFI, ME 
firmware, etc.) lives in a SPI flash chip.  Because it's the host's 
firmware, that flash chip is connected to and generally (by default) 
under the control of the host CPU.  

But we also want the BMC to be able to perform out-of-band updates to 
the host's firmware, so the flash is *also* connected to the BMC.  
There's an external mux (controlled by a GPIO output driven by the BMC) 
that switches which processor (host or BMC) is actually driving the SPI 
signals to the flash chip, but there's a bunch of other stuff that's 
also required before the BMC can flip that switch and take control of 
the SPI interface:

  - the BMC needs to track (and potentially alter) the host's power state 
    to ensure it's not running (in OpenBMC the existing logic for this is 
    an entire non-trivial userspace daemon unto itself)

  - it needs to twiddle some other GPIOs to put the ME into recovery mode

  - it needs to exchange some IPMI messages with the ME to confirm it got 
    into recovery mode

(Some of the details here are specific to the particular motherboard I'm 
working with, but I'd guess other systems probably have broadly similar 
requirements.)

The firmware flash (or at least the BMC's side of the mux in front of 
it) is attached to a spi-nor controller that's well supported by an 
existing MTD driver (aspeed-smc), but that driver can't safely probe the 
chip until all the stuff described above has been done.  In particular, 
this means we can't reasonably bind the driver to that device during the 
normal device-discovery/driver-binding done in the BMC's boot process 
(nor do we want to, as that would pull the rug out from under the 
running host).  We basically only ever want to touch that SPI interface 
when a user (sysadmin using the BMC, let's say) has explicitly initiated 
an out-of-band firmware update.

So we want the kernel to be aware of the device's existence (so that we 
*can* bind a driver to it when needed), but we don't want it touching 
the device unless we really ask for it.

Does that help clarify the motivation for wanting this functionality?


Thanks,
Zev

