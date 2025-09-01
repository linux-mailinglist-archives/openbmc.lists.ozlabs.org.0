Return-Path: <openbmc+bounces-553-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5510B3E4BE
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 15:24:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqNP6nbYz2ywv;
	Mon,  1 Sep 2025 23:24:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733077;
	cv=none; b=DonCAfkTTzh6yGeA8AUbYdKTIxLmMyLXOvFGxFtEG1q+/74OTbeb4kaYshF204FlVx/Mqt1VGdSQPulwfJfnLAQuic+t8yLxBwWAhqvPtCM+mfecfxDLbqupp4jgwzR98cOthYFinndVYE8llovP8GR6GHqXmUhmlxfhJgjVMSoL+tmPOxgPi4h+xYcAhgagNSINUwxBC0kBDPaZfNjWk384WRNZf51Y4y2ZzngWntxL4Osi7SeAF8qo49uPVRkQJ8Ze6jb+R5/4tgSN8ghHxzbmtFwjRZ/s+anRLLS/Nop8ET4XJPejEbaQ3ceYKIflgFeaaW8QaJ6cdMr/Ys5XKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733077; c=relaxed/relaxed;
	bh=3MIDNnIwbSHuzGfQVuyM2agKWSWdZtsoAJRl1Qc3beg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QmSNM2OJaYTJ2IC58pNPj8OtXUD9yqsBTlwC3AXjh0hAIbXzCoOyJZZao+/5Ie6S7xRE8aP5c4OR3heRu4nIru9pmcbRfm8kl7tN5uCVdkb/5r06JZuqF63IYlLIndXoRiOIII7NXkDPTBBRG0d+fN8451AUBo/Flr7AlCj+zAUWnsm5qbAyizXk7dFgNxSCLYV6dE6rMbOCjweFH1pU+f9AuP1+aR3L4cvA5I1sF13SUd+P8oQj/HsdnN/PChCWHHpK387zGlCTXzeB6J2m+G6OrRlH4hyzgGEjunVE1ti1lxHlr9tEkxFKsqYxyLQ89FePiwUp1+C7rErH+3uxUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TxUwdcAF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TxUwdcAF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqNN1KcDz2yqP
	for <openbmc@lists.ozlabs.org>; Mon,  1 Sep 2025 23:24:34 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso26269925e9.3
        for <openbmc@lists.ozlabs.org>; Mon, 01 Sep 2025 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756733070; x=1757337870; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MIDNnIwbSHuzGfQVuyM2agKWSWdZtsoAJRl1Qc3beg=;
        b=TxUwdcAFpJwpjTrPEQnxKvDD6Rnj+Jz15oUiMwLUY9pOU45TmyN33ULW96RwE2ZcAc
         RIq6bD6Xf4G/9hEq1Y7R3BrwaThFdNv387AdFbJH5Rrpwbfx58DnBeckTYMNOZWGMX1X
         Ly7eObiUrujFFfydIrMHMO1Os+J9Ecx8PzcByGl5IyHZwU6DS8NuC1pBdDN2Mbnv9RiZ
         FdEDuowXZ83i/wQBJBx4DxrjlX+mdgW2qP2ZcKAJ+Dc/DW5JXpAjxl3Hx+Yemxx6Hzrj
         QcARb39cjCbi9HZijFcaiQF2cGHtjq9gw7av6O7jINS9kUDIvrDg0ALYpjd1PjvoUTFL
         c4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733070; x=1757337870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MIDNnIwbSHuzGfQVuyM2agKWSWdZtsoAJRl1Qc3beg=;
        b=F7/RxYxCezb+AYVHwLtIy9PVhL0uUEOC+X7+PeFDTDxwFE6t55YMY1IRj40EiVqcBU
         qH+29WKoDtxdP1GlC34HCn7CiB4cn31WnrMXiI1wpxw+EONBSNcGIe5SU5uwuJyGVq9+
         GnFaET7KmeptvMWEberH8YDysnyyNdEBvDillot0uEko8ta6Bn3OkCZNabVXfaEEDy2s
         AU3L+FQiH4QOyq1rcbx0Do2E8ypKHVi7io11SGj9QIrxS6hO/UQLOTBGeIM2eJTZcLyZ
         Eoh5PrDKedcOtFVQDfKbZhggPCL/Fj5d/+we3HERhvLKjOpiG3cCdf/qQlEaizcUkRvO
         +MXg==
X-Gm-Message-State: AOJu0Yzf3g/wypFuD/GF8ucjXV/SeyDoJIbVRqrhsW8EKtVks9XPxa1U
	FdkryXueo0UZNHNnJySljhxOryo1uSYYp2aRV0GEnhIZgO5Jsc0PX7kH
X-Gm-Gg: ASbGncsu3oImernb0ZTvuBjk/FE9j57Cb0oyEksvV7jQM8PZyfzTP6g49KJI54wQoGH
	wqpRTKiS/rVrEIMWNIWC5VImLdF4zggowVEkPeKVqsNOSVWCGbTP3TWXv5I9TbT0SSlgWNDtNZd
	uL24PivNeY8WCBAa2sXBkfVrarT9pqgL2irJbyx09j3KKsvbIk3AvE0nmOaUsi0mbs+/V9lO8Vx
	+U8poKCPo2mQvKw3t4kU3xtlErlwWJRs1HeXxVzi8g9LThzzXFhxl06JwM3k5CXN61TqBh78QIp
	+CiPSn+H7DYxXGQ/tkQsjisdw4gZZi2ejxRt4wXcnq/DzW+g7Ez+ThrOdx+bZfhJ7EJrDl8kJ29
	H5mZIyhBUVmtFMLGA8vrOOlgmUFCr3JwfpMKzSuhnK2BU
X-Google-Smtp-Source: AGHT+IGEbizOeslpGdzsgB8Vl8U5tpt8scwfYKa2tgc8UWG4ljvw3Aex7d2kx3CT8e1CwTEmLfUkrQ==
X-Received: by 2002:a05:600c:1553:b0:45b:7608:3ca1 with SMTP id 5b1f17b1804b1-45b8c90299fmr30802995e9.23.1756733069861;
        Mon, 01 Sep 2025 06:24:29 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8f2d3c88sm24359635e9.19.2025.09.01.06.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:24:29 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH RESEND v2 0/2] NPCM845 reset and clock device tree updates
Date: Mon,  1 Sep 2025 16:24:24 +0300
Message-Id: <20250901132426.3081648-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series updates the NPCM845 device tree for the integrated reset and
clock controller using the auxiliary device framework.
Patch 1 combines the reset and clock nodes into nuvoton,npcm845-reset.
Patch 2 adds a 25 MHz refclk and updates peripherals to use it.

Tested on NPCM845 evaluation board.

Changes since version 1:
	- Tested in version 6.17.rc1.

Tomer Maimon (2):
  arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
  arm64: dts: nuvoton: add refclk and update peripheral clocks for
    NPCM845

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 20 ++++++++-----------
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |  6 ++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.34.1


