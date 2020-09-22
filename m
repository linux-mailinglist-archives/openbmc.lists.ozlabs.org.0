Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B2C273C9E
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 09:52:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwYS03BpjzDqZX
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 17:52:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=kdevO71J; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwYR941VGzDqSm
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 17:51:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4A73A542E0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 07:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1600761087; x=1602575488; bh=baHo+xACNs1YnkwX7aiFY07Ni
 zx3PJigKU6kZ7pZRgM=; b=kdevO71JH9g+GRMukRtOlwJ5wONe4V7X2Zn3RrAie
 7Z7wt0wC/WA3Hzqyo1HtcteT+jJeSFpYAHROG/U1FEKe22bcrDvbB6S1yzBbijdE
 XcHrDpRBTpHwA0mJ2QsrvNrI6639gDuixx5hS2X+6i6UWIbf6Yq2hI7c36y1XBlD
 kI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnO2ActiDSNh for <openbmc@lists.ozlabs.org>;
 Tue, 22 Sep 2020 10:51:27 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0749052215
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 10:51:27 +0300 (MSK)
Received: from [10.199.1.78] (10.199.1.78) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 22
 Sep 2020 10:51:26 +0300
Message-ID: <5be978dc22cab7b5443c7d256b1cc06a8350363f.camel@yadro.com>
Subject: Re: Read FRU of host through ipmi in Entity manager.
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Tue, 22 Sep 2020 10:51:25 +0300
In-Reply-To: <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.1.78]
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


>     Minor amendment again.  I'd much rather the IPMBSensor daemon
> simply
>     create the same interface that fru device does, rather than
> adding
>     IPMB logic to FruDevice.  In this way, platforms that don't have
> IPMB
>     don't need to include the feature at all.  Also, all the IO can
> be
>     managed in one place.
>     
> https://github.com/openbmc/dbus-sensors/blob/master/src/IpmbSensor.cpp
>     Ideally, your IPMB device would also have an SDR that details
> what
>     FRUs and sensors exist, so that the inventory can be read and
> posted
>     to DBus at startup.  If they don't then we might need a static
> mapping
>     from an EM config once the device on the other end is detected
> via get
>     device ID.
> 
> I agree with Ed here, all ipmb related interfaces should be
> implemented here.
> 


I disagree here.
First of all, IPMBSensor located in dbus-sensors package and it is
suppose to handle SENSORS. FRU is not sensor, it would be big illogical
mistake to put FruDevice code there.
Then there are already number of places in OpenBMC and related projects
uses FRU and implements encoding/decoding by its own. I already spend
lot of time debugging different behaviour of FruDevice and ipmitool...
You propose to fragment FRU handling code even more and I against this.
We at least should then extract data-source independent code from
FruDevice to a kind of library to use from different daemons. But I
prefer to do opposite - extract impb i/o code to library and use it
from both IPMBSensor and FruDevice.

-- 
Best regards,
Andrei Kartashev


