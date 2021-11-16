Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57287452ACC
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 07:27:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htbgw1m7Mz2yPd
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 17:27:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rAdWQ1YQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rAdWQ1YQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtbgV3mV3z2xD3;
 Tue, 16 Nov 2021 17:26:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AA8A614C8;
 Tue, 16 Nov 2021 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637044002;
 bh=AiP1xjR6qcKw8cmJ80lJrFN5bNbs0D2VyefHMyYb3z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAdWQ1YQxccyMONofsDbmG5JRlehNbsB99jOPJzaVFcdTRcA4ws39LiNWk3dB7uWb
 uNAT5/M4GeN3kEnYpwksavGrmR+POUUZtsZDKXx42L9m0V4gGSyQ+y+ecJSg6h7zao
 wwhvs9UzhWYf/FBFU0d7JfWEdkj/s1ZlCxm2+EV8=
Date: Tue, 16 Nov 2021 07:26:28 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH v3 06/13] peci: Add device detection
Message-ID: <YZNPFGPXfCLfJMq3@kroah.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
 <20211115182552.3830849-7-iwona.winiarska@intel.com>
 <YZKr1Rqfx6Cmw+Ok@kroah.com>
 <368c990c30c5bacde15ac4bce5db8389aea3ec9c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <368c990c30c5bacde15ac4bce5db8389aea3ec9c.camel@intel.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 15, 2021 at 10:35:23PM +0000, Winiarska, Iwona wrote:
> On Mon, 2021-11-15 at 19:49 +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 15, 2021 at 07:25:45PM +0100, Iwona Winiarska wrote:
> > > +void peci_device_destroy(struct peci_device *device)
> > > +{
> > > +       bool killed;
> > > +
> > > +       device_lock(&device->dev);
> > > +       killed = kill_device(&device->dev);
> > 
> > Eeek, why call this?
> > 
> > > +       device_unlock(&device->dev);
> > > +
> > > +       if (!killed)
> > > +               return;
> > 
> > What happened if something changed after you unlocked it?
> 
> We either killed it, or the other caller killed it.
> 
> > 
> > Why is kill_device() required at all?  That's a very rare function to
> > call, and one that only one "bus" calls today because it is very
> > special (i.e. crazy and broken...)
> 
> It's used to avoid double-delete in case of races between peci_controller
> unregister and "manually" removing the device using sysfs (pointed out by Dan in
> v2). We're calling peci_device_destroy() in both callsites.
> Other way to solve it would be to just have a peci-specific lock, but
> kill_device seemed to be well suited for the problem at hand.
> Do you suggest to remove it and just go with the lock?

Yes please, remove it and use the lock.

Also, why are you required to have a sysfs file that can remove the
device?  Who wants that?

thanks,

greg k-h
