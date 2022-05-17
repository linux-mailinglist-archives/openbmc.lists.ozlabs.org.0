Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940D5296FE
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 03:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2K3X6cz2z3bpf
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:56:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M+kFVvYw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M+kFVvYw; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2K356n4xz2yHB
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 11:56:00 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id i27so31871273ejd.9
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YgBxFbatc44xZeVb7BCpn9bBMCWqFowgn6ucn53Dafw=;
 b=M+kFVvYwVOeSwDbzvU5qMLJ/t4vsAjAUm5lEiawrhXQqMHUO7raDEZe++x70BDsMO9
 qXDNLJc9MrSI6XltjRWoumXZgu2wfLn3KQI5JI6GlgQHypiFwB+SbNb42/XrPNWI8OyN
 VW+y1cCyMjZ6f7RqOSoKPAt/5ITmlm80f7d2hUCWhUXCZpONqjdYJYKwsjpjd3YCtuF3
 lwhez+491e7riTMO7+gTPAvNRBcKj3k2QfirJzJvpfxLU7rs/LEdWmn82dPB35CWTKES
 A9ApVDrBUw5V7c4g7+qHeD1RZw5nRXsQatXWIfLaEhH2rZip763x8vrL5/kUHB72s/7i
 d9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YgBxFbatc44xZeVb7BCpn9bBMCWqFowgn6ucn53Dafw=;
 b=FutpQC/AlROyN8uTTuiACE+XQaML3kH4YIe16NnhdymyADD+SM/sC3wFSGjDMFvvC7
 LUflxx8VdvvKvkOvbl93vB1KHSC/wBlEpWAkG9EakG6hajMZR8G3JPhvfZcLGvE8iPjZ
 MtRlsIoNuWTCP/cot78yEGUp90E1AR1hEJZ+9RFoe/aBIvKvtylzpH/nX0NiKkKo8cDZ
 +oeV6BW2mjkT6Cez89OIKnOhpsNop3MKq1Ss+ObAWvuDyASByDMB26FhvBfjYdZcQy0d
 gcCbTZ0QeEpm1TNavbRDyghaqabML+91k8TuNITXqXWZ8F/DhJJV4zdbajQcFx8OTPKr
 e9hA==
X-Gm-Message-State: AOAM530OEnAn36WbYg21JnrY/Ca3fI2P2zyCFtofEfARjalvCCl6v6iK
 HmjlI92lCDemX9YdJBE5grANWzwqXkG85cI04io=
X-Google-Smtp-Source: ABdhPJz7rc+erNWeLjGVy+TkCtqJz+van0FqEP98zM7Ha4CRfZsELxILBDnRwJ1ko3YUmePv9oxxJP75T3BFhTJo3gE=
X-Received: by 2002:a17:907:8a21:b0:6f4:d2e5:4d17 with SMTP id
 sc33-20020a1709078a2100b006f4d2e54d17mr17972348ejc.196.1652752555296; Mon, 16
 May 2022 18:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220513033450.7038-1-kflin@nuvoton.com>
 <20220513033450.7038-2-kflin@nuvoton.com>
 <5e1d0765-5428-b787-75ad-063a1fb051fc@molgen.mpg.de>
In-Reply-To: <5e1d0765-5428-b787-75ad-063a1fb051fc@molgen.mpg.de>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 17 May 2022 09:55:52 +0800
Message-ID: <CADnNmFqFXxDv=+uEze2LjV2eMSVbMyCp=uiTnrm3Z7Hm6j8SHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm: dts: Add node for NPCM Video Capture/Encode
 Engine
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: CS20 KWLiu <kwliu@nuvoton.com>, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 mchehab@kernel.org, Marvin Lin <kflin@nuvoton.com>,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thanks for your review and comments.

> Could you please add the datasheet name and revision to the commit message?

It may not be appropriate since the datasheet is not public.

> What board did you test this on?

I tested on Nuvoton NPCM750 evaluation board.

>
> > Signed-off-by: Marvin Lin <kflin@nuvoton.com>
>
> As you sent this from your Google Mail account, that address is going to
> be used in the author field. Is your Nuvoton address configured for git?
>
>      git config user.email
>
> Then I would have thought, that that address is also in the files
> generated by `git format-patch`.

Thanks for the reminder. I'll change the address configuration.

Regards,
Marvin
