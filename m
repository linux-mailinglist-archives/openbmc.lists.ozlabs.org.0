Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1D5713E6
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 10:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhtYx1CYmz3c3W
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 18:04:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxhyLif+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxhyLif+;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhtYZ5rzmz3by0
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 18:03:46 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id bp17so4769808lfb.3
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 01:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/bW8s0zoH5UpbLSo1+jfXj3G0A2yQEqrO879sTZg5Q=;
        b=VxhyLif+q+1G5dGPSu8k90vU6hL373LvHxZVzMk2MsBLRbSavwWVZuWG4a7zM8cQyY
         BMMgqdsHgFtEmT177VKDRc/pI12Gty4TW6NC70OWWz8TefcTzMbk/okzFrp8kY4+EiP6
         EjB100143GnuOMTbCmW7YjtnPof97VLNkIz1GsOc5nw/85fSnZTJDtl+RpRTrsd+dG31
         XfgxLsHc1ubY3Z8e1zzV2DOQzihtp+ayYK15qMCNTM/Ald/3WoVLN3ljCiaXNNhCd/4m
         5yGdhq5+Ck5mb9puVd2BGr5QutymWQVbpD/CLv/Ve8fAXdHvonmIwHoolZB1N4oioj0h
         3ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/bW8s0zoH5UpbLSo1+jfXj3G0A2yQEqrO879sTZg5Q=;
        b=3leZGcGXiJWXETwJja6G5Ud1vydZsOkBiOnnsMA5ZrMimrg0Erzg/F6Qv+H5TQDE0u
         iNe/d5GF8iMr3xpT1sAtmlOTsX7Tvo5cBfKXH4mAskUQuw/d3RY5ddeAp6Gbu+tYXSsH
         IsGs2buH89cvCnRIMpdTQTj0KpWrC3J8XbO6hIxZQn1oX8xOvCFnn7BW4k8DcKjGPA21
         jO4d4cvZJvcrJvZUX/K3lP+u4eu6AqWWngUlWyoJjIF31XEhJXkdNDpcsbu0EcotqzKI
         tqWeswjNlOGgPA+hzSmCXPwGvlH3Y7M5vYa6LncMHtpnF0g63wBdfc7F4E4pKJabESvB
         MBAw==
X-Gm-Message-State: AJIora/crXtNExlSUYK5MA8UmjeYMBjirZs1zvxbKRvGtTig9lgAYsEB
	TngSaISASexgZVq1pAa3E1336IakL0Fm69DbDNQ=
X-Google-Smtp-Source: AGRyM1uetHv/UaG2R06jgnf9Ql2EOiVLPNLAlyTB3qAJPBJR9BfzPSFpwGS8ztIHge2xsMxx4c18CNJkdJ+rPX76K6M=
X-Received: by 2002:a05:6512:1188:b0:481:2eb7:f2 with SMTP id
 g8-20020a056512118800b004812eb700f2mr13946842lfr.401.1657613022433; Tue, 12
 Jul 2022 01:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134312.234268-1-tmaimon77@gmail.com> <20220711134312.234268-2-tmaimon77@gmail.com>
 <1657562119.172361.4172123.nullmailer@robh.at.kernel.org>
In-Reply-To: <1657562119.172361.4172123.nullmailer@robh.at.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 12 Jul 2022 11:03:30 +0300
Message-ID: <CAP6Zq1jAzHysKaVMt960hsL2rN05_kfC265CS8Xcz1r8KOQDPg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: npcm: Add npcm845
 compatible string
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comment, it will be addressed next version.

On Mon, 11 Jul 2022 at 20:55, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 11 Jul 2022 16:43:10 +0300, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM845 ADC.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml     | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.example.dtb: adc@f000c000: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['nuvoton,npcm750-adc'] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/
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

Tomer
