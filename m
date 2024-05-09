Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4848C0C0C
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2024 09:39:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WYMp5jY+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZkS842ddz3cVM
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2024 17:39:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WYMp5jY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZkQc0k1cz30Sw
	for <openbmc@lists.ozlabs.org>; Thu,  9 May 2024 17:38:30 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2b36232fa48so487923a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 09 May 2024 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715240306; x=1715845106; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zIvZfE0IojsIX4DiFOZkDIGswk5o/ORHJCDO5xebDQ=;
        b=WYMp5jY+pHK9u1MpmBd4GwNGI5pIb2UJ7f2/85ZVOOJmFfxvu+N8UGELKfL5v4vkbz
         28zasd75c63xlGCwEpchV4FQltpCNKhWq1+RK26pKpnKvg1v91fnp21JhE3byfK/BKS2
         jkj9fzHMl/9joqYfGlGwMuw4/1RSmtRNH8djyOfvJO8FYOzxD8Qw+swMbzoE4pUBYqzm
         y3N3XWRog9nbpNcaTuYDMW0LUkfp3fGE9E2NI0dfX/clnNkgFSbbPjY+ulfUlrJc5kVp
         WS6wKuKuEqSJHkd5T6a+yN0lyHcCWmvuDbuQHyc5zPaBEa8+KMcN5+f3gj7FKk/j/C0Y
         VvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715240306; x=1715845106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zIvZfE0IojsIX4DiFOZkDIGswk5o/ORHJCDO5xebDQ=;
        b=HF+ZFYd7BoW4Hd29m2pIRaR+vfICSGjVnHHo9bmQ05DKsF0IUQqtybjQ4NwFbLyPIZ
         CfQBBdL/Y0brJ7jnfUpwNMKrjwH7k0GI6eMO8d6u7CO+5VfUo8ESE5uc8M/nYfy5F9Ra
         d1XnpUUAJ+raXE1kUwFSymJz8B967EsEg0ciH1AOwqZqulGT8p7jN0TqZ91bn/XPZmL1
         r6DH2ddc8aHgIxtEQIwuvYDA3ndlqRAWatHE9henQUUvitj7f9fNbkdyZ8ixmpO61VrO
         TdREpxRGH+mQmDMFJMs27KY2/dHVVS2O+TXJzxVhpv1LGXVtegMJfpLeRVwPc2Vnf0U+
         NVew==
X-Gm-Message-State: AOJu0YxqBeW/Iio9B2NX+Lh60PvbykdfO/FaM0j+JqEfPFCL2uR//hqP
	IYN6WUt5bDL4q2Pc74Q5hbnve7fxifLEIaS7Ma0eGHOrLxVx4VTrwEsP3w==
X-Google-Smtp-Source: AGHT+IEWEPStUFcFWwVoRpVv3Uyo0bkKQkprJp6tRzRVWK20o08fxAiQ+OmmALbGdH/roxSeEKAALQ==
X-Received: by 2002:a17:90a:108f:b0:2b2:b1a7:9530 with SMTP id 98e67ed59e1d1-2b616be9a86mr4412134a91.41.1715240306288;
        Thu, 09 May 2024 00:38:26 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628861e3bsm2647121a91.23.2024.05.09.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 00:38:25 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 1/2] dt-bindings: Add MP2856/MP2857 voltage regulator device
Date: Thu,  9 May 2024 15:36:21 +0800
Message-Id: <20240509073622.4006734-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Link:https://lore.kernel.org/all/f204b419-3e05-4848-882e-70a17671435e@roeck-us.net/
Monolithic Power Systems, Inc. (MPS) MP2856/MP2857
dual-loop, digital, multi-phase controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index eac5ab4b02cf..336498301c52 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -119,6 +119,10 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2856
+          - mps,mp2856
+            # Monolithic Power Systems Inc. multi-phase controller mp2857
+          - mps,mp2857
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2971
-- 
2.25.1

