Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D27532F3B
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 18:52:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L70cX3cTtz3bkb
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 02:52:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=sPerzwrh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=sPerzwrh; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L70c70fWyz3bdy
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 02:52:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653411143; x=1684947143;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zRyxshr+b+VpUSuoGOOymp2Dpq88aM6TwS9OQWwwHCA=;
 b=sPerzwrhqkfya07EaVcDSlPb7ot2wnF2Iml3YviJIf/lx6L0q+TU9qs1
 lzC35ujK9jA1LnGpd5oZfkB00ywotCFZJ5+cpLCfJ597jBs3oIQswlmAp
 Z/gkscyUpilld5qZKctVWF+9X/VJ91p5I05iPq/btLlx0WICg244rS3xW Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 May 2022 09:52:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 09:52:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 09:52:18 -0700
Received: from [10.110.76.156] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 09:52:17 -0700
Message-ID: <b9c41541-dec9-9b3b-966e-c31070d8d3de@quicinc.com>
Date: Tue, 24 May 2022 09:52:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>, Graeme Gregory
 <quic_ggregory@quicinc.com>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
 <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
 <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
 <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
 <cb68c4a1-f3da-a3fe-5e56-4646ed083396@quicinc.com>
 <20220414083338.7mfc5ql35kl253fr@ggregory-linuxws>
 <Yo0MKXgiWUP8QCYk@heinlein.stwcx.org.github.beta.tailscale.net>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <Yo0MKXgiWUP8QCYk@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: openbmc@lists.ozlabs.org, quic_mkurapat@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/24/2022 9:47 AM, Patrick Williams wrote:
> On Thu, Apr 14, 2022 at 09:33:38AM +0100, Graeme Gregory wrote:
>> On Wed, Apr 13, 2022 at 01:38:56PM -0700, Jae Hyun Yoo wrote:
>>> On 4/13/2022 1:27 PM, Patrick Williams wrote:
>>>> On Wed, Apr 13, 2022 at 12:41:21PM -0700, Jae Hyun Yoo wrote:
>>>>> On 4/13/2022 12:19 PM, Patrick Williams wrote:
>>>>>> On Wed, Apr 13, 2022 at 09:59:16AM -0700, Jae Hyun Yoo wrote:
> 
>>>>>> 2. Create a commit in openbmc-build-scripts to add quic/ci-authorized to
>>>>>>       the Jenkins approved list.
> ...
>>>> It would be good if, at least,
>>>> your CLA Manager could create a Gerrit account so that we can add them
>>>> to the `quic/ci-authorized-owners` group and they can add new members
>>>> themselves.
>>>>
>>>> I've manually "+1 Ok-To-Test" your EM commit, as mentioned.  Waiting on
>>>> you to take care of #2.  See this example commit:
>>>>
>>>> https://github.com/openbmc/openbmc-build-scripts/commit/123ffbe91566073ecc73553cb32ddccf7a8a342e
>>>
>>> Thank you so much for your help! I appreciate it.
>>>
>>> I'll check #2 with my CLA manager.
>>>
>>
>> I have created a gerrit account ID:1001418.
> 
> I've added Graeme to quic/ci-authorized-owners which gives him the
> ability to add/remove individuals to quic/ci-authorized as your CLA
> schedule A is updated.
> 
> Jae, are you still working on Jenkins commit (see openbmc-build-scripts
> link above)?

That is completed by 
https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/52930

Thanks!
Jae
