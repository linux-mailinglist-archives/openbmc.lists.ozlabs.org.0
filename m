Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3A620592
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 02:06:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5qgB1wgHz3cHw
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 12:06:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=EMzO8XLS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DCbTYpZe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=EMzO8XLS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DCbTYpZe;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5qfX74WVz2xHb
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 12:05:56 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E997E5C00BD
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 20:05:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 07 Nov 2022 20:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1667869551; x=
	1667955951; bh=gH59S02ZjlVSTxMU2/Hap37oIQgeP2DWbHrklifCQ4k=; b=E
	MzO8XLSa8T7KKYdWPUw0pUG0Ww+zEXVraTGNNIbrWCeJYyIMoSdKV7pQ2sukIf4b
	FAvuOxdAemQvAWH7srPIaYhFSYSRmLb9SOTPiN2yPoCg8OnEnNalrHVHcO+nlWnh
	4JaHZgD+OfjXA37BYXM++xurjjfKWTMr/mgLpEjESQ4Izd7sknPXxAZEyu+ja3LA
	B1GYQaTP8XgX4ALpc/wy6m79y2gFpxl8oUljRYHWME4AGt3PMu+G2tfNnL94S7ZJ
	xaZXoeZItsGKSsWiNnAXiyb/W0Cgq8HC6U6Ulc3M8gd5sl8WJnaHgskhX5nCV+AM
	H7A3kVZznugOSk9uOcdGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667869551; x=1667955951; bh=gH59S02ZjlVSTxMU2/Hap37oIQge
	P2DWbHrklifCQ4k=; b=DCbTYpZeEdfUf4FijiBIRs4NYkHVUjw+40eV3bTvSlXK
	Ea5YF289RjvlJp+ptTm2ecX+P64jN0uZtZdcU4p7D6m+3TZs93Ee5yQ7pHlihmsC
	JOcweWWSSDDM1P4dHLIeywVa5N4wgAx5eerLx4SELDXQG/G9r/BlBLfu7CyCAjOs
	pOuV16EHaKIrbe7UHPzvW15ANmrB9gp4eA1fLfKtTGD/UDoLD81D2PLRaRSD+wHs
	v/Gu7yWwm50N3iqbAl0OHDlCtXq+c5uRPNzWT7YoKu61H5GCXQ0+7KnaU5W4VifH
	cUIyNAV3ZKYTzA69AAfauxallPjfZJgEVzntIkJHfg==
X-ME-Sender: <xms:b6tpY3uT6TUA6TxvC0vA7FMskLx9BQ3VkmsfdLXJpCXoJCq7mZ_xzA>
    <xme:b6tpY4dpTrZtwT7_woUcQLjdlox9Nn3WJW1q9AKJaZrjb1IUznLl9Nk6yeOikoL3_
    uWwjVfCy8yneI4TXZw>
X-ME-Received: <xmr:b6tpY6yQBmT8wN0GHC40YHJGPlU_LpckKhpXvfcTj2kBQR9uv_Qy-O-n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdelgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhii
    iihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepfeffhfefheegud
    dtvddtueeihfduieefkeefieefkeefudefueevudelgfekffefnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiii
    hivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:b6tpY2ONOUioCDTxrk_iRgAOw1SIWM6LKd8eeItt96-hv0ldQqZxMA>
    <xmx:b6tpY3_pD-Pnz6ftEqCVuuD6ay81k6UT1jJeL3nOE4A6OLF-1Z-j-Q>
    <xmx:b6tpY2Uhid12iuCxFSGeke-SZelZ_H11tnR9cMRYz9u8hEbzYkSZsA>
    <xmx:b6tpY0Km7bxp-JewmdD2JromGv6tjBMbyHd5D1INzr79jxwNyDfrvw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 7 Nov 2022 20:05:51 -0500 (EST)
Date: Mon, 7 Nov 2022 20:05:49 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: project wide changes to maintainer ACLs
Message-ID: <20221108010549.smzzyma5nzgon76l@cheese>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221031230552.5ssc33v2xnghooqy@cheese>
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

On Mon, Oct 31, 2022 at 07:05:52PM -0400, Brad Bishop wrote:
>OpenBMC maintainers
>
>This coming Sunday, November 6th, absent any feedback here I am 
>planning on:
>
>1 - Removing admin repository access by <xyz>-maintainers groups from 
>all projects on Github that use the OpenBMC Gerrit instance for peer 
>review (no change for projects that do not use the Gerrit instance 
>like the kernel, u-boot, or qemu).
>2 - Copying the submit prolog rules from the openbmc/openbmc Gerrit 
>project to the openbmc-all-repos Gerrit project.

Hi all - I forgot to do this Sunday - oops.  I've done it just now, as 
far as I can tell the owners plugin is ready for use on all repositories 
now.

I'm sure something will break - if it does, or you have any trouble 
approving and/or submitting changes on Gerrit please reply to this mail 
or come find me in Discord.

Thanks,
Brad
