Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EB2985DB
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 04:14:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKKgP0YqVzDqNS
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 14:14:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Vk1NGZAV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dJWXH/p5; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKKf353FDzDqLt;
 Mon, 26 Oct 2020 14:12:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id ED81B5802E9;
 Sun, 25 Oct 2020 23:12:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 23:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=M7CjQS2/FxcHf/vflaSSIDT/4BTmr/w
 OMuomiSkQL04=; b=Vk1NGZAVYCuOuG0Aj/d8t7C9cB89JQkzA5SijAiP6sn4XwS
 +69WiB4Q+rko2XvtDX2+3UFIUO9SMnDgyF+ICHqLYEY9z4uKaXjdtTyukPFNiuqM
 rfz+DQXUO6wPB7vxv02glOQcG2dkTEAPx+4A1V9v1EGfMe0zMlHFFo/Ih7EEusCO
 nEwg6XUJquoD+BAOgVEA3g/7W6KH0ARMr5mJ2SCiD2ZYthA+IufQLaseC5jwfuYK
 nI7fcpJ5uSJ4P4gBG1ui62HZl29nM083YyFJ9fPT2XKJZMuw3EDk4CYmHBOwwczU
 M0RnN8KsauAJ28wKAvwwBXm/AxN+QSzNa/N3qfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=M7CjQS
 2/FxcHf/vflaSSIDT/4BTmr/wOMuomiSkQL04=; b=dJWXH/p5lDcshfSDxiAceF
 z++cycO9V9r820d6JVqFRPW6LO981af7HCXN5OvT18U+bH91iJQxJBDWF6SU8TNV
 h0ShXyQ74cLrp6de1nbwnAtjuyI1KbyK9tv5IMFD1ZJ5UhpvcgvLyQ3ixZmG4yV9
 gv+iSDrISep4DCH8k/YvwPcMa9my5/cT6y74xFe6FGGq39FaLliGUU/T3PP7Q/tr
 SGVx85Pw5KmVBumuz+WtlxhsZKUoKfiowaAmeuAa/hCSLaOMh9x/jKUPQtruB2QW
 1aDt4B3Q24d4ImWEvczIgys3TpjtEWCZrKSGmcsgW+D7H3Gb/IKMWFW5rXY8uzWw
 ==
X-ME-Sender: <xms:tD6WX1gZC4pDyj9dtRd4WuyfTNq1JJp5zuFCCw9dRG_Mg-GE5Bq8gA>
 <xme:tD6WX6D2lLS9LyAcPTh148T5bQJiNrg4bt0uYHMiS_EbFERzjOCSc1fF2pQ7jevj0
 9PjfbPfRSGKZTzj3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
 feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:tD6WX1Ea4cthkd0OprPOUBKbH5Q_-nfEA3HQANhxa6AMcelVRBOqTQ>
 <xmx:tD6WX6RmDNIs5wIq1oKS1Q-idf5dDD00Veq9JyBKII5R8D8ONEoecA>
 <xmx:tD6WXyzQ8qaKE1zQoFVkIm5ei1fgoD6jAG5hIiwY8VwsBEM4zmYWEQ>
 <xmx:tj6WX3IG7ZREDdpIdzbhUd6gIcxjrrVrRmOiL6pnzV78t2eW7HMTDg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9FC70E050B; Sun, 25 Oct 2020 23:12:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <2e2d3a02-6677-4b0e-b538-d3130a3b20d1@www.fastmail.com>
In-Reply-To: <20201005082806.28899-6-chiawei_wang@aspeedtech.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
 <20201005082806.28899-6-chiawei_wang@aspeedtech.com>
Date: Mon, 26 Oct 2020 13:42:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wang Chia-Wei,

On Mon, 5 Oct 2020, at 18:58, Chia-Wei, Wang wrote:
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

The documentation at [1] suggests this should probably be patch 1/5 rather than 
5/5, so if you send the series again I'd probably rearrange it. Following the 
steps outlined in [1] helps catch Rob's attention in the right way :)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/submitting-patches.rst?h=v5.9

Rob:

The changes here go some way towards cleaning up mistakes I made in the Aspeed 
LPC controller binding. The proposed change is very much not backwards 
compatible, but Joel and I don't want to live with the resulting mess in the 
drivers of catering to both layouts. Another way we could avoid the driver mess 
is to rev all the bindings and immediately drop support for the old compatibles 
in the drivers. This creates a bit more churn in the bindings. What are you 
willing to accommodate?

All consumers I'm aware of ship the Aspeed BMC dtb in FIT images alongside the 
kernel, so while backwards-incompatible changes are rightly frowned upon I feel 
we probably wouldn't cause too much damage if we went that path.

Andrew

> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 85 +++----------------
>  1 file changed, 14 insertions(+), 71 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt 
> b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index a92acf1dd491..866f54a09e09 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a 
> slave on the bus
>  conditions it can also take the role of bus master.
>  
>  The LPC controller is represented as a multi-function device to account for the
> -mix of functionality it provides. The principle split is between the register
> -layout at the start of the I/O space which is, to quote the Aspeed datasheet,
> -"basically compatible with the [LPC registers from the] popular BMC controller
> -H8S/2168[1]", and everything else, where everything else is an eclectic
> -collection of functions with a esoteric register layout. "Everything else",
> -here labeled the "host" portion of the controller, includes, but is not limited
> -to:
> +mix of functionality, which includes, but is not limited to:
>  
>  * An IPMI Block Transfer[2] Controller
>  
> @@ -44,8 +38,8 @@ Required properties
>  ===================
>  
>  - compatible:	One of:
> -		"aspeed,ast2400-lpc", "simple-mfd"
> -		"aspeed,ast2500-lpc", "simple-mfd"
> +		"aspeed,ast2400-lpc", "simple-mfd", "syscon"
> +		"aspeed,ast2500-lpc", "simple-mfd", "syscon"
>  
>  - reg:		contains the physical address and length values of the Aspeed
>                  LPC memory region.
> @@ -55,66 +49,17 @@ Required properties
>  - ranges: 	Maps 0 to the physical address and length of the LPC memory
>                  region
>  
> -Required LPC Child nodes
> -========================
> -
> -BMC Node
> ---------
> -
> -- compatible:	One of:
> -		"aspeed,ast2400-lpc-bmc"
> -		"aspeed,ast2500-lpc-bmc"
> -
> -- reg:		contains the physical address and length values of the
> -                H8S/2168-compatible LPC controller memory region
> -
> -Host Node
> ----------
> -
> -- compatible:   One of:
> -		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> -		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> -
> -- reg:		contains the address and length values of the host-related
> -                register space for the Aspeed LPC controller
> -
> -- #address-cells: <1>
> -- #size-cells:	<1>
> -- ranges: 	Maps 0 to the address and length of the host-related LPC memory
> -                region
> -
>  Example:
>  
>  lpc: lpc@1e789000 {
> -	compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +	compatible = "aspeed,ast2500-lpc", "simple-mfd", "syscon";
>  	reg = <0x1e789000 0x1000>;
>  
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	ranges = <0x0 0x1e789000 0x1000>;
> -
> -	lpc_bmc: lpc-bmc@0 {
> -		compatible = "aspeed,ast2500-lpc-bmc";
> -		reg = <0x0 0x80>;
> -	};
> -
> -	lpc_host: lpc-host@80 {
> -		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> -		reg = <0x80 0x1e0>;
> -		reg-io-width = <4>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0x0 0x80 0x1e0>;
> -	};
>  };
>  
> -BMC Node Children
> -==================
> -
> -
> -Host Node Children
> -==================
>  
>  LPC Host Interface Controller
>  -------------------
> @@ -145,14 +90,12 @@ Optional properties:
>  
>  Example:
>  
> -lpc-host@80 {
> -	lpc_ctrl: lpc-ctrl@0 {
> -		compatible = "aspeed,ast2500-lpc-ctrl";
> -		reg = <0x0 0x80>;
> -		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> -		memory-region = <&flash_memory>;
> -		flash = <&spi>;
> -	};
> +lpc_ctrl: lpc-ctrl@80 {
> +	compatible = "aspeed,ast2500-lpc-ctrl";
> +	reg = <0x80 0x80>;
> +	clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +	memory-region = <&flash_memory>;
> +	flash = <&spi>;
>  };
>  
>  LPC Host Controller
> @@ -174,9 +117,9 @@ Required properties:
>  
>  Example:
>  
> -lhc: lhc@20 {
> +lhc: lhc@a0 {
>  	compatible = "aspeed,ast2500-lhc";
> -	reg = <0x20 0x24 0x48 0x8>;
> +	reg = <0xa0 0x24 0xc8 0x8>;
>  };
>  
>  LPC reset control
> @@ -194,8 +137,8 @@ Required properties:
>  
>  Example:
>  
> -lpc_reset: reset-controller@18 {
> +lpc_reset: reset-controller@98 {
>          compatible = "aspeed,ast2500-lpc-reset";
> -        reg = <0x18 0x4>;
> +        reg = <0x98 0x4>;
>          #reset-cells = <1>;
>  };
> -- 
> 2.17.1
> 
>
