Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03443559D
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 23:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZPZd6wPBz2xh0
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:56:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jcScfwlb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jcScfwlb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZPWF6pqKz2xtP
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:53:29 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KL3nXQ002027; 
 Wed, 20 Oct 2021 17:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YmVrEqysBNyB1eb7cyf/M6Ig26jz3ycscLO09/q5TnU=;
 b=jcScfwlb+WaDJglvyif1dzVd6m1GbbGFYXsU9iuLNAyz57wYcd21LR6UpFwDpfEVK3EM
 G8GVB5RTnvprD/hvq/Z/JH1bkKn3DjmJL3uzQ0tkk4w+lj1C8JDlCXUgSXnqfhWNebX8
 6nGjboI3qvWco8ukVKuWKtfU+/V9Syss5r+R/6aieR60tZ5d7YWA1d8hcUCRDBoPyEek
 yPScjKO05gRkuwWTr3G8eXVp9fUenYRURZlGOSEmVt2MnomTCqKgK66ozPecg1/SJJu/
 a2lajPIFXO2fmv0YyEst/WQqhcY+vW+0nXTf0BiMy5x/5PimPZASu2N81/mewUmHnzQt gA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btr8wku89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:53:26 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KLlTHo031404;
 Wed, 20 Oct 2021 21:53:25 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3bqpcby0xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 21:53:25 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KLrP3733685820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 21:53:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11AB712405C;
 Wed, 20 Oct 2021 21:53:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4B73124054;
 Wed, 20 Oct 2021 21:53:24 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.77.138])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 21:53:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14 4/5] ARM: dts: aspeed: everest: Add IBM
 Operation Panel I2C device
Date: Wed, 20 Oct 2021 16:53:20 -0500
Message-Id: <20211020215321.33960-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020215321.33960-1-eajames@linux.ibm.com>
References: <20211020215321.33960-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dgtt7JwFOC1NM3389MDHb-7dGA24cJql
X-Proofpoint-ORIG-GUID: dgtt7JwFOC1NM3389MDHb-7dGA24cJql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200123
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set I2C bus 14 to multi-master mode and add the panel device that will
register the I2C controller as a slave device.
In addition, in early Everest systems, the panel device was behind an
I2C switch, which doesn't work for slave mode. Get it working (albeit
unreliably, since a master transaction might switch the switch at any
moment) by defaulting the switch channel to the one with the panel.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 59e187f3cba3..cc4314141aa6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -1908,15 +1908,21 @@ eeprom@52 {
 };
 
 &i2c14 {
+	multi-master;
 	status = "okay";
 
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	i2c-switch@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		status = "okay";
-		i2c-mux-idle-disconnect;
+		idle-state = <1>;
 
 		i2c14mux0chn0: i2c@0 {
 			#address-cells = <1>;
-- 
2.27.0

