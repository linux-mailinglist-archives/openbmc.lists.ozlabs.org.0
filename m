Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FDE4D7A2B
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 06:23:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH4h91KRpz30J9
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 16:23:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hWqibxql;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hWqibxql; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH4gY22Hjz30Km
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 16:23:05 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 25so20187188ljv.10
 for <openbmc@lists.ozlabs.org>; Sun, 13 Mar 2022 22:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6TkxE6xRz8g17WpiXoeopvahoKZFX3mggMkzcb8O1aY=;
 b=hWqibxqlbX30iNxmQcq9yrTmRgNz5WW+C+UaQbxJOt8UUkVovhD6Rv1J3fh8Qbn7qj
 oODu7FdYsKewjTnXR/lO26F8XIVtkXy7cp+f27eCFrvEK6rL4jZWCt1lidBpZJJA/mTG
 FLC3egVqjWkqOsj/mOvP31/yalWYlli1SlnzGMAHyam9skPZbyEZA4pf6+5f//VHYR2Z
 9ApATWJfDAGcwrPcn4TMcAUBQx2t75UYsWMNrRHCmzKlQua1+Zd9b5CyMewfPcsWUd2e
 Z7aBkfb8bLbO+cjh2ikAM1iPjW8pC7KvkJRl3NDgpOE7v9p9pHLBXb7/4zPHsgAojfUI
 4VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6TkxE6xRz8g17WpiXoeopvahoKZFX3mggMkzcb8O1aY=;
 b=YEuT7K7PdKgmmiqIaiVACg7QaCdU1r9iOGzTDUjC0e3tyEsLeclMrWMj61VzghC7rh
 aCRoUal04oCnIGYphg1ZYyjL2teoHiDPlHV79YkjfD+gTOwYdQ1zreWY+5LLryK6soQ/
 jAkfCo9f7Z2LD82k/l6EefKSZuTR3JAvNfz6vbSrfS9xkJ1m58c4Vhv0ajrurSe4XED1
 3uvyStFXCSKJWSilEGKhd5eSFWz6c/W1uR5IMkv3CogOBEuRV0K3BUfzfQJ2OvRA9QB0
 5W254nLs4STpP6RJApU1ZXp8fos+vKUY8HFA/LBpNHI3jwUrmoY6wCy+z2MhS5epnrtd
 ecsg==
X-Gm-Message-State: AOAM530EX86e69NtDgqfXx1i1vhp0midSRAwUVywI5ysGfWf+mANwuXb
 ivVcESe6uxCvzAB4TT6JCHIIK0RzB6opcGRDIbk=
X-Google-Smtp-Source: ABdhPJznoqn3GnpSLDMourmwmSBvSHe6fvICru56pmG6i2weBMsM9aW26AJtZ8U1IMpj566TkIOiTLnBfnTtl/yzrjQ=
X-Received: by 2002:a2e:9b48:0:b0:247:e0be:9226 with SMTP id
 o8-20020a2e9b48000000b00247e0be9226mr13129165ljj.487.1647235381209; Sun, 13
 Mar 2022 22:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-2-ctcchien@nuvoton.com>
 <b9eb6b6b-b295-4d10-d4f2-c56461994d71@canonical.com>
In-Reply-To: <b9eb6b6b-b295-4d10-d4f2-c56461994d71@canonical.com>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 14 Mar 2022 13:22:50 +0800
Message-ID: <CAHpyw9ccSuzGLvjwDk-MxrERb=cmcdVACaXEbKsSkCUr5za+9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: nuvoton: Add new device node
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING <KFTING@nuvoton.com>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

OK, I will Check it.
thanks for your comment

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=8811=E6=97=A5
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:59=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 11/03/2022 02:42, Medad CChien wrote:
> >  Add NPCM memory controller device node
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
>
> Subject is too generic. Describe shortly what are you adding.
>
>
> Best regards,
> Krzysztof
