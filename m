Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A7500013
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 22:39:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdvZw6FJfz3bZY
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 06:39:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=Z+RezcVY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=Z+RezcVY; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdvZX3MW0z2yb9
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 06:39:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649882340; x=1681418340;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gvprgQ1NrfC0fTCYfO8eqmoX0ESSbTtNg9ZvCrJhUp0=;
 b=Z+RezcVYlw725KMr8YsKJxo0SGr02tOvHqK9m/cGRQFucCqZbD9nTbTE
 iPU9RWH3mg1srKabdf9PgVrpD/UbpyMgvgJw/yctY+MHj1dOoubdoSl4U
 9A2wFfrS9EXNhCMyhg6dUqz72586q5kZrOaBhPK6oXYiBC7dG17LBzYM6 c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Apr 2022 13:38:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 13:38:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 13:38:57 -0700
Received: from [10.110.87.30] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Apr
 2022 13:38:57 -0700
Message-ID: <cb68c4a1-f3da-a3fe-5e56-4646ed083396@quicinc.com>
Date: Wed, 13 Apr 2022 13:38:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
 <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
 <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
 <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 quic_mkurapat@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/13/2022 1:27 PM, Patrick Williams wrote:
> On Wed, Apr 13, 2022 at 12:41:21PM -0700, Jae Hyun Yoo wrote:
>> On 4/13/2022 12:19 PM, Patrick Williams wrote:
>>> On Wed, Apr 13, 2022 at 09:59:16AM -0700, Jae Hyun Yoo wrote:
>>>> Hi Brad,
>>>>
>>>> On 3/14/2022 5:06 AM, Brad Bishop wrote:
>>>>> Hi Graeme
>>>>>
>>>>> On Tue, Mar 8, 2022, at 7:40 AM, Graeme Gregory wrote:
>>>>>> Hi, Please find attached updated CCLA with Updated Schedule A for
>>>>>> Qualcomm Inovation Center Inc.
>>>>>
>>>>> Accepted!  Thanks.
>>>>
>>>> I checked my email inbox and found that Qualcomm CCLA is accepted a
>>>> month ago, but CI build isn't triggered automatically if I submit a
>>>> change into Gerrit.
>>>>
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52577
>>>>
>>>> Should I make any additional request to make it available?
>>>
>>> Hello Jae.
>>>
>>> We should probably write up some better documentation on this process.
>>> When Brad "accepts" a CCLA update that just means he's put it into the
>>> Google Drive, AFAIK.  He doesn't do anything in Gerrit/Jenkins.
>>>
>>> What we need to do is:
>>>
>>> 1. Create a quic/ci-authorized-owners and quic/ci-authorized group in
>>>      Gerrit for your members.
>>>
>>> 2. Create a commit in openbmc-build-scripts to add quic/ci-authorized to
>>>      the Jenkins approved list.
>>>
>>> 3. Add everyone in the CLA to ci-authorized and the CLA Manager(s) to
>>>      ci-authorized-owners.
>>>
>>> 4. Retrigger your commit(s) in Jenkins so the approval process sees that
>>>      you are in a CLA group.
>>>
>>> In the meantime, I can manually "+1 Ok-To-Test" your EM commit above so
>>> that Jenkins will run on it.  Can you confirm 'quic' is what you want to
>>> see for your company CLA name and work on #2?  Andrew Geissler or I can
>>> take care of #1 and #3.
>>>
>>> See https://gerrit.openbmc-project.xyz/admin/groups for similar groups
>>> for other companies.
>>
>> Hello Patrick,
>>
>> Thank you for your kind explanation.
>> I tried to find a way of creating a new group in the
>> https://gerrit.openbmc-project.xyz/admin/groups but I can't find any.
>> Probably a permission issue?
>>
>> I would really appreciate it if you can take care of them. 'quic' is
>> what I want to see as the CLA name.
>>
>> Regards,
>> Jae
> 
> I've taken care of #1.  You are the only one that seems to have a Gerrit
> account, so I've done #3 the best I can.  It would be good if, at least,
> your CLA Manager could create a Gerrit account so that we can add them
> to the `quic/ci-authorized-owners` group and they can add new members
> themselves.
> 
> I've manually "+1 Ok-To-Test" your EM commit, as mentioned.  Waiting on
> you to take care of #2.  See this example commit:
> 
> https://github.com/openbmc/openbmc-build-scripts/commit/123ffbe91566073ecc73553cb32ddccf7a8a342e

Thank you so much for your help! I appreciate it.

I'll check #2 with my CLA manager.

Regards,
Jae
