Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED038DF3D
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 04:35:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpLsl0Zrpz2yqC
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 12:35:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gyn3CX5l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gyn3CX5l; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpLsQ4PWrz2yXF;
 Mon, 24 May 2021 12:35:03 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id h20so10222251qko.11;
 Sun, 23 May 2021 19:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJuutPWSYZAO28hQHvByxbn0puUm3ID8Bjg9Q7zuB7I=;
 b=gyn3CX5lKh7USWncJLEqq50UPHkDuQtOOqqvL9MqVnZjhmT5Y7orqLXwlWHS8bWlbm
 u49FBbUwu3mSCq+sY/aDG8zv7KOpP/YNiBdr8myFB86xFTR2RRblZiWODTK8z0x2CASk
 9gvfahTH8t+zsivcrREBshWk/QZhFbE7BZCEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJuutPWSYZAO28hQHvByxbn0puUm3ID8Bjg9Q7zuB7I=;
 b=oC2xMmwLHOvg5HkqMX46/lUW1Jo+1CiDyjWzfTEJ+TZTpZXLLLG7q9Mzp+TuT3xdUA
 L9ehK9LqRPNnoZxpPu9SpAXcHp7CVOY64pc/7337RhKOvel90rHBLvOO+CufasO3BggC
 AiN8nLswiH50l7687Q1S8Cvclk2N5O5SxpBPBN8RVnGh5V16MXPwLmgVAhSYCtiH08sK
 31tOKo7HHhXdERrgbbWpE2GzUFm55Ai/7DHd9ErJ5TOkopurhuKKrCYs5ogD78iKEFdY
 wPmJBUwZtGjvKErg5By7T4LoLcnIWJtEiQpSFriZX+gQAS4k7JKHk6b9gUKjPbR/nXoA
 FE7w==
X-Gm-Message-State: AOAM532xqZFqCBgYiqVwY8U5iZEu7vMB3qCDH4082O56tzL4/c7Q7z+B
 IlkyQVy44WfG8iQYqxtBTtRLS6m/JxSOjmhoMAc=
X-Google-Smtp-Source: ABdhPJxlXMLLdn72u71hp/PqNVkvxZeVT04/cLpqvway+mxqT+thSozVVCebxD5BCKvPl0m1TBVjHyy5U+KsEdKwvf4=
X-Received: by 2002:ae9:e105:: with SMTP id g5mr28234682qkm.55.1621823699912; 
 Sun, 23 May 2021 19:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
 <20210520033140.GA3656@aspeedtech.com>
 <20210521020033.GB19153@taoren-ubuntu-R90MNF91>
 <20210524015310.GA2591@aspeedtech.com>
In-Reply-To: <20210524015310.GA2591@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 May 2021 02:34:47 +0000
Message-ID: <CACPK8Xd5HTNAR8MpQPWGp+-t9ixz2r3JYDjr6jUS+9ExyB94zg@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
To: Jamin Lin <jamin_lin@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rayn Chen <rayn_chen@aspeedtech.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Tao Ren <rentao.bupt@gmail.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 May 2021 at 01:53, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> The 05/21/2021 02:00, Tao Ren wrote:
> > Hi Jamin,
> >
> > On Thu, May 20, 2021 at 11:31:41AM +0800, Jamin Lin wrote:
> > > The 05/19/2021 22:59, Joel Stanley wrote:
> > > > On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> > > > >
> > > > > The register definition between AST2600 A2 and A3 is different.
> > > > > This patch avoid new registers definition of AST2600 to use
> > > > > this driver. We will submit the path for the new registers
> > > > > definition of AST2600.
> > > >
> > > > The AST2600 v9 datasheet says that bit 2 selects between old and new
> > > > register sets, and that the old register set is the default.
> > > >
> > > > Has the default changed for the A3?, and the datasheet is incorrect?
> > > >
> > > > Does the A3 still support the old register set?
> > > >
> > > We suggest user to use the new i2c driver for AST2600 and we will sumbit
> > > it. This driver is used to AST2500 and AST2400 SOCs. Change this
> > > driver to check global register of i2c to avoid user build the wrong driver.
> >
> > If I understand correctly, the answer implies old register set is still
> > supported in A3 although aspeed suggest people using the new driver/mode?
> >
> > Can you please share more context behind the suggestion? Such as new
> > register mode has better performance? Or some known issues that were
> > deteted in old mode are fixed in new register mode?
> >
> Yes, AST2600 A1, A2 and A3 support both old and new register set. The difference
> between old and new register set are the register address and supported registers.
> User can choose to use both old and new register set. However, ASPEED would like to
> change new register set by default for AST2600.

We can certainly make the driver for the new register set the default
for AST2600 when the new driver is merged.

I disagree that we should introduce a run time check to fail to probe
the old driver. Please do not merge this patch.

Please focus your effort on getting the new driver merged instead.

Cheers,

Joel
