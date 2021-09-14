Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471D40A8C6
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 10:05:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7wrJ1Vfrz2yHZ
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 18:05:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=tQ8TEthZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_ggregory@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=tQ8TEthZ; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7wqs1jw1z2xtM
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:04:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1631606697; x=1663142697;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=U4Eu5YXzbc/fR5IFrEVQemVq88r+s4JWXG6JgDyyViQ=;
 b=tQ8TEthZ4i9IJirf2jBk9mJH9fq0dv0TBVqdmu+UoqegXDUBEUYD6X/s
 D3UJcnW2PtLghgbItDMmozGY3vEJQcx87UbssRSCvB2ys+o4h++zieJMZ
 VvCMNap++3QKnhONUGBJoBTcdPjSq2wNpU1m62Jk+4BNPN1AquuXvfG8F g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 14 Sep 2021 01:03:54 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 01:03:53 -0700
Received: from [10.111.139.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 14 Sep 2021
 01:03:53 -0700
Subject: Re: CCLA for Qualcomm Inovation Center Inc.
To: Zev Weiss <zweiss@equinix.com>
References: <bcca2ce7-23ab-c76f-f78e-c3a133396254@quicinc.com>
 <20210913234003.GK17315@packtop>
From: Graeme Gregory <quic_ggregory@quicinc.com>
Message-ID: <14f9a853-aa93-47d1-0975-2d9d456e098d@quicinc.com>
Date: Tue, 14 Sep 2021 09:03:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913234003.GK17315@packtop>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

You are correct, Ill get that fixed and re-submit. (I must have read 
that 10,000 times and missed that)

Thanks

Graeme

On 14/09/2021 00:40, Zev Weiss wrote:
> I'm not involved with the CLA process, but FWIW it looks like there's a
> typo (missing 'r') in your email address on page 1.
>
>
> Zev
>
> On Mon, Sep 13, 2021 at 09:12:01AM PDT, Graeme Gregory wrote:
>> Please find our CCLA attached for the OpenBMC project.
>>
>> Thanks
>>
>> Graeme
>>
