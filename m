Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9CF68D990
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 14:41:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB45m3yWcz3cMT
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 00:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k2blXohi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k2blXohi;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB45B4gfdz3bY1
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 00:40:28 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id o20so22369835lfk.5
        for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2023 05:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r/ydOCyQQrKGLp/0AJuYNtv/QaQymnT6uI+RRtVcu+Y=;
        b=k2blXohiv+G20No/5dvw1w/X9/izbWypP5U130BMnJM+DgIF3JJGNnXqJLaaCSdw1I
         ATh1prOe1Md43yQJwqsgGJawr09FJ4cYKl9AU4Dwa7QwNUqtZ41FF4vS2J2zJJoce80S
         8t/SW0XZ4GlaLYnlIggYJPrQc12yvrGUiI4bbPlg5TAL4KEMfnTGdAfx9kLu5SIcv5pm
         4+lJQ2RSyIFvtRpa36RD+RhC0J55v7m+5MYjtqr6Z/zN1dNjR5Sexy/D571qYS/e5p0d
         vVlXkjQlkgvOY5m+Bb2ekcDkeixkcmkNwuUwbyRP5N9Wdan+gA+4k7ATmceJCqZvplG5
         mk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/ydOCyQQrKGLp/0AJuYNtv/QaQymnT6uI+RRtVcu+Y=;
        b=KrtGWBK1FUHZeNqdwZoEYEnfVoym/rNsU4uWeNVuTLSBamm7iSD14zVtxCvyqSubMi
         Z/e4eAiAueVCYBTcTfJh90ehUiyMQnjZzA6RsPZ4UQSBAazxTCy6H+RipeeosuuWlBCn
         KjowBlMLGv4/p75AmbSezV50RoEaxR8Jsqyg9aexxC2Zrv145/pMkNUePRa9G9V8pyd3
         BciWBXUnDYW2fOF8z2P+/HpcFEtAXNmkxuSB3DKYDQB6ylUYQY2Sv6wZK8Li9XwBS33j
         Eho6Uc7Sqd+zShinCxQ3qGYTE1M7ic+txj4VV7/g/WhlDubsKh04xkFQAxftirAJpveJ
         2yTg==
X-Gm-Message-State: AO0yUKWciC5VVsDsoIQwRLUvUcw65xP8+ru5FrUg9sv7MtApHbAVopBl
	4M60HqzyeeOsXfXucvmwncH5RYuN/ER5keJyB28d+/AZ
X-Google-Smtp-Source: AK7set8thqlM4n0IbMMqG2cthDxowMUgbq1HeBOsZQhiuYB3ei0DP0nADq2ASe2M5hLaMsan5BySXYun18BNO5YTqEw=
X-Received: by 2002:ac2:50c4:0:b0:4b5:706c:ab80 with SMTP id
 h4-20020ac250c4000000b004b5706cab80mr393091lfm.226.1675777221286; Tue, 07 Feb
 2023 05:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20221122203356.109117-1-tmaimon77@gmail.com>
In-Reply-To: <20221122203356.109117-1-tmaimon77@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 7 Feb 2023 15:40:10 +0200
Message-ID: <CAP6Zq1imA-u5-SriY7-fV_L8o=CU1eN2YrO0+Wp69sfWsdhUuw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 v1 0/2] soc: add NPCM LPC BPC driver support
To: openbmc@lists.ozlabs.org
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Kind reminder regards NPCM BPC driver.

Thanks,

Tomer

On Tue, 22 Nov 2022 at 22:34, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set adds LPC BIOS Post code (BPC) support for the
> Nuvoton NPCM Baseboard Management Controller (BMC).
>
> Nuvoton BMC NPCM LPC BIOS Post Code (BPC) monitoring two
> configurable I/O addresses written by the host on the
> Low Pin Count (LPC) bus, the capture data stored in 128-word FIFO.
>
> NPCM BPC can support capture double words.
>
> The NPCM LPC BPC driver tested on NPCM750 Olympus board and NPCM845 EVB.
>
> Tomer Maimon (2):
>   dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
>   soc: nuvoton: add NPCM LPC BPC driver
>
>  .../bindings/soc/nuvoton/npcm-lpc-bpc.yaml    | 112 +++++
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/nuvoton/Kconfig                   |  24 ++
>  drivers/soc/nuvoton/Makefile                  |   3 +
>  drivers/soc/nuvoton/npcm-lpc-bpc.c            | 396 ++++++++++++++++++
>  6 files changed, 537 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
>  create mode 100644 drivers/soc/nuvoton/Kconfig
>  create mode 100644 drivers/soc/nuvoton/Makefile
>  create mode 100644 drivers/soc/nuvoton/npcm-lpc-bpc.c
>
> --
> 2.33.0
>
