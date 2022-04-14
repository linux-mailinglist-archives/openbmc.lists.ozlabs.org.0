Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D98500898
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 10:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfCf56Xngz2ynr
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 18:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=iWEpQoD6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=iWEpQoD6; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfCdh2WTnz2xBF
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 18:42:43 +1000 (AEST)
Received: from zn.tnic (p2e55d808.dip0.t-ipconnect.de [46.85.216.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A24041EC059E;
 Thu, 14 Apr 2022 10:42:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1649925752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=iMtDxFcYv+APnoa3Wtnursj/Bjt7HnoJKgSy8sOg09k=;
 b=iWEpQoD6e+RGn4KnAod0Tzo8cY5o3l2637By3+nm3vVOVZ5BY9D5nnZrUh6hPapCXhvcXr
 eUTHY8CzY7ADMIUU+nsOTU8lOLLFc6byoo/xHbcvJ4S0fK++JJnJ9tRkK0E0P05qfvHxCW
 oOHbjiGznE0bwTVRnnjat96iG1WyQpY=
Date: Thu, 14 Apr 2022 10:42:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Medad Young <medadyoung@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v6 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <YlfeXVSkUC2B4xH2@zn.tnic>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-4-ctcchien@nuvoton.com>
 <a06441fc-85cf-9386-e362-4a90e855aa19@molgen.mpg.de>
 <CAHpyw9fQVbS1Cpv0ULQc2=vK8LsG6n7tgP+J9AboUupDAPT27Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHpyw9fQVbS1Cpv0ULQc2=vK8LsG6n7tgP+J9AboUupDAPT27Q@mail.gmail.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 09:55:05AM +0800, Medad Young wrote:
> > > +                             if (mtype == MEM_TYPE_DDR4)
> > > +                                     dimm->mtype = MEM_DDR4;
> > > +                             else
> > > +                                     dimm->mtype = MEM_EMPTY;
> >
> > Use ternary operator?
> >
> >      dimm-mtype = (mtype == MEM_TYPE_DDR4) ? MEM_DDR4 : MEM_EMPTY;

Ternary operator is less readable than a plain and simple if-else.

> > > +{
> > > +     struct priv_data *priv = mci->pvt_info;
> > > +     const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> > > +     u64 err_c_addr = 0x0;
> >
> > size_t
> 
> OK

Why is size_t? error address doesn't have anything to do with a
sizeof(), array indexing or loop counting.

It is an error address and having it in an u64 tells you exactly what
its quantity is.

So can we stop the silliness pls?

> > > +static irqreturn_t edac_ecc_isr(int irq, void *dev_id)
> > > +{
> > > +     struct mem_ctl_info *mci = dev_id;
> > > +     struct priv_data *priv = mci->pvt_info;
> > > +     const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> > > +     u32 intr_status;
> > > +     u32 val;
> > > +
> > > +     /* Check the intr status and confirm ECC error intr */
> > > +     intr_status = readl(priv->reg + npcm_chip->ecc_ctl_int_status);
> > > +
> > > +     edac_dbg(3, "InterruptStatus : 0x%x\n", intr_status);
> >
> > Remove the space before the colon? Maybe use:
> >
> > "Interrupt status (intr_status): 0x%x\n"

And repeat "interrupt status"? Also silly. The question to ask
yourselves should always be: is this error message helpful enough to its
intended recipients.

When I see

  "Interrupt status (intr_status): 0x%x\n"

in my code, I go: "hm, where does this message come from?" because it
ain't helpful enough. So I have to go stare at the code too.

I hope you're catching my drift.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
