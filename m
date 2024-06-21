Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCD9120B8
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 11:34:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gxu9Widy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5Byg5sVNz3d4F
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 19:34:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gxu9Widy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5By83Wcfz3blb;
	Fri, 21 Jun 2024 19:34:07 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7062bf6d9a1so1418706b3a.1;
        Fri, 21 Jun 2024 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962439; x=1719567239; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EuLE0zsm5KH8c0x8QdqGW/DlRecU3YrYL3GIe8b3zw=;
        b=Gxu9WidyT+Il9zsN+7b7ona4EK5Ht8e3eS71m64cO3o3l6UfeOK7dgqK4nISRVSzel
         P1uV7GKbxdLrnIg3XtoQV4LP1jYNzY6lq7ROD+j0rP2a1Ncm25fsTgdzykvObY7wy5mV
         cAHTAa2y8kX1qe45JBg7xWWrUoTwjjo2vcqz342eNSubFer0pRfoaV5MdyHluse/R3YF
         tdDem/SnvoWplApW6u2H6J3g+GrnWevg+iFUaNl4rLDZ20dlFrc2+JnwkDEykuBYhHdG
         FbIYZHIjUedVg0k0TfVwBssarpO0T8V4sca7F/OA3lk+MsCwojCYS0tPRUOlqW9gCaOX
         ZNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962439; x=1719567239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EuLE0zsm5KH8c0x8QdqGW/DlRecU3YrYL3GIe8b3zw=;
        b=J3qo2Y6zKRlfRA+tlrWxkUQHwzRiibQAc2gAkL4WgFY9VJsaebT0e/O7+2KCImkKCv
         eTK/tT5w5dYXr1S4/rqzFui/n9WILpgSSfZCSrqsgaiDjEK+XnTQoVblsHlZefvzn+Nb
         9xKojVGsdgUuwV8u45ueau9Alb1tGJlfmS2OIA5au+Lx8scEHG2jMYiRImbFLA4WbGmV
         3OTlQQDaAqDNHadkCpjq+H2EhBovLVbwto+D0jMJgJqRixv5Lqk1Lmi0r6U7s6RHijJ2
         k683I0x2asc+Mta72C/2YLFs851ZC/VafsLD63l0MGScHiPJdXRb3V53sfEKK78ruLw8
         1+XA==
X-Forwarded-Encrypted: i=1; AJvYcCX6rstj3Q6x0dHPJNyRTjNG+c8vpYuMJ9OkJjKx1zScMRi+j7RtRyAHB8lIr/gaHsmiYVdsQgS9LU1vZYBA/ETPaX9+cRGCdkE=
X-Gm-Message-State: AOJu0Ywhpd6kerAm85huj15NagsizwLHjBgCjmxV19NRN4VUe52CMkjg
	fXqTz4JGoDWJdQh2IVK7g+3IrWlbKKUWWRKmhjmJ5eBViNZDiCYL
X-Google-Smtp-Source: AGHT+IGqbYxg7cu+HPCe8VWGFd/57+AVyKBihDN8pav/FDazcA3yRQCWyOHk5hXwaIUXi2kEcRMoJA==
X-Received: by 2002:a05:6a20:3aaf:b0:1b4:cd5f:4e0a with SMTP id adf61e73a8af0-1bcbb3e0e03mr7220194637.13.1718962438881;
        Fri, 21 Jun 2024 02:33:58 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc72e9sm9810365ad.296.2024.06.21.02.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:33:58 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v4 0/2] add ast2600 NCSI pin groups
Date: Fri, 21 Jun 2024 17:31:40 +0800
Message-Id: <20240621093142.698529-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

LINK: [v1] https://lore.kernel.org/all/20240613080725.2531580-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20240620012512.3109518-1-potin.lai.pt@gmail.com/
LINK: [v3] https://lore.kernel.org/all/20240620084337.3525690-1-potin.lai.pt@gmail.com/

changes v3 --> v4:
- remove pin list in dt-bindings commit message
- add note in dt-bindings document to descript the reason of adding NCSI
  groups

changes v2 --> v3:
- fix commit message typo
- move dt-bindings patch forward

changes v1 --> v2:
- add NCSI pin group in dt-bindings document

Potin Lai (2):
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
  pinctrl: aspeed-g6: Add NCSI pin group config

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  7 +++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c             | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.31.1

