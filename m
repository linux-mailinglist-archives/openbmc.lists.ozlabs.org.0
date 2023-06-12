Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8D72C48C
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 14:40:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=jbXLavAN;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=A9Zg4yb1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfrrD5Fcbz30G5
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 22:40:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=jbXLavAN;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=A9Zg4yb1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfrqd2jfkz304g
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2023 22:39:57 +1000 (AEST)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 09D151EC0398;
	Mon, 12 Jun 2023 14:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1686573594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=OtR4NuAqh+pHPTCUSpv56F9hvDIrIt4bvebQxXNCupE=;
	b=jbXLavANDNUPKIW0uadvj4TxpIgfAKekRwfaVh727yyB/VsGQRDU8up79cts1NDS3icvCJ
	zM4iUSKDiFW+npXhrB7/EmkRv3m7VGNnTYMJ5RcsNAotwnBRkVb4j7LriJD/m1vvH9meSN
	VGr+z3pzKMKnZJQ4DQ5K0f3YsXWdWac=
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with SMTP id LM8F35X4M-PE; Mon, 12 Jun 2023 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1686573591; bh=OtR4NuAqh+pHPTCUSpv56F9hvDIrIt4bvebQxXNCupE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9Zg4yb1aBDEj55k7A9V6N0+HBFCyzB6VYpMtHTfhHk8yYQB7EzlO6VaIzApZ967A
	 x4P0Cn+Q0KJo+L/VMuT99YiZFpGcs0IthGftjWwioKqWgH/IX5cJf06bME1p7pTCZb
	 /20VvUGcXv6bAcJWk9MobiUF0kt+FJL/50IsFrtU7rpRRkQw4C50hGyb6mfRMIxcpd
	 22s0XnK4WneEdTxUyRBwh42iG1Q8IqTEZ+sMG98fVFyxt1ag87eqPLISmiH7dCEcwZ
	 Kn9kyIfSjlBkfm1HdJKujp1ZbRarrdTvNjetu4trW1Z6pJO7ov1IJvkWOiJaI841hL
	 YFCpFOo/wXWSGKjnsNzyMMM7yMe3dtHFJlfpOOoWIbPY0T5qjsRxJc7Ccl9YETZ/sC
	 U56nwzcBl10K06igNUwOduYW/TUsBKqR3Wbr2Yj2skwQMzd08h3tTGmCdDWKNd/sTK
	 VJ1IUcaM56gIvGuCdZAwgEFWCbBA4IV7iLRS+BV7bncYzXg+kLWValltRHrFcnWotR
	 oh1Lr1wTeQCe1Eha3GtVKMGDDUjAK3EztnbWn0aBLR939H4S3zwy3DqB5wlP0TZFWV
	 mCHbCoJWaxAaj0YMz9kixkqEgADWQogN9wVW4EDXwFkbQmRdR0gFEmXQ81S6ivTq4T
	 2Ph9D+D7LL+JTCAntFnBePGQ=
Received: from zn.tnic (p200300ea971dc5F0329C23FfFEa6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971d:c5f0:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6743940E01F7;
	Mon, 12 Jun 2023 12:39:30 +0000 (UTC)
Date: Mon, 12 Jun 2023 14:39:25 +0200
From: Borislav Petkov <bp@alien8.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v18 1/3] ARM: dts: nuvoton: Add node for NPCM memory
 controller
Message-ID: <20230612123925.GGZIcR/dUrcu03z6V+@fat_crate.local>
References: <20230111093245.318745-1-milkfafa@gmail.com>
 <20230111093245.318745-2-milkfafa@gmail.com>
 <20230612110401.GPZIb7oZPdsPGFzSDc@fat_crate.local>
 <38c30778-9526-cba6-4ddb-00bcefeb5647@linaro.org>
 <20230612120107.GFZIcJA3zktkiyTS2+@fat_crate.local>
 <99795947-0584-df42-a28a-aa89d7e21c7e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99795947-0584-df42-a28a-aa89d7e21c7e@linaro.org>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, james.morse@arm.com, ctcchien@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:09:33PM +0200, Krzysztof Kozlowski wrote:
> Please route the DTS (1/3) via Nuvoton SoC tree.

Don't all three need to go together?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
