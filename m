Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D114112F
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 19:55:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zqyd4HF2zDqyS
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 05:55:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8285ff0f02=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=RxdmPdED; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zqxn4w5RzDqxV
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 05:55:08 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HIt5YL021529
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:55:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=2D8tgyLgm0Ncp4PJJyYFKw9yZG29sqQS6MuVg5GIbtc=;
 b=RxdmPdEDBXfIxbc/85zv9R1Q+SmCtXS1/RqSWjp9DTRjnFp0nNFONmUjGG4Y8ohrIM2y
 ajhn7hGJOE3YdGlJ8roOYisPHV+f2KThtdig2vZwi+o/LXWU1WyRNXCaFDluxF+BPctM
 TRBrisRAmgx2C6AxnXHP57muEn98Kir2zgQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xk0s1m5kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:55:06 -0800
Received: from intmgw001.41.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 17 Jan 2020 10:54:32 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 24F6B19F1905D; Fri, 17 Jan 2020 10:51:43 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v2] ARM: dts: aspeed: tiogapass: Add gpio line names
Date: Fri, 17 Jan 2020 10:51:41 -0800
Message-ID: <20200117185141.1540096-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001170144
X-FB-Internal: deliver
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
Cc: openbmc@lists.ozlabs.org, vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added GPIO line names for all gpio used in tiogapass platform,
these line names will be used by libgpiod to control GPIOs

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
v2 : Added BIOS_SPI_BMC_CTRL gpio line name

 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 682f729ea25e..fb7f034d5db2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -121,6 +121,69 @@
 	kcs_addr = <0xca2>;
 };
 
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"BMC_CPLD_FPGA_SEL","","","","","","","",
+	/*B0-B7*/	"","BMC_DEBUG_EN","","","","BMC_PPIN","PS_PWROK",
+			"IRQ_PVDDQ_GHJ_VRHOT_LVT3",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"BIOS_MRC_DEBUG_MSG_DIS","BOARD_REV_ID0","",
+			"BOARD_REV_ID1","IRQ_DIMM_SAVE_LVT3","BOARD_REV_ID2",
+			"CPU_ERR0_LVT3_BMC","CPU_ERR1_LVT3_BMC",
+	/*E0-E7*/	"RESET_BUTTON","RESET_OUT","POWER_BUTTON",
+			"POWER_OUT","NMI_BUTTON","","CPU0_PROCHOT_LVT3_ BMC",
+			"CPU1_PROCHOT_LVT3_ BMC",
+	/*F0-F7*/	"IRQ_PVDDQ_ABC_VRHOT_LVT3","",
+			"IRQ_PVCCIN_CPU0_VRHOT_LVC3",
+			"IRQ_PVCCIN_CPU1_VRHOT_LVC3",
+			"IRQ_PVDDQ_KLM_VRHOT_LVT3","","P3VBAT_BRIDGE_EN","",
+	/*G0-G7*/	"CPU_ERR2_LVT3","CPU_CATERR_LVT3","PCH_BMC_THERMTRIP",
+			"CPU0_SKTOCC_LVT3","","","","BIOS_SMI_ACTIVE",
+	/*H0-H7*/	"LED_POST_CODE_0","LED_POST_CODE_1","LED_POST_CODE_2",
+			"LED_POST_CODE_3","LED_POST_CODE_4","LED_POST_CODE_5",
+			"LED_POST_CODE_6","LED_POST_CODE_7",
+	/*I0-I7*/	"CPU0_FIVR_FAULT_LVT3","CPU1_FIVR_FAULT_LVT3",
+			"FORCE_ADR","UV_ADR_TRIGGER_EN","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"IRQ_UV_DETECT","IRQ_OC_DETECT","HSC_TIMER_EXP","",
+			"MEM_THERM_EVENT_PCH","PMBUS_ALERT_BUF_EN","","",
+	/*M0-M7*/	"CPU0_RC_ERROR","CPU1_RC_ERROR","","OC_DETECT_EN",
+			"CPU0_THERMTRIP_LATCH_LVT3",
+			"CPU1_THERMTRIP_LATCH_LVT3","","",
+	/*N0-N7*/	"","","","CPU_MSMI_LVT3","","BIOS_SPI_BMC_CTRL","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"BOARD_SKU_ID0","BOARD_SKU_ID1","BOARD_SKU_ID2",
+			"BOARD_SKU_ID3","BOARD_SKU_ID4","BMC_PREQ",
+			"BMC_PWR_DEBUG","RST_RSMRST",
+	/*Q0-Q7*/	"","","","","UARTSW_LSB","UARTSW_MSB",
+			"POST_CARD_PRES_BMC","PE_BMC_WAKE",
+	/*R0-R7*/	"","","BMC_TCK_MUX_SEL","BMC_PRDY",
+			"BMC_XDP_PRSNT_IN","RST_BMC_PLTRST_BUF","SLT_CFG0",
+			"SLT_CFG1",
+	/*S0-S7*/	"THROTTLE","BMC_READY","","HSC_SMBUS_SWITCH_EN","",
+			"","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","BMC_FAULT","","",
+	/*V0-V7*/	"","","","FAST_PROCHOT_EN","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","GLOBAL_RST_WARN",
+			"CPU0_MEMABC_MEMHOT_LVT3_BMC",
+			"CPU0_MEMDEF_MEMHOT_LVT3_BMC",
+			"CPU1_MEMGHJ_MEMHOT_LVT3_BMC",
+			"CPU1_MEMKLM_MEMHOT_LVT3_BMC",
+	/*Y0-Y7*/	"SIO_S3","SIO_S5","BMC_JTAG_SEL","SIO_ONCONTROL","",
+			"","","",
+	/*Z0-Z7*/	"","SIO_POWER_GOOD","IRQ_PVDDQ_DEF_VRHOT_LVT3","",
+			"","","","",
+	/*AA0-AA7*/	"CPU1_SKTOCC_LVT3","IRQ_SML1_PMBUS_ALERT",
+			"SERVER_POWER_LED","","PECI_MUX_SELECT","UV_HIGH_SET",
+			"","POST_COMPLETE",
+	/*AB0-AB7*/	"IRQ_HSC_FAULT","OCP_MEZZA_PRES","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &mac0 {
 	status = "okay";
 
-- 
2.17.1

