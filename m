Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1755C4B6A
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 12:28:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jsmh0n3szDqQv
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 20:28:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OVV7y59+"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jsgH5pMFzDqXb
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 20:23:55 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y72so10077769pfb.12
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjI9jCeIw57PBfEpjcj1XV4E7Bzj3BJubBql2fU/G98=;
 b=OVV7y59+8THfLGU4dgzr0CSrli59yjwAreL+yVDg998Wq2xM+2c6RwwT+tFQY0dCAM
 Lhvwf4LkAgf6Hc1hgE7j42gQeHUm1J9S2nfCvrls7lYT92oZFd8m5ByY8HrrujAexyit
 IhfwLDesDClKC0nblUx0RLpjDI/u8H9yGJwla5RL1dHuV5qnuDeVWugZyOg62FvFaYJs
 XX0lMiCBSzeF8hgIr/Lu8aJ+Wrc9Hc8QbBBGpgPW81+LavJkv5V3884sEkwd82QmavVN
 VgYG1mbzUnE5nEHykdLfkaEukhAryTF617ymiKAwqLUa3tPVzgXOBzQGMLBOgRtl/dOJ
 ZLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjI9jCeIw57PBfEpjcj1XV4E7Bzj3BJubBql2fU/G98=;
 b=TQVD3xtC+fBEqS36nOzW6Tdu15Nf4JfeP3vJyWIzGjoIofaY2vr90wItoXA8a2Uwis
 DIhsJOdvS98INjkP70OhyZ+N919Nom99vADt50u3uE7kusU10fbqqSTy4J4hcb5/BW6/
 umaxcyVXWDml0h4c02a5injAyRSoH2g7h3m3s17f0l0FjUC8IO5IPfBe+o7Lb+CMglMU
 nkHDbUKjzZH8cNaXnQnPhLc/6RXCN7EICSdk6yGiOL0R/+2BJP0wyngovYmBUpgI/ghF
 iow5XbI67/bunclRntW+A3umC87gaTBJQhJQkuAY+8ihdPVIroMvLAf/Us1P2MOhYZrV
 Cr6Q==
X-Gm-Message-State: APjAAAXGIoUIP7XGDWwFMStcYM2FHLtAvKWmSpTn9ilkIVr/uKk3auxg
 G0cWvoSBEtwLyEbWAt8OvlDC+mqUYJM=
X-Google-Smtp-Source: APXvYqySzVgTJTEhaGdftgW+HlvA4WjSdJOlZJvjlft15Ogawl2ALHLPYamdwaQphDLDS22+LQsE7g==
X-Received: by 2002:a17:90a:dd43:: with SMTP id
 u3mr3395293pjv.98.1570011833119; 
 Wed, 02 Oct 2019 03:23:53 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id i74sm24187091pfe.28.2019.10.02.03.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:23:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 4/4] ARM: dts: tacoma: Enable LPC Firmware region
Date: Wed,  2 Oct 2019 19:53:28 +0930
Message-Id: <20191002102328.5196-5-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002102328.5196-1-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Required to provide the host firmware to on Tacoma.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 02eeea6a9bd2..55d5227caf69 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -22,6 +22,17 @@
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x2000000>; /* 32M */
+		};
+	};
 };
 
 &fmc {
@@ -447,3 +458,9 @@
 &vuart1 {
 	status = "okay";
 };
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
-- 
2.23.0

