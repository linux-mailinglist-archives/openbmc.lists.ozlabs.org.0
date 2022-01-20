Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1311494A59
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 10:08:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfcB461Wvz30Q8
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 20:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=EyAcidUY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=EyAcidUY; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfc9j15tcz2xMQ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 20:08:08 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2269041849;
 Thu, 20 Jan 2022 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1642669681; x=1644484082; bh=M9z
 CuAk0VuDb47bO+3cScc9F+FaOcsxWHYxcmBCjrJg=; b=EyAcidUYmlsi7hMzzZT
 yPfe28nMVEk4BWv4WTxCum2YbHOia4faQ0H2LDjprY+ia65c3wcD/AderPAl62DK
 livGU4Mr86c/ClCAbvVdNrYKTVCxPO3opzHYgYrDXueynMQnmxuTk2mrZ/LvTwq2
 rLwXfkxLBCVOHGqhDds6cWSg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cpky6vYIGSu; Thu, 20 Jan 2022 12:08:01 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8879041786;
 Thu, 20 Jan 2022 12:07:58 +0300 (MSK)
Received: from [10.178.116.117] (10.178.116.117) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 20
 Jan 2022 12:07:55 +0300
Subject: Re: Implement Ethernet Interface Properties
To: =?UTF-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>, Ed
 Tanous <edtanous@google.com>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
 <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <8076733c-ae3d-c239-d7ed-12d6612854c8@yadro.com>
Date: Thu, 20 Jan 2022 12:07:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.178.116.117]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Spencer!

On 20.01.2022 11:42, Spencer Ku (古世瑜) wrote:
> Hi All,
> 
> We finally decide to implement six properties to Ethernet interface: 
> RxPackets, TxPackets, RxBytes, TxBytes, RxDropped, and TxDropped.
> 
> Those information come from Ethernet statistics and we can read the file 
> to get the property value directly. (under /sys/class/net/<Ethernet name>/statistics)
> 
> For the suitable property in EthernetInterface model, we got the feedback 
> form Redfish forum and they said OEM properties would be the only other 
> option at this time. For more discussion detail:
> https://redfishforum.com/thread/579/additional-information-ethernet-interface
> 

I'd suggest referring to the [1] **9.7. Resource extensibility** to examine the proper 
way of OEM-properties definition.


> The following output is the result of my currently OEM implement:
> https://${bmc}/redfish/v1/Managers/bmc/EhernetInterfaces/eth0
> {
>   "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces/eth0",
>   ...
>   "Oem": {
>     "Statistics": [

Looks like "@odata.type" required field is missed. The **9.7.4. OEM property examples** 
contains the example of the right way to define OEM-properties.

>       {
>         "RxBytes": 48244026,
>         "RxDropped": 222856,
>         "RxPackets": 484315,
>         "TxBytes": 825845,
>         "TxDropped": 0,
>         "TxPackets": 5472
>       }
>     ]
>   },
>   "SpeedMbps": 100,
>   ...
> }
> 
> But it cannot pass the Redfish validator, and here is the error messages:
> ERROR - This complex object RxBytes should be a dictionary or None, but it's of type ...

Does it require to have the integer values? I guess each mentioned field might contain string values. 

> ERROR - RxBytes: Could not finish check on this property ('int' object is not iterable)
> 
> Is there anything I didn't notice? Or has there any spec or example that I can follow to implement? 
> 
> I had already push the implementation to gerrit and mark as WIP. Here is the link:
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/50522
> 
> We are willing to see any suggestions and alternatives as well. Thanks!
> 
> Sincerely,
> Spencer Ku
> 

Links:
[1] DSP0266 Redfish Specification: 
    https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.8.0.pdf

-- 
Best regards,

Igor Kononenko
