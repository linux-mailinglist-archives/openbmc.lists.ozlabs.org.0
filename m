Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61303297DDF
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 19:56:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJTLC2dK8zDqtG
	for <lists+openbmc@lfdr.de>; Sun, 25 Oct 2020 04:56:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H4aBOuoO; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJTKN2MS2zDqrV
 for <openbmc@lists.ozlabs.org>; Sun, 25 Oct 2020 04:55:34 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id h20so5128218lji.9
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZlE8y81IS7pCFhqYuFCDF3LrzBymS6x7k4Q6CBmO9rI=;
 b=H4aBOuoOlzY6zwbJxuWN1v+rCu2DZXrcJpt50Vu6xAPH1B5xvxA5WEmsiN2mZN/hsF
 K8k+Dus1IYaaq6X17+f6WLGqt7BNn2MrqWUfIxesUF/EQu4SoA48l8qOTUKfN/KyLE8Z
 jl0Lzh6AGi6fkgF1Z6GtfN2bmH/iHLN9pO9RuXPcoz1skEkWilSUqFgE++VYxf3M58pp
 LnRhLd3cBEhjJPKKg3udFvdnANWx15cukjgfUMT/u899yz9rjQEWn+4z+wdE1iARPejg
 lcjw9oLJ0IOPs2VUmvMZBCgjqozDaPZILvho0UqweGoCSwz13rVYLHG5AsMhO4cRXgrB
 50vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZlE8y81IS7pCFhqYuFCDF3LrzBymS6x7k4Q6CBmO9rI=;
 b=TuGbQiqtJi+op+fMYdl3Dr2aElr2gTGToShQasL1/6RcYJRI3aFrNQF7PGd+G4cfpQ
 nnBT/3fN81+S2M+qyrkLylYW7s/tsXlwN+UJGFZ3QPnuoODHWYSYdmklxOoNMU4cSqeK
 XjezobWkofvVx/xMJlyU2t958KyNRdU/ZJN3Oga+1yfdv+26e5fZTcBg+2lGSVe3aXOB
 GPKDiMf8oNRqLspgWU+hbShbZQIoL1SdnyLZDMJVtEPo+OshuInqhdQPpvx0BajmHCiE
 eUxyErpXghcDJgXXnHx+lur+X7iXsKPnHC0s0eYNe2V3awfgTTOhQjASz/7OFS2Z9yBr
 k7UQ==
X-Gm-Message-State: AOAM530hxUgRb+6QomYY7fmDLqBL7WGZifkJaW5evffG8R282nOVkxEb
 EfetLRV63KHHZrHMdLyoGqc=
X-Google-Smtp-Source: ABdhPJxtGjVqi81tYYe1RLuVDXeTowHyNIMgIiNsh9NFyYPsKIkrU2E3UuX3RWDWY0Y+KAxPjdndIA==
X-Received: by 2002:a2e:97d6:: with SMTP id m22mr2700456ljj.328.1603562127936; 
 Sat, 24 Oct 2020 10:55:27 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id j17sm556124lji.52.2020.10.24.10.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 10:55:27 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: amd-ethanolx: Enable KCS
 channel 3
Date: Sat, 24 Oct 2020 20:55:18 +0300
Message-Id: <20201024175518.1134-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The KCS interface on the LPC channel 3 in the controller
is used for the in-band BMC<->BIOS IPMI communication.
0xCA2 is a default host CPU LPC IO address for this
interface.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 89ddc3847222..2a86bda8afd8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -147,6 +147,11 @@
 	aspeed,lpc-io-reg = <0x62>;
 };
 
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xCA2>;
+};
+
 &kcs4 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0x97DE>;
-- 
2.17.1

