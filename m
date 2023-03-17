Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B16BEFD1
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 18:37:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdWYR45mcz3cjN
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 04:37:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pUhvf+kd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pUhvf+kd;
	dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdWXp20r0z3chZ
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 04:37:13 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id bm1so1988956qkb.13
        for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679074628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkw7xFKCGQ8y3ihDSwQaifjRjfGYpBRwz6O/9EShW4w=;
        b=pUhvf+kdQ2fX9RNLZ9hiJXhimJItMrtY20tl+OKvdUEpAtCU1mmzPAXVlCGRz9Rv6i
         tMhVIkUMpgTlTRDoVaOrHpFDTiISiRWAfjcs9g0rSWK/PNKlWNbzIQQq5FQ/WskZXmdi
         8aAZpWNXa3XAPWmaSV5dqBAppsRm5iqddobUsIZGMAKTUmlH7mu/+4IVHgSd2ryEq/A9
         3eaP/FbiN//2vViinJTQ8BI2KGQkxPp+c2J87kZ+sQfgerGVLsdRn9ADkcNjqthEygeV
         FS8Qedt896kUQphTKiEN2Jt+T/NW6CULmYux+TuIUGACOt4hQ+mXGRoXL2q7gIkUZT8B
         M1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679074628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkw7xFKCGQ8y3ihDSwQaifjRjfGYpBRwz6O/9EShW4w=;
        b=jOI1feUx85SgIDK5Mf4/04fDTKTqgYS8tMnei7yhuM1rfKML9sivCo65n4eKdv8DQZ
         vFhd4HzbaES4AzsEEHRPaOtozFzLZYvdUEryCI0bFoQsa22uKzXC4qJNOzyOs0OVf7tU
         UJCE+uSuIBPmA0GJscTYmPBINVzAEQuqeuVlh2JfK+wRElvzwDMCFKJnluE2cVrTGAoM
         UsTJ8BjNecXSe0n9B24nNb6cwUvfgCMDPVbajPCCYu6n1XzGEESyuAGUtuAK5Vy/WzCD
         RdotUO6oQYNgw//Rata+4tA9S1D84r5ni7aXDNM+U1dHWOpd0qQmnv2nh7qOyg+51Wju
         nwnA==
X-Gm-Message-State: AO0yUKU+/tgr2mDapBEr/q/7LBEXBCk/q2ISxxEmdX3e8/TVBKV98pca
	X7m4HvKGDT3pyThshSpAO6z6pUmQFTOxVSjqWwo=
X-Google-Smtp-Source: AK7set8hC6XZO9a9uhHE+dJ/fifDkD8AmIT3Wmrg0k48frLIgXxh+o4TnKjKmLQZ2jxVu9L8hIXrW037ynmF6qIV5gk=
X-Received: by 2002:a05:620a:22d5:b0:745:bd3d:51df with SMTP id
 o21-20020a05620a22d500b00745bd3d51dfmr833838qki.3.1679074628076; Fri, 17 Mar
 2023 10:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <f28c7c34-077c-4c7e-afd8-c4180718d403@roeck-us.net>
In-Reply-To: <f28c7c34-077c-4c7e-afd8-c4180718d403@roeck-us.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 17 Mar 2023 19:36:31 +0200
Message-ID: <CAHp75Vegm=jmuJ6q5qofuLKm_LggKmtQZWcVgQN=MG3kMMCTRA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, Tomer Maimon <tmaimon77@gmail.com>, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, pbrobinson@gmail.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 17, 2023 at 4:16=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Mon, Dec 05, 2022 at 10:53:51AM +0200, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> I still don't see this driver in the upstream kernel, or in linux-next.
>
> Couple of comments:
>
> - devm ordering does not really matter here. The devm resource
>   is the clock, it does not depend on local data, and it will be
>   released last, so that is ok.

Not sure. Strictly speaking this is the problem. If you leave a clock
going on in a wrong period of time it (theoretically) might break your
hardware once and forever. Similar discussion about power, clock and
reset signals has been held for camera sensors.

--=20
With Best Regards,
Andy Shevchenko
