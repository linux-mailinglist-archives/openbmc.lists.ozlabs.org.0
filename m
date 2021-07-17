Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EDD3CC17A
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 08:13:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRd8K0blTz307j
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 16:13:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hco7pen6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=hco7pen6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRd7y4XM1z2yYt;
 Sat, 17 Jul 2021 16:13:01 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B4C56101A;
 Sat, 17 Jul 2021 06:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626502377;
 bh=8cLLirT0hvzwP0lrOx0mYq7s2nFKexMw23WQLVT2LaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hco7pen6gNCqtDfle51bfDisW7MKsJ7n/yhJi/ea0Luopx32VeCXVFVzqjXe1fHsv
 im88Oz/kBkydDPFmD0wThbs3xhZ7b2i6UZFwJBk6c87sOh3hMd7ha2yC9lJ+sZiRyD
 I44xXq/isGnKo9KsybOIgKXsc0N8UQhHswUeWkm4=
Date: Sat, 17 Jul 2021 08:12:52 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 06/14] peci: Add core infrastructure
Message-ID: <YPJ05JUiOggKajIx@kroah.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-7-iwona.winiarska@intel.com>
 <59428599ef7efb2521bd62c49a3bc55c710f29de.camel@intel.com>
 <6807a14deb52956ad2fe390b1811dd98901a642a.camel@intel.com>
 <CAPcyv4ifjCZSUuk5H5qw6sjt5vdAkTfNzd+4imu+9e_iOt74gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4ifjCZSUuk5H5qw6sjt5vdAkTfNzd+4imu+9e_iOt74gQ@mail.gmail.com>
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 16, 2021 at 02:50:04PM -0700, Dan Williams wrote:
> On Fri, Jul 16, 2021 at 2:08 PM Winiarska, Iwona
> > > > +}
> > > > +EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
> > >
> > > I think it's cleaner to declare symbol namespaces in the Makefile. In
> > > this case, add:
> > >
> > > cflags-y += -DDEFAULT_SYMBOL_NAMESPACE=PECI
> > >
> > > ...and just use EXPORT_SYMBOL_GPL as normal in the C file.
> > >
> >
> > I kind of prefer the more verbose EXPORT_SYMBOL_NS_GPL - it also
> > doesn't "hide" the fact that we're using namespaces (everything is in
> > the C file rather than mixed into Makefile), but it's not a strong
> > opinion, so sure - I can change this.
> >
> 
> Perhaps as a tie breaker, the maintainer you are submitting this to,
> Greg, uses the -DDEFAULT_SYMBOL_NAMESPACE scheme in his subsystem,
> drivers/usb/.

We did that because namespaces were added _after_ the kernel code was
already there.  For new code like this, the original use of
EXPORT_SYMBOL_NS_GPL() is best as it is explicit and obvious.  No need
to dig around in a Makefile to find out the namespace name.

thanks,

greg k-h
