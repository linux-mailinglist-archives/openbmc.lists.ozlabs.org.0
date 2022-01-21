Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B466149681C
	for <lists+openbmc@lfdr.de>; Sat, 22 Jan 2022 00:08:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgZn03psYz2ymt
	for <lists+openbmc@lfdr.de>; Sat, 22 Jan 2022 10:08:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgZml3dd1z2ymt
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jan 2022 10:08:21 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso13597833otb.11
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jan 2022 15:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=riTVZXDdFirHSqQYOJ8NhNlm44IGv5r1Q6vZ1IVXuTk=;
 b=EQs1/kX+apZF70juWjY4dmK1laLVdqdZQqbwFeHpqkgwuFw/HR2R1b71T5DcruZZqY
 tC7rhQpIdjdVxIARWJBVikyQjYIK3s8Ld3NhrCgQQXgHbuaLMkE44ZE6GAMCuJmVrfiW
 4B4hKAe1ZfNMau2fSfdiaYY2vJ+xXGXAlqD4SYnipcb5AYPw09/OOEHfWCKxBq2NODzp
 tmNCg5YZJcMxC3BwSR21CJkPmtOSjakxYmMmThazxAYQJq+Ll2o+vmAP9fHD0DsWa1On
 su781IN5JCP2K+yIS1s6XzE5oD1ZFP3BK7IzF33ACi9vm0YVP4o2rexJ5paAX+qGfitU
 bBVQ==
X-Gm-Message-State: AOAM532Ojc5GY7k4EsnODrDVOfITqmHX7uiCq71TamBXVpoQeeY0IqpI
 cCKT5A0+ak62jjYc9bvGBg==
X-Google-Smtp-Source: ABdhPJwGhLZDGPflDcwJnvSTrejxqDj5W3rP/J3cP4rNS/CI6GPpYV+L9BGUr/yHQCN3MX9CNcWpdw==
X-Received: by 2002:a9d:360b:: with SMTP id w11mr4298264otb.102.1642806497818; 
 Fri, 21 Jan 2022 15:08:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bl16sm1912752oib.2.2022.01.21.15.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 15:08:17 -0800 (PST)
Received: (nullmailer pid 1779915 invoked by uid 1000);
 Fri, 21 Jan 2022 23:08:15 -0000
Date: Fri, 21 Jan 2022 17:08:15 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v4 4/9] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <Yes830dXetys05hV@robh.at.kernel.org>
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
 <20220109173000.1242703-5-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220109173000.1242703-5-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 09 Jan 2022 18:29:55 +0100, Jonathan Neuschäfer wrote:
> This binding is heavily based on the one for NPCM7xx, because the
> hardware is similar. There are some notable differences, however:
> 
> - The addresses of GPIO banks are not physical addresses but simple
>   indices (0 to 7), because the GPIO registers are not laid out in
>   convenient blocks.
> - Pinmux settings can explicitly specify that the GPIO mode is used.
> 
> Certain pins support blink patterns in hardware. This is currently not
> modelled in the DT binding.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> ---
> v4:
> - Small improvements around gpio node addresses, suggested by Rob Herring
> 
> v3:
> - https://lore.kernel.org/lkml/20211224200935.93817-5-j.neuschaefer@gmx.net/
> - Make changes suggested by Rob Herring
> - Fix lint errors
> - Simplify child node patterns
> - Remove if/type=object/then trick
> - Reduce interrupts.maxItems to 3: 4 aren't necessary
> - Replace list of gpio0/1/2/etc. with pattern
> - Remove nuvoton,interrupt-map again, to simplify the binding
> - Make tuples clearer
> 
> v2:
> - https://lore.kernel.org/lkml/20211207210823.1975632-5-j.neuschaefer@gmx.net/
> - Move GPIO into subnodes
> - Improve use of quotes
> - Remove unnecessary minItems/maxItems lines
> - Remove "phandle: true"
> - Use separate prefixes for pinmux and pincfg nodes
> - Add nuvoton,interrupt-map property
> - Make it possible to set pinmux to GPIO explicitly
> 
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-5-j.neuschaefer@gmx.net/
> ---
>  .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
