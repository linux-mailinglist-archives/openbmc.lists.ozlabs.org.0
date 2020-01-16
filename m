Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C206140097
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 01:10:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM0Y5bNvzDr4t
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 11:10:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=pWiDFiMS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PMCl/X+I; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLhD5sgkzDrCH
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:56:44 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6465221FC3;
 Thu, 16 Jan 2020 18:56:37 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 Jan 2020 18:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=Zjt4rMOy/09dslB2+is3UctPY/vEsSR
 /gydcrWdovj4=; b=pWiDFiMSSGEL5wynVLpWEJdIfkmRxE4cutez5hQHfMeZGi7
 aW1ag79ejneMH+zxoAeT4g1fQaQmsvewGKyfhicPHxnmSzqGmAsM5Q9n7BRBzbzF
 CHv/pO1keh6+T7u2JihZWPaSgtSt4PMH7Yx2OMcHNtLrL29BG4cLUzD4kJYKHkoc
 KYr2ZGYJLdy7GA6aJtBBmZEBAbYdPI2Z0WQ1SsMY4sS8vqXaM1Lq+cNPeyXGtHKG
 NpXFT5tzCndUN2n+o1J/1T15P/CPjr9grd/K2ZTVthrVQqJHiy0HtIv8wi5DjqJD
 70z+5+Z9lFLYbR5onOJMVi4ccHGDq2fbMJ9ghMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Zjt4rM
 Oy/09dslB2+is3UctPY/vEsSR/gydcrWdovj4=; b=PMCl/X+I2fFZochoIoBXI/
 p25LhTC9cZl12WFLlAAIWcdW4xXfjkIY7NaZYjaGHR09fh0GgjauNtNQLjBTg1lF
 G5xq866vxxxNrxootAqZ5kK4X/kcQ/HwYJVDq1u4oADPR53EEXclt4Cs0P8EL0Fk
 RMcLhHpEXMWaQwns/Km4mxOTbKDG0a1ONVYJkXs2NkSVrR1qO9mRHueiIUcF1nrE
 N4eeXWge6HkJG6R51ptlHajeZ2hlkvCvc+WZWhsrwvgHRdqbWJvzqJb/klVq2VA7
 pgLTdocANZI9hiqGaRRZnVEaukWjzLdAsefmSl4CG5yFXPXhf3Pt3HrHeea4akdA
 ==
X-ME-Sender: <xms:NfggXko32J5Kfyw2QVsS-mvzkyPBc70QiC74EXgdFM1GSpKo007NNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:NfggXgzqfgXgfhfPAY65pnQyIx7aBLVsWT-GLGh3-LUGqFURiIkg4A>
 <xmx:NfggXvsgklLdG3URKKRVhvcS24NmlsychpRWvX_IQMd2yJh_sAEFZw>
 <xmx:NfggXl4i1lPJ9rwYgHZ9B43mcvKnZDNS0wcxr2w_lStzSw_-3TAzlQ>
 <xmx:NfggXjXIXf9zA-AzgxbQT16LVA7sUUTNFFeP8bAUWCMBF7Ou5pzGuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EA93DE00A2; Thu, 16 Jan 2020 18:56:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <20ffa20c-e84b-4d82-a4a5-05e8d82c3a73@www.fastmail.com>
In-Reply-To: <20200116232525.2819-3-rentao.bupt@gmail.com>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
 <20200116232525.2819-3-rentao.bupt@gmail.com>
Date: Fri, 17 Jan 2020 10:26:15 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 "Tao Ren" <taoren@fb.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.4 2/2] ARM: dts: aspeed-g6: add usb functions
Content-Type: text/plain
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



On Fri, 17 Jan 2020, at 09:55, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add USB function pins and devices in aspeed-g6 dtsi.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 25 ++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi         | 43 ++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi 
> b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 045ce66ca876..7028e21bdd98 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -1112,6 +1112,31 @@
>  		groups = "UART9";
>  	};
>  
> +	pinctrl_usb2ah_default: usb2ah_default {
> +		function = "USB2AH";
> +		groups = "USBA";
> +	};
> +
> +	pinctrl_usb2ad_default: usb2ad_default {
> +		function = "USB2AD";
> +		groups = "USBA";
> +	};
> +
> +	pinctrl_usb2bh_default: usb2bh_default {
> +		function = "USB2BH";
> +		groups = "USBB";
> +	};
> +
> +	pinctrl_usb2bd_default: usb2bd_default {
> +		function = "USB2BD";
> +		groups = "USBB";
> +	};
> +
> +	pinctrl_usb11bhid_default: usb11bhid_default {
> +		function = "USB11BHID";
> +		groups = "USBB";
> +	};
> +
>  	pinctrl_vb_default: vb_default {
>  		function = "VB";
>  		groups = "VB";
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 99cc7d7ced4d..d344bb278bdb 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -245,6 +245,49 @@
>  			status = "disabled";
>  		};
>  
> +		ehci0: usb@1e6a1000 {
> +			compatible = "aspeed,ast2600-ehci", "generic-ehci";
> +			reg = <0x1e6a1000 0x100>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_usb2ah_default>;
> +			status = "disabled";
> +		};
> +
> +		ehci1: usb@1e6a3000 {
> +			compatible = "aspeed,ast2600-ehci", "generic-ehci";
> +			reg = <0x1e6a3000 0x100>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_usb2bh_default>;
> +			status = "disabled";
> +		};
> +
> +		uhci: usb@1e6b0000 {
> +			compatible = "aspeed,ast2600-uhci", "generic-uhci";
> +			reg = <0x1e6b0000 0x100>;
> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			#ports = <2>;
> +			clocks = <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
> +			status = "disabled";
> +			/*
> +			 * No default pinmux, it will follow EHCI, use an explicit pinmux
> +			 * override if you don't enable EHCI
> +			 */
> +		};
> +
> +		vhub: usb-vhub@1e6a0000 {
> +			compatible = "aspeed,ast2600-usb-vhub";
> +			reg = <0x1e6a0000 0x300>;

Shouldn't this be at least 0x350 long for all 20 programmable endpoints?
