Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36744417841
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 18:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGHBP111Dz304s
	for <lists+openbmc@lfdr.de>; Sat, 25 Sep 2021 02:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=omJ5dPgp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=omJ5dPgp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGH9t1YPxz2yNZ
 for <openbmc@lists.ozlabs.org>; Sat, 25 Sep 2021 02:12:33 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OFfSSR031848; 
 Fri, 24 Sep 2021 12:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Kw3wNTAjoLXRQoouU1rKedKqacvPOdckNVH0sxL/2Nc=;
 b=omJ5dPgpvSfk0Cl5v1DJh8AHTjJ57pONe9pxhAbB1twl8j8+8jC5P3kxJiHb0g2BGsbG
 WwFGoJt46j9jTcvlW5+BY/7rjyGnUALyFF/563+J19fxMe7pRVOwpFOZlC0/Sb6VUM5l
 NQlJfWimn2lyc/yjQ0RCyt5slcr5Z8UDKngb5J7Fdb9yuUMJOP/xtrTHd67fJx3C9XwE
 CltwxaeHFUSHUrt01oMWCucEherosgI3xYLctu/dXiUMXX/fWOXrpEP0Zjnybz7ENlID
 LDmNXQ2/xU+3J8WNJX+/3l5wbViROmS4rE02KksvZ16n0lovIZT+PdrHGCfqUFm7N6cN QA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9duq71n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 12:12:24 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OG9rue002108;
 Fri, 24 Sep 2021 16:12:23 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3b93g643u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:12:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OGCMb935783148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 16:12:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ACA178063;
 Fri, 24 Sep 2021 16:12:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24DB078077;
 Fri, 24 Sep 2021 16:12:22 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.36.208])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 16:12:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14] ARM: dts: aspeed: rainier and everest: Remove
 PCA gpio specification
Date: Fri, 24 Sep 2021 11:12:18 -0500
Message-Id: <20210924161218.16442-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7K-Yua_2-5O3vLxB4MRZURb4XTNePp2M
X-Proofpoint-GUID: 7K-Yua_2-5O3vLxB4MRZURb4XTNePp2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=807 spamscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109240102
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
Cc: andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
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
index bb6bbcb4e14f..288e06a8c3a0 100644
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
index 4f108e4e454f..02d43d086624 100644
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

