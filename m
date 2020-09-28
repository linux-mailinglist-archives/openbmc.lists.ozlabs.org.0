Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFD727B5C6
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 21:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0YCb2YWVzDqQ3
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 05:55:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=YEvgHqGM; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0YBc6DV0zDqPy
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 05:54:32 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 01ABA806F7;
 Mon, 28 Sep 2020 12:54:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 01ABA806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1601322870;
 bh=sGkRpcBST9LC+xjjrn4CFQ9goEA0PYNMFUf0dvtBOnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YEvgHqGMA+ZF6oup0za7/Js6X7qAjwMsjWgKEtdw8QTxW+iOCi20WdA0qrdNcg6/u
 dwFTCZ2RuafShATlxruk0dM+272xdGYiLxHrQ1kt/040lK2/Ac4Q/jdoT9jhxO8yEo
 uEXqpeCyGd4xwcTwg8nt+zKbA0Z/x3M5ngDxvr3c=
Date: Mon, 28 Sep 2020 14:54:23 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
Message-ID: <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 28, 2020 at 02:08:24PM CDT, Jae Hyun Yoo wrote:
>
>
>On 9/26/2020 2:27 PM, Zev Weiss wrote:
>>Zero-based numbering is more consistent with all other cpu/core
>>numbering I'm aware of (including the PECI spec).
>>
>>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>---
>>  drivers/hwmon/peci-cputemp.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
>>index b9fe91281d58..78e442f433a7 100644
>>--- a/drivers/hwmon/peci-cputemp.c
>>+++ b/drivers/hwmon/peci-cputemp.c
>>@@ -363,7 +363,7 @@ static int create_core_temp_label(struct peci_cputemp *priv, int idx)
>>  	if (!priv->coretemp_label[idx])
>>  		return -ENOMEM;
>>-	sprintf(priv->coretemp_label[idx], "Core %d", idx + 1);
>>+	sprintf(priv->coretemp_label[idx], "Core %d", idx);
>
>Differently from low level indexing, it's labeling for users and it
>should be synced with other temp or ADC sensors such as
>
>PVCCIN CPU1
>PVDQ ABC CPU1
>CPU1 P12V PVCCIN
>CPU1 VR Mem ABCD
>CPU1 VR P1V8
>
>These are using indexes starting from '1'.
>

OK, if it's for consistency with other existing drivers I suppose that's 
reasonable, though for my own reference, could you point me to where 
those are implemented?  Some rough grepping around the source tree 
didn't appear to turn up anything relevant.


Thanks,
Zev

