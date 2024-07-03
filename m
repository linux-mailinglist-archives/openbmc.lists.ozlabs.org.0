Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDA49260E3
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 14:50:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bzHTofor;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDflZ1Xlmz3fQX
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 22:50:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bzHTofor;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDfl15gQYz2xjw
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 22:50:19 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e036105251eso5213882276.0
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2024 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720011015; x=1720615815; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay2o4WtDijauKlhrR6+yTpXR47/mNk6cJuyin80HfuI=;
        b=bzHTofor+F6tmV6QT/gjn+SgNYuGoIPbx2jyr6Sct/oSLc8pvHBtol7xQlsV6akDpo
         vKzq07J2mNh432KjIGaDIO+qt6ugBEdw2kSmKPih3UO2DUxQrjg4yE1kLNGvqY3GvFzn
         B2TDp5ElfxvQGvkhpV3mAbXvHx66g7fCufhzCMRGcc/8rkGuM8oeTF7bqJJmQJmViCc/
         woJc4507tqWKl5A/UIugOQXhxDDIJaZn7pVmrZjcSamtVVgpcXZxlfNhx3ytapB+3raO
         MnNMPEoxg4sN3rkl+kG9V90mY2KjGUp9M7bSASGlXVczDmW99VxnLlWz8qZP1dWK3bZl
         kZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011015; x=1720615815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ay2o4WtDijauKlhrR6+yTpXR47/mNk6cJuyin80HfuI=;
        b=Y++Rcf1WS9JrLYa9c9i75yCwPfZYoIdXmR14DQvhBvdcJtvXh2/EsiHqfeMFHZaTVX
         Dap7fH7cOw/b0c0EHLMQVbq/Nt2Uqyfk+1DsMEnv1HMpGyksRkcVZjMEAJpg4Lg0Wppu
         uPNPk3lum5eqhHoEmI3jhFg4ywbzonW+AoNwrhaq1CLGcqHab3ers2wLZ33ceDn0/Fit
         cT7OMzM10ARM7DOR/7eE74kQGoG/EIY20WAOzPEz0z2c/AdiL6XUYs4EBUxQOGPDTKN+
         2O6Jlfp6hQ+phLZo5idy9xeV9tyWFfw0N8v39irkJc5fIaP3PmlLz0AwgRTyWtFIQSgD
         MK+w==
X-Forwarded-Encrypted: i=1; AJvYcCXOaPZkdFyVR7/VBMkZrgMU9Uy2ACixv1Br7WaMTeyA99Iovz7+rkOYzJDsP40bUqS7plKoNWHFgXYHjn4J5ch536s+cHOWfwU=
X-Gm-Message-State: AOJu0YwbQWxbax+Hm65fpSIWQHrcKiPRRjeARPePzB/0697pVqI5Pyiz
	5SdxF9eM8ewhbpWKRnUgTAWcm9JE4RLO0ZiTCcWkDQIoRDI+HpDX4cplGsFOPX+ZK9WwNuVZXhU
	qLGx4tXk79HWscUYXcg9GyAHoKO8tJSy4eZveuQ==
X-Google-Smtp-Source: AGHT+IFV7ffdIp7JTsaJwTFxWYFq9NuhbSHtLDocDtRDoyzt9ojWdD5kwz70sA2j6Gk3nNxPEzRj0IyN26XVuILWwJY=
X-Received: by 2002:a5b:f09:0:b0:e02:c70d:d292 with SMTP id
 3f1490d57ef6-e036eb6e1b9mr12602914276.33.1720011015300; Wed, 03 Jul 2024
 05:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240630090104.565779-1-tmaimon77@gmail.com>
In-Reply-To: <20240630090104.565779-1-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:50:03 +0200
Message-ID: <CACRpkdajqsFdqdJHx8EshL1Caew_7RZdun2poY2HceptozNg7g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: npcm8xx: add missing pin group
 and mux function
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 30, 2024 at 11:01=E2=80=AFAM Tomer Maimon <tmaimon77@gmail.com>=
 wrote:

> Add the following missing pin group and mux function:
> smb6b, smb6c, smb6d, smb7b, smb7c, smb7d, bu4, bu4b, bu5, bu5b, bu6,
> gpo187.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
> V1 -> V2: clean tabs.

Patch applied!

Yours,
Linus Walleij
