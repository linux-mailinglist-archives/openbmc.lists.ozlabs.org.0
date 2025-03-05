Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1FA50F39
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:55:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SXR3NRvz3g60
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::830"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741215040;
	cv=none; b=VlamiaitLQosDukOC/jtq2EkJOihKM5TbCVcr0FYxi7WtewtuN20rVPW/zFYYDUJ5YJNyktKxjK15Uz5znNYhbKkSx5UdSHpFHzGYsoAMYdpa/HlW8fioSrenSo6rP6sEQ//WqaVlPAPa67h+A9Z5+MhjlXNUVWR7fvSojOxmdiD/AoAUnFerI+4ncbNIGXSVEqlumlt/4dIzWEPZzo6O+bac9ePD6TN4w2QuH2bp2EOkDK2IVFGnpStCnCWGV7+IbgatEEZDfIgz1YidHAihnk6zBbqdS7D4fz4b/ofDJVNCCJtzSVKJnRxZydXNRCRrEwarjqPfM1to3BmjBR6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741215040; c=relaxed/relaxed;
	bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiNMrEGl33JdDI8k+QD4+H+7TowAD7GlPnwoYV9UwVGNpw/iGK2hs84q/oQvHdLhqfpWZOnrXozRD9nIowTSf6yoDbAgI0RZ9SXlwX2Oz8O0MH3MvhtrYOzKXAskqqRATtXqasBYnknlCWlsGasePj+0r00GfFho3HPNOOH5zkPh0aA4Scd0tqtATwRotejk8lNYYsng2U4jv6fpIjxeQ6Gxxn3pi5835PUZ2GhqZ4TD+h+8lQrA//qnoWMtJutj9Yg5Jk2J6yWWnFtzD2hpPXIKi9rzauCCo8hlx/Bf7wtNg/BZomY729ShGgxr0LIcLMPHOdPaOKQtLsnK28lAnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+hwXj48; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=jwerner@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+hwXj48;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=jwerner@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7SSZ5NbZz3bnx
	for <openbmc@lists.ozlabs.org>; Thu,  6 Mar 2025 09:50:37 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-474e1b8c935so99031cf.0
        for <openbmc@lists.ozlabs.org>; Wed, 05 Mar 2025 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=K+hwXj48eQmG3aC0lSG16Jzat9DtBPudHMtB0/HSU/zpXFs3sVNpHqB8SmcFH8pSZP
         ZLykDvPpUo+T9RU6DvU7nnlBRsog+G55koFYs4Ltw8rk2JqJe6CGZcY0LDu1qWZ0TphG
         WQlGo6NIN0syTjdlWNsrzhLri7M+sfKqzDVmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=CJrf85nxhoLrA1Vc4X01EkqF6UJ9+HTcMY3opSWHAKOx9bwbGpDJgrgtp07VfHP0qq
         ix/mxrK8RHLlezTqrfq+F4zdxslJ4i8ucLzPXAhTRL/Y5gV+r6vbkpe6nvYE1YXaMfmZ
         Z8lqPimF+zZL7nHFqX1CnUHFOzvWS704520PRfUWGOl8jgqiaR7FtM3Dm3kLsdnE0bG6
         +d1wL9Hk7QVnuLNn+gvyBSMQkBvDiRBkZbNaxPWRURqps2Vo7RRD/aJSwg+Nj3KwTRh4
         MW7xR1nOK/TmnDzi4r+TWc2duMoLmZShxeXXcED9Xbo12xnhWiCgP1aNYLoWGW9PLADc
         1ruw==
X-Forwarded-Encrypted: i=1; AJvYcCVgxuTMt/ohg7J9xo5gP+OYFl945t6GEWOmN7ziAPqBcF7p2nRTnLRV7Sw3Qf0qGXvpzccPxKxF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPPZuKSqW8SeEwW0KT53aPAm2TyV75Imy0lKS/YxgFZUvEY6kS
	4524pYRvyqvx3HwU05zYt5dpNgLoSzmcy5ln2eJLtBMI/6de+mXsx7FpZ71NCkJmojvmLW7klL5
	Z7Cmk9R8QH3H5cdhJ3G/HOM/9ziGAGTT1wb3X
X-Gm-Gg: ASbGnctaB+edEMRSFThyRAPeMudb5BheICwkuUQe8QwImWFQq6tTT/bRFDBf2J1d4y1
	j+CHWOebx91RctjZJmVMwkebVpZi7wJk/VtHTAUkBD+TxQs99UGqPKVW2rE9KYHmkDQ9uo/a9mn
	7r6F9U1juS33a/MpVRr00z1Djia8zEDNYl60RVYY2JiO0oD9ECg3oRzWdP+Tc=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: imx@lists.linux.dev, mwalle@kernel.org, tmaimon77@gmail.com, hayashi.kunihiko@socionext.com, alexander.usyskin@intel.com, tali.perry1@gmail.com, paul@crapouillou.net, daniel@thingy.jp, patches@opensource.cirrus.com, christophe.leroy@csgroup.eu, festevam@gmail.com, kabel@kernel.org, chrome-platform@lists.linux.dev, maddy@linux.ibm.com, benjaminfair@google.com, lma@chromium.org, mpe@ellerman.id.au, openbmc@lists.ozlabs.org, krzk@kernel.org, evanbenn@chromium.org, linux-mips@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, mazziesaccount@gmail.com, s.hauer@pengutronix.de, naveen@kernel.org, npiggin@gmail.com, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, wim@linux-watchdog.org, bleung@chromium.org, linux-arm-kernel@lists.infradead.org, andy@kernel.org, support.opensource@diasemi.com, andreas.werner@men.de, avifishman70@gmail.com, thomas.richard@bootlin.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de, venture@google.com, jwerner@chromium.org, romain.perier@gmail.com, shawnguo@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.
