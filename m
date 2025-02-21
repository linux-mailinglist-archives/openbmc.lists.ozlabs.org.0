Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA8A41234
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KYw3MyMz3dHp
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740128987;
	cv=none; b=ATZ2upXJDe1jLprS5UIo0wAjNVqDMPCEmSaQO+mrLAl0U8TfAyz2G47HfCUyhqmbXfYPcQv871xnK6ASFeVuZBzAj/V6ORG0ne8cWCtznvwxGlfk9ATftffBPskJSqbkDpr5xdXg/RelmkYDdYbV1kzoRVC+INDrqcKqIhXWFdoetFFpdzS1jST0bXClqfOllENiV9v8V1SS5VhgXSTR+2P7ln26DVWdh69crbVP3lwSUODWeGCkZDeQ7MRvBP82ZdhE4YvlNSJUyJQ+d2tEQoW1bsuL0SH1OGXyjabtDmzb5M+KO3uX0P67DM/HegDD3Y8R/PYNeoiPnZAafJFezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740128987; c=relaxed/relaxed;
	bh=7Rl2b+0CyoddVI2sskryUayI+99HYF7eeBGTGtW0UpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kn/gftKg+jyt/ZKC0ZNdVus64h6SuL0ki/LnjrgnOhoO5y94FLm7oN9abphYXBAusCF+szQiaIIWLS6LZyBPpdKPmGOJXHEHCl4ahL2wl3TVl/e0ZDEEZEZI1gDIR5UbGuvlibiA8fHP8tfn0ospbrGQicbgajAIARstgIHP+HbQmWyVpvgwAFRjYs0HW1NQSUeUFp/TgYd0TZfpUQo8pRUxBcy3K2WbIartZI33DRc1ru1MovGMTAqVkj6PBHVMILGN8sYVFNQoNXVTmsV2FLGR9rUYEQW9wWNVEwwcK/SR80twdMNp0YcZRMpCo69HA0P0XphiJLv9p/LMCc6ZTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=amDWE28o; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=amDWE28o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzkpy4h2Jz30T1
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 20:09:46 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22185cddbffso44908975ad.1
        for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 01:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740128985; x=1740733785; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Rl2b+0CyoddVI2sskryUayI+99HYF7eeBGTGtW0UpQ=;
        b=amDWE28o+VBC+f1kqXgQFueGcw7D9k3YaTfPJfa8Exw+EDhSL03LlQl/jOcVnbOxmT
         Ea8nUFKnLx+bB6mjytdVV0cVA6CkjQCDa9qpCPkJ4IqkhcqKwMyOMwsV0tL/cTsk/WIs
         vf6JPXk034Zvmpz+3Ys/uUvHFJG2s8PRTGgPzqI92i8vCg7u5lAksjJpmpoOU7cG88Kz
         kiggp9uo3yy44zH2QLQ1oGbX2NMkFFKtpb32f/1cfVw00GkS50/7SVCDeNFwdLNQwlix
         s8p7PJM+TaFuh8aWWIGY/Ktegiyqi9Dpyjwi3i26MJux7xqmX2yhgexUZX545P1kHEG0
         hRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740128985; x=1740733785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Rl2b+0CyoddVI2sskryUayI+99HYF7eeBGTGtW0UpQ=;
        b=KS0rFkfFQo3w2H1Knh7DxELanA5Nqyy/lSL6p3uIdFXkMS9gCe3CCzzjcLN7gzXz4C
         XH0LIY1p7j454rg0LJWsWgzYdxL4zs/M6/TVHTWXW7ue6cKitpZV+BjPMqiHK87iDaOq
         +LcvYwT96pAlZ4duc+X4KQcu+HYeethUMMbDTR6lki/t54bBdVGcbOMHGQPUKYQD8PkJ
         P6NQKUebPgNWHbC167tdgUOIYLUosB2tWt7rYu70xII8ExlN+VcYnfDEtc5iJ76T9x0J
         K179wNnCqsgI2+HMRQ6NiVqvBH3+G5S8VtPjn9goWOT/ces0yUAlL8uRpQewAvcRxksl
         ACJw==
X-Gm-Message-State: AOJu0YxljUPvQo15uqD7706zvSSdHm7YPGWA7i6Jxn5Wos0/8gepHdgy
	h9viyCGGQwmWuP/eeYRpyhPhIpksSitP4RR/k5Gb0aluzn1IgGhN
X-Gm-Gg: ASbGnctNnS0SpsoftrgM7lOA/iQ16ulE9bbFuaawbJLz7i5YGOBiiZfZhz7hcLyO649
	f6VxuCK61fTkv8M/MS+fDTD7XqRKmmWUUqGNpqwN1YFDALuD78WhwkP71Hso3DUGLV/CbtuLg7J
	ZFLdfFSD2xepiwFXtPpXk/uu/K5sMVI6AnrvXPPpcv1DwT7yqshUwUoEFDygghVRr8iFoQlv9aB
	rTU0Tx14rdSKTTXnBXXy+yVcnl3vx6JADO8UyvQato+0qy6NNZ5yP84pdhmBo8nNM6A4DgcFTLa
	jFBwQkdkbQLjNGY6jmp2apU7HlCZVdCMnA/3nrbkJZUAWgoVJEA2FbsNRQ==
X-Google-Smtp-Source: AGHT+IHDsW3Xj/DETZDc6NPh5e45wPtsrGpGMwUb/3q7UOPQpO42p7qg2sNikNlkW+FcjO3beSLwGw==
X-Received: by 2002:a17:902:ea05:b0:215:9eac:1857 with SMTP id d9443c01a7336-2218c3d080amr103699315ad.5.1740128984756;
        Fri, 21 Feb 2025 01:09:44 -0800 (PST)
Received: from openbmc.. (211-23-34-211.hinet-ip.hinet.net. [211.23.34.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5367e8csm133593115ad.67.2025.02.21.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:09:44 -0800 (PST)
From: Eason Yang <j2anfernee@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com,
	andriy.shevchenko@linux.intel.com,
	gstols@baylibre.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	tgamblin@baylibre.com,
	matteomartelli3@gmail.com,
	marcelo.schmitt@analog.com,
	alisadariana@gmail.com,
	joao.goncalves@toradex.com,
	thomas.bonnefille@bootlin.com,
	ramona.nechita@analog.com,
	herve.codina@bootlin.com,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: add NCT7201 ADCs
Date: Fri, 21 Feb 2025 17:09:17 +0800
Message-Id: <20250221090918.1487689-2-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221090918.1487689-1-j2anfernee@gmail.com>
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eason Yang <j2anfernee@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a binding specification for the Nuvoton NCT7201/NCT7202 up to 12-bit
ADCs with I2C interface.

Signed-off-by: Eason Yang <j2anfernee@gmail.com>
---
 .../bindings/iio/adc/nuvoton,nct7201.yaml     | 57 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
new file mode 100644
index 000000000000..830c37fd9f22
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct7201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton nct7201 and similar ADCs
+
+maintainers:
+  - Eason Yang <j2anfernee@gmail.com>
+
+description: |
+  The NCT7201/NCT7202 is a Nuvoton Hardware Monitor IC, contains up to 12 voltage
+  monitoring channels, with SMBus interface, and up to 4 sets SMBus address
+  selection by ADDR connection. It also provides ALERT# signal for event
+  notification and reset input RSTIN# to recover it from a fault condition.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7201
+      - nuvoton,nct7202
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@1d {
+            compatible = "nuvoton,nct7202";
+            reg = <0x1d>;
+            interrupt-parent = <&gpio3>;
+            interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3864d473f52f..fdc4aa5c7eff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2831,6 +2831,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
 F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
-- 
2.34.1

