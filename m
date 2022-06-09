Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18608544CD3
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 15:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJkhx73YWz3bsy
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 23:00:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaYI4mXJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=warp5tw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaYI4mXJ;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJkhZ3ldSz3bmK
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 22:59:58 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31336535373so89257937b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=adYpahK+RjveaJ81KLRCwb/NRKB4wZWg1u6S/wEqrF4=;
        b=XaYI4mXJjPjBN4hM0twTQo2PvDXcOm4PS7KigPBCBQNHaMvy1DG7taA5VgGSKu9Rrf
         qDhflEU075jABeHjt9t3KE26MrRacH9p+sB0JGC/3pbAeMQwsxwa5adPAygilD9WlZx4
         GliIFVV2lB790+7OHqVR15ZRpwQEN5/4C0CahvkMwDjdyjupRDoN658mVFLhX4UvfATA
         s8B8AwhBqDcgzgmrMpMnGvx9y7crj8yk+ucAMHG8FCL7GVW7cc4fJnH4erB8v4SUTSsu
         Xapdix/S1m8IjzpYKChODpQ5qMzXr2L2c4UZfPETCrXpcpfBBCpuakJTUQRGFBzjIbBv
         HXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=adYpahK+RjveaJ81KLRCwb/NRKB4wZWg1u6S/wEqrF4=;
        b=Rv0egi07IE7EtbXgyV+ePl1mM8xtoPTHkKoGeVt5OzTn7yNdgEFZX9yAfKU2G3rDFZ
         Bn746Scmrs8wJ4vcW8JUwr7+MS8+SvQToK8++KYMGXFi6FhBL/iYlHFuE0JJ50wITdcy
         tiYAO8hiuhr5PYbDruZ28p4GKLldVM+DwXmz8Z/neLunGSIs49TGJMMtQomv9arSgkes
         WKrFwtWuNRiwOzZf0sdl3hYuMAqoqDARKrKolgj7SQ6afmjWBY+WrwJHtYqUzLuE42cg
         PZwZGEHBPYw2Urg9c0FGEQcFXRf1go8/cKfd8BSn407dbANsaY22G3Aj0JeDelFFMTIC
         t4Hw==
X-Gm-Message-State: AOAM5319wBij30UZopZYpdbu53dUfzv/mePwPn8+LAWjvq9yN+VBJKsl
	RBFC4s3I+m4AU3kC4XAduNJwcBvU7OweL5gmug==
X-Google-Smtp-Source: ABdhPJzb42fHZWsZOMjZ1rIWT3YnhW413kXIySlzuQKMmPXfvAAo94UdOeKLjvw7k6z8ZCoVoV1C0/g9x4fI47aGp84=
X-Received: by 2002:a81:4bc7:0:b0:313:7a99:5c with SMTP id y190-20020a814bc7000000b003137a99005cmr7071984ywa.51.1654779594980;
 Thu, 09 Jun 2022 05:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-3-warp5tw@gmail.com>
 <YqEAbm2T5zKmk/Nw@kunai>
In-Reply-To: <YqEAbm2T5zKmk/Nw@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 9 Jun 2022 20:59:44 +0800
Message-ID: <CACD3sJYEud8yagD-8m1UWYNmk7-gkg3R-kmK40Mf65cFb9N5eQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] i2c: npcm: Remove own slave addresses 2:10
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
	jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, jsd@semihalf.com, 
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your review and comments.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:38AM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > NPCM can support up to 10 own slave addresses. In practice, only one
> > address is actually being used. In order to access addresses 2 and abov=
e,
> > need to switch register banks. The switch needs spinlock.
> > To avoid using spinlock for this useless feature removed support of SA =
>=3D
> > 2. Also fix returned slave event enum.
> >
> > Remove some comment since the bank selection is not required. The bank
> > selection is not required since the supported slave addresses are reduc=
ed.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
