Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6F4AD60B
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtL6b4fg9z3bZC
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:16:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ch1X4rYM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ch1X4rYM; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtL6953lwz2x9V;
 Tue,  8 Feb 2022 22:15:45 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id w8so13370543qkw.8;
 Tue, 08 Feb 2022 03:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5ATNDVY5BBfcfxijhXC/1iC+qNbs6QVAVyFAJglrIA=;
 b=Ch1X4rYMr6HA1Ert5gDxuP0Z4IHG5DzbbwXXVp6sgfJ/CbGFZ34axFqel/jGAus/dC
 1JMkI3rMljd8A3TjT9YDbKHImN6wrC30A6uMP635b2hz9jqCbJeODuA2HtYBPpqQaq34
 g5feFwoun/O0JX5iG88O36A8iojpT6tu43L8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5ATNDVY5BBfcfxijhXC/1iC+qNbs6QVAVyFAJglrIA=;
 b=x0X3/KxrbWihaLNBnCL6pE1XLknUhkPqLB1IRno7p/JUKX3ZAvBh/L2zphb+v/sWU5
 jFT0R6xOtRluFHpQgK2UlNCP/+9dhOldU/wgyU5tz3JGNx4VYTejXD6UTmeUGjKhU1wr
 oBoHJKZ3WcL+or4jnAshXXw/8DXIt0xZ0fROVdR+QNOJMBizkSAxKzAc93cjHTteg1oc
 RMz/qBhWvDVklKE8lcK29AsxpxIuJ0SNF+axkdZFQSMwSH+JgirV9O9VPkBzmIbGD/XZ
 dwVkdYwUIZgsfu3B+uUv3hKCUTLn8MDRgCgIb5fytq0VPx+cPEKmCAiTz4Tgxz5A/rVT
 p7Sg==
X-Gm-Message-State: AOAM5300vlcVoGlFzhiRmoyzx2DEOjlg8xYScxJzbCWOLQ2MPJrZHQPE
 jILxDWEj0dfpJ8SA4RHWhjIqC716Qy5PCGoGLhA=
X-Google-Smtp-Source: ABdhPJwVhiQ9NYAesN9fwHxFsiR0uMR/oXmTftb8+ojrbzE9gOYzak69ZOdtSmXgJGRvv+Z7ZVyIh3pVPztPCn+MRgY=
X-Received: by 2002:a05:620a:44c7:: with SMTP id
 y7mr2284975qkp.347.1644318942239; 
 Tue, 08 Feb 2022 03:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20220202144838.163875-1-iwona.winiarska@intel.com>
 <20220202144838.163875-8-iwona.winiarska@intel.com>
 <YgJPFlr18AmWiTRY@kroah.com>
In-Reply-To: <YgJPFlr18AmWiTRY@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Feb 2022 11:15:30 +0000
Message-ID: <CACPK8Xc0Mo-eAH3bv1uAWxAsPFkLk0gZr9Sx0T0An68Lt2+c+Q@mail.gmail.com>
Subject: Re: [PATCH v7 07/13] peci: Add sysfs interface for PECI bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jonathan Corbet <corbet@lwn.net>, Iwona Winiarska <iwona.winiarska@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 8 Feb 2022 at 11:08, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 02, 2022 at 03:48:32PM +0100, Iwona Winiarska wrote:
> > PECI devices may not be discoverable at the time when PECI controller is
> > being added (e.g. BMC can boot up when the Host system is still in S5).
> > Since we currently don't have the capabilities to figure out the Host
> > system state inside the PECI subsystem itself, we have to rely on
> > userspace to do it for us.
> >
> > In the future, PECI subsystem may be expanded with mechanisms that allow
> > us to avoid depending on userspace interaction (e.g. CPU presence could
> > be detected using GPIO, and the information on whether it's discoverable
> > could be obtained over IPMI).
> > Unfortunately, those methods may ultimately not be available (support
> > will vary from platform to platform), which means that we still need
> > platform independent method triggered by userspace.
> >
> > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-peci | 16 +++++
> >  drivers/peci/Makefile                    |  2 +-
> >  drivers/peci/core.c                      |  3 +-
> >  drivers/peci/device.c                    |  1 +
> >  drivers/peci/internal.h                  |  5 ++
> >  drivers/peci/sysfs.c                     | 82 ++++++++++++++++++++++++
> >  6 files changed, 107 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
> >  create mode 100644 drivers/peci/sysfs.c
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-peci b/Documentation/ABI/testing/sysfs-bus-peci
> > new file mode 100644
> > index 000000000000..56c2b2216bbd
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-peci
> > @@ -0,0 +1,16 @@
> > +What:                /sys/bus/peci/rescan
> > +Date:                July 2021
> > +KernelVersion:       5.15
>
> 5.15 was a long time ago :(
>
>
> Other than this nit, these all look semi-sane to me.  What tree are you
> wanting these to go through, mine?  If so, can you fix this up (both
> places in this file) and resend?

Yes, I recommend Iwona send these through your tree.

Thanks for taking another look over them. Thanks to Iwona and Intel
for doing this work.

Cheers,

Joel
