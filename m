Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5A72C39F
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 14:02:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=IeBV6G30;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dowkXs+B;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=AwvwLYEX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qfr000Kh2z30Nx
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 22:02:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=IeBV6G30;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dowkXs+B;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=AwvwLYEX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QfqzM12qSz2xdq
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2023 22:01:35 +1000 (AEST)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E05711EC0398;
	Mon, 12 Jun 2023 14:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1686571291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=aCD0rhhYxmitMKHhWCG0kd5hHn491gY3FyRL/Ejl4QU=;
	b=IeBV6G30DY01vSH2jKXlHAUV8ULyYztISDDfO+WnZ/Ife/P+Wm1aZ+Fa2X7eq/SWZZCGvs
	X/NtQN1owm9vW9nd9I4jynTAUPnCL07c0VamaU1vdliE84hTtv6uPwI6a5bkVUK8m4ofkd
	RnPW2KeWM3YhsnxSiPFBJbDBhS/cDvI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1686571291; bh=aCD0rhhYxmitMKHhWCG0kd5hHn491gY3FyRL/Ejl4QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dowkXs+B87WSwIt+wt4kae8OPbwGHpysMIdlUgxYi6mpcCYXfHY7bcTpHcEyx6BE4
	 QuNGx+gtMOW38joxrpG6nIfHUyrGcw1qdw8SnLK4RT3I36fpmYgNIrCBOr2hAsMwbs
	 NIlp5Scate82a4kBAH17xJZ5vbQ2frJU1PTL7/4bL1XNn8utkIdCclaNtWweRIwyuB
	 PlLzyy0jE8Ak/LPXFI3/ef4sBV6bAosUkheJ8Ks9+CQEubyD4Jjl87mKqQLo4PM7Xi
	 bT3ybyQnZYf0ImQAI80vgjNrQmahDSDo//UwiZ3MqeCFhSl9lSnE16FzIdJElbQjbq
	 q5WG5Nigmj4CR07YvTghFIp3b67HZa5t1KfzuToX1LWLlY3vjSOdB857vHnn8OmDtv
	 qZIS/ORJbmaBLIJfGSlNULog4sqHQvzBZIWnTX6PK8IlhQneDUcRr3x7bOv2XARTWp
	 gNdVio981/xZODDLtHPxSBy0yau/o5WuHogrddu3cmAEZuFUUPNFhMA/WIF/ql0KO2
	 Y9CWWOqKO0W7I/ltMkWv3cSkRpEucQ805KIlav4/XzcgDB7cdbVgzC9heMNL/WA6ik
	 w6FU7RWuZCS/GvX3w9OhPDgdPSdporzM5bXdnwlTWIvmucwFNry+CBcfhxW/zv7pTN
	 yeEQP7TqNCBcKPVa3aOXAnSk=
X-Virus-Scanned: Debian amavisd-new at mail.maysoba.com
Authentication-Results: mail.maysoba.com (amavisd-new);
	dkim=pass (4096-bit key) header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.maysoba.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dflzjxyCl_ZZ; Mon, 12 Jun 2023 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1686571289; bh=aCD0rhhYxmitMKHhWCG0kd5hHn491gY3FyRL/Ejl4QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwvwLYEXlqknXMl8J6hgmWUHplUdHj5dna8ng/ccDjbTWTh4rcFZ/996X4BCd4hez
	 vCl73VpkA+2IpBYWqpgJFMHaxzW1Aswuqw0dbsdsmr8Ol97TD9AMR+rpc+b938jKwh
	 Gdyj50s/qz1TkeNq69n6SuuZF8EGB3D6wiqyZ/S06cocX474NZoLX3F9qXeqPNOxlP
	 bvNqsFOEfcwrHmxwo4euEyi+t6uzJeagYcDwvhrp5IGQaxzjPojuCSjGZger4ghzAG
	 gjKeJs41PmIg5Ptu8A7i5WSQa8dheS77pjxRP/3vY8q8i06SQrEN92DveX+6JbXMlB
	 MLreY8TDAictVGIUVsKnkPrPqsecGXIPkrEm1i1iYHYhoy1cqAcWXyfY/VYXgQvoub
	 HJ0LFjZ5X9m6RB7pLfFFqX/TG26tMcjrQ/XyGArXjTF8ybO3BoEkUpww8PH+Ch5ja5
	 HJbxB6y5cdIwC8bGrgBYwNTKuZpPK+gZslYxPGxIqwDkZt03lS/0XkXrdTyceqW2LA
	 jqqJQdN4VTiv/MzFDfYvbzlYbrqMBHz5GkF/96vr8Gr/EWRaE8iIbYgYHpuK1GsflQ
	 HUt5qRD5kHyShyr2/yfr2MF2xzs36LFzvwBBIJ0FXPPYkZoY+FMrK/5qUZ34pgKcLW
	 CQkng9EhhBvSFXsccz9rIlzQ=
Received: from zn.tnic (p200300eA971dC5f0329C23fffEa6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971d:c5f0:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1495C40E00EA;
	Mon, 12 Jun 2023 12:01:08 +0000 (UTC)
Date: Mon, 12 Jun 2023 14:01:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v18 1/3] ARM: dts: nuvoton: Add node for NPCM memory
 controller
Message-ID: <20230612120107.GFZIcJA3zktkiyTS2+@fat_crate.local>
References: <20230111093245.318745-1-milkfafa@gmail.com>
 <20230111093245.318745-2-milkfafa@gmail.com>
 <20230612110401.GPZIb7oZPdsPGFzSDc@fat_crate.local>
 <38c30778-9526-cba6-4ddb-00bcefeb5647@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38c30778-9526-cba6-4ddb-00bcefeb5647@linaro.org>
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

On Mon, Jun 12, 2023 at 01:22:09PM +0200, Krzysztof Kozlowski wrote:
> It is preferred this goes via Nuvoton ARM SoC tree. I don't understand
> why this is first in the series - it's clearly wrong.

Don't ask me...

So the EDAC driver itself is self-contained so I can review it and you
can pick it up with the rest, if it looks ok.

That ok?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
