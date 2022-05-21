Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E7A5308D3
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65cZ1SzFz2xX6
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:34:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gTDImOFg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2d;
 helo=mail-vk1-xa2d.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gTDImOFg; dkim-atps=neutral
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L53YY3cdnz3bgC
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 22:58:25 +1000 (AEST)
Received: by mail-vk1-xa2d.google.com with SMTP id e7so5205995vkh.2
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bykWdl7RkLd7Jog7GhgIWoVbo/GRYcAx6n48qBmXwJQ=;
 b=gTDImOFg2B6vBdQngixeW/HBPTktxpECBn/wsKGgzGqvIB/rHUt2m6Lx8G2UhwbFR6
 eFHv+2FUP23EXjhF0JGO7oeZH9VWAWwPx+yH7evdpZuMu8ew1iTVo53uGCD0Ywz03b08
 1Rb+j7cO8b99jzj5uYdBfnAw08STnAdQ0JQV5lp3sjiKzwyrkMgEkZmkeF+MjKjL0Pgd
 98uyQnUMYaQrHP02V5PitoHKi6JBPLag0nQyoEJUWuFjRZkklusWihMRj6th0Xx83rKM
 98UzlkRgsztjyb0ZklsrVWu4+aLKj3XECXsaTMG82pEfx9JO+WIe3Vdil8drO7OKMD4E
 WW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bykWdl7RkLd7Jog7GhgIWoVbo/GRYcAx6n48qBmXwJQ=;
 b=pY56kUyGr7KQU6lrt1j7zo1OBcF2chWBa+izIT8znAbUKk3qhgEoSGtLkYo8TAGJS2
 vXyc3AZ8aetoR4TfDCthgzFNtjE3MY2+9eVhQCPaYLz6EF10+OZYCZJDj96s3vADM1UK
 DvbxEOM/PaQ0hGCi/zPHb8B2zvGlFAdsu0Ll1mS7kA9aOHdON3/l8wfH/bi7nW56zWCL
 1XVeEWofsgrenguwSrgCj1bieWyPTeMXm98lAHakCN/50KLyz6GPNKloVJfo1VUO5Lzv
 Rms8KXA+FC43OzpyHHv9AFcZNtXCzqOkImpImy4UEbksKOn3fMKCunLSV93ZLjHVcCmP
 HJTQ==
X-Gm-Message-State: AOAM532Sprxm1FFLVdtum6X+6sQ26MjGiy/SAVfjX/ts8GTKPmuYOVRy
 b8hQFgkNKaqGNpq5I2c810MyzXqiAZzUOElxAg==
X-Google-Smtp-Source: ABdhPJw2hjnkCON9vjPf/cymYkRdWh75PM+u9FYDAz5c58fDuAVkVCoVnkqkOCnc/jPPILXIWW5ufceScMZiovqk4Os=
X-Received: by 2002:a1f:3254:0:b0:34e:b02d:bdd7 with SMTP id
 y81-20020a1f3254000000b0034eb02dbdd7mr5659802vky.11.1653137902033; Sat, 21
 May 2022 05:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-7-warp5tw@gmail.com>
 <Yoh+RUTtmiQsrCg3@shikoro>
In-Reply-To: <Yoh+RUTtmiQsrCg3@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 20:58:10 +0800
Message-ID: <CACD3sJb1GOFNeXU3csDWR7mSeUEDqqNkT+JvKVavRL1Epik-zw@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] i2c: npcm: Correct register access width
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, rafal@milecki.pl, 
 sven@svenpeter.dev, jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de, 
 olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, 
 kfting@nuvoton.com, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 May 2022 15:30:44 +1000
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
Cc: jie.deng@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your help.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:38PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > The SMBnCTL3 register is 8-bit wide and the 32-bit access was always
> > incorrect, but simply didn't cause a visible error on the 32-bit machin=
e.
> >
> > On the 64-bit machine, the kernel message reports that ESR value is
> > 0x96000021. Checking Arm Architecture Reference Manual Armv8 suggests t=
hat
> > it's the alignment fault.
> >
> > SMBnCTL3's address is 0xE.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
