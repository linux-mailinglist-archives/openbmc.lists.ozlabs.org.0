Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC669DA2B6
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tqpx1F3szDr7n
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:31:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j8sJeXgr"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqnD55rpzDqwM
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:30:08 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id j11so238196plk.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 17:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZzGFTgmPULzK4/FmbYCfCP8G57LajXOde2AHw4cgaE=;
 b=j8sJeXgrFJysHhGi41I6xT9pfsyCHVFG4ZMQ1Z2zLOBSGMhS3rXW4/Imte4BjqdZAa
 lXGPD39sHR+zLDMlOFD/hNe3H9NfhFgkQ+ms8li6ajFPmm/CMjKcRZFOmkxBbeSdmdr6
 G6AXiXB0cuOTvnjSGQPLBIAGci7/tRE+sfM1PC6s7ff66QmMe7Ex61yHNHN+9im9AoqL
 215/20sCt0rJ9zD6Hefv27ITtI/Y4sz28tZYKkib+bphvuxLJjGL3vr8Y0sYap+qOKSE
 +dzXlMBpoJ9yEFpkAzBVw08nnabsovdaQWyyKldhJRXhNdLAmN3H+yb5sL65hZIWoUry
 LW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CZzGFTgmPULzK4/FmbYCfCP8G57LajXOde2AHw4cgaE=;
 b=JybryTpWf+YvQkU8P3QAyt3q4g256tpcOZ6G691A/zsXXggh+x0z4wHuPq3FGCo3g7
 4C2xZ4ySU6CmZ0IX3ogqsy9jE075dDS39ZVp51gO6hEQA7MwRIC53fBOySECfoC2/LKp
 z9NOgo8FmEe6X+vpSXkZ/wRmeEnPBnAf3ESdPRPmi/HF1AYw67la1YqY/dQrUEIzXBlZ
 lCd8O0hwgdf/8p690I7uTiuJ9xrqjLIs7ZxgCx0LXW/EPDFELoQp8QvkOB4AAO7uD7fO
 HnRy6U5saRX60y94jwKelbEzR+IZHaTgW2RnnZAHz7+Aq6T4ivB4b+wg8W4andYcbg8N
 ehGw==
X-Gm-Message-State: APjAAAWeXH5HPWE2bt2L52yveC6LlgyiUf7DDgAT8TiQSvuPj1yB61qd
 tPRAgfhj+Z/51N5E/8UktbGnO/LqOhQ=
X-Google-Smtp-Source: APXvYqxC4AOiI7W26jQaNYfwMd0bHTMstqkopCMO74bk+kb7K2VvqEa21C2+F0jwiOyAGKwaWaKvMg==
X-Received: by 2002:a17:902:14f:: with SMTP id 73mr1034802plb.87.1571272205509; 
 Wed, 16 Oct 2019 17:30:05 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z2sm265261pfq.58.2019.10.16.17.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 17:30:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 1/3] ARM: dts: aspeed: tacoma: Add host FSI
 description
Date: Thu, 17 Oct 2019 10:59:53 +1030
Message-Id: <20191017002955.2925-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017002955.2925-1-joel@jms.id.au>
References: <20191017002955.2925-1-joel@jms.id.au>
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

