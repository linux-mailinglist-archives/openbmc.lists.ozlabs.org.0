Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC864E1F29
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 03:56:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMK4c0DFKz30QQ
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 13:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZhK7KU7q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=cristian.ciocaltea@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZhK7KU7q; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKbpS5tLhz306r
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 18:52:46 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id u23so5815198ejt.1
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A3PDqBaBritnZnP7hEtDx3b+3Mek9k1rJJXE3rj2Zy4=;
 b=ZhK7KU7qoYASv+l399eftSrF3wUXJ5oaN/qiNPQfLwsgtl9bq6qAPmuIwnb6gPn0ZB
 Qka724KGz5X2BfT0CpVuVLiUFF6ErQL4S44sSA2EAHDb58EiOtR+X0JhcrDOIOXDr7gZ
 24X0jJU6Yly36s/6hxxD/++HUaP3eTkFSPpOuS6E98ndLpNpbRxSjVUp4DiS19ZWMUMu
 GEZLON/wlJbHOJMBnDmO0miYuxztYiWcHQnwY9dXE4YRoHuXNZcfcHE6q90S0W4vd2s/
 E5402c4bkMQiR9GoAj6vmeD+s0x6iiyOSxfREREz7Q0DFX+fA5A5h/8+7LQmFhYyPip0
 XHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A3PDqBaBritnZnP7hEtDx3b+3Mek9k1rJJXE3rj2Zy4=;
 b=kKw07vDVx/yDNcME/CCCHzTrHaCIG3TlrcGBTGLH3hTP7hg/6hZm/KZqStaOr1XH6b
 qq1IKan09TuYhqAqJyEZ4RQSgsECEmXi+4/7+zSAb9+IQ0xU4pi+qxOoLzSlWZpVZFLG
 y+tsAEP4FViHARIc5l9BIMqlrninVTM6ev/fO4ZiahKaYJUhUrhDeKGSXP5Xo0kB9pEC
 h3QI/7WkUvRiJci5c7y/2JkUeWqWU9Fw5l9fANghI99c4+oZZ7afgQw8N7A88Ri+N4+K
 JoL3mS/rSuJbDoE7AuSl5XvOVbfzQlwDQ8EPI4/K5L1ZEebPuTBDgfUcvHIDqkMb+ROt
 ZPkw==
X-Gm-Message-State: AOAM530pHMwSEHSNPSiE5KLSyMo7r4PsIEXHqQyy/dLZuzz5jcYT9JzG
 0co6qxboQvPcFfV3ZXfNTnA=
X-Google-Smtp-Source: ABdhPJxVj9syTlN4gCx31UjIIGZaW675Iq81FFnD2LS0OTRzGHNcwcEKjUsDvxcdNAmVAaJyTmZAmA==
X-Received: by 2002:a17:906:4fd2:b0:6db:21ba:e434 with SMTP id
 i18-20020a1709064fd200b006db21bae434mr8090239ejw.714.1647589957791; 
 Fri, 18 Mar 2022 00:52:37 -0700 (PDT)
Received: from ubuntu2004 ([188.24.153.122]) by smtp.gmail.com with ESMTPSA id
 qw7-20020a1709066a0700b006dfa04dc2a4sm1534847ejc.56.2022.03.18.00.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 00:52:36 -0700 (PDT)
Date: Fri, 18 Mar 2022 09:52:30 +0200
From: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 04/18] dt-bindings: irqchip: actions,owl-sirq: include
 generic schema
Message-ID: <20220318075230.GA15068@ubuntu2004>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317115705.450427-3-krzysztof.kozlowski@canonical.com>
X-Mailman-Approved-At: Mon, 21 Mar 2022 13:55:41 +1100
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
Cc: Nishanth Menon <nm@ti.com>, Bert Vermeulen <bert@biot.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@thingy.jp>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-riscv@lists.infradead.org,
 Suman Anna <s-anna@ti.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Burton <paulburton@kernel.org>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, John Crispin <john@phrozen.org>,
 Birger Koblitz <mail@birger-koblitz.de>, linux-oxnas@groups.io,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Santosh Shilimkar <ssantosh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 12:56:51PM +0100, Krzysztof Kozlowski wrote:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Thanks.

> ---
>  .../bindings/interrupt-controller/actions,owl-sirq.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> index 5da333c644c9..c058810cf475 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> @@ -14,6 +14,9 @@ description: |
>    This interrupt controller is found in the Actions Semi Owl SoCs (S500, S700
>    and S900) and provides support for handling up to 3 external interrupt lines.
>  
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -46,7 +49,7 @@ required:
>    - '#interrupt-cells'
>    - 'interrupts'
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.32.0
> 
