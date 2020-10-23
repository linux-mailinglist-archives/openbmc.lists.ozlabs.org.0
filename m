Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1716296B58
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 10:40:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHd3r73YPzDqyn
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 19:40:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ImXHeoN1; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHd2d0sf5zDqvr;
 Fri, 23 Oct 2020 19:39:52 +1100 (AEDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7588822210;
 Fri, 23 Oct 2020 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603442389;
 bh=VvRSe/OoqsH6RWGRZu9ZjCYTv4OyRkDtBy9Tp5f+wyM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ImXHeoN1ZKHEd/w7JhcCdvImXbJuvOX4ynCQAR4ku/jRK+hDMf2kn5k3NiR7MazIl
 QXhvZ5LF+658kVs8Kx2ja2RFsEKb5EL/2uhZHlWlvaLt4SUBqAqFkAGFoKSkWMZSR0
 lfSF6PyCATPOiwVtUyEI7hguvwsECyXG2QnK0rvE=
Received: by mail-qv1-f49.google.com with SMTP id w5so289336qvn.12;
 Fri, 23 Oct 2020 01:39:49 -0700 (PDT)
X-Gm-Message-State: AOAM531hOee19xQSRuWCUYP8lL0VwARTktH/Dx6sM+mBA3lVzwYRhAPu
 07V1LYDdXNfGJ6T5erYT3QOuKY2KfDbDb9ZpJuE=
X-Google-Smtp-Source: ABdhPJyJjzoKaK5cagyt39oBcijtYdW9B/rA44OHpXj7KabOoID/HljAtUFY9foobN6cU/y9qnZy0qQaSzJxUuB8HBI=
X-Received: by 2002:ad4:4203:: with SMTP id k3mr1182611qvp.8.1603442388461;
 Fri, 23 Oct 2020 01:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
 <32bfb619bbb3cd6f52f9e5da205673702fed228f.camel@kernel.crashing.org>
 <CAK8P3a2j7fV5EFmC8UvSyvXixU8=Nmp6hrJco-fdP2Z+w8bLnA@mail.gmail.com>
 <CAK8P3a0qzyb0z-OH-hGNJ8iQoLckVkkz4DQfYpFFd=UuXP3gwA@mail.gmail.com>
 <f3f4243408afb4e31a72b8ccb8cef4ba539c67a3.camel@kernel.crashing.org>
In-Reply-To: <f3f4243408afb4e31a72b8ccb8cef4ba539c67a3.camel@kernel.crashing.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Oct 2020 10:39:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1JD57NSz+_ffyNwX-ERnDq56taNXryoVyV6ZXzEXft0g@mail.gmail.com>
Message-ID: <CAK8P3a1JD57NSz+_ffyNwX-ERnDq56taNXryoVyV6ZXzEXft0g@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>, BMC-SW <BMC-SW@aspeedtech.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 9:41 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Wed, 2020-10-21 at 14:11 +0200, Arnd Bergmann wrote:
>
> > > At the moment, the only chips that need the heavy barrier are
> > > omap4 and mstar_v7, and early l2 cache controllers (not the one
> > > on Cortex-A7) have another synchronization callback that IIRC
> > > is used for streaming mappings.
>
>  .../...
>
> > > Obviously, adding one of these for ast2600 would slow down every
> > > mb() and writel() a lot, but if it is a chip-wide problem rather than
> > > one isolated to the network device, it would be the correct solution,
> > > provided that a correct code sequence can be found.
>
> I'm surprised that problem doesn't already exist on the ast2400 and
> 2500 and I thus worry about the performance impact of such a workaround
> applied generally to every MMIO writes....
>
> But we did kill mmiowb so ... ;-)

The real cost would have to be measured of course, and it depends a
lot on how it's done. The read-from-uncached-memory as in the 1/4
patch here seems fairly expensive, the mstarv7_mb() method (spinning
on an mmio read) seems worse, but the omap4 method (a posted write
to a mmio address in the memory controller to enforce a barrier between
the two ports) doesn't seem that bad and would correspond to what
the chip should be doing in the first place.

       Arnd
