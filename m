Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B430B8C54
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 10:05:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZR8c3Y6TzDqkS
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 18:05:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Tcbrymqk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m1+E+q3p"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZR7Z4z5dzF13s
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 18:04:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 93B4F21FC1;
 Fri, 20 Sep 2019 04:04:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 04:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=rc7k28qh2A+sIuoKolBp9bERk2cUzwG
 X578XC0wZ05Q=; b=TcbrymqknnJX8XinL+peAYi0Eh4M3XKPG2vQfTx0s+RL7ha
 9qDi3qKdIFXGKQEywgs+mLYra0/DWmpPceL+7x4DkW81ZCZtCGCpauzjC2wX02xm
 yvjQTrBQIHXGMOJ6BwvOwI+rFSIiYDLASCrEBe2r4M1hwmR64e0JCNvjKAhQ1ghh
 NQb3Lj6K92Dn+t/xZkeCoBCCIFMX23nLFbqVCZbHNdzcBo/3o0VowoSzt6HVhJDI
 0VmBLdoABwGcDxax9tcOJgXobgM6kci9siodHQGmakh+WAecX07sPDin6iJWGtZe
 1DmmS458+M3FdZtfSRX5SLAo9L06qhXfJsT+/GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rc7k28
 qh2A+sIuoKolBp9bERk2cUzwGX578XC0wZ05Q=; b=m1+E+q3pEOmdaRBWANPTu7
 Q3s/CXfMnAatD5E21SyolcJuN4DT4L7CkWeD78Vll1U0F0GWhLsJJApYQzDORjGA
 yT4h0H/tO5sPPNB22Ini8ckQ2vc4y+gl2QHLrkA82/LDWgbXcooXfpd/anH0wix1
 zlndgjsdHB/XQIpDOMySux8AnHnSsuhLOTzFWyVCXSuOx5NOOJrwlaUKD4YXpFu4
 dINXbQokE1dqT3Jj2tVhv1PW/Wfabvy89YJ7MX+hcomGcwmrZ/xYY8FQ3Vl1cAbr
 NSEDuFw/Hn0n+nBKNBOmSHMd8WO+FC8ceXXQ616//R873YMgD4OPcfETXit1e+6A
 ==
X-ME-Sender: <xms:9YeEXXMRQF2T6RenwzGiDQczvffKy-iVbZ66N-6Mji_B4dNmCT4iSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:9YeEXSvJa1VitNLUrmGF6G1YZhVFPOhJyZthvrWHph6tdrYcXL4IRw>
 <xmx:9YeEXfJ4CiFtdJB9ec12dxt5EqQc0IN94P2duOteWnJVxILLEd5U9g>
 <xmx:9YeEXTmB1RrkAYv2qVaKDxuVFLbrSyaljfhVGnj7dA_x6xEVGO0jcQ>
 <xmx:9oeEXYJ3z4Jpgxuv6tT04AQXKX3EBblMEgDrVOH8GdhDMMXlNSRDRA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 523E1E00A9; Fri, 20 Sep 2019 04:04:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <7c82ee22-bb01-426b-9e8f-d1023d6495b0@www.fastmail.com>
In-Reply-To: <20190919152340.23133-9-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-9-bradleyb@fuzziesquirrel.com>
Date: Fri, 20 Sep 2019 17:34:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v2 linux dev-5.3 3/4] ARM: dts: aspeed-g6: Add lpc devices
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 20 Sep 2019, at 00:53, Brad Bishop wrote:
> Assume everything is the same as G5, except the interrupt is updated.

KCS, BT, mailbox and so forth are actually on separate IRQs now.

Take a look at the SDK devicetree:

https://github.com/AspeedTech-BMC/linux/blob/aspeed-dev-v5.1/arch/arm/boot/dts/aspeed-g6.dtsi

> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 91 ++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 72038c16f541..b4991cbe1f36 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -249,6 +249,97 @@
>  				status = "disabled";
>  			};
>  
> +			lpc: lpc@1e789000 {
> +				compatible = "aspeed,ast2600-lpc", "simple-mfd";
> +				reg = <0x1e789000 0x1000>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x0 0x1e789000 0x1000>;
> +
> +				lpc_bmc: lpc-bmc@0 {
> +					compatible = "aspeed,ast2600-lpc-bmc", "simple-mfd", "syscon";
> +					reg = <0x0 0x80>;
> +					reg-io-width = <4>;
> +
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					ranges = <0x0 0x0 0x80>;
> +
> +					kcs1: kcs1@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <1>;
> +						status = "disabled";
> +					};
> +					kcs2: kcs2@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <2>;
> +						status = "disabled";
> +					};
> +					kcs3: kcs3@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <3>;
> +						status = "disabled";
> +					};
> +				};
> +
> +				lpc_host: lpc-host@80 {
> +					compatible = "aspeed,ast2600-lpc-host", "simple-mfd", "syscon";
> +					reg = <0x80 0x1e0>;
> +					reg-io-width = <4>;
> +
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					ranges = <0x0 0x80 0x1e0>;
> +
> +					kcs4: kcs4@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <4>;
> +						status = "disabled";
> +					};
> +
> +					lpc_ctrl: lpc-ctrl@0 {
> +						compatible = "aspeed,ast2600-lpc-ctrl";
> +						reg = <0x0 0x80>;
> +						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +						status = "disabled";
> +					};
> +
> +					lpc_snoop: lpc-snoop@0 {
> +						compatible = "aspeed,ast2600-lpc-snoop";
> +						reg = <0x0 0x80>;
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						status = "disabled";
> +					};
> +
> +					lhc: lhc@20 {
> +						compatible = "aspeed,ast2600-lhc";
> +						reg = <0x20 0x24 0x48 0x8>;
> +					};
> +
> +					lpc_reset: reset-controller@18 {
> +						compatible = "aspeed,ast2600-lpc-reset";
> +						reg = <0x18 0x4>;
> +						#reset-cells = <1>;
> +					};
> +
> +					ibt: ibt@c0 {
> +						compatible = "aspeed,ast2600-ibt-bmc";
> +						reg = <0xc0 0x18>;
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						status = "disabled";
> +					};
> +
> +					sio_regs: regs {
> +						compatible = "aspeed,bmc-misc";
> +					};
> +				};
> +			};
> +
>  			sdc: sdc@1e740000 {
>  				compatible = "aspeed,ast2600-sd-controller";
>  				reg = <0x1e740000 0x100>;
> -- 
> 2.21.0
>
