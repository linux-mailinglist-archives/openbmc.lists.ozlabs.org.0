Return-Path: <openbmc+bounces-1246-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHBZOhOhb2nrCgAAu9opvQ
	(envelope-from <openbmc+bounces-1246-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 16:36:51 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418046382
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 16:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwQSW678Yz2x9M;
	Tue, 20 Jan 2026 22:43:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768909403;
	cv=none; b=QBbKxOKRA1ustZ//O4kdlOhNzTfkMli8Ik4pdn5KXx2WGYkFWGAg9GSDaDCVIK2vPqM846ER65CkbqcRW3qvE7/b1pVEYt6u2oG/rWaUR1oLK/fIuNDgdCc6fhfOx41bZSGS3T+mBh9ZiGeyAcbq1oJGxJlY40GhwmGMH7VMtOo2grpCEWtU3cKcpJMk5/nAeCNFj8YvdM6pXZEn846gkVGgg4Vh/Pc003lUW4U28JHHfGCU2JQKEyGnNgy8gPk8gp4AJy81XuG/NbLq7VUAPF712SUGqI5dyiLp2nX+6Gxwgv3Jv6lWfyqOZinE1AIZtIXCulw4IJQP7hP/WiHsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768909403; c=relaxed/relaxed;
	bh=dKEiXSCwdojell1kyAFXQf/IfqH1mRcSaT2Kaw98+kw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=R3ZEL/F4Nt6RyQuUA6piQpI6AMNITrEppZJhVKQ8SfYJzai3Ls2xszwyGQw77oFiH5Zf3NAx4xoZn2nOZ7oYgnzEKniL78uNsdDM/SPx821BAnZyBAeWXo0JQ0wDxJX7TpXY0bpn/SmEJogJg3z5mZetynHPSN6lK8FZnLaRlyvSh9RV4vKJ6Ypcl7xpK8azt1364i8I+7mHvyydjtK/qGvUAehTvMWccLk0TKtKPYpmElw/hXOFSbvCYxNqbgtkt55K+nJDk+7aN0Wm78R/UhwcbxEgAsUiQo0vPeOHsuWVyFBR6MEdI7GHeC8UAYTxhJ9fSnKfyGilq/s4th1HrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwQSV6S3pz2x99;
	Tue, 20 Jan 2026 22:43:22 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/3] Add pinctrl support for AST2700 SoC
Date: Tue, 20 Jan 2026 19:43:04 +0800
Message-ID: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
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
X-B4-Tracking: v=1; b=H4sIAEhqb2kC/z3MQQ7CIBBA0as0s5YGaEmpK+9hTIN0kEloSwCNp
 undJS5cvsX/O2RMhBnOzQ4JX5RpWyu6UwPWm/WBjOZqkFwqIYViz5hLQrNMkVZbUmDaiVHNjpt
 xUFCzmNDR+7e83qpd2hZWfG3+Iz7yXvCu56LVWuqBCXanED5TyYYuJkfEuaD1rd0WOI4vfEq54
 KUAAAA=
X-Change-ID: 20251215-upstream_pinctrl-8f195df0a975
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=3007;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XQLWMm3YsOhtEHJ6iLz4rU8Uz2JmnALhlntXC1iQkvA=;
 b=Gxi0bOC2k4CwxLCGJ3+75SuENKeJa42aygju/Eb16ieiH0uqpGEPvIX1fxidn3KU7k4v7A5Ps
 XtN9gTyxx6EA2EG7f/Ajdtc5Z9m9A08NkB9awKP6WiVs6dQwixj8jxr
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1246-lists,openbmc=lfdr.de];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5418046382
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree bindings and a pinctrl driver for the
ASPEED AST2700 SoC.

AST2700 is composed of two interconnected SoC instances, each providing
its own pin control hardware. This series introduces bindings describing
the AST2700 pinctrl architecture and adds pinctrl driver support for the
SoC0 instance.

The bindings document the AST2700 dual-SoC design and follow common
pinctrl conventions, while the driver implementation builds upon the
existing ASPEED pinctrl infrastructure.

---
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
      Add compatible strings for AST2700 pinctrl to the SCU binding.
      dt-bindings: pinctrl: aspeed: Add support for AST27xx
      pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  28 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 ++++
 drivers/pinctrl/aspeed/Kconfig                     |   8 +
 drivers/pinctrl/aspeed/Makefile                    |   1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c    | 683 +++++++++++++++++++++
 5 files changed, 850 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-upstream_pinctrl-8f195df0a975

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


