Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F34BEF66
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jcc3Fxhz3bV6
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:22:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZmRctxBT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a31;
 helo=mail-vk1-xa31.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZmRctxBT; dkim-atps=neutral
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2Fs50R3rz2yLX
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:31:52 +1100 (AEDT)
Received: by mail-vk1-xa31.google.com with SMTP id j17so7851736vkd.12
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tHxyOUfMHqTikNQZhmqKh+kXdtIHhN+LVh74A17t+GY=;
 b=ZmRctxBTa88LrYcPKv48Jo2DOkCPg3J8+BJGa5YAf4qOWj4lDPQyaGBnoh5LK07bSl
 GuQkwjUEljvrWqMVuobUqaDSiNGYe+hM4PAXzMX0AWUkzf3BLa89jzcu+lGYqfr3xev/
 jYZ2jaurO3ZKelDzIG+mbyK1S6C2u8hbxw8cd85rRcKq5RqK4laMNsQ+3j0IVgE99Tgn
 H1P+umePLXCVFT+WjUMEjkZn6ysW3T2YbFaE1mR4PeaygwaJSX0pxUGx7LWWr32xnNGM
 vCr3y9faUhyqQ+zxyJrFPgICPPI5FYG6b5XT1TgCEIjSYPIqbVEUkfJefYNqUTix8Ec1
 pzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tHxyOUfMHqTikNQZhmqKh+kXdtIHhN+LVh74A17t+GY=;
 b=NRYMYsczkCD0CMH0lGhZZzdH0fupBRkvxy12rU7TMUW3o9tDB5/Edc9VsV/Uebjb9S
 Iv8mTwIwdygUVqxkMwmZdh5woT+WGlTZybfjh3bjCSJzdDFCMOEzj+7m4UKZ0eyupOM6
 dm/ya1gfW5QnuW2BhLoBhAM9GAcbehQMWVF93rOZLmlJmOzcgplNHbevPD8aiVQbdT6i
 Gq99fl2OIllHJGUU90wOUCD1N7plVlMn3QmmT7AnyJ3VQVHugyweTmIn+53bw6cleKmS
 EYbk962Lftek7KfGQYsVu2nDFzQu8YlSU8xgtPb0GipPuH8ZZSVNemldBzyOizY+fEJ/
 96ZA==
X-Gm-Message-State: AOAM5316RAEMQFhmWD5Srvjk324Tmc6s2O+a5hwHYXgRk2zSn4pqygWm
 7aDDTPNi3OawJnQwuiB7dYhBNDQwl1JAgU3imw==
X-Google-Smtp-Source: ABdhPJyO2ShXUpYzMd0qiTi2EndkIjvRyGYXHcDdCeZDikC/rlrNM+t7NrbqGV6Pcl/kj/FJx2GB9JU1jI5j/1eJS7o=
X-Received: by 2002:a05:6122:180b:b0:330:ee39:966e with SMTP id
 ay11-20020a056122180b00b00330ee39966emr7269125vkb.5.1645432309857; Mon, 21
 Feb 2022 00:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-3-warp5tw@gmail.com>
 <1645410969.402841.2041548.nullmailer@robh.at.kernel.org>
In-Reply-To: <1645410969.402841.2041548.nullmailer@robh.at.kernel.org>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 21 Feb 2022 16:31:37 +0800
Message-ID: <CACD3sJaC-8BO9TkunmAfFQOow1rmWxEjhSRE-kekFRM1wmKq2Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, KWLIU@nuvoton.com, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, devicetree@vger.kernel.org, bence98@sch.bme.hu,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 yangyicong@hisilicon.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob:

Thank you for your comments and they will be addressed.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:36=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Sun, 20 Feb 2022 11:53:12 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:19:6: [w=
arning] wrong indentation: expected 4 but found 5 (indentation)
> ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:20:7: [w=
arning] wrong indentation: expected 7 but found 6 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1595125
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Best regards,
Tyrone
