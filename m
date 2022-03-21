Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F44E4A5A
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 02:12:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNVh53V15z30J6
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 12:12:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMkKW4Dvgz3036
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 05:53:34 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id n7so17212864oif.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 11:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a7Xyf2QArSyizp0F9X7a7N1r4113OGPHtnk41fQc9lc=;
 b=F7+I0l9vrDsIZHksOKJ4RW7E7O8fk55jdaUW9HBIpJFmbFGO5TCzkU9zf/pN5YzT1P
 1bKTetnZZwbTrcWQjJogtUUej3qf1ZeGRB1D15W9GcZwDtUTOVz33H9cOv2ytVrA+yET
 i2gV9NiRFDRZdTqf1E7ekXAqmvFEG8LF/pQwUYzsRwi5N0Xaj5xn1T7EWsBokRp6WNAu
 2jhmSrdMQvvJ4mZuBpjGL/U8zg5ZdyB7IymTl+r9t/5QkvdXnLWIipvcmWvv5D8fcAiv
 vOtJMyf3KNM1C2f5Xyc5o5UkWHNYLhU3wDXoJBECUKGK3e5FoEnoijbCkcXxpL4y446y
 ZNRw==
X-Gm-Message-State: AOAM532P4OJ0EI3+AcInSCZMU4RcwLenoajn542RzmQkbClVkh0rX2Z8
 w03sgYeIaTDXzVqkTYQjHA==
X-Google-Smtp-Source: ABdhPJym1cVJ6hIiuqEDxMhZRQrspeqqkZR5PA/kFVaC8hdwQ5SdvwfkufWH3kcX6wu+LcnGMs9IxQ==
X-Received: by 2002:a05:6808:f88:b0:2da:850d:18f0 with SMTP id
 o8-20020a0568080f8800b002da850d18f0mr270615oiw.19.1647888810502; 
 Mon, 21 Mar 2022 11:53:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e8-20020a9d63c8000000b005b235a56831sm7783461otl.49.2022.03.21.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 11:53:29 -0700 (PDT)
Received: (nullmailer pid 359469 invoked by uid 1000);
 Mon, 21 Mar 2022 18:53:27 -0000
Date: Mon, 21 Mar 2022 13:53:27 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 00/18] dt-bindings: irqchip: include generic schema
Message-ID: <YjjJpxLWJ/YOe0OX@robh.at.kernel.org>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
X-Mailman-Approved-At: Wed, 23 Mar 2022 12:12:09 +1100
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
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@thingy.jp>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-riscv@lists.infradead.org,
 Suman Anna <s-anna@ti.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Burton <paulburton@kernel.org>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, John Crispin <john@phrozen.org>,
 Birger Koblitz <mail@birger-koblitz.de>, linux-oxnas@groups.io,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Krzysztof Halasa <khalasa@piap.pl>, Santosh Shilimkar <ssantosh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 12:55:24PM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> The DTS patches can be picked up independently.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (18):
>   ARM: dts: nspire: use lower case hex addresses in node unit addresses
>   ARM: dts: ox820: align interrupt controller node name with dtschema
>   ARM: dts: socfpga: align interrupt controller node name with dtschema
>   dt-bindings: irqchip: actions,owl-sirq: include generic schema
>   dt-bindings: irqchip: fsl: include generic schema
>   dt-bindings: irqchip: ingenic: include generic schema
>   dt-bindings: irqchip: intel,ixp4xx: include generic schema
>   dt-bindings: irqchip: kontron,sl28cpld: include generic schema
>   dt-bindings: irqchip: loongson: include generic schema
>   dt-bindings: irqchip: microchip,eic: include generic schema
>   dt-bindings: irqchip: mrvl,intc: include generic schema
>   dt-bindings: irqchip: mstar,mst-intc: include generic schema
>   dt-bindings: irqchip: mti,gic: include generic schema
>   dt-bindings: irqchip: nuvoton,wpcm450-aic: include generic schema
>   dt-bindings: irqchip: realtek,rtl-intc: include generic schema
>   dt-bindings: irqchip: renesas: include generic schema
>   dt-bindings: irqchip: sifive: include generic schema
>   dt-bindings: irqchip: ti: include generic schema

I'm somewhat on the fence about these. Originally only devices with a 
bus or child nodes included a common schema. For 'simple' providers 
with mainly a '#<provider>-cells' property, we had to set the 
constraints on the number of cells anyways, so referencing another 
schema doesn't save anything. It is nice to declare the 'class' of the 
device though.

It makes the schema be applied twice (if the node name matches). That's 
not all bad because it finds cases of wrong node name. However, 
sometimes we have devices which are multiple providers and can't set the 
node name. So those can't reference interrupt-controller.yaml.

It also means that 'interrupt-map' for example is now valid. That could 
be fixed by splitting 'interrupt-map' related properties to its own 
schema. 

Rob
