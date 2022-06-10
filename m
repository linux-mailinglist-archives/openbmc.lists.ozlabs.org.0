Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8454D82F
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:19:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNm8b6SRbz3fTP
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:19:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=analog.com (client-ip=148.163.135.77; helo=mx0a-00128a01.pphosted.com; envelope-from=nuno.sa@analog.com; receiver=<UNKNOWN>)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKJK80yxkz3fBK
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 21:15:06 +1000 (AEST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dcRs010610;
	Fri, 10 Jun 2022 04:45:32 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh1h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:45:31 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8jTCo027432
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:45:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:45:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:45:28 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imiM014275;
	Fri, 10 Jun 2022 04:44:51 -0400
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
Subject: [PATCH 00/34] make iio inkern interface firmware agnostic
Date: Fri, 10 Jun 2022 10:45:11 +0200
Message-ID: <20220610084545.547700-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: ECPDV-TWick4LVOEVuc0kdMXUUX-GpEN
X-Proofpoint-GUID: ECPDV-TWick4LVOEVuc0kdMXUUX-GpEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabrice Gasnier <f
 abrice.gasnier@foss.st.com>, Cai Huoqing <cai.huoqing@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thara Gopinath <thara.gopinath@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The main goal of this patchset is to convert the iio inkern interface to=0D
be firmware agnostic. Some previous discussion was done in here [1].=0D
Though something odd happened while sending the patches and the RFC=0D
actually never landed in the IIO list (hopefully now works):=0D
=0D
As suggested by Andy, the series can be seen in three blocks:=0D
=0D
1) "Fix" all drivers that were relying on iio.h for specific header=0D
files (mainly of.h and mod_devicetable.h). After that we can drop=0D
of.h from iio.h and just forward declare what we need.=0D
=0D
2) Move "most" of the IIO in kernel interface to FW API. At this point,=0D
there's still some OF dependent API in place so that users are not broken.=
=0D
=0D
3) Move all users of the IIO in kernel interface to the FW API and with=0D
that, make IIO firmware agnostic.=0D
=0D
On 3), the qcom-spmi-adc-tm5.c driver was only converted to use the IIO=0D
API while on the IIO drivers a full driver conversion was done. The=0D
thermal one would be really non trivial as we would also need to touch the=
=0D
subsystem. On the IIO drivers, the conversions were mostly peacefull=0D
(apparently). Special care for the stm32-adc.c driver though as that one=0D
was far from being straight :).=0D
=0D
Lastly, this is only compile tested with allyesconfig for arm and arm64.=0D
While I surely can come up with some dummy devices to make sure I can still=
=0D
properly get IIO channels, having proper tested-by tags on platforms=0D
relying on this interface would be very appreciated (and I suspect Jonathan=
=0D
will require it).=0D
=0D
[1]: https://lore.kernel.org/linux-iio/20220604141925.129f0ffe@jic23-huawei=
/T/#mfd5ccd793841569182e4f831f2c46089b665c346=0D
=0D
Nuno S=C3=A1 (34):=0D
  iio: adc: ad7606: explicitly add proper header files=0D
  iio: adc: ad7606_par: explicitly add proper header files=0D
  iio: adc: berlin2-adc: explicitly add proper header files=0D
  iio: adc: imx7d_adc: explicitly add proper header files=0D
  iio: adc: imx8qxp-adc: explicitly add proper header files=0D
  iio: adc: ingenic-adc: explicitly add proper header files=0D
  iio: adc: mp2629_adc: explicitly add proper header files=0D
  iio: adc: mt6360-adc: explicitly add proper header files=0D
  iio: adc: npcm_adc: explicitly add proper header files=0D
  iio: adc: rzg2l_adc: explicitly add proper header files=0D
  iio: common: cros_ec_lid_angle: explicitly add proper header files=0D
  iio: common: cros_ec_sensors: explicitly add proper header files=0D
  iio: dac: stm32-dac: explicitly add proper header files=0D
  iio: dac: vf610_dac: explicitly add proper header files=0D
  iio: humidity: hts221_buffer: explicitly add proper header files=0D
  iio: light: cros_ec_light_prox: explicitly add proper header files=0D
  iio: pressure: cros_ec_baro: explicitly add proper header files=0D
  iio: trigger: stm32-lptimer-trigger: explicitly add proper header=0D
    files=0D
  iio: core: drop of.h from iio.h=0D
  iio: inkern: only relase the device node when done with it=0D
  iio: inkern: fix return value in devm_of_iio_channel_get_by_name()=0D
  iio: inkern: only return error codes in iio_channel_get_*() APIs=0D
  iio: inkern: split of_iio_channel_get_by_name()=0D
  iio: inkern: move to fwnode properties=0D
  thermal: qcom: qcom-spmi-adc-tm5: convert to IIO fwnode API=0D
  iio: adc: ingenic-adc: convert to IIO fwnode interface=0D
  iio: adc: ab8500-gpadc: convert to device properties=0D
  iio: adc: at91-sama5d2_adc: convert to device properties=0D
  iio: adc: qcom-pm8xxx-xoadc: convert to device properties=0D
  iio: adc: qcom-spmi-vadc: convert to device properties=0D
  iio: adc: qcom-spmi-adc5: convert to device properties=0D
  iio: adc: stm32-adc: convert to device properties=0D
  iio: inkern: remove OF dependencies=0D
  iio: inkern: fix coding style warnings=0D
=0D
 drivers/iio/adc/ab8500-gpadc.c                |  27 +-=0D
 drivers/iio/adc/ad7606.c                      |   1 +=0D
 drivers/iio/adc/ad7606_par.c                  |   1 +=0D
 drivers/iio/adc/at91-sama5d2_adc.c            |  30 +--=0D
 drivers/iio/adc/berlin2-adc.c                 |   2 +=0D
 drivers/iio/adc/imx7d_adc.c                   |   1 +=0D
 drivers/iio/adc/imx8qxp-adc.c                 |   1 +=0D
 drivers/iio/adc/ingenic-adc.c                 |   9 +-=0D
 drivers/iio/adc/mp2629_adc.c                  |   1 +=0D
 drivers/iio/adc/mt6360-adc.c                  |   1 +=0D
 drivers/iio/adc/npcm_adc.c                    |   1 +=0D
 drivers/iio/adc/qcom-pm8xxx-xoadc.c           |  58 ++---=0D
 drivers/iio/adc/qcom-spmi-adc5.c              |  63 +++--=0D
 drivers/iio/adc/qcom-spmi-vadc.c              |  44 ++--=0D
 drivers/iio/adc/rzg2l_adc.c                   |   1 +=0D
 drivers/iio/adc/stm32-adc.c                   | 128 +++++-----=0D
 .../cros_ec_sensors/cros_ec_lid_angle.c       |   1 +=0D
 .../common/cros_ec_sensors/cros_ec_sensors.c  |   1 +=0D
 drivers/iio/dac/stm32-dac.c                   |   2 +=0D
 drivers/iio/dac/vf610_dac.c                   |   1 +=0D
 drivers/iio/humidity/hts221_buffer.c          |   1 +=0D
 drivers/iio/inkern.c                          | 241 +++++++++---------=0D
 drivers/iio/light/cros_ec_light_prox.c        |   1 +=0D
 drivers/iio/pressure/cros_ec_baro.c           |   1 +=0D
 drivers/iio/trigger/stm32-lptimer-trigger.c   |   1 +=0D
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c      |   3 +-=0D
 include/linux/iio/consumer.h                  |  28 +-=0D
 include/linux/iio/iio.h                       |   9 +-=0D
 28 files changed, 347 insertions(+), 312 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D
