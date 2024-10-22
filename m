Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 597E59AB870
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 23:32:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY54G71F9z3c89
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 08:32:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.68
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729632748;
	cv=none; b=XADU0E5vG943y84Ku2zaKk8R0AWOBbq52D1qrcZC2F8+czFYe56pjpjF2PffE9pYx0+KplSFsaC1tJfnVIvyDz6cCX22PrqiTau1hO6M2lWCeh0aiAZiXClwXTroe4x8wgelq9H7U0p6AVt7B4s35baE902jqfTVdA+iLMlPNM3c+C/ny5mg8liL4IVvGTrt6ByaiUrI6qMNvlWktTU2vkSLX5DuVi6REJ853ny0C3TTpGMKm8DIAKpncS6BNpxl0oIQ7337q0SjEi6NC4Qv1h4CRSp3R9mwL2GZOB9fN4+jKriCsGo1cQguWAJA9bJHAAIGHCeU7xuLrvOBg9ljoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729632748; c=relaxed/relaxed;
	bh=jbeACBlKmPATg9TY9lfakh5orbRiwjpJqN6f+njt1iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/nNDFBGr4JHMZ2F/9/Xx6L3ftTTs47IIAtsJ5Swr62+l5pEm+HCgh72a+9A+jKekHszNGiBHtCK6IvE5iHtn/PA5YQ6I40nf6444wB6AXbHF8PPuj0Si4vFZIC/z027oDnWcnmg6nobK5c8SFgvnnXZZsUJlJOIPiAAuze6I0uJVLrt5I3xYkvCHb56YlWzeMAPTnhWW8cJgrBu9Pb3QcLCBzZVUMkkriiyc8POchdliQLqu1HnHmbzPAS7Otn9wAlDV0i60/Vi6bAolOXi1/10h+Gkw8WvuLTN+0X+JyOw52mfiABNXFAI0i+Il1AlIkblSMvyrNebqRLa49EWwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=E4xyxVML; dkim-atps=neutral; spf=pass (client-ip=80.12.242.68; helo=msa.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=E4xyxVML;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.68; helo=msa.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 51048 seconds by postgrey-1.37 at boromir; Wed, 23 Oct 2024 08:32:26 AEDT
Received: from msa.smtpout.orange.fr (smtp-68.smtpout.orange.fr [80.12.242.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XY54B0j9Nz2xjv
	for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2024 08:32:23 +1100 (AEDT)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 39BptoyFQvtq839BptCJaI; Tue, 22 Oct 2024 09:20:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729581629;
	bh=jbeACBlKmPATg9TY9lfakh5orbRiwjpJqN6f+njt1iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=E4xyxVMLGKUcuxP9Sl0vRgZc8l0ppDa1X8iJXl/F+xBewJYFCUrXgS+sUyBezfk5U
	 Uo810xRWboULP0HeTAVTmKN19iCzuPNiAkfW32RFTzPSYKvkgO5Z/s5gze4X6u0nMq
	 UN+sn1Rt6q2kL1shkVZv7RYhi5OrX/sC3CxWjkTAkzau2dHj01iI6NJrjwRvqhc8pU
	 fQ/9FChq06JTrKg16ixQo8zC0l55lsoCRNi+ZSVHSMRx2xEPMK6tPpnnE4LuLe22yl
	 eUJXPrm/wgxLYv5tFrsUkcABOFbjShqMINvfVV90uT2xRwTHTvbm8vWUkXgAomPul8
	 E/bUg2KN5infw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 22 Oct 2024 09:20:29 +0200
X-ME-IP: 90.11.132.44
Message-ID: <2339841b-034b-440f-83ac-139d95059727@wanadoo.fr>
Date: Tue, 22 Oct 2024 09:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
To: baneric926@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 corbet@lwn.net
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
 <20241022052905.4062682-3-kcfeng0@nuvoton.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241022052905.4062682-3-kcfeng0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 22/10/2024 à 07:29, baneric926@gmail.com a écrit :
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> The NCT7363Y is a fan controller which provides up to 16
> independent FAN input monitors. It can report each FAN input count
> values. The NCT7363Y also provides up to 16 independent PWM
> outputs. Each PWM can output specific PWM signal by manual mode to
> control the FAN duty outside.
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---

Hi,

a few nitpick, should there be a v7 and if they make sense to you.

> +static const struct of_device_id nct7363_of_match[] = {
> +	{ .compatible = "nuvoton,nct7363", },
> +	{ .compatible = "nuvoton,nct7362", },
> +	{ },

Usually, a comma is not added after a terminator entry.

> +};
> +MODULE_DEVICE_TABLE(of, nct7363_of_match);
> +
> +struct nct7363_data {
> +	struct regmap		*regmap;
> +
> +	u16			fanin_mask;
> +	u16			pwm_mask;
> +};
> +
> +static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct nct7363_data *data = dev_get_drvdata(dev);
> +	unsigned int reg;
> +	u8 regval[2];
> +	int ret = 0;

No need to init.

> +	u16 cnt;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		/*
> +		 * High-byte register should be read first to latch
> +		 * synchronous low-byte value
> +		 */
> +		ret = regmap_bulk_read(data->regmap,
> +				       NCT7363_REG_FANINX_HVAL(channel),
> +				       &regval, 2);
> +		if (ret)
> +			return ret;
> +
> +		cnt = (regval[0] << 5) | (regval[1] & NCT7363_FANINX_LVAL_MASK);
> +		*val = fan_from_reg(cnt);
> +		return 0;
> +	case hwmon_fan_min:
> +		ret = regmap_bulk_read(data->regmap,
> +				       NCT7363_REG_FANINX_HL(channel),
> +				       &regval, 2);
> +		if (ret)
> +			return ret;
> +
> +		cnt = (regval[0] << 5) | (regval[1] & NCT7363_FANINX_LVAL_MASK);
> +		*val = fan_from_reg(cnt);
> +		return 0;
> +	case hwmon_fan_alarm:
> +		ret = regmap_read(data->regmap,
> +				  NCT7363_REG_LSRS(channel), &reg);
> +		if (ret)
> +			return ret;
> +
> +		*val = (long)ALARM_SEL(reg, channel) > 0 ? 1 : 0;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

...

> +static int nct7363_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *child;
> +	struct nct7363_data *data;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &nct7363_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	for_each_child_of_node(dev->of_node, child) {

for_each_child_of_node_scoped() to slightly simplify code and save a few 
lines?

> +		ret = nct7363_present_pwm_fanin(dev, child, data);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +	}
> +
> +	/* Initialize the chip */
> +	ret = nct7363_init_chip(data);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_info(dev, client->name, data,
> +						     &nct7363_chip_info, NULL);

return devm_hwmon_device_register_with_info()?

> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}

...

CJ

