Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81EA01C6A
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:14:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRClr6wKdz3vj1
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735287475;
	cv=none; b=lgUmqmFo5TyXJiCbF+P9DnmU/nBDJaBk6lnujVvcgMzV7QgBUF39iJncA4iI14vZanFwMzDYkdg50kaD4lg1HzQlM/ORRWzW1zx4IzDe5XVap5B/4xkn9DembAo4TjuoStrwdl7HlToeWEC/olIVDWv6hdbwmV8MGtE5YMZ90Fz99D49f7FM1EQDFO1AqA9ID6ErrgpK2aiwY+h+Ur3gQ47FqxKLG5o+zeHZoHIbP5MXO5mvG9+PF4FZCIf6grEUmQQ0i1Q0f/5Zaeq7ZE3MCVlXP7NRw5omrM0Lz3rODnDl3/wHfnvsexrpdp1xo+Zxlt5gcyDGK5FrrC6Jtwx9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735287475; c=relaxed/relaxed;
	bh=F2jCgYCtr6woLWRdCdaW5VPkj1ZqB7cqqChSOkuctDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdHPfr0XY8ORc0fL1CJh2d3SIIEWsSBPsA7ydx/hzgXs8SehbJ+vO4/emyJyEsinSbJwG186YNsOjjFxgaKxQqsS1ZPEu/I1yKVS5DSVb+N9Bdyd1aaZXXsgSjhxk0MbjhTKiteYExCFKiLWCn/Xjtf6Twtvb0rdEp9yPB4OBV0Io8/y5vVkV4VMQ7NIb9HrfnueCmeoI5zaz/Xr1UpkYi+c5uCTS0eB30AgDYs2fJmxI+IvG2ktHbUfpzJK0c4fPROukCBiNpefKqEU4nGdpUr9N38TxHBUP8wVqohVOj/a/KFmLSk23lBiT04Tjv2wLzZn7rxgD4+sKgut69KmuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QmyNvC5h; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QmyNvC5h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKJJy5WRMz2x9T
	for <openbmc@lists.ozlabs.org>; Fri, 27 Dec 2024 19:17:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2844A412C5;
	Fri, 27 Dec 2024 08:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F933C4CED0;
	Fri, 27 Dec 2024 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287470;
	bh=TZfQMDuOUiOku2tocDJE/MOog1QxlRrq59siThHFlm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmyNvC5hhlproSM8IRx63sjNFTIfuc+0R5crGQrMFZe9OSGTcEWdsxt7wl9bdUoFX
	 6UWUjyGe8UAtpE7iI61xBH1id0waMBrllvZVLsoEuDz9QPWDBhUbY+Io66RqlDncka
	 h7RLFMvZIqHzGng1T46cFOjSz/BEqRl+6pikux7bU0XnviiEbbAJFEwVd6GQqDOuaN
	 Y4y+yCTm/KiWohwy2NXtSGOrTrMOK1o5B7b4MYm0PV1OQ0f4DLqrxgtvxCAszc96Jp
	 K48WDajJVSOsgrh4TuYYEDUO4MHOGw8boe3lC+IE9BEHkavXF6xOuWQK69PbL+/TYY
	 Z0x9n66QVwlVw==
Date: Fri, 27 Dec 2024 09:17:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
Message-ID: <lfthwnvwodqogsk446r5nzpmjunfnpdv33xmaookedwjgpdu4n@llvla6siyl5f>
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
 <20241226055313.2841977-2-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226055313.2841977-2-j2anfernee@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 26, 2024 at 01:53:12PM +0800, Eason Yang wrote:
> Adds a binding specification for the Nuvoton NCT7201/NCT7202


I gave you link to exact line with exact text to use. Read it again and
use it, instead inventing your own wording. The documentation does not
say "Adds" but explicitly asks you to say "Add". Why using different?

Subject: nothing improved.

> 
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>  .../bindings/iio/adc/nuvoton,nct7201.yaml     | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> new file mode 100644
> index 000000000000..08b52258e4af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct7201.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton nct7201 and similar ADCs
> +
> +maintainers:
> +  - Eason Yang <j2anfernee@gmail.com>
> +
> +description: |
> +   Family of ADCs with i2c interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7201
> +      - nuvoton,nct7202

Devices aren't compatible? Explain in the commit msg why they aren't or
use proper compatibility (oneOf, see numerous other bindings or example-schema).


> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reset pin for the device.

Drop description, obvious.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@1d {
> +            compatible = "nuvoton,nct7202";
> +            reg = <0x1d>;


Make the example complete: add interrupts and reset-gpios.

Best regards,
Krzysztof

