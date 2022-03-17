Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE14DD2D8
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:11:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSDM70lsz2xTs
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:11:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rsLp6M4L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rsLp6M4L; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKH175WgTz3bWl
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 06:15:54 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so3991881pjb.4
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vB5f3WAF1j14ezOj7+5eexYupdGogMxyhohhnTpJG3I=;
 b=rsLp6M4LC+ha3ufnaOhyywMK6wmY6Hf56U49g+9vNFfpqvMCyNPyBpiXhCkP4xvbFY
 9E0p8IUr27FGHaoK7iyxQC3LZEG+aoMEI0eUOhXhY5l8IV7wep6uEjjREn4iPEyxIWfa
 wbW2PSjskg54Dad/119rVJKOnZZ/dKg/Yf0disLS6nfuXqzpBD2K+wgg44U2t++ZNdaj
 nwwN1p3XtunPwuDDi16+096nin1zKvJ1Iwz0M45yHJl5c4CRlf06irAv0f0VrmFpc5jp
 GmsJaef8JdJ61XJO/g5QB+dOFOqwY55fZwTUT9FvXAolqNcCT0I12Uu8mpBgBGF9/QUB
 MMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vB5f3WAF1j14ezOj7+5eexYupdGogMxyhohhnTpJG3I=;
 b=PTgt0ogxJX24HukrKlxmJ97qSGuhUhHKYszIHcs4POfgWRA+NkLPV6hufEZ8D1O+kG
 /li/owjCTW780KympPW2/tUdb+U4XEWDdmk2gezgaM8/j3E0/Y3oi6tdDiDnb8Rx9Xwz
 baO5o0xnX1zQX04vvq7SuVJ/xXiC2tMig6LhKKRjykChR1IWvo9U+TU5bI+v+XvrPLB0
 M5XvnHpbnO9aUu//Q6fKd2NrYxmdIxAlx51JwkiltdYnR3SwXJvrY3v1bITgLmgZmVPB
 TbMWfc73M61Rv6f+QZOyGO413VTXcapxze2CwlDZP9UcmYAYjGtJ5EIs+Cv81H7fvRrY
 Zehg==
X-Gm-Message-State: AOAM530CwaC/i2cF06f2NrBVVtrr09gzca0c+pMT4MhkFf0i6g0q3/gD
 CIBzBOuYV7xrKkc8oJBLgzjuMg==
X-Google-Smtp-Source: ABdhPJwHtQFbcAMtkjIIk7TTag/gBPH400hGz9/wqUBz3Ag9FMPGaHQJZvaF1c312w1xdnvPWdUyvA==
X-Received: by 2002:a17:90b:4d11:b0:1c2:1939:ca83 with SMTP id
 mw17-20020a17090b4d1100b001c21939ca83mr17770961pjb.65.1647544552516; 
 Thu, 17 Mar 2022 12:15:52 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056a00234c00b004fa042e822bsm7558479pfj.14.2022.03.17.12.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 12:15:51 -0700 (PDT)
Date: Thu, 17 Mar 2022 12:15:51 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Mar 2022 12:15:46 PDT (-0700)
Subject: Re: [PATCH 17/18] dt-bindings: irqchip: sifive: include generic schema
In-Reply-To: <20220317115705.450427-16-krzysztof.kozlowski@canonical.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@canonical.com
Message-ID: <mhng-8f60f19c-40cb-4b5e-b392-9cdf8adc1d13@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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
Cc: nm@ti.com, bert@biot.com, geert+renesas@glider.be, narmstrong@baylibre.com,
 lokeshvutla@ti.com, Paul Walmsley <paul.walmsley@sifive.com>,
 jiaxun.yang@flygoat.com, cristian.ciocaltea@gmail.com, paul@crapouillou.net,
 daniel@thingy.jp, sagar.kadam@sifive.com, linux-riscv@lists.infradead.org,
 s-anna@ti.com, mark-pk.tsai@mediatek.com, paulburton@kernel.org,
 krzysztof.kozlowski@canonical.com, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, john@phrozen.org, mail@birger-koblitz.de,
 linux-oxnas@groups.io, devicetree@vger.kernel.org, jason@lakedaemon.net,
 mani@kernel.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, j.neuschaefer@gmx.net, robh+dt@kernel.org,
 khalasa@piap.pl, ssantosh@kernel.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 kristo@kernel.org, linusw@kernel.org, qiangqing.zhang@nxp.com,
 claudiu.beznea@microchip.com, dinguyen@kernel.org, michael@walle.cc,
 krzk+dt@kernel.org, kaloz@openwrt.org, afaerber@suse.de,
 l.stach@pengutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 04:57:04 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 27092c6a86c4..e3c08cff89d2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -44,6 +44,9 @@ maintainers:
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@dabbelt.com>
>
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -91,7 +94,7 @@ required:
>    - interrupts-extended
>    - riscv,ndev
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming this is going in along with the others.

Thanks!
