Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F24DD2C8
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:08:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS8y63MLz30Kq
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:08:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RKxfjAoJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RKxfjAoJ; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK8vC51Wfz2xBL
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 01:40:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 198CE61844;
 Thu, 17 Mar 2022 14:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE802C340E9;
 Thu, 17 Mar 2022 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647528019;
 bh=Q3v4f9Cx+g0ywwj+2gvhzmqAnrWp4/uVf5eK9e3PenY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=RKxfjAoJuYmjcBCROW1LVYYlESbYRnrUeqZlxl2BV0pf83G66g7LNWI0htc3e8fL5
 q201sH5O0EStkAh/ls60L2xn7IlFCDUsFG0s+SE9j0Dsyd/creIsNMsgCAJy12Nqr9
 E0HcuIyZceC7R8zgA2rPfpF4XA2H2TIFKP4ghGqVkg1/x+L6rxwWHzIXkp3AnjZ1Jk
 p9BSTe+3EIGg8jUavJl7MSSZO+4qY9FZOsBFf7yG0JiECET1qg8XjazxA2YHhEbsm2
 TAFrej3nfe+tknZ2wQMdxx73x0cnHIatXHSuZttEbBRjhrwHQJ+CB6DPxe1c12QDiK
 gmwZi8+SqmwMA==
Message-ID: <25338f4e-e5cb-7397-efa3-12501558ac94@kernel.org>
Date: Thu, 17 Mar 2022 09:39:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/18] ARM: dts: socfpga: align interrupt controller node
 name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?=
 <j.neuschaefer@gmx.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Sagar Kadam <sagar.kadam@sifive.com>,
 Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-oxnas@groups.io
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-2-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220317115705.450427-2-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/17/22 06:56, Krzysztof Kozlowski wrote:
> Fixes dtbs_check warnings like:
> 
>    $nodename:0: 'intc@fffed000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/arm/boot/dts/socfpga.dtsi         | 2 +-
>   arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 7c1d6423d7f8..b8c5dd7860cb 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -46,7 +46,7 @@ pmu: pmu@ff111000 {
>   		      <0xff113000 0x1000>;
>   	};
>   
> -	intc: intc@fffed000 {
> +	intc: interrupt-controller@fffed000 {
>   		compatible = "arm,cortex-a9-gic";
>   		#interrupt-cells = <3>;
>   		interrupt-controller;
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index 3ba431dfa8c9..f1e50d2e623a 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -38,7 +38,7 @@ pmu: pmu@ff111000 {
>   		      <0xff113000 0x1000>;
>   	};
>   
> -	intc: intc@ffffd000 {
> +	intc: interrupt-controller@ffffd000 {
>   		compatible = "arm,cortex-a9-gic";
>   		#interrupt-cells = <3>;
>   		interrupt-controller;

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
