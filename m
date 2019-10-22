Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA44DFCD7
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:49:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1JK1J4YzDqL9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 15:49:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qIXAnduF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EvIQ17mI"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1FG3wC8zDqKX
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 15:46:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D963320A14;
 Tue, 22 Oct 2019 00:46:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 00:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=aerwwGD5QCZ8oSOwS7Kz7+HKKD
 YoX3T4Rm6E0cVhILQ=; b=qIXAnduF4MTbwkb1DIjPZ9sFHZcOQHjzVl0al8n8A1
 QLCgXKypgM2jAJ5ApYVvHSS2cSxQef+4J4BL1J1JmY1l1m65SEdCm+14Mdb6Om/W
 3PuquGZIWGZS/k7HjK12pksWAxKQC3p0USOeEZCoL8t4rwDaDnN0dOUpEiUSV71h
 +LtWphfSbfiAxfXk5c66RPo8JJj4TGPIOVnjwKM/LnsuSqkAhoEEuMIyKjEOUXO6
 596eDZMBzNePcFEz1WYCtP+LEXeuiunqJm67ZUnMIy31bWGgX8CJOblBml3tXCfv
 QE0DUfXqFO3JM1XG+0lfi76bBYEWyUk4AZzK5naDKW8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aerwwGD5QCZ8oSOwS
 7Kz7+HKKDYoX3T4Rm6E0cVhILQ=; b=EvIQ17mIYnjRUeLY8oED8G5wRXnDGma8O
 ySH07coTC2CmXAQgphQ+n2fec9JVp9YTFLYFM2R51TAokvZRpZ/TFzP5+6mEWlnx
 DJasvJlpJ8vRmc/+wkDcxHWB9cE7iwOKsH1eFPQN67E9zfNSVBAW0sKv9tjAgmCE
 VZCJ7VQDa23SuxuCwmsHSTk8LeLkPYuL/Q2QtUyUUg7isT+EPZlxOnZ73pSPyyf2
 F5NYuyC48/3yj3kWD7jycjfMVw3mL/CkvJLayqJjF5evOW9sf9SWsh6UygKbhn+H
 6adga1NzIcxys1kUXUy/LUKBtJfzylzQLy5psOAZIacgDS45BJQdw==
X-ME-Sender: <xms:vYmuXbZpZhUAf8uzSWkHejyEjj26BTBsj2_hc5EP8hX-ryz3cqAo8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeeigdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtvddrkedurddukedrvdeknecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vYmuXefJEMBanjBV7kdSzhjo21CZLqBIYt64sltOVt_Q8lODseR2Pg>
 <xmx:vYmuXfFmyMUHBHJPZedeoqGe0d2ghUjyafXWcfCdNbHkTzKjmPqzEQ>
 <xmx:vYmuXbC45Ef_46HnlDmAAYGRHbM8AAVcU7XwFy47oiZn0yigW7RW6g>
 <xmx:vYmuXYGLKEE-xTAcd_cHNn6GzR-8AGUSuHeUvMivUajRqKwsAG-fAg>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8D7180063;
 Tue, 22 Oct 2019 00:46:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 0/4] Pinmux fixes for AST2600 LPC
Date: Tue, 22 Oct 2019 15:47:33 +1100
Message-Id: <20191022044737.15103-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series fixes some issues with the AST2600 pinctrl driver.

Patch 1/4 backports an existing upstream fix. Patch 4/4 simply improves the
readability of the debug output of the driver. Patches 2 and 3 fix issues with
muxing pins for LPC, particularly for the Tacoma board.

Please review.

Andrew

Andrew Jeffery (4):
  pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively
  pinctrl: aspeed-g6: Fix LPC/eSPI mux configuration
  ARM: dts: tacoma: Hog LPC pinmux
  pinctrl: aspeed: Improve debug output

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts |  7 +++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c  | 56 +++++++++------------
 drivers/pinctrl/aspeed/pinctrl-aspeed.c     | 25 +++++++--
 drivers/pinctrl/aspeed/pinmux-aspeed.h      |  2 +-
 4 files changed, 54 insertions(+), 36 deletions(-)

-- 
2.20.1

