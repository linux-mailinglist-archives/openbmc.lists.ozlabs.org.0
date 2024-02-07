Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A430184C8ED
	for <lists+openbmc@lfdr.de>; Wed,  7 Feb 2024 11:47:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NDxYS0Xs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVGz948mQz3bsT
	for <lists+openbmc@lfdr.de>; Wed,  7 Feb 2024 21:47:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NDxYS0Xs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVGyY3R69z30ft
	for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2024 21:46:58 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-60406302a5eso5001407b3.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2024 02:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707302810; x=1707907610; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKj881Aaf4mYKxSOVReOB5rnt8T7gInv+xnCpX24PSM=;
        b=NDxYS0XsiHOSbECuCZehPe8U+EjddfiDM4QlezuUmePTBRAmkOuJeDgDnBDUsXQj3Z
         P2h37xnsw+rMGxA3Y5BxRNdWk8V1FbYsXJx6ns3Sr5QMLPCo2krN9E0FJyVFHxcHznZh
         /9NlJPkP5hwhsfaLLOfRpEWW3ON/GKuf/KlpXczTIpvAhoS1wOZjEY/Hg1kDdWv63izC
         NXM/RvD/5sMAvhbr9cB3s2h2h0AEtWSuD9YVGcIPvOCNMyiK/MSY0v6Iducd2ZH8dIdQ
         CuNY7Qv3Xxy/k0Qq9BeG32RfnLYq7Bey/SmcJpbsJ25CfvIcN6TSWZxiqkjqRQ+F2T9O
         tWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302810; x=1707907610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKj881Aaf4mYKxSOVReOB5rnt8T7gInv+xnCpX24PSM=;
        b=Bn2cg3436QU8SXKVj+PdT28ZZdzEPndquKs7NiTFzAdda2WmZVhoKwxZO/H0PmVI2Q
         qYPIUSNqyjNtiNhLi2+DwSBi+3FWPwFGw0GpHoYO4ehs32gxrdJPAZHCBXA62xwnTHcJ
         CK77XSWBXTGSXzDpuMkGj85o/LmTUWT1RuGery8OQTM6jS4PciPumwVAtI3q2AldZ87Q
         J4/vm73L2j33lgpUAVmvfnSAEJTrRvikQJ97gCGB6MbIW0Tr3hp0DO3sgSydS8SwRhRt
         94Tq1t0Pm0RxQ1VsUgqvR1TJoz2DYoQrQJFNRTcAga9xeKxWBgZV8dtXNc1m7p5pDcRe
         3hPA==
X-Gm-Message-State: AOJu0Ywayx19uTgQr75c+jIRx47FyNBIH/TXla1jRBuQi1Xpq8FK8FCs
	ifw+BZeUF4VFgadrFBn+cAMQpr1j3rraKIKwWV7Ecsly+2UsGRuyyrVs/He42AmOQJPRBk2RPub
	fctpX+/sKBpal1Jmr0KC7p8G713PdjeF/BiDK+g==
X-Google-Smtp-Source: AGHT+IFICaMWcFSHf+rMsrZpjqNCWw5NlgzTK1CiqqBvfuK2Ztc7Bl1sYVhPZ349FbFC6VpKk9kRIE5qv62ianruFtU=
X-Received: by 2002:a81:c709:0:b0:5ff:314a:99c with SMTP id
 m9-20020a81c709000000b005ff314a099cmr4376710ywi.5.1707302810126; Wed, 07 Feb
 2024 02:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:47:03 +0100
Message-ID: <CACRpkdb-F_UkO-taK2Cqt-OkqWaTy3mp+YwiXxE0uMFad=D6+w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Constify wpcm450_groups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 11, 2023 at 4:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no modifications are assumed for wpcm450_groups. Constify it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, thanks for reminding me, I must have missed it.

Yours,
Linus Walleij
