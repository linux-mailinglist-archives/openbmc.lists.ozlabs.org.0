Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F47D4BFE
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 11:25:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JOQt5dB4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF69M2SKlz3cF1
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 20:25:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JOQt5dB4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF68k5x63z2xZG
	for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 20:24:52 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d9ad90e1038so3887644276.3
        for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698139488; x=1698744288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvtw3R4g4yrWaCPe3OnX3OGqAz4Ysoana75anOWAYR4=;
        b=JOQt5dB4ZL2BDz/1pegFsIuOVwPDgjNVkMqiUwvDG55lw+gpECbqXmyqyObNhYtcjc
         L3Nt2drMP9qpJ+BaWmLQpEN0q8Eq6SKhXJYjBTsv9ji2zNyu4vEW+kb2/L8hHx/eQDeq
         A4H6iQFNDt5Zdp16mWHG5fdH5dGP+m0Lqrjq77T5T3KZSX2R9A3jDcAdktwDzjDxNqUm
         NwcDM186RHMUgAYB8bxvHnPGv5IsGv8IhRQi66QJp+MmCgb1iHGTJwm+RjROCPwJWdEo
         o2M6klqG9LmcvP7RQBPMNikOQ6Q/sqmdVtiegJgySlyyTpib77/OweRwIhV9X3uYlAQj
         xfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698139488; x=1698744288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvtw3R4g4yrWaCPe3OnX3OGqAz4Ysoana75anOWAYR4=;
        b=ilsYE0cGC0294IbY0u52Obmwxrs1Tgzd1JnESetX439E46qhwOkteD2qHM6ibODzus
         HmuSu3ZLgSrjnfjsJrTwOGB0wq5GWEN07RV1xu0v7JxJ1/K4gAfDxBz1JFhkehfZQdoC
         4CiqpWPoX6jYn1RjUnauIN/waiCYdRf58ihePHvDSAjMqOU1nIgwXovMnbSew3yryUNn
         aBtAG9JGVnDXh6Dfy8A0fD8aGqmLMRMgHErOythL8KR2j3d7ZSw5vj8ojd+Ld9w1LN/0
         sE/EzHnss3jTQR2ubC9VQgvj117C5PFmknUdFZGOxZx9MkLgRbyTYQXvVGD0HAUNUQ69
         MXeQ==
X-Gm-Message-State: AOJu0Yw5kjNxjPvM7DmKNDLvh0+RET14IlFRTrIm9/Ig1U5VTNfZYFvO
	KX2M3D5QdCrGNtAKqIbphPRdHPEKa6LJzSXuk6jagw==
X-Google-Smtp-Source: AGHT+IEjjXEh1q5UaxdtvCQj9zoNGBvaRwRDI5Q+oryObRZl50AcnXsTDbsRJJ5cG/pHer6xoQElF+sLHgofyO9u4cg=
X-Received: by 2002:a25:cf14:0:b0:d9b:f161:5fce with SMTP id
 f20-20020a25cf14000000b00d9bf1615fcemr11908547ybg.63.1698139488699; Tue, 24
 Oct 2023 02:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231024090631.3359592-1-jim.t90615@gmail.com> <20231024090631.3359592-2-jim.t90615@gmail.com>
In-Reply-To: <20231024090631.3359592-2-jim.t90615@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Oct 2023 11:24:36 +0200
Message-ID: <CACRpkdZ_Xkw-rRL4YPQxP8Wp00SL=k5W=S1X4bdEpfmMedeXdg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 24, 2023 at 11:07=E2=80=AFAM Jim Liu <jim.t90615@gmail.com> wro=
te:


> Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver
>
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>

This looks fair to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
