Return-Path: <openbmc+bounces-1052-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7DCC87EB
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 16:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWdHB5ZB7z2yvL;
	Thu, 18 Dec 2025 02:38:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765985894;
	cv=none; b=PDyBQJ+TdnL/8qpNwt1x0RyjQMJtPI87TwIHyHidrgOFGy2dRr3GVEhFBrepaYp2F1Q85h414vIgoZ9+/G//rx/zasXY1HlNK3wTGEjDkEg+mhhV18rgzrw2hMWmvXRXpnw4Arwhr3jHgy2z4aRndAdEH6fChnEJ9txY9YkTS0KOzElMPYWzlV1+wYcDs7WaE4btkp2Y2mvMbZYIFZbjSFkfhoubEwVIsRl4sHPwF08Ed6uJppa/7YfC13yVQsTVsqHNTNOZKKGeIHZ5wnyUcAn45GLtBorqnk0beORe7FWYvCn5OYdhfFJAAvGlIIAY4XKV7mzDxpJgqEzcCP4Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765985894; c=relaxed/relaxed;
	bh=P4Hj6kUIjPKS1U4b5WrIC6hTm+90YDETyj8ZGZZXRGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGcBUZWBIjBFHaT8N2Td2/SzT84Ld1MhiMXL1nIdd9NItEx0YWnQeLPc3dnIED8hD0MQFvxNW5PZd5AXW6/CGE5BFuR4Ztev7diRTBJR9sVbWTw+V0SEMFVp2GooQKe1/rh8zd4v4CMYQW1P7ihmFaMvNBxt3Ekl+eNouEXiyQs5F831eoeO2LKafV/xOrQEhtUc+gsQXWKXvTrtkqodywe+pckZuU8gfzSB0zDKBLncMnenZ/VjsiOQ3C1zzT9jhxmB3p7am3O3uCMTazm7yrDhdJFT7vqlUTaYHIHmWiBkIB5VRo8jlFLqRa6J608+A+l2MBH5QJ06ZK6Fk5jxnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hMNPbQfH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hMNPbQfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWdHB1Pryz2yvK
	for <openbmc@lists.ozlabs.org>; Thu, 18 Dec 2025 02:38:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA17B43B5B
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 15:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62F7C2BC86
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765985861;
	bh=3zWGgAak/FBm7Vkk94ZrLytELeHbedaeePRas4C5o5A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hMNPbQfHkiOGVqJHw5AtuOCvRV0FWKVO23ESw20F2cpxcqWTBIOhlBqGNkwequi0i
	 3oeUmzcEgHgSCtPoeLi5W9KvVXmE1VGX7UUnHrN1mtR68GvWl08uXF7HTsH54i7ZE9
	 KfYRP9/8MnbbeqwSYkqRzywXs1Oee8xupqaf+a3s5LDAgTLnveEoDXptQ80gqAbzq5
	 bjMNZezJ7p4GnTY2AwYJ0eq5AHSinGdYScOtbFN/Adxv8qepgBFrnvzwv9d+LJGjra
	 iG70B1IeKSjTYdQQgNkT1NrvCLmUQmuqa9VxS8bv5ivZq+pOTD21TTRtZYR98YCKkC
	 GNKlOB4AN3+tA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79ea617f55so599482866b.3
        for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 07:37:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkFUDm5rNrlnQILmRfni49Q75g7D4P8Q+4pzDRSsq90o6qIrFbV4NKvFXEpxwjNsRZTx/3DHOl@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2PvMmI45oDFRZ3mcFiNp4rmtjOwuzG1VCWczQ2aW1ad6UwYde
	p6EjNEbeg8c0uBltmbRWgX6tgE14FIRIwr2Q/TeCCzQym/P0QkLC6MGjH1CzDJffCxAoggxndb3
	6Wtj5R7L3xYgCV/unoswHLVSjcZcPew==
X-Google-Smtp-Source: AGHT+IE+MbpVy0D9cI7vtayEcuAQ5BpKDVDav3dQlj552I/4svzEpwf9VDtWU/NeRoVokGuFNkCPT8ATPD0NU91eNy8=
X-Received: by 2002:a17:907:3cca:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b7d23af00e6mr1859042566b.50.1765985860268; Wed, 17 Dec 2025
 07:37:40 -0800 (PST)
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
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Dec 2025 09:37:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
X-Gm-Features: AQt7F2q-nb9Xy6ZmXCdkQqrO-_0mpnqJ_RWJ9ZzKv3sOBl98lQ-TH7L8rvtaBLo
Message-ID: <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho
 to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> From: "Rob Herring (Arm)" <robh@kernel.org>
>
> Convert the ASpeed fan controller binding to DT schema format.
>
> The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> rather 1.

Okay, I can't figure out why I thought '#cooling-cells' needed to be 1
here. I don't see that anywhere in the tree. The driver for sure only
supports 2, so anything that's not is an error in any case.

> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++=
++++++
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
>  2 files changed, 106 insertions(+), 73 deletions(-)

