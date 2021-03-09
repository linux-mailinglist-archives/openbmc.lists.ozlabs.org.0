Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF533330F0
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 22:31:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw7gn2s5Dz3cHH
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 08:31:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=nrQFW5F5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OVxYDbgs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=nrQFW5F5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OVxYDbgs; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw7gW49h5z30HT
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 08:31:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9910712B3;
 Tue,  9 Mar 2021 16:31:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 16:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=Dob
 cHGpJksxOUY5C7xTmRSWFWBvtGzMS+g0pHPBHA6c=; b=nrQFW5F52HoTdw92/nL
 XQQilU3IEQ0bUuA6PzlaPtuSYXnPIQBFAa3jLa2fN4rTweUFidsR47Ik5UXTWW+k
 5umUCwUGFPmd5jThg/MZY8Pk8ApvwPAYO8GQrSYcxC0AsuRabrgWDfjDOJZ0G703
 vaIN7O3YaxSuVllDphySfCeQSwleiHecAON4O0QPGAbQUxzyKpTD2kcHYKQTiOto
 1wEvV3oPxzEECqA9gTTn2JD/B5dXXu2Wmap0dLGcljdX8vjdp4Xe0QdqMt0ldZf+
 FcMIZMZv2TDVxnAa4FrdlNC3z4LfWoLgPPx17HXOxpSR1wyWQ55owo8+/1OxfpZD
 1XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DobcHG
 pJksxOUY5C7xTmRSWFWBvtGzMS+g0pHPBHA6c=; b=OVxYDbgsA8D7L7PTaWm8PD
 GgmvduWxyE5BI5gq6UgoX8zQ+OXYz45PXKLHgCzOAQZvN0KfBfEoOhFbiBKF1GQo
 H3+9aKlv+dUowbzlJyqUQVYGx4hpO+wkVqYhfsx94c6ojTwJGZlimlrRR8qszPzx
 5UZajEdknLQsUyKRNShSBLh8cHMX2A9wHUJyPPtvvUtpONV7vqchw+pVN0sclU5G
 8wlM0iAwFZ2OxZd3SOgqRiAvuwK64ZZ4ts8Ah0/xdiCshM/Kxz+py9biPXcTAUV3
 WzGZzeD3GF2VGjIm7AMLFNS5irB0HdFghO3IYzleaWgjF6+vPj7Wni8jzmc8jEJw
 ==
X-ME-Sender: <xms:IelHYK3MAXAaO2Zcuux_CbZnAhevnRyr0yN5VkJf78LCEGzTQuLWVA>
 <xme:IelHYNGvGUz--ZtF01e0p39CK_OK9j-rTmsGJgZjN672pXrnzPRF6hHiBmXSIoD_t
 17Jn_2KM27aUkj22uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeek
 fedufeeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:IelHYC768cSI1fcG3cAtr_klu4Cc5CacnkjJTQtwe_9zx1MgyF4vgQ>
 <xmx:IelHYL1FGA0QEmfEl3nO8hcbWr_N5cztCJF3KbvLzT6e2m74zF5qtg>
 <xmx:IelHYNFDfc45rvEqf-ivhEpctyb0i72TVCuWD26FExXBonMeINF15w>
 <xmx:I-lHYMyre2uBGFt3nna52-59w-HsnLhNRYR_BCrB-3LAAlp6X2qOUQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id AD5441080057;
 Tue,  9 Mar 2021 16:31:13 -0500 (EST)
Date: Tue, 9 Mar 2021 16:31:11 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Meisenecker Robert (BT/ETI-CS)" <Robert.Meisenecker@de.bosch.com>
Subject: Re: Bosch Sicherheitssysteme GmbH CCLA
Message-ID: <20210309213111.7puayatdyodbn7yg@thinkpad.fuzziesquirrel.com>
References: <ab897f9a1daf4d7b900d64cf453aab69@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ab897f9a1daf4d7b900d64cf453aab69@de.bosch.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 02, 2021 at 12:23:21PM +0000, Meisenecker Robert (BT/ETI-CS) wrote:
>Dear OpenBMC team,
>
>just to make sure that our contribution request from 2021-02-11 did not get lost:
>please find our signed CCLA in the attachment.

Hello Robert and Bosch.  It appears it did get lost - apologies for 
that.  Your CCLA has been accepted - welcome Bosch!

thx - brad
