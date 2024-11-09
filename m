Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8E9C34F4
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 23:04:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmmsR6dlrz3fsG
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 09:03:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731159873;
	cv=none; b=GuJixypE7+mF5kExr39GqQtdJiq9yhpnYL2yTbhr22++p9asyJXsC+3DV2bGr4CAWrniNosvDvKygI6VwC4QX0SP2YpW0fXnjuEgtWS89Me8Xd4B1lBHhPw8p+dLTAjgHxowiF+kVfxmaD1+IWKAWW6xJ+o3s7nDedq1qiPM0E0L3ngpSm7Hjm2UdSbUUMoiclBbugN3MVHWXkdqvXOLvknBq10miVNBpg7Ntl+xwYmqVqmBIkvheQ6NKQvbk2GvxGpWK/tALgylgRb5zow/7+EXLn/lDPF4OXFsvfWkIUfMrzNSWa/qNB0F+RTyuBqwKJtkhlX/o0+RoZ2AThX5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731159873; c=relaxed/relaxed;
	bh=WoZ57qddA0XNs+U4OXoyKmUU9v8BtVPsq+8KlVqlkqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bLqRPRP3NbTiEHVAeh9EDBw2VPs9bq8Ldv1zq1ueLkI9a0bdMxVWhC+gT5DAnqKyyPWwZLva0Vrsw/L3dGz5zkKJXLe2sBoXoPGnBJR6lt0ZPwXbzMb5YEihyvRd6rO8wjO1E5ayNH+K5CxYjNudCOUmXp3xj7E+UmvoxOAQjL8jCbWsvBaCLqCC+ZAqvtMVQ6i6B8kLKu4igwH5CU2FuGsiFYs3RRWWvKVhOnKeOK1L+cQbGYA9FIAglBfeTcEd2j84NA3uCsTIZnFfC8GAA13tGtniShsZdqSaLbSETROPXAc5hqLjyS5EURyiM8ACqowpYy4XHKzG9v72NCVaPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LqVVjo06; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LqVVjo06;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xlxr050G1z2xVq
	for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2024 00:44:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF7F2A4028B;
	Sat,  9 Nov 2024 13:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802BAC4CECE;
	Sat,  9 Nov 2024 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731159868;
	bh=49p+eh795isltErL55vp27x/rduM9Do35UMDcUDQ568=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LqVVjo06OL/EBPtrjzpJEvEfeFkJYuKeSfBz2fk0SzZIM0HtmuhEmAOVz4krroLzX
	 80eb6GD4dZaQgeO8gNUSnFew8tVEWtMlFU6XdNMtYrd36ZtPkAcu3olVwRP+2s9+Kw
	 OriU8bIh6UX2UBC7+uVRCDIqCG2QDqv+Wtz2CkE/83t4KTARb+zZtfI3ULX8vPMuQ0
	 2leJxqfWPDJ9HOvKYuAf9ufpbiOfoGxyl745M1Omwe6YWc9ozKOo69I3hz8cm3GvTq
	 AsIy8gpQv3ncQNlhUxskZ5nf4bbK3mRe/Kb83gRBbPnYzbOZXaYVipcrzS7YgEp634
	 MRY5XguKDtULQ==
Date: Sat, 9 Nov 2024 13:44:15 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
Message-ID: <20241109134415.2f31c449@jic23-huawei>
In-Reply-To: <20241106023916.440767-2-j2anfernee@gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
	<20241106023916.440767-2-j2anfernee@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 11 Nov 2024 09:03:25 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed,  6 Nov 2024 10:39:15 +0800
Eason Yang <j2anfernee@gmail.com> wrote:

> This adds a binding specification for the Nuvoton NCT7201/NCT7202
> family of ADCs.
> 
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
Hi Eason,

> ---
>  .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> new file mode 100644
> index 000000000000..3052039af10e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml

Already raised in another review I think, but pick a part number and name after that.  Wild
card get broken far too often for them to be usable like this.


> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton nct7202 and similar ADCs
> +
> +maintainers:
> +  - Eason Yang <yhyang2@nuvoton.com>
> +
> +description: |
> +   Family of ADCs with i2c interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7201
> +      - nuvoton,nct7202
> +
> +  reg:
> +    maxItems: 1
> +
> +  read-vin-data-size:
> +    description: number of data bits per read vin
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16]
> +
> +required:
> +  - compatible
> +  - reg
> +  - read-vin-data-size

If you do keep this, then pick a sensible default (16)
and drop the required.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nct7202@1d {
> +            compatible = "nuvoton,nct7202";
> +            reg = <0x1d>;
> +            read-vin-data-size = <8>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91d0609db61b..68570c58e7aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2746,6 +2746,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/*/*/*npcm*
>  F:	Documentation/devicetree/bindings/*/*npcm*
> +F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
>  F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>  F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
>  F:	arch/arm/mach-npcm/

