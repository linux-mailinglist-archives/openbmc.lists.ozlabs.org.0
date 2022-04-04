Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B14244F197A
	for <lists+openbmc@lfdr.de>; Mon,  4 Apr 2022 19:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXHF24DyHz2ymS
	for <lists+openbmc@lfdr.de>; Tue,  5 Apr 2022 03:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I8pC/miI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=I8pC/miI; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXHDd52Ycz2xfP
 for <openbmc@lists.ozlabs.org>; Tue,  5 Apr 2022 03:04:00 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id p15so18487240lfk.8
 for <openbmc@lists.ozlabs.org>; Mon, 04 Apr 2022 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JweidwxrjFhAI/2v7P1YrxPew3638Ty2dzeJpVrQWYE=;
 b=I8pC/miIU61OHd5dqRJenQe4iwqEMNWcbRRJquHcwqrA41pIdbn+rDkftP4Wgy8De6
 l2P/kMX+m1AlHndTCFw3I9e8C2PbWnptwDkLhCKGENUjppP00s+oaSpn30odJADOWz80
 gZ8aVgizdoRJMD3T6AeNpo8DIwPDr87SzDVdFiM8OdSG4AmvAn65FA0Q/pYGDN1oIlao
 +YKcox4/vRA3RiBKPCUROakAioTHX5ZKNwEvMn7A4BVVjmQPgHDz09Xezqhs7kUtDDfY
 rUW3RKJYgdzLAkmjcApGuwZWiQMC6aAEsIC1HT66RK9v0vxmMklonMMLr9nzl3HGoQcI
 8TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JweidwxrjFhAI/2v7P1YrxPew3638Ty2dzeJpVrQWYE=;
 b=2OSlRyIKQh3JESPOK6vNXX4kjvsl15kAgm57i9kWUsn6pJLKKnhO5doDNNx/vZEgBT
 a3P2YK5Q5dkl/wE+3vv3+KFPvCfdaDoh6DlBxaG0OW6pIrWhX9VrtKqDrSqTFuxuWOK/
 61kP0d2AbDf4lZ3Mo9giodR0E+giKpOmHdYQMdDJI+SqakyIHsy+sJHWR+3RVK64kZ4k
 7ZMw8v6rKZfUsfiJMkHGpE7LU7Wh/veH9m53SC5a2EeFFhqri15j2DUri7rPkF1tadjv
 qLpM857lZPwBw+aZTVjDZ5bhaW3ZGAZbl3FLfQ7HCjDbC9ZPj7Tg/6/P1hHt5w8cEB5S
 JVNw==
X-Gm-Message-State: AOAM531dsYCxcDnuMnRf9iRtnnx6eLVx1Fu3zoCabyJ18MnBNjRVwJ9F
 VXU0po/fHBIjuBjiHUYglMSsfL2QJjiSTe4plA==
X-Google-Smtp-Source: ABdhPJyWHkLML0CW+orqZVMU399DWfiqN//krw23FbqOQO+YZ/LLJNNX0j1rbJvWijFJbBpeNZJnAR2Kqa0Pofh74F8=
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr252549lfh.687.1649091835467; Mon, 04 Apr
 2022 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
 <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
 <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
In-Reply-To: <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 4 Apr 2022 20:03:44 +0300
Message-ID: <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
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

On Thu, Mar 3, 2022 at 4:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > > From: Tali Perry <tali.perry1@gmail.com>
> > > > >
> > > > > In order to better handle spurious interrupts:
> > > > > 1. Disable incoming interrupts in master only mode.
> > > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > > 3. Return correct status during interrupt.
> > > >
> > > > This is bad commit message, it doesn't explain "why" you are doing these.
>
> ...
>
> > BMC users connect a huge tree of i2c devices and muxes.
> > This tree suffers from spikes, noise and double clocks.
> > All these may cause spurious interrupts to the BMC.
> >
> > If the driver gets an IRQ which was not expected and was not handled
> > by the IRQ handler,
> > there is nothing left to do but to clear the interrupt and move on.
>
> Yes, the problem is what "move on" means in your case.
> If you get a spurious interrupts there are possibilities what's wrong:
> 1) HW bug(s)
> 2) FW bug(s)
> 3) Missed IRQ mask in the driver
> 4) Improper IRQ mask in the driver
>
> The below approach seems incorrect to me.
>

Andy, What about this explanation:
On rare cases the i2c gets a spurious interrupt which means that we
enter an interrupt but in
the interrupt handler we don't find any status bit that points to the
reason we got this interrupt.
This may be a rare case of HW issue that is still under investigation.
In order to overcome this we are doing the following:
1. Disable incoming interrupts in master mode only when slave mode is
not enabled.
2. Clear end of busy (EOB) after every interrupt.
3. Clear other status bits (just in case since we found them cleared)
4. Return correct status during the interrupt that will finish the transaction.
On next xmit transaction if the bus is still busy the master will
issue a recovery process before issuing the new transaction.
> > If the transaction failed, driver has a recovery function.
> > After that, user may retry to send the message.
> >
> > Indeed the commit message doesn't explain all this.
> > We will fix and add to the next patchset.
> >
> > > > > +     /*
> > > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > > +      * status bits are cleared.
> > > >
> > > > This does not explain why you hide the spurious interrupt.
> > > >
> > > > > +      */
> > > > > +     if (ret == IRQ_NONE) {
> > > > > +             npcm_i2c_eob_int(bus, false);
> > > > > +             npcm_i2c_clear_master_status(bus);
> > > > > +     }
> > > > > +
> > > > > +     return IRQ_HANDLED;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Regards,
Avi
