Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D1265F03
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 13:49:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnvDm1GZszDqnw
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 21:49:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=sQ4WZH/p; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnvD03rRWzDqnR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 21:48:44 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5271F57546;
 Fri, 11 Sep 2020 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1599824918; x=1601639319; bh=q/C
 8xOnNJrbA0PJFTzR6Gjajgtpto/SxpIBSHUSpCTw=; b=sQ4WZH/p/tBEEgM5qw4
 iVqNMbOrc6BHMNasXe/aH2kuGSl0kDkRMrh3eXsT6H/N8zlI7wgZKFnhI92qiTHl
 8n71Fs/ubhaBuPncksdfYKDNjXLksM4nfg4mhj9zHvbahmWakN5MVhBP8RGNyiiZ
 bDNmwYoeL0ejyuMfO9Ra2xe4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8s5EjX9Bw0B; Fri, 11 Sep 2020 14:48:38 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E289857548;
 Fri, 11 Sep 2020 14:48:38 +0300 (MSK)
Received: from [10.199.0.18] (10.199.0.18) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 11
 Sep 2020 14:48:38 +0300
Subject: Re: Design proposal for dual BMC flash with "golden image"
To: <openbmc@lists.ozlabs.org>, Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 <yulei.sh@bytedance.com>
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
Date: Fri, 11 Sep 2020 14:48:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.18]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

Hi Lei!

11.09.2020 11:49, Lei Yu пишет:
> We are working on a system that has two BMC chips, and one of them is
> designed to be used as a golden image.
>
> The current OpenBMC does not support this usage, so a design proposal
> is sent to gerrit, please help to review if you are interested.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/36407
>
> Thanks!

We have this support implemented for YADRO VESNIN in our private repository.

Ivan will send a description of how it is implemented for us.

Alexander.

