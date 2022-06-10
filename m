Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2B54D823
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNm5F0HRgz3dyj
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:16:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=analog.com (client-ip=148.163.135.77; helo=mx0a-00128a01.pphosted.com; envelope-from=nuno.sa@analog.com; receiver=<UNKNOWN>)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKF5T74Qkz3bth
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:49:49 +1000 (AEST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dXrY010565;
	Fri, 10 Jun 2022 04:49:20 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh28t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:49:19 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8nIrB027580
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:49:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:49:17 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imit014275;
	Fri, 10 Jun 2022 04:49:03 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH 33/34] iio: inkern: remove OF dependencies
Date: Fri, 10 Jun 2022 10:45:44 +0200
Message-ID: <20220610084545.547700-34-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: GePAQQx29L8bJJPCyooQxLNIvK2ZZ6i9
X-Proofpoint-GUID: GePAQQx29L8bJJPCyooQxLNIvK2ZZ6i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=780 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cai Huoqing <cai.huoqing@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson
 @linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thara Gopinath <thara.gopinath@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Since all users of the OF dependendent API are now converted to use the
firmware agnostic alternative, we can drop OF dependencies from the IIO
in kernel interface.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/iio/inkern.c         | 25 +------------------------
 include/linux/iio/consumer.h | 10 ----------
 include/linux/iio/iio.h      |  3 ---
 3 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 1d519b0cacea..7eb536560ded 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -8,7 +8,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-opaque.h>
@@ -148,26 +147,6 @@ static int __fwnode_iio_simple_xlate(struct iio_dev *indio_dev,
 	return iiospec->args[0];
 }
 
-/*
- * Simple helper to copy fwnode_reference_args into of_phandle_args so we
- * can pass it to of_xlate(). Ultimate goal is to drop this together with
- * of_xlate().
- */
-static int __fwnode_to_of_xlate(struct iio_dev *indio_dev,
-				const struct fwnode_reference_args *iiospec)
-{
-	struct of_phandle_args of_args;
-	unsigned int i;
-
-	of_args.args_count = iiospec->nargs;
-	of_args.np = to_of_node(iiospec->fwnode);
-
-	for (i = 0; i < MAX_PHANDLE_ARGS; i++)
-		of_args.args[i] = i < iiospec->nargs ? iiospec->args[i] : 0;
-
-	return indio_dev->info->of_xlate(indio_dev, &of_args);
-}
-
 static int __fwnode_iio_channel_get(struct iio_channel *channel,
 				    struct fwnode_handle *fwnode, int index)
 {
@@ -191,9 +170,7 @@ static int __fwnode_iio_channel_get(struct iio_channel *channel,
 
 	indio_dev = dev_to_iio_dev(idev);
 	channel->indio_dev = indio_dev;
-	if (indio_dev->info->of_xlate)
-		index = __fwnode_to_of_xlate(indio_dev, &iiospec);
-	else if (indio_dev->info->fwnode_xlate)
+	if (indio_dev->info->fwnode_xlate)
 		index = indio_dev->info->fwnode_xlate(indio_dev, &iiospec);
 	else
 		index = __fwnode_iio_simple_xlate(indio_dev, &iiospec);
diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index a96a714b5fdc..6802596b017c 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -9,12 +9,10 @@
 
 #include <linux/types.h>
 #include <linux/iio/types.h>
-#include <linux/of.h>
 
 struct iio_dev;
 struct iio_chan_spec;
 struct device;
-struct device_node;
 struct fwnode_handle;
 
 /**
@@ -129,14 +127,6 @@ struct iio_channel *devm_fwnode_iio_channel_get_by_name(struct device *dev,
 							struct fwnode_handle *fwnode,
 							const char *consumer_channel);
 
-static inline struct iio_channel
-*devm_of_iio_channel_get_by_name(struct device *dev, struct device_node *np,
-				 const char *consumer_channel)
-{
-	return devm_fwnode_iio_channel_get_by_name(dev, of_fwnode_handle(np),
-						   consumer_channel);
-}
-
 struct iio_cb_buffer;
 /**
  * iio_channel_get_all_cb() - register callback for triggered capture
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 494abb63406e..7093be1531c1 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -17,7 +17,6 @@
  * Currently assumes nano seconds.
  */
 
-struct of_phandle_args;
 struct fwnode_reference_args;
 
 enum iio_shared_by {
@@ -511,8 +510,6 @@ struct iio_info {
 	int (*debugfs_reg_access)(struct iio_dev *indio_dev,
 				  unsigned reg, unsigned writeval,
 				  unsigned *readval);
-	int (*of_xlate)(struct iio_dev *indio_dev,
-			const struct of_phandle_args *iiospec);
 	int (*fwnode_xlate)(struct iio_dev *indio_dev,
 			    const struct fwnode_reference_args *iiospec);
 	int (*hwfifo_set_watermark)(struct iio_dev *indio_dev, unsigned val);
-- 
2.36.1

