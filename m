Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B54DC6E2
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 13:57:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK6c03Xfqz30FR
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 23:57:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=QMbTN2lz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=QMbTN2lz; dkim-atps=neutral
X-Greylist: delayed 341 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 23:56:41 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK6bY38Wcz2y8P
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 23:56:41 +1100 (AEDT)
Received: from [127.0.0.1] (pd95ca587.dip0.t-ipconnect.de [217.92.165.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C17BE1EC063F;
 Thu, 17 Mar 2022 13:50:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1647521442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EY+OVlK3FNjPeuxT1E19uUsmlLA7v3Vf0nxQLY63VP8=;
 b=QMbTN2lzFuaJF5Ls5pbKgje3WyjB6xCyDSeGcHyA/A65kzY3q58KzvglWSOzq/ZQ6851av
 pQKmCvSgjj6ZEKSEns6SZpuEOouk2AzEOLxqtxxYFbt9V9X+Jc2ZNnW1uSqOArBuptgc1U
 pdM+HDeptKw1t7S5XFAjwrY6lp/QIEk=
Date: Thu, 17 Mar 2022 12:50:38 +0000
From: Boris Petkov <bp@alien8.de>
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org, james.morse@arm.com, 
 YSCHU@nuvoton.com, mchehab@kernel.org, tony.luck@intel.com,
 benjaminfair@google.com, venture@google.com, KWLIU@nuvoton.com,
 robh+dt@kernel.org, JJLIU0@nuvoton.com, KFTING@nuvoton.com,
 avifishman70@gmail.com, yuenn@google.com, tali.perry1@gmail.com,
 tmaimon77@gmail.com, ctcchien@nuvoton.com
Subject: Re: [PATCH v5 3/3] EDAC: nuvoton: Add NPCM memory controller driver
User-Agent: K-9 Mail for Android
In-Reply-To: <20220317015854.18864-4-ctcchien@nuvoton.com>
References: <20220317015854.18864-1-ctcchien@nuvoton.com>
 <20220317015854.18864-4-ctcchien@nuvoton.com>
Message-ID: <37361667-C932-4139-B649-52DE029BDEE5@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On March 17, 2022 1:58:54 AM UTC, Medad CChien <medadyoung@gmail=2Ecom> wro=
te:
>Add support for Nuvoton NPCM SoC=2E
>
>Signed-off-by: Medad CChien <ctcchien@nuvoton=2Ecom>
>Reported-by: kernel test robot <lkp@intel=2Ecom>

What exactly has the robot reported here?

>---
> drivers/edac/Kconfig     |   9 +
> drivers/edac/Makefile    |   1 +
> drivers/edac/npcm_edac=2Ec | 710 +++++++++++++++++++++++++++++++++++++++
> 3 files changed, 720 insertions(+)
> create mode 100644 drivers/edac/npcm_edac=2Ec

I don't see a MAINTAINERS file entry so that people can Cc you on bugs=2E =
See the other EDAC drivers for an example=2E=20

--=20
Sent from a small device: formatting sux and brevity is inevitable=2E 
