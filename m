Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0BF7F70EF
	for <lists+openbmc@lfdr.de>; Fri, 24 Nov 2023 11:09:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rGrLZ9oZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc9hM6qCZz3dVC
	for <lists+openbmc@lfdr.de>; Fri, 24 Nov 2023 21:09:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rGrLZ9oZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc9gk714jz3cVF
	for <openbmc@lists.ozlabs.org>; Fri, 24 Nov 2023 21:09:20 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5cc5988f85eso17224727b3.2
        for <openbmc@lists.ozlabs.org>; Fri, 24 Nov 2023 02:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700820558; x=1701425358; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7d06b6G7ORlrNQJU6TvzYJsppMO/COUWuckfBOPugA=;
        b=rGrLZ9oZG+y2rAKBQ+ek2BPbKKFDGkQgQr+sQbGKTNaK8YyEUAruwhwN2vOjUYKCgy
         8mwXU27yVUHjUc6rEeEn/FTabGXKZSILnfYqBAyyT66T4yXer+j3Edq06dCoaJSGB0xu
         0ULouqvunnvzxhI78WwrGNilaobJEPcnchU4dpxb5zkCsglo0MlHjvtqxhvjqrEGSU3l
         M8fzH08ZK3R3QN6Iix8ZvDmAE5lHbXlmNp9uiDAWBRyYEXowOdmgNciUjN0/ex0wHY1R
         XegeReR5FrW05kW5fipwidR4ZWUfhfuTX3uUsFdNSZzcl5NUToOUtfXtY9F0OL8/RMp0
         NBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820558; x=1701425358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7d06b6G7ORlrNQJU6TvzYJsppMO/COUWuckfBOPugA=;
        b=MEoVSiIWYlfZIv58l8ZC3lKtFOWAMdsZDo543MA51f18ry9R5SzYJE1KSUGBnRa4s1
         YArl+ap35se5SGjCLDVU0tTrHfKjsAAg7cdYT2sh5NYDa9pTdld6H9D90FOJabuNbCkr
         7fDnNmOCcvLSXxlnuvPRpBV6NvD+5uwI+FVQmlKfoeAkWlRMxomIKA+GQhKUiASkZglk
         3QG7U4vD5fYuOv9ScHDZtIKVHnUfi3tplcwDhIVhGcv/mjimCcFq9Oxx1o7n8Nwq1K3z
         dpfLc1fxJh/gskILmfSOkLoEyj853LNGL5XmAKEz192+/kf0gzui2Fp0Yyfwl43XuNCW
         LL5w==
X-Gm-Message-State: AOJu0YzizCpQnACJ3vnsDkFYeRI/cYccYPXbNa3uFwSzLzXG7/nCJRCe
	MQdr/pN+AimrPQtUiRUTFiqWj8bUSPcPATAFZGyb0A==
X-Google-Smtp-Source: AGHT+IFZDOwR7JExk+WTPrKofyiSPhESOa5Ty4+gyeA49vmY5GeURfJ5lGSFWgjatvyDMJJIGKpHsSimm4ZZ6CjLiag=
X-Received: by 2002:a0d:fa01:0:b0:5c5:b0f7:1087 with SMTP id
 k1-20020a0dfa01000000b005c5b0f71087mr1855847ywf.40.1700820558337; Fri, 24 Nov
 2023 02:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com> <ZVzy227f3cIiTmtE@smile.fi.intel.com>
In-Reply-To: <ZVzy227f3cIiTmtE@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:09:07 +0100
Message-ID: <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tomer Maimon <tmaimon77@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 7:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:

> > The pin control header provides struct pingroup and PINCTRL_PINGROUP() =
macro.
> > Utilize them instead of open coded variants in the driver.
>
> Linus, I dunno if you are going to apply this sooner (assuming Jonathan i=
s okay
> with the change), but I have a bigger pending series where this will be a
> prerequisite. So, when I will be ready and if it's not being applied (yet=
),
> I'll include it into the bigger series as well.

No answer from Jonathan but I just applied another Nuvoton patch from
Tomer, so maybe Tomer can look at/test this patch?

Yours,
Linus Walleij
