Return-Path: <openbmc+bounces-11-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDACFA9E3C0
	for <lists+openbmc@lfdr.de>; Sun, 27 Apr 2025 17:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlrBc5bXsz2yqR;
	Mon, 28 Apr 2025 01:30:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745767848;
	cv=none; b=NmO+XGYZVj8Dj/n+VXmThqXm6iUnJO+e9ehFapj8l92Bc1wqirFP7+RU+zlxnUiziDcOdUnjFKDUqYsAzHhcmWpBAcs+ytryxZebEXcfiYonj71oe8qzqfmCpBFjv5yATVDb848o1x3WovXM98XVqZnmPfcJud/tgL/fPlsZvWp2NDQBcy2egTZhpQ2aw90fn5tD91RfyExjHRNG6t5z3DjWDoj3gvEq45hdiwxlX6lc5amuCnYvB0rfG0C2hg6wKXGEnvIF365LHLgRJttcMBT7s6T0R7Uq4Rl8uhHFgiM4KCco4nuG9NtC8Mjh5j+a9WE6Dqum2DdbH9b2TNqDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745767848; c=relaxed/relaxed;
	bh=BDMBdHgSwMiMMPPpWLXDES32ja2hzE2QH6xUQo/dDtQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=i8lwSgi0yfOEDEjloqpl8h5AftH2SPZ81UWDlStSD8VP88Xhma9EUPuWSdaE/l6j++AeS4a3R69PjJb/qjuoVRyrhedx/Nf/Cj/tH2jcXp5awe0BUuLojfQKkMgsOGAi6HXnG+HsNO38Awc+g49o4QM4FLnWEN8p0irTVT5mVfLS/VJnKz7bp9fQ4uMy/7t0HtnS3hel6vzdvhyTUnMvlPFa4scv0jbyeRYo+M2G+z+EAOF/bCzeHJ/E7fjzMEwxlAAQRDK2vI0IH6zhI91iHbDpYB6hKiW+vQtmrYDxTOeoFz7QZwhWfp3Ha3Lg7VEB4EPk88mR58uPSb6hBxuj7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ED5i1KRk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ED5i1KRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlrBZ6lGgz2yHj
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 01:30:46 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so3939027b3a.1
        for <openbmc@lists.ozlabs.org>; Sun, 27 Apr 2025 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745767842; x=1746372642; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDMBdHgSwMiMMPPpWLXDES32ja2hzE2QH6xUQo/dDtQ=;
        b=ED5i1KRkITMeePwNngsVtbZm0rkLstvsMYGVX3ASzB14SbzoAGhJeggoVYMu4CKptr
         +n1MRj/xJBCEb8bAQ6Gz5wRbOacXNOlE35+w2Ui8asIADJXFwKKOmJh5bTFw5dtb7Smq
         /fAKntVdOKQmPx8GIQfDWlFa0HmGu8/a0qmJmGVoAqUQeopvIozeNzF7zFnxACWlImyK
         J5Hmp0NX60xfgsae+xZ63j0Hw1+yyH3a+/RJUsLUOU2fHhcj5QFO1R9CZm8DPvwtHKU5
         f/zyETMM0ewHcW+iZKboaMI7Rwur5/RjpzoSLQMNRfGw9hQtyF+z0HA+KG66mUDNQi38
         C4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767842; x=1746372642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDMBdHgSwMiMMPPpWLXDES32ja2hzE2QH6xUQo/dDtQ=;
        b=XX17jZCaKrstRl+RPt+5yyHbi6z9DYm0IvovIGFrQFGxZClb0Xo0EUpKUYzKq+Yfm2
         uxmO8Nv1G2rKQlstPbuvtQxQ2FQWfP59a95C8Pjn1zMcUhDATejibIXcig84RVczXYqR
         1zFyJyigVd0zhyujMdOrOthW2241hUzaa6GVj1eVVAeTyjB+cGUPN3HES31kFAJXpvK9
         o9lZ1T155yMK6NgxiscnVSlf+vewA/fbFyAx9foupvN01YRJaNjJLYT9rcsjPnkKdkoR
         A396JSbfAj94YP8dchqiNqL94WYh+zL08XM1S444iozlJUBi19vkOyiDufyUn8I984Y5
         5Lcw==
X-Gm-Message-State: AOJu0Yw8NSae5ShvTJV9DrmI8qD4dsjpZSReFj+atoXTtlVGzaelVClW
	7ERNV2UgiEON7ob2ssG7/luVVIFJcC6frBCNHHXsTkAK0vE4s2f0LobCuOko
X-Gm-Gg: ASbGncubttUIQDNU/5/NeYfZhkMXi3/e/uwCKS6a8jv9DITOcey3qgjcb80312cuiT6
	vLaImeqHRJlrlic5ESN8cErb+U1p+EHfr92UABTZ2fbbNay9nh4vXlvekW3B58s0Ammx3LnKwjD
	q6XexjgdXdc+RiDeils4b/cQk5bangXKLLkT40M9MpSGLZ1or0jKCxieifqixaWzlWsiIeeWWlc
	HUyH6nmPJJ/dL0tX3irGIlu0V2GzfMuD5ZtAjZRwBIDxJU3ywgajv8VYDVeYm3mrm8+8Rcmxtj9
	Rrjr9waYeAoYNUtw8lc1srNNnYpGbN8MfhlwSBQwczatsl07vBQR3+Y5aPJDtZLXuTI0twEUu/o
	Byg==
X-Google-Smtp-Source: AGHT+IHW1svODqFuIOXTOuT95B8IlUvNdJ/CnOoZvzaUxBTgjbX45DNApuLdo8hGcJCXOZccukInqA==
X-Received: by 2002:a05:6a00:218c:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-73ff7255d1fmr8057089b3a.2.1745767842230;
        Sun, 27 Apr 2025 08:30:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.167])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73e25912ad3sm6514567b3a.13.2025.04.27.08.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:30:41 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 0/3] Backport MCTP Over USB Binding
Date: Sun, 27 Apr 2025 21:00:05 +0530
Message-Id: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series backports the MCTP over USB binding driver and associated
definitions.

Patches 1 and 2 were cherry-picked from upstream linux master and
patch 3 includes fixes needed to backport the binding to 6.6.

This was tested against NVIDIA BMC (machine gb200nvl-obmc) running
on ASPEED AST2600.

Jeremy Kerr (2):
  usb: Add base USB MCTP definitions
  net: mctp: Add MCTP USB transport driver

Santosh Puranik (1):
  drivers: net: mctp: usb: Port for kernel 6.6

 MAINTAINERS                  |   1 +
 drivers/net/mctp/Kconfig     |  10 +
 drivers/net/mctp/Makefile    |   1 +
 drivers/net/mctp/mctp-usb.c  | 387 +++++++++++++++++++++++++++++++++++
 include/linux/usb/mctp-usb.h |  30 +++
 include/uapi/linux/usb/ch9.h |   1 +
 6 files changed, 430 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-usb.c
 create mode 100644 include/linux/usb/mctp-usb.h

-- 
2.39.5


