Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7B45CE13
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 21:34:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzt5p2rCzz2ynj
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 07:34:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KrFQZzGa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=KrFQZzGa; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzt5M2Prmz2xsC
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 07:33:57 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id c32so10463206lfv.4
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 12:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ehE0PDLUJn5IuubBE5Fz0zYic+qSrZ8w7IQgqusMG6Q=;
 b=KrFQZzGaq836mVGevcpQCCrfUT5C70dDdVWmR4mQQhfXk9ixssnqpFJgC/RMFL/5En
 Fc+J+kgzolPFmG9O0/6NR7bv0N6L8If4lQGR5TNrqyQwb+rFZL6SGqLvhV7+ipIEpPM+
 r+Cn2L03cy60MFT3bGgnmQstLyrxcG76rSVIIrgX2LLiPtlR5SyDg+gnnKdHpylgkTFJ
 uSkNU/woUteYFgZfByflPEBPXj64Gm/8IN6eMo8MVXg41wAcDy4BP9f/3atrw7nrLXFd
 ehZQh45A0L1G9yB+n/aBx0HujKTNFPK0PlkJR5qNOluRj49LjXYPH4ezoa1B55KyNa69
 tgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ehE0PDLUJn5IuubBE5Fz0zYic+qSrZ8w7IQgqusMG6Q=;
 b=k753zo1p3BdeG+zy675UTgBV6vy2QYqABMwlaY1i+N3z6aPtW0OB9DHpB0mlKn8ESb
 oPabg1yUyjbNmXxtggYf1DYZj+XRPc908FYwrA4FW+NwU+S1e5aqAJhxQYdfWvpsOX43
 X/88u60sJVSQoqUJhWCX/NMI/8yYYvAWxAOQAufe2IM0jlCdTigKn/1t9Iw0cRJ8wyIm
 CT9clMt8ZNOiy/H3ZcPJXrLijra6avVKGhYIf58y62dd+j4OWWyoYhe4MT/1HOXlduap
 /Ns4dtDom5HgdeqE9fVdT+HdPgsVWPy9KzA0iw5Q3yEkhp9iRQKCxbRrILuLksUXJPW+
 oz1g==
X-Gm-Message-State: AOAM531RX7go8HDl8jy2amlyp7xWVtYlrXv+E3NL3uLb1xLyhlAdYz5T
 2X3WS0nFdm1EfOtLY0Vsd4HFtf1pMwStHFG6sxrH+g==
X-Google-Smtp-Source: ABdhPJyS0nk5adDuSm1rUSVfySQJhrtvKSg6RQ6j4KEjDoKGHMAbWYnjGOru7a/AyOU3HybPH1DSeWBQri7iwoRc9xM=
X-Received: by 2002:a05:6512:1289:: with SMTP id
 u9mr18198383lfs.273.1637786033340; 
 Wed, 24 Nov 2021 12:33:53 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
 <429111627309901@mail.yandex-team.ru> <20210726145246.GL875@home.paul.comp>
 <435311627317580@mail.yandex-team.ru> <20210726165144.GN875@home.paul.comp>
 <477521627375667@mail.yandex-team.ru> <20210727093015.GQ875@home.paul.comp>
In-Reply-To: <20210727093015.GQ875@home.paul.comp>
From: Oskar Senft <osk@google.com>
Date: Wed, 24 Nov 2021 15:33:37 -0500
Message-ID: <CABoTLcS+fPz=De0-tzOrzhwPd-b+tJ7M5H74+Qc=AiYM4vG3Pg@mail.gmail.com>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
To: Paul Fertser <fercerpav@gmail.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I just stumbled across this old-ish thread. I did run into a similar
problem ages ago. The problem is that the SIRQ polarity used by the
Aspeed must match what the "receiving end" (usually the PCH) is
expecting. I agree that the Aspeed doc is missing some details here. I
believe they might have clarified this on AST2600. Anyway, this
setting can be changed in the DTS via aspeed,lpc-interrupts [1] or at
runtime via the sysfs node sirq_polarity [2]. On the board I'm working
on (TYAN S7106 and S8036), this had to be set to HIGH:

&vuart {
    status = "okay";

    /* We enable the VUART here, but leave it in a state that does
     * not interfere with the SuperIO. The goal is to have both the
     * VUART and the SuperIO available and decide at runtime whether
     * the VUART should actually be used. For that reason, configure
     * an "invalid" IO address and an IRQ that is not used by the
     * BMC.
     */

    aspeed,lpc-io-reg = <0xffff>;
    aspeed,lpc-interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
};

Note that this change hasn't been added to upstream
aspeed-bmc-tyan-s7106.dts yet, just because I'm slow ...

Note that I previously introduced aspeed,sirq-polarity-sense for the
DTS, which tried to do this automatically, but it turned out to cause
issues, so it has been deprecated

I hope this write-up helps anyone in the future.

Oskar.

[1]: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/serial/8250.yaml#L204
[2]: https://github.com/torvalds/linux/blob/master/Documentation/ABI/stable/sysfs-driver-aspeed-vuart#L17

On Tue, Jul 27, 2021 at 5:30 AM Paul Fertser <fercerpav@gmail.com> wrote:
>
> On Tue, Jul 27, 2021 at 11:53:57AM +0300, Konstantin Klubnichkin wrote:
> > SIRQ polarity is something I didn't try, will do it. And yes, SIRQ bit is zero,
> > but all other bits are also zero in that register, that confuses me.
>
> I was also able to manually export the SIRQ pin via sysfs and when
> manually toggling it the host was seeing UART interrupts and getting
> data to and from VUART. That lead nowhere though, so we resorted to
> hardware routing in ast2500 between "real UARTs".
>
> > Instead I configure UART routing by direct writing to registers via /dev/mem
> > (yes, I know that it's a bad practive, but it's development).
>
> Should work the same.
>
> > With the routing I have absolutely no data in BMC UARTs neither during POST nor
> > is OS.
> > What I'm missing is how that routing works. Is it on-crystal or UART need to be
> > routed to SoC pins thus TX/RX are connected via pins?
>
> With the configuration as shown the host is sending data to and from
> "COM1" (0x3f8,4) and any program on BMC is able to interact with it
> via /dev/ttyS2, without any additional hardware connections, all
> purely in software, the routing happens inside aspeed. Do not forget
> to enable ttyS2 in your board's DTS. VUART is not involved at all.
>
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
