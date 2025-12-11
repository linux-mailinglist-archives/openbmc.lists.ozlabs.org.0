Return-Path: <openbmc+bounces-1003-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE671CB5A78
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 12:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRr7T4C5Sz2xNk;
	Thu, 11 Dec 2025 22:33:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765452805;
	cv=none; b=FdDJt5jzSjH/rj7+L/q/o7QtKuLByYaaP2Eqtdg3hD8YOSJtOR4kuoT+8AQKtnAscZnoXN/lKD1xpmWgi9oMn/K5MpS6EAb1HLqrdVMewCWa9eKUTgVia/M71K2kLLiDG7zekgUCEgED4lGiwgJ2gtaKE8wbOh5c06WvCXd7mUm8g0N9xxPqkXGb4wko7VfW4XKPXDF5wROygaqrQ80rgxyFGejGpUhZ8WLcjMiFNmcZk7Fm9ntFonMemMkOpU9aiQp2o268Zlql6bcfNrAT70AkXvhJ3Ym58AJ0t8YZRqNczzCt1sUhE07gUGCeJB6MaDZVBJuQMrVm/TSeNwEn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765452805; c=relaxed/relaxed;
	bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awY6kXZp8+K2HzcNF3zzUD+w2qvEwe2KA2JYe/zFn2EohEDUUp2iPLlRQDH8oP23/Rrm0Iml1ULY5rfLbEtrjluRpvvjXN3JNbxQIlUdohQAGiS6I8g593MldYE/0b8VDzPZiRdolaF0b2NOdNYJXYyyzry4K7eCAq2edtozfWQNKZEOF2CD7rgW7mvVSqbdrlSB9bTdNzHviSfFdELXVj7ks/0HAiHXGvo6FcsUeoxcX9aF3QurZn1wEnN7+SsCKZdwQel21a3AN7Jb9NQLWltxeOPUS94QLYzQ3Wvsr5XgajQ7H2Q5V+62u1t2i0f20LTYSTjeRaEYl+HWtOHPUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yGEhlB92; dkim-atps=neutral; spf=pass (client-ip=74.125.224.46; helo=mail-yx1-f46.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yGEhlB92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=74.125.224.46; helo=mail-yx1-f46.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRr7S6qNxz2y7b
	for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 22:33:24 +1100 (AEDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6420c0cf4abso817924d50.1
        for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452742; x=1766057542; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
        b=yGEhlB92E9tSv7yMeEbG+SJ/1lMLtCv/yGGbQZCX32vp+PKh8VNunhtnnwLXjx+Km8
         2vDpPZDdMlbr06C7t0cLpv+hal9N2nUXeaANlPiqgRKFxLqqT6xk8LT1uTc6kXqEpP4Q
         8bO3Fgo1LUxtMDb+dhvQrt6gA9YqAxuaG6njbAQJlNJIk+fd8GGfYEvWfm20iEYKCsba
         Mcaby0kbbtRH+33xtIchYKiy92XuhXj5C7H0qwEmMMJ/CvLuZrdrfMUWCkVHkmYGo8XE
         MfVJvgDi+5n57PrNLzwOwJlycLbsBoSyHDi7bLB32llXGGucoSvCkWgp5jISA/c6ProF
         xJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452742; x=1766057542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
        b=UgNIFpDCOk+ZzlqLNHw8Vp2iNulIx2ORhkRfDenRZgrRYbDMsvC+ayuKujtpAjEIS2
         Vr2meIcO1cQvcosZ9OjIcgY67lnFUBhsMSXylSmyFxYlZPJW7Mav5OTWBIwt66kaiez3
         yR2nwP+zuwZPDwaq+0soWB5UL9uq1bF1OA/ysxNTQf1c8fzBLzCFxD6pW6rAMJsRhA3b
         MU7OOT+moaJxTdg1OTRPhpOdld2Yxh74w7hkqieI34imNj/nnmUb7JFc9haGEUq+ofrg
         3zwVdSCQ/Ud4IRPyUJe9kQmSOS+HaJI7522u4SLn0Pi63doZj9rJg4nDsyaeovKBL6NJ
         gnmA==
X-Forwarded-Encrypted: i=1; AJvYcCXWqAPpkq/kqE0orNmTzDFBPMETYcaJsBTJmYnQ9fHC/EXNAoufmdVtKgcIija2UAnDYq8NcdHv@lists.ozlabs.org
X-Gm-Message-State: AOJu0YytsT0Dw2G8eadSfU7tP8qrQSAqmp+RHL0/XPlmCcxS53GJV0Xo
	/1eGtcCp/RnYnV8u416DdtL7lO4ynuAKFMTjttqBWRvKNFCpyQD/1CrdNlqDsCZPYZdKJQj+az1
	e9qXJM27gU+O0zXHAhH0X3K90927xt6LvB2ZIX48R8A==
X-Gm-Gg: AY/fxX4hewCVlYY5MbmmHR+oJCcXOKi0Jsix492BvP0aBjkwZUYRy0R2Sj1Qo8XnKV2
	hzdSrqS96P7WtBkhQ6rEW40E1DkSrW2xs+BQG6UlIBG3a2dCL0Ph95S2a7Fk0IfN0KpwyKxbwR5
	C7i+yNK8vwCKodzJJakvPUX0eRd7DrusLOIIbIlPVMIaok/z2bRrNslrz3W1yamCoHXGdpsMpny
	QtcMWY5kdEqCfvfsDHTzta/r95EH/177sgleUKc3lK3IVsvmrPOlZyNup5YmpU2GILr3AKm
X-Google-Smtp-Source: AGHT+IGcqwaxtfJMJnD56RcASi/uVKO/lK/0JnQ8qMBQTGtHR3OnnoyAdnC7R6PIycF4XsJLibnnvktvbwIlYjUAVZY=
X-Received: by 2002:a05:690e:120e:b0:63f:96d7:a350 with SMTP id
 956f58d0204a3-6446eb4a92cmr4347837d50.66.1765452742333; Thu, 11 Dec 2025
 03:32:22 -0800 (PST)
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
 <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:45 +0100
X-Gm-Features: AQt7F2oiHWORIK5IUrdndTpX-opjO6A0dESgetC9ddqm2QKKAaLxTanuvA5lEio
Message-ID: <CAPDyKFqZQUurBNSNUBKE7rgBf+UHxKiYBWt+xxSY+dh7PgdPPQ@mail.gmail.com>
Subject: Re: [PATCH RFC 07/16] ARM: dts: aspeed: Remove sdhci-drive-type
 property from AST2600 EVB
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 11 Dec 2025 at 09:47, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> The property isn't specified in the bindings and is not used by the
> corresponding driver, so drop it.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index de83c0eb1d6e..3eba676e57f1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -314,7 +314,6 @@ &sdhci0 {
>         status = "okay";
>         bus-width = <4>;
>         max-frequency = <100000000>;
> -       sdhci-drive-type = /bits/ 8 <3>;
>         sdhci-caps-mask = <0x7 0x0>;
>         sdhci,wp-inverted;
>         vmmc-supply = <&vcc_sdhci0>;
> @@ -326,7 +325,6 @@ &sdhci1 {
>         status = "okay";
>         bus-width = <4>;
>         max-frequency = <100000000>;
> -       sdhci-drive-type = /bits/ 8 <3>;
>         sdhci-caps-mask = <0x7 0x0>;
>         sdhci,wp-inverted;
>         vmmc-supply = <&vcc_sdhci1>;
>
> --
> 2.47.3
>
>

