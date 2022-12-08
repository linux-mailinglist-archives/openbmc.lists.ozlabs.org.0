Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DFE646A63
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 09:23:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSRxS61Bbz3bh6
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 19:23:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zIICd3HQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=wangxiaohua.1217@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zIICd3HQ;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSRws25ngz30Qy
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 19:22:51 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso3934247pjt.0
        for <openbmc@lists.ozlabs.org>; Thu, 08 Dec 2022 00:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7u/E5qpdHwFQuHeaPU2cEPl1VrhfJjZCudUhgqf6PS4=;
        b=zIICd3HQmh+fecmGSrbUQMD3zmtzx+bfsFr6o8meAHfbGoqA6dXKsdNQ2s5Sxtn3xS
         xTYIxAFw/dmd14039xC1dFywEtxcf1sgW3WPXQ3mw7KCpROMWnIPhUz6XQPDgoBQCQaH
         xUGOsubLCOJty5hwpmdjnOobW03CFChjaZOZc2B0fugRPQLO7AFuADqSgj92EPi77zka
         tTfudr9abjUP7rcsZj7tmaiPlV5OipoEbngQQ4YerRvrC+OGJ63nRJU3aUjefLACWlX/
         OCZsUfZmFL+iuVvnsFWEO6SVJw+3hO//VERjEr8SVVNbCILaZT+AOsMlAvKdQSJGGH2l
         E/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7u/E5qpdHwFQuHeaPU2cEPl1VrhfJjZCudUhgqf6PS4=;
        b=GdsUecS+jKJ+U9XELkpB9vH5tR0WQf+A4i598t23cz4y9ybo/b7qE0AM97NoxbNkVM
         NPSMxU27OMi9/BZJpzDgRqpYlKhWfVVmLcLcPHabeagU2R+bNJ8rDZpjUODeKqmC5f5O
         zLtEKq4Y4LdYAWJYAPeEJb7KTvZoRrCYm372n2LV1HYSdZVDcIYJO3kmoA2+0WSRPQAD
         5oBoUluhpTOvp8iuh3MVuFUE6ZHBP9ULxffeOb5syuBUFkr/TbU5qf2Mz1nGSw2zhW66
         FdryOh14lPmkb5D5pPlPVNhmJcyTphtsVzLt5nYmkXRz06f5c6OSQt5Ss3Ec3AP/H0xE
         VWWA==
X-Gm-Message-State: ANoB5pmfso8ghnnkliymxlIYYH8Lou8x/RQhhVwwm/1L20jJkKmKUxfh
	dY+V5Rp+0qqZcPnnUAsrUQBqVQ==
X-Google-Smtp-Source: AA0mqf64b8xGKD4D1SAtTLAAbF3xdkkMRv6p7PsPsPC7K60mDS165m0Zj8QKel7QZDYCB5BAzIdL4A==
X-Received: by 2002:a05:6a20:9f05:b0:a5:798c:f929 with SMTP id mk5-20020a056a209f0500b000a5798cf929mr2180406pzb.10.1670487763592;
        Thu, 08 Dec 2022 00:22:43 -0800 (PST)
Received: from localhost ([49.7.199.160])
        by smtp.gmail.com with ESMTPSA id w63-20020a626242000000b005624e2e0508sm14749705pfb.207.2022.12.08.00.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 00:22:43 -0800 (PST)
From: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
To: linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	jdelvare@suse.com,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.0] pmbus: Add mp2971/mp2973 support in mp2975
Date: Thu,  8 Dec 2022 16:22:39 +0800
Message-Id: <20221208082239.1062679-1-wangxiaohua.1217@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add mp2971/mp2973 support in mp2975

Tested with:
My unit only include mp2971 and mp2973 devices
MP2973:
cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*label
iin
iout1
iout2
vin
vout1
vout2
pin
pout1
pout2
cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*input
0
82500
14000
12187
1787
1793
0
148000000
25000000
54000
MP2971:
cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*label
iin
iout1
iout2
vin
vout1
vout2
pin
pout1
pout2
cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*input
18500
22000
500
12187
1025
1800
226000000
22000000
1000000
55000

Signed-off-by: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
---
 drivers/hwmon/pmbus/mp2975.c | 413 +++++++++++++++++++++++++++++++----
 1 file changed, 372 insertions(+), 41 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 51986adfbf47..972b5b02dfdd 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -52,10 +52,33 @@
 #define MP2975_MAX_PHASE_RAIL2	4
 #define MP2975_PAGE_NUM		2
 
+#define MP2971_RAIL2_FUNC                                                      \
+	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |          \
+	 PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT)
+
 #define MP2975_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
 				 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
 				 PMBUS_HAVE_POUT | PMBUS_PHASE_VIRTUAL)
 
+struct mp2971_device_info {
+	int max_phase_rail1;
+	int max_phase_rail2;
+	int imvp9_en_r1_mask;
+	int imvp9_en_r2_mask;
+};
+
+struct mp2971_data {
+	struct pmbus_driver_info info;
+	int vid_step[MP2975_PAGE_NUM];
+	int vout_format[MP2975_PAGE_NUM];
+	int vout_mode[MP2975_PAGE_NUM];
+	int vout_exponent[MP2975_PAGE_NUM];
+	int max_phase_rail1;
+	int max_phase_rail2;
+	int imvp9_en_r1_mask;
+	int imvp9_en_r2_mask;
+};
+
 struct mp2975_data {
 	struct pmbus_driver_info info;
 	int vout_scale;
@@ -68,6 +91,9 @@ struct mp2975_data {
 	int curr_sense_gain[MP2975_PAGE_NUM];
 };
 
+static const struct i2c_device_id mp2975_id[];
+
+#define to_mp2971_data(x) container_of(x, struct mp2971_data, info)
 #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
 
 static int mp2975_read_byte_data(struct i2c_client *client, int page, int reg)
@@ -95,6 +121,40 @@ mp2975_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
 	return (ret > 0) ? ret & mask : ret;
 }
 
+static int
+mp2971_linear2direct(struct mp2971_data *data, int page, int val)
+{
+	/* simple case */
+	if (val == 0)
+		return 0;
+
+	/* LINEAR16 does not support negative voltages */
+	if (val < 0)
+		return 0;
+
+	/*
+	 * For a static exponents, we don't have a choice
+	 * but to adjust the value to it.
+	 */
+
+	if (data->vout_exponent[page] < 0)
+		val <<= -data->vout_exponent[page];
+	else
+		val >>= data->vout_exponent[page];
+	return clamp_val(val, 0, 0xffff);
+}
+
+static int
+mp2971_vid2direct(struct mp2971_data *data, int page, int val)
+{
+	int vrf = data->info.vrm_version[page];
+
+	if (vrf == imvp9)
+		return (val + 29) * data->vid_step[page];
+
+	return (val + 49) * data->vid_step[page];
+}
+
 static int
 mp2975_vid2direct(int vrf, int val)
 {
@@ -214,6 +274,74 @@ mp2975_read_phases(struct i2c_client *client, struct mp2975_data *data,
 	return ret;
 }
 
+static int
+mp2971_read_word_data(struct i2c_client *client, int page,
+				int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2971_data *data = to_mp2971_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_READ_IOUT:
+		ret = mp2975_read_word_helper(client, page, phase,
+						 reg, GENMASK(15, 0));
+		break;
+	case PMBUS_READ_VOUT:
+		ret = mp2975_read_word_helper(client, page, phase, reg,
+					      GENMASK(11, 0));
+		if (ret < 0)
+			return ret;
+		/*
+		 * READ_VOUT can be provided in VID or direct format. The
+		 * format type is specified by bit 15 of the register
+		 * MP2971_MFR_DC_LOOP_CTRL. The driver enforces VOUT direct
+		 * format, since device allows to set the different formats for
+		 * the different rails and also all VOUT limits registers are
+		 * provided in a direct format. In case format is VID - convert
+		 * to direct.
+		 */
+		switch (data->vout_format[page]) {
+		case linear:
+			ret = mp2971_linear2direct(data, page, ret);
+			break;
+		case vid:
+			ret = mp2971_vid2direct(data, page, ret);
+			break;
+		case direct:
+			break;
+		default:
+			return -ENODATA;
+		}
+		break;
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_POUT_OP_FAULT_LIMIT:
+	case PMBUS_POUT_OP_WARN_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		return -ENXIO;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
 static int mp2975_read_word_data(struct i2c_client *client, int page,
 				 int phase, int reg)
 {
@@ -365,6 +493,63 @@ mp2975_set_phase_rail2(struct pmbus_driver_info *info, int num_phases)
 		info->pfunc[MP2975_MAX_PHASE_RAIL1 - i] = PMBUS_HAVE_IOUT;
 }
 
+static int mp2971_identify_multiphase(struct i2c_client *client,
+				      struct mp2971_data *data,
+				      struct pmbus_driver_info *info)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+	if (ret < 0)
+		return ret;
+
+	/* Identify multiphase for rail 1 - could be from 1 to 12. */
+	ret = i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONFIG_R1);
+	if (ret <= 0)
+		return ret;
+
+	info->phases[0] = ret & GENMASK(3, 0);
+
+	/*
+	 * The device provides a total of 8 PWM pins, and can be configured
+	 * to different phase count applications for rail 1 and rail 2.
+	 * Rail 1 can be set to 8 phases, while rail 2 can only be set to 4
+	 * phases at most. When rail 1’s phase count is configured as 0, rail
+	 * 1 operates with 1-phase DCM. When rail 2 phase count is configured
+	 * as 0, rail 2 is disabled.
+	 */
+	if (info->phases[0] > data->max_phase_rail1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int
+mp2971_identify_vid(struct i2c_client *client, struct mp2971_data *data,
+			struct pmbus_driver_info *info, u32 reg, int page,
+			u32 imvp_bit, u32 vr_bit)
+{
+	int ret;
+
+	/* Identify VID mode and step selection. */
+	ret = i2c_smbus_read_word_data(client, reg);
+	if (ret < 0)
+		return ret;
+
+	if (ret & imvp_bit) {
+		info->vrm_version[page] = imvp9;
+		data->vid_step[page] = MP2975_PROT_DEV_OV_OFF;
+	} else if (ret & vr_bit) {
+		info->vrm_version[page] = vr12;
+		data->vid_step[page] = MP2975_PROT_DEV_OV_ON;
+	} else {
+		info->vrm_version[page] = vr13;
+		data->vid_step[page] = MP2975_PROT_DEV_OV_OFF;
+	}
+
+	return 0;
+}
+
 static int
 mp2975_identify_multiphase(struct i2c_client *client, struct mp2975_data *data,
 			   struct pmbus_driver_info *info)
@@ -428,6 +613,68 @@ mp2975_identify_vid(struct i2c_client *client, struct mp2975_data *data,
 	return 0;
 }
 
+static int
+mp2971_identify_rails_vid(struct i2c_client *client, struct mp2971_data *data,
+				     struct pmbus_driver_info *info)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+	if (ret < 0)
+		return ret;
+
+	/* Identify VID mode for rail 1. */
+	ret = mp2971_identify_vid(client, data, info,
+				  MP2975_MFR_VR_MULTI_CONFIG_R1, 0,
+				  data->imvp9_en_r1_mask,
+				  MP2975_VID_STEP_SEL_R1);
+	if (ret < 0)
+		return ret;
+
+	/* Identify VID mode for rail 2, if connected. */
+	if (info->phases[1])
+		ret = mp2971_identify_vid(client, data, info,
+					  MP2975_MFR_VR_MULTI_CONFIG_R2, 1,
+					  data->imvp9_en_r2_mask,
+					  MP2975_VID_STEP_SEL_R2);
+	return ret;
+}
+
+static int mp2971_identify_vout_format(struct i2c_client *client,
+				       struct mp2971_data *data,
+				       struct pmbus_driver_info *info)
+{
+	int i, ret, vout_mode;
+
+	for (i = 0; i < info->pages; i++) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
+		if (ret < 0)
+			return ret;
+
+		vout_mode = ret;
+
+		switch (vout_mode >> 5) {
+		case 0:
+			data->vout_format[i] = linear;
+			data->vout_exponent[i] = ((s8)(vout_mode << 3)) >> 3;
+			break;
+		case 1:
+			data->vout_format[i] = vid;
+			break;
+		case 2:
+			data->vout_format[i] = direct;
+			break;
+		default:
+			return -ENODEV;
+		}
+	}
+	return 0;
+}
+
 static int
 mp2975_identify_rails_vid(struct i2c_client *client, struct mp2975_data *data,
 			  struct pmbus_driver_info *info)
@@ -659,6 +906,24 @@ mp2975_vout_per_rail_config_get(struct i2c_client *client,
 	return 0;
 }
 
+static struct pmbus_driver_info mp2971_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
+		   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+	.read_byte_data = mp2975_read_byte_data,
+	.read_word_data = mp2971_read_word_data,
+};
+
 static struct pmbus_driver_info mp2975_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -683,63 +948,129 @@ static struct pmbus_driver_info mp2975_info = {
 static int mp2975_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
-	struct mp2975_data *data;
 	int ret;
+	char *name;
+
+	name = (int)i2c_match_id(mp2975_id, client)->name;
+	if (name == NULL)
+		return 0;
+	if (!strcmp(name, "mp2971") || !strcmp(name, "mp2973")) {
+		struct mp2971_data *data;
+		struct mp2971_device_info *device_info;
+
+		data = devm_kzalloc(&client->dev, sizeof(struct mp2971_data),
+					GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		device_info =
+			(struct mp2971_device_info *)i2c_match_id(mp2975_id, client)
+				->driver_data;
+
+		memcpy(&data->info, &mp2971_info, sizeof(*info));
+		info = &data->info;
+
+		if (device_info) {
+			data->imvp9_en_r1_mask = device_info->imvp9_en_r1_mask;
+			data->imvp9_en_r2_mask = device_info->imvp9_en_r2_mask;
+			data->max_phase_rail1 = device_info->max_phase_rail1;
+			data->max_phase_rail2 = device_info->max_phase_rail2;
+		}
 
-	data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
-			    GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+		/* Identify multiphase configuration for rail 2. */
+		ret = mp2975_identify_multiphase_rail2(client);
+		if (ret < 0)
+			return ret;
 
-	memcpy(&data->info, &mp2975_info, sizeof(*info));
-	info = &data->info;
+		if (ret) {
+			/* Two rails are connected. */
+			data->info.pages = MP2975_PAGE_NUM;
+			data->info.phases[1] = ret;
+			data->info.func[1] = MP2971_RAIL2_FUNC;
+		}
 
-	/* Identify multiphase configuration for rail 2. */
-	ret = mp2975_identify_multiphase_rail2(client);
-	if (ret < 0)
-		return ret;
+		/* Identify multiphase configuration. */
+		ret = mp2971_identify_multiphase(client, data, info);
+		if (ret)
+			return ret;
 
-	if (ret) {
-		/* Two rails are connected. */
-		data->info.pages = MP2975_PAGE_NUM;
-		data->info.phases[1] = ret;
-		data->info.func[1] = MP2975_RAIL2_FUNC;
-	}
+		/* Identify VID setting per rail. */
+		ret = mp2971_identify_rails_vid(client, data, info);
+		if (ret < 0)
+			return ret;
 
-	/* Identify multiphase configuration. */
-	ret = mp2975_identify_multiphase(client, data, info);
-	if (ret)
-		return ret;
+		/* Identify vout format. */
+		ret = mp2971_identify_vout_format(client, data, info);
+		if (ret < 0)
+			return ret;
 
-	/* Identify VID setting per rail. */
-	ret = mp2975_identify_rails_vid(client, data, info);
-	if (ret < 0)
-		return ret;
+	} else {
+		struct mp2975_data *data;
 
-	/* Obtain current sense gain of power stage. */
-	ret = mp2975_current_sense_gain_get(client, data);
-	if (ret)
-		return ret;
+		data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
+					GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
 
-	/* Obtain voltage reference values. */
-	ret = mp2975_vref_get(client, data, info);
-	if (ret)
-		return ret;
+		memcpy(&data->info, &mp2975_info, sizeof(*info));
+		info = &data->info;
 
-	/* Obtain vout over-voltage scales. */
-	ret = mp2975_vout_ov_scale_get(client, data, info);
-	if (ret < 0)
-		return ret;
+		/* Identify multiphase configuration for rail 2. */
+		ret = mp2975_identify_multiphase_rail2(client);
+		if (ret < 0)
+			return ret;
 
-	/* Obtain offsets, maximum and format for vout. */
-	ret = mp2975_vout_per_rail_config_get(client, data, info);
-	if (ret)
-		return ret;
+		if (ret) {
+			/* Two rails are connected. */
+			data->info.pages = MP2975_PAGE_NUM;
+			data->info.phases[1] = ret;
+			data->info.func[1] = MP2975_RAIL2_FUNC;
+		}
+
+		/* Identify multiphase configuration. */
+		ret = mp2975_identify_multiphase(client, data, info);
+		if (ret)
+			return ret;
+
+		/* Identify VID setting per rail. */
+		ret = mp2975_identify_rails_vid(client, data, info);
+		if (ret < 0)
+			return ret;
+
+		/* Obtain current sense gain of power stage. */
+		ret = mp2975_current_sense_gain_get(client, data);
+		if (ret)
+			return ret;
+
+		/* Obtain voltage reference values. */
+		ret = mp2975_vref_get(client, data, info);
+		if (ret)
+			return ret;
+
+		/* Obtain vout over-voltage scales. */
+		ret = mp2975_vout_ov_scale_get(client, data, info);
+		if (ret < 0)
+			return ret;
+
+		/* Obtain offsets, maximum and format for vout. */
+		ret = mp2975_vout_per_rail_config_get(client, data, info);
+		if (ret)
+			return ret;
+	}
 
 	return pmbus_do_probe(client, info);
 }
 
+static const struct mp2971_device_info mp2971_device_info = {
+	.imvp9_en_r1_mask = BIT(14),
+	.imvp9_en_r2_mask = BIT(13),
+	.max_phase_rail1 = 8,
+	.max_phase_rail2 = 4,
+};
+
 static const struct i2c_device_id mp2975_id[] = {
+	{"mp2971", (kernel_ulong_t)&mp2971_device_info },
+	{"mp2973", (kernel_ulong_t)&mp2971_device_info },
 	{"mp2975", 0},
 	{}
 };
-- 
2.25.1

