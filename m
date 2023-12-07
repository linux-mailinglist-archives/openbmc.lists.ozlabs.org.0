Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA4808501
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 10:55:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LZYA9rrA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm8lX1LZLz3ckc
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 20:55:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LZYA9rrA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm8ky5jJ4z3cQr
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 20:54:50 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d747dbf81eso4532257b3.1
        for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 01:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701942887; x=1702547687; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE7xYQUlzv02mponHAUbU9YxaUMHPxUWeHaAlOpaiO0=;
        b=LZYA9rrA/AbSUaDgj9FgKXjT060fhHvCA4W+9eTql6WKj9rxgW96SgJ6GJkaCgR2S/
         2ahexzpxfOX+aEoteRRV1dIxBVKPpDofwNVTeouSLFFibcLRwhfCNZmYmKyJV8YEbVHc
         r74Xlb/Whn9QAhUgT6Yc+fxh7D7iWa8Rv4Fp2eutmPjTwyhBhlFf40/1gZlRF1Y4CctN
         +YcNNJbuglIKEmLC+aiHY3JoSXqcxDN6JPm6g4pMoq4HhSj6IoOSAcQoJcrg9bOMT8wK
         kFgHhMdXnenCtMfe60vC6UswnPUXDJSqRbNfKjUa7jEE4QSjQjY/GoMiAPlZSxWYa9nq
         z0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942887; x=1702547687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE7xYQUlzv02mponHAUbU9YxaUMHPxUWeHaAlOpaiO0=;
        b=vggbHgD8cnE2AbIF8iwXEBacBEHrvLY2qulEiNg5IQ2Ea3KzQ0KQ+geBvtSh3k6Ryg
         xkEa93GgSBLiHNbekq89MJpAi0t42i8nYsef1hyr69SJTBdNfhu/fNYuva+Fa5dgAux4
         plnH/Sh1FKFocbTe25UPjzod0MU7KeO1OH/YQ4vp1z7anivsg2L/Rj72tZ8uL8e00jAT
         xCXI+dgN/YYwmVIaoXCM8I1vfqr94sr88CrrAgIar5IxT8d0j7KBQc+T5gusLzNmzzVX
         uzbL2VXfWYtZyjOvDBDMlrD1/okWC58FOdPHgeaWG8u8SIQWAawQ3NTlHn5OR+tjB/n6
         Z1Vg==
X-Gm-Message-State: AOJu0Yzy5XT07I/vQ/SpvKplUoNtuWWVRSXET3gkehNXS+LwtKBaGj7n
	13LBU2B1PrQ34Cy9RUTjzgsIa0n+3ZWHY1R+MWSnpg==
X-Google-Smtp-Source: AGHT+IEOjV+e4fO7tLGjEoQWjOkdeRdGdcIMPsTYSMvX6xAX0W3EEwj2XzT9z0JeD0O7EwAjfnACJWMxZ/0hDFeMo1s=
X-Received: by 2002:a81:4515:0:b0:5d4:3596:5ace with SMTP id
 s21-20020a814515000000b005d435965acemr2061763ywa.12.1701942887739; Thu, 07
 Dec 2023 01:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:54:58 +0100
Message-ID: <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] pinctrl: Use struct pingroup and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 4, 2023 at 5:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is an excerpt from v4 of the "pinctrl: Convert struct group_desc
> to use struct pingroup" [1]. The series has been compiled with GCC 8
> for ARM64 besides x86_64 GCC 13 and LLVM 16.
>
> Changelog to the mother series [1]:
> - added a new patch against Renesas code, so no warnings will be seen

Patches applied!

Yours,
Linus Walleij
