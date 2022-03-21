Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D41E4E306D
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 20:03:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMkYS11f3z30NV
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 06:03:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=b2Lotxl6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMkXw5hSHz2yxx
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 06:03:28 +1100 (AEDT)
Received: from zn.tnic (p200300ea971561e8329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9715:61e8:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AF4851EC056A;
 Mon, 21 Mar 2022 20:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1647889389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=3tsEfYC5mE29FrztA7klv5Gy5kBdTlSRewG9h1lk6J0=;
 b=b2Lotxl6qpFk/BSkwu5EtFqSYbA64Og5nG81QQAjZmC/55o4n2tQflqjjyr26KVi5wOrOU
 1h7vZ/fuLu+fzxA6nOYnWXMUwFwQu/O3QwdFdu6woIBZJO3nhgvLO9efNrU95zSiLM2mck
 GIU/s4MUQGsZUr6TFX0ozIyPprqhOfI=
Date: Mon, 21 Mar 2022 20:03:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v5 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <YjjL6OJ3MLXvC6mj@zn.tnic>
References: <20220317015854.18864-1-ctcchien@nuvoton.com>
 <20220317015854.18864-4-ctcchien@nuvoton.com>
 <37361667-C932-4139-B649-52DE029BDEE5@alien8.de>
 <CAKKbWA66rdm11fM2eWpQpSW2aCfFn-9OwJNNN4J2Q4rE2H4vEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKKbWA66rdm11fM2eWpQpSW2aCfFn-9OwJNNN4J2Q4rE2H4vEw@mail.gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, KFTING@nuvoton.com,
 devicetree <devicetree@vger.kernel.org>, tony.luck@intel.com,
 James Morse <james.morse@arm.com>, Medad CChien <medadyoung@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 08:28:51PM +0200, Avi Fishman wrote:
> see in MAINTAINERS:
> ARM/NUVOTON NPCM ARCHITECTURE
> M:      Avi Fishman <avifishman70@gmail.com>
> M:      Tomer Maimon <tmaimon77@gmail.com>
> ...
> F:      drivers/*/*npcm*
> F:      drivers/*/*/*npcm*
> 
> Isn't it OK?

Ah, I didn't know you guys have such an entry already - we usually do
EDAC-specific ones but yeah, the current solution is ok too:

./scripts/get_maintainer.pl -f drivers/edac/npcm_edac.c
Avi Fishman <avifishman70@gmail.com> (supporter:ARM/NUVOTON NPCM ARCHITECTURE)
Tomer Maimon <tmaimon77@gmail.com> (supporter:ARM/NUVOTON NPCM ARCHITECTURE)
Tali Perry <tali.perry1@gmail.com> (supporter:ARM/NUVOTON NPCM ARCHITECTURE)
Patrick Venture <venture@google.com> (reviewer:ARM/NUVOTON NPCM ARCHITECTURE)
Nancy Yuen <yuenn@google.com> (reviewer:ARM/NUVOTON NPCM ARCHITECTURE)
...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
