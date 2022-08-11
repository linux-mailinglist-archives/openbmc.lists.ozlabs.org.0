Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8758F77C
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 08:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3GnC74pYz3bXR
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 16:17:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=EbcEWc3n;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=THDPQ9iP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=EbcEWc3n;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=THDPQ9iP;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Gmj1pSSz2y2G
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 16:17:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 33E4F32004ED;
	Thu, 11 Aug 2022 02:17:03 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 11 Aug 2022 02:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660198622; x=1660285022; bh=cXgZzwvINH
	boxPuEpEngInss8vKz+Xh6lWjOGIziAsE=; b=EbcEWc3ngiREe/OBKXn6ac8RMc
	3TEPaS12/AbsbCeXAFJ7e5XAHoG9wxphfqi/JcRDaYtMMU/VnmufHchBFEDTCRNy
	d0Px4JnREDoKyZ1yJNt/HtZFIYOJ4US/P4Ka/Fr+wW7xMLl9FDnT2v3vjx/txE1V
	M6kX7wUUUsdKnE5Mzy/+2Mk2AFpGaEpBD7Un062+cK3nfqZUH2UbSXkowqyLX2ky
	WQQ4OEjnDRdfsYWSMbdeZXMEn5zEtnZzUSMKlgcQDV/0kJ0QrmdlfZUqJ4gqacan
	mIvpfQg3smpuHyVd5QzBVo/s5Q8hbDhCUgH9J4CwJNWLAOhAjSTTEFiILjQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660198622; x=1660285022; bh=cXgZzwvINHboxPuEpEngInss8vKz
	+Xh6lWjOGIziAsE=; b=THDPQ9iPTue66ztaiEk8sGCuavVor0mJlciBShUQybhw
	Bb4mb16Cur5T+/zocqZs2/H8Mb1N7APBbc+FmbBfMZ8XQQoFNhjkg18bGuI/TTkr
	FLk6CXWIS/Xq32LC5rKwkNmldbxawmfWZaygKISNkHnXOqJFRIhc/8YLDgBExKMK
	44WZTdzrDpkTcswasGSuyziQdRj+6Bhse0Rj0xcq96sUHjivw7dlh0ggb0x88fsY
	auSSDKNVuaiF3n3RMWSQLqW2rYejFAT9LRMqCcqQjMMsEC450otab7n+UImwWz7/
	wjZs+nJNj8+cGHJIV2OafwOsLiA/0Z7HW+uv970DsQ==
X-ME-Sender: <xms:3p70YmmyXhMYy-EuJAI1E9v44a7CCXrZef9vG67gvwxt6NkG9_kOBA>
    <xme:3p70Yt1oXiIaTSmSDX6R9rKXcYGqGPvY6bxEYjuJg-yOvrPDoTHuBV0NhNnpTEFJR
    qcLyL2cGY7AqjHebQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3p70YkqMhb2m-j7DTSoNwEVyyqTbHXQWRUpvHM9zPTgXLwIR_RHyMg>
    <xmx:3p70YqmjAnMRtlxsetz0BWrD3yQ-Sk5iDOmMmG6-yuVnAfwPFtAmVw>
    <xmx:3p70Yk1JOQEM3cC7RabUBgx-7yhbLpd1_7RlduONhmnMMUcdckhhxg>
    <xmx:3p70YhwuAojQpxCuTmuwGRB1dBLsbfVAGuRclNEhZ7a-rGsGzq3ABA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4B26C1700082; Thu, 11 Aug 2022 02:17:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-811-gb808317eab-fm-20220801.001-gb808317e
Mime-Version: 1.0
Message-Id: <0a4b11b1-f30d-40d7-bab3-c8c188798d71@www.fastmail.com>
In-Reply-To:  <CALNFmy2-b=V2BroMOgFWZ+++NknvtvQXetVQNaJtpAYW1+iOVA@mail.gmail.com>
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
 <20220630110745.345705-2-patrick.rudolph@9elements.com>
 <945f5419-3352-4be5-b8fa-5973138f37aa@www.fastmail.com>
 <CALNFmy2-b=V2BroMOgFWZ+++NknvtvQXetVQNaJtpAYW1+iOVA@mail.gmail.com>
Date: Thu, 11 Aug 2022 15:46:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Rudolph" <patrick.rudolph@9elements.com>
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts: Add IBM
 Genesis3 board
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com, Joel Stanley <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 11 Aug 2022, at 15:30, Patrick Rudolph wrote:
> There's no SD card slot, there are two MACs in RGMII mode and nothing
> that's required to boot on i2c bus.
> In the defconfig used I disabled SD card and I2C support, so this is
> not an issue.
> Should I still disable it in the devicetree, just for reference?

It's at least more idiomatic to `#include "ast2500.dtsi"` and then
enable the controllers you require, rather than #including the dts for a
board not entirely related to the design you're bringing up.

That would be my preference. Is the result much more verbose? It feels 
like it shouldn't be if you only need networking and SPI flash.

Andrew
