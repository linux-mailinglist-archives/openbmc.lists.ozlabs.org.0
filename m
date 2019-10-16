Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB3D90A7
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:20:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWbV1wqKzDqxQ
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:20:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XRooaEU7"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tWZX0TYlzDqwT
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 23:19:47 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id u20so11209255plq.4
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZzGFTgmPULzK4/FmbYCfCP8G57LajXOde2AHw4cgaE=;
 b=XRooaEU7mUIUJpp4fnDhp/COw6HzPOxbsi6xrzdxmJfSE4nmqsPFvy8l0+UxscqZv7
 NbRVR52ZAydfiHALmKzIpkBYT+6PYejzrUTVjB4o4E1MHoPp0e+3PxwHipb6N1MO0Mxi
 /Wvy97DHMDSQgEn1KxXDH/RtWI1V6aZkegm+Pw/RTRhxT8EOKbrkCX8Hm0tT8rydt5Zc
 BRM6eMD3IaPT/MnAF1XvhSdlsHAWFrZc7STMPhcrF4zrFr3hm8u+ntyM2Fd7FV8efaqk
 cAe3OUQ5Dl/dKnMcm4cje2Km9VfBqWP8CtXq/JNSwJzh87PfpsYj7rqvV3EDFuFejz45
 dPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CZzGFTgmPULzK4/FmbYCfCP8G57LajXOde2AHw4cgaE=;
 b=IUPdECy/I6PEwxhH+okIpEebjbkwi94dq1J82QxyU8eBKjTvAFk4vPsiqNUgfmM9Yc
 Q/ib0gkcwQYwkx32T5sfsCbFwbXn134VPAHqbq5zCnajL9758RHKi9V6hf21mhZa8t3e
 J1cbo+8Q6nARXm8djqhtr58zXw5aZHoV9I46fJq6nOWJLpwVybavMxHTPuc5xx00ksWI
 ZihH5gb0zrdJ7pG4wQFD8PXG8a6/fENwo9yvu3VKWcwoeOkZPxBPYyJvGk/MbONodAPE
 +b5x4MdX4s3/tRApHVhq4P/758CwaRBvWYMX0Q0FJgcV7IrSPI7mlid8G9k13wXrDPQF
 AA2g==
X-Gm-Message-State: APjAAAWCbiKS602jg2MgEiXFVYXdm01UIOo7df8BVzAB++4cCKrb7i8Q
 egwMI5ny1CJ/v3W1Zq1PGn7V5Ob/J3E=
X-Google-Smtp-Source: APXvYqygJBJdHsCM2G2W8Nsm5a7moIHpaffGSjBtxVJysNXagtVpU2KdjbxuRPHOZVnjiF1Pfg96cQ==
X-Received: by 2002:a17:902:a584:: with SMTP id
 az4mr39681642plb.74.1571228385536; 
 Wed, 16 Oct 2019 05:19:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id c1sm39075531pfb.135.2019.10.16.05.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 05:19:45 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/3] ARM: dts: aspeed: tacoma: Add host FSI
 description
Date: Wed, 16 Oct 2019 22:49:32 +1030
Message-Id: <20191016121934.28481-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016121934.28481-1-joel@jms.id.au>
References: <20191016121934.28481-1-joel@jms.id.au>
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

This adds the description of the Power9 CPUs that are attached to the
BMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 247 ++++++++++++++++++++
 1 file changed, 247 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index b38498a317ce..c073ad8d071f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -138,6 +138,253 @@
 
 &fsim0 {
 	status = "okay";
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <0>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_i2c0: i2c-bus@0 {
+				reg = <0>;
+			};
+
+			cfam0_i2c1: i2c-bus@1 {
+				reg = <1>;
+			};
+
+			cfam0_i2c2: i2c-bus@2 {
+				reg = <2>;
+			};
+
+			cfam0_i2c3: i2c-bus@3 {
+				reg = <3>;
+			};
+
+			cfam0_i2c4: i2c-bus@4 {
+				reg = <4>;
+			};
+
+			cfam0_i2c5: i2c-bus@5 {
+				reg = <5>;
+			};
+
+			cfam0_i2c6: i2c-bus@6 {
+				reg = <6>;
+			};
+
+			cfam0_i2c7: i2c-bus@7 {
+				reg = <7>;
+			};
+
+			cfam0_i2c8: i2c-bus@8 {
+				reg = <8>;
+			};
+
+			cfam0_i2c9: i2c-bus@9 {
+				reg = <9>;
+			};
+
+			cfam0_i2c10: i2c-bus@a {
+				reg = <10>;
+			};
+
+			cfam0_i2c11: i2c-bus@b {
+				reg = <11>;
+			};
+
+			cfam0_i2c12: i2c-bus@c {
+				reg = <12>;
+			};
+
+			cfam0_i2c13: i2c-bus@d {
+				reg = <13>;
+			};
+
+			cfam0_i2c14: i2c-bus@e {
+				reg = <14>;
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ0: occ {
+				compatible = "ibm,p9-occ";
+			};
+		};
+
+		fsi_hub0: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+&fsi_hub0 {
+	cfam@1,0 {
+		reg = <1 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <1>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_i2c0: i2c-bus@0 {
+				reg = <0>;
+			};
+
+			cfam1_i2c1: i2c-bus@1 {
+				reg = <1>;
+			};
+
+			cfam1_i2c2: i2c-bus@2 {
+				reg = <2>;
+			};
+
+			cfam1_i2c3: i2c-bus@3 {
+				reg = <3>;
+			};
+
+			cfam1_i2c4: i2c-bus@4 {
+				reg = <4>;
+			};
+
+			cfam1_i2c5: i2c-bus@5 {
+				reg = <5>;
+			};
+
+			cfam1_i2c6: i2c-bus@6 {
+				reg = <6>;
+			};
+
+			cfam1_i2c7: i2c-bus@7 {
+				reg = <7>;
+			};
+
+			cfam1_i2c8: i2c-bus@8 {
+				reg = <8>;
+			};
+
+			cfam1_i2c9: i2c-bus@9 {
+				reg = <9>;
+			};
+
+			cfam1_i2c10: i2c-bus@a {
+				reg = <10>;
+			};
+
+			cfam1_i2c11: i2c-bus@b {
+				reg = <11>;
+			};
+
+			cfam1_i2c12: i2c-bus@c {
+				reg = <12>;
+			};
+
+			cfam1_i2c13: i2c-bus@d {
+				reg = <13>;
+			};
+
+			cfam1_i2c14: i2c-bus@e {
+				reg = <14>;
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ1: occ {
+				compatible = "ibm,p9-occ";
+			};
+		};
+
+		fsi_hub1: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ0 {
+	reg = <1>;
+};
+
+&fsi_occ1 {
+	reg = <2>;
+};
+
+/ {
+	aliases {
+		i2c100 = &cfam0_i2c0;
+		i2c101 = &cfam0_i2c1;
+		i2c102 = &cfam0_i2c2;
+		i2c103 = &cfam0_i2c3;
+		i2c104 = &cfam0_i2c4;
+		i2c105 = &cfam0_i2c5;
+		i2c106 = &cfam0_i2c6;
+		i2c107 = &cfam0_i2c7;
+		i2c108 = &cfam0_i2c8;
+		i2c109 = &cfam0_i2c9;
+		i2c110 = &cfam0_i2c10;
+		i2c111 = &cfam0_i2c11;
+		i2c112 = &cfam0_i2c12;
+		i2c113 = &cfam0_i2c13;
+		i2c114 = &cfam0_i2c14;
+		i2c200 = &cfam1_i2c0;
+		i2c201 = &cfam1_i2c1;
+		i2c202 = &cfam1_i2c2;
+		i2c203 = &cfam1_i2c3;
+		i2c204 = &cfam1_i2c4;
+		i2c205 = &cfam1_i2c5;
+		i2c206 = &cfam1_i2c6;
+		i2c207 = &cfam1_i2c7;
+		i2c208 = &cfam1_i2c8;
+		i2c209 = &cfam1_i2c9;
+		i2c210 = &cfam1_i2c10;
+		i2c211 = &cfam1_i2c11;
+		i2c212 = &cfam1_i2c12;
+		i2c213 = &cfam1_i2c13;
+		i2c214 = &cfam1_i2c14;
+	};
+
 };
 
 &i2c0 {
-- 
2.23.0

