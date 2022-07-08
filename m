Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B732456B29E
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 08:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfNRB4YWGz3bmG
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 16:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=v4YDSrJ2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.39; helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=v4YDSrJ2;
	dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfNQn0FlTz3bwb
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 16:19:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657261153; x=1688797153;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZY0x7dk+Gc7pn/WNtWO0wIvv8OFYt5gfRfcLliYICiY=;
  b=v4YDSrJ2KHcOpVVdRpRZrt+FMAH8DETZ+nfJx5CvdKZHDuMSqN2T0SRQ
   ns8Wr0dZHqYN4j0Twhgs1IYS2JWmBxsq6Fw419WdpsvDzIghTVbz4BBpp
   2KEsqUFaY3/ed5BLsUOASBnnwcSVMSsL0rIo+awNUjb9cphhCEh9vmniZ
   8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jul 2022 23:19:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 23:19:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 23:19:09 -0700
Received: from [10.110.82.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Jul 2022
 23:19:08 -0700
Message-ID: <1886706d-222d-a3b1-d015-0119f66b31f1@quicinc.com>
Date: Thu, 7 Jul 2022 23:19:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] board: qualcomm:
 dc-scm-v1: add initial version of Qualcomm DC-SCM V1 board
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
 <20220707223058.2722999-3-quic_jaehyoo@quicinc.com>
 <CACPK8XdaSPTyH8c0wd5ZTiJxvbWZ+9bWdcQ9bih6wCVFbsv17Q@mail.gmail.com>
 <6e3fe4e2-e32a-36a1-2c9f-e0e3b22c5462@quicinc.com>
 <CACPK8Xea69=c63cq+oBnRtiogaGRU4TCnjUazSitdqWrnZkOVw@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8Xea69=c63cq+oBnRtiogaGRU4TCnjUazSitdqWrnZkOVw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/7/2022 11:11 PM, Joel Stanley wrote:
[...]

>> Yes, this part can be changed like you suggested but this board specific
>> code needs to be added since other implementations are also in the queue
>> such as other gpio handling code, default fan speed setting, FRU
>> parsing, MAC address setting and NC-SI fdt overriding so I want to add
>> this set as is as an initial commit.
> 
> Okay. I'll merge this series and we can see how it evolves from there.
> 
> We should consider doing future development on the upstream list, and
> backporting from there.

Thanks, Joel!

I'll consider doing the new u-boot upstreaming flow like what we are
doing for linux.

-Jae
