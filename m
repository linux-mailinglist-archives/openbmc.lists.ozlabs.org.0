Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1A98AF5D
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2024 23:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHZMP3Hshz3cKF
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 07:43:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727732621;
	cv=none; b=dhkFy95ScTKG5U/G+l3aSuuojEiSvuX1+zzHqa9W0nr8p84DNK7pfCPxNXYvTJxQXHvrjbuDjI7bzvPHiuuKs2HQwNr9O8axkXFLcS5YGjCS2KE4kF+Fxd10A91HBtDOS6dX7nvyA8E2nMfc7HRXbNoM6cC5SUzMdons8Hh9ZipbZMoU32g+tsg2x9J2Y1BUJyGBDs0nrDYmHN4YZazCEaxYtnhTkPYkGBXmErtiV0ws5uSEQH8mqJP4ndd/HxjQDWtjAgLa8lnDwrKBZ8Ps/UcgcTNoah5EvEnW+ijBWBg2U+I8rNT6z3w7j+N5oxc4Lo5nJKUS9w24yxuxRB2KPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727732621; c=relaxed/relaxed;
	bh=ydPzfb5DeHISSXfUFCrECM1xCpvlr+Jls9YV1v8Jxsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgZ6C1WNrzzd2G579ykkfKf0P2QwlzwHkXVJQ0ZGZlxPajfaJ+E+CQpDepWnaWTK9FvS+0dalaGOcZMDaYL1Z9XYYZSvtm7zD9KO5gnVbtF9mGKI0yJnIoKUQT2AaD8IJ59pyNBZCCF44zTDXLaCAUC/BGMCWG9iwK2wB4sMlcqwLTh26JedlymIxPg4LJkk+PEG8Lv+bPIEfa2B8C62n5nEMQvVWVVCXesNM4V36pJx6JeldbpFRhP1NHXklE7IqTJVMhFQZa/aAnan4Yp5k/AMGFxm9tLrj+DgHz6IPJFqYJkYx/5Q24XeID9IxQ6h6xDa+0F8i8u/uj3dNF4+zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=r5zGtU1p; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=r5zGtU1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHZMH6Qvnz2x9c
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 07:43:38 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20b8be13cb1so15159435ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1727732615; x=1728337415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydPzfb5DeHISSXfUFCrECM1xCpvlr+Jls9YV1v8Jxsc=;
        b=r5zGtU1pJedCc5fAZU24BDKeDM8veXmKqBDdrzX8YWfMKmFCsP32DveoHym+IVrMm+
         GRr3f87q9kYMG79iqVf4CO+5xr9vcQ0cAyvOPrpfv3uMWzX413h+TFiUU5XkCobbDpk6
         pga/j+TfvlimWVPz5D5lEIEyWhUIRkIXuf3KbZfPilmqX1C9MHnd1zZFBcdDYGluo5Q2
         09rj+c9aGBFiie2XF/ZAg0gzGZXT21daSkqUDHRphtEZHMRVfLgW+TO9TPrNZ6rZ95wR
         PlwMlvTMbzh5U6eE86NCM0mghd+mTjkN5E00YjHB5whAioo7A09CaeqpyTIynNKEYHnW
         vZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727732615; x=1728337415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydPzfb5DeHISSXfUFCrECM1xCpvlr+Jls9YV1v8Jxsc=;
        b=mLxWVmWSf4FZG1MdeRvwJ+CWnr1MP/K6ZTpqBQypliNRKGqKsJywnYl6ZX9sAHn+2c
         o8xR6gX2uacIjovW3gqNn+sncpuJOaddFhyb+3Zie4gIE64SWBOnQDIo+oqXaPww35uz
         iRgLuEUtv4OzBrHYeG2I8LSX1+BMiKS011VFPMWFrpc7m17tScQRN/4cB8nwSa3Pne6V
         ruKuH+op7DdPmoq9WOImeBJ2xSzzKkPLd2EwTOFqpGjnEr43OXFJDEdYgXDE0bnkp59Q
         gCmVcztp6kluMUfRGSSBMyC547j6SK+rLarbNgPI1OgwzLFb1JHj1ZrhZt6oXPYVuguh
         vS2g==
X-Forwarded-Encrypted: i=1; AJvYcCXaFQF/LE8b0f0q3Boom+JZoYLwuKP5W5vUV5xR/oKlUDROjaxiK9kXzcovU/C7HIeWN+sl5hlQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxfdj7QZlrp1/RgBHUaecrVtyyKsz0qNv2xKT2AcsY7B/aokhkU
	mfv074Rt9Y0+ocF8GGEkDzeprHtAYfD85QG+Bq0O5d2umAYKyGQH1ZSsNmtWTJM=
X-Google-Smtp-Source: AGHT+IEmb+72kgRf7HcU8I5c0RP/oklAv181w4ODjfHsVoM2/CkiBBOAe4P+s1sF3ivarmYuiVRCGg==
X-Received: by 2002:a17:903:18e:b0:20b:6c3c:d481 with SMTP id d9443c01a7336-20b6c3cd81cmr110417585ad.23.1727732615625;
        Mon, 30 Sep 2024 14:43:35 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:8aa3:d4c6:5fe7:c47c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e539ccsm59050635ad.255.2024.09.30.14.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 14:43:34 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: nuvoton: Add OHCI node
Date: Mon, 30 Sep 2024 14:43:29 -0700
Message-ID: <20240930214329.192587-1-william@wkennington.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "William A. Kennington III" <wak@google.com>

The EHCI peripheral already exists in the devicetree, but the hardware
also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
works fine for this device already and has been tested on real hardware.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 358b52894ac0..5aeb5009a5d7 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -142,6 +142,13 @@ gmac0: eth@f0802000 {
 			status = "disabled";
 		};
 
+		ohci1: ohci@f0807000 {
+			compatible = "generic-ohci";
+			reg = <0xf0807000 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		ehci1: usb@f0806000 {
 			compatible = "nuvoton,npcm750-ehci";
 			reg = <0xf0806000 0x1000>;
-- 
2.46.1.824.gd892dcdcdd-goog

