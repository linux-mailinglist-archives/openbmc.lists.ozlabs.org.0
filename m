Return-Path: <openbmc+bounces-157-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D94AD45A1
	for <lists+openbmc@lfdr.de>; Wed, 11 Jun 2025 00:06:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH2vF4cJrz2xfB;
	Wed, 11 Jun 2025 08:06:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749593209;
	cv=none; b=KhQx4APgg4O66V9g9iD2tkC/jYo4sSqEeQX70q9uwSkUdxYQeKkinhAQKQJZn0mEGmXlixtwLUtSbCCZUVH1529Jxf/V8FGmQcD+/AMwRrvp6f+csdgAoBW7AsHUTQEmLKN8A4WINseQyZy0Fk+ZJ4DXIIRiqaNgUQ5b3jtHcNU8DMXBWLPDlQm61fjwV1XWzsb+FUhfMLBNVZC5EPpRdHIujEQahLSBkizp/OvhgdVluCeSfhCQBB9D2ac7KoLNNkCwmt4B1aoBLCoA1/gG1LVugzoMhrvSjfYvOLOn4tNuTlruaOfdGLFRz1HF/wx4GV3JObuYCHbU88nxRow3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749593209; c=relaxed/relaxed;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ4IIv9PFUBJHGxVAgI4HULY+Hg0bMeSDgSnGFbYsIrdmC7yIEfj/T1GkOAlMq4tvhSItoI0/vLvVqODX3kl3vI9mzZysmQU8l9fIWUzhSP3Ckz+SCcgWk0sgYuSx4R9ILsaBDFolpsQjYZ3W1We5PfkaNdtyml0VQ0lqvn2/c0m5JWkXSBB0r7YcdbDpw9No6EsuhliD89kTzkci5sepp+AU/XrjRRXQrAXD4kDDToPi3HUqqZQgqRbn2FAfBUkcy7rYLViyA/XvFlSXMfDFp05ZMDrE2u9vUqOkAtMSMKQn6EkWqUtbiBCeYyVU8XQ+29Mvlis7E3RtmbSYV6fuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=li1EaN1e; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=li1EaN1e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH2vD32nvz2xHv
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 08:06:47 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5533c562608so5824929e87.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593204; x=1750198004; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=li1EaN1eW9sIDt1aNYBah77wIcFxRcn/Lfel9z3Fv49+NRBG5Ui1o5pR5LrH5o4vGi
         iiy71N8l/RfvKIxoJD5rzxh2xoehbRc7NJ2QwiFZ0neifVpgO/YN56PxR7A0jEEFLdx3
         wiK3z7lZbws0ZEp+hKb2df94Rt+tWHFTgdAs/vRrqisT1nnZBXRwIfaIZMfGIWTlG4wR
         dA9wMSChFtfMaTvt7VFcHPlbMGXTsUWg+TNmxarGucHC8HOQzxXs/BwgIeg2A6THsp86
         pwgywOLTF2W1Ji2w0Pxc9P5PQwACThYbn2eXnNOCHIFFeSlYgXPtEV+GOQKxikQN1/Ne
         rNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593204; x=1750198004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=qNhbZuf0VOg3pc+MmLrfcfnb46xKyqPiGkjaTlU35oq0hfRsa/IyD/Wh22CHyekqPr
         pJeWe94pY2RrIXCCn7KJPnNIFf6MB5znEIKozwJ6G4Nc6aVs35Ko43Rq1Jb+dbwHZXoa
         kzEaZePIoPjcrAsmECEnZjK8gN5jG/TNaOtlewm4X0metRzNk4VnBSC+MB3QO13tzpX+
         nyRjK4YpFyJ9BNxm/+SujXBdjCqZnsxybQdRKgWZgsLI0PsJwi735mb+Sw+TFCYPNqzp
         Z7rgljKQySuGT2SgL6WVQkpcKTmXts6a2+/cqq5MvRfnFGn8zMGEHtzAA7lthF/W02Ol
         7L0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpxRJrQhUYHkNgKgMCtbxN9MDql6Ijb4UTEbsriw4lLNVkJKhPNZtGaKIwNt9t/YsugsK3bRn7@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgHtxicPM3dJ6UQnQk4uGMqDj7kAL1jaXW7cwRJm1Xvdc38IPQ
	0DUJe0MBzVIp7NNhSdlYzXOvKMeVV9dk13YAMFxZbthLX8UGSgLLWb0nH8JIm8qpDuzSFE+UEe/
	JYydq4N74TvJXSMDuZxuZu8qTGMhZOuYt90CT2F9DVg==
X-Gm-Gg: ASbGncswGDTWoWTPyqTTzkjup5BL8TU/wPBI7/bY01gviZulG7mpwdEt1+fGd8tNtvJ
	sTlp8F4aKajUNSeDH3eEjikEiP/nvKNBcFWBHjLX+jK6dV7ebCYsQVgx7yxywOvYglZfW+1LYqm
	Poo9Zn7C/X6JbDuZpkEcHdJVeTo3PDnTzaOcO2isejutk=
X-Google-Smtp-Source: AGHT+IGlqZqOxo94Fq1AxRXbuSE8IQ4NwQa1mjzmaOgaM7Du8n0a08UJH2Mj9vvFcKeYpn253k3S/NXDYuSRYxggVL8=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr111095e87.5.1749593203962; Tue, 10 Jun 2025
 15:06:43 -0700 (PDT)
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
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:06:32 +0200
X-Gm-Features: AX0GCFsQuNMrR1lnqoFxpoWnn4BCOjfc6g0nU8IoyS3i9wf_s_1MzLLDkyq5jQE
Message-ID: <CACRpkdb8GBwtOGQYrVkxiv8ZCjEE6pkQ_kSEutY2jYG0bUbFVg@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

