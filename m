Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2958D50F
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 10:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M259C0czBz306m
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 18:00:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=AvQLi8gZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=AvQLi8gZ;
	dkim-atps=neutral
X-Greylist: delayed 581 seconds by postgrey-1.36 at boromir; Tue, 09 Aug 2022 18:00:21 AEST
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M258j6DqLz2xKf
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 18:00:21 +1000 (AEST)
Received: from zn.tnic (p200300ea971b98cb329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971b:98cb:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4E3531EC01B7;
	Tue,  9 Aug 2022 09:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1660031419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=CKTlBpVle+EMNM4GbiovFuYDC+EYIUhi9bVoDaoM+Hc=;
	b=AvQLi8gZPjJNC3y51S/pIeAEhLII8w6paYpTN+JUqd9cUaE2N2FI0oHRgYPY6cFtKd2Lmk
	/dgDyrdHauhZhn1SmxKfipFMlQ7JmgNEwsKsvWzBHMo8/vqDiHeONG/xahO6CpQfZWZhwp
	uaenCxHLp/HYxjUiIruj9w08iTmswZQ=
Date: Tue, 9 Aug 2022 09:50:18 +0200
From: Borislav Petkov <bp@alien8.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: Referencing non-public datasheets in commit messages (was:
 [PATCH v12 3/3] EDAC: nuvoton: Add NPCM memory controller driver)
Message-ID: <YvIRusXsZvdiFRzS@zn.tnic>
References: <20220610084340.2268-1-ctcchien@nuvoton.com>
 <20220610084340.2268-4-ctcchien@nuvoton.com>
 <YrDIimW0gW1j03WG@zn.tnic>
 <6d1576c9-f105-2aff-4497-2c2e7bed2f3b@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d1576c9-f105-2aff-4497-2c2e7bed2f3b@molgen.mpg.de>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com, KFTING@nuvoton.com, ctcchien@nuvoton.com, james.morse@arm.com, medadyoung@gmail.com, YSCHU@nuvoton.com, mchehab@kernel.org, tmaimon77@gmail.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 09, 2022 at 08:42:29AM +0200, Paul Menzel wrote:
> Maybe it could be denoted, that is not public (and also the version), but
> even mentioning non-public datasheets is useful, as they could be made
> public in the future, and allows everyone to contact people with access to
> these datasheets to take a look into the specific datasheet.

If you're going to contact people to get you certain information, you
don't need the datasheet - you simply need to ask the question.

But whatever, if a document is mentioned, the text should state that it
is not public so that people are aware not to go looking for it. Or, if
it is public, how to find it.

And no, a company website URL is not a good idea because those change
pretty frequently in practice. Uploading to our bugzilla and adding the
link to it is much better.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
