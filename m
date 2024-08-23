Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9795C54A
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 08:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqqcp1yKkz30Tm
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 16:18:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724393879;
	cv=none; b=LmZ1H235mHIzBb/APogykM99aZPoQza80cVc/5neoNHGKg/5WhTrAaAZtMKwQJw5dwIy+Md0Hc9FIZ8eccoQ74yKrpHKM2rR+rnQwH4LXPXDvxeIP867Qa9e/oKMX5BfrpIg/vl1GHEiaid0dBiL1LDUcpt42x/KrwlUxuoNxGagt2eahuJBkZm8tNOL2Y0jnRYMIhqBExSq3ArRCQ9ndLMQEuowEo9MYQ4Av9/OnlER46Q2Fs+Guv4r0PHnkHtydNgQqfbwDSRYsMz79gymE0o5ySRm/vwHPdnWi1YaxYoBkSOSIii8P9G925KZm6Q8NCU47oyIBHy18jwCxvWizw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724393879; c=relaxed/relaxed;
	bh=FzXi7KJvkozlQsOgy3LQjxMEO/KCFfyhO5VA5K1X/3s=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=lntmeLvEE0tBw5T1LfoZ7uEx5KJCocQMFQKkC4ufKFEAc9yLIliDlVtge4YC+rC0rKGBXad+vOMViZWJUJMBhRiHTsaP7UydBbA0429GJuaOEh0/fSl+U6ZdldfJuo8hHejzFb7w+bFN3J4H1NYYvSYxQPj7zr7CBvWoBUhji6BTx4KzEJq8IENIJE+pOp89XtvewxuQZV88JUXcYmeozZMmLy+n5FXSz0Sh2QOfvIpM6MCqKIiBN+T6Ut8XorIvjPy63TK46LDlPEMKtlebIIo/vkqxSbI/eeq7Maf1dy6wHoDepMQFl5hWu7ba3ut7A1kFGX7RxVK5pxD8S/BfFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VyuVPVQf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VyuVPVQf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqqck2ln4z2yXd
	for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2024 16:17:57 +1000 (AEST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5d608060241so1224680eaf.1
        for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 23:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724393874; x=1724998674; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzXi7KJvkozlQsOgy3LQjxMEO/KCFfyhO5VA5K1X/3s=;
        b=VyuVPVQf4yAnrrP0vebu2iq5N6HkFREUpaVhAoc2kT+8xFASmG3UeM/lYJymTBnkUr
         xm7sZE8eskoG9ciemezRStHtGUrLQcH3hcYNqGuDkRaFQZQ+VyLRr+RWHFNMMvMeVFSO
         GnegfD2RsHyMs6h9RE2CGyDV1wiCSH7uvdqzBttUocNbT0vOiUwDPEYPI4IO8R18nlWN
         hIFeyoc4yawdi6hjn9IOhyUowdGCDb5Pdax/67L4qIkzJ0GWRKSEQRWswkE3ycC3G9f8
         7bKFcae5ZI2gOu9WUULmisKjOdhW8/Yu4DoEGuc/Au6MBxtLEgvZYLcWY4DR4etXZOhY
         DejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724393874; x=1724998674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzXi7KJvkozlQsOgy3LQjxMEO/KCFfyhO5VA5K1X/3s=;
        b=ZQQe78wesFr1EUYCM+WbfqjKAYp7NH2jDFfZKoF9+Ep3X5S5FSoyNXvMkxasFmBcCY
         eXrNAWGBF50BlCZ5nR3kcFd5OvDqxTVc2li6VpVFvks3w5GvWGAdfAbOHQAbLmvpFwXa
         ZrP42RX0QcnZN+D+wQXx1tD/6VdwpOmUUrPycIVPE5v6OTGTKG5HG1h0wlEDnFS5PizX
         04g19luhrCy56zPX+SM9A0xog115a+uBuTkZbNoa3ebpWM/m5ogodLOX91hsGJ2U4AaQ
         kn5vCwdV0snDY2YzvmgGUnW6tNwHYUcuQVdPSW49YQV5IYGKSbO/SVgHtIwHFwRIokdL
         1Y3A==
X-Forwarded-Encrypted: i=1; AJvYcCVAR3ByM0dhOMteOzzDVzLFvZdwtjWpvWXt+9+hOwMW35aKvxUwP6K3McR5GaQyFvfU1DYHjwLg@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyba05m1o9bBBd97BMTpbsDHdOiWjT2N/oFc6HB4FnOk7BkyCtD
	sPyRgsVgt0tyVsAu5R0Kz6H/cBjRprPypSI2fInBCdgXTqmXnSsW
X-Google-Smtp-Source: AGHT+IGe9AJ10XUEUYaYIQziDIHCkyTkMXyRF0EFqEkJmHi+eY7SP0R61PSq8jrOuS5pP+q86Y4JVQ==
X-Received: by 2002:a05:6358:5908:b0:1ac:9bc7:2da5 with SMTP id e5c5f4694b2df-1b5c22e9a1fmr154061955d.27.1724393873708;
        Thu, 22 Aug 2024 23:17:53 -0700 (PDT)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434255798sm2319551b3a.82.2024.08.22.23.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 23:17:53 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6] dt-bindings: vendor-prefixes: add asteralabs
Date: Fri, 23 Aug 2024 14:15:31 +0800
Message-Id: <20240823061533.3463647-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: chou.cosmo@gmail.com, Conor Dooley <conor.dooley@microchip.com>, cosmo.chou@quantatw.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add vendor prefix for Astera Labs, Inc.
https://www.asteralabs.com

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20240115100518.2887549-2-chou.cosmo@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 25158559471c..c734ea4de428 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -161,6 +161,8 @@ patternProperties:
     description: ASPEED Technology Inc.
   "^asrock,.*":
     description: ASRock Inc.
+  "^asteralabs,.*":
+    description: Astera Labs, Inc.
   "^asus,.*":
     description: AsusTek Computer Inc.
   "^atheros,.*":
-- 
2.34.1

