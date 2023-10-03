Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50B7B66C3
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 12:50:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V516OOTX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0F3g5w0tz3cBV
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 21:50:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V516OOTX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0F3215mkz3c1Q
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 21:50:20 +1100 (AEDT)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-57e4459aa29so363395eaf.0
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696330216; x=1696935016; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/3GVTu0afK2EM7EWOS3wgoT181o6D5pcbv78as8HE0=;
        b=V516OOTXyYduwXvpzCiO7UwxTt96vMQubNkXwl3ApUYs/Og3cn3yJJeyRVaIE9QqA/
         7RfO7IHak8prcmASNC8liitTUyzBjwTSYf0CeDd+IMtjto2QLJty/+/NxzzSQb1MBVUl
         Yonq9IVwGbyvISJV+zcCnZipM0ao6+F6RmP/IA0ERWFhag16ZQ9G2FZQG5XIy+gIT+gh
         0Rc1WjGkMQ4dkf4C/2TFizMeSebM66/pJZ2Aevf8qYerhrjTVZ3GBa8tNynhE4V9AXWU
         w6KMkdfHFlRHPS7pCCIeLW2/zTVlZgDNzgyh+fgckxceP6rSu+AVLNDsInSit7AETqZn
         V/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696330216; x=1696935016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/3GVTu0afK2EM7EWOS3wgoT181o6D5pcbv78as8HE0=;
        b=kZFV0HMvxaLTbObNrhYV9CGf/jnhKc8GjYSNrDiGywUqWajo3oc/jRAlbrHGRMZL7a
         oouHB0I1w45DEUmfvBL/gkll4LVrNsKZ1DMRzXPLO7qhHI2CoBCgk7Jg/joapHeh3eWM
         CWeTPpPDWYdrAwcWARVyuPMRxqbx5zT7u64UBTNXHlZxIu5s4NUxXc546xgzKg2M9owE
         gNx/4f2jEhsRtBdEpuJ1EmNcLNKoAPmjCksXQbiAPkVcFfIRpCHyWBqCfXh9HqrkyDLC
         /rxytY7Fs0OilS/U9UDjHNs7nadZU76sIVsBbD9Hm+5nLTBZAQxcNnNpj5BD+lFF1NES
         sl0g==
X-Gm-Message-State: AOJu0YzDG0T4Cf9nZqG7yg9KM5ScZXy8bpQdwsCCMVJuy5c/qZWFsEAh
	0FGPCkLX8FepDvuL+4aOo6TW9Gt9xmVsOELUbP4=
X-Google-Smtp-Source: AGHT+IGjvqSlP6GSpZt/GEk0OxELQYGIOGpISg+QgFtTkQ4ofCPdetgEL+fwI8pU6PjrCiy+Yiy/kvCap1plQHY20rE=
X-Received: by 2002:a4a:bc94:0:b0:576:bbf6:8a8e with SMTP id
 m20-20020a4abc94000000b00576bbf68a8emr1237644oop.2.1696330216245; Tue, 03 Oct
 2023 03:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231002200610.129799-1-tmaimon77@gmail.com> <20231002200610.129799-3-tmaimon77@gmail.com>
In-Reply-To: <20231002200610.129799-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Oct 2023 13:49:40 +0300
Message-ID: <CAHp75VdjB6wqeezL_UotQj-65HKb83wYh4hfA=PPiooRN0QX8Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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

On Mon, Oct 2, 2023 at 11:06=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:
>
> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...

> +static const struct of_device_id npcm_sdhci_of_match[] =3D {
> +       { .compatible =3D "nuvoton,npcm750-sdhci", .data =3D &npcm7xx_sdh=
ci_pdata, },
> +       { .compatible =3D "nuvoton,npcm845-sdhci", .data =3D &npcm8xx_sdh=
ci_pdata, },

Only in case when you need a new version, you may remove the inner
trailing commas,
no  need to do this right now.

> +       { }
> +};

--=20
With Best Regards,
Andy Shevchenko
