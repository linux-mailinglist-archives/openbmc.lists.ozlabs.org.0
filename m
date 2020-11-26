Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1432C4EC3
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 07:35:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChSgH4llYzDr7W
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 17:35:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ieJnHukI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=aq1sPllf; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChSf5011BzDr0k;
 Thu, 26 Nov 2020 17:34:20 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 06FF45C0170;
 Thu, 26 Nov 2020 01:34:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 26 Nov 2020 01:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=LM/6syswR/TQC0khtK3z7jyG15
 eRUPMaixWhJ0PAO+Q=; b=ieJnHukIWBS9UvDusn03XU9iAbEe5i4FM++CRwRojs
 XR4cunNolOQgd3eBSei6UNbxX2zDY1+T2TwGz+dUblZ5CdvItdfesU/p/CtMLgNk
 gjQkAeFcPblHLFCSYxCMv4UjQlwte85MhnOMo8g8MhPe86kXL40TpDi+UbgdpFDQ
 2z6KbgXoOCwMUR0v5XVEOnoEdHQ0HIgZBybt3WMmUPgFgkgAg2I9ACYZcPPi+Zu1
 1GKPGriYt5psACLi3J8V95ObxHVjkbrinNhtDd2Hyn3N1SdkqB+ZtcN+fqbc145r
 AzCs0P4GO2k/Q44D0D7XeRaxqf71DYD6raSteCE//zIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LM/6syswR/TQC0kht
 K3z7jyG15eRUPMaixWhJ0PAO+Q=; b=aq1sPllfWvE+7PynW7a8zTDgOeIWUIrGj
 EMKdtwMK2n6av2TIbtU5To89Elhn1wJLjt14oG/ZnG+W/KClb8bUGm0Zwq1mn0bk
 an+EAniiB7KLqPQIXpxdRnnqxXMtWoyM2Oup5kb0Ea01z3LhLlKEP2bByaoGVDxz
 dMU7Rr3lQdf6lQHh4K/c1KRgWeWNMFwuPWCQojonQ2fpSuY7QIgxltruqKkr2Knz
 IBudK508YFZa3Ggi/zDh6TNgofP4Qa2wPI8QlYFHXlvN9V/D01kTOvlNDBkaMJ8/
 3dccsqhsPoFGUnyDf/NqUsb/lqQW1xP3UKKqXP+wMKPUeoqRj2Cew==
X-ME-Sender: <xms:aEy_X6vLmo4H9awTDFKj-lhi_9FWVkzQ0prbNaLXnDCSIe-c0C9cQQ>
 <xme:aEy_X_d1fh7KuCSFneSFJd-CrPzCe1pWkWH8HLirA-j05hdNYn_OSueZLIIOXo1N6
 8bvLwm8oEE3m-aefQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehuddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppedvtdefrdehjedrvddtkedrudegieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:aEy_X1x86IKtSlHMuRJUpYO_YAK_zBkPLEeWZE9FHhXts_k4iIECxg>
 <xmx:aEy_X1MHa05VAEwWnsSN6FSSSIhjHp-6W3w1PFfgGJzGtv6mZefIhQ>
 <xmx:aEy_X6907oItowjdP5aJrwQ-X5s32FXnkPeWdW1U1sQMgRzCz2RX0Q>
 <xmx:aUy_X6xxzn9RoJlUmylQhhXRzkyARU5GFgHNlpppNENwKEY8DTeWIQ>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F2ED328005D;
 Thu, 26 Nov 2020 01:34:12 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed: Fix GPIO requests on pass-through banks
Date: Thu, 26 Nov 2020 17:03:37 +1030
Message-Id: <20201126063337.489927-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
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
Cc: sashal@kernel.org, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, billy_tsai@aspeedtech.com,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
fixes access to GPIO banks T and U on the AST2600. Both banks contain
input-only pins and the GPIO pin function is named GPITx and GPIUx
respectively. Unfortunately the fix had a negative impact on GPIO banks
D and E for the AST2400 and AST2500 where the GPIO pass-through
functions take similar "GPI"-style names. The net effect on the older
SoCs was that when the GPIO subsystem requested a pin in banks D or E be
muxed for GPIO, they were instead muxed for pass-through mode.
Mistakenly muxing pass-through mode e.g. breaks booting the host on
IBM's Witherspoon (AC922) platform where GPIOE0 is used for FSI.

Further exploit the names in the provided expression structure to
differentiate pass-through from pin-specific GPIO modes.

This follow-up fix gives the expected behaviour for the following tests:

Witherspoon BMC (AST2500):

1. Power-on the Witherspoon host
2. Request GPIOD1 be muxed via /sys/class/gpio/export
3. Request GPIOE1 be muxed via /sys/class/gpio/export
4. Request the balls for GPIOs E2 and E3 be muxed as GPIO pass-through
   ("GPIE2" mode) via a pinctrl hog in the devicetree

Rainier BMC (AST2600):

5. Request GPIT0 be muxed via /sys/class/gpio/export
6. Request GPIU0 be muxed via /sys/class/gpio/export

Together the tests demonstrate that all three pieces of functionality
(general GPIOs via 1, 2 and 3, input-only GPIOs via 5 and 6, pass-through
mode via 4) operate as desired across old and new SoCs.

Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 74 +++++++++++++++++++++++--
 drivers/pinctrl/aspeed/pinmux-aspeed.h  |  7 ++-
 2 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 1d603732903f..9c44ef11b567 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -286,14 +286,76 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 static bool aspeed_expr_is_gpio(const struct aspeed_sig_expr *expr)
 {
 	/*
-	 * The signal type is GPIO if the signal name has "GPI" as a prefix.
-	 * strncmp (rather than strcmp) is used to implement the prefix
-	 * requirement.
+	 * We need to differentiate between GPIO and non-GPIO signals to
+	 * implement the gpio_request_enable() interface. For better or worse
+	 * the ASPEED pinctrl driver uses the expression names to determine
+	 * whether an expression will mux a pin for GPIO.
 	 *
-	 * expr->signal might look like "GPIOB1" in the GPIO case.
-	 * expr->signal might look like "GPIT0" in the GPI case.
+	 * Generally we have the following - A GPIO such as B1 has:
+	 *
+	 *    - expr->signal set to "GPIOB1"
+	 *    - expr->function set to "GPIOB1"
+	 *
+	 * Using this fact we can determine whether the provided expression is
+	 * a GPIO expression by testing the signal name for the string prefix
+	 * "GPIO".
+	 *
+	 * However, some GPIOs are input-only, and the ASPEED datasheets name
+	 * them differently. An input-only GPIO such as T0 has:
+	 *
+	 *    - expr->signal set to "GPIT0"
+	 *    - expr->function set to "GPIT0"
+	 *
+	 * It's tempting to generalise the prefix test from "GPIO" to "GPI" to
+	 * account for both GPIOs and GPIs, but in doing so we run aground on
+	 * another feature:
+	 *
+	 * Some pins in the ASPEED BMC SoCs have a "pass-through" GPIO
+	 * function where the input state of one pin is replicated as the
+	 * output state of another (as if they were shorted together - a mux
+	 * configuration that is typically enabled by hardware strapping).
+	 * This feature allows the BMC to pass e.g. power button state through
+	 * to the host while the BMC is yet to boot, but take control of the
+	 * button state once the BMC has booted by muxing each pin as a
+	 * separate, pin-specific GPIO.
+	 *
+	 * Conceptually this pass-through mode is a form of GPIO and is named
+	 * as such in the datasheets, e.g. "GPID0". This naming similarity
+	 * trips us up with the simple GPI-prefixed-signal-name scheme
+	 * discussed above, as the pass-through configuration is not what we
+	 * want when muxing a pin as GPIO for the GPIO subsystem.
+	 *
+	 * On e.g. the AST2400, a pass-through function "GPID0" is grouped on
+	 * balls A18 and D16, where we have:
+	 *
+	 *    For ball A18:
+	 *    - expr->signal set to "GPID0IN"
+	 *    - expr->function set to "GPID0"
+	 *
+	 *    For ball D16:
+	 *    - expr->signal set to "GPID0OUT"
+	 *    - expr->function set to "GPID0"
+	 *
+	 * By contrast, the pin-specific GPIO expressions for the same pins are
+	 * as follows:
+	 *
+	 *    For ball A18:
+	 *    - expr->signal looks like "GPIOD0"
+	 *    - expr->function looks like "GPIOD0"
+	 *
+	 *    For ball D16:
+	 *    - expr->signal looks like "GPIOD1"
+	 *    - expr->function looks like "GPIOD1"
+	 *
+	 * Testing both the signal _and_ function names gives us the means
+	 * differentiate the pass-through GPIO pinmux configuration from the
+	 * pin-specific configuration that the GPIO subsystem is after: An
+	 * expression is a pin-specific (non-pass-through) GPIO configuration
+	 * if the signal prefix is "GPI" and the signal name matches the
+	 * function name.
 	 */
-	return strncmp(expr->signal, "GPI", 3) == 0;
+	return !strncmp(expr->signal, "GPI", 3) &&
+			!strcmp(expr->signal, expr->function);
 }
 
 static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index f86739e800c3..dba5875ff276 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -452,10 +452,11 @@ struct aspeed_sig_desc {
  * evaluation of the descriptors.
  *
  * @signal: The signal name for the priority level on the pin. If the signal
- *          type is GPIO, then the signal name must begin with the string
- *          "GPIO", e.g. GPIOA0, GPIOT4 etc.
+ *          type is GPIO, then the signal name must begin with the
+ *          prefix "GPI", e.g. GPIOA0, GPIT0 etc.
  * @function: The name of the function the signal participates in for the
- *            associated expression
+ *            associated expression. For pin-specific GPIO, the function
+ *            name must match the signal name.
  * @ndescs: The number of signal descriptors in the expression
  * @descs: Pointer to an array of signal descriptors that comprise the
  *         function expression
-- 
2.27.0

