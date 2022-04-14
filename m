Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AD500C45
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 13:39:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfHY45qWpz30BN
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 21:39:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=XVXbnfJ7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=XVXbnfJ7; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfHXf6z5xz2xnB
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 21:38:42 +1000 (AEST)
Received: from zn.tnic (p2e55d808.dip0.t-ipconnect.de [46.85.216.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6EAE91EC05ED;
 Thu, 14 Apr 2022 13:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1649936312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=0Hl05umU2syxAI+1OIMnnkGsv+ehYVJTrPIGPjL6hfE=;
 b=XVXbnfJ7zMO83ctVjsYBJutLwMcdmE66nOizpvn6CdwJWKxcCbYEYRMHy61F8Z/tQwqbiK
 5YnPdUN4xefU0lNQehzIs2bZ/v/MFQEJtYESwPsubHOugm18JRodamHRqSh0CV2l6rOK8q
 kT8o6AyOrETt43BN/3RN/GzHz0MDnFo=
Date: Thu, 14 Apr 2022 13:38:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v6 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <YlgHuFIsEl8yvUxV@zn.tnic>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-4-ctcchien@nuvoton.com>
 <a06441fc-85cf-9386-e362-4a90e855aa19@molgen.mpg.de>
 <CAHpyw9fQVbS1Cpv0ULQc2=vK8LsG6n7tgP+J9AboUupDAPT27Q@mail.gmail.com>
 <YlfeXVSkUC2B4xH2@zn.tnic>
 <14d07709-07ef-21a8-ad74-0f56447cf6dd@molgen.mpg.de>
 <Ylf0Sc7fqv25Ay05@zn.tnic>
 <c77b6667-25ff-70c4-2312-9262d88b1859@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c77b6667-25ff-70c4-2312-9262d88b1859@molgen.mpg.de>
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
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING <KFTING@nuvoton.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, Medad Young <medadyoung@gmail.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 12:44:13PM +0200, Paul Menzel wrote:
> I am all for more elaborate log messages, but have the feeling, you think I
> am not? Where does the misunderstanding come from?

I don't know. Judging by this reply of yours, the misunderstanding is
considerable.

So I'm going to ask you nicely: for the future and for the code I
maintain, please try hard not to confuse submitters.

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
