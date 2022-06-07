Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F05400BA
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 16:08:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHXJY3F1gz3bnM
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 00:08:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=FUeX19qr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=FUeX19qr;
	dkim-atps=neutral
X-Greylist: delayed 184 seconds by postgrey-1.36 at boromir; Wed, 08 Jun 2022 00:08:02 AEST
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHXJ22f0gz3blk
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 00:08:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654610882; x=1686146882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eVMJdNJwi+gctax6ZdrjbkXsxp+u+H8r9A68+avk7ak=;
  b=FUeX19qr8UdtQnGcX96U5hscMq+127H8GyvC8P49Hoqw+Hrx1huS87Zo
   ywvxAd+nuKW+DkIGAxmDm1mqT0jMtZc+LG66jaWCRhWzbPsSxsT1KdahB
   IaE50TbE26n6JdBF6mWwdd+jEAt3RJcsE5+UkEvlolprSjwe8pJqSlbeZ
   k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 07 Jun 2022 07:03:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 07:03:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 7 Jun 2022 07:03:53 -0700
Received: from [10.110.118.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 7 Jun 2022
 07:03:52 -0700
Message-ID: <09b467bf-2acc-1834-2143-e7e735a74b53@quicinc.com>
Date: Tue, 7 Jun 2022 07:03:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley
	<joel@jms.id.au>
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
 <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com>
 <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
 <dcf3bc8e-eaff-1469-e034-141aa0a4acf1@kaod.org>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <dcf3bc8e-eaff-1469-e034-141aa0a4acf1@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/7/2022 12:43 AM, Cédric Le Goater wrote:
> On 6/7/22 03:05, Joel Stanley wrote:
>> On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> 
>> wrote:
>>>
>>> Ping
>>>
>>> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
>>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>>
>>>> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
>>>> equipped with Aspeed AST2600 BMC SoC.
>>>>
>>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>> * Changed vendor name from Nuvia to Qualcomm.
>>>>
>>>>    arch/arm/dts/Makefile                   |   1 +
>>>>    arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208 
>>>> ++++++++++++++++++++++++
>>>>    2 files changed, 209 insertions(+)
>>>>    create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>>
>>>> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts 
>>>> b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>> new file mode 100644
>>>> index 000000000000..e966f739b708
>>>> --- /dev/null
>>>> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts

[...]

>>>> +&fmc {
>>>> +     status = "okay";
>>>> +
>>>> +     pinctrl-names = "default";
>>>> +     pinctrl-0 = <&pinctrl_fmcquad_default>;
>>>> +
>>>> +     flash@0 {
>>>> +             compatible = "spi-flash", "sst,w25q256";
>>
>> Compatible strings should go from the most general to the most
>> specific, so these are around the wrong way. I see you've probably
>> just copied the ast2600-evb which makes the same mistake.
>>
>> In the dtsi we have jedec,spi-nor which you overwrite here.
>>
>> u-boot has spi-flash but Linux uses jedec,spi-nor. I wonder if we
>> should update the aspeed driver to use that?
>>
>> Cédric, do you have thoughts here?
> 
> Yes. The closer we are to the Linux DT the better.
> 
> The "spi-flash" and "jedec,spi-nor" compatibles are equivalent for
> the SF driver in U-Boot. I think we can remove all the :
> 
>     compatible = "spi-flash", "sst,w25q256";
> 
> from the Aspeed dts files.
> 
> This fits what the latest U-Boot does.

I checked that it works without the compatible string. I'll drop the
line in v3.

Thanks,
Jae

