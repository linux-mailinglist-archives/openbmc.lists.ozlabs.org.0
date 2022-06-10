Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169254D804
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:13:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNm0y3HVgz3cgc
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:13:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=analog.com (client-ip=148.163.135.77; helo=mx0a-00128a01.pphosted.com; envelope-from=nuno.sa@analog.com; receiver=<UNKNOWN>)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKF4F35YWz3brl
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:48:45 +1000 (AEST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7h8EU005272;
	Fri, 10 Jun 2022 04:48:18 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:17 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mGbk027556
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:16 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:15 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imik014275;
	Fri, 10 Jun 2022 04:48:04 -0400
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
Subject: [PATCH 24/34] iio: inkern: move to fwnode properties
Date: Fri, 10 Jun 2022 10:45:35 +0200
Message-ID: <20220610084545.547700-25-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: SLrT9c5dbr2AGqM0_4SQx-b6M19QpuVb
X-Proofpoint-GUID: SLrT9c5dbr2AGqM0_4SQx-b6M19QpuVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
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

This moves the IIO in kernel interface to use fwnode properties and thus
be firmware agnostic.

Note that the interface is still not firmware agnostic. At this point we
have both OF and fwnode interfaces so that we don't break any user. On
top of this we also want to have a per driver conversion and that is the
main reason we have both of_xlate() and fwnode_xlate() support.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/iio/inkern.c         | 145 +++++++++++++++++++----------------
 include/linux/iio/consumer.h |  36 +++++----
 include/linux/iio/iio.h      |   5 ++
 3 files changed, 105 insertions(+), 81 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index dde47324b826..1d519b0cacea 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -5,6 +5,7 @@
  */
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -117,15 +118,13 @@ static const struct iio_chan_spec
 	return chan;
 }
 
-#ifdef CONFIG_OF
-
 static int iio_dev_node_match(struct device *dev, const void *data)
 {
-	return dev->of_node == data && dev->type == &iio_device_type;
+	return device_match_fwnode(dev, data) && dev->type == &iio_device_type;
 }
 
 /**
- * __of_iio_simple_xlate - translate iiospec to the IIO channel index
+ * __fwnode_iio_simple_xlate - translate iiospec to the IIO channel index
  * @indio_dev:	pointer to the iio_dev structure
  * @iiospec:	IIO specifier as found in the device tree
  *
@@ -134,14 +133,14 @@ static int iio_dev_node_match(struct device *dev, const void *data)
  * whether IIO index is less than num_channels (that is specified in the
  * iio_dev).
  */
-static int __of_iio_simple_xlate(struct iio_dev *indio_dev,
-				const struct of_phandle_args *iiospec)
+static int __fwnode_iio_simple_xlate(struct iio_dev *indio_dev,
+				     const struct fwnode_reference_args *iiospec)
 {
-	if (!iiospec->args_count)
+	if (!iiospec->nargs)
 		return 0;
 
 	if (iiospec->args[0] >= indio_dev->num_channels) {
-		dev_err(&indio_dev->dev, "invalid channel index %u\n",
+		dev_err(&indio_dev->dev, "invalid channel index %llu\n",
 			iiospec->args[0]);
 		return -EINVAL;
 	}
@@ -149,34 +148,56 @@ static int __of_iio_simple_xlate(struct iio_dev *indio_dev,
 	return iiospec->args[0];
 }
 
-static int __of_iio_channel_get(struct iio_channel *channel,
-				struct device_node *np, int index)
+/*
+ * Simple helper to copy fwnode_reference_args into of_phandle_args so we
+ * can pass it to of_xlate(). Ultimate goal is to drop this together with
+ * of_xlate().
+ */
+static int __fwnode_to_of_xlate(struct iio_dev *indio_dev,
+				const struct fwnode_reference_args *iiospec)
+{
+	struct of_phandle_args of_args;
+	unsigned int i;
+
+	of_args.args_count = iiospec->nargs;
+	of_args.np = to_of_node(iiospec->fwnode);
+
+	for (i = 0; i < MAX_PHANDLE_ARGS; i++)
+		of_args.args[i] = i < iiospec->nargs ? iiospec->args[i] : 0;
+
+	return indio_dev->info->of_xlate(indio_dev, &of_args);
+}
+
+static int __fwnode_iio_channel_get(struct iio_channel *channel,
+				    struct fwnode_handle *fwnode, int index)
 {
 	struct device *idev;
 	struct iio_dev *indio_dev;
 	int err;
-	struct of_phandle_args iiospec;
+	struct fwnode_reference_args iiospec;
 
-	err = of_parse_phandle_with_args(np, "io-channels",
-					 "#io-channel-cells",
-					 index, &iiospec);
+	err = fwnode_property_get_reference_args(fwnode, "io-channels",
+						 "#io-channel-cells", 0,
+						 index, &iiospec);
 	if (err)
 		return err;
 
-	idev = bus_find_device(&iio_bus_type, NULL, iiospec.np,
+	idev = bus_find_device(&iio_bus_type, NULL, iiospec.fwnode,
 			       iio_dev_node_match);
 	if (idev == NULL) {
-		of_node_put(iiospec.np);
+		fwnode_handle_put(iiospec.fwnode);
 		return -EPROBE_DEFER;
 	}
 
 	indio_dev = dev_to_iio_dev(idev);
 	channel->indio_dev = indio_dev;
 	if (indio_dev->info->of_xlate)
-		index = indio_dev->info->of_xlate(indio_dev, &iiospec);
+		index = __fwnode_to_of_xlate(indio_dev, &iiospec);
+	else if (indio_dev->info->fwnode_xlate)
+		index = indio_dev->info->fwnode_xlate(indio_dev, &iiospec);
 	else
-		index = __of_iio_simple_xlate(indio_dev, &iiospec);
-	of_node_put(iiospec.np);
+		index = __fwnode_iio_simple_xlate(indio_dev, &iiospec);
+	fwnode_handle_put(iiospec.fwnode);
 	if (index < 0)
 		goto err_put;
 	channel->channel = &indio_dev->channels[index];
@@ -188,7 +209,8 @@ static int __of_iio_channel_get(struct iio_channel *channel,
 	return index;
 }
 
-static struct iio_channel *of_iio_channel_get(struct device_node *np, int index)
+static struct iio_channel *fwnode_iio_channel_get(struct fwnode_handle *fwnode,
+						  int index)
 {
 	struct iio_channel *channel;
 	int err;
@@ -200,7 +222,7 @@ static struct iio_channel *of_iio_channel_get(struct device_node *np, int index)
 	if (channel == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	err = __of_iio_channel_get(channel, np, index);
+	err = __fwnode_iio_channel_get(channel, fwnode, index);
 	if (err)
 		goto err_free_channel;
 
@@ -211,9 +233,9 @@ static struct iio_channel *of_iio_channel_get(struct device_node *np, int index)
 	return ERR_PTR(err);
 }
 
-struct iio_channel *__of_iio_channel_get_by_name(struct device_node *np,
-						 const char *name,
-						 bool *parent_lookup)
+struct iio_channel *
+__fwnode_iio_channel_get_by_name(struct fwnode_handle *fwnode, const char *name,
+				 bool *parent_lookup)
 {
 	struct iio_channel *chan;
 	int index = 0;
@@ -221,32 +243,34 @@ struct iio_channel *__of_iio_channel_get_by_name(struct device_node *np,
 	/*
 	 * For named iio channels, first look up the name in the
 	 * "io-channel-names" property.  If it cannot be found, the
-	 * index will be an error code, and of_iio_channel_get()
+	 * index will be an error code, and fwnode_iio_channel_get()
 	 * will fail.
 	 */
 	if (name)
-		index = of_property_match_string(np, "io-channel-names", name);
+		index = fwnode_property_match_string(fwnode, "io-channel-names",
+						     name);
 
-	chan = of_iio_channel_get(np, index);
+	chan = fwnode_iio_channel_get(fwnode, index);
 	if (!IS_ERR(chan) || PTR_ERR(chan) == -EPROBE_DEFER) {
 		*parent_lookup = false;
 	} else if (name && index >= 0) {
-		pr_err("ERROR: could not get IIO channel %pOF:%s(%i)\n",
-		       np, name ? name : "", index);
+		pr_err("ERROR: could not get IIO channel %pfw:%s(%i)\n",
+		       fwnode, name ? name : "", index);
 		*parent_lookup = false;
 	}
 
 	return chan;
 }
 
-struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
-					       const char *name)
+struct iio_channel *fwnode_iio_channel_get_by_name(struct fwnode_handle *fwnode,
+						   const char *name)
 {
 	struct iio_channel *chan;
+	struct fwnode_handle *parent;
 	bool parent_lookup = true;
 
 	/* Walk up the tree of devices looking for a matching iio channel */
-	chan = __of_iio_channel_get_by_name(np, name, &parent_lookup);
+	chan = __fwnode_iio_channel_get_by_name(fwnode, name, &parent_lookup);
 	if (!parent_lookup)
 		return chan;
 
@@ -255,33 +279,34 @@ struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
 	 * If the parent node has a "io-channel-ranges" property,
 	 * then we can try one of its channels.
 	 */
-	np = np->parent;
-	while (np) {
-		if (!of_get_property(np, "io-channel-ranges", NULL))
+	fwnode_for_each_parent_node(fwnode, parent) {
+		if (!fwnode_property_present(parent, "io-channel-ranges")) {
+			fwnode_handle_put(parent);
 			return chan;
+		}
 
-		chan = __of_iio_channel_get_by_name(np, name, &parent_lookup);
-		if (!parent_lookup)
+		chan = __fwnode_iio_channel_get_by_name(parent, name, &parent_lookup);
+		if (!parent_lookup) {
+			fwnode_handle_put(parent);
 			return chan;
-
-		np = np->parent;
+		}
 	}
 
 	return chan;
 }
-EXPORT_SYMBOL_GPL(of_iio_channel_get_by_name);
+EXPORT_SYMBOL_GPL(fwnode_iio_channel_get_by_name);
 
-static struct iio_channel *of_iio_channel_get_all(struct device *dev)
+static struct iio_channel *fwnode_iio_channel_get_all(struct device *dev)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct iio_channel *chans;
 	int i, mapind, nummaps = 0;
 	int ret;
 
 	do {
-		ret = of_parse_phandle_with_args(dev->of_node,
-						 "io-channels",
-						 "#io-channel-cells",
-						 nummaps, NULL);
+		ret = fwnode_property_get_reference_args(fwnode, "io-channels",
+							 "#io-channel-cells", 0,
+							 nummaps, NULL);
 		if (ret < 0)
 			break;
 	} while (++nummaps);
@@ -294,10 +319,9 @@ static struct iio_channel *of_iio_channel_get_all(struct device *dev)
 	if (chans == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	/* Search for OF matches */
+	/* Search for FW matches */
 	for (mapind = 0; mapind < nummaps; mapind++) {
-		ret = __of_iio_channel_get(&chans[mapind], dev->of_node,
-					   mapind);
+		ret = __fwnode_iio_channel_get(&chans[mapind], fwnode, mapind);
 		if (ret)
 			goto error_free_chans;
 	}
@@ -310,15 +334,6 @@ static struct iio_channel *of_iio_channel_get_all(struct device *dev)
 	return ERR_PTR(ret);
 }
 
-#else /* CONFIG_OF */
-
-static inline struct iio_channel *of_iio_channel_get_all(struct device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-#endif /* CONFIG_OF */
-
 static struct iio_channel *iio_channel_get_sys(const char *name,
 					       const char *channel_name)
 {
@@ -379,8 +394,8 @@ struct iio_channel *iio_channel_get(struct device *dev,
 	struct iio_channel *channel;
 
 	if (dev) {
-		channel = of_iio_channel_get_by_name(dev->of_node,
-						     channel_name);
+		channel = fwnode_iio_channel_get_by_name(dev_fwnode(dev),
+							 channel_name);
 		if (!IS_ERR(channel) || PTR_ERR(channel) == -EPROBE_DEFER)
 			return channel;
 	}
@@ -421,14 +436,14 @@ struct iio_channel *devm_iio_channel_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_iio_channel_get);
 
-struct iio_channel *devm_of_iio_channel_get_by_name(struct device *dev,
-						    struct device_node *np,
-						    const char *channel_name)
+struct iio_channel *devm_fwnode_iio_channel_get_by_name(struct device *dev,
+							struct fwnode_handle *fwnode,
+							const char *channel_name)
 {
 	struct iio_channel *channel;
 	int ret;
 
-	channel = of_iio_channel_get_by_name(np, channel_name);
+	channel = fwnode_iio_channel_get_by_name(fwnode, channel_name);
 	if (IS_ERR(channel))
 		return channel;
 
@@ -438,7 +453,7 @@ struct iio_channel *devm_of_iio_channel_get_by_name(struct device *dev,
 
 	return channel;
 }
-EXPORT_SYMBOL_GPL(devm_of_iio_channel_get_by_name);
+EXPORT_SYMBOL_GPL(devm_fwnode_iio_channel_get_by_name);
 
 struct iio_channel *iio_channel_get_all(struct device *dev)
 {
@@ -452,7 +467,7 @@ struct iio_channel *iio_channel_get_all(struct device *dev)
 	if (dev == NULL)
 		return ERR_PTR(-EINVAL);
 
-	chans = of_iio_channel_get_all(dev);
+	chans = fwnode_iio_channel_get_all(dev);
 	if (!IS_ERR(chans) || PTR_ERR(chans) == -EPROBE_DEFER)
 		return chans;
 
diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index 5fa5957586cf..a96a714b5fdc 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -9,11 +9,13 @@
 
 #include <linux/types.h>
 #include <linux/iio/types.h>
+#include <linux/of.h>
 
 struct iio_dev;
 struct iio_chan_spec;
 struct device;
 struct device_node;
+struct fwnode_handle;
 
 /**
  * struct iio_channel - everything needed for a consumer to use a channel
@@ -99,26 +101,20 @@ void iio_channel_release_all(struct iio_channel *chan);
 struct iio_channel *devm_iio_channel_get_all(struct device *dev);
 
 /**
- * of_iio_channel_get_by_name() - get description of all that is needed to access channel.
- * @np:			Pointer to consumer device tree node
+ * fwnode_iio_channel_get_by_name() - get description of all that is needed to access channel.
+ * @fwnode:		Pointer to consumer Firmware node
  * @consumer_channel:	Unique name to identify the channel on the consumer
  *			side. This typically describes the channels use within
  *			the consumer. E.g. 'battery_voltage'
  */
-#ifdef CONFIG_OF
-struct iio_channel *of_iio_channel_get_by_name(struct device_node *np, const char *name);
-#else
-static inline struct iio_channel *
-of_iio_channel_get_by_name(struct device_node *np, const char *name)
-{
-	return NULL;
-}
-#endif
+struct iio_channel *fwnode_iio_channel_get_by_name(struct fwnode_handle *fwnode,
+						   const char *name);
 
 /**
- * devm_of_iio_channel_get_by_name() - Resource managed version of of_iio_channel_get_by_name().
+ * devm_fwnode_iio_channel_get_by_name() - Resource managed version of
+ *					   fwnode_iio_channel_get_by_name().
  * @dev:		Pointer to consumer device.
- * @np:			Pointer to consumer device tree node
+ * @fwnode:		Pointer to consumer Firmware node
  * @consumer_channel:	Unique name to identify the channel on the consumer
  *			side. This typically describes the channels use within
  *			the consumer. E.g. 'battery_voltage'
@@ -129,9 +125,17 @@ of_iio_channel_get_by_name(struct device_node *np, const char *name)
  * The allocated iio channel is automatically released when the device is
  * unbound.
  */
-struct iio_channel *devm_of_iio_channel_get_by_name(struct device *dev,
-						    struct device_node *np,
-						    const char *consumer_channel);
+struct iio_channel *devm_fwnode_iio_channel_get_by_name(struct device *dev,
+							struct fwnode_handle *fwnode,
+							const char *consumer_channel);
+
+static inline struct iio_channel
+*devm_of_iio_channel_get_by_name(struct device *dev, struct device_node *np,
+				 const char *consumer_channel)
+{
+	return devm_fwnode_iio_channel_get_by_name(dev, of_fwnode_handle(np),
+						   consumer_channel);
+}
 
 struct iio_cb_buffer;
 /**
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index d9b4a9ca9a0f..494abb63406e 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -18,6 +18,7 @@
  */
 
 struct of_phandle_args;
+struct fwnode_reference_args;
 
 enum iio_shared_by {
 	IIO_SEPARATE,
@@ -429,6 +430,8 @@ struct iio_trigger; /* forward declaration */
  *			provide a custom of_xlate function that reads the
  *			*args* and returns the appropriate index in registered
  *			IIO channels array.
+ * @fwnode_xlate:	fwnode based function pointer to obtain channel specifier index.
+ *			Functionally the same as @of_xlate.
  * @hwfifo_set_watermark: function pointer to set the current hardware
  *			fifo watermark level; see hwfifo_* entries in
  *			Documentation/ABI/testing/sysfs-bus-iio for details on
@@ -510,6 +513,8 @@ struct iio_info {
 				  unsigned *readval);
 	int (*of_xlate)(struct iio_dev *indio_dev,
 			const struct of_phandle_args *iiospec);
+	int (*fwnode_xlate)(struct iio_dev *indio_dev,
+			    const struct fwnode_reference_args *iiospec);
 	int (*hwfifo_set_watermark)(struct iio_dev *indio_dev, unsigned val);
 	int (*hwfifo_flush_to_buffer)(struct iio_dev *indio_dev,
 				      unsigned count);
-- 
2.36.1

