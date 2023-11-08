Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227E7E5517
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 12:21:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GOcrZKTI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQN2q6QjCz3cQr
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 22:21:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GOcrZKTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQN2F1X3Kz2xdV
	for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2023 22:21:23 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9dd5879a126so789388366b.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Nov 2023 03:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1699442475; x=1700047275; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DnBr3Vl4ty1yLp+9tqYak2E31muuyGu5A0VjBzIJQ8=;
        b=GOcrZKTIRgt2IdSiMkbSYRHZ0Mseh/TXYzmIcQEXei4jIuM0eXjgylFWBTZ3a98XOO
         7Y/1rx0yf79Wys3p0fP+bVFzdUCutJfuNbLGvzU5CXhV6FQh6xTajjdc8npd1/wDtEEj
         HwrYPL5of8TeQaBG6b7KYjmzfwiXtnf+JnYcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699442475; x=1700047275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DnBr3Vl4ty1yLp+9tqYak2E31muuyGu5A0VjBzIJQ8=;
        b=Y22GhP6GuJhtb3dr9K1P3hSWScVeCaT22eQykc7Z3KyRZ3Fwitwze+cO67/lryAuJD
         P4CD2amVwtmb9fbXTiDSByV/wdwAyRC8kHmZaud057TOzk+vz2k4Ep/fkE02CgFlQvDA
         Bek6ykalvxEMU/jYkqt9vqNZ2i9pFyKKfqkiKWxY0z5K1iQ1mOxZ1MOXktOwfTcErHRo
         z8a86GE51r+kXCDn7ZIR6PpxkKdat4tabFsMj4u+AnpsSxZdnauDx0ROWOyBNAss/Zbf
         fcOqVs0Xs59ZWHPa4lEF3qab4RM3HoX1H9UxkCdOKpmSohJN6wBFStEAPdj0ZhP6OKdW
         tXwQ==
X-Gm-Message-State: AOJu0YyC5A9TOz1GwUB+WuBBQnFdFq2bxMTXtrLY7e+MFU2CMSc6WcM/
	4L8nfE1WfceAaGq/3dLZoLKsWo2l1nGr6TF8Gzc=
X-Google-Smtp-Source: AGHT+IFhGhrZ9IO5EQMR1dXUHZOYOK/7DUUbw1s7lLRo42bChbfvtsNX8l5V/sTKqXPSM9j9sgbELcwQaHC83tcQqRk=
X-Received: by 2002:a17:907:9404:b0:9bd:fe2f:3949 with SMTP id
 dk4-20020a170907940400b009bdfe2f3949mr1255390ejc.51.1699442475266; Wed, 08
 Nov 2023 03:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
In-Reply-To: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Nov 2023 21:51:03 +1030
Message-ID: <CACPK8Xc4NM_F4tBrZZe08r1=RYoe72=DbZNWSaK3E1_i18zjYQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Nov 2023 at 18:50, Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> v4 - Add LTC4286 and LTC4287 binding document
>    - Add LTC4286 and LTC4287 driver

This is v4, but the first version you've sent to the openbmc list. I
can't see an upstream v4, and v3 has changes requested.

It would be best if you finished getting review from Guneter, and then
sent that version to the openbmc list for merging. Include a link to
the upstream submission in your cover letter so we know what is going
on.

>
> Delphine CC Chiu (2):
>   dt-bindings: hwmon: Add lltc ltc4286 driver bindings
>   hwmon: pmbus: Add ltc4286 driver
>
>  .../bindings/hwmon/lltc,ltc4286.yaml          |  51 +++++
>  Documentation/hwmon/index.rst                 |   1 +
>  Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
>  MAINTAINERS                                   |  10 +
>  drivers/hwmon/pmbus/Kconfig                   |  10 +
>  drivers/hwmon/pmbus/Makefile                  |   1 +
>  drivers/hwmon/pmbus/ltc4286.c                 | 177 ++++++++++++++++++
>  7 files changed, 345 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>  create mode 100644 Documentation/hwmon/ltc4286.rst
>  create mode 100644 drivers/hwmon/pmbus/ltc4286.c
>
> --
> 2.25.1
>
