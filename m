Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB29E4775
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3WpS3gGrz3fSm
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733281881;
	cv=none; b=OJpB4koO2qoTDy/DW97pW5qnvnIyfRemgoZcLZOh5uPk5Sarw+7Xe0yFH0+44O8l8m88KiwIHEka/+J84OxVrn33JrrJ9oFszs/qVZGpIKGBDzw37ni8TOY5GqDYxefpysjN/wqVjXlYLx/+dhAPTfACXL4R8UDgqIeLS3U9MTZfyJXuHrvbOlcTuAhc0w0aa6PaD/+F22BqDb++9QDFFCvv5WQOFUZxdBIgBBcyq7AywyPAFkx04dZCrbv41D/fyb5JUSphrR1n7bJG44//qr3zOGCNgLzOJWq888zOcfUofx8GJ9g/G1j0gi6XOy7C8bzNePx7CKQvU/PjDW/7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733281881; c=relaxed/relaxed;
	bh=vHq1dAMl45aI7ZS4WgJJtiN3EJIyNkMWjx+eXqTV7sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kj8s5bcYTJkg7T8Z9egG0nxu5+nYdesJpW6XBYfZEMCser6vbz76aNtaA0yjDY68EVNEjsObSgcXQwJYdzKccbIGrvO6h4YFaoIu+kKn7eOgIoYEeb89xbAsi/A4sVtglnm4y9XIIEjPf0LfTKI1UXgrpvIyAUxFB4YzFQe4KvsmyNMVU1rKLL/rbnt+7UfecqJyAtq7WG+1eGJzALRYRzxRdqKucyC3QH4SFhUFKZTumNng14erHpoZsB/5yJOydsOI9ulrYdKoqY8tgg/8xe79s4tvRIw+YnzSARex6nl25oE7e26Pshg6PW7Ju+1CkTOFvFAIMIQxFmWhqKcw+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jHkNLw3b; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jHkNLw3b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y32bq2wFRz30TY
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 14:11:18 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa549f2fa32so934409066b.0
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 19:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733281875; x=1733886675; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHq1dAMl45aI7ZS4WgJJtiN3EJIyNkMWjx+eXqTV7sU=;
        b=jHkNLw3b9S98b7o1TInB3uPlw6AwJUNC9LcbYAmvPjRn88pAP3FYEkkqPLyvL389bZ
         M73gl9VID9YCr2kY+2ODC5VlIMaHzGettlAad7SmhQ+yMshdnE7Ne+hHb505xu8D39Xb
         /9LTr/lL7lxQJYS4V5i5odsX79RL8Nx+OjoF9Hj5GJUVwKYogzRI5maEWwxZWT21UHNq
         CG2cTNYKrIXLCjSL1+3mClQwHbXuRjSPB8Q+gur5KSCTqdCrdBkJfKTY7IkJpVM4EKug
         XX5s8hkNh1EvVJVYsT+wwWBR13KX7zlSzxfeiyK/ArAZkwNmSeFoe1XwgLmblarjNtYx
         XmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733281875; x=1733886675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHq1dAMl45aI7ZS4WgJJtiN3EJIyNkMWjx+eXqTV7sU=;
        b=R5vSnxIWIxCqe3TMhEG2gjI/k2gOp9ChLD1509RSmbeyCeO8BdWUoF3Vxd8fevAdBB
         pIaTSNtpm3A1UukQF/LN5lSwqqPZ7yOvqzbyWPgssJmMqxFHOQKbndDvk7CC4itayVVE
         hdUQEgORJV2Qpfr21j/7PHM+PruIZcm+qccwYRpo9l9Gk6N7IhR00/cO9AdntfVq8lxy
         ZKytgzlQeK9tgMK0evXR68cC9q25i1fdBFRTL3xkVQXOJNHnFmOTW/53pzJGnRa3134n
         Mz98MfAf2T2y78qmrOu2VQ9U49+fIlOfSk+j08GWSrqVEFA5GqpCJcGvOmF4qeixFdqW
         UUTw==
X-Forwarded-Encrypted: i=1; AJvYcCUHmdZ8iBbJ+G0PUc5uYLcQvc73NWeuAGW20WvEVGAA0lkTU3hvNlBZnL84gyu0Ht55RSCpKKY8@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLuVlCTyfyO/DkIRyc5lRkH7TnPRrBTBBlt3X0LtoEwLToJ7ZG
	uszwZoaYkfY0qKTqX8Sez8j/p7+xqvjlyP23cTpbFTn1icxSjsFXU+GMsLcISVKIGEFbrk4iO2W
	JjgzvyubZMHIV9b8Cp9VgrG/mGNU=
X-Gm-Gg: ASbGncsmyjmUNx3GqY/UK5fPmZ8ARXhZddCjpZT4xnoPJ6V4WiaXbFeXDkkRCqsfTcL
	WJKpGG26ONXBiX+Yzu0DKIOPGli9xdvY=
X-Google-Smtp-Source: AGHT+IHq0xfIi11duE9fpLS8hULXoZ211QH6ftIQfZtPmWl0i10iI9AvhODiMZP73poEwbzDTPOxIXqVpsVjjeTUD1Q=
X-Received: by 2002:a17:906:9c9:b0:aa5:4d72:6dd7 with SMTP id
 a640c23a62f3a-aa5f7da2bcfmr315567566b.29.1733281875078; Tue, 03 Dec 2024
 19:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-2-j2anfernee@gmail.com> <4c5044a0-8286-463c-ace9-78a4245f112e@kernel.org>
In-Reply-To: <4c5044a0-8286-463c-ace9-78a4245f112e@kernel.org>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 4 Dec 2024 11:10:38 +0800
Message-ID: <CA+4VgcKWAOh=sQ=wUUPD89ORjYqZP0EDqJfqFT7FjNPppf=4Ow@mail.gmail.com>
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

Thank you for your kind feedback.

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:25=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 03/12/2024 10:15, Eason Yang wrote:
> > This adds a binding specification for the Nuvoton NCT7201/NCT7202
>
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/sub=
mitting-patches.rst#L95
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L18
>

I read the submit patch rule and understand how to rewrite it.

> >
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > ---
> >  .../bindings/iio/adc/nuvoton,nct720x.yaml     | 40 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,n=
ct720x.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.=
yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > new file mode 100644
> > index 000000000000..2ed1e15b953b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton nct7202 and similar ADCs
> > +
> > +maintainers:
> > +  - Eason Yang <j2anfernee@gmail.com>
> > +
> > +description: |
> > +   Family of ADCs with i2c interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,nct7201
> > +      - nuvoton,nct7202
> > +
> > +  reg:
> > +    maxItems: 1
>
>
> No other properties? No resources?
>

The difference is to remove read-vin-data-size property and default
use read word vin data.

> I think you skipped quite a lot from previous review.
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        nct7202@1d {
>
> Nothing improved here.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
> </form letter>
>

Thanks for your friendly reminder.
It's impolite not to reply to every reviewer's comment.
I would keep discussing with reviewers and apply the changes in the
next version.

>
> Best regards,
> Krzysztof
