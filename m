Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F44BD6A0
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:18:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNYb30zlzDqgS
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:18:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OSkWz+5m"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1DVZMjpK"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNXv3PNVzDqWb
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:17:51 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E673822165;
 Tue, 24 Sep 2019 23:17:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 23:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=LPTOGhV9k9cBivflQQEQ0DkC+lEllIx
 FLIGTfKClO8Q=; b=OSkWz+5mbPbfoAg9wUf9eMaNpS7qi9SuJlLZWAXsQRjc39C
 MA2VshPV5Hf/LYf0xU0fVuPKByoJcX+FJYVJ3iOgKNz31UuhenwhDNiiSePHPB6t
 5+q6oGAvYaUdpCIhPKfakjGzdiFVQImQ6Bxs//2YQwzD++yF0BIEo/PT+rAEFO8c
 otgdwbQfVWuNn3HsjcMfUJtzrr6xAVnYd5AwGtnuULg32GIEp2WQdlU+III1hvxB
 yrcyAzcAtQb9t2o3e57/D7saIoUIByPh4wdCvYoYqgTdyqxld+MfghbLv6oBJCWp
 8dV2Pm8m/42VC3NOHtal8z6jm2jATXGB3tm5Wlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LPTOGh
 V9k9cBivflQQEQ0DkC+lEllIxFLIGTfKClO8Q=; b=1DVZMjpKlL+B/9Wex8BP9S
 tJHHIn1QkNKKbBu7l/t1rF/QECnysuMykmVahZwSh6rpt1n/bcv93pcGxkRMA7dB
 S2OEvB3YEOVioUtuGj+SYUKRmPvGNs1kTF0k2d15keXPfFAMe4jab34yki23HSuU
 BMypV02hfmi2jyLmghdXjraKunjqgSHgC8ZtjA/IcNJB4yrmjYUKoxwevwHZQiy1
 StjQEAQKC+6B1qPOydIfdRq9iZBKQEo9+J/UMakQJ4NBUlzseUINJ3dba6T/zCKl
 AzOy953zgBWWFZKgQ6HhlT+WaEnwsI13y/UIvQJMfG6C+7HNTBBTnqCWRiBEXvoQ
 ==
X-ME-Sender: <xms:XNyKXbqADaeFqLa5HMBPfbulbkcGz1HHlDqsbkjZp5otrjC2CWFlug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:XNyKXYhNaigj-LeCdeYuILQzoPq81k6BxKROsolO1vLGm8DJqa9fDw>
 <xmx:XNyKXZDSvgEs2XIMK858ZhYr4G0RP5DytoNkS_Zr781JK0C9n6gJrg>
 <xmx:XNyKXQvd6V2faiOEeglotLGwBOF7zZQS5f8RqttXtcLTUnw_nhgDUA>
 <xmx:XNyKXWYGyZISz32wXsCL2A7-_bDl5DWdk7lLVGyXwSEo3mKjUndoiw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 417A3E00AF; Tue, 24 Sep 2019 23:17:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <41308a72-f434-449e-8325-1fd39d64ad77@www.fastmail.com>
In-Reply-To: <20190924194759.26854-7-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-7-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 12:48:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_06/10]_ARM:_dts:_aspeed-g6:_Add_lp?=
 =?UTF-8?Q?c_devices?=
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



On Wed, 25 Sep 2019, at 05:17, Brad Bishop wrote:
> Everything is the same as G5, except the devices have their own
> interrupt now.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Haven't cross-checked the IRQs but things look vaguely right. I would whinge 
about ordering of some of the nodes, but I don't really care enough because
I don't like any of it anyway :)

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v2: new for v2
> v3: fixed broken ipmi/lpc interrupts
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 87 ++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 72038c16f541..3b42404b2ace 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -249,6 +249,93 @@
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
> +						interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <1>;
> +						status = "disabled";
> +					};
> +					kcs2: kcs2@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <2>;
> +						status = "disabled";
> +					};
> +					kcs3: kcs3@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
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
> +						interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
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
> +						interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
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
> +						interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +						status = "disabled";
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
