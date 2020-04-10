Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4DF1A3E6C
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 04:46:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z2TW6Y1dzDrK5
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 12:46:39 +1000 (AEST)
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
 header.s=fm2 header.b=sp3960rc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=T5CHi57u; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z2Sq1VH5zDrBx
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 12:46:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A28C05C0180;
 Thu,  9 Apr 2020 22:46:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Apr 2020 22:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=/TJiKkkxz94/yKnGKBkoQ1aWxBsiom5
 hIMAgPJODh6I=; b=sp3960rcXWNH4e65FuQtPWjlHBsStO4lf9DrxpcZOv0miTZ
 d9lviWfAYf/SnJMTXf03bil+sgbcVnlbj1SJ44EjNoO19vub8hKE4g5QQtpbkbN5
 HxmlFJox9g7kZH01a1cGpki+8xOFRB6Q4a8ZE03dOHOYSjx/4IQfb425L4oK8ru+
 /ZRzxMkagqivp6MObnfxPmjlI0VrQhXGm0tCjBa+xAFYiuNEyialV9qZNsfg8iNm
 v5D233rP+5NIlpV04Ne71g7Zx10xMn2PUgVLnwXLAktuhazYXXTTiR5Xo+Z54Ccu
 icd8bBinayAwpO2qaEPILg/MePYyNkaiAd65jew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/TJiKk
 kxz94/yKnGKBkoQ1aWxBsiom5hIMAgPJODh6I=; b=T5CHi57uvwI8uTJ82EwMAs
 Z+CVPiNrBV2egrXhNau+z359EXGLmnDRgOrh7TqlfGatkbQfRh6Hd0n8Kr2yxwV+
 y/y7d00MYRi3bvJgcVA5/biWQg+Jy3ORHWdvppSSckKfifSgMhrIrc3EzOv64AcI
 tMPN7w64xCjWyYXtr50XpxSAVbL/fQgBr3UMuXkYDaKTJ15IDrW/Qy5pQhMckGh+
 yYuEaQAMEEU6rxT1T/z+k0zFbRaABoGrAqnOF/7ZDie1HtAGu7pjaDU3Ors4hg2L
 jX2YMd9P9pmuoXAsK9lexsP2VazEJeyoNo/UWvG7uVloig2FzcUJdSelDIVpZMdw
 ==
X-ME-Sender: <xms:6N2PXkeKExGKaqH5v9UL5tnH3eXXJg_VBnSRYu6Mg_IZBAy20ZeW4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6N2PXvC3u10r46IaQSfrPt20niKUN1k9O_s2ueqn7m9Sk7fECPYqnw>
 <xmx:6N2PXm2iQN_nMZLoaB98IkjRnkjUTRkgHxZ1EiHPu5DC0Qkpd_hGaQ>
 <xmx:6N2PXvMaHv70EtDSOrcq46LEMvWVtTVlteqDu5Qmk-VMRvtpg3c-5g>
 <xmx:6N2PXtqG_5UAhzFZ2ozacuY2CLbKGVgLDVKio9LPBlZ9bHrq3ja2fg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E2216E00A5; Thu,  9 Apr 2020 22:45:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <fcb36412-38d1-48b5-bf3c-fa566235a9c3@www.fastmail.com>
In-Reply-To: <aae27f45adb7cb0508b86cf4e72ced36@linux.vnet.ibm.com>
References: <aae27f45adb7cb0508b86cf4e72ced36@linux.vnet.ibm.com>
Date: Fri, 10 Apr 2020 12:16:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: bentyner <bentyner@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4]_ARM:_dts:_Aspeed:_witherspoon-128:_R?=
 =?UTF-8?Q?emove_checkstop_GPIO_from_gpio-keys?=
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



On Thu, 9 Apr 2020, at 03:41, bentyner wrote:
> Attention handler will monitor the checkstop gpio via the character
> device interface so it needs to not be defined.
> 
> Signed-off-by: Ben Tyner <bentyner@linux.ibm.com>
> ---
>   .../dts/aspeed-bmc-opp-witherspoon-128.dts    | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
> index 1ba673a49334..701d58b7f0dc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
> @@ -4,6 +4,46 @@
> 
>   #include "aspeed-bmc-opp-witherspoon.dts"
> 
> +/ {
> +	gpio-keys {
> +		/delete-node/ checkstop;
> +	};
> +};

Is this literally just for witherspoon-128 or is it meant to be a generic
change to witherspoon behaviour? The answer should be added to
the commit message if this is specific to witherspoon-128 (and
probably talk about why it's not necessary for witherspoon).

> +
> +&gpio {
> +	gpio-line-names =
> +	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
> +	/*B0-B7*/	"","","","","","air-water","","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"fsi-enable","","","","","","","",
> +	/*E0-E7*/	"fsi-data","","","","","","","",
> +	/*F0-F7*/	"","","","","","","","",
> +	/*G0-G7*/	"","","","","","","","",
> +	/*H0-H7*/	"","","","","","","","",
> +	/*I0-I7*/	"","","","","","","","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
> +		        "led-rear-id","","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"","","","","","","","presence-ps0",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","fsi-trans","","","power-button","","",
> +	/*S0-S7*/	"","","","","","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","",
> +	/*AA0-AA7*/	"fsi-clock","","","","","","","",
> +	/*AB0-AB7*/	"","","","","","","","",
> +	/*AC0-AC7*/	"","","","","","","","";
> +};

I don't see that the checkstop gpio line is named here and so I don't
think it's a relevant change?

Why is it necessary in this patch?

Andrew
