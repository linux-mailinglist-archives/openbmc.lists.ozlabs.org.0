Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE5BD333
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 21:59:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBq73V0BzDqfB
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:59:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBYf55g7zDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:47:50 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v3 linux dev-5.3 09/10] ARM: dts: aspeed: rainier: Add mac
 devices
Date: Tue, 24 Sep 2019 15:47:58 -0400
Message-Id: <20190924194759.26854-10-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Rainier contains two network devices.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v3: new for v3
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot=
/dts/aspeed-bmc-ibm-rainier.dts
index f56a7dddba62..f448fa5df43a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -55,3 +55,17 @@
 	status =3D "okay";
 	memory-region =3D <&flash_memory>;
 };
+
+&mac2 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_rmii3_default>;
+	use-ncsi;
+};
+
+&mac3 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_rmii4_default>;
+	use-ncsi;
+};
--=20
2.21.0
