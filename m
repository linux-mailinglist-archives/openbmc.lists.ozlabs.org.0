Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890D9E2F38
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 23:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2wkB3nX2z3fRx
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 09:46:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733217379;
	cv=none; b=PfiLntF1DqGU3s1mwQSvZNX2UzufO8IAX/gcGiu0y0E9aCQkrOdGHXzF+WFSfWEwZS953/DP5PxQs8ta4CZ3PpnuTadKzo/TNImPyYwrdCeydLOMgPs4+iBsTTHvdJAVPV9y8Esw4bRx6PIL9Xmqbz1t7c2k+L3379IJ6H2NJJuaQC8sLt+TFziqNKzkiP5tkDWKy50DpH96920bwaVnX6Gq4zkyaYELRPA9sddbgpFTdVEoe70BjZ6GrSsNBlNHIIGsWnohOcmKnD5Eh4KQ7/ibZx7gZRlF6XJzL9wIz6axQdihBR3iaiVS4wfQpCvfbWvrXTv7Ebe9CLN+CNJ0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733217379; c=relaxed/relaxed;
	bh=276MN0lUCnDhh8yYwi1XglLnelGlPnySlz4rfjZRHPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LrN3PvyPHVp+Fgg0AFVejo+pijsg6OVfr2+buR1fWcR6zFCz3QHpmq+YkWEjmuCAxInGU22DTh8WEN2U/HwWq3CUC2B+9ylCkmO6EoasZTmNpZ9F0+YXRmnP+qTaQEJDepgLPcpVN/5LQlu0VVROiwykeJ6ZZ4wHu+EOvo4Z1WGv9xEiqkKVuz93OX//G/db66HcwegtUosJwyz/l+Tk55uSZ+i2hVQHatJPBXqjRl12WIH+Yyq1zSBxzYCu+6uInt7dKNwK91yK1iX13gX12pKw1GKIhK4Mme7uN0S9IEt20+whFavzni36PTrhrVNlyJ1L+P1nOeg5rNS9ZiAqiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dQi/yv+Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dQi/yv+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2ZlQ2C1bz2yRP
	for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2024 20:16:18 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7fc93152edcso3849624a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 01:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733217376; x=1733822176; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=276MN0lUCnDhh8yYwi1XglLnelGlPnySlz4rfjZRHPo=;
        b=dQi/yv+Z4fIdiCnqG8CFa6ID7+lroGNSmrlIYRdeLgg5JWSfAiqUQEJ2O7clHebKGf
         HzmXbHkAYsBPc1P51zNFC83xbBVQTvWnZjEbK+P/5KfDQNCQqzHNgoqPcRa4fJGFhgoT
         E9qP7vU8VY6YFSyL6r/VQ6sSCb6azhAxNVuIUn3qmox59RE/1QvtidEy6dSXBK8zaEN3
         u7Ftgh4DNo2wgK9dUZ/vc0weMVmtfYZcwhcSXNsNyvBiLzUlHjYqTELFLtssfe2P2Pum
         Al3Un6i0j5XXA4McZiRO2n4n20xDQX1YHSpLSZg7+cKoAlk2L0GAcDMC43J9DlkprP/M
         EEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217376; x=1733822176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=276MN0lUCnDhh8yYwi1XglLnelGlPnySlz4rfjZRHPo=;
        b=QF/JyNG1IYYkfPllnLXyhmHt9FE3wxSgnsyM9th5C9JMZtmW1xWKCnZRZQMfN2sUhO
         uLRwlXOmGZHNjNFz7AFoetmCb58qoRSpZ/0BX5jggwgxVKMZXgZJ80oY6NXYj1ip6xoS
         luCgNEDqhDN0zf/AHBsjFCdBK7iLrn6qQ7qSb00E9a4b+6LpLl+DvOiE6S5KwWFR3BQ/
         q2QiaKKJGGCPrqjHVzUYTn1DrSH7ODV2KVaJAMdrS8UgYNj8SkT4soUCV08n3XGpcypu
         iJT95mfodw2DuKZxFrvLeoMhmHQxoFAHqZZfXkuqCH2nbrZxvRXfinlyclPNOdFUZZHx
         +HLA==
X-Gm-Message-State: AOJu0YyADXpnaBB6B10EOhrcvKszzxRQtpL69vZdaHXGPYjo3KM7L0NA
	V/ruG72pwm9MPcES18myjqG91Xayf7S+OGNG8ghHwH0QPWlrQr5G
X-Gm-Gg: ASbGnctR0EHoMxyLf13UjlXKT561M/ScUrqo4PdPP4YgrDG/+Xl5WJ0Y1GU746UIlOg
	Uj49h2xG6J0dITSC+z53ygedEmMWoWG5r3wuX9vjSIKVozJ1pKHfS7QeMwOD+Zdwhk+QQ/j2hv9
	k5ZGieFlmwc4iD9jZJugWfa4DGJgw0XGAQqJaACQ3YivPY3uaRClrhv09ROvLRR+C7uaJUHaU22
	uSNEkcUkDRYbFvcL150GhslJTrZtb4z7rITOoZoDwNIAyT7JLWkktTcfZLx/X66np57OBBTr0Mt
	6Vg8PI6Ee8jdUGs=
X-Google-Smtp-Source: AGHT+IEKIs/vZK2aRlRCleFIL9Zz7f7v59c9D6ZAF+KURJahAYSu7HJK/4STcPoClSH6IsGkOSZOYQ==
X-Received: by 2002:a17:90b:1c89:b0:2ee:1ae:a247 with SMTP id 98e67ed59e1d1-2ee25ade311mr31604823a91.8.1733217375685;
        Tue, 03 Dec 2024 01:16:15 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee566a9a34sm7713069a91.51.2024.12.03.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:16:15 -0800 (PST)
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
	marcelo.schmitt@analog.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	tgamblin@baylibre.com,
	matteomartelli3@gmail.com,
	alisadariana@gmail.com,
	gstols@baylibre.com,
	thomas.bonnefille@bootlin.com,
	ramona.nechita@analog.com,
	mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add binding for Nuvoton NCT720x ADCs
Date: Tue,  3 Dec 2024 17:15:39 +0800
Message-Id: <20241203091540.3695650-2-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203091540.3695650-1-j2anfernee@gmail.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 04 Dec 2024 09:46:15 +1100
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

This adds a binding specification for the Nuvoton NCT7201/NCT7202

Signed-off-by: Eason Yang <j2anfernee@gmail.com>
---
 .../bindings/iio/adc/nuvoton,nct720x.yaml     | 40 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
new file mode 100644
index 000000000000..2ed1e15b953b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton nct7202 and similar ADCs
+
+maintainers:
+  - Eason Yang <j2anfernee@gmail.com>
+
+description: |
+   Family of ADCs with i2c interface.
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
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nct7202@1d {
+            compatible = "nuvoton,nct7202";
+            reg = <0x1d>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..bea10a846475 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2792,6 +2792,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
 F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
-- 
2.34.1

