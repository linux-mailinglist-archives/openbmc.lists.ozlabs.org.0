Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF157341A
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 12:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjYgx3qzKz3c3f
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 20:26:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=U16UfV5V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=U16UfV5V;
	dkim-atps=neutral
X-Greylist: delayed 537 seconds by postgrey-1.36 at boromir; Wed, 13 Jul 2022 20:26:14 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjYgV4Pjcz3c1l
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 20:26:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id C1D0B411F8
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:organization:from:from:references:content-language:subject
	:subject:user-agent:mime-version:date:date:message-id:received
	:received:received:received; s=mta-01; t=1657707431; x=
	1659521832; bh=YvqbvW/vQn3B1JfWtBZQLcK/V9m/tbwpuxhKaIqpCgo=; b=U
	16UfV5VUU3X5MwtlCHcgIXhny9RCnRSd3nPzBNthtSoOsZbSTjUEW6IOUj9JSV5E
	kBksDd8Urncq1cEjIrIUbjR1mTVgOkwXeplXlg8qOTi4caKwHy1OGkH5pBW6Ewsr
	nTC+s/k+UonavpVNUkcslnTCAtQOED+w6t4FhMCbCU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cc0E3c29KtwI for <openbmc@lists.ozlabs.org>;
	Wed, 13 Jul 2022 13:17:11 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 88CB3411D9
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 13:17:11 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 13 Jul 2022 13:17:11 +0300
Received: from [10.199.0.81] (10.199.0.81) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Wed, 13 Jul
 2022 13:17:11 +0300
Message-ID: <adb35a4e-718e-03b2-a562-2c2c6d59f3b0@yadro.com>
Date: Wed, 13 Jul 2022 13:17:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: dbus prefixes (was: DBus ObjectManager Interface usages within the
 project)
Content-Language: en-US
To: <openbmc@lists.ozlabs.org>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Organization: YADRO
In-Reply-To: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.81]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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

As a side note to this discussion, have we considered using shorter and 
more convenient paths for dbus?

I don't see any real reason for the project to be using this long and 
cumbersome /xyz/openbmc_project/ prefix.
Why not use just '/obmc/' or `/phosphor/` ? I believe that would be more 
than enough to separate all our services from any third-party ones on d-bus.

I understand why this prefixing is for in 'big' open desktop or server 
systems where there on d-bus can be any number of software from any 
number of vendors. In an embedded system, such as OpenBMC, on the 
contrary, the set of software using d-bus is strictly limited and we 
always know beforehand what prefixes are used. I'm pretty sure none of 
the software included into OpenBMC builds will ever use '/obmc' prefix. 
So why continue using the inconvenient long prefixes when it is safe to 
use short ones? I would even propose dropping all prefixes at all, but 
ok, let's pretend that there can be some other 3rd-party 'Inventory' 
than '/obmc/' ('/xyz/openbmc_project/').

Am I wrong or missing anything? What's stopping us from switching to a 
shorter prefix, aside from the existing code that will need to be 
changed to it?

The same proposal/question actually applies to service names (e.g. 
xyz.openbmc_project.ObjectMapper could easily become just 
obmc.ObjectMapper or phosphor.ObjectMapper), let alone just 'ObjectMapper'.

WBR, Alexander.

12.07.2022 21:48, Ed Tanous пишет:
> We've had a couple cases in the project where patches have needed to 
> be slowed down because of inconsistencies in our use of object 
> manager, so IMO, the time has come to make our usage of ObjectManager 
> consistent, documented, and drop support for the (not upstream) 
> daemons that don't follow the rules.  As part of this, we will port 
> forward all the upstream daemons to be consistent, and do our best to 
> avoid bugs, but this email is intended to inform those that have 
> non-upstream daemons about the change so they can resolve their 
> implementations.
>
> The basics:
> ObjectManager DBus interface will now be required for any daemon 
> implementing a Sensor.Value interface or Inventory.Item interface.
>
> Daemons producing sensors will be required to place their 
> ObjectManager at /xyz/openbmc_project/sensors
> Daemons producing inventory items will be required to place their 
> ObjectManager at /xyz/openbmc_project/inventory.
>
