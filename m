Return-Path: <openbmc+bounces-1439-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QtK4Ar3LqmnUXAEAu9opvQ
	(envelope-from <openbmc+bounces-1439-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 13:42:37 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D3220D57
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 13:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS5dz70SRz3c5f;
	Fri, 06 Mar 2026 23:42:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772800951;
	cv=none; b=k0g0GH02O2Tg9Lhl0pC+ulo9kyBiK6FPCcKSIonz79/oiWCEyO5ehxIyEmjXxMyzY/fJ/IeHKP7wM3rdopq4efaBgfaNcZHTsnWg42LyxnMOj88h5R/TDoSelV4nEtbM3F1URrxsSOVbMhhW1wsXcoLzVlEZJmfWb9YphZcmgXznJ+0SGtpAS/53QEwyXGoFYEcdCWOtTa55e1y3n++kKDAhghlmJTUv7pWepIn5JWGx2AG7fOfak079hTUGc+B5CkvFEC+M/CWueEaUuU7Pe86tIdkdGDzv8KVn2J/ryojqkA6Ovk7p798SDgKT0YFktAKRpuKpG6Zb7S8EczL7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772800951; c=relaxed/relaxed;
	bh=mtkN5wY32yGyUVMqIQKwbA762es0jsXWtrjdjPl4Z3E=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=a3kBStEj8iZgWooGAcOErGOnXlkTUhRjkU//JlaZoTDevHDNCDxx186F+y7pM6bTcIxj7h4tWLuM04rmv5756FMEcruxijA/faH5ziqJ3oMdPse66rNMcIIshejV9WFX+LfShUucqDfG2F1WfDo6f/bzeb1mYwLY+DuRtCxJb8j+lqXuAlQK2IxZIereu4uA0WXAcnVe4eLe9o7RlVqGzb8K8N3MVNbb0jqSEcdUfSkhD4kOo5t2BnCy140B10JS/nFvu7IDv2ItdtTTZrZ8qMiL7NWpkvbmJ3SnXeoZ84sc95FAuYTKl3f9C19R8oYSWj3giG4jilXd8ol6GUDOqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS5dy5hDbz30T9;
	Fri, 06 Mar 2026 23:42:30 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 20:42:14 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 20:42:14 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v4 0/3] pinctrl: aspeed: Add AST2700 SoC0 support
Date: Fri, 6 Mar 2026 20:40:24 +0800
Message-ID: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjLqmkC/z3MTQ7CIBBA4as0s5YGsKTUVe9hTIMwyCT9IYBG0
 /TuEhcuv8V7O2RMhBkuzQ4JX5RpWyu6UwM2mPWBjFw1SC6VkEKxZ8wloVmmSKstaWbai0E5z83
 QK6hZTOjp/Vteb9U+bQsroTb/ER94J/i546LVWuqeCXanef5MJRsaTY6IrqANrd0WOI4v818Hc
 aUAAAA=
X-Change-ID: 20251215-upstream_pinctrl-8f195df0a975
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772800933; l=3651;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=hmhX29ofHmVWCzL1SALtQcsZhjHt2TQjDqLgIH3btbs=;
 b=Lb4YNVvozAIHN2+4S7osElCp6zPzI4h1b6nDiv/0/Q9kkILL1f5AqvwWrXcPbS8SM/mUoFGnp
 BFPpaJ9eunyBlcCNPhH94GGWamZqJC8xEAMqtxUdj2yGiCTbh4j3rsu
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 987D3220D57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1439-lists,openbmc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

AST2700 is composed of two interconnected SoC instances, each providing
its own pin control hardware. This series introduces bindings describing
the AST2700 pinctrl architecture and adds pinctrl driver support for the
SoC0 instance.

The bindings document the AST2700 dual-SoC design and follow common
pinctrl conventions, while the SoC0 driver implementation builds upon
the existing ASPEED pinctrl infrastructure.

A binding example is not yet provided as there were differing opinions
during review about whether it should live in the SCU binding or the
pinctrl binding. I can add one in a follow-up revision once the
preferred location is agreed.

---
Changes in v4:
- Rename series title to "pinctrl: aspeed: Add AST2700 SoC0 support"
  to make it specific to SoC0.
- Remove unnecessary SCU example from bindings.
- Fix Makefile newline to avoid patch warning.
- Make pinctrl data structures const and align with existing Aspeed drivers.
- Sort the arrays and enums alphabetically.
- Minor cleanups for consistency, no functional changes.
- Link to v3: https://lore.kernel.org/r/20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com

Changes in v3:
dt-bindings: pinctrl: aspeed: AST2700 pinctrl improvements
- Improved binding descriptions for SoC0 and SoC1 to better explain the
  AST2700 dual-SoC architecture with independent pin control blocks
- Switched from additionalProperties to patternProperties using the
  '-state$' suffix to restrict child node naming
- Removed per-binding examples based on review feedback
- Added additionalProperties: false at the top level for stricter schema
  validation
- Dropped the aspeed,ast2700-soc1-pinctrl binding, as the SoC1 pinctrl
  registers follow a regular layout and can be described using an
  existing generic pinctrl binding
- Updated the function and group enum lists to match the definitions
  used by the AST2700 pinctrl driver

dt-bindings: mfd: aspeed: Add AST2700 SCU example with pinctrl
- Added a complete AST2700 SCU0 example demonstrating pinctrl integration
- Example covers both pin function/group configuration and pin
  drive-strength settings
- Updated child node naming to use the '-state' suffix, following common
  pinctrl conventions

pinctrl: aspeed: AST2700 SoC0 driver improvements
- Refactored pin and signal declarations to use common ASPEED pinmux
  macros (SIG_EXPR_LIST_DECL_SEMG, SIG_EXPR_LIST_DECL_SESG, PIN_DECL_*)
- Added SCU010 register definition for hardware strap control
- Reworked code structure to better align with existing ASPEED pinctrl
  drivers

- Link to v2: https://lore.kernel.org/r/20250904103401.88287-1-billy_tsai@aspeedtech.com

Changes in v2:
- Update pinctrl aspeed binding files.
- Update the commit message for pinctrl binding patch.
- Link to v1: https://lore.kernel.org/r/20250829073030.2749482-1-billy_tsai@aspeedtech.com

---
Billy Tsai (3):
      dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC0 pinctrl
      dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
      pinctrl: aspeed: Add AST2700 SoC0 support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |   1 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 126 ++++
 drivers/pinctrl/aspeed/Kconfig                     |   9 +
 drivers/pinctrl/aspeed/Makefile                    |   1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c    | 710 +++++++++++++++++++++
 5 files changed, 847 insertions(+)
---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20251215-upstream_pinctrl-8f195df0a975

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


