Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AAE3CA532
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 20:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQjFQ3YMbz302B
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 04:14:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=PArv2XUH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PArv2XUH; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQjF72Y73z2yX1
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jul 2021 04:14:12 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id y17so7332155pgf.12
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jul 2021 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1tDxoChGH3w0kigxd3IgaB4MUIWFPWVdk27j3deTtI=;
 b=PArv2XUHuoFYYCNw26nHq9CwvzbG6nQeD1+W+9tuw9CIHjCo25QmlzXLEWaMHwiePY
 B0+9F+qBna6V/l+aVhYdvCOlVYeSr48eboGpBqsRhS4hKxxlqNIveIbIa3FbekNhoW/G
 ysdTPrACubN0IGKcL+j5ccg+VqLRAYzDmeTC3Fqp2jH1Jca2RhTTVSuvMvHa8YdcoUXq
 V9iFuS+L4Jp6sxfskiooURy9HmVNrXb8EFmyuonce8+EheWU8z5IVBpnZ6Ol1Mz1tBRT
 0RsL3/EoAhhE56GegAW6xdgn+9U6BE0oRAuTlm9BDFcZp4DrNPoH6coz6B1nHF1/wDCH
 lrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1tDxoChGH3w0kigxd3IgaB4MUIWFPWVdk27j3deTtI=;
 b=Tz2caeP9OBavd0BByzHeJimmHyNqgD3aV7vfkoZCbKNEjGBi3tkYJnPgvg0jpcIBtU
 /PNNE112LzwSA3mMA4Uly7ld1JC5QYlW+S0jcQT2rXY+2N1xhCenxrDwJXm1p2dnuUWI
 mNk/55kts1JDpa7MFp2iXTi4VyAOvu10XQyPnq9l45/mU5aaFCtgi7jH/NTQyXUCg/t4
 SSIVlWGxBa8RCItzSpkr/8nRUZmm+DIkcmPxBDDprxMa/AH1DZpM5ELbiwg2UpMGx/6o
 MlzhGiBLVxDYEDMyqbJ0xcZazKheBd6zOBSbMoxM+GWPLQlh4N9rpH+N+r81yUh588wc
 /gbw==
X-Gm-Message-State: AOAM533w6qi7GgdUZYdVO5H0fJ2EGMP/GAGHJio1c/wjkEEfEVW6+VtI
 qYd6n5PDzVLC4qPNfEMicRe3rIjkyjpz5Q0AKZglKA==
X-Google-Smtp-Source: ABdhPJzIVasCNJ7rJeEzQm5uupieN3jepRTz4sM8N5N3G60Bq6IfkDzVYeZSTnZGA/3H1k+u+xq6BQI7KYL3gEOPU8E=
X-Received: by 2002:a05:6a00:d53:b029:32a:2db6:1be3 with SMTP id
 n19-20020a056a000d53b029032a2db61be3mr5733775pfv.71.1626372850317; Thu, 15
 Jul 2021 11:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-2-iwona.winiarska@intel.com>
 <32c71687f11fb418dafa45ecf15f7c6b50dd0397.camel@intel.com>
 <218ef97a68491e88d8012799385ee244544a157a.camel@intel.com>
In-Reply-To: <218ef97a68491e88d8012799385ee244544a157a.camel@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Jul 2021 11:13:59 -0700
Message-ID: <CAPcyv4hxsjKjLkEgGuG6tHvYxUa69315OvhYRORvCtXv6vu2nw@mail.gmail.com>
Subject: Re: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
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
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 15, 2021 at 9:47 AM Winiarska, Iwona
<iwona.winiarska@intel.com> wrote:
>
> On Wed, 2021-07-14 at 16:54 +0000, Williams, Dan J wrote:
> > On Tue, 2021-07-13 at 00:04 +0200, Iwona Winiarska wrote:
> > > Baseboard management controllers (BMC) often run Linux but are
> > > usually
> > > implemented with non-X86 processors. They can use PECI to access
> > > package
> > > config space (PCS) registers on the host CPU and since some
> > > information,
> > > e.g. figuring out the core count, can be obtained using different
> > > registers on different CPU generations, they need to decode the
> > > family
> > > and model.
> > >
> > > Move the data from arch/x86/include/asm/intel-family.h into a new
> > > file
> > > include/linux/x86/intel-family.h so that it can be used by other
> > > architectures.
> >
> > At least it would make the diffstat smaller to allow for rename
> > detection when the old file is deleted in the same patch:
> >
> >  MAINTAINERS                                                | 1 +
> >  {arch/x86/include/asm => include/linux/x86}/intel-family.h | 6 +++---
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > ...one thing people have done in the past is include a conversion
> > script in the changelog that produced the diff. That way if a
> > maintainer wants to be sure to catch any new usage of the header at
> > the old location they just run the script.
>
> You mean like a simple s#asm/intel-family.h#linux/x86/intel-family.h#g
> ?
> Operating on kernel tree? Or individual patches?

Whole kernel tree, something like this patch is a good example:

58c1a35cd522 btrfs: convert kmap to kmap_local_page, simple cases

In this one, Ira generated a patch from a script, and the maintainer
could re-run it if new development added more of the "old way" before
applying Ira's patch.

> Is including "old" header in new code that big of a deal?

I was proposing ripping the band-aid off and deleting the old header,
in which case it would cause compile breakage if someone added a new
instance of the old include before the conversion patch was applied.

> I guess it
> could break grepability (looking for users of the header, now that it
> can be pulled from two different places).
> It would be worse if someone decided to add new content to old header,
> but this should be easier to catch during review.

Having 2 potential places for the same definition causes a small
ongoing maintenance / review burden, so I vote moving the file rather
than leaving a place holder, but it's ultimately an x86 maintainer
call.
