Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999296E40E8
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 09:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Jbb3xDPz3cP0
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 17:29:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Jb45NvKz3cTk
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 17:29:20 +1000 (AEST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54f21cdfadbso357025427b3.7
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716560; x=1684308560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iD+IdtmQpICkgSYBVB1p70CyjZ1NhTQA9JDwcbh810=;
        b=XRhqdIgyWJHOPtiau2rWgYmtwPWTZY5a4GtxTdoOipw8iZ6tmU0Az+mvbYSaztCVtV
         t6dx9vvNdiacCYD2JmjeNrpEDonWneenuK00dPUrv/VManhw3DYUvwzNLAb29Y92TV4M
         /FjWpMcRj4VK7DqCgmGTrkfS1/HoChFN0TTDI4qGmOa5sSMtgsmvYYuLsleKs2IS3M3/
         XZKlxqDYGftY01GbIVQUp2iSKJPC//WnwcNmdwgEmpWEq7GRILMHSkxU/bAbikJo0dKQ
         ee/loDUok7e2SHHmWjpFmqFuCQlCcqGUA3FhGh/WGtyNOT/6gZ+LKo67R78rlRW8x9SK
         vxTw==
X-Gm-Message-State: AAQBX9eDw72sdOyGyeTmEJ6yDPgNVZqR3zfADQt7a44aA6VWV37/Jef0
	DJmkKsWEBU+/zgrnCJPaK+qWtV9PXxIsxA==
X-Google-Smtp-Source: AKy350a3dsmgCzVwdplQ1iL/YD8iNHFpzKqBdk3LVwuGa/rbkw/EFkIhVeLxt+zSbRPrRU+ULnEZ6A==
X-Received: by 2002:a0d:cc47:0:b0:54f:bb97:aa86 with SMTP id o68-20020a0dcc47000000b0054fbb97aa86mr13669310ywd.21.1681716560052;
        Mon, 17 Apr 2023 00:29:20 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id g198-20020a8152cf000000b005460251b0d9sm2963726ywb.82.2023.04.17.00.29.19
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:29:19 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id t16so11893804ybi.13
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:29:19 -0700 (PDT)
X-Received: by 2002:a25:d8d7:0:b0:b92:2c78:1481 with SMTP id
 p206-20020a25d8d7000000b00b922c781481mr4583239ybg.12.1681716559170; Mon, 17
 Apr 2023 00:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230412183834.3769519-1-j.neuschaefer@gmx.net>
 <20230412183834.3769519-2-j.neuschaefer@gmx.net> <CAMuHMdVUC9n8vQYq+5tXX1jVPSnhyKoMAcB0dd6GFMXA=Apobw@mail.gmail.com>
In-Reply-To: <CAMuHMdVUC9n8vQYq+5tXX1jVPSnhyKoMAcB0dd6GFMXA=Apobw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 09:29:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjThNaANe1zG_JiqE1AdvwM-SDsyvY1m5R29CFZLjU4A@mail.gmail.com>
Message-ID: <CAMuHMdUjThNaANe1zG_JiqE1AdvwM-SDsyvY1m5R29CFZLjU4A@mail.gmail.com>
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

On Mon, Apr 17, 2023 at 9:26=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Wed, Apr 12, 2023 at 8:38=E2=80=AFPM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > Select CONFIG_REGMAP from CONFIG_WPCM450_SOC, because the driver relies
> > on regmap to work.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Link: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-Vb=
QmQ5u+4Q8c7-wYQ@mail.gmail.com/
> > Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")

This reference is wrong, it should be 7dbb4a38bff3.

> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

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
