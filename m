Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A805F3D69
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 09:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhV610BcFz2xfV
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 18:42:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBF0PMRI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBF0PMRI;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhV5N3BS1z2x9L
	for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2022 18:41:41 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id w10so4790194edd.4
        for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2022 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=t4gsSkEDUeyo1zPk5TwWbQ0/8jC6JrVvqb9PexG5Ag0=;
        b=UBF0PMRItbOet9L4f2H+UFFYBdoamlZngKZxhmQcmjGCsvkL5BCA1yDi+Qq4SRGf9f
         uRxylnAahW+3faOGYgpYURRQOXnPT3AImJrst2EBOcp7SmpVwrAT4iWqwDNNhnaCFCCg
         nvYwpOcuno9NJ11rCbQ7xt1GuiwuCPysxwSa6vxRaeiVOajb3DKDRJ/3R6UL3wR+H8S1
         m2dCfN5LQsnz3neoqgEfAy3dTROueQIc9/SWClraMOr8IBMoyO38ljGk5qwTUHpq/O/W
         lmwSo9I+cRf/B/FW8EZ4alGP2p3TyTee2k6jsgB9WrvfX9qkze4D+rJm9/i+FlWAMUFl
         h/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=t4gsSkEDUeyo1zPk5TwWbQ0/8jC6JrVvqb9PexG5Ag0=;
        b=AfpUpFofOnlugx9E7qCXxVGrBPsmvg5TzHsxgEEbCBeaHebkQoGmIr4/XV06oWh5wf
         hJAW37VLhpoxC+ab1Md/whYgsrNfZTfZ+Id1qB9MfHCg6vi1uEaafiovEWwkuTsWW6k1
         uNJK6qbnCUZy3UaZoeolO4NGtKrJw4JXyLNhtevtOljCrszaKaUtBNBb4U0RemqN5zzJ
         EONBUh0Vl/SKlPy6CmMTtVIf4nSCwK2KW/rILQlQJeOuZnAa3r2EI3Wx15QVlM8MMuVl
         7ciSQvfSBJ+WXCS8KO4WV8z+sKPyT1C1UpyapNw8WYqX2m79OZFChOYZoaCDTTu5gF+l
         bJDg==
X-Gm-Message-State: ACrzQf0bT86GrTXy37P31xSKacne7tKaNNb2PWYE1mInxQp9nzs/7Qcz
	BqxVrhdPkPSN+Cu1YcFcY5rBdAvLmpvkDelMAdldsQ==
X-Google-Smtp-Source: AMsMyM7GQcaTrnPcsi1VG65yXFMT0nakTfMnpSDx6YTX6GPrb1kCV0eO/IJHHdVl8u3JfE6s/LkAd6uv7UmF8qYAOjA=
X-Received: by 2002:aa7:c050:0:b0:453:4427:a947 with SMTP id
 k16-20020aa7c050000000b004534427a947mr22287577edo.172.1664869295589; Tue, 04
 Oct 2022 00:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 09:41:24 +0200
Message-ID: <CACRpkdYfzE5gvc_L7qfN74gcG0KT=w4D4ZqHQyXT_x_uBXNqTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get()
 return value check
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 27, 2022 at 7:54 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> fwnode_irq_get() can return zero to indicate IRQ mapping errors.
> Handle this case by skipping the interrupt resource.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
