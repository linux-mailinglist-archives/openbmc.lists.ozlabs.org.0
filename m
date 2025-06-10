Return-Path: <openbmc+bounces-154-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D99AD3997
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 15:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGqgR02lSz3bsZ;
	Tue, 10 Jun 2025 23:40:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749562850;
	cv=none; b=dy91a4BftByHajSCCPJVYGhrleKu+kyBgJmU7owzfce1PHEcIQy0XZRI+Omorxde6WSCXxyHEBb6wwy9XSDUANtReCNh+9/JUz6VfOWlTAoEeWM6Dki1tzOazFojkSeZhF7Nxu73xsCiq/2ZdpO7Oc5WHNPA3JiGGak7wwLXM1KW5sxPuArUFk408PqmnVUR0Qiwtr4CYtYDbisNge5hkpVHO3ZvbwjJIKKv0dmaDpaxB66YZJz4DQ+qfnUWGoa1D9J3p49Q4U5L2a7dfbpkjCIXsfg7xqN+8qb2qbjmrc2H/XDtXCeWXSoNYiSg3jkHVDJLtFLn47VyflOK18Fz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749562850; c=relaxed/relaxed;
	bh=QPtFMMmfWrxR1c6a0Fde6ZxgHFDOZxXmIGmASrvsIe8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZE3+xZTOYFrYxe9oXe2kkW1VDCYFFVcF6X5/gEPoWZbz5cM8eMOWr+iijXuJS99ZgYM7yJ90mjT2QdS4fEwe9YG6Hyjf02WIdm8cVS+eoKS0PniexZZ8Nwi+cQOgMv0t/j68fpYh6nvb83VTK61d+Zr3ZIdIpWugcGa1rnGShoFMbG0Qc05cjgSEX69++w0uz7tauOnr0wdNmEoUrC3Svm70j1WWYx0jfyCEA5fxnlcewQ/D4455irCVPWmiY4XLbo1o7vIpEnsP8AgqVZuGfMHAgb0/Go8DnJ8i6r++UJbjpIOMPC3+vRBsvein6u9XIKj+F6D/Eiaq5JAHb8pl5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wb+ZSvNF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wb+ZSvNF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGqgQ26ZTz3bpL
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:40:50 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-86cf3dd8c97so443009439f.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562848; x=1750167648; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPtFMMmfWrxR1c6a0Fde6ZxgHFDOZxXmIGmASrvsIe8=;
        b=Wb+ZSvNFMKE6a8T1dYuIcKB0lAh6J5PReOrBae2BzApH08sPyzzQfnHnr6iIcrvMuZ
         qo2yJq5mMdU1+lSF54ej7KI5lCI6HHHyYfhsGXoEtLoQS9n+dPknBqs35WlS3m100ac/
         tl3ZOZe+tlTLo6cA+Ml+Crss8TW2vNPEUxGIO3J6y/cRxacHrxrFOsbgH9Vs0RdtI8Vo
         AJtDnZi1ievmKuajJcKPAvTPY5Fhmob5CK19r76pu59DhOqfXK75a9TQzR/Nbd8XkWBH
         doOqaSafbGXoawMzwlzzuGT1WFDZRrLYGoqvI8n1IOnVp1I35O7s9bmD3qElmb65gJDT
         Jc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562848; x=1750167648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPtFMMmfWrxR1c6a0Fde6ZxgHFDOZxXmIGmASrvsIe8=;
        b=jiW0lzpdKD8DEzPzsecLRngRndExeDW0kpKvVoJrR6o9m0IT1c7Hecrpyp535YkXyK
         5Yq2OgRTjspQfVEsADSKmFZmVKEaY+zq/dpTT2VNElg5HyuMSeeuxdy4gV2PyLVIbvy+
         jANG0zZrLSCa5wB+4k5NlFRvrIS9in1/UdFCzzoAAAGnobHCkgjoYw9gQsA/HaoVGz8S
         8PYkOlCi6frhwo4k5cv88n7tB0Rh5KCkefjLc5ZkZgebVJHYrWA9QXRjlv00YDy+QTuC
         rbAnXC2UCS0qhuayQ4BN2iHhPIXFUjCVkJqWD0NVwN0Z27t493hggbqD4XwX/autR1H4
         du+g==
X-Forwarded-Encrypted: i=1; AJvYcCWH/dA0uOVwXb/yk5a/MPgIV1/facu13c3aNGVY0UkwwpVrCi8Wc7GnVmcEU33aMIQeH8xLs7Ls@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywz4eWdqlJ+ju5Q9425REnIwyAv2pB1WU+KM2fz7LdGsMnkUWej
	iNwO931vuQ+o3hnkRk+KqaqBr0eLd9+fkGPQwu4dxagkWm19gjFc1P8IW4a+hA==
X-Gm-Gg: ASbGncsrCoThHT+ttBrO5iCDb3uXp0qg1S4fRftaNJSWRoCVG1YbqPMRNT8bUy3Mz6E
	e18dbDzhMGeISUkh1ASV+dshKuHcP/Q+zsBa6+MZNyihM0Kn2UqWooth/9g+Q9v/yQruA62HXMO
	vNbznGtHX4/MZBoJINQTowXQU9G7JpE/7OYvxMCPHP2O4EppzAYAM1SF49x4pGPxZknUedSFHS3
	HZLVJCPmv4pa6q0dDCBgzpgaNwJdKTIPXeReBptut9gARR2k0E9XRfAINn8zhXb4jGZlbGdBC5v
	tasDrR20rpBTx3Pfyxi+NFVMRiP9ttWGsK6A/Wq27fu0q1Yf0KdzMc4zu1NR5jg4stj7e8nE70f
	mrWkxEgytBg1CDjEtVcFbUeALwuiuW9jbrnB6YoziS6sU
X-Google-Smtp-Source: AGHT+IE5/CJv+5sXhDI1bc67j2KBx9mcXtckTJStx5rJKiQ8vCtDsZEqGw7A9bVcRZGqI6Yns1BkgQ==
X-Received: by 2002:a05:6a21:a45:b0:204:4573:d854 with SMTP id adf61e73a8af0-21ee258c3b0mr24288634637.9.1749562837206;
        Tue, 10 Jun 2025 06:40:37 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7401955b3a.73.2025.06.10.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:40:36 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [dev-6.6 v2 1/5] ARM: dts: aspeed: Harma: Add PDB temperature
Date: Tue, 10 Jun 2025 21:38:26 +0800
Message-Id: <20250610133830.2704829-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
References: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
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

Add PDB temperature sensor.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Link: https://lore.kernel.org/r/20240412091600.2534693-7-peteryin.openbmc@gmail.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
(cherry picked from commit 645f9eb1bdb4c3ad867746c80ff714f57c5e8e09)
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d175e37c45c1..8da6a3e14877 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -223,7 +223,7 @@ temperature-sensor@4b {
 &i2c1 {
 	status = "okay";
 
-	tmp75@4b {
+	temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
@@ -316,7 +316,7 @@ delta_brick@69 {
 		reg = <0x69>;
 	};
 
-	tmp75@49 {
+	temperature-sensor@49 {
 		compatible = "ti,tmp75";
 		reg = <0x49>;
 	};
-- 
2.43.0


