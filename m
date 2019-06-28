Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD6591C3
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 04:55:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZhFz0XW4zDqRw
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 12:55:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AGj08IWZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZsB2OOfD"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZgwB4Lz5zDqQY;
 Fri, 28 Jun 2019 12:39:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E2CEE2CC1;
 Thu, 27 Jun 2019 22:39:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MPFfXAMopBJpR
 ZjirOncY4gwnFS+WGjHM5WJUlUs384=; b=AGj08IWZ4q+WD4X2r3GZK+/4U3lio
 r56CeKOrCH3vhoTjHATI01NjJxvcHPDFygBTNyM7y2UnJu5okOx3e5usgYSmDaIG
 oay+66a2C3IN0Iq6vqTfD4QjmAUGFZeu0oLjnbJ9jm6RGNjuHCbvwFZvZ7dg3y2s
 SiyBp1kqwJCohFndwhawCrSkaUMJKgpd7N8mxWJ61W4hA8QMbF1PaciRpGyeq/Tf
 N1orKJ8Cca9nv9gT5eUaPLUJ/nnb8uNmZdfDCaTQhxdNNzzks4UwJdS0c3G6yqaC
 R95r8cSleNc//nEsaIlKkYWBgg5iiknhi2+zIVkn6thb17lOzWURtu99w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=MPFfXAMopBJpRZjirOncY4gwnFS+WGjHM5WJUlUs384=; b=ZsB2OOfD
 Y4Z4bkzmXybMoaD3WsbGx6CNdngxCbI1bWfmdQbGSS4+yb+F4zDjvRRQZGpn2Tpx
 b8X0Y/CcXNjNvQPxT3i8/Qtoz3oKxJV0urUbnVSK0JJ/1dqIR2TGEkQBoicQn4Zo
 k9LpC4xiBOybGFPa8I1Kz3M5NtOY3VVNC04xiXiKsjlFIiEHR+wlB6HiqM5JBeTk
 sFLoN0ml9RNCmtKnj90eQBOPOkZm6D/Hwkg6EAqpYxmYb/Htkok7b+74tbAVxgKK
 dErMZt7ipbKrPRRoE1ZDdDySQsBGSnH2RFG46IpJxx6FdoqEJ6221NU5gbdZpgxJ
 VwRZ57u4S+5R4Q==
X-ME-Sender: <xms:9n0VXf5RL1HypWlRYf9Fe0m8_dBqvIuGDSgVyosjpvjHdMKPlYv5yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:9n0VXa0-6GtiG57O3Bk4ckXJU_8MGQE8swGioFrnBlz-IUugmAoysg>
 <xmx:9n0VXTm9G83pI6y_wn_Xyig2XHS54tJOCI3xZFA7oSsnakR4yjbfaQ>
 <xmx:9n0VXQ7SRriP-WaKm9HSkU2x72vrwvU4t3muWoAOSEStFsMLaKE2hA>
 <xmx:9n0VXX_5Lqyry0tnKgnVBj8m9CQAmHo4r_AzxavwIlQvwsqLgIg1Ug>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1FA3380075;
 Thu, 27 Jun 2019 22:39:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 8/8] pinctrl: aspeed: Add implementation-related
 documentation
Date: Fri, 28 Jun 2019 12:08:38 +0930
Message-Id: <20190628023838.15426-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
References: <20190628023838.15426-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Johnny Huang <johnny_huang@aspeedtech.com>, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The ASPEED pinctrl driver implementations make heavy use of macros to
minimise tedium of implementation and maximise the chance that the
compiler will catch errors in defining signal and pin configurations.
While the goal of minimising errors is achieved, it is at the cost of
the complexity of the macros.

Document examples of the expanded form of pin declarations to
demonstrate the operation of the macros.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 204 ++++++++++++++++++++++++-
 1 file changed, 200 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index a036ce8f1571..329d54d48667 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -18,7 +18,8 @@
  * priority level are frequently not the same (i.e. cannot just flip a bit to
  * change from a high to low priority signal), or even in the same register.
  * Further, not all signals can be unmuxed, as some expressions depend on
- * values in the hardware strapping register (which is treated as read-only).
+ * values in the hardware strapping register (which may be treated as
+ * read-only).
  *
  * SoC Multi-function Pin Expression Examples
  * ------------------------------------------
@@ -172,9 +173,9 @@
  * * A signal expression is the smallest set of signal descriptors whose
  *   comparisons must evaluate 'true' for a signal to be enabled on a pin.
  *
- * * A function's signal is active on a pin if evaluating all signal
- *   descriptors in the pin's signal expression for the function yields a 'true'
- *   result
+ * * A signal participating in a function is active on a pin if evaluating all
+ *   signal descriptors in the pin's signal expression for the function yields
+ *   a 'true' result
  *
  * * A signal at a given priority on a given pin is active if any of the
  *   functions in which the signal participates are active, and no higher
@@ -221,6 +222,201 @@
  * well as pins) required for the group's configuration will already be in use,
  * likely in a way that's inconsistent with the requirements of the failed
  * group.
+ *
+ * Implementation
+ * --------------
+ *
+ * Beyond the documentation below the various structures and helper macros that
+ * allow the implementation to hang together are defined. The macros are fairly
+ * dense, so below we walk through some raw examples of the configuration
+ * tables in an effort to clarify the concepts.
+ *
+ * The complexity of configuring the mux combined with the scale of the pins
+ * and functions was a concern, so the table design along with the macro jungle
+ * is an attempt to address it. The rough principles of the approach are:
+ *
+ * 1. Use a data-driven solution rather than embedding state into code
+ * 2. Minimise editing to the specifics of the given mux configuration
+ * 3. Detect as many errors as possible at compile time
+ *
+ * Addressing point 3 leads to naming of symbols in terms of the four
+ * properties associated with a given mux configuration: The pin, the signal,
+ * the group and the function. In this way copy/paste errors cause duplicate
+ * symbols to be defined, which prevents successful compilation. Failing to
+ * properly parent the tables leads to unused symbol warnings, and use of
+ * designated initialisers and additional warnings ensures that there are
+ * no override errors in the pin, group and function arrays.
+ *
+ * Addressing point 2 drives the development of the macro jungle, as it
+ * centralises the definition noise at the cost of taking some time to
+ * understand.
+ *
+ * Here's a complete, concrete "pre-processed" example of the table structures
+ * used to describe the D6 ball from the examples above:
+ *
+ * ```
+ * static const struct aspeed_sig_desc sig_descs_MAC1LINK_MAC1LINK[] = {
+ *     {
+ *         .ip = ASPEED_IP_SCU,
+ *         .reg = 0x80,
+ *         .mask = BIT(0),
+ *         .enable = 1,
+ *         .disable = 0
+ *     },
+ * };
+ *
+ * static const struct aspeed_sig_expr sig_expr_MAC1LINK_MAC1LINK = {
+ *     .signal = "MAC1LINK",
+ *     .function = "MAC1LINK",
+ *     .ndescs = ARRAY_SIZE(sig_descs_MAC1LINK_MAC1LINK),
+ *     .descs = &(sig_descs_MAC1LINK_MAC1LINK)[0],
+ * };
+ *
+ * static const struct aspeed_sig_expr *sig_exprs_MAC1LINK_MAC1LINK[] = {
+ *     &sig_expr_MAC1LINK_MAC1LINK,
+ *     NULL,
+ * };
+ *
+ * static const struct aspeed_sig_desc sig_descs_GPIOA0_GPIOA0[] = { };
+ *
+ * static const struct aspeed_sig_expr sig_expr_GPIOA0_GPIOA0 = {
+ *     .signal = "GPIOA0",
+ *     .function = "GPIOA0",
+ *     .ndescs = ARRAY_SIZE(sig_descs_GPIOA0_GPIOA0),
+ *     .descs = &(sig_descs_GPIOA0_GPIOA0)[0],
+ * };
+ *
+ * static const struct aspeed_sig_expr *sig_exprs_GPIOA0_GPIOA0[] = {
+ *     &sig_expr_GPIOA0_GPIOA0,
+ *     NULL
+ * };
+ *
+ * static const struct aspeed_sig_expr **pin_exprs_0[] = {
+ *     sig_exprs_MAC1LINK_MAC1LINK,
+ *     sig_exprs_GPIOA0_GPIOA0,
+ *     NULL
+ * };
+ *
+ * static const struct aspeed_pin_desc pin_0 = { "0", (&pin_exprs_0[0]) };
+ * static const int group_pins_MAC1LINK[] = { 0 };
+ * static const char *func_groups_MAC1LINK[] = { "MAC1LINK" };
+ *
+ * static struct pinctrl_pin_desc aspeed_g4_pins[] = {
+ *     [0] = { .number = 0, .name = "D6", .drv_data = &pin_0 },
+ * };
+ *
+ * static const struct aspeed_pin_group aspeed_g4_groups[] = {
+ *     {
+ *         .name = "MAC1LINK",
+ *         .pins = &(group_pins_MAC1LINK)[0],
+ *         .npins = ARRAY_SIZE(group_pins_MAC1LINK),
+ *     },
+ * };
+ *
+ * static const struct aspeed_pin_function aspeed_g4_functions[] = {
+ *     {
+ *         .name = "MAC1LINK",
+ *         .groups = &func_groups_MAC1LINK[0],
+ *         .ngroups = ARRAY_SIZE(func_groups_MAC1LINK),
+ *     },
+ * };
+ * ```
+ *
+ * At the end of the day much of the above code is compressed into the
+ * following two lines:
+ *
+ * ```
+ * #define D6 0
+ * SSSF_PIN_DECL(D6, GPIOA0, MAC1LINK, SIG_DESC_SET(SCU80, 0));
+ * ```
+ *
+ * The two examples below show just the differences from the example above.
+ *
+ * Ball E18 demonstrates a function, EXTRST, that requires multiple descriptors
+ * be set for it to be muxed:
+ *
+ * ```
+ * static const struct aspeed_sig_desc sig_descs_EXTRST_EXTRST[] = {
+ *     {
+ *         .ip = ASPEED_IP_SCU,
+ *         .reg = 0x3C,
+ *         .mask = BIT(3),
+ *         .enable = 1,
+ *         .disable = 0
+ *     },
+ *     {
+ *         .ip = ASPEED_IP_SCU,
+ *         .reg = 0x80,
+ *         .mask = BIT(15),
+ *         .enable = 1,
+ *         .disable = 0
+ *     },
+ *     {
+ *         .ip = ASPEED_IP_SCU,
+ *         .reg = 0x90,
+ *         .mask = BIT(31),
+ *         .enable = 0,
+ *         .disable = 1
+ *     },
+ * };
+ *
+ * static const struct aspeed_sig_expr sig_expr_EXTRST_EXTRST = {
+ *     .signal = "EXTRST",
+ *     .function = "EXTRST",
+ *     .ndescs = ARRAY_SIZE(sig_descs_EXTRST_EXTRST),
+ *     .descs = &(sig_descs_EXTRST_EXTRST)[0],
+ * };
+ * ...
+ * ```
+ *
+ * For ball E19, we have multiple functions enabling a single signal, LPCRST#.
+ * The data structures look like:
+ *
+ * static const struct aspeed_sig_desc sig_descs_LPCRST_LPCRST[] = {
+ *     {
+ *         .ip = ASPEED_IP_SCU,
+ *         .reg = 0x80,
+ *         .mask = BIT(12),
+ *         .enable = 1,
+ *         .disable = 0
+ *     },
+ * };
+ *
+ * static const struct aspeed_sig_expr sig_expr_LPCRST_LPCRST = {
+ *     .signal = "LPCRST",
+ *     .function = "LPCRST",
+ *     .ndescs = ARRAY_SIZE(sig_descs_LPCRST_LPCRST),
+ *     .descs = &(sig_descs_LPCRST_LPCRST)[0],
+ * };
+ *
+ * static const struct aspeed_sig_desc sig_descs_LPCRST_LPCRSTS[] = {
+ *     {
+ *         .ip = ASPEED_IP_SCU,
+ *         .reg = 0x70,
+ *         .mask = BIT(14),
+ *         .enable = 1,
+ *         .disable = 0
+ *     },
+ * };
+ *
+ * static const struct aspeed_sig_expr sig_expr_LPCRST_LPCRSTS = {
+ *     .signal = "LPCRST",
+ *     .function = "LPCRSTS",
+ *     .ndescs = ARRAY_SIZE(sig_descs_LPCRST_LPCRSTS),
+ *     .descs = &(sig_descs_LPCRST_LPCRSTS)[0],
+ * };
+ *
+ * static const struct aspeed_sig_expr *sig_exprs_LPCRST_LPCRST[] = {
+ *     &sig_expr_LPCRST_LPCRST,
+ *     &sig_expr_LPCRST_LPCRSTS,
+ *     NULL,
+ * };
+ * ...
+ * ```
+ *
+ * Both expressions listed in the sig_exprs_LPCRST_LPCRST array need to be set
+ * to disabled for the associated GPIO to be muxed.
+ *
  */
 
 #define ASPEED_IP_SCU		0
-- 
2.20.1

