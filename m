Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B577E29FC81
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 05:11:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMpl55ld1zDqp5
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 15:10:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=oaJHJUD8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=IQb5iybH; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMpk62llBzDqkK
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 15:10:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CA5E5C0165;
 Fri, 30 Oct 2020 00:10:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 30 Oct 2020 00:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=iGyYbeoMaw4LiBNHqOfmZGmhujurbYq
 1CdNiWBoSsrk=; b=oaJHJUD8iRfA/+9whIEZreBg7VDQ0AMMWNnVW7RN4cRbcg6
 j8YUY43er80xYFqslvqSoj5zLBa4vJVCMSCdoEfBOmy++dXnliKpLc5ddbryyKOI
 ueKsX6JgAvCDc5soa7uL33bjOOHSD6816KPqWIt7TdlcdCskTkRVw6ppMYJ2oBOL
 eG70GNcXyI8d/IESyrSajQR6V7th+3JeKMruFeFmALXAFSXjOn9oCoHSDni4PfDj
 iMkHFl6PzqWdWO0PVY/94scR/lG1NUEr9fmeo96mRhTxgxpUmh/9W2buOq9mKbDU
 wzLMk+yuOS0t66wpnrfvS/2DGyoWxsohHtfQGMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iGyYbe
 oMaw4LiBNHqOfmZGmhujurbYq1CdNiWBoSsrk=; b=IQb5iybHjUAvUw9sdgjFIk
 C1J8Eg7PkVXLRb4VGJBX+qhteon1Xrk71XBbcPuGuuTQBgnCCigSv9m9pCGzqbII
 W5DgalL5LNbL/ydIJJajMlxS52TlAfm+X+I7b+OyNFvFL8pUv1Z2CXVxCNYLXJGc
 Vu4AaupZweGncgVUHEOlRWKSgknxWbza5pZq0jjMof0WzGcgQCTfqz66Lc7NrUH/
 WYyLqtcht0ElpE6utz4mQ0+hg5lxxDc4qq3GPJPaVm8fjqfIe6typk46TZP1dPlj
 D7b1akeHaXJlA4r21l1DK9Cjg3b6ZO4Uk8fUg6KOKIpCbszE3HmWAtxL//qJhxMQ
 ==
X-ME-Sender: <xms:GpKbXwdBb_3acoHUlWZWd69IhLkxxpj9TIse-ow11flwphBssVyrtQ>
 <xme:GpKbXyMWNSnBCw73sBzEMOtFND2iLL0cTWjcamWnimrSyouaAmh5-4WvGSIVLEtkw
 wXl9XMwoOLWjoRMrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GpKbXxg3Ivc1XxQutIgD3FKfIzdNC7EhSPDRl17QEp_7KxhajoYWSw>
 <xmx:GpKbX19xFNaJDId7KeBBbJC-pSxb-8_WsBL9KJ2Oln2pEmXktcqWog>
 <xmx:GpKbX8tjZ6ZW0NxqyZX8CwJOVHY_lB9ARckHUg0SLUMEJL7iUhl8gA>
 <xmx:G5KbX17KaqgbLx5rCd2hw-SaxXrQTR1njiDUVtTn89H9sAm-vy6zyQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A79C1E00AF; Fri, 30 Oct 2020 00:10:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <b3a92e61-ffe2-48d6-a4b5-487b22b3bdd6@www.fastmail.com>
In-Reply-To: <20201028185647.14565-1-eajames@linux.ibm.com>
References: <20201028185647.14565-1-eajames@linux.ibm.com>
Date: Fri, 30 Oct 2020 14:39:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.8_v3]_ARM:_dts:_Aspeed:_Rainier:_Add_4U?=
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



On Thu, 29 Oct 2020, at 05:26, Eddie James wrote:
> Add a device-tree for the Rainier 4U system. Change the model name
> on the existing Rainier device-tree to 2U, and remove the two
> extra power supplies that are only present on the 4U system. Also
> add labels to the fan nodes for use in the 4U device-tree.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v2:
>  - Just reference individual fan nodes rather than the whole fan
>    controller
> 
> Changes since v1:
>  - Don't rename the 2U dts
>  - Include the 2U dts from the 4U and make the necessary Changes
> 
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 37 +++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 20 +++-------
>  3 files changed, 43 insertions(+), 15 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e4d3600e16d..9a2ab5e6e924 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1360,6 +1360,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
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
> index 000000000000..9c35ac1d19a6
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2020 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-bmc-ibm-rainier-4u.dts"
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
> +};
> +
> +&fan0 {
> +	tach-pulses = <4>;
> +};
> +
> +&fan1 {
> +	tach-pulses = <4>;
> +};
> +
> +&fan2 {
> +	tach-pulses = <4>;
> +};
> +
> +&fan3 {
> +	tach-pulses = <4>;

I'm still digging for info on the tac-pulses, but we can fix them later if necessary.

Looks okay otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
