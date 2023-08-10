Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804C77721A
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 10:07:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gzmkYeW+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLzzg72lZz3cG1
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 18:07:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gzmkYeW+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLzz50QrXz2yts
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 18:06:38 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so560767276.2
        for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 01:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691654795; x=1692259595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q9pMCSuL9vESktwMqE858tVHd35r/KvFWuSuynvaw0=;
        b=gzmkYeW+DoSxNOhF5bU9z91nkG8W3e2vRMcTUaJDvx7JwwfLx5rbKDXJaR/NTQ0OEC
         HOPJHj9DohyYtCIY6K1RPD6oOAyQm3yA/NFcBaBGRaVPXESNmHZCb9iOEW24oVTl0JPd
         wT2ka2wksrD7wiVh77r/pTMtt8NUrvEdHJ4fheJOI5TvnfRffeY46BGvpJjIO5yfn+TK
         jQ5lCzygVnMSs+Zm2rNkw7KtWoE+FJsUoVppvqGuCw8kbyzORX8kqQMP2hBPlG0lbXMN
         OnzHtywtPeqzpNhlVWBCiVsxvBOtsYBE5I5MkpOa82j1CoApylwwvX6uXBdm7U9IGhma
         yTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691654795; x=1692259595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Q9pMCSuL9vESktwMqE858tVHd35r/KvFWuSuynvaw0=;
        b=b+yOBYRH8zfSDXBALgB9A6S6v59+5Gn8FKzjuGivcQEnrdJWDjgE7Et7dX3fCxJrd8
         JM27QOrkowTTcza4k5cH+UiJyK6kjHwGpH5bad9gAWpQjmnjP2L45/DBJWYXtLEnaakP
         AfR+g5TdHblqKXZWOpM9/kQ91ewqkgc9WXCakTs8xR3pNyckMRLqPQIaB7Lid/eUE/4t
         VZBNM2/K7a2E9ijDxdnNqfRx2DpNbS6cb9KG6ljxTc4C/C+oWSl/rLmXImBYpluBgh/f
         6sXe4BI+c/wtkBV78OnZy25TsW21g06/EzGXnsp0QaDEJQzpIKEqdVLu8cC1TIBgKtSm
         ILsw==
X-Gm-Message-State: AOJu0YzvFxylkB+6vCL/0az/Ame/ORbzWj/63JRJ3bqqQcRWnkdGv1KZ
	D3SkfQ1cug9z/TuRCqZbSB22ec4YFZlcJ7Q5V+kZ8A==
X-Google-Smtp-Source: AGHT+IEovomRK+kWYS3QSvXc1niAj9s+9GizN+e7dQ7c1g8YM/QDhcqBJqkVb1A6lv+dItHlSEOtTwsaEPVqxh1Pd90=
X-Received: by 2002:a25:2d02:0:b0:d4c:68e5:5570 with SMTP id
 t2-20020a252d02000000b00d4c68e55570mr1924983ybt.48.1691654795698; Thu, 10 Aug
 2023 01:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230801111712.45653-1-tmaimon77@gmail.com>
In-Reply-To: <20230801111712.45653-1-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:06:24 +0200
Message-ID: <CACRpkdbqqUhUf=KYqW0+439Lijy9mCdJ3Pszwrj6aRtbzH0AOA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] pinctrl: nuvoton: add pinmux and GPIO driver for NPCM8XX
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, zhengbin13@huawei.com, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 1, 2023 at 1:17=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> w=
rote:

> This patch set adds pinmux and GPIO controller for the Arbel NPCM8XX
> Baseboard Management Controller (BMC).
>
> Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
> pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
> period time.
>
> Arbel BMC NPCM8XX Pinmux functions accessible only for pin groups
> and pin configuration parameters available only for individual pins.
>
> Arbel BMC NPCM8XX has eight identical GPIO modules,
> each module has 32 GPIO ports.
>
> Most of the GPIO ports are multiplexed with other system functions.
>
> The NPCM8XX pinctrl and GPIO driver were tested on NPCM845 evaluation boa=
rd.
>
> Addressed comments from:
>  - Rob Herring: https://www.spinics.net/lists/kernel/msg4881522.html
>  - Kernel test robot
>
> Changes since version 4:
> - Pin controller driver
>         - Modify DS definition.

The driver sure looks good, I'm just waiting for the DT maintainers to
ACK the bindings then I will apply this.

Yours,
Linus Walleij
