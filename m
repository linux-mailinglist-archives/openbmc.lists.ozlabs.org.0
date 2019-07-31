Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D577B7A6
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 03:37:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ywyl06wwzDqTW
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 11:37:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=3f_baxqmkb-oaewsaasxq.oayabqznyoxuefe.alxmne.ads@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mXq/CPEu"; 
 dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ywvN4NkHzDqYq
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 11:34:18 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id w200so40291050ybg.11
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9WyeISlJbiUqrCi6lFo17ItZ78ZU9RlgShR/IG9yUJA=;
 b=mXq/CPEuqMDu0oIi9GtioUwgQhFYYXBa0hdekWBzdp0yCnJJ7DbS9jaNo60B3qKCR7
 qsT61/wZ0l6cmPbvbe5Aih0EFrVDLvjjosva0udh+6Da7VwnRYteG41fwBZQL3iNpR2z
 RvkiNCP8n8xlibPCrXKA5UwjIOIZ1usTt2tDib6f1FK1uqL87giFZeku/1l/3DnPT+2J
 u5rR5gu9XyM9TIs8Jx8S7hOV7EC7re542q3mKRsbzNMEl6FDTa3KGrgMPghTOBEGpl6o
 QrWScx1d5e0MOMwrfz5EQejoFEQYdpfRyJIGmIz7SPwMjSZpaxldkeOmcOkdOiv+9pPy
 rdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9WyeISlJbiUqrCi6lFo17ItZ78ZU9RlgShR/IG9yUJA=;
 b=DZNcucsCMJftYT5cbvYlf2O+6NrYX+VU/v0GJn1jEKgCBh9q1sC+Jlyte97Ay9HVy6
 WJ+lYrLwhho8NAWGrigvxBlhD3N83MVw9zbe164hh2Ap2Vf7tlmqRCww5polwV49rcdd
 g2DSnQDEAYPKBvIrReRMSOvNXmqQugvBGYE9mvlGYMYLhitmczNPOBZAYNyJsVdLnU9y
 LyVJinfE+/2uaiklh0q3GP+8/bCErprKhK4SvAn/Tp5lrbfJ3RURBP5focodf5Y/439A
 uIF3Cafsi12x0O78qEFJGUVVRfK4hz33EoUmnvsS+jBjfu0Q4d/njrq0trxVpVqwljrT
 WY4w==
X-Gm-Message-State: APjAAAWqtK8V/G5sP/M8hDp1CSkfmxZVXfELUrmuPN8jyWRjBW1Ou3wo
 F0VRZtE23Qa42K4MoLa2q+qh3/w=
X-Google-Smtp-Source: APXvYqx12g6sWicwLbqnC2MIrYvaN+A4d84GFJX8U3/Pdr4ImsFo9hfnHfACqi3plJ0YfhNNlFXRjJI=
X-Received: by 2002:a81:a453:: with SMTP id b80mr71139020ywh.485.1564536855530; 
 Tue, 30 Jul 2019 18:34:15 -0700 (PDT)
Date: Tue, 30 Jul 2019 21:34:04 -0400
In-Reply-To: <20190731013404.243755-1-osk@google.com>
Message-Id: <20190731013404.243755-3-osk@google.com>
Mime-Version: 1.0
References: <20190731013404.243755-1-osk@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 3/3] arm: dts: aspeed: Add vuart espi-enabled to
 aspeed-g5.dtsi
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable auto-configuration of VUART SIRQ polarity on AST2500.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 01ffe70f64d5..9e561504042a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -351,6 +351,7 @@
 				interrupts = <8>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				no-loopback-test;
+				espi-enabled = <&syscon 0x70 25>;
 				status = "disabled";
 			};
 
-- 
2.22.0.709.g102302147b-goog

