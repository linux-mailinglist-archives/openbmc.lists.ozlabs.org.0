Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDEA27A081
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 12:30:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzhkX42KBzDqJl
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 20:30:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=rBUjzuuu; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzhjZ6SHdzDqHb
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 20:29:54 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E989B4127A;
 Sun, 27 Sep 2020 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1601202587; x=1603016988; bh=ylC
 7cAHlnFO6E+0tb4cgrRS2fKnRaqLYkONYf3ZoYAg=; b=rBUjzuuuKBFhUCljk3j
 CBCYMPpwxvBH62WBWgQ8gpuYxyBSg7BNe01WmgyIZ0VVnhGd+fOvVgRYFgmiotDe
 l0gnJFHfY5M9FZCn+ZcjCokZ9jtCCNexdwofq5RIfmFxOdoUm0efyymHGXVMXFS/
 dtMZcjeCJGFizJM9S+14CKXw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYeR_3Us5v3N; Sun, 27 Sep 2020 13:29:47 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 62A5C41208;
 Sun, 27 Sep 2020 13:29:47 +0300 (MSK)
Received: from [10.199.0.54] (10.199.0.54) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Sep 2020 13:29:46 +0300
Subject: Re: Inventory dbus to redfish mapping and debug
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
References: <751cf58493c240fea37345954eb01d44@SCL-EXCHMB-13.phoenix.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <3316d0de-9df8-89d1-cb39-2cee7fa83594@yadro.com>
Date: Sun, 27 Sep 2020 13:29:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <751cf58493c240fea37345954eb01d44@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.54]
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Patrick, 

I have same problem with the Processor redfish node. In our system we using entity-manager and dbus-sensors as mainline of managing physical system components.
At research  I was found some problem of business-logic in dbus-sensors and bmcweb:

* Bmcweb:redfish:cpudimm.hpp[1] - retrieving CPU info from dbus depend of CPU-core object which was not been created anyone service. 
  This is originate the premise to adjust "TotalCoresEnable" to zero and Status->State to "absent"
* The main problem which raising the exception is lack of "present" and "functional" DBus-properties [2].

But, I was noticed, that at last revision of bmcweb this was be fixed. If problems is remained let me known -
I have number of patches which fixed this another context for our system implementation and I'm ready suggest it at gerrit changes.
Thanks.


[1] https://github.com/openbmc/bmcweb/blob/50626f4f1aaa02daae058617ce0c603874277322/redfish-core/lib/cpudimm.hpp#L197
[2] https://github.com/openbmc/bmcweb/blob/80789c8e769b7439d72787bd620f28ebd5b14235/redfish-core/lib/cpudimm.hpp#L169 

On 26.09.2020 02:42, Patrick Voelker wrote:
> I'm trying to view my processor information that originates from SMBIOS.  I can see readable info on the dbus with this command:
> busctl introspect xyz.openbmc_project.Smbios.MDR_V1 /xyz/openbmc_project/inventory/system/chassis/motherboard/cpu0
> 
> But if I ask redfish, I get an error (below.)  Can someone give me a pointer on how to debug this?  I'm having trouble finding what maps the redfish query to the dbus and what log file I can check to see more information about the error.
> 
> https://<host>/redfish/v1/Systems/system/Processors/cpu0
> 
> {
>     "@odata.id": "/redfish/v1/Systems/system/Processors/cpu0",
>     "@odata.type": "#Processor.v1_7_0.Processor",
>     "error": {
>         "@Message.ExtendedInfo": [
>             {
>                 "@odata.type": "#Message.v1_0_0.Message",
>                 "Message": "The request failed due to an internal service error.  The service is still operational.",
>                 "MessageArgs": [],
>                 "MessageId": "Base.1.4.0.InternalError",
>                 "Resolution": "Resubmit the request.  If the problem persists, consider resetting the service.",
>                 "Severity": "Critical"
>             }
>         ],
>         "code": "Base.1.4.0.InternalError",
>         "message": "The request failed due to an internal service error.  The service is still operational."
>     }
> }
> 

-- 
Best regards,

Igor Kononenko
