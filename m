Return-Path: <openbmc+bounces-244-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC1ADEB85
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 14:15:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMjPS3C9tz2xS2;
	Wed, 18 Jun 2025 22:15:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750248940;
	cv=none; b=mVlKOu0vdt68tVFJlhYdJhEsBB8Rp3HwuaLw5erXOyUYSn6JMr5/umkRb3NaMgc1tq2ZE2NDalWFRxPM9AlwmuCw8czMGEC4gAtVkiHfRmAdClehZFcndui6XihPs6hCk6YsmdM1YTvVtOq49O5zyxDeVcycMlWs3sl2z53IFvIU+ZmxIKKW0TPr2D0YJfsvu3nivwkjXWlTmJKMy4mzjy/A7wTDLbaU+z2K8zaxMtW/RsP57eag2Ij09Pq+dCZeN/qSMz8VxBm1sVN4OrTecnE+CqWRSDpLfuQaRdvrIOdHESxIcQfjfy/qy/2rHBlsL9OQo+8J9rMh83SJEGbTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750248940; c=relaxed/relaxed;
	bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6gULa9eO6e1Asoxb32ANCAT9hT71HvnSEg23qjHNeTOFHdAuGbUcB9qYzRYzAMI3181wnqm8cGPsrGYqXqU5ZdNMrncZw9ISBOQ2Wb7Hli/lX5eIBOHRfTKcYre2BdYk0kY0elaT3f61rOuie2EYYuJStxAM0Zuu/Fr8vQXftKEHz4Yx2qFOwVj42TkBIjqJxH9ymt0iXJnBOONThlJ6v4I0KNehTtRUEyy/neWnqtjvqRoxkatoIjuy90M1etSC0ldTXkOrqGZoXh/VOknS8Npx9Q0RaLVOErgCNQ9b8iLXdcpXxBxvrImXVzu781IGK1htu1BfeM5CD424ogGbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qnSUknk5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qnSUknk5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMjPQ6xYSz2xS0
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 22:15:37 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553b584ac96so5307297e87.1
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248935; x=1750853735; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=qnSUknk57cpjhYgC+B2MsREjjPOTlfJ4DyT2CHbgYdSGnZx0b52Gsv0j5nZ1sQbxyo
         m3vOW1hn90kCQ9MYSNcNJdxutBAvKVZ8JiNFosLKCFUmq5hz3M1GwBvi4pnekP+BiJDt
         HCChMwa0ZJJqqZh9BRiEUNze3GIQhiuHXA0KOde7u8HtyOREFwW+M7W7jNzVXnNtkNUI
         fnSjOS7Og4dWGFuOk1KAiI66IKglqj5eUyZ5LpenobsIF8/9pOgXtT2euz+BItS4TmRt
         R0shj3U1dP3iJYHBSBZGj+1FUne8ywH1vEPVLvYmJMUPkmNljjalSSoXmpMwAy6wHDnv
         uEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248935; x=1750853735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=BZ1NSBasOzaOrbhLNMEkzXn5k/4S3vxSKZD59uXihiqh8ZgD9TsQEzYCzuhphZJY5M
         PrON43Vea6WZIzCBNLhG7TZ2gSJPs7xXPRnXQ2XTXNcM6e9f6DKMo4QiDlaLWjqHzku8
         kzlHIMHky3XGkYyoaWVnjlqPbyGluYiGbmSnoRvy9ezEo3baYWLiM4xEQBoobmSyulOL
         dCykWz6s8BHW3UP6zgaBy5fkvVcg7kr8KLkedKrM5h4OMMaKl6ZHO4UAt2rqtq5Upj8v
         SwhB6rmc6nvGlYPkbXftWKsteD2MGbSJwAfwjIQ53+04F4+8EpU+30H6z0W5tcPVYrLs
         OY4g==
X-Forwarded-Encrypted: i=1; AJvYcCX9dUAHx/wr2Qe2UCjtQRaJVwqRnMXuzU6m5H/qIoJdy7Mto7Oo2jUsdamg4Oe6/Fg22lnHadQf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgsuX/iirzZrAVvHYyJ+bN2nZA2NVBliGqPn29nyblyThRcP0M
	nBv7JvKXAskl3Xh4YldSDhqCqmxb7GShCtZMChBKNZGmxETr5SFnuEQzL7pNk+PQmv8IG8uxNk8
	nOWzp8prMcc+79sgaPKzLWy23r43qDFKnLxg3PufcSg==
X-Gm-Gg: ASbGnct4Q5oF9MSsgHtjIICeeKhejnLDqfiGRe8/xZ9G+kSIJ1zY1UTpFDChczwJCuN
	oqT7iFrsEWN22qM+e+VtQrjcPYA/o0iR+SQmP5XA+zrQbaTTD96CdycQkJZn1MSsQwMP1gQdexM
	5sBxCOWk7BxZQz0VDHJxpjhlx0nF5srU6Fsgl4T6zSeR0=
X-Google-Smtp-Source: AGHT+IGBMbnQS8CZK59QUADw6V+D/mLT8w6YMYDnxWivA5Amu6Cgv0XDSbL6jWX7zdVZfzp8QG5Ih8L/ToZVwFJNik0=
X-Received: by 2002:a05:6512:1285:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-553b6e732b1mr4223465e87.2.1750248934811; Wed, 18 Jun 2025
 05:15:34 -0700 (PDT)
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
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
In-Reply-To: <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:15:23 +0200
X-Gm-Features: AX0GCFscY4ky5ebft20JokFvuO1y3hVcQ04FGalsWAeschf7cTa_SUmnKoC4ETU
Message-ID: <CACRpkdaX24z5YsfcrB2oqbZpdexZJNREGkWiYgq1ar0c8O0QBA@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
	kishon@kernel.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com, 
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 5:30=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
> to output.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Can I just apply this patch 6/7 in isolation from the others, to
the pin control tree?

Yours,
Linus Walleij

