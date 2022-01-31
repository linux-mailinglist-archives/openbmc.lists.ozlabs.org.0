Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D894A3CFB
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 05:59:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnG7J48y8z2xtv
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 15:59:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=GQws82Cw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=E2Vgb7qA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=GQws82Cw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=E2Vgb7qA; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnG6x0PZcz2xsb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 15:58:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 31A8E5C00E5;
 Sun, 30 Jan 2022 23:58:47 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Sun, 30 Jan 2022 23:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=0ty00qmzBXveou0zVs2PQzWd+CwEFSEACFa5JY
 sk7jo=; b=GQws82Cwm2ZmUjt5FmrMjGAeUiFJH540NsrPJIWf5x+9XGeRVNbae7
 I+iVhKZFhx/6nMujLyoVYpdy0fwLKvoYFb+XLGwKnhef5jxx2XxRy8CADWZhe3eI
 FnYUkhCfPd2PxO+5HNS+mvFqAl2FB5npndr2WuMJ85uvYss5IyY3/m0QVf+Yx9Gq
 W8hX8iezqZtZTjjdZPyFhYb3iIjsmqJnNUiMfN88tY6Lz80RABnqs759dEGOzSLO
 tRF1i2mXFYV1YXYcG39dyGGS/Te/8i0mTvI3fFWN3B5FySje7cBzoEkaiB4+DioM
 pLfRlxOTjK2QFMrI8QdP9C22+2tI2ymw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0ty00qmzBXveou0zV
 s2PQzWd+CwEFSEACFa5JYsk7jo=; b=E2Vgb7qAaBnE5fCkZFLBrlELRZRKufIPD
 Wy0Dfx7CNkEup1siYoGHlMG43tNSJaJOA65kXrslF38M8dlO6R8+PcjyKTrCtkCu
 25NfuAPcfDc3sP+XQLzkDFlVRGAhnCQDkGm1f9uDwyGm5HjaHLDVIQb7a0GgpIqH
 AXWdDm+HnYLH0SfEASZtO3Ew6j2kGxyTWAihFBdOiWel3qWWymwef6h9lrBPj1/7
 D+SehYcgBKy5Z2BboXxAy0qwHXxNaGt0ri+gIb7dQg2BO27uQo+yjGUj/oTRGk2v
 jFJf5SruatOQE5Z5nBVP0t9QR06LtlvY9EFK9f4IrwEqa/oAj5fEw==
X-ME-Sender: <xms:h2z3YdLmfSBlUf8lEGg98ymV8l_WJ5gqCWrUHFVhp2jRyP3FMS_XTA>
 <xme:h2z3YZIPiiAPrnK03y6GyNsvnl7E5xdIX73Pm12PJ4SseHBVKoLSN52PCFXP75vHD
 pV6R9JZoOQUFaQn2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:h2z3YVslvtJiHQ4hd1yRQqviXNstIhPaEo0DN5iylDz09yXMJUxuEQ>
 <xmx:h2z3YeYVTS9C5MdQm3Ok3Wz4xpfsikufzp4D5cO9dq5_wli8_dbT_A>
 <xmx:h2z3YUa7ykW_Wc7642LJZ6koVVdHNpmp8tURYbIdrVQuMDi6TNpz6Q>
 <xmx:h2z3Ya3iVU9fENzLrq0mNgEnzCgMnRyTjVuWd7WGiscu05rXcFiZnw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0D161AC0E99; Sun, 30 Jan 2022 23:58:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <b7249e99-8a6b-4c31-965c-7c6e24b0de6a@www.fastmail.com>
In-Reply-To: <20220124191503.88452-3-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-3-eajames@linux.ibm.com>
Date: Mon, 31 Jan 2022 15:28:26 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 2/6] gpio: add gpio-hog
 support
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



On Tue, 25 Jan 2022, at 05:44, Eddie James wrote:
> From: Heiko Schocher <hs@denx.de>
>
> add gpio-hog support. GPIO hogging is a mechanism
> providing automatic GPIO request and configuration
> as part of the gpio-controller's driver probe function.
>
> for more infos see:
> doc/device-tree-bindings/gpio/gpio.txt
>

(cherry-picked from 5fc7cf8c8e268590f3b0037eecea7f6798209f78) ?

> Signed-off-by: Heiko Schocher <hs@denx.de>
> Tested-by: Michal Simek <michal.simek@xilinx.com> (zcu102)
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
