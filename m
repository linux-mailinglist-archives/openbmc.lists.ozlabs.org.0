Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 463B1649010
	for <lists+openbmc@lfdr.de>; Sat, 10 Dec 2022 18:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTwXV5qk9z3bjW
	for <lists+openbmc@lfdr.de>; Sun, 11 Dec 2022 04:55:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SOJLTQpL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SOJLTQpL;
	dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTwWs5PlNz3bbb
	for <openbmc@lists.ozlabs.org>; Sun, 11 Dec 2022 04:54:47 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so1427628oti.4
        for <openbmc@lists.ozlabs.org>; Sat, 10 Dec 2022 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDHX7cygh2F2PlO2m4bnZHnzuSLvlOnaM2jX4nIJQzw=;
        b=SOJLTQpLE09vvcDojeTNge63yNLUD0UaiCPOrep0tmcOiRaXWXqitDSepu1dgkT+Rm
         AbBjoP+xjfm9hIXzTlEzJoWtyUXAN9YKzxkP4s80Sn2BEDQGgcWqZDKJBZgWCM1WXaU2
         v+vrbLxf/6OGGBiNOEhb7r3JKMt2HUApuy0PkASkhGSKUwFZI7ftrbIhhJxZQGXJUIHC
         UUZqKV/0CeGnAGwTNC19GjksW49esa6zsVUlX8rAfZ30KKbL7w7D5eSxbbyXHgxyhRDI
         WiM+BYXb1bn157uoqTfT/0Rk+VKkZRW7ahz/4NXYDA+40xlh6V5dl07IWkmYGcC1c8G+
         Pg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDHX7cygh2F2PlO2m4bnZHnzuSLvlOnaM2jX4nIJQzw=;
        b=z048irorQUkVzKpcnTTozmOCJyFPKJhgdhzwnkg8U2Lm4Yy78Gy8t3uwDahIwWQhHe
         ziwfcbPdfZepZnLITojKhmQ6eBlo4NNG1DeYmaKracE22KrGRPvoNPvDxRPmfJnZ2LHL
         vEOISkxL/g0uLWApwWanlcmbInuGArTAb7uKxJ5d9+2PpkcAk7iTqpvL30hLLUQcBnQv
         GHkcXMtbd3iS6Xe4czwpJezPJoAjn7jIBVQpMv3uxIFL9E2//oJSoUk7OHkzXq+1h/PC
         oskG1yk+I4ayrM8tyqUEn+atMXaIuDNay1dpYgy0D5ePK8+j1cI6Tu5NPG5rG81iUuZP
         Gy3A==
X-Gm-Message-State: ANoB5pmCn7ZhKyTTIC3sUdHXS5wfkD3/+gQd3NFvdljpqV9FyW6DW82v
	vcRlbm2iJIJ5bIEnTYGPvB8=
X-Google-Smtp-Source: AA0mqf5cRz4eYx1FxpNwTMM7EODydd/U1dintZy3Wh6x5Ym0LXxGsiyA9ZELb96M6CcQlB+QRvvAUA==
X-Received: by 2002:a05:6830:2907:b0:66e:aece:1fc6 with SMTP id z7-20020a056830290700b0066eaece1fc6mr4678330otu.23.1670694883433;
        Sat, 10 Dec 2022 09:54:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m6-20020a05683026c600b00667ff6b7e9esm2114812otu.40.2022.12.10.09.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 09:54:43 -0800 (PST)
Message-ID: <c319b24e-a2bf-9516-5ae3-1b7da73862f7@roeck-us.net>
Date: Sat, 10 Dec 2022 09:54:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Wang Xiaohua <wangxiaohua.1217@bytedance.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 jdelvare@suse.com, openbmc@lists.ozlabs.org, joel@jms.id.au
References: <20221209024522.2102509-1-wangxiaohua.1217@bytedance.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH linux dev-6.0 v3] pmbus: Add mp2971/mp2973 support in
 mp2975
In-Reply-To: <20221209024522.2102509-1-wangxiaohua.1217@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/8/22 18:45, Wang Xiaohua wrote:
> Add mp2971/mp2973 support in mp2975
> 
> Tested with:
> My unit only include mp2971 and mp2973 devices
> MP2973:
> cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*label
> iin
> iout1
> iout2
> vin
> vout1
> vout2
> pin
> pout1
> pout2
> cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*input
> 0
> 82500
> 14000
> 12187
> 1787
> 1793
> 0
> 148000000
> 25000000
> 54000
> MP2971:
> cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*label
> iin
> iout1
> iout2
> vin
> vout1
> vout2
> pin
> pout1
> pout2
> cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*input
> 18500
> 22000
> 500
> 12187
> 1025
> 1800
> 226000000
> 22000000
> 1000000
> 55000
> 

Test results are not very useful. Better use something like
"grep . /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*".

Either case, test results should be provided after "---" and not be part
of the commit description. Instead, the commit description should explain
what those chips actually are.


> Signed-off-by: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
> 
> v2:
> - Fix auto build test WARNING
> 
> v3:
> - Fix incorrect return code
> ---
>   drivers/hwmon/pmbus/mp2975.c | 415 +++++++++++++++++++++++++++++++----
>   1 file changed, 374 insertions(+), 41 deletions(-)
> 

Update to Documentation/hwmon/mp2975.rst and
Documentation/devicetree/bindings/trivial-devices.yaml required.

However, there is a more severe problem: The changes are too complex
for me to review, and the chip datasheets are not published. I can not evaluate
if the changes are really needed, if there is a less complex solution,
or if they even make sense. Someone with access to a datasheet will have
to step up as maintainer for this driver.

Additional comments inline.

Guenter

> diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
> index 51986adfbf47..4d1b7ac1800e 100644
> --- a/drivers/hwmon/pmbus/mp2975.c
> +++ b/drivers/hwmon/pmbus/mp2975.c
> @@ -52,10 +52,33 @@
>   #define MP2975_MAX_PHASE_RAIL2	4
>   #define MP2975_PAGE_NUM		2
>   
> +#define MP2971_RAIL2_FUNC                                                      \
> +	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |          \
> +	 PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT)
> +
>   #define MP2975_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
>   				 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
>   				 PMBUS_HAVE_POUT | PMBUS_PHASE_VIRTUAL)
>   
> +struct mp2971_device_info {
> +	int max_phase_rail1;
> +	int max_phase_rail2;
> +	int imvp9_en_r1_mask;
> +	int imvp9_en_r2_mask;
> +};
> +
> +struct mp2971_data {
> +	struct pmbus_driver_info info;
> +	int vid_step[MP2975_PAGE_NUM];
> +	int vout_format[MP2975_PAGE_NUM];
> +	int vout_mode[MP2975_PAGE_NUM];
> +	int vout_exponent[MP2975_PAGE_NUM];
> +	int max_phase_rail1;
> +	int max_phase_rail2;
> +	int imvp9_en_r1_mask;
> +	int imvp9_en_r2_mask;
> +};
> +
>   struct mp2975_data {
>   	struct pmbus_driver_info info;
>   	int vout_scale;
> @@ -68,6 +91,9 @@ struct mp2975_data {
>   	int curr_sense_gain[MP2975_PAGE_NUM];
>   };
>   
> +static const struct i2c_device_id mp2975_id[];
> +
> +#define to_mp2971_data(x) container_of(x, struct mp2971_data, info)
>   #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
>   
>   static int mp2975_read_byte_data(struct i2c_client *client, int page, int reg)
> @@ -95,6 +121,40 @@ mp2975_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
>   	return (ret > 0) ? ret & mask : ret;
>   }
>   
> +static int
> +mp2971_linear2direct(struct mp2971_data *data, int page, int val)
> +{
> +	/* simple case */
> +	if (val == 0)
> +		return 0;
> +
> +	/* LINEAR16 does not support negative voltages */
> +	if (val < 0)
> +		return 0;
> +
> +	/*
> +	 * For a static exponents, we don't have a choice
> +	 * but to adjust the value to it.
> +	 */
> +
> +	if (data->vout_exponent[page] < 0)
> +		val <<= -data->vout_exponent[page];
> +	else
> +		val >>= data->vout_exponent[page];
> +	return clamp_val(val, 0, 0xffff);
> +}
> +
> +static int
> +mp2971_vid2direct(struct mp2971_data *data, int page, int val)
> +{
> +	int vrf = data->info.vrm_version[page];
> +
> +	if (vrf == imvp9)
> +		return (val + 29) * data->vid_step[page];
> +
> +	return (val + 49) * data->vid_step[page];
> +}
> +

This looks suspicious. VID -> voltage calculations should be well
defined and be implemented in mp2975_vid2direct(). It is not entirely
clear why a second conversion function should be needed, and why it would
use different calculations with different results than those for
mp2975.

Example, for vrf == imvp9, 10mV step size, and vid==1:

mp2971: (1 + 29) * 10 = 30 * 10 = 300
mp2975: 200 + (1 - 1) * 10 = 200 + 0 = 200

vid = 0xff = 255:

mp2971: (255 + 29) * 10 = 284 * 10 = 2840
mp2975: 200 + (255 - 1) * 10 = 200 + 254 * 10 = 2740

Also questionable is how there could ever be an IMVP9 setting with 5mV
step size since IMVP9 explicitly specifies a step size of 10mV.
Also, the maximum voltage for IMVP9 is specified as 2.74V.

>   static int
>   mp2975_vid2direct(int vrf, int val)
>   {
> @@ -214,6 +274,74 @@ mp2975_read_phases(struct i2c_client *client, struct mp2975_data *data,
>   	return ret;
>   }
>   
> +static int
> +mp2971_read_word_data(struct i2c_client *client, int page,
> +				int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2971_data *data = to_mp2971_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +	case PMBUS_READ_IOUT:
> +		ret = mp2975_read_word_helper(client, page, phase,
> +						 reg, GENMASK(15, 0));
> +		break;
> +	case PMBUS_READ_VOUT:
> +		ret = mp2975_read_word_helper(client, page, phase, reg,
> +					      GENMASK(11, 0));
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * READ_VOUT can be provided in VID or direct format. The
> +		 * format type is specified by bit 15 of the register
> +		 * MP2971_MFR_DC_LOOP_CTRL. The driver enforces VOUT direct
> +		 * format, since device allows to set the different formats for
> +		 * the different rails and also all VOUT limits registers are
> +		 * provided in a direct format. In case format is VID - convert
> +		 * to direct.
> +		 */
> +		switch (data->vout_format[page]) {
> +		case linear:
> +			ret = mp2971_linear2direct(data, page, ret);
> +			break;
> +		case vid:
> +			ret = mp2971_vid2direct(data, page, ret);
> +			break;
> +		case direct:
> +			break;
> +		default:
> +			return -ENODATA;
> +		}
> +		break;
> +	case PMBUS_UT_WARN_LIMIT:
> +	case PMBUS_UT_FAULT_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_UC_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		return -ENXIO;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return ret;
> +}
> +

Much of that code seems duplicate from mp2975_read_word_data().
Without datasheets I can not determine if this really makes sense
and/or is needed, or if a single function can be used for all chips.

>   static int mp2975_read_word_data(struct i2c_client *client, int page,
>   				 int phase, int reg)
>   {
> @@ -365,6 +493,63 @@ mp2975_set_phase_rail2(struct pmbus_driver_info *info, int num_phases)
>   		info->pfunc[MP2975_MAX_PHASE_RAIL1 - i] = PMBUS_HAVE_IOUT;
>   }
>   
> +static int mp2971_identify_multiphase(struct i2c_client *client,
> +				      struct mp2971_data *data,
> +				      struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify multiphase for rail 1 - could be from 1 to 12. */
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONFIG_R1);
> +	if (ret <= 0)
> +		return ret;
> +
> +	info->phases[0] = ret & GENMASK(3, 0);
> +
> +	/*
> +	 * The device provides a total of 8 PWM pins, and can be configured
> +	 * to different phase count applications for rail 1 and rail 2.
> +	 * Rail 1 can be set to 8 phases, while rail 2 can only be set to 4
> +	 * phases at most. When rail 1’s phase count is configured as 0, rail
> +	 * 1 operates with 1-phase DCM. When rail 2 phase count is configured
> +	 * as 0, rail 2 is disabled.
> +	 */
> +	if (info->phases[0] > data->max_phase_rail1)
> +		return -EINVAL;
> +
> +	return 0;
> +}

Same here. The code is almost the same as mp2975_identify_multiphase().
Again, without datasheets I can not determine if this really makes sense
and/or is needed, or if a single function can be used for all chips.

This is a recurring problem. It appears that the patch maximizes the
changes against the current code instead of even trying to minimize them.
Without datasheet, it is impossible to compare the chips to check if an
implementation with fewer / less extensive changes would be warranted.

> +
> +static int
> +mp2971_identify_vid(struct i2c_client *client, struct mp2971_data *data,
> +			struct pmbus_driver_info *info, u32 reg, int page,
> +			u32 imvp_bit, u32 vr_bit)
> +{
> +	int ret;
> +
> +	/* Identify VID mode and step selection. */
> +	ret = i2c_smbus_read_word_data(client, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret & imvp_bit) {
> +		info->vrm_version[page] = imvp9;
> +		data->vid_step[page] = MP2975_PROT_DEV_OV_OFF;
> +	} else if (ret & vr_bit) {
> +		info->vrm_version[page] = vr12;
> +		data->vid_step[page] = MP2975_PROT_DEV_OV_ON;
> +	} else {
> +		info->vrm_version[page] = vr13;
> +		data->vid_step[page] = MP2975_PROT_DEV_OV_OFF;
> +	}
> +
> +	return 0;
> +}
> +
>   static int
>   mp2975_identify_multiphase(struct i2c_client *client, struct mp2975_data *data,
>   			   struct pmbus_driver_info *info)
> @@ -428,6 +613,68 @@ mp2975_identify_vid(struct i2c_client *client, struct mp2975_data *data,
>   	return 0;
>   }
>   
> +static int
> +mp2971_identify_rails_vid(struct i2c_client *client, struct mp2971_data *data,
> +				     struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify VID mode for rail 1. */
> +	ret = mp2971_identify_vid(client, data, info,
> +				  MP2975_MFR_VR_MULTI_CONFIG_R1, 0,
> +				  data->imvp9_en_r1_mask,
> +				  MP2975_VID_STEP_SEL_R1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify VID mode for rail 2, if connected. */
> +	if (info->phases[1])
> +		ret = mp2971_identify_vid(client, data, info,
> +					  MP2975_MFR_VR_MULTI_CONFIG_R2, 1,
> +					  data->imvp9_en_r2_mask,
> +					  MP2975_VID_STEP_SEL_R2);
> +	return ret;
> +}
> +
> +static int mp2971_identify_vout_format(struct i2c_client *client,
> +				       struct mp2971_data *data,
> +				       struct pmbus_driver_info *info)
> +{
> +	int i, ret, vout_mode;
> +
> +	for (i = 0; i < info->pages; i++) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
> +		if (ret < 0)
> +			return ret;
> +
> +		vout_mode = ret;
> +
> +		switch (vout_mode >> 5) {
> +		case 0:
> +			data->vout_format[i] = linear;
> +			data->vout_exponent[i] = ((s8)(vout_mode << 3)) >> 3;
> +			break;
> +		case 1:
> +			data->vout_format[i] = vid;
> +			break;
> +		case 2:
> +			data->vout_format[i] = direct;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +	}
> +	return 0;
> +}
> +
>   static int
>   mp2975_identify_rails_vid(struct i2c_client *client, struct mp2975_data *data,
>   			  struct pmbus_driver_info *info)
> @@ -659,6 +906,24 @@ mp2975_vout_per_rail_config_get(struct i2c_client *client,
>   	return 0;
>   }
>   
> +static struct pmbus_driver_info mp2971_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
> +		   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +	.read_byte_data = mp2975_read_byte_data,
> +	.read_word_data = mp2971_read_word_data,
> +};
> +
>   static struct pmbus_driver_info mp2975_info = {
>   	.pages = 1,
>   	.format[PSC_VOLTAGE_IN] = linear,
> @@ -683,63 +948,131 @@ static struct pmbus_driver_info mp2975_info = {
>   static int mp2975_probe(struct i2c_client *client)
>   {
>   	struct pmbus_driver_info *info;
> -	struct mp2975_data *data;
>   	int ret;
> +	char *name;
>   
> -	data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
> -			    GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> +	name = (char *)i2c_match_id(mp2975_id, client)->name;
>   
> -	memcpy(&data->info, &mp2975_info, sizeof(*info));
> -	info = &data->info;
> +	if (!name)
> +		return -EINVAL;
>   
> -	/* Identify multiphase configuration for rail 2. */
> -	ret = mp2975_identify_multiphase_rail2(client);
> -	if (ret < 0)
> -		return ret;
> +	if (!strcmp(name, "mp2971") || !strcmp(name, "mp2973")) {
> +		struct mp2971_data *data;
> +		struct mp2971_device_info *device_info;
>   
> -	if (ret) {
> -		/* Two rails are connected. */
> -		data->info.pages = MP2975_PAGE_NUM;
> -		data->info.phases[1] = ret;
> -		data->info.func[1] = MP2975_RAIL2_FUNC;
> -	}
> +		data = devm_kzalloc(&client->dev, sizeof(struct mp2971_data),
> +					GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
>   
> -	/* Identify multiphase configuration. */
> -	ret = mp2975_identify_multiphase(client, data, info);
> -	if (ret)
> -		return ret;
> +		device_info =
> +			(struct mp2971_device_info *)i2c_match_id(mp2975_id, client)
> +				->driver_data;
>   
> -	/* Identify VID setting per rail. */
> -	ret = mp2975_identify_rails_vid(client, data, info);
> -	if (ret < 0)
> -		return ret;
> +		memcpy(&data->info, &mp2971_info, sizeof(*info));
> +		info = &data->info;
>   
> -	/* Obtain current sense gain of power stage. */
> -	ret = mp2975_current_sense_gain_get(client, data);
> -	if (ret)
> -		return ret;
> +		if (device_info) {
> +			data->imvp9_en_r1_mask = device_info->imvp9_en_r1_mask;
> +			data->imvp9_en_r2_mask = device_info->imvp9_en_r2_mask;
> +			data->max_phase_rail1 = device_info->max_phase_rail1;
> +			data->max_phase_rail2 = device_info->max_phase_rail2;
> +		}
>   
> -	/* Obtain voltage reference values. */
> -	ret = mp2975_vref_get(client, data, info);
> -	if (ret)
> -		return ret;
> +		/* Identify multiphase configuration for rail 2. */
> +		ret = mp2975_identify_multiphase_rail2(client);
> +		if (ret < 0)
> +			return ret;
>   
> -	/* Obtain vout over-voltage scales. */
> -	ret = mp2975_vout_ov_scale_get(client, data, info);
> -	if (ret < 0)
> -		return ret;
> +		if (ret) {
> +			/* Two rails are connected. */
> +			data->info.pages = MP2975_PAGE_NUM;
> +			data->info.phases[1] = ret;
> +			data->info.func[1] = MP2971_RAIL2_FUNC;
> +		}
>   
> -	/* Obtain offsets, maximum and format for vout. */
> -	ret = mp2975_vout_per_rail_config_get(client, data, info);
> -	if (ret)
> -		return ret;
> +		/* Identify multiphase configuration. */
> +		ret = mp2971_identify_multiphase(client, data, info);
> +		if (ret)
> +			return ret;
> +
> +		/* Identify VID setting per rail. */
> +		ret = mp2971_identify_rails_vid(client, data, info);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Identify vout format. */
> +		ret = mp2971_identify_vout_format(client, data, info);
> +		if (ret < 0)
> +			return ret;
> +
> +	} else {
> +		struct mp2975_data *data;
> +
> +		data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
> +					GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
> +
> +		memcpy(&data->info, &mp2975_info, sizeof(*info));
> +		info = &data->info;
> +
> +		/* Identify multiphase configuration for rail 2. */
> +		ret = mp2975_identify_multiphase_rail2(client);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret) {
> +			/* Two rails are connected. */
> +			data->info.pages = MP2975_PAGE_NUM;
> +			data->info.phases[1] = ret;
> +			data->info.func[1] = MP2975_RAIL2_FUNC;
> +		}
> +
> +		/* Identify multiphase configuration. */
> +		ret = mp2975_identify_multiphase(client, data, info);
> +		if (ret)
> +			return ret;
> +
> +		/* Identify VID setting per rail. */
> +		ret = mp2975_identify_rails_vid(client, data, info);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Obtain current sense gain of power stage. */
> +		ret = mp2975_current_sense_gain_get(client, data);
> +		if (ret)
> +			return ret;
> +
> +		/* Obtain voltage reference values. */
> +		ret = mp2975_vref_get(client, data, info);
> +		if (ret)
> +			return ret;
> +
> +		/* Obtain vout over-voltage scales. */
> +		ret = mp2975_vout_ov_scale_get(client, data, info);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Obtain offsets, maximum and format for vout. */
> +		ret = mp2975_vout_per_rail_config_get(client, data, info);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	return pmbus_do_probe(client, info);
>   }
>   
> +static const struct mp2971_device_info mp2971_device_info = {
> +	.imvp9_en_r1_mask = BIT(14),
> +	.imvp9_en_r2_mask = BIT(13),
> +	.max_phase_rail1 = 8,
> +	.max_phase_rail2 = 4,
> +};
> +
>   static const struct i2c_device_id mp2975_id[] = {
> +	{"mp2971", (kernel_ulong_t)&mp2971_device_info },
> +	{"mp2973", (kernel_ulong_t)&mp2971_device_info },
>   	{"mp2975", 0},
>   	{}
>   };

