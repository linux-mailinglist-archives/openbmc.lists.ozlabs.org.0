Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D831287271
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 12:21:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6S1G1HZWzDqVF
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 21:21:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=DCDaAwL6; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6S0Q01DzzDqQV
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 21:21:09 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 49FDC413A1;
 Thu,  8 Oct 2020 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1602152465; x=1603966866; bh=rHZ0ETZULz3Bro5BSLuaM3nKX
 dUyiBfv7oiLpR7DTX8=; b=DCDaAwL6itVRFEUIUEuPSZckwJUV59IPqlQf4Eajf
 Ha6Y8xTAiUw3qZJI5Wo030hvzzMPu8HpEvuqMN/kl4RrgopH38TkeXqtFEYqfW+3
 mWYpW83A8hFAdzwTOXj4kpqPppB99/bt+EHfeFAsIEv6buzGHHGC+gTMWrVZoCGI
 Lo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mx2iIsCAbi6N; Thu,  8 Oct 2020 13:21:05 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0F69041396;
 Thu,  8 Oct 2020 13:21:05 +0300 (MSK)
Received: from [10.199.0.226] (10.199.0.226) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Oct
 2020 13:21:04 +0300
Message-ID: <91aed88334a46dddc1c5dd5d7b9dc4f22057aef4.camel@yadro.com>
Subject: Re: Get inventory FRU from inventory system path
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <john.chung@mic.com.tw>, <openbmc@lists.ozlabs.org>
Date: Thu, 8 Oct 2020 13:21:03 +0300
In-Reply-To: <51d45e4a6b29485397e4cb60a7aea907@mic.com.tw>
References: <270220206437441ba7ba4eb39336f9e4@mic.com.tw>
 <28750e605f477d8901ae61da8b0753aba8b78b46.camel@yadro.com>
 <51d45e4a6b29485397e4cb60a7aea907@mic.com.tw>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.226]
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

On Thu, 2020-10-08 at 10:09 +0000, john.chung@mic.com.tw wrote:
> Hi Andrei,
> 
> > What are you trying to achieve?
> I am trying to display the system information section in phosphor-
> webui.
> This section would call the 'getServerInfo' function. 
> The function would need to using the
> "/xyz/openbmc_project/inventory/system" path.
> 
> > The REST API do just a translation to dbus, so you expect to get
> > exactly what EntityManager (or other inventory-related daemon)
> > expose.
> > And EM expose nothing to /xyz/openbmc_project/inventory/system
> Yes, I want to get exactly what EntityManager (or other inventory-
> related daemon) expose.
> But it's null for this dbus path now.

Right, there is no info there, /xyz/openbmc_project/inventory/system is
kind of parent node, id doesn't store any information. That is how EM
works.
In our system we use our custom interface for baseboard to provide this
kind of information.



> -----Original Message-----
> From: Andrei Kartashev [mailto:a.kartashev@yadro.com] 
> Sent: Thursday, October 8, 2020 5:58 PM
> To: john.chung (鍾佳航 - MCT) <john.chung@mic.com.tw>; 
> openbmc@lists.ozlabs.org
> Subject: Re: Get inventory FRU from inventory system path
> 
> Hi John,
> 
> What are you trying to achieve?
> The REST API do just a translation to dbus, so you expect to get
> exactly what EntityManager (or other inventory-related daemon)
> expose.
> And EM expose nothing to /xyz/openbmc_project/inventory/system
> 
> On Thu, 2020-10-08 at 08:53 +0000, john.chung@mic.com.tw wrote:
> > Hi,
> >  
> > I am trying to get the data from this path “ 
> > https://<bmcip>/xyz/openbmc_project/inventory/system”.
> > But only get the following data from this path.
> >  
> > "/xyz/openbmc_project/inventory/system": {
> > "AssetTag": ""
> > },
> >  
> > Here is an example for this path which I expected to get.
> >  
> >     "/xyz/openbmc_project/inventory/system": {
> >         "BuildDate": "",
> >         "Cached": 0,
> >         "FieldReplaceable": 0,
> >         "Manufacturer": "",
> >         "Model": "2",
> >         "PartNumber": "0000000000000000",
> >         "Present": 1,
> >         "PrettyName": "",
> >         "SerialNumber": "0000000000000000"
> >     },
> >  
> >  
> >  
> > Only using entity-manager in my project for inventory FRU.
> > I could get the FRU data from this path “ 
> > https://<bmcip>/xyz/openbmc_project/inventory/system/board/<name>”
> > But the inventory system path is null.
> >  
> > Any setting I should set for getting FRU from this path?
> >  
> > Regards,
> > John Chung
> >  
> > This email message and all attachments transmitted with it are 
> > intended solely for the use of the intended recipient(s) and may 
> > contain legally privileged and confidential information. If you
> > are 
> > not the intended recipient of this email, you are hereby notified
> > that 
> > any disclosure, dissemination, distribution, copying, or other use
> > of 
> > this message, its attachments or any information contained therein
> > is 
> > strictly prohibited. If you have received this email in error,
> > please 
> > contact the sender immediately and please delete it and any 
> > attachments from your system. Computer viruses can be transmitted
> > via 
> > email. The sender accepts no liability for any damage caused by
> > any 
> > virus transmitted by this email. Thank you.
> --
> Best regards,
> Andrei Kartashev
> 
> 
> 
> 
> =====================================================================
> =======
> This email message and all attachments transmitted with it are
> intended solely for the use of the intended recipient(s) and may
> contain legally privileged and confidential information. If you are
> not the intended recipient of this email, you are hereby notified
> that any disclosure, dissemination, distribution, copying, or other
> use of this message, its attachments or any information contained
> therein is strictly prohibited. If you have received this email in
> error, please contact the sender immediately and please delete it and
> any attachments from your system. Computer viruses can be transmitted
> via email. The sender accepts no liability for any damage caused by
> any virus transmitted by this email. Thank you.
-- 
Best regards,
Andrei Kartashev


