Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8A4C60A0
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 02:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6N5y1WTCz3bcT
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 12:27:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6N5g1ltMz3bT6
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 12:26:58 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0V5dAH15_1646011608; 
Received: from 30.225.140.32(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V5dAH15_1646011608) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Feb 2022 09:26:49 +0800
Message-ID: <ba550354-e72c-30ce-06cd-b9e0fb0cf261@linux.alibaba.com>
Date: Mon, 28 Feb 2022 09:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [hostlogger] Trailing LF is dropped from host logger to rsyslog
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: =?UTF-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <5737da4c-f9ed-9499-121d-8bcbcc1723a1@linux.alibaba.com>
 <SL2PR04MB3308DB57B4AEC42489CB20F8E43E9@SL2PR04MB3308.apcprd04.prod.outlook.com>
 <d97263d1-32b7-1466-db3a-459faba00bec@linux.alibaba.com>
 <729d281f-dbae-7aec-98c9-61a6fd9368f1@linux.alibaba.com>
In-Reply-To: <729d281f-dbae-7aec-98c9-61a6fd9368f1@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 Artem Senichev <a.senichev@yadro.com>,
 Alexander Filippov <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Finally, I found this feature is controlled by the global option: 
DropTrailingLFOnReception. After setting it off, the tailing LF will not 
be dropped any more.

$DropTrailingLFOnReception off

Thanks,

Heyi

在 2022/2/25 下午5:25, Heyi Guo 写道:
>
> 在 2022/2/25 下午5:24, Heyi Guo 写道:
>> Hi Spencer,
>>
>> Thanks for your info; I check my configuration file and it is almost 
>> the same with the one you post, except for below items:
>>
>> - SysSock.Use="off"
>>
>> - UseSpecialParser="off"
>>
>> - ParseHostname="off"
>>
>>
>> However the trailing LF of each transfer is still dropped in the 
>> target file.
>
> I mean the issue is still there after adding the above 3 items to 
> configuration file.
>
> Heyi
>
>>
>> Any other ideas?
>>
>> PS: We are using the version of rsyslog from openbmc 2.10.0-rc1.
>>
>> Thanks,
>>
>> Heyi
>>
>>
>> 在 2022/2/25 下午5:00, Spencer Ku (古世瑜) 写道:
>>> Hi Heyi,
>>> Phosphor-hostlooger in stream mode forwards the byte stream into 
>>> rsyslog via the imuxsock module. The log is persisted via the omfile 
>>> module as soon as collected.
>>> So we need to use imuxsock module to transfer the data. The below 
>>> sample is my rsyslog settings:
>>>
>>> module(load="imuxsock" SysSock.Use="off")
>>>
>>> template(name="ConsoleTemplate" type="string" string="%rawmsg%")
>>>
>>> ruleset(name="ConsoleRuleset") {
>>>    action(type="omfile" file="/var/log/console/log" 
>>> template="ConsoleTemplate")
>>> }
>>>
>>> # Custom socket for serial console logs.
>>> input(type="imuxsock"
>>>    Socket="/run/rsyslog/console_input"
>>>    CreatePath="on"
>>>    UseSpecialParser="off"
>>>    ParseHostname="off"
>>>    ruleset="ConsoleRuleset")
>>>
>>> $EscapeControlCharactersOnReceive off
>>>
>>> And we also need to set the socket path to hostlogger 
>>> config(STREAM_DST). In this sample, the path is 
>>> /run/rsyslog/console_input
>>> Hope this information is helpful to you.
>>>
>>> Sincerely,
>>> Spencer Ku
>>>
>>>> -----Original Message-----
>>>> From: openbmc
>>>> <openbmc-bounces+spencer.ku=quantatw.com@lists.ozlabs.org> On 
>>>> Behalf Of
>>>> Heyi Guo
>>>> Sent: Friday, February 25, 2022 4:07 PM
>>>> To: openbmc <openbmc@lists.ozlabs.org>
>>>> Cc: Alexander Amelkin <a.amelkin@yadro.com>; Artem Senichev
>>>> <a.senichev@yadro.com>; Alexander Filippov <a.filippov@yadro.com>
>>>> Subject: [hostlogger] Trailing LF is dropped from host logger to 
>>>> rsyslog
>>>>
>>>> Hi all,
>>>>
>>>> We are using hostlogger in stream mode and forwarding the serial 
>>>> port data to
>>>> rsyslog. rsyslog template is as below:
>>>>
>>>> $EscapeControlCharactersOnReceive off
>>>>
>>>> template(name="hostlog" type="string"
>>>>       string="%rawmsg%"
>>>> )
>>>>
>>>> However it seems the trailing LF "\n" of each socket transfer will 
>>>> be dropped
>>>> when saving the messages to file, causing multiple lines joined 
>>>> together and
>>>> hard to read.
>>>>
>>>> Is there anything wrong in our configuration?
>>>>
>>>> Thanks,
>>>>
>>>> Heyi
