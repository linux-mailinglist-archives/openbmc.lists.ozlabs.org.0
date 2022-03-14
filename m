Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC04D8B88
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 19:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHPtK28lyz30C2
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 05:18:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=wUu9G8mR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=wUu9G8mR; dkim-atps=neutral
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Tue, 15 Mar 2022 05:18:12 AEDT
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHPsw3B3dz2xC6
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 05:18:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647281892; x=1678817892;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=guV8D/zoqDzwVA8g73Md7rMeJWwPReKW2B+3M1C5VXE=;
 b=wUu9G8mRpEEHQYmygubYw3OiDxs2I5e0GH6js8e9TFoQnZPloCn3Oyz1
 2DCiLsQYz7nG1amchV4m1DmKLfKWFLAy1pi6/3+nnQse97z6T9Wuv4VL2
 TDN2MDVD45Hg0zg0twWrE+ExyY7N7QV98LdwUncxpgA3dAOHFI81aauOE U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2022 11:16:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:16:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Mar 2022 11:16:01 -0700
Received: from [10.110.69.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 14 Mar
 2022 11:16:00 -0700
Message-ID: <7cd9301f-f417-e555-6025-74acfc53598a@quicinc.com>
Date: Mon, 14 Mar 2022 11:15:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, Corey Minyard
 <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Wolfram Sang
 <wsa@kernel.org>, <openipmi-developer@lists.sourceforge.net>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-2-quan@os.amperecomputing.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <20220310114119.13736-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Quan,

[...]

> +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> +	    ssif_bmc->state == SSIF_RES_SENDING) {
> +		ssif_bmc->state = SSIF_BAD_SMBUS;
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));

It will print out that the case happens in SSIF_BAD_SMBUS state always
because ssif_bmc->state is already assigned as SSIF_BAD_SMBUS above.
Move the assignment to after the dev_warn printing.

[...]

> +static const struct of_device_id ssif_bmc_match[] = {
> +	{ .compatible = "ampere,ssif-bmc" },

Does this driver have any Ampere specific handling? If not, it could be
"ssif-bmc" as a generic SSIF driver.

> +	{ },
> +};

Add 'MODULE_DEVICE_TABLE(of, ssif_bmc_match);'

> +
> +static const struct i2c_device_id ssif_bmc_id[] = {
> +	{ DEVICE_NAME, 0 },
> +	{ },
> +};
> +

Remove this blank line.

> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
> +
> +static struct i2c_driver ssif_bmc_driver = {
> +	.driver         = {
> +		.name           = DEVICE_NAME,
> +		.of_match_table = ssif_bmc_match,
> +	},
> +	.probe          = ssif_bmc_probe,
> +	.remove         = ssif_bmc_remove,
> +	.id_table       = ssif_bmc_id,
> +};
> +

Remove this blank line too.

-Jae

> +module_i2c_driver(ssif_bmc_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
> +MODULE_LICENSE("GPL");

[...]
