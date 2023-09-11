Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD679A878
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 16:03:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zAxtgMnf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkpNH31Wwz3c58
	for <lists+openbmc@lfdr.de>; Tue, 12 Sep 2023 00:03:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zAxtgMnf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkpMd6V6lz2yG9
	for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2023 00:03:07 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6c0822f46a1so3130046a34.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694440985; x=1695045785; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htSTLHjXjD8vt5EAYXqSVCO6HargxzSV7gX/AB30oB8=;
        b=zAxtgMnfWP6rgJVTCSItbFrcLIGyt8IJ0Lz1KKkwI6C3itcGFRmcbSJzQxMRQCphYx
         gG+9pBXURlTxCWt19db6t77gMifp3GjsrzJPfGKZsk6Gpbqo1e936izPyCfzUNohfpml
         cxAjSddBF/xe8g/Suuwc9wZWEH6Vn0Rz/n/w4IwDZkqEIRnjxs5ImfURlg4IfhGHeeOS
         T6SlEMpfoD7JhvCloBp2qQmdIehk9bDfDLUR2cDmr+DfRJQYri35p0a8J/8FiDbPo8/W
         RJzHZxLPU1ecJ7tkaiTRTJx95sw63KJWG4+Mk7EWXyMfA1dL72TRENld1EikDqe684kN
         5qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440985; x=1695045785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htSTLHjXjD8vt5EAYXqSVCO6HargxzSV7gX/AB30oB8=;
        b=X2hWCihtXOciMoS4gaLELJqMCKdHL7dZOAWGHX7nr0AuOmszY4OnSzMn6X0+1ab8q3
         0KR3c0yQYmcSzN6CJVFPXPapEtx8QCVVqXbfJaliZxmcAjhVh4lR/vIRIanJcE/SP8/l
         A7YDX9XME6XR89Z0s8HENjO0cku1ehYvE71Nkj1H9Pp5YVPtIJ1C2CHvjdPFp8dJiv5I
         uz+fk7HIi/DTGxJYHBp+uKXshNdgzBbA+x+Nrhwl8lzRfpwER1PyxPZtJg8C70w2pgE1
         xGG7a6bNrrht+sN6XJg2rrIo0fZd/6E2esUuf2dj6dx6ewJXRpjLYmmymd7DQhQAxyQP
         TRoA==
X-Gm-Message-State: AOJu0Yw8ZCBOHbRw5ccBJBn3k1O+FZw2/lUBJOf2bK5S/LTSTtvdBynU
	7S0Eg8SbD6jEaas575V/3x4DiNUddV0HN79jWJkwoQ==
X-Google-Smtp-Source: AGHT+IE9jU1FIU4/f7jfsz9Rxe7QJ58u0dK8sOWYKbT++bpDZ1zCqq2z618I6/2zgrXrXtGljoG5HE5wpdQJfoU3BhM=
X-Received: by 2002:a05:6830:457:b0:6b9:9e4f:5f4c with SMTP id
 d23-20020a056830045700b006b99e4f5f4cmr9593916otc.29.1694440984758; Mon, 11
 Sep 2023 07:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230828140849.21724-1-tmaimon77@gmail.com> <20230828140849.21724-3-tmaimon77@gmail.com>
In-Reply-To: <20230828140849.21724-3-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 16:02:53 +0200
Message-ID: <CACRpkdZk8dKGx2HUoRhkRo6DBkycKh5EkYiGWcFot3OOZnvdpg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 28, 2023 at 4:09=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> Add pinctrl and GPIO controller driver support to Arbel BMC NPCM8XX SoC.
>
> Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
> pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
> period time.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

As mentioned the patch is already applied, consider the following
as nitpicks you can address in followup patches.

> +struct npcm8xx_gpio {
> +       struct gpio_chip        gc;
> +       void __iomem            *base;
> +       struct debounce_time    debounce;
> +       int                     irqbase;

You're not really using this are you? Delete it.
Also the assignment further down: you do not use it I think.

> +       int                     irq;

You're not using this either. Delete it.

> +       struct irq_chip         irq_chip;

Not this either. Delete it.

> +static int npcm8xx_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                 struct device_node *np_config,
> +                                 struct pinctrl_map **map,
> +                                 u32 *num_maps)
> +{
> +       return pinconf_generic_dt_node_to_map(pctldev, np_config,
> +                                             map, num_maps,
> +                                             PIN_MAP_TYPE_INVALID);
> +}
> +
> +static void npcm8xx_dt_free_map(struct pinctrl_dev *pctldev,
> +                               struct pinctrl_map *map, u32 num_maps)
> +{
> +       kfree(map);
> +}

Can't you just call the generic functions directly?

> +static const struct pinctrl_ops npcm8xx_pinctrl_ops =3D {
> +       .get_groups_count =3D npcm8xx_get_groups_count,
> +       .get_group_name =3D npcm8xx_get_group_name,
> +       .get_group_pins =3D npcm8xx_get_group_pins,
> +       .dt_node_to_map =3D npcm8xx_dt_node_to_map,
> +       .dt_free_map =3D npcm8xx_dt_free_map,

Here?

(...)
> +static int npcm8xx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                      struct pinctrl_gpio_range *range,
> +                                      unsigned int offset)
> +{
> +       struct npcm8xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev)=
;
> +       const unsigned int *pin =3D &offset;
> +       int mode =3D fn_gpio;
> +
> +       if (pin[0] >=3D 183 && pin[0] <=3D 189)
> +               mode =3D pincfg[pin[0]].fn0;

These magic numbers should really be definies.

> +static void npcm8xx_gpio_request_free(struct pinctrl_dev *pctldev,
> +                                     struct pinctrl_gpio_range *range,
> +                                     unsigned int offset)
> +{
> +       struct npcm8xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev)=
;
> +       int virq;
> +
> +       virq =3D irq_find_mapping(npcm->domain, offset);
> +       if (virq)
> +               irq_dispose_mapping(virq);
> +}

I would just rename "virq" to "irq", it is a Linux IRQ, not really
"virtual" which is what the "v" sometimes stand for.

Yours,
Linus Walleij
