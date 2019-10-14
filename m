Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D977D5C9E
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 09:49:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s9gk56mSzDq6J
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 18:49:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NyHRhgJ7"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s9c96z0GzDqW0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 18:46:33 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id e10so5608499pgd.11
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gcGHc6NiDJmSEhkq326owEvhW20nMup0OGJTuguoKdA=;
 b=NyHRhgJ7x2t46AL00kaMvCAI4UhYPR4syUlRgyULr/wa3PgF8msoQt+22gC+5NtCrM
 5rqfrxkhxHuKY2uMzvAaahyETxukKGogZ9qfOGfDftGvuR8V7rPsIOrelRyKQeG4gMKq
 TNsGDsjfuijMKEBSkLKlfd8xxHoAmvJ+Gb+aPGVran9tU/AZNHduIVXVYw1JiTrt25kA
 OIx5pwXaquXCrwQb12lAvSOQKg73C8lpcnd1VzcDIXaraswe/6VSSMD9zs1PqEaK/wXv
 WpM2m+Pv8YrC6FFknzh31SSDCZHLZVFJvwnetDZRYW5agzbhyuF+ksp4dbJtxPR8IM8n
 n7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gcGHc6NiDJmSEhkq326owEvhW20nMup0OGJTuguoKdA=;
 b=V/PhBoxk8HqQ/eXPK2iFpg/zQpQzluJTvZjSBdYwPPtl289udSPW6CxCfKXmOqM7JM
 iN3Sz1UlC2BzOquvXTwtxZvlMaqY4mn0vDbwM+dzrt/bFEXljATFx512lDVRqCfY1DEj
 mxE3z+aT6LGo+H8UWVixMIB52wqjerr7erEUuKAKixD7gndshB1HfVjcEs0xDAkk/ctN
 8awLlUKyZzqOWIxLKY3kj9B4SkJ4t4nZMBt6eqo9NUeSEr0zZfUBfeycLRa8tra9AIYM
 qomjxbUtY8QWmqCE1GeBhJX4Zcbj1/FeWA3Q1/AwevLUkE1rfbf8YmOHH0ncG7/vd8eu
 XHiw==
X-Gm-Message-State: APjAAAW37ecTciVIofj4to96aqNiAYyp/r2zoDmI34Zd1F5mdDm3u2GH
 TjSo2OxGv3BYFhHK+D2yX9fWWinOPxY=
X-Google-Smtp-Source: APXvYqz7Uvx2yM59RiRwLRActdmlMCJw4NuMUGs2P5L1PKRR5GeINYTkfSJ1FXhdI9f6gX/AvtyRvQ==
X-Received: by 2002:a65:6701:: with SMTP id u1mr31576283pgf.368.1571039191449; 
 Mon, 14 Oct 2019 00:46:31 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id z12sm16714146pfj.41.2019.10.14.00.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 00:46:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/2] ARM: dts: aspeed: tacoma: Add FSI mux and
 enable GPIOs
Date: Mon, 14 Oct 2019 18:16:18 +1030
Message-Id: <20191014074618.15506-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014074618.15506-1-joel@jms.id.au>
References: <20191014074618.15506-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tacoma the enable and mux GPIOs allow the BMC to enable FSI and
control if the clock and data should come from the BMC, or from the
debug connector.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index cdc14773ddda..2580fef5314b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -142,6 +142,9 @@
 
 &fsim0 {
 	status = "okay";
+
+	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>; // FSI_JMFG0_PRSNT_N
+	fsi-enable-gpios = <&gpio0 ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>; // BMC_FSI_IN_ENA
 };
 
 &i2c0 {
-- 
2.23.0

