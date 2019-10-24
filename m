Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855DE2751
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 02:11:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z71w6jNQzDqSH
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 11:11:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="j21CTRG7"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z70v3bt0zDqRW
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 11:10:06 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id w8so10912708plq.5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tImeg5272b34Iznxl7Petu49srNSrEFj8p4qE+iFB8=;
 b=j21CTRG74DBey/56enrbYiNGRYUPHKf+Tt4cBnF1QjdGfWVCI7X7Rwoqt6cT7bOaRw
 7qZF93FyhuNm2QYaQ6kkpgf2uKDOo1xl5aqWPocz3W8JZY74y516CmEidWbXfhhi2u2l
 NDPWN5fI5tZn1g7oTRrN/OeBPyG2FvgyICzdB17Z5kQPH5mAyHyf3jrxg5HR5ObDd4fR
 i91ry+bfumEB7bzLIO07dvh9qvwOeEybFytCibn2Tlzcia5qTC+qbzosHR8IOHwafrnB
 PQRiR7tCXtAMfYdKXHEQadMwwox57seDQtLF1BJ86dBvf0oEvX00KLZ3Jy6KJCJ02W1a
 yMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tImeg5272b34Iznxl7Petu49srNSrEFj8p4qE+iFB8=;
 b=kPyUXRdeoa9lI2TLCYMxEKSD+Frjm1lQbGUgLcsrnwjx6jE9HNmlBA+4ZqAscCBGPi
 NheTQ/0Q8sx7uctjtxXgfm9iR7WH1zPzxiZDjEXGV9EPcE0PwSmw5uiEyxAhQ4/ZgQfB
 z9FqOtgNb3q1tgZ+OXkqUpREHESidWXbb1o6u9Z9m+gnihNmtUXSAGVv0sM+GnpOEQrH
 iPxSwjpBbgACbzoe1f1vUkmHW/YO/IbSyosVt0fiLRHhp97Kh8t1hB8pDjG2Qzo8W2/8
 T0smdbpAAuv/A9LlvNlgIqpZ9rUO3jZj3QqgeebfbBvN1rGjnoxAsZIhgskNB0FVbSqT
 cqCg==
X-Gm-Message-State: APjAAAXN8i2m8cw2XJ3s1gIRXHFeKrpUhmouKCnLZm/UekqdcT+f/V+1
 LxZX0MtI4BZJk0HsxL9o5YfJdjPS2fgO7TpKwR6fMA==
X-Google-Smtp-Source: APXvYqwVTdv5flgYg4yFFEBd0ungWO8pwYhfFAqkTY5/02eGxtUR/KpgK/9utcjmJ2eIkJGmMlBL+VCw2nZBAe+Eol0=
X-Received: by 2002:a17:902:b189:: with SMTP id
 s9mr6980823plr.325.1571875802336; 
 Wed, 23 Oct 2019 17:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
 <b98827fa-462a-060b-efc7-27fe5d7742ff@axentia.se>
 <7806ece8-1d7c-7aa8-20af-6f5f964bec64@linux.intel.com>
 <6eba3e62-9215-0c39-258b-7abfb394bc48@axentia.se>
In-Reply-To: <6eba3e62-9215-0c39-258b-7abfb394bc48@axentia.se>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 23 Oct 2019 17:09:51 -0700
Message-ID: <CAFd5g46Zv6E=PcU6=aX65rg2TRY5y3nWB8CYjGJioU_zpfcOUw@mail.gmail.com>
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
To: Peter Rosin <peda@axentia.se>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 2:17 PM Peter Rosin <peda@axentia.se> wrote:
>
> On 2019-10-22 19:44, Jae Hyun Yoo wrote:
> > On 10/22/2019 1:45 AM, Peter Rosin wrote:
> >> On 2019-10-21 23:57, Jae Hyun Yoo wrote:
> >>> Hi Peter,
> >>>
> >>> On 10/21/2019 2:05 PM, Peter Rosin wrote:
> >>>> On 2019-10-21 22:24, Jae Hyun Yoo wrote:
> >>>>> Append a binding to support hardware timeout feature.
> >>>>>
> >>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>>>> ---
> >>>>>    Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 2 ++
> >>>>>    1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> index b47f6ccb196a..133bfedf4cdd 100644
> >>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> @@ -17,6 +17,8 @@ Optional Properties:
> >>>>>    - bus-frequency        : frequency of the bus clock in Hz defaults to 100 kHz when not
> >>>>>                     specified
> >>>>>    - multi-master : states that there is another master active on this bus.
> >>>>> +- aspeed,hw-timeout-ms   : Hardware timeout in milliseconds. If it's not
> >>>>> +                   specified, the H/W timeout feature will be disabled.
> >>>>>
> >>>>>    Example:
> >>>>>
> >>>>>
> >>>>
> >>>> Some SMBus clients support a smbus-timeout-disable binding for disabling
> >>>> timeouts like this, for cases where the I2C adapter in question on occasion
> >>>> is unable to keep the pace. Adding that property thus avoids undesired
> >>>> timeouts when the client is SMBus conformant without it. Your new binding
> >>>> is the reverse situation, where you want to add a timeout where one is
> >>>> otherwise missing.
> >>>>
> >>>> Anyway, since I2C does not have a specified lowest possible frequency, this
> >>>> feels like something that is more in the SMBus arena. Should the property
> >>>> perhaps be a generic property named smbus-timeout-ms, or something like
> >>>> that?
> >>>
> >>> Well, I tried upstreaming of the generic timeout property a year ago but
> >>> I agreed that the generic bus timeout property can be set by an ioctl
> >>> command so it didn't need to be added into device tree at that time. Not
> >>> sure if any need has come recently but I haven't heard that. This driver
> >>> still uses the generic timeout property which is provided by i2c core
> >>> for handling command timeouts, and it's out of scope from this patch
> >>> series.
> >>>
> >>>> If the above is not wanted or appropriate, then I would personally prefer
> >>>> aspeed,bus-timeout-ms over aspeed,hw-timeout-ms. To me, hw-timeout-ms sounds
> >>>> like a (more serious) timeout between the CPU and the I2C peripheral unit
> >>>> or something like that. But I don't care deeply...
> >>>
> >>> Changes I submitted in this patch set is for a different purpose which
> >>> is very Aspeed H/W specific, and actually it's a more serious timeout
> >>> setting indeed. If this H/W is used in multi-master environment, it
> >>> could meet a H/W hang that freezes itself in slave mode and it can't
> >>> escape from the state. To resolve the specific case, this H/W provides
> >>> self-recovery feature which monitors abnormal state of SDA, SCL and its
> >>> H/W state machine using the timeout setting to determine the escape
> >>> condition.
> >>
> >> Are you saying that the aspeed HW is buggy and that this abnormal state
> >> is self inflicted by the aspeed HW even if other masters on the bus
> >> behave sanely? Because I didn't quite read it that way at all...
> >
> > I don't think it's an Aspeed HW bug. Actually, this HW can be exposed to
> > very severe environments if it is used as a Baseboard Management
> > Controller which needs two or more multi-masters on a bus depends on
> > HW design. Also, it should expect unknown or buggy device attachment
> > on a bus through add-on card slots. Aspeed HW provides HW timeout
> > feature to support exceptional cases handling which comes from the
> > severe use cases.
> >
> >> To me, it sounded *exactly* like the state I2C clients end up in when an
> >> I2C master "dies" and stops communicating in the middle of a transaction.
> >> I.e. the thing that the SMBus timeout is designed to prevent (and the
> >> state the I2C nine-clk-recovery sequence addresses). The only twist (that
> >> I saw) was that the aspeed HW is also a master and that the aspeed master
> >> driver is completely locked out from the bus while some obnoxious master
> >> fails to complete its transaction (or whatever it was up to).
> >
> > If this HW runs on a single-master bus, any master dying issue will be
> > cured by recovery logic which this driver already has and the logic uses
> > the bus timeout setting you are saying.
> >
> > This patch set is mainly focusing on a 'slave mode hang' issue on a
> > 'multi-master' bus which can't be covered by the recovery logic.
> >
> >> If this can only be triggered when the HW is acting as a slave, and by
> >> aborted or otherwise funky master activity on the bus, then I wouldn't
> >> call it an HW issue. Then it would be a bus issue. I.e. something needing
> >> a bus-timeout instead of a hw-timeout.
> >
> > Here is an example. In a multi-node BMC system, a peer master can be
> > shutdown in the middle of transaction, then this Aspeed HW keeps waiting
> > for a next event from the peer master but it can't happen because the
> > peer master was already shutdown. If we enable the 'slave inactive
> > timeout feature' using the HW timeout setting, the this HW can escape
> > from the waiting state. If we don't, this HW hangs forever in the
> > waiting state and it's the reason why I implemented this patch set.
> >
> > The hw-timeout setting needs fine tuning depends on HW environment so
> > it should be different from the bus-timeout.
>
> Yeah, ok, so you're basically confirming everything I said. I do
> sense some confusion though, as you come across as a bit
> defensive and seem to think that I am against the whole notion of
> the patches. And that's not the case at all! My only issue is
> with the naming. And I happen to think hw-timeout-ms is a really
> bad name. It's way too broad and can mean just about anything.
> When I read that, I think of some workaround for broken hardware,
> not normal things like the other masters on the bus doing
> confusing things. Funky bus activity from remote masters is
> simply not an HW issue in my book, at least not an HW issue on
> the local side of the bus. It's just something you *must expect*.

Sorry for not jumping in earlier, but I agree with Peter.

I like the name bus-timeout-ms better. It was not immediately clear
from reading your commit descriptions what this was all about.

Cheers!
