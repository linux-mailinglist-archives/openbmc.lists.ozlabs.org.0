Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC757345C7
	for <lists+openbmc@lfdr.de>; Sun, 18 Jun 2023 12:11:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nDX7yVuW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkTF31DQMz3bTW
	for <lists+openbmc@lfdr.de>; Sun, 18 Jun 2023 20:11:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nDX7yVuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkTDN6Srpz3025
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2023 20:10:26 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b466073e19so15135771fa.1
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2023 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687083021; x=1689675021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+QzP8d8NJeIsG+jeIA47bTuJMthoGf5/u6Pa47cKpHc=;
        b=nDX7yVuWZaw3FYSuqFv8BLNXfX9LF02zBfMPthJojKBhQsn//5k5Z6ammhBsd7ClE2
         PsEPO1vHyMsbavpKW0VHN+16jIWpRHf9rbHtuNkHNjDyFkudLsITCmjoSOoY/kiFCEjC
         DS9RM7oRjRtB58VtO109dTaYcQboeCxWzUGEPDwp14arsBBpGmKxpiTcyP1W1cyR33pH
         /5ZymNSxF096UMNriTmFLmZr3VE26/K3/QUSIds0ErIYcy/aJWG8PRReO+Y8+yIJ46iZ
         5ycRbtJbMcIBmGqdO0YPmfSYrEENrOU05PpgKP64hgLxzUoGbiH/ujHfdmI+Q42gy9fQ
         S6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687083021; x=1689675021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzP8d8NJeIsG+jeIA47bTuJMthoGf5/u6Pa47cKpHc=;
        b=e3G6vrb9bfL/lHoltG47GW04Uz/7lSxndh8i++KOSnKu29x//6tC5m/vxErAuASr5u
         0AnL5utJ9JV9W44ZyveZcVbBLuou/HSerMYpBFeYO/E+7tjnG6A6cgvx38w0FbzXM8Fv
         zTV4+ndWUbrIwA7EKci8rFBWnsDHACnWp/P2Uf1UtbFkcQ12g+xM2ksbjAbNMzhRiJGj
         XK8OXom4kQ1TKMQRRfvsIb3V8gC1RYpX2rzbst4ZqZUkrRC+PkJ0rKpBHDzYlz9lRoZU
         /JoyLmzEfMe73mC7Q9LTJWayXVKcS/y3h2m2i3oWNuRmXwzpHivdCQ2NZiXZAqe0FsrC
         IpSg==
X-Gm-Message-State: AC+VfDyxYDSyAMJM85VhWRJBYds8+HH49Ka2Ta3ZgjwoZrlbFJSLFmk5
	Ad0VXvifBqBrs2y82Vpy+YqA3OkHDWbGqydqcr4=
X-Google-Smtp-Source: ACHHUZ7s3ft/YYFH64F+Nq72ZuH4q9KSab94WY/oX20U9TxpoL52JGsySmYRA7KtMLefZS8rOqzeF7Y4SZvvBe7xQyE=
X-Received: by 2002:a2e:9846:0:b0:2b4:737c:e316 with SMTP id
 e6-20020a2e9846000000b002b4737ce316mr599751ljj.14.1687083020932; Sun, 18 Jun
 2023 03:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
In-Reply-To: <20230616193450.413366-1-iwona.winiarska@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 18 Jun 2023 13:10:09 +0300
Message-ID: <CAP6Zq1jK5y+UYDGgGmh+039pjF_mdyfy5p9m2UUsrGBNTn0v8Q@mail.gmail.com>
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

Thanks a lot for upstream Nuvoton PECI driver.

We will test the driver in a day or two and let you know.

Best regards,

Tomer

On Fri, 16 Jun 2023 at 22:35, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> Hi!
>
> This series is based on patches that were sent by Tomer Maimon from
> Nuvoton [1].
> Similar to Aspeed driver, I removed vendor-specific properties that
> were not used (as in, default values were used in all of the available
> DTS files). If there is a use-case for such properties, they can be
> added in a separate series.
> I wasn't able to test it on a real hardware so I would like to ask for
> help to test it on Nuvoton systems.
>
> Thanks
> -Iwona
>
> [1] https://lore.kernel.org/openbmc/CAP6Zq1jnbQ8k9VEyf9WgVq5DRrEzf5V6kaYP30S7g9BV9jKtaQ@mail.gmail.com/
>
> Iwona Winiarska (2):
>   ARM: dts: nuvoton: Add PECI controller node
>   arm64: dts: nuvoton: Add PECI controller node
>
> Tomer Maimon (2):
>   dt-bindings: Add bindings for peci-npcm
>   peci: Add peci-npcm controller driver
>
>  .../devicetree/bindings/peci/peci-npcm.yaml   |  56 ++++
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   9 +
>  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   9 +
>  drivers/peci/controller/Kconfig               |  16 +
>  drivers/peci/controller/Makefile              |   1 +
>  drivers/peci/controller/peci-npcm.c           | 298 ++++++++++++++++++
>  6 files changed, 389 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
>  create mode 100644 drivers/peci/controller/peci-npcm.c
>
> --
> 2.40.1
>
