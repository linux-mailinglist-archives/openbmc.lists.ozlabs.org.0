Return-Path: <openbmc+bounces-98-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F326AC750F
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nx085qz2yqR;
	Thu, 29 May 2025 10:16:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748407360;
	cv=none; b=lp06DLgg3Q4Kp87y6yG3RUEDYgoS49PcSQ4xnzkCHdzytr7Db9hvobuG7FUO2movJx5dRD5ITXtlbS0bQ2disuSvC5uALN0DjSE0qmuaSomx52T7Xfs+A/JhP+XicuR4o8+s8T7PozKre18tetRu5PNsQMQB9dpv28XFElrfWlgSB1gfwKLiCqO3Bu+W6BOoy2aAigSuTSUFoPd9ItUBIw5mbqlhikJzILolBukgwQvTyqgNQX5q5olU5QbKquMA8REznsA1NXuDG4Qedp7sBOzbZW2kMk09ufOA0wrES5Gz6HWLNVctPaEwizCeYxxuG77kTmeOqcJF3EtVw39f4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748407360; c=relaxed/relaxed;
	bh=WKdIaa8Maem09e2r8/gXhNTUzjBO19cqMb+s9YDilRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hsg90gyeAKnQT3Tb7AkcSWn94jKYN3hCY84EKKntVs1yNGltTI7jK9s/KlLG7Eyv1exP4TA6O5jpHZhAU+wJT76cyp4NQ5WClrz5s4n4QVVwRWBdcxBcPiMvVsNeKymeZGNj4+12b2wjOEh18AnSp2Ip7LA8GOYbG/kF/L0kw1jJx71PLOxNoMVPqWps7H1mzYvMqFJM0UkMI9bJme3nBCZXKNeBcQ7Mi3ggrHodgMV5jbKCLqLA47W8mrv2S4BWiDwTlJP1HM/Uop3kkhB97RuhVf9V8xQYEMco1LOAXoqqChqJGfJMCMD16wD/ekjwGPo5JbIhPbePwMQyungNlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kj42/R+i; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=zhoubb.aaron@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kj42/R+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=zhoubb.aaron@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6cLQ1vfrz2xZV;
	Wed, 28 May 2025 14:42:37 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ace94273f0dso781071766b.3;
        Tue, 27 May 2025 21:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748407354; x=1749012154; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKdIaa8Maem09e2r8/gXhNTUzjBO19cqMb+s9YDilRk=;
        b=Kj42/R+irQ/qpJUfN10FD/Alp9kLpDTRSwbhKd/jNTXCix66apbu6nkRVQRTEd9vhn
         /rhUC+2QwkutitL/aTYJk4V36eAq0epWafiLk+1t2c2IYfLj+2u47SzIC/Yn5Fb8STpR
         efBS1vGhKzznTH396wrQpfElJYpo/mH1dLI/CD/ow57aRYI67oFP4OEqJeKaNZTZwPbM
         N59ANdjn8i9bKE8fIKTQGna6I0sMYa2zwHK/KFsD/Km2EzxMpPNTyWrhl/GEdPGE3qYw
         2ehn0p3mNvWhIcbUx7pDarFY2ioWBpF+WmgQORHuOBrUE6lk7KxDfZ9byr1Vp6RJMpWf
         zefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748407354; x=1749012154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKdIaa8Maem09e2r8/gXhNTUzjBO19cqMb+s9YDilRk=;
        b=TDQemBbGR0T0+FGjf7ZMcbYI+RYMkRc2cUWPYYbjJHg1PfFlJ/sfsRGzjrQmYbvScP
         KWD0KptP/WRpci9WLC/POYSG8kOHCFGYBDewRMzPzZiSbNG4Dw0PJYS2AshZZS6VQVzr
         UWICDzIq0n08mfr6OPYx26EG+jMNw9OppFkH7TXV3GLu5Jjg49wNEMvQMBXYeZPDhKJ5
         hE/rV93h9Abu/wzmWGbZsVPZmnZxEimF4OId7JHpDo5oLiipl8zEDIkpw7T/dK6Divvq
         5X0OJuf8KN03Y3dZsKQ595878B1d/kkG1L43h+UFnu5gtON5fLZ3whiuzyzif1JGtlkT
         fohw==
X-Forwarded-Encrypted: i=1; AJvYcCUHiTj6ijnn5xRjD+YsLxhUfrqCOvlRhuvBOM0qPBABbMO40qC/f6QtUZGerJPVt+2n4pe466bBdQ==@lists.ozlabs.org, AJvYcCW4WhSzeTnb+3ZJ4YoqkgGEBR9kJdorbLwkIy5abmZt49c2H38jQJN8PhALP7y51VXbDb4Saesgpf6odBg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUMrUPIs8tqL2crT7+ijLcYIcAfaDPJhEDHbt38AdJJ8NE1IQq
	mNp1LzlTY2dgGV08IUbr5De7w8MBbFAqb3OktR2s7cVwaUI41Y0SH8WvuuUtHUfnh35QRjCnKO4
	iIF5UP6l0ZM35z2ybOGqf17PVGsJGFAA=
X-Gm-Gg: ASbGnctL4Uag/cYcHBFQsiXz95iEkc5YtiZKcrQj0mZioSCdIkGTU7yl83gPmc+w8wf
	uPot3kDPZln61oUD32fsCn5aD/XJLnBEsGWKN3V3VYDZDVajXPJG0oDxMEBMytG85mguL3+Bryw
	P6Z1N+eVM/DaGsd0A5KHbLy12Gi/66/p/E
X-Google-Smtp-Source: AGHT+IGIknskN8t5Mo9Bx6fWIoVobETE5Dm+e4jPUV8dy20m2qOh347Ci6qwsLs/e3BB6jtvTCXy+Cj/Ej26l8dZAXQ=
X-Received: by 2002:a17:907:2ce5:b0:ad8:89f8:3f51 with SMTP id
 a640c23a62f3a-ad889f8419fmr552069066b.6.1748407354032; Tue, 27 May 2025
 21:42:34 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1747792905.git.zhoubinbin@loongson.cn> <dfc7e01a6134e421ae3aa8da3221f67d59706d0d.1747792905.git.zhoubinbin@loongson.cn>
 <753cd65ebf659972c8a33e5f8e579b9fa8738682.camel@codeconstruct.com.au>
In-Reply-To: <753cd65ebf659972c8a33e5f8e579b9fa8738682.camel@codeconstruct.com.au>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 28 May 2025 12:42:21 +0800
X-Gm-Features: AX0GCFvNqOzXkxY_eVqYydfapsa-dE3X-UyFZQRp7gfRCGdy1sKC6L7_7xZ-rCE
Message-ID: <CAMpQs4LchvbX5-1Gr_epq42DSdfj0uegdqaG2Vh=X2DULSbaWA@mail.gmail.com>
Subject: Re: [PATCH 18/34] mmc: sdhci-of-aspeed: Drop the use of sdhci_pltfm_free()
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew:

Thanks for your reply.

On Wed, May 28, 2025 at 8:44=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2025-05-26 at 14:06 +0800, Binbin Zhou wrote:
> > Since the devm_mmc_alloc_host() helper is already in
> > use,
>
> This doesn't appear to be true? aspeed_sdhci_probe() calls
> sdhci_pltfm_init(), and following that through eventually we call
> mmc_alloc_host() (the non-devm_ variant).
>
> That said, there are some error paths in aspeed_sdhci_probe() where we
> leak the object. Improving the code would be helpful, but my
> understanding is this patch isn't right.

Sorry, I have a different thought.
In the original code, there does seem to be a leakage of objects, for examp=
le:

pltfm_host->clk =3D devm_clk_get(&pdev->dev, NULL);
        if (IS_ERR(pltfm_host->clk))
                return PTR_ERR(pltfm_host->clk);

With this error path, we should goto err_pltfm_free;

Now, I have replaced mmc_alloc_host() with devm_mmc_alloc_host() in
Patch-1[1], so I don't think there will be any error path leakage of
objects.

[1]: https://lore.kernel.org/all/6fd5afb003982bb5edbf95f76b605686223730e0.1=
747792905.git.zhoubinbin@loongson.cn/
>
> Andrew

--=20
Thanks.
Binbin

