Return-Path: <openbmc+bounces-1004-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AAECB5A84
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 12:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRr7Z49h9z2yFj;
	Thu, 11 Dec 2025 22:33:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765452810;
	cv=none; b=S2sY9V+ePZIF5a9ZFG/t6Tar8S2LrzpYyjZ9aNhO5l/QB6EoJkX1DWimGSHg3307ZIStKFChScRoINM6sbpQ56F2AQzDABOe0AOBeCTY9jlCvMjS3VPxXm/1H9shrKztAMCG3oIOBJehCrequgLbzA/z+6A+AMBEzCxaIykZJaW6W2or/1b19sHSy+FZmCt6CwohEw5RYRlwEP/QSaRBKMQzS+h7DTBPujC6Hge5B0dCdO9KLLb+hyXgSxojSeKeNa8gT+jf0NCXMuVfDCazXz4g1A1wUysFbydy2V60saBVe1FS/E5XCdqvo5IqzL3uNxo+HGUnxUiNd6YQ9BSeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765452810; c=relaxed/relaxed;
	bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMWLqE8g6JpwqW8IpeVUKgGO6uYtHyWl38x0xkrmjCPAj5ASEtJ4kbxjUq+WBf0M1SyUTWLOmNnH5sMk2O4DOsnwV7j/zzRb10m7g28JIWWocdM8F8rTMGT6A5Mo1Eumi5KNXhPKuXUHoan57BQciKfkHFOY6wI7pdOcfpwEGp4zjCOgo5AIYaWpEMuHE4gk5LsCHLp8+vgafSMRRiTWrOvBvvdBQ2Bwctd8uTZMYtOJOvvvfnYmduOMsRqerA31n18JK2KVTjhcd7nvVODUjd9nq8I8tMjBIXHQjYElZKZT5NE4LkLr69os7W2REPWyX7eK8y4qsmnHauSAI2UKzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HfOKV2yU; dkim-atps=neutral; spf=pass (client-ip=209.85.128.171; helo=mail-yw1-f171.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HfOKV2yU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.128.171; helo=mail-yw1-f171.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRr7Y6TKRz2y7b
	for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 22:33:29 +1100 (AEDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78a6a7654a4so8966177b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 03:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452747; x=1766057547; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
        b=HfOKV2yUpaYhlWtqBMl/wAYMyoZRx/F1/azn8aEquyefckTJFplT6frkvFjZRDHKSK
         MgzpCuRRYKvv25UGoetFxBZoZiRouIv6AplnuFoi/SU2kPDbl6VCshs2clffppkXiVCe
         fbEmWDsRlsjUATBIacUOH1Emhk7Gry0yulCTDgZNLIelh9tF+6g0wR8muXTXLwcR2FyX
         3fUqqEkTwZlbqYrN2ItSyeCC03Su6RyH0JQi1wlkS5EAXd0Fx2rdhum+bkUw0VQyjEPO
         MI/6me8WWodj13ppbKKiMhtMIlU6iTwY/oa4uhIHMsuqMd/rXtKc4hi5qhKzJp3GL2db
         sHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452747; x=1766057547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
        b=FqHhIUXfbOBbRv9u9B9kAiBDDwN3he+Hqs7WlHFhvutlDHWyECnpyLkcLN2rnlppLa
         iISsuL9Nrmok5cCeSUnIA64cwmlxFHHGI7A39RNdMzeNn+zScRD62WoMTr3pM9jxjoVH
         eBTEwuHUyeDAzPfwVfI4ewkULINgyJy4IcLbYvmrma2I1l6PivdcqFFAKiTKdxllVSQz
         sRnA8lI6JsrgwMbThkZ971iIzw3/H4MrqE+yqY5a7BnPWcFQSLIwaH6hdL5AEDft7snn
         /IA/DUx0NMXZbAOsH/TTJsD9iW3T1owEffHYhE8deeYWBCI2KWNAwJRNmY1R7zoEKSfF
         d+2A==
X-Forwarded-Encrypted: i=1; AJvYcCWE/7T7X5lejnZSEhZYNK12cGtex7fOYpf8Hj9I4GQijhHJsR9C8YlaygYRi5b2pFpsGG2XLSPh@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1f39lgliygiz7wcNPoABgQSOrq78Waw5mJjb8G/Lgr525Rs2X
	ccRddB0uGBXwdcNe9Mdvx7YC3b1MrTtx818tIEjXK3Ou6t3hqdb6wzSUdsgEyLQPVZVEaP/KHOJ
	fdjbKbxl8oN0RAQreO34S/I1Lmym0xH9wzc5jQJvjHw==
X-Gm-Gg: AY/fxX7Quyarh66LEGqae22S55jRp/pmFD8hoP+rKM64f53x9mFwu4eIXejjJF0OMLu
	/gW5UWAcxTGAs/3U9ZVEaZqL9sYW9zFQXTgeYPutZRFzbUF2IGwZcW6XThSuW/cnDu3POMtfe2V
	CCLkgPh0Ulml5I89gAFjebbRb/xX2QAVqO/ekfttDlmqRB4Mey3HSRqZnV+3FbPYGq5IN6V7yfi
	zfUsQT3Lcag+qpkGwyO8aZTKFxJYCjyCJcb61qtWabQRedkJodo2QMuB4pgeFanu8bET0h9Qly/
	t3sL0Vo=
X-Google-Smtp-Source: AGHT+IGi8FI7tue2F1muYiYdXCcwa1VCSq2fLFaLgh7A0p4DE+EvhP5UsxEj9lkt3uuk+LvjC2KVDNW0gmzNrvJK74w=
X-Received: by 2002:a05:690c:45c5:b0:787:bf16:d489 with SMTP id
 00721157ae682-78ca64495eamr51688117b3.62.1765452747098; Thu, 11 Dec 2025
 03:32:27 -0800 (PST)
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
 <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:50 +0100
X-Gm-Features: AQt7F2pk6E2fyrBRST0HoIuBOhvmNQUfLJiP182o7R-P0Ig55Fk3IUyQwfYuHbU
Message-ID: <CAPDyKFpQXYFFrZ-unVxa9m2+tKLEyFZyo7Tv7JD_7vTbqqfmDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 08/16] ARM: dts: aspeed: Use specified wp-inverted
 property for AST2600 EVB
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
> While sdhci-pltfm supports sdhci,wp-inverted, it also supports
> the un-prefixed and specified wp-inverted property. Switch the EVB
> devicetree to use the specified property to remove warnings when
> checking the DTB.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index 3eba676e57f1..c51977dcb56b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -315,7 +315,7 @@ &sdhci0 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         sdhci-caps-mask = <0x7 0x0>;
> -       sdhci,wp-inverted;
> +       wp-inverted;
>         vmmc-supply = <&vcc_sdhci0>;
>         vqmmc-supply = <&vccq_sdhci0>;
>         clk-phase-sd-hs = <7>, <200>;
> @@ -326,7 +326,7 @@ &sdhci1 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         sdhci-caps-mask = <0x7 0x0>;
> -       sdhci,wp-inverted;
> +       wp-inverted;
>         vmmc-supply = <&vcc_sdhci1>;
>         vqmmc-supply = <&vccq_sdhci1>;
>         clk-phase-sd-hs = <7>, <200>;
>
> --
> 2.47.3
>
>

