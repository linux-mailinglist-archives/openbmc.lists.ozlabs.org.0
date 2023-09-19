Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEC7A616E
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 13:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqfm15Qrpz3ck9
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 21:37:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqflf2xzPz3cJl
	for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 21:37:17 +1000 (AEST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59bf1dde73fso52097957b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 04:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695123434; x=1695728234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqfdyP+EpBuCdn7wZEzEun0x9+Aw4VCooDZ7mf8oPiw=;
        b=btXsSY35ZKmwPfxajbqy+U2wysr3PI8LYmMN00eB13tiILKOvNXVb4SQpn2b3CiLbc
         v4ZC3+fZC2EQSq78yq+XVlkz2mrNcu9xnXeKpthhg2DgSrLzNs2kAHw9DlyMCIMZj+ew
         ImBTb2kmer9BQA56uqIHQ4Q4ikRcgzmbrQ7v2+HvWLIjwCXUvBeTKZvIdAD00YnCvlIS
         u1qQnKcCbggRmxqKsKT2mlbhwOJFExf9jZqYWWn/dF8ONrlAYA4hSiYAYyqwvT9vBmB0
         LSZFfo9DML4cISpGPFmEkTkAFpYm48OgZEMQlVOrLp7eb/jBL0iTIVGdSU34TfcDTPvu
         Y9KQ==
X-Gm-Message-State: AOJu0YxJZ9diOialoBAVYFGk8gHXExMna7incSl0bLwJA90IQ+loLQeK
	Sy2q1nNMc/Al9qSMd616lfivdUsq549Btg==
X-Google-Smtp-Source: AGHT+IF97CMCnGMTaIAeVrPMz4DyKYlR5MReeGC+N+ORCoGS3Mt47D0Jnuk3qRApJh6m7Gypor5kmw==
X-Received: by 2002:a81:8202:0:b0:59b:8da4:dc2 with SMTP id s2-20020a818202000000b0059b8da40dc2mr11886260ywf.48.1695123434024;
        Tue, 19 Sep 2023 04:37:14 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id j20-20020a819214000000b00598d67585d7sm3145883ywg.117.2023.09.19.04.37.13
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 04:37:13 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59c04237bf2so47762657b3.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 04:37:13 -0700 (PDT)
X-Received: by 2002:a0d:d0c1:0:b0:571:11ea:b2dd with SMTP id
 s184-20020a0dd0c1000000b0057111eab2ddmr12291738ywd.32.1695123433030; Tue, 19
 Sep 2023 04:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230814173757.1747439-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230814173757.1747439-1-j.neuschaefer@gmx.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Sep 2023 13:37:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTU8tN1QNrAT-BWgdrgzvJRvV6a30GcDAFq3qmF1CWag@mail.gmail.com>
Message-ID: <CAMuHMdWTU8tN1QNrAT-BWgdrgzvJRvV6a30GcDAFq3qmF1CWag@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: nuvoton: Add a menu for Nuvoton SoC drivers
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

On Mon, Aug 14, 2023 at 7:38=E2=80=AFPM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Add a menu "Nuvoton SoC drivers" to make it easier to add other Nuvoton
> SoC drivers later on and to prevent asking about the Nuvoton WPCM450 SoC
> driver when configuring a kernel without support for Nuvoton SoCs.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-Vb=
QmQ5u+4Q8c7-wYQ@mail.gmail.com/
> Fixes: 7dbb4a38bff3 ("soc: nuvoton: Add SoC info driver for WPCM450")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
> - Add Geert's tag
> - Fix commit reference
> - Change Link tag to Closes

Any plans to move this patch and patch 2/2 forward?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
