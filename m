Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2590A755
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 09:35:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t37YfRjb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hVt5CkMz3fnS
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 17:35:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t37YfRjb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hVM3lfwz2ydQ
	for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2024 17:34:50 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5295eb47b48so4926016e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2024 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718609682; x=1719214482; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
        b=t37YfRjb0Q+J/znWjUcslCT4p26jCarAh0Zj/vAEoHptVeceq96Lew86nfOGweomB9
         hLu406JoQhfvzZh9Iu/iZlBNRBRmEYKA+aIkuOj5MawdD5Fd5SKLPuZ5uCv7DefNn5lM
         OA1IKzI3QzeBGc+RifXimNKNezxNWUlwCObvPMCutlcumIKdapIR6zkJNEBCeDPGlqmU
         QuwDdLb/n26O8UebPb3Oaz/GqW5lGmNy4IOALu7vadWsQuO74/85bixM/LZginjAHRMJ
         iAYxW03IXbfmw6NF/cpZ5OMZ6ujq4GrkI/FVOfc8BG5odYkMq/wbOmJiC3YsdJjUaXrX
         ssmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609682; x=1719214482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
        b=dVAMkispWAt/u6wC/HLV0QwXAYIxRanmgt9M5h3RmX+L4gRxOvbbbxofeXVF4cSsD5
         ZDKOiYoaM2m5VfxeU4UlHOikIksgV/JiwojeACSDX8zY/5rwZv1fIQ1wrUMfiBqf+WrL
         DW4sNi7LYfuppj0pjuYty45y/PJqGFosMgMLsAmr9zgUOx5HZFE/Im9e059Hupc87THZ
         thxwclD1dPqWSpyZukVGii8Zn2upOaVZKb6s0U1zGgmmBKY2slbkxGmTYWyXylulUTwi
         FrtB/58vaNAJFrUG3Kkgd1ja2FxNtXHVmRQO8cRVQzC3CYyT6LCg6OlxTIIKkTfeLyQX
         vXVA==
X-Forwarded-Encrypted: i=1; AJvYcCX+ToY7+R36hWaZ8YXEMtP7OKKvYq1aMw0P+t3g5uGohr3i2UI/4xMRrD2dJTNKErLnnz4ztPQLDsucUytSPS3bVCEer/oKj2I=
X-Gm-Message-State: AOJu0YwGzG5hjd5K/trVggLBFUUbJFyAekMbPy2My8BVFADNohGf4GGj
	FXdEPQJtg7gU5+JtQhytndnDB/ibxqaOAwc4JDop8g9nJeox20NOh3l7E369zliTzjCcdd8gyHc
	TxyY/HXfqHf9Wj5hjGkZSgdZzbxqr81zDe3E8PA==
X-Google-Smtp-Source: AGHT+IGqIDqoMDiWUnJbMVSGr1EJQQ4GFqNlfiC0YOW4DAh8bCGdlwiNhRqn/j5asJGjevkFUoLeA+A2JuGUQ9QeAF8=
X-Received: by 2002:a05:6512:3c97:b0:52c:adff:4bcb with SMTP id
 2adb3069b0e04-52cadff4c84mr5977471e87.53.1718609682402; Mon, 17 Jun 2024
 00:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:34:31 +0200
Message-ID: <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing
 functions and groups
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 5:03=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> This short series cleans up a collection of binding warnings concerning
> use of undefined pinctrl functions and groups. Together they make a
> reasonable dent in the volume of output from `make dtbs_check` for the
> Aspeed devicetrees.

All patches applied.

Thanks Andrew!

Yours,
Linus Walleij
