Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4B27E3EF
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 10:39:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1V6k0lbTzDqYL
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 18:39:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ss8bDq8y; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1V5g1PQRzDqTk
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:38:29 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id 197so517900lfo.11
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abOoDQJ0/sKiOBVIFY6wCFerTXB/Q9XBjrmQHnpcYh8=;
 b=Ss8bDq8yX/Ssw3M91BPR3cT0NQTIbu4s04flH1V3zjVAHyLShsXc8oXK+CcMds1Gkm
 0+7Ktr6f4ZbKsREon0Ur9pBGkGBGT0PBK8Xty9Pq39P/vfmAw+ZuAsI4JjrCWb00mGx3
 5G2YLmXkBEnzBYBOn9sqCSLs1IbMr0hlVw8M8SljDVyYWPtiGlKqbyIt9rSwjGAZHKXH
 rI2x6VeBkaE+M4EOPqsQpHK53mE54ICspP5h6m1DnMZudK6SL3R4b95E/hnjkgzqw8SU
 lGFTlMSkiFjyoYQSJ+Gi8NplEA2k03G+tshg70ntsG2PI9N0eEelS22ry92ZFo/atVnE
 90aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abOoDQJ0/sKiOBVIFY6wCFerTXB/Q9XBjrmQHnpcYh8=;
 b=R6tfu1gVplKNRaHLk68g5bbnhIXEWhcZExFoupntc6lRsoXvd8ZN1FQXVCP19Dqvov
 gNJ3ylLkOZXQ7fis0luPLSoPinqG8UvVhyVx6nmo4zUmBtJ6T+qGLAetSMn1OgUo6Q+0
 A1lqX2K2zoXxRcZOEqRMe+QeU7fRv3FRo09mWxLJDEIEf/m9buvH5Ic1cJslegbfIses
 fx81JDFlpAiTeXHBWN3nRmfitWRG1waF78DLacv+y0El7tM4FtX05U0O+mAH74YwhVCN
 L1d2T+bq9N+JI4IMUjLrqwv/chOK56Ym/+I0oGWJQPhLLbdsIJvBaXjjeRFq2lno5YJW
 ip3A==
X-Gm-Message-State: AOAM533Gx3TQmOPlf9GnBMckFhcTy7nvt35gYxi0X+5QJLtZFcyHY1DS
 YWr/xUW0taJvHUt8BBghNarPcZuD0encnUyFki/hgA==
X-Google-Smtp-Source: ABdhPJwbE0nuDuIrHeUYVu6c/TVrY5zaEkNuDBuZ75a1nBDcadvmYts3OOwWTPEUNh69LppZiaJfcwW4p7jmARUJlGQ=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr466913lfb.585.1601455104600;
 Wed, 30 Sep 2020 01:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200926202342.31014-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200926202342.31014-1-rikard.falkeborn@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 10:38:13 +0200
Message-ID: <CACRpkdY5m25aFoYqWq7jQNtAAD++0DEmKKk0ztW8tX62=UCnEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: npcm7xx: Constify static ops structs
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Sep 26, 2020 at 10:23 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:

> The only usage of these structs is to assign their address to various
> ops fields in the pinctrl_desc struct, which are const pointers. Make
> them const to allow the compiler to put them in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Patch applied.

Yours,
Linus Walleij
