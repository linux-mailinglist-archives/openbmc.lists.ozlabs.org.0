Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6858E60D
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 06:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2c4l0dPgz30DP
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 14:13:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=QNvnVar3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xu4Llvzf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=QNvnVar3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xu4Llvzf;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2c4G1fmjz2xHr
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 14:13:17 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A4898320046F;
	Wed, 10 Aug 2022 00:13:09 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 10 Aug 2022 00:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660104789; x=1660191189; bh=hmhGuUd+ks
	fXxhGlkpx7iC7iwNwN11PlKrNpWYBUT/k=; b=QNvnVar3nsVicwBVqQJ9Os/Pn8
	kDXJ8IuCf5DbC9mFGNNth6Tzc02e5n+JTiq0Tl0NokPqIOR7589WmzuCXiTGfu1F
	IYl5nq66loXMhsrdHdTC59Drcv4IBGjh/XWfj/o5TKthzwEPPvk/3XCO/S/QskhE
	vSV538wG85HPtX+End+4xLUDCyOdpRWZJVVzAZgabV1eouaFAgra5SGJYOkAVz6P
	B711WdLDOEKL8SvNPrmnsLx/nSd8kGNRh26uCg6i++Pv0y1xcu7Wq4hrh2/PY2ev
	nP4juwk/WsEAWnTROzXuBQS3w0d4oYNaxn4UFOdaYA5zUPN4WSiEmYlOHzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660104789; x=1660191189; bh=hmhGuUd+ksfXxhGlkpx7iC7iwNwN
	11PlKrNpWYBUT/k=; b=xu4LlvzfDm4r0xzcdhq2I4wYfanBojSmEYCPeMzMCJRR
	2icqzHPBu4zFe2B+oRaGR59S+BPNctSIFlSkBwZrWpPEtI18L0SvH9cZA875iqEc
	SCPxp1DzFJoNPTjVI/Q92prWatlMwVKIbBGzUaXeSqoydqPZH9jxy7WOzDVovvD2
	GHYdDgBAv/a5uxoBEXxKDEp1S4sP8p70Ac9h9lasyq5asPPWHp3RbIMmbGLMnv3T
	iD+I4iJNoH/DHmQtDXJNCyom/C8ZzPfOoAawgc7F2bVAG4OyOF49ofRmeg482h07
	sDo+uuS1MAf55zLGCG13fxuHuCC7GwtnOTqxxEpkiw==
X-ME-Sender: <xms:VDDzYkleKiiHU9rn6BdlB6l3HaprRRZpB_9Wi2f8OQnW5o6osCLt6A>
    <xme:VDDzYj3XAazREc2ypn3WdjeFSfffqxyTkURAa0iGGaT9nSHO4Uo7MutATXT4z2pdo
    tRqHasgQyW9sXX8EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:VDDzYirLxS1swdZKA5oeisygRMqc5hZ3GLvcOgoSe3RhTl2DuzTCTg>
    <xmx:VDDzYgmpWi0AIotwrXBExVsUj3piJ_2zzD2STZNA2Z5k_sCX23LG_w>
    <xmx:VDDzYi3TB6KBZb0buq94ciZLOeLCcKvTggu0BIHZylpLHEndtftXBQ>
    <xmx:VTDzYnxO-M6-oBd8L6B2qYg9kUVZsT1FTQE1G9yA_YHbtcFPn_DPEw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A85A71700082; Wed, 10 Aug 2022 00:13:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-811-gb808317eab-fm-20220801.001-gb808317e
Mime-Version: 1.0
Message-Id: <72c70f13-3584-437a-bec9-5d4e14e16106@www.fastmail.com>
In-Reply-To: <20220630110745.345705-3-patrick.rudolph@9elements.com>
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
 <20220630110745.345705-3-patrick.rudolph@9elements.com>
Date: Wed, 10 Aug 2022 13:42:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Rudolph" <patrick.rudolph@9elements.com>,
 "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 2/2] arm/mach-aspeed: Add
 support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
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
Cc: christian.walter@9elements.com, takken@us.ibm.com, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

On Thu, 30 Jun 2022, at 20:37, Patrick Rudolph wrote:
> Introduce CONFIG_ASPEED_ROUTE_UART5_TO_UART1 and reuse existing
> platform code to route UART5 to UART1.
> This is required on IBM/Genesis3 as it uses UART5 as debug uart, but the
> RXD1/TXD1 pins are connected instead of RXD5/TXD5.

It would be good to clarify the language here. From the patch below
you're re-routing the BMC console from UART5 to UART1 because of a
design issue. However, the ASPEED BMC SoCs have a separate function
known as the "Debug UART" which gives unconstrained access to the BMC's
AHB via either UART5 or UART1. The password sequence is sniffed off of
RXD{1,5} between the IO port and the UART mux, so muxing the UARTs as
you've done isn't enough to enable the feature given the hardware
design.

As such I just want to clarify that you do mean just the console and not
the debug functionality itself. Further, if this is the case, I'm
wondering whether you should enable both the BMC console _and_ the debug
UART function on UART1 (see SCU070[29], though this depends on it being
enabled at all (SCU02C[10]).

Cheers,

Andrew
