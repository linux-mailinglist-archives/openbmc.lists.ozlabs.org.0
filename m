Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D66E40CE
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 09:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0JWp37L9z3cfj
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 17:26:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.176; helo=mail-yb1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0JWR4sXDz2yJT
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 17:26:10 +1000 (AEST)
Received: by mail-yb1-f176.google.com with SMTP id 3so1372042ybc.9
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716368; x=1684308368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lk2TzBxvy3H2YxFAlaJgwEBlJno+8HhyM3z0zVaEQA=;
        b=DwzDCl1/KtLna0iFRCj1GtHA8Vibqo9J8oTx1qVWg5gpTMf180bVYFW6qN0NGiIjjC
         QdSmWJFWCm9iYsFlwv3jfaY69x5fr3mVafqIlJ6LSOqoFGr7Ej75IsZDuGhzAmXF1VkY
         NcqokMMvpscCoK0P2y6xBhXaql3U0LB5gFLTPwbpRSpZxad20JAwjCMtAUTrz+S7Pj5q
         W2MxKv/wwW1PA0PF8GLaAMADnYDJrmEfZ4hDdq+Tv3CqnKUlzp7O/nH/tekpo/3HdmkI
         r3m2eNEsLAlKWoBwMw2xU7cw+TUXfYYuhlnkCj57c3QECfDTbogDf10h8iENHGYSMlkx
         h7Hg==
X-Gm-Message-State: AAQBX9eBSP5NAfBxMf7QoSwtNSqiOIiFLwCpJ2UTshYy/3koEoswjOjZ
	bTIIG3vJYOfLGwnNmBse02BcC0SvysfTTw==
X-Google-Smtp-Source: AKy350YTBbZcZoeEuYDyZH1nn+Ul/UDzpzwPai6OLlJt6VoTw8WMnT4Ub7HksH9ka2275TXuJWH2RQ==
X-Received: by 2002:a05:6902:1545:b0:b92:5744:7cdf with SMTP id r5-20020a056902154500b00b9257447cdfmr2586759ybu.60.1681716367654;
        Mon, 17 Apr 2023 00:26:07 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05690c2c0900b0054fa9e39be0sm1397472ywb.56.2023.04.17.00.26.06
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:26:06 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j15so3683149ybl.10
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:26:06 -0700 (PDT)
X-Received: by 2002:a25:d8d7:0:b0:b92:2c78:1481 with SMTP id
 p206-20020a25d8d7000000b00b922c781481mr4579095ybg.12.1681716366734; Mon, 17
 Apr 2023 00:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230412183834.3769519-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230412183834.3769519-1-j.neuschaefer@gmx.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 09:25:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdJooFiLfttxeRVZO_0doWiurwg3ZkxEbyO7D8eaDeKw@mail.gmail.com>
Message-ID: <CAMuHMdVdJooFiLfttxeRVZO_0doWiurwg3ZkxEbyO7D8eaDeKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] soc: nuvoton: Add a menu for Nuvoton SoC drivers
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
> Add a menu "Nuvoton SoC drivers" to make it easier to add other Nuvoton
> SoC drivers later on and to prevent asking about the Nuvoton WPCM450 SoC
> driver when configuring a kernel without support for Nuvoton SoCs.
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
