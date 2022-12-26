Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E13655FFD
	for <lists+openbmc@lfdr.de>; Mon, 26 Dec 2022 05:51:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NgQNq60TBz3bZl
	for <lists+openbmc@lfdr.de>; Mon, 26 Dec 2022 15:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=WFP3Andy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=WFP3Andy;
	dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgQN70dQhz30R1
	for <openbmc@lists.ozlabs.org>; Mon, 26 Dec 2022 15:51:03 +1100 (AEDT)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B30A71EC0606;
	Mon, 26 Dec 2022 05:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1672030247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=2TqhcXRdNl3g+ClAVEK77kT8OaeakGMOWOaBw6GqDn0=;
	b=WFP3AndyTdJ/0Y24e5xR2XhHSdoolCbSftNI2Xh2gy9QqQhv52RTizBh9Ds2KQE4EIZFn+
	myKgbEhCq4N20ADJiiZGS235J4SUISmWVGrxghd/rPvAQtWzOyUG+aitPjnDjB51rdJpz0
	yViGK+/U5sHd+jG7L4Z0oIyJGL1s+TQ=
Date: Mon, 26 Dec 2022 05:50:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Kun-Fa Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v17 3/3] EDAC/npcm: Add NPCM memory controller driver
Message-ID: <Y6koIrTN2PYpQVGO@zn.tnic>
References: <20221223032859.3055638-1-milkfafa@gmail.com>
 <20221223032859.3055638-4-milkfafa@gmail.com>
 <Y6WniKjA6BHLknP6@zn.tnic>
 <CADnNmFqQ5_OQ-FiqdSZAtXFdG2X=qociXBykqL0TqtMw9r_=_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnNmFqQ5_OQ-FiqdSZAtXFdG2X=qociXBykqL0TqtMw9r_=_A@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, james.morse@arm.com, ctcchien@nuvoton.com, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 26, 2022 at 11:50:54AM +0800, Kun-Fa Lin wrote:
> > > +             syndrome = priv->location ? 1 << priv->bit :
> > > +                        data_synd[priv->bit];
> >
> >                 syndrome = priv->location ? 1 << priv->bit
> >                                           : data_synd[priv->bit];
> 
> Just to confirm the indentation, is it right as follows?
> 
> syndrome = priv->location ? 1 << priv->bit
>                                            : data_synd[priv->bit];
> 
> And I was wondering if I should just remove the line break and let it stick out?

The idea is to have the '?' and the ':' under each other so that one
can visually immediately "parse" where each of the sides of the ternary
statement start.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
