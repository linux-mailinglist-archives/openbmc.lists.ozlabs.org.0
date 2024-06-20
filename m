Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815590FAF6
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 03:29:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ENERYVVw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4NFl1cgdz3dXB
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 11:29:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ENERYVVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4NC95dLpz3cTj;
	Thu, 20 Jun 2024 11:27:32 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f9cd92b146so654565ad.3;
        Wed, 19 Jun 2024 18:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846844; x=1719451644; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXfqQxN1NZBOse/QmDM+IrCyohO6K/sbaRySddUPK6w=;
        b=ENERYVVw+YUup4Z4eNBaEdPcnKLjdhlETpu0FRX17SNnB8btS1MTVFIeic39FG3tDS
         vuKWrUHpwHxnzfStwTGT/ACf9Df/Eqwr1BEM/bZUeDBZG8ZIhbRf5/p+EevYJUrVepuN
         M7+gerU6u/k6XgBm32n84zGBGODxXS2x6a2gdVAAhjd9Y58KexmE1NhnAo/DrMqUOPb0
         /0RceWYmzPnvD+NO0nF8Hl19wc5L8I/nmwXOYWl7WMw2tS/sjoOHOFJiCqBWHQyN3dWr
         BYYxwude/q3GmowS60bTy2OCHYyB7CqfmE1Jw0+hLWb8aivoXqeVSQBz3XSkAWP6qULN
         fUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846844; x=1719451644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXfqQxN1NZBOse/QmDM+IrCyohO6K/sbaRySddUPK6w=;
        b=oPCW2zkIxzNcp6MRU1AZRg7xCz/q9NnQrmI3DK+HKE46w2x7TyVaTLy8gZvNM+MSUW
         o/OaQvbSKePL3ihAtnkhbYLOipVdoeuxMkPA5khI10nT9ppqu5+rpOahINSRKETUdx9Z
         Vzgb5aEdOo/8bS0f7op6vpz50CMn1SP5LfsFd/IyJ+p9zO8kKJr7xUWgGMVvSJ3qh5FP
         qAguGgNUOmND8UOYbPhtgNjGQqCNH0OZe9TKDdNALgE/u5ewS61OmcFAENW9yQxMbk+R
         LibQ/esyuZ9m52eITVY5EMpzyfhDcQv4040WIHfJsmi3QOOwpQu1yU0WBfT4vBlfTbCW
         YOjg==
X-Forwarded-Encrypted: i=1; AJvYcCVDUI6b2Rqa9QBzd+am2xVvGdf6ZanrLT0cMX5MptIeC14Gbjre6rtX+3+9Q4EXZJMXgYtjjKpy2se6CZl82OHB2qcT1trLlzA=
X-Gm-Message-State: AOJu0YyCU71hFc8t+xy4kCCHqiXHFuS7LwGQAv0R9ze5bSkfdP+Ux+W2
	CpXmXIJM06kW0GfZ1seYjXHPKXP4emfD9YWkxwh1fZmoW/LzVY27
X-Google-Smtp-Source: AGHT+IHtfUD5B+zKdHWT+iwIIrUKH41s2geArXIdro84BxWzTplbCRW+myV6oeXLWPV6UNJ7T1Qfag==
X-Received: by 2002:a17:903:11cc:b0:1f6:ea71:34ee with SMTP id d9443c01a7336-1f9aa3ce954mr49436905ad.16.1718846843524;
        Wed, 19 Jun 2024 18:27:23 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d021b98fsm105855ad.33.2024.06.19.18.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:27:23 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 0/2] add ast2600 NCSI pin group
Date: Thu, 20 Jun 2024 09:25:10 +0800
Message-Id: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
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

changes v1 --> v2:
- add NCSI pin group in dt-bindings document

Potin Lai (2):
  pinctrl: aspeed-g6: Add NCSI pin group config
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  2 ++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c             | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.31.1

