Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06E444314
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 15:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkpVY2616z2xy3
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 01:07:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=pIgGKGdp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=pIgGKGdp; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkpV51WDqz2xDC
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 01:06:36 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 44F7E43C92;
 Wed,  3 Nov 2021 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1635948390; x=1637762791; bh=+rhtBwFwKcn3pjeF5BM9akn5G
 JcMiszp4xF7kX57de8=; b=pIgGKGdp1Rjcyx9zE52/Uzp7uCkFTL2sBGiy0vZ5C
 59Kor/wk8VN5ROfPbzK/4C36VZH1238gz/01AKbemZPWRU2Pk0UBRNK/LSo+cGVa
 /rY3SJMFDZCEYOUqPh0genVzr8tP4H1MCdc92kCFmHA8M/E8LUt8I0izq4cnginp
 yM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0V4MzAJPdwMH; Wed,  3 Nov 2021 17:06:30 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B427B43D0B;
 Wed,  3 Nov 2021 17:06:29 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 3 Nov
 2021 17:06:29 +0300
Message-ID: <fa95f2df7c92e64d099bbcf8f2781638c088b042.camel@yadro.com>
Subject: Re: [phosphor-host-ipmid] Questions about IPMI event message
From: Andrei Kartashev <a.kartashev@yadro.com>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Wed, 3 Nov 2021 17:06:28 +0300
In-Reply-To: <DM6PR08MB55142C3AE9871FB3700BD577DC8C9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55142C3AE9871FB3700BD577DC8C9@DM6PR08MB5514.namprd08.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.10.105]
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


Hi Chris,

> So, I have 2 questions for this and hope someone who had experience
> with this could share ideas with me, I'll appreciate it:
>    1. Why the event doesn't appear in the "var/log/ipmi_sel" or can't
> be seen by using "ipmitool sel elist"? I expected it should appear.

Disclaimer: here and below I talk only about file-based implementation
for logs.

It is known limitation. First of all, you should aware that there are
two completely different logs: Redfish Log and SEL log. When an
internal sensor triggers threshold event, two different messages are
sent: one for redfish log and another to SEL.

The sel-logger currently designed to only handle threshold events from
internal sensors, thus it requires dbus path to the sensor as an
argument for IpmiSelAdd. 
When you send external IPMI event/SEL add message, ipmi daemon doesn't
know how to handle it. Instead, intel-ipmi-oem, tries to parse the
event according to some rules and if it fails just adds this weird
"OpenBMC.0.1.SELEntryAdded,2C0401300109FFFF" to the redfish log, saying
"we got some ipmi event, but we don't know what is it".

I extended sel-logger with AddExt method, to store any random SEL entry
to /var/log/ipmi_sel, but this patches are for our internal Intel-BMC
fork and not applied for upstream version.
It is on my roadmap to update patches and submit them. If there is
demand for this work, I can try to prioritize it.

>    2. What does "Get SDR 0004 command failed: Invalid data field in
> request" mean?
> 
> Things to Note: 
>    1. The version of OprnBMC codebase I used is 2.10-rc1.
>    2. The image I built included "intel-ipmi-oem", "phosphor-logging",
> "phosphor-sel-logger", "rsyslog" and "entity-manager".
> 
> Thank you.
> 
> Regards,
> Chris Chen 
> Legal Disclaimer :
> The information contained in this message may be privileged and
> confidential. 
> It is intended to be read only by the individual or entity to whom it
> is addressed 
> or by their designee. If the reader of this message is not the intended
> recipient, 
> is strictly prohibited. If you have received this message in error, 
> please immediately notify the sender and delete or destroy any copy of
> this message!

-- 
Best regards,
Andrei Kartashev


