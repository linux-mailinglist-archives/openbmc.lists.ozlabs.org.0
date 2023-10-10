Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3097BFAA3
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:02:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xCqq8she;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4ZKY14FZz3bTN
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 23:02:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xCqq8she;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4ZJn37w8z2yTx
	for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 23:02:15 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7c08b7744so6296627b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939330; x=1697544130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wBmjqlIuY6Zt3anxCmFrS7RpdSFcEoQFexeps6+6pY=;
        b=xCqq8shesqXCCafP0F40xrNnIXS+z/YR0BBTmzvj8Ll7clxXoUmTOZC2MC2BH69eft
         e3I9uBzzeCVsY6+ZMhfblLm413FE3l5ceXPImo2WgEY5qhv2qEN23bVClRXEaCReZLi3
         nf+YQtZBHayNbLwLjqLPty2Zpd0HbWDLg6rKrdmEPsSZubd6ioWNAHCP2KinJDpHVq4x
         YhvfdPqv00mTzFANf/7lzpZOGZvQG4T0yO3mseJVEfRGcPivLUdE9ZFbHS1rmNtnXCNy
         o1Ltmql8mkOrqrIelkKrL3ib6A1NkeWQntKQ6OKuxetpUj15nX+DooFfyGXzeeE0oqmb
         lP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939330; x=1697544130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wBmjqlIuY6Zt3anxCmFrS7RpdSFcEoQFexeps6+6pY=;
        b=Awd72iEsTczsrj7hJnsOZ8bpfWGMrGHsGt7A0yKvhBbtBGNbGy/dmAH8SgF/ysn4+3
         5bx9MJPl0DoJSzeMvo2QSkSn1/5X6zMWMqRk3cjiDelhtHpzycGp72mI3QfVWMeUBYAt
         BPSJO1NEkIk1TAAq5cskw4EPwIwpfEAmyXx7z+k34XhMXXbvxxvg6TXTnJUkP6OQqtKV
         mhPL2lv+BofIcqwbCOT7EoTZzOsXl26H50APl6Fuzlg/d8kdgicleUHVDQl7oINQ9Af8
         owijpj9PcmIg65FmAP+m7VWGiYQ+m13DW2ppW9ck9EsTSE6vNDmshAXk8yAGLwOPUWmo
         u75A==
X-Gm-Message-State: AOJu0YwEVJ2DkZAYInFXdFBQyt6/wWlSP5FsWddZ1FOEoEfEtMFBTNH7
	Yy1J5O6uv+fbahJZ92xrIaqkU09D+HME/+kFzctrhw==
X-Google-Smtp-Source: AGHT+IG23K04t+lvBS9/HwvoXXibHWZT2x93Gqx7aXMv0MEjbeY28YO9n63irEBhuu2GkQHI23S6u1dmnLY+nMNTZc4=
X-Received: by 2002:a05:690c:d87:b0:5a5:7ed:cf80 with SMTP id
 da7-20020a05690c0d8700b005a507edcf80mr20364608ywb.23.1696939329657; Tue, 10
 Oct 2023 05:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231005030849.11352-2-zev@bewilderbeest.net>
In-Reply-To: <20231005030849.11352-2-zev@bewilderbeest.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 14:01:58 +0200
Message-ID: <CACRpkdZDBmUMY7pVxtSkVQnm9bHp+ObfmumO39j=XYeDJaD7Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Allow changing SPI mode from hardware
 strap defaults
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 5, 2023 at 5:09=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> wr=
ote:


> Some platforms unfortunately have their SPI mode selection bits
> strapped incorrectly (such as being configured for passthrough mode
> when master mode is in fact the only useful configuration for it) and
> thus require correction in software.  Add the SPI mode bits to the
> GPIO passthrough bits as the exceptions to the read-only rule for the
> hardware strap register so that the pinctrl subsystem can be used for
> such corrections.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Patch applied!

Yours,
Linus Walleij
