Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C261F48F6
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 23:41:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hNqN4wrCzDqZL
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 07:41:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hNn93JTKzDqQN
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 07:39:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 059LX39M097856; Tue, 9 Jun 2020 17:39:36 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31j59uu203-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 17:39:36 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 059LZtgX018475;
 Tue, 9 Jun 2020 21:39:35 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 31hdb3hv31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 21:39:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 059LdYsO53739920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jun 2020 21:39:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C100BAC059;
 Tue,  9 Jun 2020 21:39:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F99FAC05B;
 Tue,  9 Jun 2020 21:39:34 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.141.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jun 2020 21:39:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 1/2] fsi: master: Add boolean parameter to
 link_enable function
Date: Tue,  9 Jun 2020 16:39:27 -0500
Message-Id: <20200609213928.26545-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200609213928.26545-1-eajames@linux.ibm.com>
References: <20200609213928.26545-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-09_14:2020-06-09,
 2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxscore=0 cotscore=-2147483648 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=1 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090164
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

Add the ability to disable a link with a boolean parameter to the
link_enable function. This is necessary so that the master can disable
links that it isn't using; for example, links to slaves that fail
initialization.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c          | 2 +-
 drivers/fsi/fsi-master-aspeed.c | 7 ++++++-
 drivers/fsi/fsi-master-ast-cf.c | 5 +++--
 drivers/fsi/fsi-master-gpio.c   | 5 +++--
 drivers/fsi/fsi-master-hub.c    | 7 ++++++-
 drivers/fsi/fsi-master.h        | 3 ++-
 6 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8244da8a7241..0743bba42757 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1157,7 +1157,7 @@ static int fsi_master_write(struct fsi_master *master, int link,
 static int fsi_master_link_enable(struct fsi_master *master, int link)
 {
 	if (master->link_enable)
-		return master->link_enable(master, link);
+		return master->link_enable(master, link, true);
 
 	return 0;
 }
diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index b44f71f1f0a8..07660dc2bdab 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -307,7 +307,8 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	return 0;
 }
 
-static int aspeed_master_link_enable(struct fsi_master *master, int link)
+static int aspeed_master_link_enable(struct fsi_master *master, int link,
+				     bool enable)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
 	int idx, bit, ret;
@@ -318,6 +319,10 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 
 	reg = cpu_to_be32(0x80000000 >> bit);
 
+	if (!enable)
+		return opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx),
+				  reg);
+
 	ret = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
 	if (ret)
 		return ret;
diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index 04d10ea8d343..62dcc71a30e6 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -1039,7 +1039,8 @@ static void fsi_master_acf_setup_external(struct fsi_master_acf *master)
 	gpiod_direction_input(master->gpio_data);
 }
 
-static int fsi_master_acf_link_enable(struct fsi_master *_master, int link)
+static int fsi_master_acf_link_enable(struct fsi_master *_master, int link,
+				      bool enable)
 {
 	struct fsi_master_acf *master = to_fsi_master_acf(_master);
 	int rc = -EBUSY;
@@ -1049,7 +1050,7 @@ static int fsi_master_acf_link_enable(struct fsi_master *_master, int link)
 
 	mutex_lock(&master->lock);
 	if (!master->external_mode) {
-		gpiod_set_value(master->gpio_enable, 1);
+		gpiod_set_value(master->gpio_enable, enable ? 1 : 0);
 		rc = 0;
 	}
 	mutex_unlock(&master->lock);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 4dcce17f243f..aa97c4a250cb 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -678,7 +678,8 @@ static void fsi_master_gpio_init_external(struct fsi_master_gpio *master)
 	gpiod_direction_input(master->gpio_data);
 }
 
-static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
+static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link,
+				       bool enable)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 	int rc = -EBUSY;
@@ -688,7 +689,7 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 
 	mutex_lock(&master->cmd_lock);
 	if (!master->external_mode) {
-		gpiod_set_value(master->gpio_enable, 1);
+		gpiod_set_value(master->gpio_enable, enable ? 1 : 0);
 		rc = 0;
 	}
 	mutex_unlock(&master->cmd_lock);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index def35cf92571..1d3cf2da6a16 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -77,7 +77,8 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
-static int hub_master_link_enable(struct fsi_master *master, int link)
+static int hub_master_link_enable(struct fsi_master *master, int link,
+				  bool enable)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(master);
 	int idx, bit;
@@ -89,6 +90,10 @@ static int hub_master_link_enable(struct fsi_master *master, int link)
 
 	reg = cpu_to_be32(0x80000000 >> bit);
 
+	if (!enable)
+		return fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx),
+					&reg, 4);
+
 	rc = fsi_device_write(hub->upstream, FSI_MSENP0 + (4 * idx), &reg, 4);
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 6e8d4d4d5149..cd6bee5e12a7 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -130,7 +130,8 @@ struct fsi_master {
 				uint32_t addr, const void *val, size_t size);
 	int		(*term)(struct fsi_master *, int link, uint8_t id);
 	int		(*send_break)(struct fsi_master *, int link);
-	int		(*link_enable)(struct fsi_master *, int link);
+	int		(*link_enable)(struct fsi_master *, int link,
+				       bool enable);
 	int		(*link_config)(struct fsi_master *, int link,
 				       u8 t_send_delay, u8 t_echo_delay);
 };
-- 
2.24.0

