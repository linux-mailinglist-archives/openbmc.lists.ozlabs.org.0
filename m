Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4003463DCC1
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 19:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMnNx0lPNz3bXJ
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 05:12:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.175; helo=mail-qt1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMnNX2F6xz3bVq
	for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2022 05:12:11 +1100 (AEDT)
Received: by mail-qt1-f175.google.com with SMTP id cg5so11697760qtb.12
        for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 10:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3Y+CLKsmq/zvpZ9sIIrYnKxsjyLVOCHxaKyu/MIB2Y=;
        b=5dsPyP+WcQzCQ4Kg2yEg87uMdJe6WplSMtQcF+GC5DSnhIhRXfzA8kdcUrY12Xvpnn
         2g3FgzRy3KaydgsWQ7/bqJrWndiETE5ud6FNVFF/pRWrcm+T+PAs8ig5y2OEk4vURl4W
         jHGHRHU2z4B2GH9UokJJWh4Y7JCmiCpSQ37oRfXMkS/3M5fhjjmBQAShNDBIOowhN3eR
         BvssTkU4h/rppewBEAD+xUP/wKtCld/FWBnqzHFJKKFalYWuML4r6ightrAXUoni6hIe
         Clv1sOUwuLdccAnbPLn+PX+qkIvUF4tToxl1XLTUHg9WKJt1wiL4TU6XmgIxeNQJUlCv
         l0oQ==
X-Gm-Message-State: ANoB5pk2rpCga0skq73tv3mjMTDFlWDm7LPvV2yN9EdftuaEm5rt4JSb
	R5Kp2br7LfJPCs7LWe1qIR/X7mfDZQy5Eg==
X-Google-Smtp-Source: AA0mqf66obeBdQVet7Oh5QbZ5ChYY0o1OciOIUbDplXP3eOGi3BX2ZDowx95x74ZJrPfwcb7z7+qlg==
X-Received: by 2002:ac8:6792:0:b0:3a5:1c8b:8890 with SMTP id b18-20020ac86792000000b003a51c8b8890mr59489012qtp.63.1669831928150;
        Wed, 30 Nov 2022 10:12:08 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id x1-20020ac84d41000000b0039a610a04b1sm1213607qtv.37.2022.11.30.10.12.06
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 10:12:07 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e141so22629041ybh.3
        for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 10:12:06 -0800 (PST)
X-Received: by 2002:a25:7a02:0:b0:6f7:952d:b145 with SMTP id
 v2-20020a257a02000000b006f7952db145mr12544760ybc.604.1669831926518; Wed, 30
 Nov 2022 10:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20221129102225.3598044-1-j.neuschaefer@gmx.net> <20221129102225.3598044-3-j.neuschaefer@gmx.net>
In-Reply-To: <20221129102225.3598044-3-j.neuschaefer@gmx.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Nov 2022 19:11:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+d3tW1kVN6011m9JDuW53aGedKOUVt33yCOmhs9Oong@mail.gmail.com>
Message-ID: <CAMuHMdU+d3tW1kVN6011m9JDuW53aGedKOUVt33yCOmhs9Oong@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Fix warning
 in example (missing reg property)
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 29, 2022 at 11:27 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Add missing "reg =3D <0>;" property to the flash@0 node in the example.
>
> Fixes: dd71cd4dd6c9b ("spi: Add Nuvoton WPCM450 Flash Interface Unit (FIU=
) bindings")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> v2:
> - depersonalize commit message
> - Add Krzysztof's R-b

Thanks, this fixes "make dt_binding_check" for me, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
