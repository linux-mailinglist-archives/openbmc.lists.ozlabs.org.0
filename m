Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0929117C7
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 02:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NcKP2jFD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4zFY33FGz3cXj
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 10:46:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NcKP2jFD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4zDx5skvz3cQf;
	Fri, 21 Jun 2024 10:46:09 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2CAFB200DD;
	Fri, 21 Jun 2024 08:46:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718930767;
	bh=h5dRVJQy35axM2JOoP1ujWmkMFeh76MXxL7uKyuYIiQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NcKP2jFDsy3aMiuCUjlJitK0s9yShifLgb5vm28MeUlTnqmsgIp2/PB/VucMSCcam
	 rahb68dvUNUlRGuJLadUjLmlZyg5/xoUVx5+1fonqn74wt+ZNf6Pv4cC6jg+SbFsG0
	 9tBbVGebycFgyuWCj8qS7N+BEDOXWYM2ZaLNjWxFcmQRnED1f90H7bjWCtby4463L5
	 wYLVxi8+FCcI31bL1vNMRorlVeZUg1cO4UskuRdTP6KT/0dN6oWOM267KRvzkQ25C6
	 bTBAbXaNEcm60jQWPg7NbyZJ+twyZH+VQZrw6MBmjZAMWhhagHHjZqNQbMtlT5xrbC
	 JuOc4S7LikPEA==
Message-ID: <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 add NCSI group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Jun 2024 10:16:04 +0930
In-Reply-To: <20240620084337.3525690-2-potin.lai.pt@gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
	 <20240620084337.3525690-2-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Potin,

On Thu, 2024-06-20 at 16:43 +0800, Potin Lai wrote:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.
>=20
> Add NCSI group to distinguish the pin group between RMII and NCSI.
>=20
> - RMII pins:
>   - RMIIXRCLKI
>   - RMIIXRXD0
>   - RMIIXRXD1
>   - RMIIXCRSDV
>   - RMIIXRXER
>   - RMIIXRCLKO
>   - RMIIXTXEN
>   - RMIIXTXD0
>   - RMIIXTXD1
>=20
> - NCSI pins:
>   - RMIIXRCLKI
>   - RMIIXRXD0
>   - RMIIXRXD1
>   - RMIIXCRSDV
>   - RMIIXRXER
>   - RMIIXTXEN
>   - RMIIXTXD0
>   - RMIIXTXD1

I think listing all the pins for both groups obscures the fact that
there aren't more changes than removing RMIIXRCLKO.

Can we instead drop these lists and replace

> Add NCSI group to distinguish the pin group between RMII and NCSI.

With:

> Add "NCSI" pin groups that are equivalent to the RMII pin groups,
> but without the RMIIXRCLKO pin

?

>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctr=
l.yaml
> index 00b6974a5ed3d..3f02dc94a7ce2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.ya=
ml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.ya=
ml
> @@ -337,6 +337,8 @@ additionalProperties:
>          - MDIO2
>          - MDIO3
>          - MDIO4
> +        - NCSI3
> +        - NCSI4

Can we also do this for RMII{1,2}RCLKO (and in the driver patch as
well)?

>          - NCTS1
>          - NCTS2
>          - NCTS3

Overall, what I was hoping for with the comment on the earlier patch
was that you would add the discussion in the commit message to the
"description" entry in the binding YAML. Can you please do so? That way
the information is always present for people reading the binding
without them having to look at the binding's change history.

Thanks,

Andrew
