Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC29037E2
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 11:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3PS3yQRz3cSH
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 19:33:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=62.142.5.81; helo=fgw20-7.mail.saunalahti.fi; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3P7646qz3cLL
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2024 19:32:42 +1000 (AEST)
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 646b635b-27d5-11ef-ab0f-005056bdd08f;
	Tue, 11 Jun 2024 12:31:34 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 2/4] pinctrl: nuvoton: Make use of struct pinfunction and PINCTRL_PINFUNCTION()
Date: Tue, 11 Jun 2024 12:30:23 +0300
Message-ID: <20240611093127.90210-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611093127.90210-1-andy.shevchenko@gmail.com>
References: <20240611093127.90210-1-andy.shevchenko@gmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since pin control provides a generic data type and a macro for
the pin function definition, use them in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 19 ++++++++-----------
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 11 +++--------
 4 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index fb933cddde91..62e877b76a25 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -98,12 +98,6 @@ static const u32 ds_3300mv_tbl[] = {
 	17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000,
 };
 
-struct ma35_pin_func {
-	const char		*name;
-	const char		**groups;
-	u32			ngroups;
-};
-
 struct ma35_pin_setting {
 	u32			offset;
 	u32			shift;
@@ -149,7 +143,7 @@ struct ma35_pinctrl {
 	struct regmap		*regmap;
 	struct ma35_pin_group	*groups;
 	unsigned int		ngroups;
-	struct ma35_pin_func	*functions;
+	struct pinfunction	*functions;
 	unsigned int		nfunctions;
 };
 
@@ -1041,9 +1035,10 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 					u32 index)
 {
 	struct device_node *child;
-	struct ma35_pin_func *func;
+	struct pinfunction *func;
 	struct ma35_pin_group *grp;
 	static u32 grp_index;
+	const char **groups;
 	u32 ret, i = 0;
 
 	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
@@ -1055,12 +1050,12 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 	if (func->ngroups <= 0)
 		return 0;
 
-	func->groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(char *), GFP_KERNEL);
-	if (!func->groups)
+	groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(*groups), GFP_KERNEL);
+	if (!groups)
 		return -ENOMEM;
 
 	for_each_child_of_node(np, child) {
-		func->groups[i] = child->name;
+		groups[i] = child->name;
 		grp = &npctl->groups[grp_index++];
 		ret = ma35_pinctrl_parse_groups(child, grp, npctl, i++);
 		if (ret) {
@@ -1068,6 +1063,8 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 			return ret;
 		}
 	}
+
+	func->groups = groups;
 	return 0;
 }
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 2601aacfb976..c6b11a198c76 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -639,13 +639,6 @@ static struct pingroup npcm7xx_groups[] = {
 
 #define NPCM7XX_SFUNC(a) NPCM7XX_FUNC(a, #a)
 #define NPCM7XX_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define NPCM7XX_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct npcm7xx_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 NPCM7XX_SFUNC(smb0);
 NPCM7XX_SFUNC(smb0b);
@@ -764,7 +757,8 @@ NPCM7XX_SFUNC(lkgpo2);
 NPCM7XX_SFUNC(nprd_smi);
 
 /* Function names */
-static struct npcm7xx_func npcm7xx_funcs[] = {
+static struct pinfunction npcm7xx_funcs[] = {
+#define NPCM7XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM7XX_MKFUNC(smb0),
 	NPCM7XX_MKFUNC(smb0b),
 	NPCM7XX_MKFUNC(smb0c),
@@ -880,6 +874,7 @@ static struct npcm7xx_func npcm7xx_funcs[] = {
 	NPCM7XX_MKFUNC(lkgpo1),
 	NPCM7XX_MKFUNC(lkgpo2),
 	NPCM7XX_MKFUNC(nprd_smi),
+#undef NPCM7XX_MKFUNC
 };
 
 #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 9834a13cf5c9..7c37d2cda9f1 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -829,13 +829,6 @@ static struct pingroup npcm8xx_pingroups[] = {
 
 #define NPCM8XX_SFUNC(a) NPCM8XX_FUNC(a, #a)
 #define NPCM8XX_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define NPCM8XX_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct npcm8xx_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 NPCM8XX_SFUNC(gpi36);
 NPCM8XX_SFUNC(gpi35);
@@ -1060,7 +1053,8 @@ NPCM8XX_SFUNC(hgpio6);
 NPCM8XX_SFUNC(hgpio7);
 
 /* Function names */
-static struct npcm8xx_func npcm8xx_funcs[] = {
+static struct pinfunction npcm8xx_funcs[] = {
+#define NPCM8XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM8XX_MKFUNC(gpi36),
 	NPCM8XX_MKFUNC(gpi35),
 	NPCM8XX_MKFUNC(tp_jtag3),
@@ -1282,6 +1276,7 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(hgpio5),
 	NPCM8XX_MKFUNC(hgpio6),
 	NPCM8XX_MKFUNC(hgpio7),
+#undef NPCM8XX_MKFUNC
 };
 
 #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index cdad4ef11a2f..5cf6d555c5a5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -482,13 +482,6 @@ static const struct pingroup wpcm450_groups[] = {
 
 #define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
 #define WPCM450_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define WPCM450_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct wpcm450_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 WPCM450_SFUNC(smb3);
 WPCM450_SFUNC(smb4);
@@ -555,7 +548,8 @@ WPCM450_FUNC(gpio, WPCM450_GRPS);
 #undef WPCM450_GRP
 
 /* Function names */
-static struct wpcm450_func wpcm450_funcs[] = {
+static struct pinfunction wpcm450_funcs[] = {
+#define WPCM450_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	WPCM450_MKFUNC(smb3),
 	WPCM450_MKFUNC(smb4),
 	WPCM450_MKFUNC(smb5),
@@ -616,6 +610,7 @@ static struct wpcm450_func wpcm450_funcs[] = {
 	WPCM450_MKFUNC(hg6),
 	WPCM450_MKFUNC(hg7),
 	WPCM450_MKFUNC(gpio),
+#undef WPCM450_MKFUNC
 };
 
 #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
-- 
2.45.2

