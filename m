Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1F298653
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 06:24:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKNYK4wvjzDqNx
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 16:24:05 +1100 (AEDT)
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
 header.s=fm1 header.b=QgjIgqjr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KTDKcuio; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKNXL4FlGzDqMl
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 16:23:13 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 12CDB5C006F;
 Mon, 26 Oct 2020 01:23:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 26 Oct 2020 01:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=U5GOGvLaOcJO2QzHSrL5yVewPn7WkI9
 8hsc+cc0oHi0=; b=QgjIgqjrZBM5lknCiZloGPSh+vxIV3lX85D18ft7kkXdAU0
 N6QlH++6PhFgln/AsO4AaEDvDCd9qjg0zsr8rMNGc/cyUvySr0Bz28u1ESy8uXe+
 ArnCW1txPpA0ZvItvg9eFTzUOfW0ND7v/jY7LxddJVtVnut6DGrrYC4EK1Kl6Lq0
 aQpvYMTCUycwu+cPDA3gr0bA8EUJboEMeVuC3RI48qb42HsAGY2Q8uaPMXOv1Ucy
 xFFjcOInktU/MZ4vp6I1QspsY7qRcjQihaQZmIMAO8k22FuzdkqXTEHQSfqfKVFD
 pAVzkelbjMp+mTeNEZ7aUhhHf6kbEHBb6XTC6Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U5GOGv
 LaOcJO2QzHSrL5yVewPn7WkI98hsc+cc0oHi0=; b=KTDKcuioVjLuMbV418gk5K
 YHHNE6iV8nTLvzqPF5oP4tBuf0sOCtrBnbzSqX0kBzchFhRx6xJL/+bbs1u0MYqY
 b5575OdGmDKzz2hXj/Bt+5f9p0Fa9goxV7oUzJAbMj26mSAyS0zS+UNDxzrVWSC6
 a2JoJSrbmW7gR24KNaWRNVCZizAwjsHfXfvcf9ItysJJ7P29n+26/vuQotcasrHr
 1L0F27UnjBacj/XjNDI3lrh2kc6Z3qrActPwM9qbbzwYzTPwUJEX9PTzWsYrbU+F
 8t+GbgUaP6q11fwYyMGCcJFhFXOSoYNbgAhOztf7SnUNijjwngiLZo1a/2dOYYrA
 ==
X-ME-Sender: <xms:Pl2WX5o_VxoxWvOo3MuQRdPBC2jtpxOUiBzEZBgF8cISTAAAe3xszQ>
 <xme:Pl2WX7qMOBAM6aJHQV6voMBY-GW5QPKyFgjwbjRmH7QxAfHTIX7Nu9rBhVDkXBZOW
 B42iRmZJUJMh3skXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Pl2WX2NfW7WnVaa2jDmjDvRy-cTLzipUzQW95L82BSkrkjZs9Sy9fQ>
 <xmx:Pl2WX077wV16fl0DTW7Ll1qGPPXs_H9bxzYA3wttJO8c7KdzSgUsIg>
 <xmx:Pl2WX47Yi79XnOwZrP5tWVITTbiikQnQTUr26Kej8JLOVzUsBVWL_A>
 <xmx:P12WX9XcV4PXaBNvY2frOj8uk3gLPHeooHIUh4R8A_EfwSJ5qZBX9w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3EB3AE0508; Mon, 26 Oct 2020 01:23:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <8078a638-48d1-4851-a6bc-f232f62c70af@www.fastmail.com>
In-Reply-To: <20200923194405.28857-1-eajames@linux.ibm.com>
References: <20200923194405.28857-1-eajames@linux.ibm.com>
Date: Mon, 26 Oct 2020 15:52:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.8_v2]_ARM:_dts:_Aspeed:_Rainier:_Add_4U?=
 =?UTF-8?Q?_device-tree?=
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



On Thu, 24 Sep 2020, at 05:14, Eddie James wrote:
> Add a device-tree for the Rainier 4U system. Change the model name
> on the existing Rainier device-tree to 2U, and remove the two
> extra power supplies that are only present on the 4U system.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>  - Don't rename the 2U dts
>  - Include the 2U dts from the 4U and make the necessary changes
> 
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 47 +++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 14 +-----
>  3 files changed, 50 insertions(+), 12 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 56fd8c8a2ba9..8f59cb9a9b71 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1359,6 +1359,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
>  	aspeed-bmc-ibm-rainier.dtb \
> +	aspeed-bmc-ibm-rainier-4u.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-lenovo-hr630.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> new file mode 100644
> index 000000000000..e5d51b9c7a47
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2019 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-bmc-ibm-rainier.dts"
> +
> +/ {
> +	model = "Rainier 4U";
> +};
> +
> +&i2c3 {
> +	power-supply@6a {
> +		compatible = "ibm,cffps";
> +		reg = <0x6a>;
> +	};
> +
> +	power-supply@6b {
> +		compatible = "ibm,cffps";
> +		reg = <0x6b>;
> +	};

This looks good.

> +};
> +
> +&fan_controller {
> +	fan@0 {
> +		compatible = "pmbus-fan";
> +		reg = <0>;
> +		tach-pulses = <4>;
> +	};
> +
> +	fan@1 {
> +		compatible = "pmbus-fan";
> +		reg = <1>;
> +		tach-pulses = <4>;
> +	};
> +
> +	fan@2 {
> +		compatible = "pmbus-fan";
> +		reg = <2>;
> +		tach-pulses = <4>;
> +	};
> +
> +	fan@3 {
> +		compatible = "pmbus-fan";
> +		reg = <3>;
> +		tach-pulses = <4>;

Where did you get the information for `tach-pulses = <4>;`?

Andrew

> +	};
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index e6f422edf454..6b44340a9e8c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -8,7 +8,7 @@
>  #include <dt-bindings/leds/leds-pca955x.h>
>  
>  / {
> -	model = "Rainier";
> +	model = "Rainier 2U";
>  	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
>  
>  	aliases {
> @@ -646,16 +646,6 @@ power-supply@69 {
>  		compatible = "ibm,cffps";
>  		reg = <0x69>;
>  	};
> -
> -	power-supply@6a {
> -		compatible = "ibm,cffps";
> -		reg = <0x6a>;
> -	};
> -
> -	power-supply@6b {
> -		compatible = "ibm,cffps";
> -		reg = <0x6b>;
> -	};
>  };
>  
>  &i2c4 {
> @@ -769,7 +759,7 @@ tmp275@48 {
>  		reg = <0x48>;
>  	};
>  
> -	max31785@52 {
> +	fan_controller: max31785@52 {
>  		compatible = "maxim,max31785a";
>  		reg = <0x52>;
>  		#address-cells = <1>;
> -- 
> 2.26.2
> 
>
