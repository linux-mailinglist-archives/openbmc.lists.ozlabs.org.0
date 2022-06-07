Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08355400B9
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 16:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHXHr2ldzz3bqk
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 00:07:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=RG+kBduT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.38; helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=RG+kBduT;
	dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHXHM33Nqz30Bl
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 00:07:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654610847; x=1686146847;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7/99ZoEP92Xd38Q/DJIo/DuodwOHLrle5XaHv4gQVyQ=;
  b=RG+kBduTMP5oZzD3/PUAJflYzk97ELVD0/7vdjhRWHt8a3CnJphFR9gv
   ajpkqAs9ZyxMTus1Rx8Z1uafdtJUGkuvt3jclZrcxrFfqeALriwOlLpR3
   PlyRzfW/epveH9ooPlmRRg2OgYqtvkL79W4YwPqZEPztPBfz8Isipw810
   A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jun 2022 07:07:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 07:07:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 7 Jun 2022 07:07:23 -0700
Received: from [10.110.118.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 7 Jun 2022
 07:07:22 -0700
Message-ID: <8dd33a7b-ccc0-27df-5be8-c57f91c644ed@quicinc.com>
Date: Tue, 7 Jun 2022 07:07:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
 <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com>
 <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 6/6/2022 6:05 PM, Joel Stanley wrote:
> On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Ping
>>
>> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>
>>> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
>>> equipped with Aspeed AST2600 BMC SoC.
>>>
>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>> ---
>>> Changes in v2:
>>> * Changed vendor name from Nuvia to Qualcomm.
>>>
>>>    arch/arm/dts/Makefile                   |   1 +
>>>    arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208 ++++++++++++++++++++++++
>>>    2 files changed, 209 insertions(+)
>>>    create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>
>>> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>> new file mode 100644
>>> index 000000000000..e966f739b708
>>> --- /dev/null
>>> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts

[...]

>>> +&i2c4 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c5_default>;
> 
> All of the pinctrl properties are set in the dtsi as of f2b82fa4ba17
> ("arm: dts: ast2600: Add I2C pinctrl"), so you can drop these.

Yes, I checked that the commit f2b82fa4ba17 was recently merged.
I'll drop I2C pinctrl settings from this dts.

Thanks,
Jae

>>> +};
>>> +
>>> +&i2c5 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c6_default>;
>>> +};
>>> +
>>> +&i2c6 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c7_default>;
>>> +};
>>> +
>>> +&i2c7 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c8_default>;
>>> +};
>>> +
>>> +&i2c8 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c9_default>;
>>> +};
>>> +
>>> +&i2c9 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c10_default>;
>>> +};
>>> +
>>> +&i2c10 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c11_default>;
>>> +};
>>> +
>>> +&i2c12 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c13_default>;
>>> +};
>>> +
>>> +&i2c13 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c14_default>;
>>> +};
>>> +
>>> +&i2c14 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c15_default>;
>>> +};
>>> +
>>> +&i2c15 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c16_default>;
>>> +};
>>> +
>>> +&scu {
>>> +     mac0-clk-delay = <0x1d 0x1c
>>> +                       0x10 0x17
>>> +                       0x10 0x17>;
>>> +     mac1-clk-delay = <0x1d 0x10
>>> +                       0x10 0x10
>>> +                       0x10 0x10>;
>>> +     mac2-clk-delay = <0x0a 0x04
>>> +                       0x08 0x04
>>> +                       0x08 0x04>;
>>> +     mac3-clk-delay = <0x0a 0x04
>>> +                       0x08 0x04
>>> +                       0x08 0x04>;
>>> +};
