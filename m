Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD7B8B2E
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 08:39:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZPFG4f9qzF3ZN
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 16:38:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mioQjlHA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uiyHEWYs"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZPC20Wp1zF3RG
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 16:37:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 75BAA21FB5;
 Fri, 20 Sep 2019 02:36:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 02:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ThZnXG1o/cxMDnrFNz+sWVZZHIKlbYO
 q0g6xFIiKFjU=; b=mioQjlHA3Wa5d4j9686NsbvZNg/i09iRqJ7QsraxDb8tfB/
 7GaqxDf3VM/T7eTCyYZSFN4tncT4I94HZbkTCLVksLNDKHMB4/EsbuXjhsoom2BI
 akStUcJBknE5DRoKrMs0J1y4WN84jdXoB+ni1wgN7ZLGuB5Glatu6KSn6/st2Iva
 q94KfvRBhcuhdxT8RrojgEoW7t1s1ovja+78zeho0hUMl7u2JTHomw7C/Myu9b+k
 lM/oFO426fvBG5gGkHcuZRJI4DV5egLc1U1vPPxz1j8nIV7C8mkTDngZ5Wr+f3lg
 miWvPXdytjnTxkDytXmsnhhe9ZTyFp6iHzUeGmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ThZnXG
 1o/cxMDnrFNz+sWVZZHIKlbYOq0g6xFIiKFjU=; b=uiyHEWYsTXDMtJO5I654zr
 UEMXPWy0MtiaDj8aX0CeqXoSxgk/R7mnJ4a4F8qh9nGibhTXzJPBnealgIRLn+un
 XTPwMqOecaXKxwXAUmODfYQiIhTRetHtuMET0YSC2FDtQYUzlqPR//rUkGPojSQT
 w26L/x2vCAA7/57eyOBT1Orum1i5Un4iOnxw6VGLjk1WgA7plU8BySImKqiX6MWg
 JUHqF5erzztbfB6+BzbHepBHLC2JIhs2AVvHQxVLBSbdtaSNgISOcXBVXn9XbVzU
 TfSs2S/D1dOKEKARUluRA5HTGAhCZmZbk1892jMbC4eVvg6uk8R2s6e1J99/mvfA
 ==
X-ME-Sender: <xms:i3OEXYo7UbAjVhsuVFfilXnWHdafa_3It9n7TTdwLNuf5jpz0cvVlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:i3OEXQiTuLrC171xAXL-pcjWfWUqUey0224WsFtwSpcxk_zWJjcnTQ>
 <xmx:i3OEXRxhja4VVIR9-trUTMh4o9ELOf59qsAb2aQxFBAG9fVA9rovEA>
 <xmx:i3OEXdiBjJTDJMLicaFxyR1eveoJPqP0Egks2mQJsYc-Mt8mhBYzwQ>
 <xmx:i3OEXXdSDR8pqItbKHKjKG0O0UKBf6H_hsIwW4t2k6MPBM0H0WEoBw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E8A69E00A9; Fri, 20 Sep 2019 02:36:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <9196f950-59ea-4e7f-82f7-29769e0a2c81@www.fastmail.com>
In-Reply-To: <20190919152340.23133-4-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-4-bradleyb@fuzziesquirrel.com>
Date: Fri, 20 Sep 2019 16:07:34 +0930
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

I've got some patches floating around that I need to respin that adjust the kcs binding.
The new dtsi with the existing binding means we're going to increase the amplification
of dtc warnings :(

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

Can you please split the sio_regs one out to a separate patch? The necessary
patches got nak'ed upstream a while back and I haven't circled back around
to implement something more palatable. Put the patch adding it at the top of
your series, then you can send the earlier ones upstream.

Andrew
