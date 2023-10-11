Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB67C4D35
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 10:32:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A7rc4gam;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S55cQ5YHMz3cQ7
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 19:32:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A7rc4gam;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S55bm5jyqz2yW2;
	Wed, 11 Oct 2023 19:32:03 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9b96c3b4be4so1104374766b.1;
        Wed, 11 Oct 2023 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697013121; x=1697617921; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIaZVRAI+DjRQ6RtkRDpXSpOk0GxsoNaCYn+DGwB1ho=;
        b=A7rc4gam25KLsecmcK2aIfWMhpkj0JcnpcDiaSvQAW5oeIyTyfXWyL1m7edpcxQfV6
         /EFtEYykZNwfB1pQCe58Rpo/fk4Vlm5lVd4H9qGiSXyFUhZskIff7FKApQSshgMk8ktJ
         pEouIXfQX7r0ai/EWDdq4qm+39kZMYJ69Bqlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697013121; x=1697617921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIaZVRAI+DjRQ6RtkRDpXSpOk0GxsoNaCYn+DGwB1ho=;
        b=HIajFfWnl7+CKC8MBtx6KFISSvYjfrn568fooElaPQNZb9LmXJ7qM54SEEUsoW6UBe
         Mzdx8htvhXWzx+vRC/49C9dX0FGeLkGARhrwrtWwogJIjPlTLK5L4XORj2bQmkjMmsZk
         YVv6r0532rUur3V0F7VhJA9ef5PY3+a1bTcHb9vLg3W0ssSC1ayRouLjn18ftGoZiGLk
         1c9SgPa0C6InRD9Cf2/jLTDKu5AltMeFZ81FCyC9LBMDupITcYZOmFZ4zA+ONIbIjJyL
         YwCtBFlGJAHhOV2nTuaVo/2cbRw3q6dXeUkV/udDUVtgllDWEQ0khrpbcdSdhDfVuNeZ
         c8vQ==
X-Gm-Message-State: AOJu0YyPmtuqJ8EgZWVQTYtG0/vZ4/ChOwFm3F6ErGBav6r5PsHzxKjR
	f679ljiMP5GgU7AvU5EJCHg3nieIN95v7DmUekk=
X-Google-Smtp-Source: AGHT+IEaktyNzbJKL4tDSSV2zr0hGoNDOpPJDTfcpmFWKu45gT5I05ODaiOG7w6mqPsi4F00Ud9+kIKb6hszgyGInHU=
X-Received: by 2002:a17:906:55:b0:9ae:68bf:bec with SMTP id
 21-20020a170906005500b009ae68bf0becmr19406519ejg.75.1697013120493; Wed, 11
 Oct 2023 01:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 19:01:48 +1030
Message-ID: <CACPK8Xeo+7hTmfYR-eR9H4teUFqs5vOcSRm_VvDoVOqP4D6+NQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Update the device tree for Ampere's BMC platform
To: Chanh Nguyen <chanh@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>
> Updates the device tree to support some features on Ampere's
> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
>
> Chanh Nguyen (7):
>   ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
>   ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
>   ARM: dts: aspeed: mtjade: Add the gpio-hog
>   ARM: dts: aspeed: mtmitchell: Add LEDs
>   ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
>   ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
>   ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port

I'll merge all patches except patch 4. Please resend that on its own
once you've added names.

We should consider creating openbmc documenatiton on recommended LED
names. Would you be able to help with that?

Cheers,

Joel


>
>  .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  66 ++--
>  .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 315 ++++++++++++++++--
>  2 files changed, 334 insertions(+), 47 deletions(-)
>
> --
> 2.17.1
>
