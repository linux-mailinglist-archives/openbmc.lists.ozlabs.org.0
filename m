Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94323518225
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 12:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KswpT3CJXz3bcn
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 20:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=k+v0j3G2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=k+v0j3G2; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kswp10j14z2xnG
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 20:15:34 +1000 (AEST)
Received: from zn.tnic (p5de8eeb4.dip0.t-ipconnect.de [93.232.238.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 611181EC0455;
 Tue,  3 May 2022 12:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1651572920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=mKTwIKrh4EWWiVkBp1uQfM1HxqpE6n66nTbg1oa/fMs=;
 b=k+v0j3G24u+dsm0v1Dy3Hau5Ciwci0/rP3shg7OaHU3Hu1dutN5zcDK259Bdq4Ucfc3n7B
 oJqGhAfr4UoD4KNHII84Nzi78k2eMxRXZtFmsJ3WAkFVLVIv/U1Y9vZjpws5SdeYvDyVbp
 Che5jtFGBwnxYTOuEmR+/q3EBr5YSYY=
Date: Tue, 3 May 2022 12:15:17 +0200
From: Borislav Petkov <bp@alien8.de>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: dts: nuvoton: Add memory controller node
Message-ID: <YnEAtQQ6Wnacfrub@zn.tnic>
References: <20220503094728.926-1-ctcchien@nuvoton.com>
 <20220503094728.926-2-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220503094728.926-2-ctcchien@nuvoton.com>
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
 benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, james.morse@arm.com,
 YSCHU@nuvoton.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 03, 2022 at 05:47:26PM +0800, Medad CChien wrote:
> ECC must be configured in the BootBlock header.
> Then, you can read error counts via
> the EDAC kernel framework.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> Reviewed-by: Borislav Petkov <bp@alien8.de>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

I don't think you understand the concept of Reviewed-by: tags. You
may add them to a patch of yours when the reviewer gives them to you
explicitly - not because she/he has given comments to a patch of yours.

Please go over

Documentation/process/

and Documentation/process/submitting-patches.rst especially and then
send patches.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
