Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162493EAF1F
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 06:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm9DH6Rr3z30Lw
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 14:14:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lE2ubq/U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lE2ubq/U; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm9Cn0zSyz2yXb;
 Fri, 13 Aug 2021 14:13:38 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id o123so4063410qkf.12;
 Thu, 12 Aug 2021 21:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JATj7FlSMDAm89anL9O14/wxabM+bn6u6NhVI8X8ONE=;
 b=lE2ubq/U0m3V2snJ8bMvBWCXNeU5Fw0Wv9eyUHk8DAwHTQanm5wFxiTPjKtAaxALCh
 /IVN/OSLvUl2tOs4mrRp5Rc8s+zZ9grirEMWhuj/m0+9FtTCe1nzFnhWoLeElj7/SrXq
 rCcNYIYx/BALAuUVm46dOIlYQ7dGqN/gBk43U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JATj7FlSMDAm89anL9O14/wxabM+bn6u6NhVI8X8ONE=;
 b=A63qw1RZRlhgtl1JApgEVoh0lkDrvuJo6xJLvpgrP98TTCxzD5voSqulYzImD5KIiA
 DWudcbOslQ01VEd4+A1vVibTyTQO3nHJRBvg8c0/SIYW50j4h7tBiW1JASB38hGDnoIU
 hZwm1Oe5kLYPTcXlnuf4NRBSvfqzvhfBpEslAF9zJf6ZquGCTgJSXRWnv8M0EgMVFWE/
 u8N5GvIoayqizzQZg630+jD+VEUzyzea879uatohX/cVIFHutaM8B8xcpZkANo4LRqsb
 DuySrEi+p6cyvISOz/8yvYpaBgWcdHRF7p6WQmjeCc0TuSAOHBvNIifoWIepgE4sjXkP
 Z3uw==
X-Gm-Message-State: AOAM533SuM9GJi6U2XuVyk1K/3QAvH3I5uMNpgJOuNw/GnVB3o47VNDR
 lbDUV9DJk0H/2GYLKtZ/Ir+fCYRo1I6AvCJMfrc=
X-Google-Smtp-Source: ABdhPJwZqoAo49DMKYzjDkSgFAuPBY+tIL4xnl8wvv+rWSUBDeXDtc0ndYWLTCbIfTwEdimJshNoOAUSSoZGjVZlzR0=
X-Received: by 2002:a05:620a:19a8:: with SMTP id
 bm40mr293306qkb.66.1628828015291; 
 Thu, 12 Aug 2021 21:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-5-rentao.bupt@gmail.com>
 <CACPK8XcV5On2D4D+SXnfw1M0owwfCL4Su19jOEA7yWpq+T3jLw@mail.gmail.com>
 <20210813034016.GA21895@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210813034016.GA21895@taoren-ubuntu-R90MNF91>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Aug 2021 04:13:23 +0000
Message-ID: <CACPK8XeoV8DqDNYFgK97r-Q0DebNjrmgUTydKSYmGt+3x=-vOQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ARM: dts: aspeed: Add Facebook Cloudripper
 (AST2600) BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 13 Aug 2021 at 03:40, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> On Fri, Aug 13, 2021 at 01:29:17AM +0000, Joel Stanley wrote:
> > On Thu, 5 Aug 2021 at 22:28, <rentao.bupt@gmail.com> wrote:
> > > +&mdio1 {
> > > +       status = "okay";
> >
> > You're enabling this but it looks like it's unused?
>
> Thanks Joel for the careful review. The MDIO controller is not paired
> with BMC MAC; instead, it's connected to the MDC/MDIO interface of the
> on-board switch (whose ports are connected to BMC, Host and front panel
> management port).

I see!

>
> In other word, the MDIO controller is used, but we do need some user
> space scripts to control the controller. What's your suggestion? For
> example, should I add some comments to explain the purpose?

Yes, that would make sense.

I've applied your patch, so if you want to add comments please send a
diff against this tree:

https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git/log/?h=dt-for-v5.15
