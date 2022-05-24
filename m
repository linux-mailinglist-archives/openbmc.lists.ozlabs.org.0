Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21000532F4C
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 18:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L70jm0V0wz3blH
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 02:57:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=oPzfN81w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=oPzfN81w; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L70jK6BL0z3bf9
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 02:56:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653411414; x=1684947414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OrkxsTO7wNBIuevkyhtsof7KxqMQVAGCh1wbxVw+7SE=;
 b=oPzfN81wU0hbBld0h1GSwdxdubvEA1ey2F0lPiWccst8OuVR2SrkXArN
 e8s0gkUKIYmaRHjQfmY5VoClRoMdSUNTGk/7TmQE/aMg/9XTvs0c0K+Xn
 OwZg1OquVroh90Hmo9zAdZkOoiF2siQDZ85yHswQZQkyNnseq2Fx/rk1N k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 May 2022 09:56:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 09:56:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 09:56:51 -0700
Received: from [10.110.76.156] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 09:56:50 -0700
Message-ID: <c824bc87-8164-e582-f782-ef96fa19a97c@quicinc.com>
Date: Tue, 24 May 2022 09:56:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
 <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
 <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
 <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
 <cb68c4a1-f3da-a3fe-5e56-4646ed083396@quicinc.com>
 <20220414083338.7mfc5ql35kl253fr@ggregory-linuxws>
 <Yo0MKXgiWUP8QCYk@heinlein.stwcx.org.github.beta.tailscale.net>
 <b9c41541-dec9-9b3b-966e-c31070d8d3de@quicinc.com>
 <Yo0NrXEOm1/cmehS@heinlein.stwcx.org.github.beta.tailscale.net>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <Yo0NrXEOm1/cmehS@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 quic_mkurapat@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/24/2022 9:54 AM, Patrick Williams wrote:
> On Tue, May 24, 2022 at 09:52:16AM -0700, Jae Hyun Yoo wrote:
> 
>> That is completed by
>> https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/52930
> 
> Great!  I had forgotten.
> 
> I think everything is resolved then for QUIC?

I believe so. Thanks a lot for your help!

-Jae

