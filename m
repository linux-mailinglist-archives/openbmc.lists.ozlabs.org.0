Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3342954D806
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:13:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNm1v12Myz3cd4
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=analog.com (client-ip=148.163.135.77; helo=mx0a-00128a01.pphosted.com; envelope-from=nuno.sa@analog.com; receiver=<UNKNOWN>)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKF4Z3DY9z3bsV
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:49:02 +1000 (AEST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A8Ze4W010624;
	Fri, 10 Jun 2022 04:48:37 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh26m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:37 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8ma7n027568
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:36 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:48:35 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:35 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imin014275;
	Fri, 10 Jun 2022 04:48:25 -0400
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
Subject: [PATCH 27/34] iio: adc: ab8500-gpadc: convert to device properties
Date: Fri, 10 Jun 2022 10:45:38 +0200
Message-ID: <20220610084545.547700-28-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: pHxz0w2nnloZydOjdMyGYt3pvgqFy8Hp
X-Proofpoint-GUID: pHxz0w2nnloZydOjdMyGYt3pvgqFy8Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabrice Gasnier <f
 abrice.gasnier@foss.st.com>, Cai Huoqing <cai.huoqing@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thara Gopinath <thara.gopinath@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make the conversion to firmware agnostic device properties. As part of
the conversion the IIO inkern interface 'of_xlate()' is also converted to
'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
dependencies from IIO.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/iio/adc/ab8500-gpadc.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gpadc.c
index 930ce96e6ff5..4fa2126a354b 100644
--- a/drivers/iio/adc/ab8500-gpadc.c
+++ b/drivers/iio/adc/ab8500-gpadc.c
@@ -925,8 +925,8 @@ static int ab8500_gpadc_read_raw(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
-static int ab8500_gpadc_of_xlate(struct iio_dev *indio_dev,
-				 const struct of_phandle_args *iiospec)
+static int ab8500_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
+				     const struct fwnode_reference_args *iiospec)
 {
 	int i;
 
@@ -938,7 +938,7 @@ static int ab8500_gpadc_of_xlate(struct iio_dev *indio_dev,
 }
 
 static const struct iio_info ab8500_gpadc_info = {
-	.of_xlate = ab8500_gpadc_of_xlate,
+	.fwnode_xlate = ab8500_gpadc_fwnode_xlate,
 	.read_raw = ab8500_gpadc_read_raw,
 };
 
@@ -968,7 +968,7 @@ static int ab8500_gpadc_runtime_resume(struct device *dev)
 /**
  * ab8500_gpadc_parse_channel() - process devicetree channel configuration
  * @dev: pointer to containing device
- * @np: device tree node for the channel to configure
+ * @fwnode: fw node for the channel to configure
  * @ch: channel info to fill in
  * @iio_chan: IIO channel specification to fill in
  *
@@ -976,15 +976,15 @@ static int ab8500_gpadc_runtime_resume(struct device *dev)
  * and define usage for things like AUX GPADC inputs more precisely.
  */
 static int ab8500_gpadc_parse_channel(struct device *dev,
-				      struct device_node *np,
+				      struct fwnode_handle *fwnode,
 				      struct ab8500_gpadc_chan_info *ch,
 				      struct iio_chan_spec *iio_chan)
 {
-	const char *name = np->name;
+	const char *name = fwnode_get_name(fwnode);
 	u32 chan;
 	int ret;
 
-	ret = of_property_read_u32(np, "reg", &chan);
+	ret = fwnode_property_read_u32(fwnode, "reg", &chan);
 	if (ret) {
 		dev_err(dev, "invalid channel number %s\n", name);
 		return ret;
@@ -1021,22 +1021,20 @@ static int ab8500_gpadc_parse_channel(struct device *dev,
 /**
  * ab8500_gpadc_parse_channels() - Parse the GPADC channels from DT
  * @gpadc: the GPADC to configure the channels for
- * @np: device tree node containing the channel configurations
  * @chans: the IIO channels we parsed
  * @nchans: the number of IIO channels we parsed
  */
 static int ab8500_gpadc_parse_channels(struct ab8500_gpadc *gpadc,
-				       struct device_node *np,
 				       struct iio_chan_spec **chans_parsed,
 				       unsigned int *nchans_parsed)
 {
-	struct device_node *child;
+	struct fwnode_handle *child;
 	struct ab8500_gpadc_chan_info *ch;
 	struct iio_chan_spec *iio_chans;
 	unsigned int nchans;
 	int i;
 
-	nchans = of_get_available_child_count(np);
+	nchans = device_get_child_node_count(gpadc->dev);
 	if (!nchans) {
 		dev_err(gpadc->dev, "no channel children\n");
 		return -ENODEV;
@@ -1054,7 +1052,7 @@ static int ab8500_gpadc_parse_channels(struct ab8500_gpadc *gpadc,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	device_for_each_child_node(gpadc->dev, child) {
 		struct iio_chan_spec *iio_chan;
 		int ret;
 
@@ -1064,7 +1062,7 @@ static int ab8500_gpadc_parse_channels(struct ab8500_gpadc *gpadc,
 		ret = ab8500_gpadc_parse_channel(gpadc->dev, child, ch,
 						 iio_chan);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 		i++;
@@ -1081,7 +1079,6 @@ static int ab8500_gpadc_probe(struct platform_device *pdev)
 	struct ab8500_gpadc *gpadc;
 	struct iio_dev *indio_dev;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = pdev->dev.of_node;
 	struct iio_chan_spec *iio_chans;
 	unsigned int n_iio_chans;
 	int ret;
@@ -1096,7 +1093,7 @@ static int ab8500_gpadc_probe(struct platform_device *pdev)
 	gpadc->dev = dev;
 	gpadc->ab8500 = dev_get_drvdata(dev->parent);
 
-	ret = ab8500_gpadc_parse_channels(gpadc, np, &iio_chans, &n_iio_chans);
+	ret = ab8500_gpadc_parse_channels(gpadc, &iio_chans, &n_iio_chans);
 	if (ret)
 		return ret;
 
-- 
2.36.1

