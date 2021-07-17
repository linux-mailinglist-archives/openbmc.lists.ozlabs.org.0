Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C34833CC667
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 22:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GS0k91D3xz308h
	for <lists+openbmc@lfdr.de>; Sun, 18 Jul 2021 06:55:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=yG/94pT+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=yG/94pT+; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GS0jt618Yz2yfj
 for <openbmc@lists.ozlabs.org>; Sun, 18 Jul 2021 06:55:11 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id q10so12465140pfj.12
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jul 2021 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
 b=yG/94pT++KysRkRR7Ee9X/reRZojfKEcZDLOovFdsOCIl6tMAHuE4febS8dZjRq5on
 KakPilolQePL2d3aMUyd0sD2TpYRm3tFxj9hcX+iuHw+lTBEHfYq8POysMd5FJbVILZq
 b8CQb+EfVh6yJZzKi3jm+4bSd90uJQgsJBmJLGe3ZJSJIYCLeIkEdLUyG4qCERiR/D3Y
 CLFZxGYQ2TrtobRV/SdNOcMAnBKcFjZrQJtjrVYq7LWy4xElrWV7FvFTn060p8a4rY4U
 adR8o5Jt47WSv1Zror7vG7WmZ4dkwESOOo1I1AuekVMbzXvKduiajK3Zbz5E0/tyNsPV
 XgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
 b=Sk1hkxfAf8ZkdGQNCsKcW2oTsEHBqKNn+EeV91mvQhcO7y64Do214nhHg4T0Uj6kBh
 JAKUjp5rUWuazjnPwGkEH2k5uAe1HGi9xIf7HIu2M7u+e8QkW9RjssivLtlUCvggQekx
 3mpDD8rmZF6AVyIyRbo+jteE+P1auaXYIJ+muaUYu6Hacf1MVAXZnC6XdExc6r7gSvEu
 8XZBN+lEEPAVVSBUGCh3CQCY/sY6iCvzqHb8XDm3fNeoxMYYh5p/dmf4eFMgMBRZ5yQu
 9x+jz4jpMNm/rFyoQxAzwV2HgRx85vcDVonQpCp/dj1u6xUp7mEZW+Of/C2zevWuAFdN
 WYcg==
X-Gm-Message-State: AOAM531jttwpYG3loXdTYkLJVd7g5cat765gFj9Ap3hvqy8TtxE6/wuA
 ymOZniyttW3sXAQcxeVVdoUJMTkGPE+swKpzKrSTzQ==
X-Google-Smtp-Source: ABdhPJwegUQnpKKeNNS0aeS1tIibmSwIVu8h0HW57Wt8a6q24xYnmH9VFR5v+d9CeKf0ktP85MKfdE2UMTwvnwW1EYI=
X-Received: by 2002:a65:6248:: with SMTP id q8mr16976866pgv.279.1626555305105; 
 Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-7-iwona.winiarska@intel.com>
 <59428599ef7efb2521bd62c49a3bc55c710f29de.camel@intel.com>
 <6807a14deb52956ad2fe390b1811dd98901a642a.camel@intel.com>
 <CAPcyv4ifjCZSUuk5H5qw6sjt5vdAkTfNzd+4imu+9e_iOt74gQ@mail.gmail.com>
 <YPJ05JUiOggKajIx@kroah.com>
In-Reply-To: <YPJ05JUiOggKajIx@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 17 Jul 2021 13:54:54 -0700
Message-ID: <CAPcyv4iuP=uSEWyd+N65FpasQidtN82tW8q-dvf_qT7_FMiTsw@mail.gmail.com>
Subject: Re: [PATCH 06/14] peci: Add core infrastructure
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
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

On Fri, Jul 16, 2021 at 11:13 PM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 16, 2021 at 02:50:04PM -0700, Dan Williams wrote:
> > On Fri, Jul 16, 2021 at 2:08 PM Winiarska, Iwona
> > > > > +}
> > > > > +EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
> > > >
> > > > I think it's cleaner to declare symbol namespaces in the Makefile. In
> > > > this case, add:
> > > >
> > > > cflags-y += -DDEFAULT_SYMBOL_NAMESPACE=PECI
> > > >
> > > > ...and just use EXPORT_SYMBOL_GPL as normal in the C file.
> > > >
> > >
> > > I kind of prefer the more verbose EXPORT_SYMBOL_NS_GPL - it also
> > > doesn't "hide" the fact that we're using namespaces (everything is in
> > > the C file rather than mixed into Makefile), but it's not a strong
> > > opinion, so sure - I can change this.
> > >
> >
> > Perhaps as a tie breaker, the maintainer you are submitting this to,
> > Greg, uses the -DDEFAULT_SYMBOL_NAMESPACE scheme in his subsystem,
> > drivers/usb/.
>
> We did that because namespaces were added _after_ the kernel code was
> already there.  For new code like this, the original use of
> EXPORT_SYMBOL_NS_GPL() is best as it is explicit and obvious.  No need
> to dig around in a Makefile to find out the namespace name.

Fair enough.

/me goes to update drivers/cxl/
