Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41F7B5B85
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 21:46:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=err3aSyV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzs0S53Nkz3vXx
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 06:46:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=err3aSyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzrzp6Ghkz2yD6
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 06:46:14 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ae388eb437so1840152b6e.0
        for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2023 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696275971; x=1696880771; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GnURQxCUhFf8f9trsE+6Mr8ThlATIx1PPpL0CygtXg=;
        b=err3aSyVvp8hWDD2k2ZtH9jorfHh7g/P+3jh2oivcr+o1SYJpG8xJYGSi0nM7MyrI1
         +P68wgp4AmSdY6AME3FlTrB4hBBbr7t6nla3Z0uvmHtQpJBapQjROba97E+U6Qzl/ODB
         +O1QwaCD4pZU5E3oDxiPzJ87/LTyHkhzsTcfh2N7bR0EWFPqXTAwQRPgV6Vrr+sHSutu
         7OAAuqF3CJzz+8cnxxOxGe8mMK+yTwFJue1D4SB4xbv2L9kO/aektEZbuRxZGFeXOOZm
         J1QcuFl7EPTsN0NM/Qg8t7WrygJzQ3V80Z/5vs1p0vHWUJEDs368lpxAiwQlYXtfvMP5
         xeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696275971; x=1696880771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GnURQxCUhFf8f9trsE+6Mr8ThlATIx1PPpL0CygtXg=;
        b=N9KC/erGCfJJNAZ2vHWnaEnw4opmE93NbEVFJvM4YestdSTG6HjrnzhK4NsLJLZ8D5
         oxJmX8WW4KQQ4yyvTVq16dut7xBNRQnJqCLV3FcmcaE4hEZ0U5Y2fGPeG8YpGEHDXTBO
         wTYlj3A5q7tcpeqjEtkWPTu8EJrBIQ7VOBLtFcsgxesaWG9PZzvnYZnJpupVZVRE2DIy
         GZK/3dxkIZerPQ9kG7qE5ij5/UHBlO2AzxsphM/KaPwCRW9ZzxvWmjLZeVkQBLcR9zIf
         yXDeEyxFx5QhMTdSlvYmeRCYoFR4PkHA45lbAmOsFmTA/9ncEJUVHC+75qmzYIt7UB4t
         529g==
X-Gm-Message-State: AOJu0YxUQrXVINaqFRSsxi3APTWGA+aaYghnfHNPtOxZcrKdwapMqgeA
	SF1DebsA3mB8jivxdO9dfkWKdwVUXV7FdqIDJX8=
X-Google-Smtp-Source: AGHT+IEr8FMRtJ/U2Bkgb7n7J5Gt5+hRUBnNy0fk5IKzNGivR4ggM0kr5ZOnDAYhX190DVJ8ACzk++3GTqcrVWpaK/w=
X-Received: by 2002:a05:6808:2a78:b0:3a8:6a40:7dc0 with SMTP id
 fu24-20020a0568082a7800b003a86a407dc0mr225924oib.18.1696275971480; Mon, 02
 Oct 2023 12:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231002194138.125349-1-tmaimon77@gmail.com> <20231002194138.125349-3-tmaimon77@gmail.com>
In-Reply-To: <20231002194138.125349-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Oct 2023 22:45:35 +0300
Message-ID: <CAHp75VfDcqTAVhZmo-q8v8c8TKwZUjQMr2-0RBarYDDJD1+TZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 2, 2023 at 10:41=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:
>
> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.

...

> +       pltfm_host->clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +       if (IS_ERR(pltfm_host->clk)) {
> +               ret =3D PTR_ERR(pltfm_host->clk);
> +               goto err_sdhci;
> +       }

...

> +err_sdhci_clk:
> +       clk_disable_unprepare(pltfm_host->clk);

Now this is leftover that leads to unbalanced reference counting.

--=20
With Best Regards,
Andy Shevchenko
