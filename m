Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9FD9E4779
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Wpm2Z6mz3cdn
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733302107;
	cv=none; b=fCjhqNiodVYA+s6TXFVKoSf43N9d68IIcKSvUwhiHevRnTX9yGzqm0k3MZl2GXkaE+WxP8goMPJEM9OQbIhjlqjENDB06x4AgPPWAETSviZWGZOCmNetOfAserrI9XYK0w/R6C6t+0GsOh6Gz3fKoB8m0JQxnphDhdltkRwCTodfMt/+KhZO3h2fmp8EX9YxQKtdguTiPX+7ksEsizK4d8B1rz+Y3KTwOGj6/0SWl3P8YMRZR5XSTAav89gD0/fQQCL06k1UJFcZpcfWuZ4wnVXNvJy5w7U+rkba2pwleklZJa65g/23drjJQNLLimZ3KkfD6qYdPsYt+dJY0sEMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733302107; c=relaxed/relaxed;
	bh=FMjUUcp4s9WK33JeqEJM6ue595vQiRg0HZzRgWfe0OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ro+H0vl+Ut90GFy8DX+IgboAR5ZhqOsPbHAQnqLEN3cdf2PRhdrF49AK4YFtZjjYtRbxn1MQ3HJkAik5Sck0H6SwDPCn99vhGyg1Zw+wHCdBIcurWrWHZz9WihrVRe9+5voDKYgTWR3sQUw3Z6FHCOmJ6ZRNdzxB+HZclKJdjpHd/PE0mZAWnUWhRlkFZjmLwhQkQ6c4C+yXDqtjkXIbSq91PmnEeBWkxcIDqR0n1WYuBjFynRagmTLLAfzkvGPrLV5a1ysjv9zJnD1NJwq8dg15wX+G38ZpXwmAbm46mkU998oeL9eTimk1C1VLRBRLtJzv4ErM2qvGMLPAMpZOGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Io8161qY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Io8161qY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3B4m6hkFz30VS
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 19:48:23 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d0bf6ac35aso3128121a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 04 Dec 2024 00:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733302097; x=1733906897; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMjUUcp4s9WK33JeqEJM6ue595vQiRg0HZzRgWfe0OI=;
        b=Io8161qYQUV6V0qz5Hktz52NSaKmarAj6ZGYi52cL0/hyfNe9JFEad4l3xnSqXNDZb
         Iewyu/lU6SRPuKDZRCmReRxeUFD0n8a7doiRvw8wcpTIw99uNjCu0Jq/RfuCbHF9/U84
         ENtLjcO56ZaKCl+h2cWraSWYI3qJGOfztd0jXEi5sjQx9bO59txNBdEJUHZUBNItERE9
         Xz77zDNeRCwK8y8yDCRtg9o0MTWXuJmdSTUBy+/ld+CdzKa3BJ5jB+WIqNgn8hjYNKIg
         BL7Bb08FbCMcm1bAW0NUQ96wC6ebnkdbJEGBsBV/JkG1X2ljwzkpNUHHUui4QpSB7m+0
         lw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733302097; x=1733906897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMjUUcp4s9WK33JeqEJM6ue595vQiRg0HZzRgWfe0OI=;
        b=acTglj4XV8lkMHWx1HZcXaOK1qHPv70N8c2A9w9QBP0NsG29jlrkZgEHlbe+llqXEO
         qUNcqspG1dOJiq2P+1vAYlivtXR14Yf21iMecs279zXJarh7Bv5cIFPo5IrHOEdxCjDH
         Q2ebGvxiqybHNGnhsKXbAXtTH6pES8vT71yAwAJAZvvUxVSxjmCXhtKGafDxF8OhB3Ij
         TibkRmFABtT1MUK6Lc32iJoXAZkGUyLJ4fkOIp3zGq+23xZ+1QzPruRvV4J0k4RmrMcS
         Jlj6ReNdoEKg+4N13fto9CT1aPev5foOMgcnHOVsOeTMvH9dQEJoy7e44sqpoUNBe8vn
         Uj+w==
X-Forwarded-Encrypted: i=1; AJvYcCVeGTrPZ2FbAhMlzZ0aZg/QN+1h9BDK9+tint7CPj/Gwf5qDedy6GatI9rzMZ5Fm5EONWe7dyos@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQGnztF84GGw6hvVSuPyfE1LrebuuCJvloHZi6voEvNi60/i+Z
	5EEz7K4Jw8eiVzF651MSic5JDHiS9u6CWHZodKOHNoBT3EcSWLblrCHKYVxEAdf7hN/TMvxoYLe
	NCPc3fv0TcWyymSe58UqBJn1zp/c=
X-Gm-Gg: ASbGncsISv3txinX7E5MEH9fFd6QpGhpwBuY/tMSyy2SjXWpKKuqCox277WwwHgA3zt
	nIepKeC8G0+3X9WCyA/RnOy8Eb6TSPvE=
X-Google-Smtp-Source: AGHT+IEV994LEINSr66a32qFp1PLrkVFbJKep+D0UOrnqshNaXQqn1YPwdFJS2NDx4pAab/+t04tbGLuIAzMXMB5q68=
X-Received: by 2002:a05:6402:51ca:b0:5d0:d818:559d with SMTP id
 4fb4d7f45d1cf-5d10cb56467mr6229120a12.11.1733302096963; Wed, 04 Dec 2024
 00:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-2-j2anfernee@gmail.com> <4c5044a0-8286-463c-ace9-78a4245f112e@kernel.org>
 <CA+4VgcKWAOh=sQ=wUUPD89ORjYqZP0EDqJfqFT7FjNPppf=4Ow@mail.gmail.com> <4a223d37-4fe4-4ec3-a5de-def15b8b3761@kernel.org>
In-Reply-To: <4a223d37-4fe4-4ec3-a5de-def15b8b3761@kernel.org>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 4 Dec 2024 16:47:40 +0800
Message-ID: <CA+4VgcJs7kwHyjj0VtVkicK7j+XNh6aAcexg+cVp5sgPNnRzrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 05 Dec 2024 09:07:01 +1100
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Krzysztof Kozlowski,

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=884=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:13=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 04/12/2024 04:10, Yu-Hsian Yang wrote:
> >>> +  reg:
> >>> +    maxItems: 1
> >>
> >>
> >> No other properties? No resources?
> >>
> >
> > The difference is to remove read-vin-data-size property and default
> > use read word vin data.
>
>
> No supplies? No interrupts?
>

We would add interrupts and reset-gpios but not include in required block.
Add these two properties in todo list.
+  interrupts:
+    maxItems: 1

+  reset-gpios:
+    description:
+      Reset pin for the device.
+    maxItems: 1

Besides, I found a mistake that the Node name should follow.
> +        nct7202@1d {
So, correct it as
 +        adc@1d {

>
> Best regards,
> Krzysztof
