Return-Path: <openbmc+bounces-519-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD45B3ABE8
	for <lists+openbmc@lfdr.de>; Thu, 28 Aug 2025 22:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCYNw42Lsz2xnq;
	Fri, 29 Aug 2025 06:47:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756414032;
	cv=none; b=acnkxhbizKIMVacWnDIB6c4ioCaytVYGL10kF6QZC42pG23KAHHukBjyeMTfn0SPj/++j8bRNxWiY7Q6y7/687TVVon1CD037H52qdhMPvJ0e5tjyxQtZvX7yRqX9ZfrA0qk8cZEwN7gQWSs/Llfs1CPCXiCWzCoDBnLLarpyhnZIeYznx+4vmh/D2y+Ou8iRtjtIpxuqI4u8MbE/9euhDmrN2e5nrS0PO8Vsp3pHUz9WyXpNRH1T+VqlnsxBuB/SgNf/j/ushfOjVFhfLLjZt83StxYaEIJPc/g75EaZyzzJQmKyE+v3WMg1ata5nryqjuxhFhJfIsh2ei370YATg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756414032; c=relaxed/relaxed;
	bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/BdaFLy1XDnpCAlY7rfQ7wL7xWDo/KZZVRGktHHk+WwHCp9Hy4wWOjaZD2dhx/jbMwBvxa2x4DQ0YNErK2zD/gkrOKTFBLmMHLWj3bsayckhA2WQWtf9pimtlxvXXFQeLL2n8q9TxBrIqks6xDJcOr3TVkoJvka/KysghmQgUou+PQ9b8FQIPr0FxBF1J5ufux5VwYEdqrDnMW9oLSSzrTG4JVV++ukpuaTr6kkdg7eib/zroqoX3AEK7hOAT0KGqCToWHHvZJ27cqOB5wFRd2m6gWXoK9OaUryS2Y61ZaOmzRDyBGxw/U5HI8ZlxkUAL6HYvCQX/0AyIux3ufw0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YS+DCWsK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YS+DCWsK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCYNt3jNLz2xd4
	for <openbmc@lists.ozlabs.org>; Fri, 29 Aug 2025 06:47:09 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-336b63d2e56so1114681fa.2
        for <openbmc@lists.ozlabs.org>; Thu, 28 Aug 2025 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756414024; x=1757018824; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
        b=YS+DCWsKqGX9lwcpyYsEErcCyxFcvsqbqJMu2PhCkg4VFQKMbSxL4QgfE3mkmWD0yX
         AoxWmBwTVmTB7JsK014lujSttoFrQA/CLbPKSRwr4GRSPey7luwy1z9QKQT7tQ0kpqPh
         0ObadyKm4GdHXAkU93Dw5jRYfkwz2EZ7brVWzV4pJ+tvtv0tgtTzC3axkHRzRjtNpUkt
         htxURHyzNwtHxzruKh7NmG/Sm8CubBYishDDWzFN9HnQVfIJzD+R5VWtA2G0kpkY92GO
         1XJB4kLB38SkTJJrkmp1kc8aiUSiIwOwOAtQjFdM/HDeNvTbd5ffdHxNEnirk6CUrXtU
         TWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414024; x=1757018824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
        b=wyD2Gxy2Fw5waJp3Ew5OzKpfuoLSvjziNKHA+qfss2n5IC4Du64wzZYaWz19iXLuGo
         BPorftMLiDwyVBxdhykpL31yP2bzSM0NbUjJKihEKrGJWNc6fvhWIRhiul/qvdpcorGB
         HBxPyL9wpKF2lEc+o3vQUk/xaG1oxlnBWXENO8PNCX84CjIqhHrhFYDIGlQpvv0/gGz0
         KcOmkqpLTxpHD1BwB381RgIzVWTio77iFDfZuN5GI7a697mfIpMyOJIjX2KD7icXtEVV
         9Nid8VdB/H1Sm6ZwvtFXmea99grbWCnreJsWbAWhBurY6NxLQtv5XQxIhUTvWm2dE8AW
         jppQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNbOdZhPiq92A2Z7b5MPetDCumGPXNOiaSd32pzFkavbdTtPTGDrUB+50VO4YXto2BxyJCihqt@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzM2/4nU7DqHm0EpE78P3+/qy33poezvu2WcPbPk3pPh/LJKg02
	gbcoE0Uq/fJCvFjhcuiEzL0bJtPorIqqLxVWgkzlpAWriAfhh7/rB+eQCAdm+UEEQccbGRy/Fwl
	RDJSuZgX0B6PeM754oVXnEmqIMTz9n8QCj9fcUQ1f/Q==
X-Gm-Gg: ASbGncuo2KVEo8PT7ay7bI8wckYdZN1wvtKKlLj4+tsKCq0Hw/a6+H80djiKXkZ5J37
	FC4qKabyzAn0j9LUTcrmv2dPwMJju2PcRV8U8RjBllxXb1ryMIu9ZFc5cIkOZ4nLSPRWoCrxbW2
	LjsHziRZXjPpjey2vhx4wVHP45IdSLs+KBG943RiGY9qUxFBJ4CghsUQf9r3j5CR5w7RGvM1Q6C
	mzqDSA=
X-Google-Smtp-Source: AGHT+IE2uWhuibXcObFZ5VTNIy6zlok6JnK2MWtwL7cqbL+/SAGd1n7jHXQKxLY98v4CVTQiyLHeR0E2ooltz4RMmZg=
X-Received: by 2002:a05:651c:23d2:10b0:333:f086:3092 with SMTP id
 38308e7fff4ca-33650e704femr56328661fa.11.1756414024499; Thu, 28 Aug 2025
 13:47:04 -0700 (PDT)
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
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-8-jacky_chou@aspeedtech.com> <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
 <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:46:53 +0200
X-Gm-Features: Ac12FXzlvTJpPFPcU9uQ_fN2isTkkss2_BjIEzvxJnxhjmRwD11F1FNpCNVPGsc
Message-ID: <CACRpkdbmRpH1+HtW+vbK7rVk6OCEve54BxTAxrUhX631a2KP1w@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025 at 5:08=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> May I remove this patch in the next version of this series?

Yes, and in fact it could have been sent separately from the
rest as well, no need to keep things in a big bundle, it's
easier to merge in small pieces.

The only upside with the big bundles is to help developers
develop all in one place and have a "big branch" to test.
But it doesn't really help the Linux subsystem maintainers.

Yours,
Linus Walleij

