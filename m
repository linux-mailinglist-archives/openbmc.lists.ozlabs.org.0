Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CC7358C0
	for <lists+openbmc@lfdr.de>; Mon, 19 Jun 2023 15:39:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=n43Q+Pmx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql9pl5LFSz30XQ
	for <lists+openbmc@lfdr.de>; Mon, 19 Jun 2023 23:39:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=n43Q+Pmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql9p81xchz30Np
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2023 23:38:39 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b45e6e1b73so40037451fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2023 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181911; x=1689773911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LHSJatVFoVsNCEXb4wZVhoH/WNmJ/H73lXGifb7Dy3Y=;
        b=n43Q+PmxeAOrlgBdH690XKkOIIqmeJFMFXcWSEKz2WQ4F2P+DsmdRrgXTAHkXlwHwm
         bAhUsIlcW3BCUv+qwTCTBD6VPtYZVwfsZfqTfjA1E2yPdl+w9BTDsIaCJa+L7DY0vQwo
         iyQHd8iI8gFtUelNlmCxZ0JeFd42qxOsRra8yw+j1sPEFHrX4ESAxL7hyBj0LgMwjkzX
         TP171KShCc9kFjXSIXRbZuGoqXjIMGJhmpQ0/9hGCs9CSsjwcH6SOq1vu3RzTU7hX7ju
         D2De4Be9HRBXMvFSVjpdWyEESAE4m4cBfZucjW3UAY7pHVDxoVUmN4PRWsCLDv9iFe2U
         Rksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181911; x=1689773911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHSJatVFoVsNCEXb4wZVhoH/WNmJ/H73lXGifb7Dy3Y=;
        b=ih5vPsjjlNFOlGyntNN7ihYgE0TvLPFSNOBTUpKyk7RvRWhCX8SCwEDhHlKLdvEwl6
         f3SbxGLjMhxRKfb1O+xidomTjdrqh2ZN5N/PBUxLJSpztnSGtsHt+xy2Ro15lcZPWNl5
         hEpnH8Y3yvRZBkocJ2HxUv8sSyvkabUxySULZB40aNhmmg8HNi7hD6l6kyWn0zM/i1Za
         CZVLi/SuUi3bqWT5M884Q7Iyz/vM+DC7YVbz+M5Va9SrzjWriDPWwNeGKiuNkhdM3csD
         UyfHKISjYgoC8V4l7jPAafoHmcuho/Xaf4u3TsLM2IO7NwShn0iYHu7ZqCh6ULuzOm1m
         hXgQ==
X-Gm-Message-State: AC+VfDwFV+E0AbdKwp5hwHBXln0E+/7GA9MZu1aRBH9+o/O7xR967x6T
	ewcLHnBVvg/6m3jBH3SLbkdXfPrjSbmZMLEZVBI=
X-Google-Smtp-Source: ACHHUZ4e4PMxwa8DRZnrv5UrbgqQqYJYYCOqj88A9ApBw9lXlQnplX3gbcu2zUZEE5Xy9nAnvAZ+Zzdzvxdxby7dGpw=
X-Received: by 2002:a2e:998c:0:b0:2b1:a3ce:b709 with SMTP id
 w12-20020a2e998c000000b002b1a3ceb709mr6322603lji.39.1687181911415; Mon, 19
 Jun 2023 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230616193450.413366-1-iwona.winiarska@intel.com> <CAP6Zq1jK5y+UYDGgGmh+039pjF_mdyfy5p9m2UUsrGBNTn0v8Q@mail.gmail.com>
In-Reply-To: <CAP6Zq1jK5y+UYDGgGmh+039pjF_mdyfy5p9m2UUsrGBNTn0v8Q@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 19 Jun 2023 16:38:20 +0300
Message-ID: <CAP6Zq1h1if4hyubyh6N8EOdGOu+zp0qVUimF-9L2eXZ-QFAYjw@mail.gmail.com>
Subject: Re: [RFT PATCH 0/4] Add support for PECI Nuvoton
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: openbmc@lists.ozlabs.org, kfting <warp5tw@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

The PECI driver has been tested on the NPCM750 Olympus system.

Please let me know if you need anything else.

Best regards,

Tomer

On Sun, 18 Jun 2023 at 13:10, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Iwona,
>
> Thanks a lot for upstream Nuvoton PECI driver.
>
> We will test the driver in a day or two and let you know.
>
> Best regards,
>
> Tomer
>
> On Fri, 16 Jun 2023 at 22:35, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
> >
> > Hi!
> >
> > This series is based on patches that were sent by Tomer Maimon from
> > Nuvoton [1].
> > Similar to Aspeed driver, I removed vendor-specific properties that
> > were not used (as in, default values were used in all of the available
> > DTS files). If there is a use-case for such properties, they can be
> > added in a separate series.
> > I wasn't able to test it on a real hardware so I would like to ask for
> > help to test it on Nuvoton systems.
> >
> > Thanks
> > -Iwona
> >
> > [1] https://lore.kernel.org/openbmc/CAP6Zq1jnbQ8k9VEyf9WgVq5DRrEzf5V6kaYP30S7g9BV9jKtaQ@mail.gmail.com/
> >
> > Iwona Winiarska (2):
> >   ARM: dts: nuvoton: Add PECI controller node
> >   arm64: dts: nuvoton: Add PECI controller node
> >
> > Tomer Maimon (2):
> >   dt-bindings: Add bindings for peci-npcm
> >   peci: Add peci-npcm controller driver
> >
> >  .../devicetree/bindings/peci/peci-npcm.yaml   |  56 ++++
> >  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   9 +
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   9 +
> >  drivers/peci/controller/Kconfig               |  16 +
> >  drivers/peci/controller/Makefile              |   1 +
> >  drivers/peci/controller/peci-npcm.c           | 298 ++++++++++++++++++
> >  6 files changed, 389 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
> >  create mode 100644 drivers/peci/controller/peci-npcm.c
> >
> > --
> > 2.40.1
> >
