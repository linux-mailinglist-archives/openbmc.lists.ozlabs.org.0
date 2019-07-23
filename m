Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA670E47
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 02:41:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t0622MbfzDqQP
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 10:41:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DjNggeZh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V7D/POwf"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t05P1wG1zDqDF;
 Tue, 23 Jul 2019 10:40:57 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E858321ADD;
 Mon, 22 Jul 2019 20:40:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 22 Jul 2019 20:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ea1eXoWpqlHrh4PNFoOkJoobCbGJqdR
 95gve43bppWY=; b=DjNggeZhNCdlUyyXFp/MmWpcb5mpCX+fqULx2XOFp6E93B2
 Ltob4RpUXyYQPuJ7JaThvGuSymQMqZlXhDuUSW6BdVJbWBEbFYNXOifRdowWfF0v
 JEznR2696Gy3jLhH4DAVxmJZUnPjbCiSTu6c49Mc7q7mGlXPXh0iYsnG7A1JyZpB
 nVLytB6ltwXLHnPO+HgjY7sdlD6n/Z9xS8vyIv2CHBFSQJUM72na7mckeAXdaBt1
 hbmyMhJl5dcM5csC77iC4Pp1oSHq8hh89DqMTCPyMgeDmOXRKFl2j50mJbMpL8Dy
 eR5wHd3AOr17y3RP8fqqklB35uoIekvXXphKJWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ea1eXo
 WpqlHrh4PNFoOkJoobCbGJqdR95gve43bppWY=; b=V7D/POwfWqx3e195N9nylY
 bJGvoMjjjR5Nf1ouybjiuQMsoTNVdPtxsy7rC2rCUjsZdLxUiUYFCBcRigMu8vM1
 K0gRp6acAUPCre71uUbdGTHAgmNs7w+gkFC53nQqN/1xreRfTmGL8pyYuDHWq3V5
 poR9pOYPcDr5od64qCtYJT3FJrM9/L5S227Dbo/9aM8w+bcWR+o3A3evYjeMuvm1
 z+EnIKQGgUTn8pOItTSHHXJ0SXPbVJlo6Q9JoPmD6xhiLGpEPQSqWdMzM5KJwi6W
 JEMAJIOQgIkPfI54dTt3g+x/007BklffUU4cdfMNP2fvEK4rqITrWMYGVeTU8Tqw
 ==
X-ME-Sender: <xms:lFc2XeNDnMeJr4rp5MVqPG6mIg4Zs6FZXXLNv8X0jSM_irSPMfnpMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeehgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:lFc2XZEkqdx5hDVDbeupnTb98R46EHs38zSO0lGb2RK1vNNPa9fUSA>
 <xmx:lFc2Xejz3xuRF1XqrEHhBUBIpP_4eTJYS8NHfR7KSJBjVKBohv109w>
 <xmx:lFc2XdyuQHF1IV7_N0c5UtkPbJeJ3JjUMizDxbWC7vq97se4LVjSOA>
 <xmx:lVc2Xa2wwkaO0XYuvZUn2EcOcqHUPuaRIaeFvHitgdI9V0FV297XMg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4C3ADE074B; Mon, 22 Jul 2019 20:40:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <a0a8162e-c21b-4b3d-b096-1676c5cc9758@www.fastmail.com>
In-Reply-To: <20190723003216.2910042-1-vijaykhemka@fb.com>
References: <20190723003216.2910042-1-vijaykhemka@fb.com>
Date: Tue, 23 Jul 2019 10:11:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: aspeed: tiogapass: Add VR devices
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 23 Jul 2019, at 10:04, Vijay Khemka wrote:
> Adds voltage regulators Infineon pxe1610 devices to Facebook
> tiogapass platform.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> In v2: Renamed vr to regulator and fixed some typo in commit message.
> 
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts 
> b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index c4521eda787c..e722e9aef907 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -144,6 +144,42 @@
>  &i2c5 {
>  	status = "okay";
>  	// CPU Voltage regulators
> +	regulator@48 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x48>;
> +	};
> +	regulator@4a {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x4a>;
> +	};
> +	regulator@50 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x50>;
> +	};
> +	regulator@52 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x52>;
> +	};
> +	regulator@58 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x58>;
> +	};
> +	regulator@5a {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x5a>;
> +	};
> +	regulator@68 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x68>;
> +	};
> +	regulator@70 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x70>;
> +	};
> +	regulator@72 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x72>;
> +	};
>  };
>  
>  &i2c6 {
> -- 
> 2.17.1
> 
>
