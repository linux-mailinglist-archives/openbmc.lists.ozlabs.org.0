Return-Path: <openbmc+bounces-594-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E2B43EAF
	for <lists+openbmc@lfdr.de>; Thu,  4 Sep 2025 16:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHhcQ3DQjz2yrZ;
	Fri,  5 Sep 2025 00:26:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756995990;
	cv=none; b=OR03AzjiGV1cv67KHsrPXsiFxCOHBZfeQa7Xz1Lp5zZAsQJSS6aEkD8KGKnetJNTkW/CoAjEjzHBg8rAxatokMS4LooFIMLWiF2kfrRaD81dK9CrmH59MdICx1GUK65JkhPOQQKueFb5nCCuID4N1fQmFxB2c0qoBB6IY8oHMiVamDWUmIiyz2/XoWkC59x1TlToKqUpFP4MEIxOfxquv6FBeC4j2oJ4IoTGyWhuSispc4qvBde5JfHzGcFEDegVNbbxV6Hzsr3hiF/IG/03cy736ruKjSYMaJY16LKgqxeiU8/bbKc17PM1p/fSJeYTQ03kp/eFD43nY/m6qqK1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756995990; c=relaxed/relaxed;
	bh=TrZXZ5vj6rpI76QBE1riAOOnnjT8+4As+YM8KSkqa9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnp2uHe764GmrIGptavamV/4i8U9iIk4WoIJACtVwtINPVFTWtTt4lpRvCn1efpT92NX/1jf7bDVhK3WSzISaTNrTUHc8nFPxUN6gAe8FLtyRCcB2nVGVS7NUn8CpDirGa/F0t4d0jnOwkiQQ35+LSUOIEViQB9aPPBnXYuQmugt2AbZvkAO7R5+ggZ65MCG+bxbmDklHuPi3cqPfOODj6NaMScvKJjLb9SpQ03bxyd2lbtJ9j6UTZJPrYJNEPkGv6GWZonaxldnSSC+rXFHuj+1BbpjpYpqSDUEgnrzBeWsrkinAsmsQmRPQwMSibnenKWnul9Fm2cPbH2PawFkmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R00ZNFjz; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R00ZNFjz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHhcP4kyDz2xlM;
	Fri,  5 Sep 2025 00:26:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D51860210;
	Thu,  4 Sep 2025 14:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44569C4CEF7;
	Thu,  4 Sep 2025 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995987;
	bh=MZTNLy8WumQBrAUxZruJ7A1RSPvhV1IcSRMMDbYEd5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R00ZNFjzGvMIV1z1JYLS3srxQQe2x1VuVBDB1GG9YR4OKz57tshnqOOqZbLxmuw7L
	 xCLf65RuifIExOjc5NRKkx7vyOAC82sUKsXlUMqQ1+Pw380aoUXWHh0Md1bMsrnmyZ
	 OtOc5At3+5t/P4f+yDft7PUret0sxRxvwWfSDavwSIecBLdmwg3quI5ZkR3nfKlcKJ
	 ppjG234+0H4XtAWuwsZ8HUj5VaqZTNcLcAWqz5AFdW8D9JuiU2n0B5jbxvtzds1s6D
	 FDaRoI+5BBmqdJ3QNF+/AVMi5Cvld1RLZMJbu5vsgORimigAPacWt4u6Gm216QFA4m
	 0YuH7TxGBx3Pg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61cb9e039d9so1897676a12.1;
        Thu, 04 Sep 2025 07:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk8bgI8DVmB6MCkXcPRqdJYXC+wBL4DZ6zIgXhb0mijxHK3VZeh7yFelMTTF78g0g4OLlpq5lbow==@lists.ozlabs.org, AJvYcCVdFTFem7oOZ3whMOJTuAhzennlC1zDrNE9wYtoZKv49XOA7jVXsHyvza8NR5qG97iY9hHQzDG5AMdzY3I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx48PYaZzMeRzxQVCDgVebkWiX8Kjhri4EY2yI6DmvWZhmLV1nV
	oUdrXMmW1/hmlOX4/CetR31otB9CnIbmBUYzU1phkDxwnK04FCo0IgFqNjUA+B2oCV3y3Mtlhre
	olYNginfDBK+PVNqpE7BeXSYq5omoEw==
X-Google-Smtp-Source: AGHT+IGC6do4FFjOEe96iRxCl7OvO0Z8eMjKL8C03py3+afXpF8z+wNZNrq9fN5BUDwZ+RhTw6v/xHjprm+YASxMvpE=
X-Received: by 2002:a17:907:97d6:b0:b04:6858:13ce with SMTP id
 a640c23a62f3a-b0468583507mr693956966b.38.1756995985863; Thu, 04 Sep 2025
 07:26:25 -0700 (PDT)
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
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com> <20250904103401.88287-5-billy_tsai@aspeedtech.com>
In-Reply-To: <20250904103401.88287-5-billy_tsai@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 09:26:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+XbTt-FbUOnmnSCwB7yYvWDVLy5kaYARhBwe=0QzGE4w@mail.gmail.com>
X-Gm-Features: Ac12FXxgofUZYm-8aN3VW1dq-DHJjDy12C9x9yYGuLCJNCxaxLowzVV8WhBnhEg
Message-ID: <CAL_Jsq+XbTt-FbUOnmnSCwB7yYvWDVLy5kaYARhBwe=0QzGE4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add AST27xx pinctrl configuration nodes
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, linus.walleij@linaro.org, brgl@bgdev.pl, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 4, 2025 at 5:34=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Add pinctrl0 and pinctrl1 nodes for AST27xx SoC0 and SoC1 to configure
> the pinmux settings for each ball.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++++++++++
>  1 file changed, 1359 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi

This file isn't used anywhere and is therefore untestable. If there is
a dependency to apply, then please specify that using b4. But then
this would also need to be included somewhere.

Rob

