Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B3500AD2
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 12:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfFjM13Ykz2yK2
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 20:16:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=BKlCWqNG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=BKlCWqNG; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfFhy4dmJz2xRm
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 20:15:45 +1000 (AEST)
Received: from zn.tnic (p2e55d808.dip0.t-ipconnect.de [46.85.216.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2EF031EC05ED;
 Thu, 14 Apr 2022 12:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1649931337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcvILpawoy/EPkGkLSEhvv0Kdz440+lEpC25Pt/VCcQ=;
 b=BKlCWqNGE/Ep1cvt/qOcZSftYkpVpT+iOaYR+yPMnEQ2cHucqhZKpKdJv8W07gJQDPVYvY
 Dr8UoJLd4dHuOT55Ag1YvyTF/N5fAIOfsrgpfRzbWwcDBRa3ipPH5RrN/IQk8hzgpR6BuV
 4zWAZ+lq9tJFmmI4yxAiLuAR+/7If2o=
Date: Thu, 14 Apr 2022 12:15:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v6 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <Ylf0Sc7fqv25Ay05@zn.tnic>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-4-ctcchien@nuvoton.com>
 <a06441fc-85cf-9386-e362-4a90e855aa19@molgen.mpg.de>
 <CAHpyw9fQVbS1Cpv0ULQc2=vK8LsG6n7tgP+J9AboUupDAPT27Q@mail.gmail.com>
 <YlfeXVSkUC2B4xH2@zn.tnic>
 <14d07709-07ef-21a8-ad74-0f56447cf6dd@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14d07709-07ef-21a8-ad74-0f56447cf6dd@molgen.mpg.de>
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
 James Morse <james.morse@arm.com>, Medad Young <medadyoung@gmail.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 10:56:43AM +0200, Paul Menzel wrote:
> No idea, why you had to ask this question, while you statement before
> already made the point.

You've told Medad one thing. I told him the complete opposite. Medad as
new submitter gets confused. And I don't want patch submitters to get
confused by review.

So, if you're unsure about a review feedback, don't give it pls.

> Sorry I do not get your point. Would you elaborate on the debug message so
> it’s more useful?

Just think of the big picture: is my error message useful enough for
debugging or would I have to go and add more info to it so that I can
debug an issue?

Example:

There is

	edac_dbg(3, "InterruptStatus : 0x%x\n", intr_status);

now.

Now, how about this?

        edac_dbg(3, "dev: %s, id: %s: IRQ: %d, interrupt status: 0x%x\n",
                 mci->dev_name, mci->ctl_name, irq, intr_status);

Which one, do you think, is more helpful to a person trying to debug any
potential issue with the interrupt handler and the ECCs it is supposed
to issue?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
