Return-Path: <openbmc+bounces-32-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0962AAE803
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 19:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt2ZF62Phz30Qk;
	Thu,  8 May 2025 03:39:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746639557;
	cv=none; b=PHGXZHcRItj0+liKRfhMcjQMIfsYhS0pDLrDlq4V/VhKZwL126C3boCHwB6uIBPEn7dOvY6n/+ZiQ7ocQBCDXjmzYkxzsMEcAU5TbGaGoZeDj9wkxMENv2Vy9dmMI46w+UOC9RIH/5JGvij8MfmKPQQg/fUaAXXxK6/mqJxi9tSbx38Wlv9YRIFvJsAkfQCy8IZ00s0fQT+75qmxAMd8EzJGYLe+Y/U5tvpfZCOE4ViCXZDfFZP/jOFiQs7+KWccGbg2+3TcP7VUbitucb6FYbj2KhOJnkGZMmDpuhDaM6uMFXIVmNsEvMbL8ukDyqBVtkFjGFxQ+yTOSKTV0Nhkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746639557; c=relaxed/relaxed;
	bh=ofjtqY2/c0divF87ZgcGnYVu2lTXK1fJg8KGoIM1ST0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=KJQ+QKy0ESA21ICJWWYmyF/0/0f3C/dFONvuwWI93rKH0NEJSW8am/3R0xxjWtuOIZiBrwi7aGPi+GFjC1bwCq4zgnV1DFpJPtuFAN538ZxBOvBUQfYmUU3sGuUBGwbU9Aaj0aQ1H9dWJMC8FrduaGszRHeNqIOmu6pPNzhp0F+g/KDJg96qpw+jj1iYVhIjRW/BS5nxcjYv9JuknTzV3IyUtCV+OAugQxrAig9vXBcNovQ/HER70Hx6fmw/odBKxBIXsJaa0Urwx1lt1g0a0CrqTNtVkSQyR5vW0w5mmEapsqXrCkRKFJOo6yJA0Y3mBKWO+hTAPdd+4dPHGs/1oA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLzgws6w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLzgws6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt2ZD24Jxz30QJ
	for <openbmc@lists.ozlabs.org>; Thu,  8 May 2025 03:39:15 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e8e4423ecso884925ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 May 2025 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639550; x=1747244350; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofjtqY2/c0divF87ZgcGnYVu2lTXK1fJg8KGoIM1ST0=;
        b=dLzgws6w5yobFfFYW0meScpInEx3G5jlnltIt8zXB+3q/Tj+5dc7GtX8wm0iyfa5Pi
         kslTYdN30IyKv98bWXaZxq8ZEa4artGItRx3Iy4Ofpa76BzvZh04GO4MH8fvr19Izy3/
         dlxPxhz+1I3KVxVfDEHCqQeGW3yNoR83GaD8i9QAgsdfn9b4WrZF7L08jRUrijjpMEDz
         fkyto3kU4TtfPqHu7Uz1ZOwoIko4H9xB0ktR9x+236mEzeknMhmlFkFvEI54NK1k7/Vx
         yB0nPo6zvaIiZdY7ZMqazY0D28ajfzxa7DR67GdugGgFEYaFwgg19naaf+yGxhDNs+ey
         usuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639550; x=1747244350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofjtqY2/c0divF87ZgcGnYVu2lTXK1fJg8KGoIM1ST0=;
        b=vLcmlwQBtQ+3Qc9WRXSfnynDqdkNdvLt4KWAP/rqAzetqqn94qYZLLWqPcsrt1+0WP
         n2smPFMkkRlqL4ErHAQmaHYmAVF8X6zsUtqfwtR1vU8NChQeEwVIULIusSNUlB5BL4r/
         I7lmvi6hd9p2i5bfikvHRgnpvtEsKhsJPhNQ67syBKpIFw9X4RS/U7+nnCYWb7/TluBN
         gfFxaVtuYDiccb/ehxtaSQ2LCr+C7zUnMm+IHsxaVS3OW1rdFL+i7jIwdEwlWj95tS55
         LD3wspvnux9prnP9K3RKUGwHZux2FKrF05BsYLRneX6ZqmxFDxiFCXfZg12KtGKR62US
         KHMA==
X-Gm-Message-State: AOJu0YxUEygEHaPUKGraGBK4c0zb1KCiT5ZOGc92Bxqit10wi+RHjlYY
	eKQZh9rxnoqW6Eo+u+sQJK5hiPV7t/PFA+DncacEVH+Y9Wgi4UcZiJFIHw==
X-Gm-Gg: ASbGnctXlW7YYiXLMryN3g/sXP5CPi1ZqdfESGuXB7VuXIeiGvXnQd4x1DTQTDJAE7p
	9rORBrkyUPAHZ62lk8dbRjzGXaRtnc51JqceaV+/zxvNqXFXQznrsOwsO5ONNzpAC1EqjVpedvF
	29y5LN5OdqdjP2a+/ZJPiJn1ADNvA9w6Ge4fogdzyTV2bxke+48BVXrgYi4HVruckdY0WaahuYU
	1Eaa9RQGkG7+4S46uxZ9yeCuproYhOFTqa93ONZ9OiDrJNUvgneFG9pVvk7fARBBdRi0up853Ty
	rvDz9qNooJt1oTAFFoh7IMc36FxG6OMaBJi6i8Q0OPZUUJIJEqVG56+1n6wlwwyEoQ==
X-Google-Smtp-Source: AGHT+IFIvJ76PF4S2t2akpRD9MwrRsQ/ZR09rDiCUYzKtCZA0zt3470kDe2nKYbJAZMwdmwe/XV7mA==
X-Received: by 2002:a17:903:8c4:b0:22d:b243:2fee with SMTP id d9443c01a7336-22e85bda177mr3080225ad.13.1746639550156;
        Wed, 07 May 2025 10:39:10 -0700 (PDT)
Received: from localhost.localdomain ([49.207.193.52])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15232797sm97751415ad.240.2025.05.07.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:39:09 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 v2 0/3] Backport MCTP Over USB Binding 
Date: Wed,  7 May 2025 23:08:03 +0530
Message-Id: <20250507173806.5371-1-santosh.puranik.ibm@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changes in v2:

Rebased to dev-6.6.
Handled comments from Jeremy.

Jeremy Kerr (2):
  usb: Add base USB MCTP definitions
  net: mctp: Add MCTP USB transport driver

Santosh Puranik (1):
  net: mctp: usb: Port for kernel 6.6

 MAINTAINERS                  |   1 +
 drivers/net/mctp/Kconfig     |  10 +
 drivers/net/mctp/Makefile    |   1 +
 drivers/net/mctp/mctp-usb.c  | 386 +++++++++++++++++++++++++++++++++++
 include/linux/usb/mctp-usb.h |  30 +++
 include/uapi/linux/usb/ch9.h |   1 +
 6 files changed, 429 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-usb.c
 create mode 100644 include/linux/usb/mctp-usb.h

-- 
2.39.5


