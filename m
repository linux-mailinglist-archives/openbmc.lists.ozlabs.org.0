Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 875032B8C39
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 08:23:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcB4R5GQHzDqcH
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 18:23:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SykaFT23; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcB3469CBzDqbt
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 18:22:39 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q5so3602507pfk.6
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 23:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1RR09oXTHNj5D+VKWnXusC3Un6VRBPlQtmYv6ZSUsVI=;
 b=SykaFT23R/hVbaREPLzvW2AP15wUqLT+sWT6x4PeBzYCErRpZXTA1blPK8ZCNOSxv9
 z/GwsF9uEXlQR2OLiRYvAzouSE8DSpnE24YnQkxJFQONJa7luOgYcXwZfdJkrPRxT0Gu
 kAX5lmyGFh/3df3LBvVhI0+6/LIPvbIGmYYzvt4o3biOa5rKpVjRcdwg7aaiduza9Zn3
 MWwUrm3AVbMFTJQ+S/Gqgn/bvoan5rIB3N8hHg5cEdFqJck0lIQdUHrcn9fM33vEMfKj
 oyTr57Bz8FN2o1sYa+eyj3Rv2XZ7eh5TCuPjJRLUHeX+M+SCVAu8CDYTYdIZOvwfUr0P
 UfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1RR09oXTHNj5D+VKWnXusC3Un6VRBPlQtmYv6ZSUsVI=;
 b=a05S6c/cuRWcA4R3F0Cm+JpvDEyLMv71U7fsSxkvk77a+0kjER+gdXi8uXA50qCexS
 SUcMsTX4xJ73WoQbfseWfWTon1Z1YVdoJzARltbl0QKyRJpIzNivxfdvzAU8I025d5zC
 W+x7O9oCMAggqTrWEnsunSjmJbemOpuIqZAIRt1XWbYnU2fkel/tPKZMqYd6DUsnQgP1
 99UdbqU/CiPdW7DNkgBn2MlW/sng17LywhVMw1//oU+yNoOqhSHdzjHGyNOrDZwq8N+V
 Z1/0q4JH7G5lYCbnz5NOjrd4FKidAkgxLotbQvTURolT4GOA168mHNH8NVmFY8035Uvf
 6Xag==
X-Gm-Message-State: AOAM531AywHCvK0Bj0Mp7QS0VW92lIOiY+9JUfYITJRLHsublo8HHjeT
 OgtVT3TtwEVCWChBEWX8c7g=
X-Google-Smtp-Source: ABdhPJwSM7bcPvfkrjRN4rBPjOShGGjdnAqFCLalTUBjlOLyt6Pi2bllffDYwvcM9ExJ8zAEz39WSQ==
X-Received: by 2002:a17:90a:8d03:: with SMTP id
 c3mr3172717pjo.100.1605770554821; 
 Wed, 18 Nov 2020 23:22:34 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id v191sm27585931pfc.19.2020.11.18.23.22.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 23:22:34 -0800 (PST)
Date: Wed, 18 Nov 2020 23:22:26 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring
Message-ID: <20201119072225.GA19877@taoren-ubuntu-R90MNF91>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
 <20201119010119.GA248686@roeck-us.net>
 <20201119012653.GA249502@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119012653.GA249502@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, taoren@fb.com, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, mikechoi@fb.com, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 18, 2020 at 05:26:53PM -0800, Guenter Roeck wrote:
> On Wed, Nov 18, 2020 at 05:01:19PM -0800, Guenter Roeck wrote:
> > On Wed, Nov 18, 2020 at 03:42:53PM -0800, Tao Ren wrote:
> > > On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:
> > > > On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:
> > > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > > 
> > > > > The patch series adds hardware monitoring driver for the Maxim MAX127
> > > > > chip.
> > > > 
> > > > Hi Tao
> > > > 
> > > > Why are using sending a hwmon driver to the networking mailing list?
> > > > 
> > > >     Andrew
> > > 
> > > Hi Andrew,
> > > 
> > > I added netdev because the mailing list is included in "get_maintainer.pl
> > > Documentation/hwmon/index.rst" output. Is it the right command to find
> > > reviewers? Could you please suggest? Thank you.
> > 
> > I have no idea why running get_maintainer.pl on
> > Documentation/hwmon/index.rst returns such a large list of mailing
> > lists and people. For some reason it includes everyone in the XDP
> > maintainer list. If anyone has an idea how that happens, please
> > let me know - we'll want to get this fixed to avoid the same problem
> > in the future.
> > 
> 
> I found it. The XDP maintainer entry has:
> 
> K:    xdp
> 
> This matches Documentation/hwmon/index.rst.
> 
> $ grep xdp Documentation/hwmon/index.rst
>    xdpe12284
> 
> It seems to me that a context match such as "xdp" in MAINTAINERS isn't
> really appropriate. "xdp" matches a total of 348 files in the kernel.
> The large majority of those is not XDP related. The maintainers
> of XDP (and all the listed mailing lists) should not be surprised
> to get a large number of odd review requests if they want to review
> every single patch on files which include the term "xdp".
> 
> Guenter

Thanks Guenter and Andrew. Given xdp maintainers were included by
mistake, I will remove them from the future discussions of this hwmon
patch series.


Cheers,

Tao
