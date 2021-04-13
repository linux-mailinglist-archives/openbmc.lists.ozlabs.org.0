Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332135E749
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 21:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKbnD0wNlz304X
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 05:50:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ep3RW5lf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ep3RW5lf; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKbmz4vWSz304X
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 05:50:26 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so9567419pjv.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oOecOrjP4ebjB9MfD+t/MwQe3gJqtePCpwG7b5PQgBs=;
 b=ep3RW5lfGiKUgUbny3bLO13DIO+Ejr205QO9Sj9bTseb2gaW4CooOeZ0UQy8VFbUo4
 IoX72M2BDxEO7GAvHFCZUjex8Xjs5EFdJz2j2ipVz8L/TDgYsBhFf718ooClu5tAY56+
 cNV3vwNptvDHbYivOEHLlfEUesW22uB/9W7/fRxp0jEh5N85IWibEQEgCkCSpXBN2pVM
 M/TE4CRqqcG6GBj+VLaDiv1tOZL/YPffagrD+73atSsvba5eqQEGmwBWvEVEAtzHxMca
 jBfOfF9bViKDnyIXT7i2qh/7zBfV3rhpzaBuLm2LkW+q67OGIYjpAdGJUnyyC5xjfGCk
 AYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOecOrjP4ebjB9MfD+t/MwQe3gJqtePCpwG7b5PQgBs=;
 b=EhIgxFHeLUEc2m155Am4Wv8ZA/fnyKGHnuV+cisEM01C0bGOZD9ahkYOj6/kinr/Ae
 EEvqOV+GHUIaqUxc24rNipx3jambmODdV1AXcpMbo1MsnN4M6GbPPhfxRnO4R0NnaRKG
 bY2b9okklzy2nb/6nlQiizuPtGBJbyrzKbwoGoEnXGLQqLvUwXcQTpHtajqmc+F8elq6
 H8fmQ5ogcea2ib+TJeFOs0X4AMDW5mmI+olpfHbIMEsS+1mZLulLVQXnRnNiRf4FnEiE
 2RNEN9tHMkJs85Bon83OHpKYN1/w2eWpUCAKnIx1Rc5o931RuKy/RUXWHtCTGfXcfQng
 f8Fg==
X-Gm-Message-State: AOAM530wOkluRhlgLTE8Fb2vUVZxk2ofuEGpklQAz1K8pTbjCx4ElcF7
 zWaIxmnYnD+AfOhTySmAIOQZmYXUC1vPYy+gllf4tA==
X-Google-Smtp-Source: ABdhPJwaj6udX1dNnKNlsRCyFoPlCACj+fhdmzsOnCuN8ke1sAMbselzI6xf9r5pQiR9bEI7Hb/t9N6kmsPzQMoE9to=
X-Received: by 2002:a17:90a:c7d5:: with SMTP id
 gf21mr1692957pjb.80.1618343422498; 
 Tue, 13 Apr 2021 12:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
 <20210306203011.GA1152769@robh.at.kernel.org>
 <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
 <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
 <f1811747-3826-215a-d822-85170303a7c9@linux.intel.com>
 <fadf1244-ed6e-5973-ff1b-018bd20ff3b1@linux.intel.com>
In-Reply-To: <fadf1244-ed6e-5973-ff1b-018bd20ff3b1@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Apr 2021 12:50:11 -0700
Message-ID: <CAFd5g453L_+tu=vd0foiswJP16+repffPBEPCy6mpZQqnM50Ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 10:50 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Ping.
>
> On 3/10/2021 7:55 AM, Jae Hyun Yoo wrote:
> > On 3/9/2021 6:15 PM, Rob Herring wrote:
> >> On Tue, Mar 9, 2021 at 10:02 AM Jae Hyun Yoo
> >> <jae.hyun.yoo@linux.intel.com> wrote:
> >>>
> >>> Hi Rob,
> >>>
> >>> On 3/6/2021 12:30 PM, Rob Herring wrote:
> >>>> On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
> >>>>> Append bindings to support transfer mode.
> >>>>>
> >>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>>>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> >>>>> ---
> >>>>> Changes since v3:
> >>>>> - None
> >>>>>
> >>>>> Changes since v2:
> >>>>> - Moved SRAM resources back to default dtsi and added mode selection
> >>>>>     property.
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Removed buffer reg settings from default device tree and added
> >>>>> the settings
> >>>>>     into here to show the predefined buffer range per each bus.
> >>>>>
> >>>>>    .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37
> >>>>> +++++++++++++++----
> >>>>>    1 file changed, 30 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> index b47f6ccb196a..242343177324 100644
> >>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> @@ -17,6 +17,20 @@ Optional Properties:
> >>>>>    - bus-frequency    : frequency of the bus clock in Hz defaults
> >>>>> to 100 kHz when not
> >>>>>                 specified
> >>>>>    - multi-master     : states that there is another master active
> >>>>> on this bus.
> >>>>> +- aspeed,i2c-xfer-mode      : should be "byte", "buf" or "dma" to
> >>>>> select transfer
> >>>>> +                      mode defaults to "byte" mode when not
> >>>>> specified.
> >>>>> +
> >>>>> +                      I2C DMA mode on AST2500 has these restrictions:
> >>>>> +                        - If one of these controllers is enabled
> >>>>> +                            * UHCI host controller
> >>>>> +                            * MCTP controller
> >>>>> +                          I2C has to use buffer mode or byte mode
> >>>>> instead
> >>>>> +                          since these controllers run only in DMA
> >>>>> mode and
> >>>>> +                          I2C is sharing the same DMA H/W with them.
> >>>>> +                        - If one of these controllers uses DMA
> >>>>> mode, I2C
> >>>>> +                          can't use DMA mode
> >>>>> +                            * SD/eMMC
> >>>>> +                            * Port80 snoop
> >>>>
> >>>> How does one decide between byte or buf mode?
> >>>
> >>> If a given system makes just one byte r/w transactions most of the time
> >>> then byte mode will be a right setting. Otherwise, buf mode is more
> >>> efficient because it doesn't generate a bunch of interrupts on every
> >>> byte handling.
> >>
> >> Then why doesn't the driver do byte transactions when it gets small
> >> 1-4? byte transactions and buffer transactions when it gets larger
> >> sized transactions.
> >
> > Good question and it could be an option of this implementation.
> > Actually, each mode needs different register handling so we need to add
> > additional conditional branches to make it dynamic mode change depends
> > on the data size which can be a downside. Also, checked that small
> > amount of data transfer efficiency in 'buf' transfer mode is almost same
> > to 'byte' mode so there would be no big benefit from the dynamic mode
> > change. Of course, we can remove the 'byte' transfer mode but we should
> > also provide flexibility of configuration on what this hardware can
> > support, IMO.

I would rather set the choice in device tree or Kconfig, which the
former is what I think you did here.

As for doing byte mode for small transactions and buffer/DMA for large
transactions, I would prefer sticking to a single mode based on what
is selected at build/boot time. Seems less error prone to me. Then
again, Rob probably has more experience in this area than I do, so
maybe this kind of thing is pretty common and I just don't realize it.

In any case, as for getting rid of byte mode, I would support that,
but not in this patch set. I would rather switch the default and get
users on buffer/DMA mode before taking away a fallback option.

My 2 cents, but I think the OzLabs and other active OpenBMC people are
probably a little more up to date on this.

Cheers
