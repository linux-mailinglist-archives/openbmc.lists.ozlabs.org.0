Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC54E2BA207
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 06:48:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CclwK6LjXzDqgk
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 16:48:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZjIHp4Xb; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcQLJ67RJzDqkq
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 03:36:34 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id r9so9135533lfn.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+GL1geUz8ksyok3o+HModRJUNdxfeUOLSXkwVu2pzVw=;
 b=ZjIHp4XbVLR3mEdwG18h+SFeiMuVhrEnm1I+o4JxYe6xHL5cGGoXTKaqksF40qh8AV
 2a15evGdxclpi/ZpK3Ojgi1SDjsiUalaB5XrqUBfjloVKgOnM1hLIsAlAyxTrZzPWMrQ
 p2Rpa9Q8r9pw/XLekQzHqIvCkjO+b6dNblaWQHeesD9xdO2t4KU1JbYUFndDC7ID7L1X
 CpbGZj+Q/Up26Jch8B7PWpmY/IWjeHqKISZiCEfyZ5Clq9X6mWAsqoZm3LwIkr919haZ
 S2B3+4g+z6fSO4nVDsNN8M3/frXb6a00DBqqUhskplPrNUbshRN9IyZhpdD/elrJmc0U
 AS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+GL1geUz8ksyok3o+HModRJUNdxfeUOLSXkwVu2pzVw=;
 b=Az0dOL54ZjbSanKAZqtU4nqgPpV0yi2wA6VtEsjXUVYD4H6Bef4mYMj4rJtEuI1UVU
 cgjTdS+n3oqm7TPeKmwlemCK12WHZoK/3weZz7IfwZq6TLOBln9T18Du3qAkhAakGm8H
 GZGn/2enruTxZS+CE3xPGP873KXmLQ+Q61qv+ykIVOpK29jgTaTWDUF+mOc6R+oC4d8z
 C7HeqmxBrTADhGmN0BPprcQItIeXvaHLGAIi+ctX+YpbDY290yQzGgZLkZoWsJPi4lob
 GQkSTWaJfto8vY+00qOR+bRlZmz5eHMplbqJMOay2pvJMC4XI+n4BfuPe2ZQ9LXBYcMj
 4YQg==
X-Gm-Message-State: AOAM530zn5sugpj0FkIfRNLx7zjPkBPqGZ9f+5mJp+9lkOjrYdX5P0Ch
 ocEOlKVVmpld0rFDN6NtxvUu5qRmylEj0uH9bS4=
X-Google-Smtp-Source: ABdhPJxXfPjRWHEbwDGN5Oo7lGcgZBlLqA+m05kWlN7DzRDYiiWURZwOXfqHnCGxcIQDLNCmrccAvLKQJw5PMbW1Ys8=
X-Received: by 2002:a19:48ca:: with SMTP id v193mr5856891lfa.263.1605803788474; 
 Thu, 19 Nov 2020 08:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
 <20201119010119.GA248686@roeck-us.net>
 <20201119012653.GA249502@roeck-us.net>
 <20201119074634.2e9cb21b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201119074634.2e9cb21b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 19 Nov 2020 08:36:17 -0800
Message-ID: <CAADnVQL86rs=bc+fg1EsHYZzYGC_WWOPtAVWWTqwmA_6SToGUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:41:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Jean Delvare <jdelvare@suse.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Network Development <netdev@vger.kernel.org>, openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, taoren@fb.com,
 Tao Ren <rentao.bupt@gmail.com>, bpf <bpf@vger.kernel.org>, mikechoi@fb.com,
 "David S . Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 7:46 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 18 Nov 2020 17:26:53 -0800 Guenter Roeck wrote:
> > On Wed, Nov 18, 2020 at 05:01:19PM -0800, Guenter Roeck wrote:
> > > On Wed, Nov 18, 2020 at 03:42:53PM -0800, Tao Ren wrote:
> > > > On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:
> > > > > On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:
> > > > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > > >
> > > > > > The patch series adds hardware monitoring driver for the Maxim MAX127
> > > > > > chip.
> > > > >
> > > > > Hi Tao
> > > > >
> > > > > Why are using sending a hwmon driver to the networking mailing list?
> > > > >
> > > > >     Andrew
> > > >
> > > > Hi Andrew,
> > > >
> > > > I added netdev because the mailing list is included in "get_maintainer.pl
> > > > Documentation/hwmon/index.rst" output. Is it the right command to find
> > > > reviewers? Could you please suggest? Thank you.
> > >
> > > I have no idea why running get_maintainer.pl on
> > > Documentation/hwmon/index.rst returns such a large list of mailing
> > > lists and people. For some reason it includes everyone in the XDP
> > > maintainer list. If anyone has an idea how that happens, please
> > > let me know - we'll want to get this fixed to avoid the same problem
> > > in the future.
> >
> > I found it. The XDP maintainer entry has:
> >
> > K:    xdp
> >
> > This matches Documentation/hwmon/index.rst.
> >
> > $ grep xdp Documentation/hwmon/index.rst
> >    xdpe12284
> >
> > It seems to me that a context match such as "xdp" in MAINTAINERS isn't
> > really appropriate. "xdp" matches a total of 348 files in the kernel.
> > The large majority of those is not XDP related. The maintainers
> > of XDP (and all the listed mailing lists) should not be surprised
> > to get a large number of odd review requests if they want to review
> > every single patch on files which include the term "xdp".
>
> Agreed, we should fix this. For maintainers with high patch volume life
> would be so much easier if people CCed the right folks to get reviews,
> so we should try our best to fix get_maintainer.
>
> XDP folks, any opposition to changing the keyword / filename to:
>
>         [^a-z0-9]xdp[^a-z0-9]

Reducing regex makes sense.
git grep -l -E "xdp"|wc -l
348
git grep -l -E "[^a-z0-9]xdp[^a-z0-9]"|wc -l
295

The false positive match was:
+drivers/hwmon/pmbus/Kconfig
+drivers/hwmon/pmbus/Makefile
+drivers/hwmon/pmbus/xdpe12284.c
+drivers/net/ethernet/natsemi/ns83820.c
+drivers/net/ethernet/neterion/s2io.c
+drivers/net/ethernet/neterion/s2io.h
+drivers/net/ethernet/neterion/vxge/vxge-config.c
+drivers/net/ethernet/neterion/vxge/vxge-config.h
+drivers/net/ethernet/neterion/vxge/vxge-traffic.c
+drivers/net/ethernet/sis/sis900.c
+drivers/net/ethernet/sis/sis900.h
+drivers/net/wireless/ath/ath5k/ath5k.h
+drivers/net/wireless/ath/ath5k/base.c
+drivers/net/wireless/ath/ath5k/debug.c
+drivers/net/wireless/ath/ath5k/dma.c

so it's pretty much hwmon and few drivers.
I agree that sparing xdp from hwmon patches is a good thing :)
