Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6A6E40D3
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 09:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0JXN6dwcz3cjM
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 17:27:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.178; helo=mail-yb1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0JX3631zz3cfJ
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 17:26:43 +1000 (AEST)
Received: by mail-yb1-f178.google.com with SMTP id j15so3684354ybl.10
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716401; x=1684308401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnHCIIu6B3qiVRFBtGIosQ/MV7BEV+uDGlhW9VKcxis=;
        b=MdvNDJflSrXG2DZ4J7m1oZUh2DBnAWdt858frvycKUOLR1bvrM66dUgaArg5240y3b
         w1NBQg5wPTg1VY7+CpXRZuW5dECEoWG/eRU4gz3gMtFiyM/n1J5JkoJ3QF5SmqpoTc17
         E0zVZNzDSBEgRLFtwMkueKFRM0Sf04E267NBCszJDTEGUjGPx61/4PnvQxtrR0QpYooA
         fjVg/hW7R4UzlfDXh7o07U9h9kTdjsjdOVZw0V0HR7i3uNta6um6Amj7kmN85oDPH7lh
         boe5o/h+ru4404uy0GhBpj7grddL1nN9m/XyQDsKrze4hMRTl7+Zg5bytdaIW8oeIOIa
         CYIQ==
X-Gm-Message-State: AAQBX9ddfc/2HHunSSI8+kaMdQUdTrOIdnmteCDZlhyGC7Ji0rNNN1RO
	Itk/mswx+kIymU/MHgcJFEX19VRe4nY0ow==
X-Google-Smtp-Source: AKy350ZmdLj6L7wGmP+4d7NaEh2i16MRQPg8/yppHQKKHbeaIZeVw4FQFLgdKT4nM8o23tUN8focqg==
X-Received: by 2002:a25:1542:0:b0:b92:4ad0:fb1c with SMTP id 63-20020a251542000000b00b924ad0fb1cmr2325179ybv.65.1681716401098;
        Mon, 17 Apr 2023 00:26:41 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id df5-20020a05690c0f8500b0054f9a3b60a1sm2186755ywb.33.2023.04.17.00.26.40
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:26:40 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id u13so24891454ybu.5
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:26:40 -0700 (PDT)
X-Received: by 2002:a25:d707:0:b0:b8f:578c:4e3a with SMTP id
 o7-20020a25d707000000b00b8f578c4e3amr6749432ybg.12.1681716399950; Mon, 17 Apr
 2023 00:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230412183834.3769519-1-j.neuschaefer@gmx.net> <20230412183834.3769519-2-j.neuschaefer@gmx.net>
In-Reply-To: <20230412183834.3769519-2-j.neuschaefer@gmx.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 09:26:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUC9n8vQYq+5tXX1jVPSnhyKoMAcB0dd6GFMXA=Apobw@mail.gmail.com>
Message-ID: <CAMuHMdVUC9n8vQYq+5tXX1jVPSnhyKoMAcB0dd6GFMXA=Apobw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] soc: nuvoton: Add "select REGMAP" to WPCM450 SoC driver
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 8:38=E2=80=AFPM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Select CONFIG_REGMAP from CONFIG_WPCM450_SOC, because the driver relies
> on regmap to work.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQm=
Q5u+4Q8c7-wYQ@mail.gmail.com/
> Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
> v3:
> - Split the commit into two
> - Reword the commit messages a bit

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
