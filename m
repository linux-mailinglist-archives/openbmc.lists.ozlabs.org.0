Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D06D8720
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:08:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tJh05v16zDqrC
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 15:08:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mcYzSVOP"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tJgT6FyWzDqjl
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 15:08:21 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id s17so10605424plp.6
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 21:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nm8vUzjLxaupH4oHli8aJSJzJ6vT+NZjkCeBBgv0Ieo=;
 b=mcYzSVOPwobipJs9yZIU6i63TAFudr1FoS3fRbrck1KPns4L+3Uxd58Q3Ohq3whWrX
 TNWe3duSg8WOWGr/AmQ4EpsPu+BzAF3TXNvZENJLllT6unBgWl9SENjN03GUMDfv3eoV
 jNpJmSCK+iUfOJ+SD+bqoUX16zGAiKE22dQBCE7ehEPlwXML2e9PfqFoheyNUXe/FF/m
 oR0YBiB4HBKR+5AVlHYDP/HwB/nBEeU7x6yiYRd1YGjuOa1sVHopYt3yMtc579RPNITc
 eEqmMYovaQk1JnlNR0zor1+2n9rOYXhr4UqhSPWX+4Ikhd4IaLS34kEW2hf+lRgDApUk
 DrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nm8vUzjLxaupH4oHli8aJSJzJ6vT+NZjkCeBBgv0Ieo=;
 b=FKVfgMW6gwmWrd4XoVxPLpZ5Okh/gUfptUTVig8moPXSVHWb85RHy5dXzGFARhlOA8
 bzfnWhY0s9OalqdPVedqFiq7M1YQOBUpbuihW4ikzkUtdXpJjqU5885Cje5HQd9JAfm7
 BlJZx4sMTsbeIfMEaBHcd4xUJBS3H0hkeulSzRVNsh7NsWOoTdqQOl1xdgZMKqxuy7KE
 7xd2s/Jmb4/8OLyB1kYEdHJRzwy2erxiRVwYcZ+fIsTri41UXZFT9kEYQiI65XRzYd8U
 wGS8gjm4jnDr+HQg83dnpuYxM6nKbhDZuakzmvRdjBpTKzyeRq4Keh8bhk6DajFqeny/
 ZNdw==
X-Gm-Message-State: APjAAAW7dHSBubGBCPmVQEYeZsgQpJz5P7zWQ0GOG2eNXM9Z4UihWe51
 AURku32KDIfuC6zl8wKGHsyC0M7vazs=
X-Google-Smtp-Source: APXvYqypBkHwtHM9MbVb48QBbA/SYGybECff7bPwArRxbaMcD6hJbqVG81JddkvWHAv2bnPtVWPw1A==
X-Received: by 2002:a17:902:47:: with SMTP id 65mr38609221pla.81.1571198897849; 
 Tue, 15 Oct 2019 21:08:17 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q42sm818267pja.16.2019.10.15.21.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 21:08:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: ast2600evb: Enable i2c buses
Date: Wed, 16 Oct 2019 14:38:11 +1030
Message-Id: <20191016040811.6999-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With the exception of i2c10 and i2c11 which conflict with the pins
for the third and forth MDIO controllers.

i2c0 comes has an ADT7490 fan controller/thermal monitor device
connected. The bus that it appears on depends on jumper settings, so it
may not be present on all EVBs. It is included to assist testing of I2C.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 0392e9162f11..8a511f846b6b 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -151,3 +151,64 @@
 		spi-max-frequency = <100000000>;
 	};
 };
+
+&i2c0 {
+	status = "okay";
+
+	temp@2e {
+		compatible = "adi,adt7490";
+		reg = <0x2e>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
-- 
2.23.0

