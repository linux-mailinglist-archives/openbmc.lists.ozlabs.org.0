Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85154D803
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNm0T439Dz30F8
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:12:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=analog.com (client-ip=148.163.135.77; helo=mx0a-00128a01.pphosted.com; envelope-from=nuno.sa@analog.com; receiver=<UNKNOWN>)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKF490gfzz3brb
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:48:40 +1000 (AEST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7noCg005281;
	Fri, 10 Jun 2022 04:48:12 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:48:11 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mAvx023276
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:48:10 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:09 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:09 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imij014275;
	Fri, 10 Jun 2022 04:47:57 -0400
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
Subject: [PATCH 23/34] iio: inkern: split of_iio_channel_get_by_name()
Date: Fri, 10 Jun 2022 10:45:34 +0200
Message-ID: <20220610084545.547700-24-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 2oH5KYMbOhj-Glg6FwhCeBTGAwA2tiGz
X-Proofpoint-GUID: 2oH5KYMbOhj-Glg6FwhCeBTGAwA2tiGz
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

This change splits of_iio_channel_get_by_name() so that it decouples
looking for channels in the current node from looking in it's parents
nodes. This will be helpful when moving to fwnode properties where we
need to release the handles when looking for channels in parent's nodes.

No functional change intended...

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/iio/inkern.c | 69 ++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 31d9c122199a..dde47324b826 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -211,44 +211,63 @@ static struct iio_channel *of_iio_channel_get(struct device_node *np, int index)
 	return ERR_PTR(err);
 }
 
+struct iio_channel *__of_iio_channel_get_by_name(struct device_node *np,
+						 const char *name,
+						 bool *parent_lookup)
+{
+	struct iio_channel *chan;
+	int index = 0;
+
+	/*
+	 * For named iio channels, first look up the name in the
+	 * "io-channel-names" property.  If it cannot be found, the
+	 * index will be an error code, and of_iio_channel_get()
+	 * will fail.
+	 */
+	if (name)
+		index = of_property_match_string(np, "io-channel-names", name);
+
+	chan = of_iio_channel_get(np, index);
+	if (!IS_ERR(chan) || PTR_ERR(chan) == -EPROBE_DEFER) {
+		*parent_lookup = false;
+	} else if (name && index >= 0) {
+		pr_err("ERROR: could not get IIO channel %pOF:%s(%i)\n",
+		       np, name ? name : "", index);
+		*parent_lookup = false;
+	}
+
+	return chan;
+}
+
 struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
 					       const char *name)
 {
 	struct iio_channel *chan;
+	bool parent_lookup = true;
 
 	/* Walk up the tree of devices looking for a matching iio channel */
+	chan = __of_iio_channel_get_by_name(np, name, &parent_lookup);
+	if (!parent_lookup)
+		return chan;
+
+	/*
+	 * No matching IIO channel found on this node.
+	 * If the parent node has a "io-channel-ranges" property,
+	 * then we can try one of its channels.
+	 */
+	np = np->parent;
 	while (np) {
-		int index = 0;
-
-		/*
-		 * For named iio channels, first look up the name in the
-		 * "io-channel-names" property.  If it cannot be found, the
-		 * index will be an error code, and of_iio_channel_get()
-		 * will fail.
-		 */
-		if (name)
-			index = of_property_match_string(np, "io-channel-names",
-							 name);
-		chan = of_iio_channel_get(np, index);
-		if (!IS_ERR(chan) || PTR_ERR(chan) == -EPROBE_DEFER)
+		if (!of_get_property(np, "io-channel-ranges", NULL))
 			return chan;
-		if (name && index >= 0) {
-			pr_err("ERROR: could not get IIO channel %pOF:%s(%i)\n",
-				np, name ? name : "", index);
+
+		chan = __of_iio_channel_get_by_name(np, name, &parent_lookup);
+		if (!parent_lookup)
 			return chan;
-		}
 
-		/*
-		 * No matching IIO channel found on this node.
-		 * If the parent node has a "io-channel-ranges" property,
-		 * then we can try one of its channels.
-		 */
 		np = np->parent;
-		if (np && !of_get_property(np, "io-channel-ranges", NULL))
-			return chan;
 	}
 
-	return ERR_PTR(-ENODEV);
+	return chan;
 }
 EXPORT_SYMBOL_GPL(of_iio_channel_get_by_name);
 
-- 
2.36.1

