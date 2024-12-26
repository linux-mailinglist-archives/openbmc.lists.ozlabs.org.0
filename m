Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E98A01C67
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRCld254Yz3d3M
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735192414;
	cv=none; b=Zbl9Tr9xhIl9VGG3F523ybNyeLjbw1HIDe3S25mGQQxBT7XqqfTX/Q9SPPrp+5YUpmIqiRuv32scheI+7OMCCkawXfOYC5jeXvEEAgiuk7gtKu79Z081fzSZhuQaknChe31J2dOqpBy3gExeAJD/8sgGVKRyHd18SwfDx3SLofR48j5XJ/4tgI7y+QYJI2kieSaHBtkoiR28EdFFQH68IDtVJPdOfMNd5kEVAD0JFm4AKXIOWjiyKxSaI9W4gJX/IZrbW47czXO340fQyepDB8iXEtstRMiNE7tyz7Ao6ns/T2oY7TsRSqSzMp/Ul4t+2qvg0239Jb4fFMR9k8vRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735192414; c=relaxed/relaxed;
	bh=kOo9O7i3pifrDkAxCCGrjFOGpEifuhFneEpCHK2pNtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TFmiybwGEqjfxwHmFO8ltnbt86qzdVGK9wBEAQOYpyAFd2bOogsVNjhrqTCYkyEfx5Kie3g1D4t2aPkx3erbyRSYJb0x30T29VrgWxtF/v9MGrQJn1UECykV4qB3Y7IvgKkG0s8O8c9FXlcPWEgUALb+pOXvtjRFXzRen3C6ZaLxY4wDi685GeiBIGeJqe4dA60wZ07kZbv35Db0V8AZz/1QQD8qG+bDu19dRPFghpX8jxSTLH5dosFX54fJ3orDckVOJ6By4Nk5JSFn/RRABFHT7wIcqMRLfP1I1nt611/Xz408Z7hEj/uxyFVnFsFhUsMP54ev0hQoXyTVdv1eaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FV9RrZwn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FV9RrZwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJd8s5SGwz2yGM
	for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2024 16:53:33 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216401de828so67003655ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 25 Dec 2024 21:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735192412; x=1735797212; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOo9O7i3pifrDkAxCCGrjFOGpEifuhFneEpCHK2pNtI=;
        b=FV9RrZwnQkUHAOdwIqhG4lfz87SAZ/jg44WCpnwYcHPc9VWR8vZiSd2qhkKg8TAuzt
         sRYEcqZW2AxsUi8JxT8mpQSjdtR7OwD/ANsngZp+gDfdvDGpfeJDjgBSlGYBAzc9lW2Q
         Fws0gAn3sB6XfEANki2p6nUuzMr6oeliBA0ebmWy0pmSPGitdTbmUnjh6R98jCzscNaO
         vpC0MkF1YnlL6Gkm7dffvoU7HxiG5OrD4J/qHa3ta8ucVe8eOyyMT1mAIX+loIc4eahK
         yX17b4fKOptmMBGWWSXzYRX8KObjIlcpeE0gV1FAks/G7zjYtkrX9k+ZGlZ1BgaN3GBp
         ZxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735192412; x=1735797212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOo9O7i3pifrDkAxCCGrjFOGpEifuhFneEpCHK2pNtI=;
        b=whsf5TeD7qbSAiVyrbKA3YOB/LkKlEtw67+LR0iDQR5DqcSyzkuH7RqW1wtWQ9Yj9M
         /O6AdY0EkbkAPK1eUnHJcTMiAufyZPGFw2Si39z+rmQNyRw55FLiCL+42+Gmap5MkeXC
         AfGUjaI22WlCeEr2eNRVGR3oTp5mT358GdbaZwoOpAUb8mo3pv6/wcypq+mN9NjckPil
         GfNdN+3x4Rlp4UFt1TnhOZKGGd4AyTI55uF6qLR1IWuMnnSyECRSygh14NdNwO0ZMnvr
         dzsP7wKK31ctcbmzg4Ec3WQBcPLM79JYq+EGSWkZ31uVRxAn1kcRDLl9c6q6poOeP2Gh
         MlpQ==
X-Gm-Message-State: AOJu0YzF5R6kCkqHPXmwOcXQ794HyHzDm1lznr7xvCyGB1MkkkrsDF80
	dQkj1RU18xDzyIgxJQHITXV/uKyPf1uajRB3oTvQ7aFXVmHnRYDz
X-Gm-Gg: ASbGnctvplZAxICI5Z2qdy6DgfLxEuk7UFZkc72L1V1rZNurxz8qYKEO09Zt7HlJd1t
	ud4eK7EKh+EF/013a+BZEAgF9v828rlSpxAK4Ny47jVXewQerPVyiuVngHO9Tii1sIwjgwha4hA
	q0YSf0wrDM6m+Pv+dbo63ss5SeuGxuAnVjY6OyYhyRywHgopZ0KjNlZk937dhGQd2f86F0LErv2
	9uWpTBLdzZBtyZZiKvLvIe1z9yJemwvR5mdTDWLBjj9QTUynYZGTav+mcnqGtSrJoB1aQCt0IAh
	oeZqEzDRcHm1PyaIOUG5PA==
X-Google-Smtp-Source: AGHT+IGm/BBsP03b1aKdoWcgXBsxuBVem3iqHVaWYoRFxJS7sp6Tcctf76oFtBfBvIGSm1EhK+Rotw==
X-Received: by 2002:a17:902:ccc3:b0:208:d856:dbb7 with SMTP id d9443c01a7336-219e6f14586mr317900465ad.39.1735192412078;
        Wed, 25 Dec 2024 21:53:32 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96312asm112679455ad.21.2024.12.25.21.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 21:53:31 -0800 (PST)
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
	herve.codina@bootlin.com,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: Add binding for Nuvoton NCT720x ADCs
Date: Thu, 26 Dec 2024 13:53:12 +0800
Message-Id: <20241226055313.2841977-2-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226055313.2841977-1-j2anfernee@gmail.com>
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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

Adds a binding specification for the Nuvoton NCT7201/NCT7202

Signed-off-by: Eason Yang <j2anfernee@gmail.com>
---
 .../bindings/iio/adc/nuvoton,nct7201.yaml     | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
new file mode 100644
index 000000000000..08b52258e4af
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
@@ -0,0 +1,49 @@
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
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Reset pin for the device.
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
+        adc@1d {
+            compatible = "nuvoton,nct7202";
+            reg = <0x1d>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..9c5328cbef17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2792,6 +2792,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
 F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
-- 
2.34.1

