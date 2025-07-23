Return-Path: <openbmc+bounces-396-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4EB0F117
	for <lists+openbmc@lfdr.de>; Wed, 23 Jul 2025 13:23:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnBb65py5z3bkT;
	Wed, 23 Jul 2025 21:23:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753269810;
	cv=none; b=Yk+Wg5csRFFCXCfZWN0Bs4VEhP0BfLKSDbMlc4j9URKy0jsAmlZfqjeL1yLr2WteRP+ks92mar5ikRevT0m/buH+d2cCUstUinKi+9ugW+Vq9zxi9XDz+Kf2AWsjLm4hOEMo1HPLmydBUc/thd01EFir+mvj8GS7zRtYeeyJMy4ZTAF476m+2pAiQq6GouxNmfp1lNcnTATweLLWp81lI1Ez10ScGYaZUfrj4Zoa7ySlFmUyq1Y8ImgVT3YLAL/dnQyukaoZE9MZ7gSDH6IobVe7/mpCgmgLmKmP8VqBLiaXyuyCz7Ke25VZh0BdL19aI/IdPwPXoejbnB33zHm9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753269810; c=relaxed/relaxed;
	bh=X1YmU1ykvA77GIulXJEMJLdju3jM88FFVo/Kazht9VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUvbiVcLhsE7l9CoS0JzMogDBLw2Jkt+kDwTuxiUTClcnkzbyExW69XaOB1k4TNgh1UC8PkwcuHx+TfgFrxZj5CxSaH15nrNUWGj6SoI/7RXPe73stYkCP9eoSaTdXmIrLFuSnlwKVvCKVx5g1yjgC3D/JjPvleRKM/wR9kwwfPAJvNpG6o2Thg60dCiEzSXW14WaJMHDjcrMll6wNF45WX4njfXyYiJfKaY07Np5BiHjNVaLbtQ/QDaFruogYyWM/J/EMLZNqwtuRrtvvGIyAUoei1u7PYZIJAzIk/EiE2O6/UY1bZJCJLnB8Ras16X99HywDYB0KLfWs+FQ9qAew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YsqI9paK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YsqI9paK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnBb52Dnnz3bby
	for <openbmc@lists.ozlabs.org>; Wed, 23 Jul 2025 21:23:28 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-32f144d0db8so5438481fa.0
        for <openbmc@lists.ozlabs.org>; Wed, 23 Jul 2025 04:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753269803; x=1753874603; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1YmU1ykvA77GIulXJEMJLdju3jM88FFVo/Kazht9VA=;
        b=YsqI9paKjQaFRdY9FzadOsfGbtc8BVDpIFYLKtnJlLNo+7euDndLZV2QB/2l9KMmVN
         77tPtNmQyBSzbFUcsSi1iAhcvZfYGlZIHzxfGjJu0VWoZQCxfgeYpFP804kRnVB2CdVv
         xp52kHhEJ2vXSZFLAAJsLQGFQxIy7Ot2H6khXC4ARhlI8O/NCoL/DOVG9hvgfBpqj4xt
         s4aR+FdG3gjFOXwKrqsJushysLkwmYPSmuO/N8zrYXAh3OfE9IbJMpyln9JmvpngO9zp
         lXYicuYLMvIXlYWQf2nmszz6SkN7IY2tXjJ92egfGnV4zFIApX8AYg0WDMthnLvsyccU
         30Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269803; x=1753874603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1YmU1ykvA77GIulXJEMJLdju3jM88FFVo/Kazht9VA=;
        b=kvT8CudPkKFHD2AaxJVN71ZsyZsFjVO+fJZQKW2yjGnCp6SqhsAPnmTS2bh/JXCYKw
         xDDuQi6PekA8MTzgTK/Q7rN6PbiSQ2apTh7JtSSAz9zcYVolYCpztq5J1vCapV1YUqlA
         +C7mqmmo2uvJ2AzDOWRNXEjDGSw4pBlbEkKNH6b+6su1IrF+UrLtG6MMFlTH/5NcuYSu
         xYazbAXkv2fxkrw2qWB55QC9uz2TtnXxOdNaM9NTthlVwTIyMabSD7hbh67gt9biJDVf
         8VBGU1wh+gye/HzfyBTwNX0DULOlRBdKCAzVmTq9oMTKyWYhF+JmsnuEzm3x6Lkf95g6
         7p5w==
X-Forwarded-Encrypted: i=1; AJvYcCX6xdDWDADan0XBj+YuR+PpcsC6wU1OWv7SqvI/7n4vBSlPxb1SDkSatc7w+xdx9RrHUwAdTCrk@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPJMPG1e9Wg3cnQ54KKkzIstbcMXLPz8YPzkmXGWYAuYxCY0n2
	plsHfpGFjbBMXA86pdIiQL4AH4F3PfHfZH7JTedARHgCDbawzdvsD5CknHVrxnz5Y3Y3TgVwyoM
	mHcZQYtnYU2KtPbbmTmDiBUOJpC28Yydur/ZzcqdZzA==
X-Gm-Gg: ASbGncuULg+4OSUsDDEf8PR5KjrE4Vm9e+//EZRlz8zRgzZwDlOL8FqphGFFZMNCvLX
	LFRjE0x+uDglKLvI2WRv46rt1j5yhMjyrnyc4ElZYgDG6pELnfy31uJ8xlUvXYjcgm/FHBIkNPq
	/KyTlOm6T+BoVzV3HcTnz81ofr39xzZ3ty1o+Eik8yiRXMP+FWrqCiuR1KIqJWA4E8NRAYbWHOD
	IPF1hA=
X-Google-Smtp-Source: AGHT+IGJe5Uxr9HPFMmzv6FKaMGGq0DeXYb8MEs6LCeEdkH2Ux3eyASfDB2156qvlMRtXLw+FwseABeguK4wIAj2U48=
X-Received: by 2002:a2e:bc1c:0:b0:32b:4441:e1d0 with SMTP id
 38308e7fff4ca-330dfb33727mr8322611fa.6.1753269802839; Wed, 23 Jul 2025
 04:23:22 -0700 (PDT)
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
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com> <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
In-Reply-To: <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:23:11 +0200
X-Gm-Features: Ac12FXzMES-g3RTrhXb0FNTMk2mTyN5VcSrw3I_gOJGbbpbB-aPDVFXKwi-6bIg
Message-ID: <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, p.zabel@pengutronix.de, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 5:43=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
> to output.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

This patch 7/10 applied to the pinctrl tree, why not.

Yours,
Linus Walleij

