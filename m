Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E772D510BAD
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 00:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnwtH6JzCz2yHp
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 08:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eoy/L9P/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Eoy/L9P/; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knwsv0vJFz3bcy
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 08:05:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 570D6CE1CA4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 22:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB8AC385AA
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651010702;
 bh=f3y+x+jIoq4DGRlS1US0ASYjqXchO+3gcLp/ZetbNsg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eoy/L9P/NCGYqnIObNJpoaufykwjGFVGt0pIEzsGKqHwg0McwrnGwdJA2CuNXfb9O
 64FnIgu20MVLggTs66O1QBN5aOh7A5jVcwc5zKwHNaIftS5r1y86BxdIFtBAlNP4mA
 inI6sw4//9kpwnSBKSrt5JLiBp7hOaff4czV7CCE5ojzHp1TPizKnoflwPp+zN+JZv
 /eS4sMJzNBynnIcCc+JBVtG85hboR5eLRxPD75ifbZ9R4aK8gAOO56yvrHsXEZLiNp
 1Aw+hKNhjHW6K66xO4EtgsYBKf6R2sDr2MtFEEOKloop9ta7zqxnCAyYXJRYjEMRe/
 X2i9mxxew5DqA==
Received: by mail-pg1-f173.google.com with SMTP id q12so17122300pgj.13
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 15:05:02 -0700 (PDT)
X-Gm-Message-State: AOAM532mj7/iAvcCdEpFCwPU2cGsqZibxQzTA/pJt8xDKFAvFphzIL/h
 YIJZ7IBp72BB3UzqgRwnKK+LMjBOuydggrrK/g==
X-Google-Smtp-Source: ABdhPJyPBtUnTXxk3RT6NLfJXkbbUZFJ459uNsUTNbpTM+9Vq9y+dsVPfv2Yzl1mh6rc7Wui2OvyP81FE6GOokMTqnA=
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr26353448pfu.6.1651010702163; Tue, 26
 Apr 2022 15:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
 <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
 <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
 <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
 <YmhmXl5IWHmKzAyG@robh.at.kernel.org>
 <CAK8P3a3+TGSJgJ2-mgj+NjT3k8uuUpesLErwqZ2M_dkNqbMXXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3+TGSJgJ2-mgj+NjT3k8uuUpesLErwqZ2M_dkNqbMXXQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 26 Apr 2022 17:04:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKqB+Fas1NOmAq+ocG8KY6ugOiZ_o6e9=5unzf5-ku5Ag@mail.gmail.com>
Message-ID: <CAL_JsqKqB+Fas1NOmAq+ocG8KY6ugOiZ_o6e9=5unzf5-ku5Ag@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Verdun,
 Jean-Marie" <verdun@hpe.com>, Joel Stanley <joel@jms.id.au>, "Hawkins,
 Nick" <nick.hawkins@hpe.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 26, 2022 at 4:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 26, 2022 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
> > On Tue, Apr 26, 2022 at 08:00:20AM +0200, Arnd Bergmann wrote:
> > > On Mon, Apr 25, 2022 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > There are multiple ways of doing this that we already discussed
> > > in the thread. The easiest is probably to have a child node without
> > > custom registers in the DT and then use the DT helpers to
> > > populate the linux devices with the correct data.
> >
> > I think that's what the wdt binding is doing, but I don't like that.
> > Maybe it's not a child node, I can't tell.
> >
> > Bindings should not be decided on the *current* driver split on one
> > particular OS. This looks like 1 block, so 1 node.
>
> Fair enough.
>
> > If that doesn't work well or easy for Linux, then we should fix Linux.
>
> Doing a simple platform_device_create_pdata() should work fine here,
> the only problem that might exist is if the wdt driver needs access to
> DT properties, as we can't have both devices refer to the same of_node
> pointer,

Why not? There's even a struct device flag for that.

> which would cause them to be picked up by the timer driver
> again.

Huh?

That's not to say there might be some gotchas. The musb driver didn't
like sharing. But those are issues we should fix rather than
work-around in the binding.

Rob
