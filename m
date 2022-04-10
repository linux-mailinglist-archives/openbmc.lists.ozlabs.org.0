Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B84FAC93
	for <lists+openbmc@lfdr.de>; Sun, 10 Apr 2022 09:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbkJ600qRz3bYZ
	for <lists+openbmc@lfdr.de>; Sun, 10 Apr 2022 17:33:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bz0LpOef;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bz0LpOef; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbkHk0hlbz2xCB
 for <openbmc@lists.ozlabs.org>; Sun, 10 Apr 2022 17:33:35 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id d40so14045684lfv.11
 for <openbmc@lists.ozlabs.org>; Sun, 10 Apr 2022 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ox3tf6Vdl+MQsr77fGjpkrwS1r+0QmB/6mtEgP5kOo8=;
 b=Bz0LpOefLI1lEojOFoqUlsAMdkco/5HPV+AeTU8rHp3rFzg2cMD4iJ00Rm8TxmsIxZ
 sQ1/5o80CAfxhQMQ92Uv0ZIWBiDcfEftMM9yT+G9p3ptL5HUn7yIbqeqVVjgGwneCRJ0
 5nn0YNGTFNK9A4MaqZXdlfeteZadEXkSG7YgMXeAVw5bdHl0+NfShg2FVksEaH0QLaYb
 9VAbdRSL7/217gvvfj/DFOdJ8jMwie1OVmRuDZqJJDWz5D7zB0Dzfjr74dQ3e44hi3QB
 BRxQHStxTpWRqYaHaupRGJewHhsSVcra/7/KN/DzesBRXa5L4KyhCxzOcISyXRon0ihN
 DUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ox3tf6Vdl+MQsr77fGjpkrwS1r+0QmB/6mtEgP5kOo8=;
 b=VZI0TCYF6zYv+FfA1C7phW/EukvlUCBdAw1nShdGmVYLPJvIsm53mtMcs5ha+e22dP
 y2TEnipq+lnZLlQqkOSass69jN48XxdF6owq3I9GeZ1zBXnpBaGC2zHYiYOp4Y90+7MG
 8jQxmrPK9JLrZdNzsyX4YuzqeJ9U4LDdDfaU94LSIjmkQyax1OQB8amfNgvRxNcEVg9P
 YkX1bx9sKhlcuFAur0xzrK5GMOIeAiGbAlwD3xLg/RDU5I6g8xS/clLP9iWWcTl+teui
 aBdszuH3hoyaKhM+0FBiofZHyMPHTNJarS+mvh8R+WxdL1juWh02I/n3TuklDAu0KFKR
 vHLw==
X-Gm-Message-State: AOAM531DP9QMo5ZJmpot5j/pUskyVjxyPGkmM5fMel+qkawvzMxLsVud
 WDb9pWgcxJT+l4dqOb7wG6xM2tlXv7aqjBi7Mg==
X-Google-Smtp-Source: ABdhPJxMe5Lm1RdB41pICYNqF8fraGS6Hg0euDwsM1rxKXmiuFYkQ8RgSAxFld06VADpygjbCv6naNQgqZecQN5dzrs=
X-Received: by 2002:a05:6512:3b2c:b0:44a:35fd:994c with SMTP id
 f44-20020a0565123b2c00b0044a35fd994cmr17605988lfv.473.1649576009787; Sun, 10
 Apr 2022 00:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
 <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
 <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
 <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
 <YkvsB27Oj0kSmJRG@smile.fi.intel.com>
In-Reply-To: <YkvsB27Oj0kSmJRG@smile.fi.intel.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 10 Apr 2022 10:33:18 +0300
Message-ID: <CAKKbWA5aQeQTtM06NdNvg0=D5ThcghW5rVaM__0c1kopftqX+w@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com, bence98@sch.bme.hu,
 Arnd Bergmann <arnd@arndb.de>, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, yangyicong@hisilicon.com,
 semen.protsenko@linaro.org, jie.deng@intel.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 5, 2022 at 10:13 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 04, 2022 at 08:03:44PM +0300, Avi Fishman wrote:
> > On Thu, Mar 3, 2022 at 4:14 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > > > > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > > > > From: Tali Perry <tali.perry1@gmail.com>
> > > > > > >
> > > > > > > In order to better handle spurious interrupts:
> > > > > > > 1. Disable incoming interrupts in master only mode.
> > > > > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > > > > 3. Return correct status during interrupt.
> > > > > >
> > > > > > This is bad commit message, it doesn't explain "why" you are doing these.
> > >
> > > ...
> > >
> > > > BMC users connect a huge tree of i2c devices and muxes.
> > > > This tree suffers from spikes, noise and double clocks.
> > > > All these may cause spurious interrupts to the BMC.
>
> (1)
>
> > > > If the driver gets an IRQ which was not expected and was not handled
> > > > by the IRQ handler,
> > > > there is nothing left to do but to clear the interrupt and move on.
> > >
> > > Yes, the problem is what "move on" means in your case.
> > > If you get a spurious interrupts there are possibilities what's wrong:
> > > 1) HW bug(s)
> > > 2) FW bug(s)
> > > 3) Missed IRQ mask in the driver
> > > 4) Improper IRQ mask in the driver
> > >
> > > The below approach seems incorrect to me.
> >
> > Andy, What about this explanation:
> > On rare cases the i2c gets a spurious interrupt which means that we
> > enter an interrupt but in
> > the interrupt handler we don't find any status bit that points to the
> > reason we got this interrupt.
> > This may be a rare case of HW issue that is still under investigation

About 1 to 100,000 transactions

> > In order to overcome this we are doing the following:
> > 1. Disable incoming interrupts in master mode only when slave mode is
> > not enabled.
> > 2. Clear end of busy (EOB) after every interrupt.
> > 3. Clear other status bits (just in case since we found them cleared)
> > 4. Return correct status during the interrupt that will finish the transaction.
> > On next xmit transaction if the bus is still busy the master will
> > issue a recovery process before issuing the new transaction.
>
> This sounds better, thanks.
>
> One thing to clarify, the (1) states that the HW "issue" is known and becomes a
> PCB level one, i.e. noisy environment that has not been properly shielded.
> So, if it is known, please put the reason in the commit message.
>

The HW issue is not known yet, we see it on few platforms and in other
platforms we don't, so the first assumption was this.
So eventually we don't want to claim this without proving it.

> Also would be good to see numbers of "rare". Is it 0.1%?

I added above the known statistics.

>
> > > > If the transaction failed, driver has a recovery function.
> > > > After that, user may retry to send the message.
> > > >
> > > > Indeed the commit message doesn't explain all this.
> > > > We will fix and add to the next patchset.
> > > >
> > > > > > > +     /*
> > > > > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > > > > +      * status bits are cleared.
> > > > > >
> > > > > > This does not explain why you hide the spurious interrupt.
> > > > > >
> > > > > > > +      */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Regards,
Avi
