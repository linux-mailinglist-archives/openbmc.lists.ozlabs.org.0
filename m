Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57841442997
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 09:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk38z1lBTz2yHC
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 19:34:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a2lkPtso;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a2lkPtso; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk38Z1Lj0z2xD8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Nov 2021 19:33:48 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id d21so1851053lfg.7
 for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IIbhqQ166KuY0HqjYi0SoZGpqG4hrHANtgC7gv/B4qE=;
 b=a2lkPtso9VSJtQKipU7sC99tkqQ0OotHLpbbtKDRwXJ8/FlMphMARe+W9ZykQ/EqH3
 pvHw8SUBCv4OHNMaZVPzKzPC1o59GSm1kNgEgRnoZV+H4KScYM5uYgItIxW12WAHI3mF
 76EUwcmQ50N7NyszRdSFLb/4FdJBYl1DLc5O9iibxGx4627nOnM82de4WQxiWoEZjCz7
 Q6QOgt9k9XgpfbhM6zjqUws8v2TnrQ/I0gEL96L8OMKt0+l8pMu/SEAvy0+Bp9pLB6bq
 U+pn1YjezcL0s09Ly4pL2H+UCIO5Edh1xlgoIN/+p+gopy66ZJkjKhLBIQgya9apGjAs
 w5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIbhqQ166KuY0HqjYi0SoZGpqG4hrHANtgC7gv/B4qE=;
 b=2Uv5tBz8oEswc1RgmYIwtWD70pjSfTGckKCHrYNor3jVlqhTJNTUhcislgs0Un29ms
 tHrEO2XEFLg9vF28usvAsEEdn1aMcoT67AAuD/NZjDZK6TlkwBp4Z2lEK5OWlqpfDuiB
 a1SDjrGswjAjeRFiSl3wjbEzg4PJR/N7SwP65VNl1OtM0+lxkoAIRO0+e3swbiZxrJJp
 nNtMArt59PzruDg2AB98seXzZbjUWUuAFE3mPEo6tVQ6n0Q8LyCev9Ct4LXpkUyPZdlf
 kkm6Kdi7hKaYn6i8JV1pfF4+evDsVx0YL4nJ7ozjhb7JCM090icT8nkE08tbcQUoRVDL
 wvoQ==
X-Gm-Message-State: AOAM531pXBmdA6sK9vFvpvsYKV8q1oikkj0B0fQLCZPiVROs/16WxqAK
 oCdsDSilmnAYrA0JUz25nPa+qpGXSGwh/k6Siw==
X-Google-Smtp-Source: ABdhPJzY1QYptzKxQ2dc9ZaB2dqJyb92U1gZE8xwtirNR1GtQGV0LjhT3+DOv5Tfb+KU1f7uH+LfjPc1eXAx/krB22A=
X-Received: by 2002:a05:6512:3c9e:: with SMTP id
 h30mr2145698lfv.93.1635842023510; 
 Tue, 02 Nov 2021 01:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-12-lukas.bulwahn@gmail.com>
 <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
 <CACPK8XfiN5qziPHLU6J=bC34mcjz+ix7jjSX=xk9zsr7+vyTdw@mail.gmail.com>
 <CAKXUXMyrhrM2o-OEW_qTTKjfKgxt-Z6Nt69geU80AoFnM1OuMA@mail.gmail.com>
 <CAKKbWA7OiU_pp33=EQoCTOeyd3Ecmm-dtTFeu1VB_Xcpt0gMvg@mail.gmail.com>
In-Reply-To: <CAKKbWA7OiU_pp33=EQoCTOeyd3Ecmm-dtTFeu1VB_Xcpt0gMvg@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 2 Nov 2021 10:33:32 +0200
Message-ID: <CAKKbWA7rsdd3DpG1C-HuAms_sr3JjjNmchmBeA7Yh=rMr7tQTA@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm: npcm: drop selecting non-existing
 ARM_ERRATA_794072
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Patrick Venture <venture@google.com>, Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 2, 2021 at 10:22 AM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Hi,
>
> At Nuvoton we implied this WA in the past, not because we encountered
> a specific problem but since the errata says so and we saw this in
> other patches like:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/1396298072-13254-2-git-send-email-nitin.garg@freescale.com/
> But we didn't upstream the arch/arm/mm/proc-v7.S
>
> From the errata document.
> "794072 A short loop including a DMB instruction might cause a denial
> of service on
> another processor which executes a CP15 broadcast operation
> Status
> Affects:
> Fault Type:
> Fault Status: Cortex-A9 MPCore.
> Programmer Category B
> Present in: All r1, r2, r3 and r4 revisions Open
> Description
> A processor which continuously executes a short loop containing a DMB
> instruction might prevent a CP15
> operation broadcast by another processor making further progress,
> causing a denial of service.
> Configurations affected
> This erratum affects all Cortex-A9 MPCore processors with two or more
> processors.
> Conditions
> The erratum requires the following conditions:
> - Two or more processors are working in SMP mode (ACTLR.SMP=1)
> - One of the processors continuously executes a short loop containing
> at least one DMB instruction.
> - Another processor executes a CP15 maintenance operation that is
> broadcast. This requires that this
> processor has enabled the broadcasting of CP15 operations (ACTLR.FW=1)
> For the erratum to occur, the short loop containing the DMB
> instruction must meet all of the following additional
> conditions:
> - No more than 10 instructions other than the DMB are executed between each DMB
> - No non-conditional Load or Store, or conditional Load or Store which
> pass the condition code check, are
> executed between each DMB
> When all the conditions for the erratum are met, the short loop
> creates a continuous stream of DMB instructions.
> This might cause a denial of service, by preventing the processor
> executing the short loop from executing the
> received broadcast CP15 operation. As a result, the processor that
> originally executed the broadcast CP15
> operation is stalled until the execution of the loop is interrupted.
> Note that because the process issuing the CP15 broadcast operation
> cannot complete operation, it cannot enter
> any debug-mode, and cannot take any interrupt. If the processor
> executing the short loop also cannot be
> interrupted, for example if it has disabled its interrupts, or if no
> interrupts are routed to this processor, this
> erratum might cause a system livelock.
> Implications
> The erratum might create performance issues, or in the worst case it
> might cause a system livelock if the
> processor executing the DMB is in an infinite loop that cannot be interrupted.
> Workaround
> This erratum can be worked round by setting bit[4] of the undocumented
> Diagnostic Control Register to 1. This
> register is encoded as CP15 c15 0 c0 1.
> This bit can be written in Secure state only, with the following
> Read/Modify/Write code sequence:
> MRC p15,0,rt,c15,c0,1
> ORR rt,rt,#0x10
> MCR p15,0,rt,c15,c0,1
> When it is set, this bit causes the DMB instruction to be decoded and
> executed like a DSB.
> Using this software workaround is not expected to have any impact on
> the overall performance of the processor
> on a typical code base.
> Other workarounds are also available for this erratum, to either
> prevent or interrupt the continuous stream of
> DMB instructions that causes the deadlock. For example:
> - Inserting a non-conditional Load or Store instruction in the loop
> between each DMB
> - Inserting additional instructions in the loop, such as NOPs, to
> avoid the processor seeing back to back
> DMB instructions.
> - Making the processor executing the short loop take regular interrupts."
>
> Avi
>
> On Tue, Nov 2, 2021 at 9:31 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Fri, Oct 29, 2021 at 8:36 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Thu, 28 Oct 2021 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > > > >
> > > > > There is no and never was a Kconfig for ARM_ERRATA_794072 in the kernel
> > > > > tree. So, there is no need to select ARM_ERRATA_794072 in
> > > > > ./arch/arm/mach-npcm/Kconfig.
> > > > >
> > > > > Simply drop selecting the non-existing ARM_ERRATA_794072.
> > > > >
> > > > > This issue was discovered with ./scripts/checkkconfigsymbols.py.
> > > > >
> > > > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > > > ---
> > > >
> > > > Could this be a typo? Maybe we need to enable a different errata workaround
> > > > here, or maybe that code is actually needed and has to get sent.
> > >
> > > Doing some searching, u-boot had a workaround for something called
> > > ARM_ERRATA_794072.
> > >
> > > https://github.com/u-boot/u-boot/commit/f71cbfe3ca5d2ad20159871700e8e248c8818ba8
> > >
> > > Lore has the review history for that patch:
> > >
> > > https://lore.kernel.org/all/6be32e0b5b454ed7b609317266a8e798@BLUPR03MB358.namprd03.prod.outlook.com/
> > >
> > > It looks like it's the same workaround as ARM_ERRATA_742230, which the
> > > kernel does implement.
> > >
> > > It would be good to hear from the Nuvoton people, or an Arm person.
> > >
> >
> > I will happily update the patch to select ARM_ERRATA_742230 instead of
> > the dead non-existing ARM_ERRATA_794072.
> >
> > In contrast to the current patch that basically only cleans up "dead
> > config" and has no effective functional change, the new patch would
> > change the behaviour. I cannot test this patch (beyond some basic
> > compile test) on the hardware; so, we certainly need someone to have
> > that hardware, knows how to test it or confirm otherwise that we
> > should select the ARM_ERRATA_742230 fix for this hardware.

Note that ARM_ERRATA_742230 is applied in code up-to CORTEX-A9 r2p2
but while ARM_ERRATA_794072 exist also in CORTEX-A9 r4p1
https://github.com/torvalds/linux/blob/322a3b843d7f475b857646ed8f95b40431d3ecd0/arch/arm/mm/proc-v7.S#L347
> >
> > The current patch should be subsumed by the new patch; the submission
> > of the new patch is deferred until that person shows up. Let's see.
> >
> > Lukas
>
>
>
> --
> Regards,
> Avi



-- 
Regards,
Avi
