Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53897511C97
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 19:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpQdz1QYgz3bdB
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 03:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Ct7Dt0WR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Ct7Dt0WR; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpQdV67Vlz3bZ4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 03:26:06 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 95AD0413E3;
 Wed, 27 Apr 2022 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:references:content-language:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received
 :received; s=mta-01; t=1651080362; x=1652894763; bh=os1I4o4I9leF
 qvRWZuEirtglLPyYNnPyfwoVAjvORUs=; b=Ct7Dt0WRkJjS9ZPI5pMyqGklN7l6
 gLeHn2pLU/GAxF3Wwxs5QqX8CWdT4UOsPk6gMdBppZfxE2ST9qaiAo5Rp9Ibz+ZI
 hj1UYC7SBIwTjk05Fro77Prs4Fx+Jwrea5zTTiyEuZ5xNsRMWTMh1GSX4LwSX6pE
 nLKtUtbOTcmREMc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkq2xHFyz1Nb; Wed, 27 Apr 2022 20:26:02 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CE5FA413CB;
 Wed, 27 Apr 2022 20:26:01 +0300 (MSK)
Received: from [10.178.113.33] (10.178.113.33) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 27
 Apr 2022 20:26:01 +0300
Message-ID: <c8c5679d-f6f4-e10e-a64d-74cbe5505a01@yadro.com>
Date: Wed, 27 Apr 2022 20:26:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: phosphor-misc: CI Build failure
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <7a071d50-b581-2623-d439-d134f805f228@yadro.com>
 <Ymlrkt3HmnHuY1Ag@heinlein.stwcx.org.github.beta.tailscale.net>
From: i.kononenko <i.kononenko@yadro.com>
In-Reply-To: <Ymlrkt3HmnHuY1Ag@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.178.113.33]
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
Cc: "Brad Bishop \(Code Review\)" <gerrit@openbmc-project.xyz>,
 OpenBMC MailList OZLabs <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Patrick, thanks for response!


On 27.04.2022 19:13, Patrick Williams wrote:
> On Wed, Apr 27, 2022 at 04:39:01PM +0300, i.kononenko wrote:
>> Hello.                                                                  
>>
>> Today I was received notice of the phosphor-misc CI build failed due to 
>> many `shellcheck` verify failed.  The last build (where CI fail was     
>> found) related to the gerrit change [1] according add support RNDIS and 
>> EEM network feature, but `shellchek` raise too many error about another 
>> code that hasn't been changed.                                          
> 
> I took a look at the failure and it is not due to shellcheck.  We run
> shellcheck every where but it only fails the build if the .shellcheck
> file is present, which this repo does not have[1].
> 
> The failure here is that a more recent version of Meson is upset if
> options are passed which are not supported.  This appears to be the case
> in this repo:
> 
> ```
> /data0/jenkins/workspace/ci-repository/openbmc/phosphor-misc > meson configure build -Db_sanitize=address,undefined -Db_lundef=false
> 
> ERROR: Unknown options: "b_lundef, b_sanitize"
> ```

If I understand correctly, the b_lundef and b_sanitize options specifies in the unit-test.py [1].
Unfortunately, I still don't understand the origin of the error. 
Is the `-Db_sanitize=address,undefined -Db_lundef=false` semantic no longer supports in the meson 0.61.3?
I'm a little bit got confused. Could you provide some points where I would might to start to deal with the issue?

> 
> We'll need to clean up whatever is going on with the meson calls here.
> 
> 1. https://github.com/openbmc/openbmc-build-scripts/blob/ac5915f07d3b796f224c85477763ca7fe893dcc2/scripts/format-code.sh#L64
> 

Links:
1. https://github.com/openbmc/openbmc-build-scripts/blob/ac5915f07d3b796f224c85477763ca7fe893dcc2/scripts/unit-test.py#L997

-- 
Best regards,

Igor Kononenko
