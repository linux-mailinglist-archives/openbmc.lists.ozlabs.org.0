Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2EB90FF40
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 10:47:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LeVLeBxd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4Yyh6M0pz3cb7
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 18:47:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LeVLeBxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4Yx071x5z30T0;
	Thu, 20 Jun 2024 18:45:55 +1000 (AEST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-250ca14422aso364750fac.0;
        Thu, 20 Jun 2024 01:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718873152; x=1719477952; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=43KWYYRyoYmhNOn4BNyMreQoj2jRjYHSjwBPqztaSRQ=;
        b=LeVLeBxdC+/nPGIe+wvUjQuZV6d4oZ5Yt4k5dKcroHCg3WxzVbSuIRNoKzz8rmlByi
         fb44neAo3SId2nADCx0cs4mRwqYdCXiVD02tZBtt86dID1k6BQDZu8/j7op+/83U/BSG
         947Hrm0mENASqTkUncLpIC/JApdDimeZuNi6X0vzLnpAC6TOrZjMoFnNYDxNTAT1YcBF
         NiLH+YQyIHQ47Y26/VdDdq5CPvW0cnp1jhObyiHPVuR8Ipk0a41rjCJR6BtQ6VQjaGUw
         2aIF3XxjlRc0NGAbFOnnTq8tmw+HOOGsuN9Cbsg1kiD7G2ME5OnuwKWte61Sup4xzahq
         nDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873152; x=1719477952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43KWYYRyoYmhNOn4BNyMreQoj2jRjYHSjwBPqztaSRQ=;
        b=KUme7aorQ9HSaQM0njJm0BFUesqYAmytplDKWheJrcTAEQCXXObbgU4p5kdG3LTVvI
         GRC2PL8ouGd7Lx09dImk6qIq/SNLkjg5VWBV6WmZDF2IFpgpxlIC9+EeT1MUvFtUT4aQ
         PluOP7Y9Q4L+zQQ16kGsMebqRPhJ98GJjXPgi3qKclU3GSsofLcwAfyEq0FqVwYAEToD
         GKOmoIH7zf9/X6FO+TrC4Dvry/3j6tpDkSaxIZT0+JmzlE1lGP1Ljrb6SW5AuAxXcpXo
         uwrjXTt/9zw2uz40ONte2f1vCZok+vT6EIxszl+Q+8oskv8AFyw9CG7BhRvYxAh/yY9q
         tP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBxYKvD1zFyiMBllY23HSvD9c2rMjIwx80QcB1z7BIdQ70zC79mGxHUVktBxGlWZSTWQGlLlhz0MsXXgo4nrAY6unTfv0rVNU=
X-Gm-Message-State: AOJu0YwjkueNQBAc6NViMnEULRIlAMYtn0TZo84Ndic7/UfTHeRAgI7Z
	0GngnCkLUHUBfwdws920XgTZ+7IES6Oqc49BZbmSS9YIe+yw3eVQ
X-Google-Smtp-Source: AGHT+IHUTewqsAsKC5xSUqbLqUEneEIJJdmKam3OZ0MLUfraam+NlYP/6BgrAchuTs1OQ6A+N03g8Q==
X-Received: by 2002:a05:6870:b50f:b0:255:1819:b458 with SMTP id 586e51a60fabf-25c948f70cfmr4718438fac.8.1718873151683;
        Thu, 20 Jun 2024 01:45:51 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9besm11895592b3a.165.2024.06.20.01.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:45:51 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 0/2] add ast2600 NCSI pin group
Date: Thu, 20 Jun 2024 16:43:35 +0800
Message-Id: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

LINK: [v1] https://lore.kernel.org/all/20240613080725.2531580-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20240620012512.3109518-1-potin.lai.pt@gmail.com/

changes v2 --> v3:
- fix commit message typo
- move dt-bindings patch forward

changes v1 --> v2:
- add NCSI pin group in dt-bindings document

Potin Lai (2):
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group
  pinctrl: aspeed-g6: Add NCSI pin group config

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  2 ++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c             | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.31.1

