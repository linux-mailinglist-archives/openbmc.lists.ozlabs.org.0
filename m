Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E5822B49
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 11:26:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fJYJcx0K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4m9T0fGHz3bpG
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 21:26:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fJYJcx0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4m8v57x7z3039
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 21:26:21 +1100 (AEDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7cc7bae27b5so2267428241.2
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jan 2024 02:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704277579; x=1704882379; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1d7qdkI7VcKd65R+llbhREgSlk8bC5HVMhsfJ3f5O8Q=;
        b=fJYJcx0Kl+X5KJhoOTmeFhusvjLfkRMSQCe829MtIJ8W+Ne0/bS8p3xyR7cMTpcrcr
         hvYRnHvrF/Am/7NJzEo6/RFcU5B56kZjbzvSkzuE0TgMMFXFthKBgLgRUQUFqo9aEcPw
         S7qeDKYJFtWk2zQxhNIdoF1Dx3zyfi/gdrosIO1Cmp87g0a5R80I03Re1EcRWDEZf7VB
         dmRjRRkGeqy2nuH/yz1MSotEgQF0wAJ11JeSfnK+BO5NFDYOgPgJ0v80tRmB3Rn7le2Q
         JnyCDxIg4a8LgdKFrRJr2lG4oASbOYbV5Qw45jH2tyWVrPOuPF52z2AnK5LJeTHA2E68
         pn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704277579; x=1704882379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d7qdkI7VcKd65R+llbhREgSlk8bC5HVMhsfJ3f5O8Q=;
        b=kXhI62+zf/wCBsizbV2KWcKBCfnTqo27dFPyMVuXFniUy36/QMpKc8kbkexrSxu5SG
         Ka4Q0gc8cOljjPkgebKJJP1rJ/16GeK3tibLDSZqD0h9UHbunroELJrC+WNGMNpBYS0E
         DoGSYpWSpeFr28wBkKJyOMRKb1iQU2fZM+eZoKAh+A8iltBP0wAYC50gn/mPJn7D4YWL
         ytyRDeAzdA9tWdgL6IcGbFDoF0WVO3t1Rd1vOWWwi2bzuJq3U9xMMlDgQlZwCTdnqNM7
         AR+OjBPWH6bNss+H7VZcS3y8ZiEdMtff3o4LlBIkY4d6il2Bo0RNSNjmqeDu0Sq5Q59W
         eZVA==
X-Gm-Message-State: AOJu0YxBMQcxb40hCiylxfjcVp5oLRM52Ieu4luhKODUmmMEnWBP3xbE
	ZvQFj68fOHFG0ixxwWE6k4zOPmo9tiE3sTBPV1Svz/JOsZmfVA==
X-Google-Smtp-Source: AGHT+IE5jAGVmqMJmEEUn9XlR3Ju9xjVR+lwzAqo9Xfbl9h69dD5XR7wi3AVa2oOSBEa2fbNaqf2DaS3Lpcd+UAX4Yo=
X-Received: by 2002:a05:6102:2d05:b0:466:fd31:def8 with SMTP id
 ih5-20020a0561022d0500b00466fd31def8mr7847832vsb.55.1704277578749; Wed, 03
 Jan 2024 02:26:18 -0800 (PST)
MIME-Version: 1.0
References: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
In-Reply-To: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jan 2024 11:26:07 +0100
Message-ID: <CAMRc=McNDMBXebq_KC50F4XaXrFTCw6+GQqNmhbzPQ=2oGpLzQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Add Nuvoton NPCM SGPIO feature
To: jim.t90615@gmail.com
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
Cc: andy@kernel.org, KWLIU@nuvoton.com, conor+dt@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 29, 2023 at 8:45=E2=80=AFAM <jim.t90615@gmail.com> wrote:
>
> From: Jim Liu <JJLIU0@nuvoton.com>
>
> This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
> Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
> and parallel to serial IC (HC165), and use APB3 clock to control it.
> This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
> NPCM7xx/NPCM8xx have two sgpio module each module can support up
> to 64 output pins,and up to 64 input pin, the pin is only for GPI or GPO.
>
> Jim Liu (3):
>   dt-bindings: gpio: add NPCM sgpio driver bindings
>   arm: dts: nuvoton: npcm: Add sgpio feature
>   gpio: nuvoton: Add Nuvoton NPCM sgpio driver
>
>  .../bindings/gpio/nuvoton,sgpio.yaml          |  87 +++
>  .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  24 +
>  drivers/gpio/Kconfig                          |   7 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-npcm-sgpio.c                | 612 ++++++++++++++++++
>  5 files changed, 731 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.=
yaml
>  create mode 100644 drivers/gpio/gpio-npcm-sgpio.c
>
> --
> 2.25.1
>

Applied patches 1 and 3.

Bart
