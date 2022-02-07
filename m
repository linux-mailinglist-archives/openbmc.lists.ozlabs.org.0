Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA54AC25D
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:05:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsqFd5kQbz3bTs
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ma7vUQQh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WJvCVlpJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ma7vUQQh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WJvCVlpJ; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsqDT5hJ6z2x9R
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:04:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0014B32020D3;
 Mon,  7 Feb 2022 10:04:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 10:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9gGbEWbk6zYLA+d0=; b=ma7vU
 QQhJYDbacUyx0oa3r5WBU/vsy+MY6dNqfJrZpqulEOh0sObfeW2nGMSuK006xkOJ
 h00tbsypibl0r2MOXHYWClIEt5CGMX7OPo0jn6D5JTrY9Tp/SdBUZFMnedAzx1Au
 S5A32YRJXEG3+kCWrt6V4mPvgyOEJNaknr7FI1lI/fNj2yMvI4eUGwhzX/AXThSk
 To+czRVPvl3GuodSoaHKDm5WnZYZRgdoVGDrgp4Cqt131NVnf0YxoaTqoqheCwC+
 ysvtYdlChO+mILL0gcY1XVhzwQ3wD7Mu9m8cAEUXCupFFUU329n9PAN716oTWI65
 qXNz8Eku0qo15VIWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9g
 GbEWbk6zYLA+d0=; b=WJvCVlpJFIB0jm8jTG3D9bXKBfqLpDcH0hqmO8a/4CpNN
 7yt9U/3x3sZ3Ivq6kTBTI8nknNIRlUq2puGp07MI4Kf3FGinkhHwOEfBcR+0EIT6
 6/PMfGCgxC/SUqGeb8l/I0NjJPEMRgMIjqdiHHFfNQy5cebnKyI7RBLWGG+5E5qU
 Se/I+eDkK3uabALqicCo5Y+da7NfxXRxvezTN8HRVhfoPt4dd411pXl61Ou8zi+h
 //bzLTJy/StiXMNX609VokXGnhR2BJWhpHSRnMUX+E3fdnNWKGkLL5ic1jtfQpTl
 X8d2uoqpbMUQWLj5Bciet2HZaA7A2qO21HO7sxCFw==
X-ME-Sender: <xms:8jQBYs4jj-YDnGqGljZCpyiFcJq_KdcxwutE-qwPPpz8JUyR5L-F7Q>
 <xme:8jQBYt5u-7LVpX_kYJSvKTWZCN1J8nNAuSjGagHNDIlymqWl1WaXnpiO7rSeJ_VcY
 rgPe0sZUo8p3mPQNA>
X-ME-Received: <xmr:8jQBYrcAssp3MM55wkL_BNYJVtT3dUD3UAmuQbV2277T8QnWTfVwNrLkXYbCcgqNXM8zKgaQpo0DBxB1X6RJmh3zx-ae5QANObmdV9pjo1pw8JukE4VoMVCkhfZEXaE_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8jQBYhIkBtr1g3aViXn-TFBYoBfcTm5AjoocNKddRAeGrThPO_b7NQ>
 <xmx:8jQBYgJM4XEnuterSrbQb-ry6E9Hf4KTdVV8GECpklNssd6W8h3Vgw>
 <xmx:8jQBYizF9TVv1V6P_GbUmSkQJhmuT9AAn9i_aetcBD95rwfLEz7jYQ>
 <xmx:8zQBYlFCsXRHPS5JxY-Uw0e3dV_sMzJqTCA_GXC6MDQN-bbnDjV89Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:15 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw: aspeed_gpio: Model new interface for the AST2600
Date: Tue,  8 Feb 2022 01:34:06 +1030
Message-Id: <20220207150409.358888-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-arm@nongnu.org,
 clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series adds support for a new register interface supported by the
Aspeed GPIO controller, present in at least the AST2600.

The new interface is a single register implementing an indirect command
protocol that allows us to manipulate up to (at least) 208 GPIOs. This
makes it possible to write very simple drivers for e.g. u-boot and
jettison the need for the tedious data model required to deal with the
old register layout.

I've lightly tested the device consistency under Linux. The Linux
driver is implemented in terms of the old interface, so data model
consistency can be tested one way by poking the driver using the
libgpiod tools and then the other using devmem to drive the new
interface.

Please review!

Andrew

Andrew Jeffery (3):
  hw: aspeed_gpio: Cleanup stray semicolon after switch
  hw: aspeed_gpio: Split GPIOSet handling from accessors
  hw: aspeed_gpio: Support the AST2600's indexed register interface

 hw/gpio/aspeed_gpio.c         | 305 ++++++++++++++++++++++++++++------
 include/hw/gpio/aspeed_gpio.h |   3 +
 2 files changed, 261 insertions(+), 47 deletions(-)

-- 
2.32.0

