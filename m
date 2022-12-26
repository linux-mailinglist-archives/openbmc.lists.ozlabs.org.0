Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7665E5F7
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 08:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NndDR17SKz2yV5
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 18:20:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EGEYtIuT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EGEYtIuT;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRmJ4jzJz304m
	for <openbmc@lists.ozlabs.org>; Mon, 26 Dec 2022 16:53:35 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id b2so9967085pld.7
        for <openbmc@lists.ozlabs.org>; Sun, 25 Dec 2022 21:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87f0TKfgjxiemevwHpQhVGmMoe8NuCN8KvjmmGoJcKg=;
        b=EGEYtIuTMn8MFU28uvs+0+x5aBW+TWVuZTJhFqlOf5QMLAQuv2KEi9SC8U7WGyOO7a
         BLebVLh7d7fuBw/ZV7jQUxrioLb90S5j/zBbpIL2YQ6eoKPTegrbrg/JthSma3ekt2a/
         nzRJneDVnH0Rt0Sntmu0ugLenOVf+kU8B07GZieH1cn9lpOsqFOcoSA451Y/rCZEM5sW
         WKdQvKdCwjReAbIYK5DiyUHQL95VO69g768e+wMU6TBS63eruh5UObuzDe00tkkGJohv
         LvhPSPXz/wg2pChM3vVOUUQ/XviiPlse8rSQ8+N2yq10YEDP/eRVnc4dIX9o+DE6HXxE
         ihnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87f0TKfgjxiemevwHpQhVGmMoe8NuCN8KvjmmGoJcKg=;
        b=R5lBAjiF37rI6kfmQYYN53SOeK62gdfGDHhPaWHUGncUHZnE/8AMpx1Ue6+Kj4ID+q
         oEi3fDPyn6HI8SjtmQYIUNge1LmiCFvh6aLZ4VHq7Q3Jda4Ca0OV+PUD6Rhls6lb9oBu
         pbChh+fKAulcCwFDkxstEqQVcixAsLXArxkB4tXn+g3FFKwOn3HbVzAA+9NkdN7Zefuo
         T/eTScid2wUM+99VagQXFR0KaGfzJLdFm99nXSPsMubShafRL3ZhgRfIjP77zCdHUblK
         R+dr8nB4/d9Gaw0/2DvCZou7WIsA/icSTmPmlPKhHZWGFJwedGK0N9QfJSLSSo93u6jS
         kH2Q==
X-Gm-Message-State: AFqh2kpZrhjZbUeC4r7hTojTvltZPe1EU6YwuTj0pEyjvp1/123CWyxK
	CQVdBMVPmUZO1EgB2AiLTBoP9rPy7z0=
X-Google-Smtp-Source: AMrXdXvaybKyiEjgf311hdV1duG2+nBypf+BuMKckZva39Fh4VmLrvmTpM72ekGMTKAdGLpRMr4UUQ==
X-Received: by 2002:a17:90a:4dc2:b0:221:6310:a4f3 with SMTP id r2-20020a17090a4dc200b002216310a4f3mr19962824pjl.20.1672034013784;
        Sun, 25 Dec 2022 21:53:33 -0800 (PST)
Received: from localhost.localdomain.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id mm2-20020a17090b358200b0021937b2118bsm8202726pjb.54.2022.12.25.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:53:33 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 1/2] ARM: dts: aspeed: bletchley: rename flash1 label
Date: Mon, 26 Dec 2022 13:51:17 +0800
Message-Id: <20221226055118.2836493-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221226055118.2836493-1-potin.lai.pt@gmail.com>
References: <20221226055118.2836493-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Jan 2023 18:19:27 +1100
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In OpenBMC, phosphor-software-manager use "alt-bmc" for secondary falsh
label.
Rename flash1 label to "alt-bmc" to support dual image feature inOpenBMC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index a619eec70633..791f83aaac50 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -307,7 +307,7 @@ flash@0 {
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
-		label = "flash1";
+		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.31.1

