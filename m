Return-Path: <openbmc+bounces-925-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5BC6F0BD
	for <lists+openbmc@lfdr.de>; Wed, 19 Nov 2025 14:52:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBNFj43mXz3dBl;
	Thu, 20 Nov 2025 00:52:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763560329;
	cv=none; b=az5KIMzEMn1Trzcc3bl03rGCmHWK00jeVIuUcD27SAuUwjWaHW3G6/ay0BEZCTILOBqI0osguiGMv2bZ4QLwwkuSSNHZraeXIB8W88dCrX0SLg3suTQk+jiYkFPdHI+F04N8BYP0aMhBLpOShXpkr5YcMb7jcEC1BeyYjS7peFb70kohphRT/RBZs/EZdEgJ2XEPF6VVQaX/aV/2s5g1no0H/a5mA9vij3hshVQxgeISmJzldYDMc3dlifEYo649L/BI6ADtvQ+49rSqof8NQyyeJFApLpjfTLDDa4At8eC2OJEZcZU73h6bzNKBW9/t+mpZ1mH5QHInM4EX1djekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763560329; c=relaxed/relaxed;
	bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9XR7Pvmslyd98YpW+2ymDU58AvE5TY4aIEEQr5POYRn11y4r6QGZlKr7jB9IzT8lA/ZwBQtv9QNhieTLTMy6vtNHrA7F5SLGiLBvACu5urm/QGkB0D+yzOeWkZHDsbIde91/x+pu+0uPkrqZoBo0uaYjItsWqz4O0LuaqHw61lYcFUNid48RKsWomme9CQnVpNsKCVeNpVONJB5gV0gppz46vBUM20ZVRQDaxeaV9GjIpdIpmEzChOzHQSUyS2lyQ77bU37xfYU9ZaW4gAR4WvkCY2cNcU/H6nadShZtDZCc0O7R1EvlY4GjqdAHsJVjOb7oAik5iynOpiv+DEk5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZDJxyv5F; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZDJxyv5F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBNFg61zQz2yFq
	for <openbmc@lists.ozlabs.org>; Thu, 20 Nov 2025 00:52:07 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-591c9934e0cso9173805e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 19 Nov 2025 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560323; x=1764165123; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
        b=ZDJxyv5FyidRISUWXr5rwBZA9TctLspoECZx3ERNnvAUYL++iXSKoXExzvZUjoc7V3
         qnqa9WMc/4BBYG1rNfxe5Vd/RQ+MTe0ZYCI9FDBMxV6BEUCNBjUKlfKMsLMF8ppVrxMv
         nyN0XA0elu7nNSl9r/v5koaY5m58q845DX4b9kFBCNosRweE1G1B85LyEkBkKA4MnNvc
         79j0O1I0Xv9/LnwAHhhBXc/SKE+9vgmjtq9QaglIV0DMMDVsEC+BpoDgPYa6bOfc/cYw
         OhQX/FQSWSwg+4UTv6kZVzXcjzEDM7Ph0PxSAAeKwaASfnZVcgJnxMjo6YV+toJIddXB
         OyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560323; x=1764165123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
        b=XP293ktPogrBpwMljeH8Fgl2dUI319zS5BNMN/1xCOYd/Wwf9dVVk+7528HYQchzzO
         idPCKvG+o2H/vN3xMm9N2H5TmRvvxqg0XE0v0WdSkuhfNC+tYKVPw4tqcM3DsnJafgio
         P+/lxDJ2qcIQ9Q7lzX01WK9cA4ZXxWxlFVsVNJMPW1sbXlkabR8VEtXxfVcAIM74mIJE
         5dSAhe1zoRKO8OAQ+M1MBvlJ/dmDjh+7Ihvvz4vVnVqhodM7u6xTrU75iaYiGMcIx6QI
         ZyoxxHxnKqLfWo5uOPO27ONbIgZTENdSnC7ZKSsyR2poYWNMC+/a+q9a+bLgYJNiAROe
         X8mw==
X-Forwarded-Encrypted: i=1; AJvYcCWMRHJO9vV1qVGuqYGlquSRhZX04GRoRvSd1muwrzycG4YVrHiDsxWnxFIMiU32Ug6gsK27xBPl@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYrf5n3jAy/M8gKY9U+vS0JYY4ij9HqmHa8KNgXlv79Cw6HU1i
	iAFBJacXV2zm9QXKi6WjrlNr/a1h9W9t0GKeYCxsEjkgLVSHJcPJ8d77bOBFDQcoS/Pp1lz/UrE
	OQj9PRzUi6tlz2vhYSdiFp9+NGRdyFxvy6iB236RqQQ==
X-Gm-Gg: ASbGncupC/rvIvPsYoZ6i4KhQyu2AtCqmfALPCW6EMhDzCZq1lRt+CaLkf4i24XghRy
	qB7D2wB2KScKuoipfZo+/rRkmw7LsHVVuu3jzYPHWqspuxGdpfSebOps112xZQ0aXj5j7vzViFA
	6dMlmvn0ysqK4UhGMWjFiht2eBalOC3d48kDvHtm8a6iwFfn9gg8peFrgUwX5Hx8iuMFg6EhW+i
	rpK/FJGnE5naGpHeIzUcumgdNumwA+bF1sTl8VvaYmSp1ohXuW8U70Y+zD4zCcIQ8WQqWc=
X-Google-Smtp-Source: AGHT+IEmqj3lGDApr9edrXMaFwN0H3cZ82GlBpdq67AUQg80YKIMgCzJi1RzhM8yWFVqY0UQAGJbUbSB8ccCc0F5BHI=
X-Received: by 2002:a05:6512:3b9c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-59584201168mr7597957e87.43.1763560322586; Wed, 19 Nov 2025
 05:52:02 -0800 (PST)
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
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com> <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
In-Reply-To: <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:51:51 +0100
X-Gm-Features: AWmQ_blwvWUHZn6LSm0qwvTRD5Kr7vftxNarMVR6ZM3aN6PFLC6U4mHy-OgOWik
Message-ID: <CACRpkdYp4NuxDA7QLnqQ_pfd7sFZuDjCuZQ8Jim3BYXN=u=2Xw@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add
 PCIe RC PERST# group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 17, 2025 at 1:38=E2=80=AFPM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> Add PCIe PERST# group to support for PCIe RC.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This patch 3/5 applied to the pinctrl tree.

Yours,
Linus Walleij

