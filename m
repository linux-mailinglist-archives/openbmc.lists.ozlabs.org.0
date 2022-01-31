Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A5C4A3C71
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9Rc4cnBz3bPP
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:27:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=a7rRcTJz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ICnb0RD0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=a7rRcTJz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ICnb0RD0; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Ph6bbRz2xsY
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:16 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 99C375C00DA;
 Sun, 30 Jan 2022 20:26:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 30 Jan 2022 20:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=w1b1jHIhfRldY03O88DzI0GsG0qjTk5JV1MgxJWZFuU=; b=a7rRc
 TJzlJBbR0GdvSVGCF6rcDNn/XIWA3F49sRmBBqDflLR3yBvW9JpH7srvBjFk59EP
 I/dXfCScmyh4I+gwjHziCYGwg7Ev/cGPVWFp1PKZal2d/E3e7i9SXlPFVSTGBbb6
 lqw8gItgcz9lC/GPIPG+RrPW3SuBiQhHhYRkB9nzmhXnda6+FSEVw/pjV2xWeKbv
 HRobT48KsZLPY+WJGj7ogapY0HyN/Dk9ah9EtXFgzrQqjxWV1GI3AfNak4NnlN1w
 ARVE7ZaD4DmB99yvw27Ctddgr1rl5/k8r1AmpKF4/Hvu6Ym40IJk5hUwwd/hvr8t
 WrNsp73ykxEvzBR/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=w1b1jHIhfRldY03O88DzI0GsG0qjT
 k5JV1MgxJWZFuU=; b=ICnb0RD0xeEYx7PDB9d8Ps1qqooUTROeIugZo7TlRE0RE
 zQH1ki513Waq1EGwTQpo+wuWUYmZ1mFLhjiIo7bMtZgfr/iggLc7R491SJ0pwqRt
 lgu1JuzW/vcqAwLy6H3eR0/bLoWQSPFqxiZ9l78bBz59CDm3L7VUbexFv1x8Afpc
 vWXBnT4gbRoo8TuxOllvuVrw7uj0j0XlvAQG6e+QyEUUJR20R5u7Zu8bSGEa9qVP
 htUfBT11gaOOLMxCgh1ohJJzrRWqk2Sl2EfN2M0yXo4h1wea039agbixXAKI8n8X
 Qtt2guSSwTqgSFeSl64GBcbTksfKce0W4vb3lb+vA==
X-ME-Sender: <xms:szr3YS8fCB3YZ3vOGwmcvulyU33umMA0-wyXMlVEbJXHvHWG8umi4w>
 <xme:szr3YSudw3G_H3MxVzyleUZAIkOz3ay4DDA3FR-Mage-i19UnT9xORRQqwnC2TbT-
 oU06qLPYZ4qX2rjdg>
X-ME-Received: <xmr:szr3YYDlglQtG2KECESaE_iTM_fUROsX5QHwGd8ALgNRJmRLJATyds7_YXOb4BjWKsvaRvqn5g43GYr5Jgnnzhp_lVe_onkETMO5xTeBA0YnRn70wpYzilscBZzu_T5f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeeiteehudevlefhvddvjeeluefhleetveehff
 fgiedtfeegkeejfeeivefgheehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:szr3Yacj0GwQkVD7QIFSnbJvuyRGr3Bw5psAiWjJt-hlzV3YZCm1HA>
 <xmx:szr3YXP83kDW8U2JdQT-Il0M75AG-QEbMooag_yh6o9ojqwtGbaAEg>
 <xmx:szr3YUlrq-oxuUcY6eUSuqWUAdVqn9339FuKUMPcuDSlOOXkmL4dQQ>
 <xmx:szr3Yd1cc0gtow5Nrkzma9bvG0Y8McLEz-JrzjhsKhG5zHBLDwjUAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:09 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/6] Runtime control of vboot
 via GPIO
Date: Mon, 31 Jan 2022 11:55:32 +1030
Message-Id: <20220131012538.73021-1-andrew@aj.id.au>
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This u-boot series implements support for controlling whether verified
boot is enabled at runtime by measuring the state of the
"bmc-secure-boot" GPIO for AST2600-based BMCs.

Previously, whether or not verified boot was required was configured at
build time.

These patches build on top of the series Eddie recently sent to the list
to enable use of GPIOs in the SPL:

https://lore.kernel.org/openbmc/20220124191503.88452-1-eajames@linux.ibm.com/

I've tested the changes under qemu, and they behave as expected for the
Rainier platform configuration.

I'll figure out how we go about upstreaming the series once Eddie's
series has been picked up.

Please review!

Andrew

Andrew Jeffery (6):
  gpio: Add gpio_request_by_line_name()
  image: Control FIT uImage signature verification at runtime
  ARM: ast2600: Control FIT uImage signature verification at runtime
  configs: ast2600: Runtime control of FIT signature verification
  ARM: dts: rainier: Add gpio-line-names property with bmc-secure-boot
  image: Fix indentation of macros

 Kconfig                                    |  9 ++++
 arch/arm/dts/ast2600-rainier.dts           | 32 +++++++++++++
 arch/arm/mach-aspeed/ast2600/Makefile      |  1 +
 arch/arm/mach-aspeed/ast2600/secure-boot.c | 53 ++++++++++++++++++++++
 common/image-fit.c                         | 17 ++++++-
 configs/ast2600_openbmc_spl_emmc_defconfig |  1 +
 drivers/gpio/gpio-uclass.c                 | 26 +++++++++++
 include/asm-generic/gpio.h                 | 19 ++++++++
 include/image.h                            | 13 +++++-
 9 files changed, 167 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-aspeed/ast2600/secure-boot.c

-- 
2.32.0

