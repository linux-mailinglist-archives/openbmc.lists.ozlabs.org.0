Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393EF41D716
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 12:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKpjx0C2mz2ywF
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 20:04:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=pjH2nd8m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=pjH2nd8m; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKpjR4CTvz2xrN
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 20:03:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 05B0843F13
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1632996212; x=1634810613; bh=ojkzq4glXlR8qRKzrTSZtWnww
 teanC8JMjoGGHT75lU=; b=pjH2nd8m+OMmX2SOKODcrbII3d8rOl9ChlPK446fK
 XRgsvgfJbh2C9dSX5SvWlK8+0hUMUpp5xOhDN7Ia0dzFpIFv+PddyG8x+9WjkjOI
 1fuYUtFqzFd01EJfY86pIVkyAml0476TO3/mTSbru50KjDujaz3Ny+Wb8PUMzECf
 Zc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AsojBgP1A2U for <openbmc@lists.ozlabs.org>;
 Thu, 30 Sep 2021 13:03:32 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 39D3643EDE
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 13:03:32 +0300 (MSK)
Received: from [10.199.0.213] (10.199.0.213) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 30
 Sep 2021 13:03:31 +0300
Message-ID: <27ffb02323b8be39e1e92b37fc3cdc35857312b8.camel@yadro.com>
Subject: Re: Ipmitool command & entity-manager question
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Thu, 30 Sep 2021 13:03:31 +0300
In-Reply-To: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
References: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.213]
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

Hello,

What is your question exactly?
If it is about precision, then you should take in account that IPMI use
8-bit variables to represent values and some coefficients which
calculated based on MinValue/MaxValue parameters of corresponding
Sensor interface.
You will never get exact values in IPMI, unless you values can fit to
8-bit integer.

On Thu, 2021-09-30 at 17:07 +0800, 吳秉昌 wrote:
> Hi all
> 
> I add the sensor in entity-manager config like below
> {
>             "Index": 2,
>             "Name": "MB_VMEM",
>             "PowerState": "On",
>             "ScaleFactor": 1,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 1.32
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 1.26
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 1.14
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 1.08
>                 }
>             ],
>             "Type": "ADC"
>         },
>         {
>             "Index": 3,
>             "Name": "MB_P12V",
>             "PowerState": "On",
>             "ScaleFactor": 0.23,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 13.23
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 12.6
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 11.4
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 10.77
>                 }
>             ],
>             "Type": "ADC"
>         },
>         {
>             "Index": 4,
>             "Name": "MB_P5V",
>             "PowerState": "On",
>             "ScaleFactor": 0.55,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 5.48
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 5.24
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 4.76
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 4.48
>                 }
>             ],
>             "Type": "ADC"
>         },
>         {
>             "Index": 5,
>             "Name": "MB_P5V_SB",
>             "PowerState": "On",
>             "ScaleFactor": 0.25,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 5.48
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 5.24
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 4.76
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 4.48
>                 }
>             ],
>             "Type": "ADC"
>         },
> 
> 
> I use the busctrl command to see MB_P5V_SB information, it is normal.
> root@fws7830bmc:~# busctl introspect --no-pager
> xyz.openbmc_project.EntityManager
> /xyz/openbmc_project/inventory/system/board/FWS7830_
> Baseboard/MB_P5V
> NAME                                              TYPE      SIGNATURE
> RESULT/VALUE         FLAGS
> org.freedesktop.DBus.Introspectable               interface -      
>   -                    -
> .Introspect                                       method    -      
>   s                    -
> org.freedesktop.DBus.Peer                         interface -      
>   -                    -
> .GetMachineId                                     method    -      
>   s                    -
> .Ping                                             method    -      
>   -                    -
> org.freedesktop.DBus.Properties                   interface -      
>   -                    -
> .Get                                              method    ss     
>   v                    -
> .GetAll                                           method    s      
>   a{sv}                -
> .Set                                              method    ssv    
>   -                    -
> .PropertiesChanged                                signal 
>   sa{sv}as  -                    -
> xyz.openbmc_project.Configuration.ADC             interface -      
>   -                    -
> .Index                                            property  t      
>   4                    emits-change
> .Name                                             property  s      
>   "MB_P5V"             emits-change
> .PowerState                                       property  s      
>   "On"                 emits-change
> .ScaleFactor                                      property  d      
>   0.55                 emits-change
> .Type                                             property  s      
>   "ADC"                emits-change
> xyz.openbmc_project.Configuration.ADC.Thresholds0 interface -      
>   -                    -
> .Delete                                           method    -      
>   -                    -
> .Direction                                        property  s      
>   "greater than"       emits-change writable
> .Name                                             property  s      
>   "upper critical"     emits-change writable
> .Severity                                         property  d      
>   1                    emits-change writable
> .Value                                            property  d      
>   5.48                 emits-change writable
> xyz.openbmc_project.Configuration.ADC.Thresholds1 interface -      
>   -                    -
> .Delete                                           method    -      
>   -                    -
> .Direction                                        property  s      
>   "greater than"       emits-change writable
> .Name                                             property  s      
>   "upper non critical" emits-change writable
> .Severity                                         property  d      
>   0                    emits-change writable
> .Value                                            property  d      
>   5.24                 emits-change writable
> xyz.openbmc_project.Configuration.ADC.Thresholds2 interface -      
>   -                    -
> .Delete                                           method    -      
>   -                    -
> .Direction                                        property  s      
>   "less than"          emits-change writable
> .Name                                             property  s      
>   "lower non critical" emits-change writable
> .Severity                                         property  d      
>   0                    emits-change writable
> .Value                                            property  d      
>   4.76                 emits-change writable
> xyz.openbmc_project.Configuration.ADC.Thresholds3 interface -      
>   -                    -
> .Delete                                           method    -      
>   -                    -
> .Direction                                        property  s      
>   "less than"          emits-change writable
> .Name                                             property  s      
>   "lower critical"     emits-change writable
> .Severity                                         property  d      
>   1                    emits-change writable
> .Value                                            property  d      
>   4.48                 emits-change writable
> 
> But I use "ipmitoo sensor” command, it return the error information
> below as
> MB P3V3          | 3.271      | Volts      | ok    | na        |
> 2.947     | 3.046     | 3.511     | 3.596     | na        
> MB P5V           | 2.982      | Volts      | ok    | na        |
> 2.662     | 2.829     | 3.123     | 3.264     | na        
> MB P5V SB        | 5.048      | Volts      | ok    | na        |
> 4.484     | 4.766     | 5.245     | 5.471     | na        
> MB P12V          | 7.215      | Volts      | ok    | na        |
> 6.386     | 6.723     | 7.429     | 7.829     | na 
> 
> Please give me some advise.
> 
> Many thanks
> Paul 
> 

-- 
Best regards,
Andrei Kartashev


