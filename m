Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEC417524
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 15:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGCCh6t4Yz303H
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 23:13:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=h9dTzD1B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_ggregory@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=h9dTzD1B; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGCCC24M6z2yLQ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 23:13:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632489207; x=1664025207;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to; bh=xHBlese/jLq1BCLbng3MdL7SwPayFV6ay+yJFmD64GY=;
 b=h9dTzD1BhwcOlzmUHkovIJ6+ukAVFkdnCeTjXD8eXXOLb9u+gQvIqg7R
 aCDnsGQ1Su5GfkD2ysbXi8HAhOgDRT3U0dhB+wZKIQU/moHFwEhlrDHb/
 CQvgzKqpZqZxRiBxH8oqmgxO4Rc27Qu1G+DUyqRbEiph+UP8/H69WXbk/ k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 24 Sep 2021 06:12:24 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 06:12:24 -0700
Received: from [10.111.141.25] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 24 Sep 2021
 06:12:22 -0700
Subject: Re: AST2600 EVB eth0 (MAC1) Issue
To: Troy Lee <troy_lee@aspeedtech.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
References: <8f36a6e9-eccf-5d9b-2c29-3546ded6ba5d@quicinc.com>
 <HK0PR06MB2145678C356EC1ADFB194D1E8AA39@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <296f8f59-c6a5-5a1a-2567-63c7845e53d3@quicinc.com>
 <HK0PR06MB21457F237946252F810F07098AA49@HK0PR06MB2145.apcprd06.prod.outlook.com>
From: Graeme Gregory <quic_ggregory@quicinc.com>
Message-ID: <0c4564d7-7d28-abcb-d41e-c8e127c38563@quicinc.com>
Date: Fri, 24 Sep 2021 14:12:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HK0PR06MB21457F237946252F810F07098AA49@HK0PR06MB2145.apcprd06.prod.outlook.com>
Content-Type: multipart/mixed; boundary="------------0269EA8806DE9A9FE38A74FE"
Content-Language: en-GB
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

--------------0269EA8806DE9A9FE38A74FE
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24/09/2021 04:32, Troy Lee wrote:
> Hi Graeme,
>
> We'd like to ask you to dump SCU registers (0x1e6e2000 ~ 0x1e6e2fff) with your current image, then we could check the mac clock delay is correctly set.
> You could use UART debug controller (datasheet section 11) if devmem is not available.
>
> Thanks,
> Troy Lee

Hi Troy,

If I got my devmem magic correct then this is the dump of that memory 
region attached.

Thanks

Graeme


>> -----Original Message-----
>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>> Sent: Friday, September 24, 2021 5:23 AM
>> To: Troy Lee <troy_lee@aspeedtech.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: AST2600 EVB eth0 (MAC1) Issue
>>
>> On 23/09/2021 10:09, Troy Lee wrote:
>>> Hi Gaeme,
>>>
>>> Which soc revision and evb board revision are you using?
>>> Can you try to use phy-mode = "rgmii-rxid" for eth0/1 in your dts?
>>>
>>> Thanks,
>>> Troy Lee
>> Hi Troy,
>>
>> Soc Rev:-
>>
>> U-Boot 2019.04-00083-ge5902174d9-dirty (Sep 22 2021 - 15:10:03 +0000)
>>
>> SOC: AST2600-A1
>>
>>
>> EVB Rev:-
>>
>> AST2600-DDR4 EVB V1.4
>>
>>
>> phy-mode = "rgmii-rxid" instead of "rgmii" improves the issue and I now get
>> DHCP on that interface, but packet loss is still hight compared to
>> eth1 (MAC2).
>>
>> eth0
>> ping -f 192.168.222.119
>> PING 192.168.222.119 (192.168.222.119) 56(84) bytes of data.
>> ................................................................................................................
>> ................................................................................................................
>> .............................................................................................^C
>> --- 192.168.222.119 ping statistics ---
>> 597 packets transmitted, 330 received, 44.7236% packet loss, time 6775ms
>> rtt min/avg/max/mdev = 0.078/809.845/3266.263/1099.208 ms, pipe 205,
>> ipg/ewma 11.367/30.024 ms
>>
>> eth1
>> ping -f 192.168.222.30
>> [sudo] password for ggregory:
>> PING 192.168.222.30 (192.168.222.30) 56(84) bytes of data.
>> .^C
>> --- 192.168.222.30 ping statistics ---
>> 50591 packets transmitted, 50590 received, 0.00197664% packet loss, time
>> 5550ms rtt min/avg/max/mdev = 0.083/0.105/0.816/0.004 ms, ipg/ewma
>> 0.109/0.104 ms
>>
>> Thanks
>>
>> Graeme
>>
>>>> -----Original Message-----
>>>> From: openbmc <openbmc-
>>>> bounces+troy_lee=aspeedtech.com@lists.ozlabs.org> On Behalf Of
>> Graeme
>>>> Gregory
>>>> Sent: Wednesday, September 22, 2021 11:49 PM
>>>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>>> Subject: AST2600 EVB eth0 (MAC1) Issue
>>>>
>>>> Hi,
>>>>
>>>> I know A0 versions of the AST2600 had an issue where eth0 was not
>>>> working, but the errata indicates this is fixed in later revisions.
>>>>
>>>> I am seeing an issue on the EVB board though where eth0 (MAC1) is not
>>>> functional. The other three ports all function as expected.
>>>>
>>>> On my DHCP host machine I can see DHCP requests from the AST2600,
>> and
>>>> replies are sent. Looking at /proc/interrupts it looks very much like
>>>> no IRQs are ever generated for incoming packets.
>>>>
>>>> Thanks
>>>>
>>>> Graeme
>>>>

--------------0269EA8806DE9A9FE38A74FE
Content-Type: text/plain; charset="UTF-8"; name="regdump.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="regdump.txt"

MDAwMDAwMDA6IDAxMDAgMDAwMCAwMzAzIDAxMDUgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMDAxMDogMDEwMCAwMDAwIDAzMDMgMDEwNSAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMDIwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAwMzA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMDA0MDogZDhlNiA4YTdmIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwMDUwOiBmMGZmIGNmZjQgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAwNjA6IGYxMWYgMGYwNyAyMDMw
IDAwMDAgZmZmZiBmZjFmIDAwMDAgMDAwMCAgLi4uLiAwLi4uLi4uLi4uLgowMDAwMDA3MDog
ZjFmZiBmZjA3IDMxZmYgMDEwMCBmZmZmIGZmMGYgMDAwMCAwMDAwICAuLi4uMS4uLi4uLi4u
Li4uCjAwMDAwMDgwOiA4YTdmIGNmZjcgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAwOTA6IGYzZmYgY2ZiZiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDBhMDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMGIw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDAwYzA6IDAwMTAgMDAwMCAwMDIxIDAwMDMgZmYwZiAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4hLi4uLi4uLi4uLgowMDAwMDBkMDogMTAwMCAwMDAwIDAzMjEgMDAwMyBmZjAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLiEuLi4uLi4uLi4uCjAwMDAwMGUwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAw
ZjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwZmMgZmNmYyAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMDEwMDogNDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICBALi4uLi4uLi4uLi4uLi4uCjAwMDAwMTEwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAxMjA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MDEzMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwMTQwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAxNTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDE2MDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwMTcwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDAxODA6IGEwMTcgMTA4MCAwMWFiIGJhYWIgZmVjYSBiZWJhIDAy
ZjAgMjBlMyAgLi4uLi4uLi4uLi4uLi4gLgowMDAwMDE5MDogMDA0MCA5MGU1IDA0MDAgNTJl
MSBmYmZmIGZmMWEgMDBmMCA5MWU1ICAuQC4uLi5SLi4uLi4uLi4uCjAwMDAwMWEwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDAxYjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMDFjMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMWQwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAxZTA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMDFmMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwMjAwOiA4ZjQwIDAwMTAgNDcwMCAwMDgwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC5ALi5HLi4uLi4uLi4uLi4KMDAwMDAyMTA6IGMwMDEgMDA5MyAxOTAw
IDU5MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uWS4uLi4uLi4uLgowMDAwMDIyMDog
NWY0MCAwODEwIDMxMDAgMDA4MCAwMDAwIDAwMDAgMDAwMCAwMDAwICBfQC4uMS4uLi4uLi4u
Li4uCjAwMDAwMjMwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAyNDA6IDc3NDAgMDAxMCAzYjAwIDAwODAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgd0AuLjsuLi4uLi4uLi4uLgowMDAwMDI1MDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMjYw
OiA1ZjQwIDc4MTAgMmYwMCAwMDgwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIF9AeC4vLi4uLi4u
Li4uLi4KMDAwMDAyNzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDI4MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMjkwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAy
YTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMDJiMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMmMwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAyZDA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MDJlMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwMmYwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAzMDA6IDAwOGMgOWFmZiAwMDAwIDc0MDAg
MDAyMCAwMTAwIDAwMDAgMDAwMCAgLi4uLi4udC4uIC4uLi4uLgowMDAwMDMxMDogMDAwMSBm
MzEwIDAwMDAgMDAzMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uMC4uLi4uLi4uCjAw
MDAwMzIwOiAwMDAwIDAwMTggMDAwMCAwMDAwIDAwMDAgMDAwMCAyMDEzIDAxMDAgIC4uLi4u
Li4uLi4uLiAuLi4KMDAwMDAzMzA6IDAwMDAgMDAwMCA1ODAwIDgwMDAgMDY0NSAwMTAwIGMw
NDUgMDEwMCAgLi4uLlguLi4uRS4uLkUuLgowMDAwMDM0MDogMTBhNCAyODkwIDAwMDAgMDAw
MCAxMDA0IDQxMDAgMTAwNCA0MTAwICAuLiguLi4uLi4uQS4uLkEuCjAwMDAwMzUwOiAwODQy
IDEwMDAgMDAwMCAwMDAwIDA4NDIgMTAwMCAwODQyIDEwMDAgIC5CLi4uLi4uLkIuLi5CLi4K
MDAwMDAzNjA6IDAwMDAgMDMwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDEyMmUgNzAwMiAgLi4u
Li4uLi4uLi4uLi5wLgowMDAwMDM3MDogMDAwMCAwMjAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
ZTEwMiBiMzBjICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwMzgwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAzOTA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMDNhMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwM2IwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAzYzA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDNkMDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwM2UwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDAzZjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDQwMDogZmZmZiBmZmZmIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNDEw
OiAwZjMwIGZmMGYgMDBmZiAwMDAwIDAwMDAgZmZjZiBjMDAwIDAwMDAgIC4wLi4uLi4uLi4u
Li4uLi4KMDAwMDA0MjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDQzMDogMDAwMCAwMzAwIDAwMDAgZmYwMCAzMDM4
IDAwMDAgZmYwMCAwMDAwICAuLi4uLi4uLjA4Li4uLi4uCjAwMDAwNDQwOiAwMGEwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA0
NTA6IDAyYTAgMDAwMCAwMDAwIDAwMDAgMGYwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMDQ2MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNDcwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA0ODA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MDQ5MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwNGEwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA0YjA6IGYwMDAgMDBmMCBmZjAwIGZmZjAg
MDBmZiAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDRjMDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwNGQwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMzAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4wLi4uLi4KMDAwMDA0ZTA6IDAwMDAgMDAwMCAwMTAwIDYwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgLi4uLi4uYC4uLi4uLi4uLgowMDAwMDRmMDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNTAwOiBlMDIw
IDAwMDEgMDAwMCAwMDAwIDAwMDAgMDg0MCAwMDAwIDAwMDAgIC4gLi4uLi4uLi4uQC4uLi4K
MDAwMDA1MTA6IDAzMDAgMDAwMCAwMDAwIDAwMDAgMTAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMDUyMDogMGUwMCAwMDAwIDU4YjAgMjdmMiAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uWC4nLi4uLi4uLi4uCjAwMDAwNTMwOiAwZTAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA1NDA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMDU1MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwNTYwOiAwMDAwIGY0MGYgMDAwMCAwMDEwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA1NzA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDU4MDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwNTkwOiBmYWYzIDBmMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA1YTA6IDhmYjYgYTQ2ZSAwZDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4ubi4uLi4uLi4uLi4uLgowMDAwMDViMDogYzkzMyAwMTBmIDg0
MzIgNDcwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuMy4uLjJHLi4uLi4uLi4uCjAwMDAwNWMw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDA1ZDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDVlMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNWYwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA2
MDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMDYxMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNjIwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA2MzA6IDAwMDAgMDBm
ZiBmZjAwIDAwMDAgMDAwMCAwZjAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MDY0MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwNjUwOiAzMzAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIDMuLi4uLi4uLi4uLi4uLi4KMDAwMDA2NjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDY3MDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwNjgwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDA2OTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDA4MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDZhMDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNmIwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDA2YzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMDZkMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNmUwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA2ZjA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMDcwMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwNzEwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA3MjA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDczMDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwNzQwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA3NTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDc2MDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwNzcw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDA3ODA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDc5MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwN2EwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA3
YjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMDdjMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwN2QwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA3ZTA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MDdmMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwODAwOiBjZjNmIDAwMDAgMDAwMCAwMDAwIGZmZmYgZmZmZiAwMDAw
IDAwODAgIC4/Li4uLi4uLi4uLi4uLi4KMDAwMDA4MTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDgyMDogMDEwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCBmMDBmICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwODMwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDA4NDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDg1MDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwODYwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDA4NzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMDg4MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwODkwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA4YTA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMDhiMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwOGMwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA4ZDA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDhlMDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwOGYwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA5MDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDkxMDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwOTIw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDA5MzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDk0MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwOTUwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA5
NjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMDk3MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwOTgwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA5OTA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MDlhMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwOWIwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDA5YzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMDlkMDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwOWUwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDA5ZjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGEwMDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYTEwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDBhMjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMGEzMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYTQwOiBmZmZmIGZmZmYgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBhNTA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMGE2MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwYTcwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBhODA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGE5MDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwYWEwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBhYjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGFjMDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYWQw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDBhZTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGFmMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYjAwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBi
MTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMGIyMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYjMwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBiNDA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MGI1MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwYjYwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBiNzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGI4MDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwYjkwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDBiYTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGJiMDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYmMwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDBiZDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMGJlMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYmYwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBjMDA6IDAz
MWEgMDAyMCAwMzFhIDAwMjAgNTEwMCAwMDA0IDAwMDAgMDAwMCAgLi4uIC4uLiBRLi4uLi4u
LgowMDAwMGMxMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwYzIwOiA3YjAwIDBjMDAgMDAyMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIHsuLi4uIC4uLi4uLi4uLi4KMDAwMDBjMzA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGM0MDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwYzUwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBjNjA6IDAzMWEgMDIyNCAwMDAwIDAwMDAgMDAwMSAw
NzBjIDAwMDAgMDAwMCAgLi4uJC4uLi4uLi4uLi4uLgowMDAwMGM3MDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwYzgw
OiAwMzI1IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4lLi4uLi4uLi4u
Li4uLi4KMDAwMDBjOTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGNhMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwY2IwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBj
YzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMGNkMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwY2UwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBjZjA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MGQwMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwZDEwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBkMjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGQzMDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwZDQwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDBkNTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGQ2MDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZDcwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDBkODA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMGQ5MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZGEwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBkYjA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMGRjMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwZGQwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBkZTA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGRmMDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwZTAwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBlMTA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGUyMDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDEwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZTMw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDBlNDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGU1MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZTYwOiAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBl
NzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4u
Li4uLi4uLgowMDAwMGU4MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZTkwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBlYTA6IDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAw
MGViMDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCjAwMDAwZWMwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAw
IDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBlZDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGVlMDogMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAw
MDAwZWYwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4u
Li4uLi4uLi4uLi4KMDAwMDBmMDA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGYxMDogMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZjIwOiAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4K
MDAwMDBmMzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4u
Li4uLi4uLi4uLi4uLgowMDAwMGY0MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
MDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZjUwOiAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBmNjA6IDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgowMDAwMGY3MDogMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAu
Li4uLi4uLi4uLi4uLi4uCjAwMDAwZjgwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBmOTA6IDAwMDAgMDAwMCAwMDAw
IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGZhMDog
MDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4u
Li4uCjAwMDAwZmIwOiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KMDAwMDBmYzA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAw
MDAwIDAwMDAgMDAwMCAgLi4uLi4uLi4uLi4uLi4uLgowMDAwMGZkMDogMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCjAwMDAwZmUw
OiAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KMDAwMDBmZjA6IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAw
MCAgLi4uLi4uLi4uLi4uLi4uLgo=
--------------0269EA8806DE9A9FE38A74FE--
