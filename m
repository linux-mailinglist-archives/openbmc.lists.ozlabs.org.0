Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B355351187C
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 15:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpKp741zZz3bdj
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 23:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=oKPjZqJv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=oKPjZqJv; dkim-atps=neutral
X-Greylist: delayed 501 seconds by postgrey-1.36 at boromir;
 Wed, 27 Apr 2022 23:47:30 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpKnG2Gjnz3bd8
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 23:47:30 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1C0CE4144F
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-type:content-type:subject
 :subject:from:from:content-language:user-agent:mime-version:date
 :date:message-id:received:received:received; s=mta-01; t=
 1651066742; x=1652881143; bh=uh2NzoX7tTr+JSZU4TyclxfCHhVIfpec8BV
 bX6xdl0w=; b=oKPjZqJvyh+y+/6ixjGxy7sQcFwxh55KhRKYJyNERePIiUiF8Vp
 jG0FVsab0bLILy04knlc60D8XXa/oV9f+vUNwiKD2CPH0flh3T9epF9JreuAOFZ1
 TAQTICVuSZcnhUFzHbsfogBBeEmi5g4FT4LjvDLHWO47wMF5TjVphOCU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4n9ybyeLO2K5 for <openbmc@lists.ozlabs.org>;
 Wed, 27 Apr 2022 16:39:02 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5C961413CB
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 16:39:02 +0300 (MSK)
Received: from [10.178.113.33] (10.178.113.33) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 27
 Apr 2022 16:39:02 +0300
Message-ID: <7a071d50-b581-2623-d439-d134f805f228@yadro.com>
Date: Wed, 27 Apr 2022 16:39:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: OpenBMC MailList OZLabs <openbmc@lists.ozlabs.org>, "Brad Bishop (Code
 Review)" <gerrit@openbmc-project.xyz>
From: i.kononenko <i.kononenko@yadro.com>
Subject: phosphor-misc: CI Build failure
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello.                                                                  

Today I was received notice of the phosphor-misc CI build failed due to 
many `shellcheck` verify failed.  The last build (where CI fail was     
found) related to the gerrit change [1] according add support RNDIS and 
EEM network feature, but `shellchek` raise too many error about another 
code that hasn't been changed.                                          
Was I'm miss some changed about Jenkins CI-manifest of phosphor-misc    
that was come most recently? How far I can see the previous changes  
was building successful [2].  Can someone provide link to conversation  
(if it was) related to the phoshpor-misc CI changes?                    
                                                                        
To resolve the issue I'd suggests one of bellow ways:                   
* Disable shellcheck to the `phosphor-misc` via .eslintignore 
* Fix sellcheck errors (preferred).                                         
                                                                        
Thanks.                                                                 
                                                                        
Links:                                                                  
                                                                        
[1] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-misc/+/53279  
[3] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-misc/+/48292 

-- 
Best regards,

Igor Kononenko
