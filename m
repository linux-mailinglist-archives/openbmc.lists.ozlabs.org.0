Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DDD2002
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 07:29:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pfls1WyFzDqTP
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 16:29:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="mgx7nbir"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pfky57zVzDqSg;
 Thu, 10 Oct 2019 16:28:42 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id 201so4450354qkd.13;
 Wed, 09 Oct 2019 22:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r6Hep4iY8u0yDM4dyep+02jvirG1WxfZPi0UCSgzEPA=;
 b=mgx7nbirD+B+qWsSDYrOWzbCFx0K9ERikuPVhs/EhHAJrKz+tDqgfmUgXGWGRSBrbo
 UryoiU6AXZ6g1zlqeWA+/eHChgkS7xn/ksIRDyTXhZHZZI91skLOoYs5Y6Z3ls60l2+j
 NN8svFecFJkunpLR7aajvO1GIMk04+rGWimLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r6Hep4iY8u0yDM4dyep+02jvirG1WxfZPi0UCSgzEPA=;
 b=KGiFY8oiBbfJH4ySeYUYZoarsKoLdFrGC7wok/wIESJMHSue1xBTAH3tLF2Ahjy5Nh
 UsqKCc8GSzh+BjEFBzi/9kd5QFbfHVpGvXb4vc/ZC3F9+SABZfpM/KtkMnI8m3tYFbOh
 y5uG6B6nWFasgqpzxAbuYbPvMU65/L6Nq4WVMp/4o47GzPwJCgUdbA5s9NuMNRzmUDU9
 b350cSizSdNyUgE6OOvLlehz4Nby5DMBPZHoD9XGx5ezlgvgTINrUmq562plwKpq7dXq
 Bd7egUN/acDoCj0l3YNSbn/1lMuBgv7sblpD9Xrz2yLhaVDf3HXc9vme1eH/aS/S2tow
 gD/A==
X-Gm-Message-State: APjAAAW8VdwzEbGkC7Tj3niDrjd67SNGNtsK9sZah/cfmjM3dCHfI1C4
 M6V3C2q67LN69Rnb4MxRige5uWOn1/lmNI64IaU=
X-Google-Smtp-Source: APXvYqwH0HMFFELFCxD2oINqI+YV0TL764wqxPt4fBPtvmrISd7LnBC85T0wCOC+E1zA48qshusCVPt0cVV1W/T+8QY=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr7795691qkb.292.1570685318745; 
 Wed, 09 Oct 2019 22:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
 <20191008203157.GA184092@google.com>
 <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com>
 <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
In-Reply-To: <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 05:28:26 +0000
Message-ID: <CACPK8Xc4JCNDwVfJ4zzsaZvoSmtqgMZwhYO8sv76aRnPiQwK_A@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To: Brendan Higgins <brendanhiggins@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Tao Ren <taoren@fb.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 21:54, Brendan Higgins <brendanhiggins@google.com> wrote:
>
> On Tue, Oct 8, 2019 at 2:13 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
> >
> > On 10/8/2019 1:31 PM, Brendan Higgins wrote:
> > > On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
> > >> In case of master pending state, it should not trigger the master
> > >> command because this H/W is sharing the same data buffer for slave
> > >> and master operations, so this commit fixes the issue with making
> > >> the master command triggering happen when the state goes to active
> > >> state.
> > >
> > > nit: Makes sense, but can you explain what might happen without your
> > > change?
> >
> > If we don't use this fix, a master command could corrupt data in the
> > shared buffer if H/W is still on processing slave operation at the
> > timing.
>
> Right, can you add that to the commit message?
>
> Is this trivially reproducible? We might want to submit this
> separately as a bugfix.
>
> Actually yeah, can you send this separately as a bugfix? I think we
> might want to include this in 5.4.
>
> Wolfram and Joel, what do you think?

Yes, good suggestion. A corruption fix should be merged I think.

Always send bug fixes upstream with Fixes tags so they land in the
stable tree. This is preferable to sending them separately to the
openbmc for inclusion in that tree, and potentially reaches a wider
audience.

Cheers,

Joel
