Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B362A3DF1AC
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 17:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfJwg4Jrqz3bW6
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 01:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=qo5nhp/T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=qo5nhp/T; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfJwQ1lrxz2yMy
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 01:40:06 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 429E74679F;
 Tue,  3 Aug 2021 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1628005202; x=1629819603; bh=HKd
 gNzduOATzxQmctt1q0UBRIL/fvOn6XEzFTdLIh1Y=; b=qo5nhp/Tyw1aJbdEdgd
 r4WDTxhbGfsobGarp7r4cIsKpKvAYTJpzpKEUzVrpLPhMmEY0Q1N9ruqDVubJz5z
 SSmAhDIsDVTRI3HUTUzeaIcV0sxLZ0TirCscdGuogUA9F9d/X5v5nPrrCGzFasUg
 bVGhFNGBFUNfl0AAqTnaqotM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTr4_R-aZhOM; Tue,  3 Aug 2021 18:40:02 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0F37D467A1;
 Tue,  3 Aug 2021 18:40:01 +0300 (MSK)
Received: from [10.199.0.39] (10.199.0.39) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 3 Aug
 2021 18:40:01 +0300
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <6631628004052@mail.yandex-team.ru>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <4354431a-0db6-fb9f-bc21-5ef34eba8852@yadro.com>
Date: Tue, 3 Aug 2021 18:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6631628004052@mail.yandex-team.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.39]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

On 03.08.2021 18:21, Konstantin Klubnichkin wrote:
> Works like a charm with all ISO I had on hands, thank you!

Konstantin,

Please note, I got feedback from some issues about using CDFS images.
I work to solve the issue of using such ISO formats.

-- 
Best regards,

Igor Kononenko
