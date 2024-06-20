Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85990FAE7
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 03:28:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MSgjhN8V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4NCj2XYQz3cjX
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 11:28:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MSgjhN8V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4NC94wGTz3cT1;
	Thu, 20 Jun 2024 11:27:32 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f9aeb96b93so2642515ad.3;
        Wed, 19 Jun 2024 18:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846850; x=1719451650; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAvyobvqI2HxWlvdnAeJsCk7w3GvVzpbdy8jdNQhefo=;
        b=MSgjhN8Vg6gb5AJiDbpWwHyOfYWoOAdX+hB+LvHu90es4EgFMJzbAnWTZHZCtaJafD
         wUHfi0urtHb+FhEn/EKZQN8rDYUU0jUUQOKGKI8VtIZ7CB1Wznq6vPkogaealYu1mMww
         /oX6zKuwWI8jKEXDcB4U26jbBPaxOuhD5xrTykjDUFqzrOcOiDJRwfc8zyvpmnOdoIs7
         zs3ZERurN5g8lSJlELq+rL9rrCh5avfIZw/HWlLFVbAtBnAh2hKPSI1DfzpCU1e7mbLX
         OuCGPmceZPqMBCoWUbqSxH5dZ8qwWEnO5q0ZMF+w7A23cmP3u/+XrbasigLMPIZxv7Ny
         /15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846850; x=1719451650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAvyobvqI2HxWlvdnAeJsCk7w3GvVzpbdy8jdNQhefo=;
        b=EKD1hYQIwapq48sbzi2PuTltY/CdRumakWneGmWvKJlVddDfj9DKE8dc1h1P/5Miei
         E2COrL7P/xg5f4tDYtITyfODyXYinZqMICGIAM9ymhL1EpDrcuCd78FerlQobjQCIkif
         pqlEpEl3mGQDZzXFliGJQLD7U1OsTpH8qD4v65J6PLnQX9Gx5fZaCJG6zRsD/8L5b6Bk
         ahpKua0shvzt+WOlWyL+Vd0uEsyl+hE7PiOvveA7tbDHq8aZzcA7DyCi/5GF4tijcw7o
         KWff3rJD+eT4zRhhKrFsaRLjHtxbQfxL9FeAFg4BkTVCNZBCIZfXYgxUy9hTfoeF4TYR
         tHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvw/xI58aUPp7F7bpBJZwKsemhcIMrTHvQGwTa11TjYb6BK1nX4LSw8YOBj0y+oA97IFh1RFa+LQFvyC0Qlj3Z2hBDNiZZuo=
X-Gm-Message-State: AOJu0YyQQ6NoBTNaJf8Nx4h4Ybg04lFxwwT2I/zBzbpQq6iR92qpQsRo
	JYvBpxYA+0M+5nJDaY6WZleuUHyPy4j4TzXwq64J1wBuSSkXMN0Q
X-Google-Smtp-Source: AGHT+IHTJJRiCMllRxkLRs+jMBPLwCcjfhogsXVOVPuvtCI4VC6AcvlRfF/4zLL0cmyB5XBOJCHl4g==
X-Received: by 2002:a17:902:c40d:b0:1f7:126:5bab with SMTP id d9443c01a7336-1f9aa41228fmr47535535ad.40.1718846850068;
        Wed, 19 Jun 2024 18:27:30 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d021b98fsm105855ad.33.2024.06.19.18.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:27:29 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group
Date: Thu, 20 Jun 2024 09:25:12 +0800
Message-Id: <20240620012512.3109518-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
References: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add NCSI group to distinguish the pin group between RMII and NCSI.

- RMII pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXRCLKO
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

- NCSI pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 00b6974a5ed3d..3f02dc94a7ce2 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -337,6 +337,8 @@ additionalProperties:
         - MDIO2
         - MDIO3
         - MDIO4
+        - NCSI3
+        - NCSI4
         - NCTS1
         - NCTS2
         - NCTS3
-- 
2.31.1

