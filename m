Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB028306860
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:08:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR15l3YRvzDr2g
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:08:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Mv6Q7EiC; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR14756XrzDr6D;
 Thu, 28 Jan 2021 11:07:03 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id k193so3692545qke.6;
 Wed, 27 Jan 2021 16:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhi3gjgQqf1/WONBFnr8h+vPR9Ca5CH+RN6fDaldJjc=;
 b=Mv6Q7EiCIaFec1448WvrWEMGWeVkC8hx5W08oZKUQBY5e0km4uSyN3IXodchc+6vRh
 GRGSPRrZfrfj5+aHPWBhrLrKw9486BiXU61H/a+bV7MtFVH6eMkRG+XBRQAqZIljjNYD
 UBUmtzMygB2b20ORo6+iXUOAk0Mf5xHtuIS0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhi3gjgQqf1/WONBFnr8h+vPR9Ca5CH+RN6fDaldJjc=;
 b=F15nG9tYHL8YjVhgAgTjuJfFdJkCkjQHYhhGiiB0amoF7a2hiWOueMV4LTp5zc5ASP
 P7LGnAT7Mt6G2iulyClxX2ZN39xeYL3q2LgXOwjFBQrOk1QPgzsfFzrET/+vtO9ID8f8
 XynWlM8DTmqbxLrC/L7lkpKMYvaoUQbrzPqAxXy1tk/52GZROfrpfuMoNjRNXaQdyyvn
 6hXHENdZikoa5bxjcwaDJbwIzw1fl/gqPISb6C+w9h4vitDoScHEulN16OJxUgt1HgKf
 GDIk4CSSxRxb/vMJZayb1dP4PiiDykKOKI1TgIj0a6tzAkZvvmGVkiuOxTcbArVOj/mK
 JqmQ==
X-Gm-Message-State: AOAM531cmgLJjI7vaxiCpRd50D4fW8ewUMlRfksx5hq4Hfo3GpeVpV5A
 i/0bWyK6hMhTze2T9vicXfFQ9gFTCoC2QNTGQxU=
X-Google-Smtp-Source: ABdhPJy68w8HJSlqlUbGGP0ZzbASSw5eaFrDi6nCxcmyL9qOHLooYKwViK35+qV8d4AvJRt0ts7MpvEHW7zub31iph8=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr12997340qkn.273.1611792419153; 
 Wed, 27 Jan 2021 16:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
 <20210114193416.GA3432711@robh.at.kernel.org>
 <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com>
In-Reply-To: <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 00:06:46 +0000
Message-ID: <CACPK8XcZTE=bnCP1-E9PTA09WnXG9Eduwx0dm-QqmQJUDa_OrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
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
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 devicetree <devicetree@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>,
 Tao Ren <taoren@fb.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jan 2021 at 20:05, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 1/14/2021 11:34 AM, Rob Herring wrote:
> >> -- reg                       : address offset and range of bus
> >> +- reg                       : Address offset and range of bus registers.
> >> +
> >> +                      An additional SRAM buffer address offset and range is
> >> +                      optional in case of enabling I2C dedicated SRAM for
> >> +                      buffer mode transfer support. If the optional range
> >> +                      is defined, buffer mode will be enabled.
> >> +                      - AST2400
> >> +                        &i2c0 { reg = <0x40 0x40>, <0x800 0x80>; };
> >> +                        &i2c1 { reg = <0x80 0x40>, <0x880 0x80>; };
> >> +                        &i2c2 { reg = <0xc0 0x40>, <0x900 0x80>; };
> >> +                        &i2c3 { reg = <0x100 0x40>, <0x980 0x80>; };
> >> +                        &i2c4 { reg = <0x140 0x40>, <0xa00 0x80>; };
> >> +                        &i2c5 { reg = <0x180 0x40>, <0xa80 0x80>; };
> >> +                        &i2c6 { reg = <0x1c0 0x40>, <0xb00 0x80>; };
> >> +                        &i2c7 { reg = <0x300 0x40>, <0xb80 0x80>; };
> >> +                        &i2c8 { reg = <0x340 0x40>, <0xc00 0x80>; };
> >> +                        &i2c9 { reg = <0x380 0x40>, <0xc80 0x80>; };
> >> +                        &i2c10 { reg = <0x3c0 0x40>, <0xd00 0x80>; };
> >> +                        &i2c11 { reg = <0x400 0x40>, <0xd80 0x80>; };
> >> +                        &i2c12 { reg = <0x440 0x40>, <0xe00 0x80>; };
> >> +                        &i2c13 { reg = <0x480 0x40>, <0xe80 0x80>; };
> >
> > All this information doesn't need to be in the binding.
> >
> > It's also an oddly structured dts file if this is what you are doing...
>
> I removed the default buffer mode settings that I added into
> 'aspeed-g4.dtsi' and 'aspeed-g5.dtsi' in v1 to avoid touching of the
> default transfer mode setting, but each bus should use its dedicated
> SRAM buffer range for enabling buffer mode so I added this information
> at here as overriding examples instead. I thought that binding document
> is a right place for providing this information but looks like it's not.
> Any recommended place for it? Is it good enough if I add it just into
> the commit message?

I agree with Rob, we don't need this described in the device tree
(binding or dts). We know what the layout is for a given aspeed
family, so the driver can have this information hard coded.

(Correct me if I've misinterpted here Rob)

>
> >> @@ -17,6 +72,25 @@ Optional Properties:
> >>   - bus-frequency    : frequency of the bus clock in Hz defaults to 100 kHz when not
> >>                specified
> >>   - multi-master     : states that there is another master active on this bus.
> >> +- aspeed,dma-buf-size       : size of DMA buffer.
> >> +                        AST2400: N/A
> >> +                        AST2500: 2 ~ 4095
> >> +                        AST2600: 2 ~ 4096
> >
> > If based on the SoC, then all this can be implied from the compatible
> > string.
> >
>
> Please help me to clarify your comment. Should I remove it from here
> with keeping the driver handling code for each SoC compatible string?
> Or should I change it like below?
> aspeed,ast2400-i2c-bus: N/A
> aspeed,ast2500-i2c-bus: 2 ~ 4095
> aspeed,ast2600-i2c-bus: 2 ~ 4096

As above, we know what the buffer size is for the specific soc family,
so we can hard code the value to expect.

The downside of this hard coding is it takes away the option of using
more buffer space for a given master in a system that only enables
some of the masters. Is this a use case you were considering? If so,
then we might revisit some of the advice in this thread.

Cheers,

Joel
