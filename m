Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1735BD2E
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 10:48:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJj8219fBz30Bw
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 18:48:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uey+W82d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uey+W82d; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJj7m5L0zz301J;
 Mon, 12 Apr 2021 18:48:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E629D6137F;
 Mon, 12 Apr 2021 08:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618217313;
 bh=eLznHwvEfmec088sW414tCcwJZyAy1dqSqy3r+pI7zc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uey+W82dISxV0CSUCEiP+7gx9QuEZBJfcRoFlSMpkmrDlRAJJ0xVAOCsY94BkROLO
 zR/I466PgDid3faek70DuVNVg7noHojv66W6cwsIyY2yvu9Lt2qRuc9nGzCIxgZBXn
 b+pFwRet18DXS13aa8a0O4MFYM9FTwIPGTmzP+TKLFSBeZqwLd+xPrXiLpfNkZam//
 nTLqalOsrHTkSgYJ0euxXxHf96MAHZTKfV0Uyr+Q3gmjq/OvXQUq6zhW/U9m2u5Nji
 FvCPzYE1fW7fbdBhJcyx8lAQrFqUby6/4TW+Qu7SCI6vP9Tw1jB9lcRoTkvaxiDZxi
 iOtWMOODr0mgA==
Received: by mail-wr1-f44.google.com with SMTP id p6so5294544wrn.9;
 Mon, 12 Apr 2021 01:48:32 -0700 (PDT)
X-Gm-Message-State: AOAM532fbRizn1MVry/zR5bumu15s2KukNOsOlO+xFQkbB/q4PM/qJZE
 dUWI2KUa3q2G2nSOT1PQz1+SqsKPKLvRz1HKxYw=
X-Google-Smtp-Source: ABdhPJwdOphNG/NExZknsy5yMxBCnGZA+q7EKNOchQAgxbs01jSI9QEePmT+lsicnZYJB8nH9FG1BOhyUFdSoL2u8ew=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr30918454wrg.165.1618217311367; 
 Mon, 12 Apr 2021 01:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-16-andrew@aj.id.au>
 <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
 <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com>
In-Reply-To: <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 12 Apr 2021 10:48:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3RXr5CR7DJgD9rEkN8owpPxXRgzRnPB_5LuQcHkzc4LA@mail.gmail.com>
Message-ID: <CAK8P3a3RXr5CR7DJgD9rEkN8owpPxXRgzRnPB_5LuQcHkzc4LA@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] ipmi: kcs_bmc: Add a "raw" character device
 interface
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 3:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 9 Apr 2021, at 17:25, Arnd Bergmann wrote:
> > On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> > > However, KCS devices are useful beyond IPMI (or keyboards), as they
> > > provide a means to generate IRQs and exchange arbitrary data between a
> > > BMC and its host system.
> >
> > I only noticed the series after Joel asked about the DT changes on the arm
> > side. One question though:
> >
> > How does this related to the drivers/input/serio/ framework that also talks
> > to the keyboard controller for things that are not keyboards?
>
> I've taken a brief look and I feel they're somewhat closely related.
>
> It's plausible that we could wrangle the code so the Aspeed and Nuvoton
> KCS drivers move under drivers/input/serio. If you squint, the i8042
> serio device driver has similarities with what the Aspeed and Nuvoton
> device drivers are providing to the KCS IPMI stack.

After looking some more into it, I finally understood that the two are
rather complementary. While the  drivers/char/ipmi/kcs_bmc.c
is the other (bmc) end of drivers/char/ipmi/ipmi_kcs_sm.c, it seems
that the proposed kcs_bmc_cdev_raw.c interface would be
what corresponds to the other side of
drivers/input/serio/i8042.c+userio.c. Then again, these are also on
separate ports (0x60 for the keyboard controller, 0xca2 for the BMC
KCS), so they would never actually talk to one another.

> Both the KCS IPMI and raw chardev I've implemented in this patch need
> both read and write access to the status register (STR). serio could
> potentially expose its value through serio_interrupt() using the
> SERIO_OOB_DATA flag, but I haven't put any thought into it beyond this
> sentence. We'd need some extra support for writing STR via the serio
> API. I'm not sure that fits into the abstraction (unless we make
> serio_write() take a flags argument?).
>
> In that vein, the serio_raw interface is close to the functionality
> that the raw chardev provides in this patch, though again serio_raw
> lacks userspace access to STR. Flags are ignored in the ->interrupt()
> callback so all values received via ->interrupt() are exposed as data.
> The result is there's no way to take care of SERIO_OOB_DATA in the
> read() path. Given that, I think we'd have to expose an ioctl() to
> access the STR value after taking care of SERIO_OOB_DATA in
> ->interrupt().
>
> I'm not sure where that lands us.

Based on what I looked up, I think you can just forget about my original
question. We have two separate interfaces that use an Intel 8042-style
protocol, but they don't really interact.

      Arnd
