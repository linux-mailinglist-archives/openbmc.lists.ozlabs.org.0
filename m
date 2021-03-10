Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE9333304
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 03:16:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwG045mlXz3cVV
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 13:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k713Q0fC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k713Q0fC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwFzp1Bx6z30H1;
 Wed, 10 Mar 2021 13:15:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D6CC64F7D;
 Wed, 10 Mar 2021 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615342547;
 bh=gGnNhPr0DWADGFGUMyDj2hs2uSoxRdjKvxqqvQf6wfo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k713Q0fCTwC990xf6Ejohm0kHuGHp7Idprckbo+eXb62Wm0pXHPRDC8U0Ns+ckixH
 1/EyzRZep1H4DsljiN0G4vq0trN4Y7mCJHPG8u4zqCw/qBd077UgD6zPe4ogE4EQYr
 ZnMJ0XObXPRk0CunPDeqKHm+rKoXwJCjf5H8jzpHF6SXbUF+oBFKPuK2F8Snh++Wwl
 Kz+e3QuDEI2tGESTFgLsBEYVw62uPLlM+8DGoApXPeqRzdZx+eUWGBXP1+pi5JvO3T
 u1OvyRfqI58/DVNKQLLEZxLuv8MTTnLeM++QFxkrypwbza3jZ9GX0VW0gk6uwR8WrA
 QTNH1d8OfhBdw==
Received: by mail-ej1-f49.google.com with SMTP id p8so34222565ejb.10;
 Tue, 09 Mar 2021 18:15:47 -0800 (PST)
X-Gm-Message-State: AOAM530WHtfDjLjvELbPvKaap51ctJ1Zkr2GG/9lexQEisNBnCbf6EoB
 czZ43SjrDZHbCQm9inZnuNoRL/SbNyDtEHS3Sg==
X-Google-Smtp-Source: ABdhPJzlfAtTISVZdDB2/RHfhz3nQgwk53TFhdnxLL8gRi9G9LQzZBtYiWJCkHcPfSznl4nBDUJz+aLmd5O2hUr/DZU=
X-Received: by 2002:a17:906:d153:: with SMTP id
 br19mr1022276ejb.360.1615342545964; 
 Tue, 09 Mar 2021 18:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
 <20210306203011.GA1152769@robh.at.kernel.org>
 <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
In-Reply-To: <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Mar 2021 19:15:34 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
Message-ID: <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tao Ren <taoren@fb.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 10:02 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 3/6/2021 12:30 PM, Rob Herring wrote:
> > On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
> >> Append bindings to support transfer mode.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> >> ---
> >> Changes since v3:
> >> - None
> >>
> >> Changes since v2:
> >> - Moved SRAM resources back to default dtsi and added mode selection
> >>    property.
> >>
> >> Changes since v1:
> >> - Removed buffer reg settings from default device tree and added the settings
> >>    into here to show the predefined buffer range per each bus.
> >>
> >>   .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
> >>   1 file changed, 30 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> index b47f6ccb196a..242343177324 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> @@ -17,6 +17,20 @@ Optional Properties:
> >>   - bus-frequency    : frequency of the bus clock in Hz defaults to 100 kHz when not
> >>                specified
> >>   - multi-master     : states that there is another master active on this bus.
> >> +- aspeed,i2c-xfer-mode      : should be "byte", "buf" or "dma" to select transfer
> >> +                      mode defaults to "byte" mode when not specified.
> >> +
> >> +                      I2C DMA mode on AST2500 has these restrictions:
> >> +                        - If one of these controllers is enabled
> >> +                            * UHCI host controller
> >> +                            * MCTP controller
> >> +                          I2C has to use buffer mode or byte mode instead
> >> +                          since these controllers run only in DMA mode and
> >> +                          I2C is sharing the same DMA H/W with them.
> >> +                        - If one of these controllers uses DMA mode, I2C
> >> +                          can't use DMA mode
> >> +                            * SD/eMMC
> >> +                            * Port80 snoop
> >
> > How does one decide between byte or buf mode?
>
> If a given system makes just one byte r/w transactions most of the time
> then byte mode will be a right setting. Otherwise, buf mode is more
> efficient because it doesn't generate a bunch of interrupts on every
> byte handling.

Then why doesn't the driver do byte transactions when it gets small
1-4? byte transactions and buffer transactions when it gets larger
sized transactions.

Rob
