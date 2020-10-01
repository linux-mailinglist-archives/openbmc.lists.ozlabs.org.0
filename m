Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE528073F
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 20:52:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2MgX1FFRzDqZT
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 04:52:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JAKBPF1I; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2Mfj14GYzDqY4
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 04:51:39 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id kk9so2386982pjb.2
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZirwObhtZu4UfQ0RJa0sK4GHQGoD3UYNIxW4BRzyJBM=;
 b=JAKBPF1IKivYr9lonwxZtGB2nRjbKqZPC2XVMe3R8tOwFjBerV2WnT2quoFT0lZm/+
 qoeZV2Ty1jSrtwxPjd28TLgLurrz5PKq2qPuQ25onabfmIpQZ7bOC3h9EhSa503iSqW1
 uJqeWMeXn7UGTRd/235wh5QXCFsppIL5sjn2cGMcMy90ch8ajQvI+2yiJcFhPCxqZvuB
 4RSxzgxti0DsaDY9eV/XPcbYdor6QOxvd+LOJhtI8z5firVojbmo03e5Qh4HDszjdFxr
 m+tdIQ/BlDD6/4LMFqv5ANQkgDyUf8jOC8rdTFonr3oDgWgBpCR/vjxuz2n/uTnMfQBy
 sXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZirwObhtZu4UfQ0RJa0sK4GHQGoD3UYNIxW4BRzyJBM=;
 b=qettvbYkarBnTtflduQSRWdmW+0ChRIw60mS0hweZg9mMb89cgSOvU7trX6+z2ZO02
 qSmagTR+d6QZ9IYIpuAPd73vZUcpjM8Yy+Gb5jMcRLQETOiGsfj/saOLUBZG2Z7DcGIx
 HBX36wZTOcfBUGkre74cvtm1Bl5A2BSB/gfASPzQy8G0CVJei89KfrGg/Wuq363Iv/hn
 f5jnqDYZhX6Jvkt2lMCF6AFfDDPLDrw5IXI+FWpT40/y/o47pKXjJofLSa1MceKOClmJ
 nNFBxk0SBoZL7tBpk6Xv432BWUkVtMPOb1y559USUlTgJu+CNm5ULUVYPYz6QN5C0e7y
 dARg==
X-Gm-Message-State: AOAM531uzJ9ieOCxSIlYsWwu2aUV0SzjXVV2S3FIaiNlgxRD/u+lNpib
 3/68Ju6j6iZQ8YoP8gmnDxKZVIep7HgLsotxBtE=
X-Google-Smtp-Source: ABdhPJzapsIspopKkorTGURWoj9w8qxjRcSv9HDQdcXQFsJasJlSM5z2S/HHegz4nZBhIPKdR/o7yxW5y0ipXw8ZG+E=
X-Received: by 2002:a17:90b:fc4:: with SMTP id
 gd4mr1284026pjb.129.1601578296321; 
 Thu, 01 Oct 2020 11:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com>
 <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
 <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
In-Reply-To: <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2020 21:51:17 +0300
Message-ID: <CAHp75Ver-O8=3eKHsHoKgpdd0sBQhLiC+UAqM=4C-gUfMBteuA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Avi Fishman <avifishman70@gmail.com>
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
Cc: Alex Qiu <xqiu@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 1, 2020 at 9:42 PM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Tali indeed pointed our major customers (Alex represent one of them :)
> that this feature must be handled carefully since it may break the
> communication and they are aware of that. Nevertheless they still want
> this feature, they already reviewed this and accepted it (in internal
> mails)
>
> So we will appreciate if this will be accepted.
>
> On Thu, Oct 1, 2020 at 9:27 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > On Thu, Oct 1, 2020 at 10:41 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> > > > Hi Andy,
> > > >
> > > > Customers using BMC with complex i2c topology asked us to support
> > > > changing bus frequency at run time, for example same device will
> > > > communicate with one slave at 100Kbp/s and another with 400kbp/s and
> > > > maybe also with smae device at different speed (for example an i2c
> > > > mux).
> > > > This is not only for debug.
> > >
> > > The above design is fragile to start with. If you have connected peripheral
> > > devices with different speed limitations and you try to access faster one the
> > > slower ones may block and break the bus which will need recovery.
> > >
> >
> > Hi Andy,
> >
> > To clarify, we are using a single read-only image to support multiple
> > configurations, so the supported bus rate of the devices are not known
> > at compile time, but at runtime. We start with 100 kHz, and go 400 kHz
> > if applicable. FYI, we are using 5.1 kernel, however I don't know much
> > about DT overlay.

I see. So, there are following statements:
 - the elaboration is good but I guess needs to be added somewhere in
form of the documentation
 - the internal schedules or so are not crucial for the upstream (it
rather sounds like a bribing the judge)
 - the current approach, if I'm not mistaken, is using debugfs, which
is not ABI and it's good
 - I'm not a maintainer here, but I don't like the approach

Let the maintainer decide.

-- 
With Best Regards,
Andy Shevchenko
