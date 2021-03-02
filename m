Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC132AC79
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 23:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqrzK26F5z3cPd
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 09:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=svzvzLeD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=svzvzLeD; dkim-atps=neutral
X-Greylist: delayed 398 seconds by postgrey-1.36 at boromir;
 Wed, 03 Mar 2021 09:14:53 AEDT
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqrz16K4Hz30Hw
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 09:14:53 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CBD69411F8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Mar 2021 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1614722887; x=1616537288; bh=fKG5FVnUQ1zA8156PotfuV8ByqfmV+R8
 5gGk3fLnlgI=; b=svzvzLeD0bxkzbCbsM4qLvSYWWppJMVelyDn4eGeJifX3Srp
 6lL9ofLIZ9/qJvw87/cylJVYKieCPg9wX2maaEHe1qiSbkr+1IIQ4UbyDtWKgeV7
 /1O8XSXaFo5OpylH9zzaR74WE8S0Yi1C6s4zypOhotqss5iOFHl7QvauKNA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w46d0Qs0YtPU for <openbmc@lists.ozlabs.org>;
 Wed,  3 Mar 2021 01:08:07 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C52DF41256
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 01:08:07 +0300 (MSK)
Received: from [10.199.0.22] (10.199.0.22) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 3 Mar
 2021 01:08:07 +0300
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: RPMS
Message-ID: <6ee37eca-0399-fc0d-8f76-1685167505fc@yadro.com>
Date: Wed, 3 Mar 2021 01:08:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.199.0.22]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi all!

I have just noticed that we use a wrong unit name for revolutions per 
minute.
The unit we use is called RPMS, which renders to "Revolution Per MinuteS".
The term RPM is already plural in nature and doesn't need the 'S' suffix.

I believe it needs to be renamed to just 'RPM', what do you think?

The unit is used very widely, so a lot of files in openbmc project
and a number of other project will need to be updated.

Do you think an issue on github is needed to capture this?

Thanks.

Alexander.

