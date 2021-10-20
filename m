Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A744543559C
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 23:55:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZPYt04TTz30Pj
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=scFj6JcN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=scFj6JcN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZPWF0myTz2xtP
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:53:28 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KLGiSX018896; 
 Wed, 20 Oct 2021 17:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KQVZIPCed/jIIrXpQygtAIeBgV/zcKNURD9raly/tPo=;
 b=scFj6JcNJEokOVYL69KhXjLkkED+OiddOQZsLwN0QaclPpAkVtdSGaHp1TP57PLMSb9B
 ARQ2PJcuRvpRE/RDQyAZzoqLTbbL/9S2iZN15tpNh4XfWSvcWO+jDWYb7ScxA841nBts
 gmZNZzZP0Jkv0O7j2g+BT/QXnfRbI8RzmSk3GI+87b0j1hwP3wNfAcj6OsadVe6gPnWx
 Zp73+I+00n4OJtiR1X0Ost9r0/VAG90/M1D3/h34aDo20xmOHRs2ySE0M1xTMu6k/7Cf
 pm60x8twbyRY9JKcSe05GIhEs5N3mn3uHDzZR3XhBbi2opdx+AS+fKZ/GwEMnnj2DDTN 5A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btmtu1f0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:53:25 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KLm4j8004061;
 Wed, 20 Oct 2021 21:53:24 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3bt4ssgj5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 21:53:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KLrOl941156932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 21:53:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB315124055;
 Wed, 20 Oct 2021 21:53:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8059F124053;
 Wed, 20 Oct 2021 21:53:23 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.77.138])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 21:53:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14 2/5] ARM: dts: aspeed: rainier and everest:
 Remove PCA gpio specification
Date: Wed, 20 Oct 2021 16:53:18 -0500
Message-Id: <20211020215321.33960-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020215321.33960-1-eajames@linux.ibm.com>
References: <20211020215321.33960-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ycEVDUE2GZ-9aABUF9Gbi17oWSKf-36h
X-Proofpoint-ORIG-GUID: ycEVDUE2GZ-9aABUF9Gbi17oWSKf-36h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=840 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Specifying gpio nodes under PCA led controllers no longer does anything,
so remove those nodes in the device trees.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 646 -------------------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 515 ---------------
 2 files changed, 1161 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 45e63ade83ec..f2089af17bb5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -325,86 +325,6 @@ pca1: pca9552@62 {
 			"presence-lcd-op",
 			"presence-base-op",
 			"";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@01 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 };
 
@@ -468,56 +388,6 @@ pca2: pca9552@65 {
 			"expander-cable-card3",
 			"expander-cable-card4",
 			"expander-cable-card5";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	i2c-switch@70 {
@@ -561,36 +431,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -627,36 +467,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -693,36 +503,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 	};
@@ -753,67 +533,6 @@ pca3: pca9552@66 {
 			"expander-cable-card9",
 			"expander-cable-card10",
 			"expander-cable-card11";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
 	};
 
 	i2c-switch@70 {
@@ -857,36 +576,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -923,36 +612,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -989,36 +648,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -1055,36 +684,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 	};
@@ -1134,36 +733,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -1200,36 +769,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -1266,36 +805,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 
@@ -1332,36 +841,6 @@ led@1 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 	};
@@ -1375,11 +854,6 @@ pca_pcie_slot: pca9552@65 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
 		led@1 {
 			label = "pcieslot-c01";
 			reg = <1>;
@@ -1467,26 +941,6 @@ led@11 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 };
 
@@ -2110,11 +1564,6 @@ led@6 {
 			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
 		led@8 {
 			label = "vrm4";
 			reg = <8>;
@@ -2245,11 +1694,6 @@ led@6 {
 			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
 		led@8 {
 			label = "vrm0";
 			reg = <8>;
@@ -2679,16 +2123,6 @@ led@13 {
 					default-state = "keep";
 					type = <PCA955X_TYPE_LED>;
 				};
-
-				gpio@14 {
-					reg = <14>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@15 {
-					reg = <15>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 
 			pca0: pca9552@61 {
@@ -2708,86 +2142,6 @@ pca0: pca9552@61 {
 					"presence-fan2",
 					"presence-fan1",
 					"presence-fan0";
-
-				gpio@0 {
-					reg = <0>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@1 {
-					reg = <1>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@2 {
-					reg = <2>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@3 {
-					reg = <3>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@4 {
-					reg = <4>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@5 {
-					reg = <5>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@6 {
-					reg = <6>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@7 {
-					reg = <7>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@8 {
-					reg = <8>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@9 {
-					reg = <9>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@10 {
-					reg = <10>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@11 {
-					reg = <11>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@12 {
-					reg = <12>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@13 {
-					reg = <13>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@14 {
-					reg = <14>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
-
-				gpio@15 {
-					reg = <15>;
-					type = <PCA955X_TYPE_GPIO>;
-				};
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0fb32b9d124f..76da5ffaf1e0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1005,86 +1005,6 @@ pca_pres1: pca9552@61 {
 			"SLOT1_EXPANDER_PRSNT_N", "SLOT2_EXPANDER_PRSNT_N",
 			"SLOT3_EXPANDER_PRSNT_N", "SLOT4_EXPANDER_PRSNT_N",
 			"", "", "", "", "", "";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 };
 
@@ -1130,36 +1050,6 @@ led@1 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	pca9546@70 {
@@ -1242,36 +1132,6 @@ led@1 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	pca9551@61 {
@@ -1298,36 +1158,6 @@ led@1 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	pca9546@70 {
@@ -1503,11 +1333,6 @@ led@6 {
 			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
 		led@8 {
 			label = "lcd-russel";
 			reg = <8>;
@@ -1515,41 +1340,6 @@ led@8 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	pca9552@31 {
@@ -1853,11 +1643,6 @@ led@1 {
 			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
 		led@3 {
 			label = "dasd-pyramid0";
 			reg = <3>;
@@ -2056,26 +1841,6 @@ led@3 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	pca0: pca9552@61 {
@@ -2134,56 +1899,6 @@ led@5 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	ibm-panel@62 {
@@ -2257,86 +1972,6 @@ pca_pres2: pca9552@61 {
 			"SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
 			"SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
 			"", "", "", "";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 };
@@ -2416,36 +2051,6 @@ led@1 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 
 	pca9546@70 {
@@ -2569,46 +2174,6 @@ led@7 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 };
 
@@ -2692,46 +2257,6 @@ led@7 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 };
 
@@ -2815,46 +2340,6 @@ led@7 {
 			default-state = "keep";
 			type = <PCA955X_TYPE_LED>;
 		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
 	};
 };
 
-- 
2.27.0

