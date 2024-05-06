Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E536B8BCFB6
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 16:09:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bgCngaYS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY3Dw10XQz3bl6
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2024 00:09:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bgCngaYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY3CS1MBGz30Vb
	for <openbmc@lists.ozlabs.org>; Tue,  7 May 2024 00:08:03 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f43ee95078so1679976b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 06 May 2024 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715004479; x=1715609279; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x3n7FXZW0GQ0H9fxPpHF3OIn9nqsdQWn9rhFNz67so=;
        b=bgCngaYSnIKdnBG1X5omQlnf3smrjpvdKFr+Dd7j3qIFnEub1GsYiJvnrUAThbryO5
         esg3GFoL6D9UOQoCNoQ0Ss37VR9ptH3HYfU/qB9Cd7H7je4+b1YPbGmmkOfwmhKG/BVV
         IAD6lpjvZSw3pXeZr4N3xhLBKIAfHuqpJOv5BEuKsBV7GFdzr8+9cF3rN23GB2+9h2uy
         /oyyc9twVw1Frzf6m8nDF2egG7laI1qdcxrhhuwSELZL8Ft7CNT749s4XgGxZwckqqJh
         5q7FNXriIw5X9WVJdLrMUzy3hWdmbVGmn+LvJ82WrJCLQiZVeVgsC70XeoRTNHI55rqg
         3vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715004479; x=1715609279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1x3n7FXZW0GQ0H9fxPpHF3OIn9nqsdQWn9rhFNz67so=;
        b=F0N/hm2JKIwpphQanSbCgWMBUzNtZyV2qTWlZFJpRxMNgU/yBjTUW+0CB8lZkdJYzQ
         DYFH6L3ngDNJmqU1QyeWkqfs+J/qpFdx5xkaJPCl9qwUJ6aO2Ty89kBumU2k9d+T2zDC
         8fOdaiPZ8zz9ct5KIyfLhc9LlIqjT9HrMd764V7uvMag3pKsCpEGyOmgJmO9xvw37t9H
         POVG9OCokkfXjbdkbLx2wYx8jV2WrLAMULcV4u4V5/EmhZD3lsLuOWkevGjAjv17uzkS
         1xjDAvGyldBBDfnYAon182WK0bxh9ip+mWxozVUaiAUDC707mxUkxIvSGiaX6DP7p+Ly
         zYNA==
X-Gm-Message-State: AOJu0Yzd12skBTQUuMO/mVC7iaLMRgTD7tJPz492S4yEZzsbeEPvgDdi
	FdOmcW2w7TVWesnWNmIHjrtQsLrUit78DI/9a6yFELWYQWUuJv0foN9vTQ==
X-Google-Smtp-Source: AGHT+IGkFLzDt9rYxyYAtcUWOBPHI4xb53TI1XDaQtYYdakZQuW92TOOQ5FpUnAtjAkxgmkdaHnozA==
X-Received: by 2002:a05:6a00:1305:b0:6ed:416d:e9a with SMTP id j5-20020a056a00130500b006ed416d0e9amr11947022pfu.7.1715004478679;
        Mon, 06 May 2024 07:07:58 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a5-20020a63d405000000b0060c5179a0a5sm8052965pgh.50.2024.05.06.07.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 07:07:58 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux,dev-6.6 2/2] dt-bindings: hwmon: Add infineon xdp710 driver bindings
Date: Mon,  6 May 2024 22:06:46 +0800
Message-Id: <20240506140646.2506138-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240506140646.2506138-1-peteryin.openbmc@gmail.com>
References: <20240506140646.2506138-1-peteryin.openbmc@gmail.com>
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
Cc: peteryin.openbmc@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

LORE Link: https://lore.kernel.org/all/e16ae555-3c10-48eb-94e1-e4ee77c2f521@roeck-us.net/
Add a device tree bindings for xdp710 device

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index e07be7bf8395..f982de168c4c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -134,6 +134,8 @@ properties:
           - infineon,irps5401
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Hot-swap controller xdp710
+          - infineon,xdp710
             # Infineon Multi-phase Digital VR Controller xdpe11280
           - infineon,xdpe11280
             # Infineon Multi-phase Digital VR Controller xdpe12254
-- 
2.25.1

