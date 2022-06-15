Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771554CADA
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 16:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNRtC4BKJz3bvP
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 00:06:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.74; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir; Thu, 16 Jun 2022 00:05:53 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNRss4zSXz302S
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 00:05:52 +1000 (AEST)
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MirfG-1nXebJ3KYW-00euCN for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022
 16:00:38 +0200
Received: by mail-yb1-f178.google.com with SMTP id x38so20654580ybd.9
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 07:00:37 -0700 (PDT)
X-Gm-Message-State: AJIora9OcV7GXRnSYGhrpp2fg3CaGs/KX25CPlzWzkaVMfrGC4AqaCvp
	uw7MVMOIdKot2cHLuhRN7k3kkqYtueGId526fdU=
X-Google-Smtp-Source: AGRyM1sINeeo5NBylnIfasp1Y9wsPFbqUeZD8UXabqa7f4PzXfDr9oZ7lyvv0su285MeiZU99bjHFPOmGTkdMoexbAs=
X-Received: by 2002:a05:6902:1023:b0:665:12c1:b44d with SMTP id
 x3-20020a056902102300b0066512c1b44dmr10832736ybt.472.1655301635807; Wed, 15
 Jun 2022 07:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220609213513.88479-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220609213513.88479-1-j.neuschaefer@gmx.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jun 2022 16:00:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0-m1iQ2bP+dsoGTPZGMNBKqB5a6315jdgaT3tuR4WfTw@mail.gmail.com>
Message-ID: <CAK8P3a0-m1iQ2bP+dsoGTPZGMNBKqB5a6315jdgaT3tuR4WfTw@mail.gmail.com>
Subject: Re: [PATCH v4] soc: nuvoton: Add SoC info driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:09KQ71Z7xEwc3ug1/N7MYiLjqGfU5Ylc9feDpyt80mWpj5eZoLg
 /w5S+kDMg3GJ1h8yYIt4rQidD+l0JYUYoSh3h9UjiYfsYiXO0wHiv0LnP0l72c2y8CN9fzA
 4KiDqp6/VyYBq/rqipEJGmGO4vPv31rBMCu2hfAVxER/JeYR5zK4fHriR0ppeY1q2b9hpcl
 KS1tCw60soR4byPYQh1hQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vC4hUTZA0Sw=:aZ9dBJsi+kO4vBpr4FBX5b
 W9e8GHU7sU2X4bfQGka6PM1rj2V7odYXXfZnumKXoeQ8D3h9W0iWhkd7Okw40pbZtPgew062T
 KdZG1cDCeMjYdefPQmRrQSd6kSnPKt41KQd50ltg0VxJwZ80feYPIex9LiShE+C9IVgjIQqft
 IMjgvTfh6NttAxoHie2fradCORoR5+hCDd1/bImQHf99y9nTdqypuF0E0FylBeBPdULhyP5qu
 kwXtrrynx28dq8Ts2NXVClgvZk/BZqFX8XNf4D42fNB2eTznOyki22ldzVZVZFnEoLdGZy7od
 9CBG601ZmeDfAhS7bLNhcs0UKFF7D3uPHC8P0q1QBsI4hlxe3SF71V38VDfa7mPRXoUd/M/gA
 FdyO8N0J1dzQ2ijRjCTj14WWw2YUL9DiqVtdMpcdd27i/1shs2s/vRMRwHkRIR3zRLQ0knKEb
 z4rA25H6JdT+v65+iPMnuQt/AB7JGIHkOydbCLudKXlnnaPUYJei1+opm9PzTuyIT66vV7hRQ
 1ZHX3HeG6FvXMhHR61ioVJb2WZH6N2+/g+SUthIqa076I/rXYYyJqoQnGm4RL9ERi7ajHeyo/
 hEe1VslX+4CJL9Y9kepFW1/7fWLal5s21tXUamd6OAFCKitF1Nw5tX88lwwLlu4nRvEDJoQOX
 Ze7iUIKiIxipXnhqVmSv3ZPl/PrbjVWpmYR3O7HffYaNaYUsM/tB//P42335WXVZ1OiXp6ShV
 rfJ7pIL4Q9dmKSs5KxN9H9gluRS7j5m6Zc7OPbo9KFtm7GY/R/I7dDmCvuVamMCivJe1xT72o
 DYUHHqSVqZe3xkyGLf/qevk2CCEXYOG5KH1BQq5D9sucIW/GsMbzRdYbAdfk0W8Gzg9LiqGK/
 otd89fpogSy6kx+D+uqw==
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 9, 2022 at 11:35 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> information such as the SoC revision.
>
> Usage example:
>
>   # grep . /sys/devices/soc0/*
>   /sys/devices/soc0/family:Nuvoton NPCM
>   /sys/devices/soc0/revision:A3
>   /sys/devices/soc0/soc_id:WPCM450
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Looks good overall.

> +menuconfig WPCM450_SOC
> +       bool "Nuvoton WPCM450 SoC driver"
> +       default y if ARCH_WPCM450

It would be nice to make this a tristate option, as we generally
like to keep optional drivers out of the allmodconfig vmlinux file,
even if this is a tiny one.

Just add the trivial cleanup function and MODULE_LICENSE() etc tags.

        Arnd
