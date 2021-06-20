Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658E3ADDC9
	for <lists+openbmc@lfdr.de>; Sun, 20 Jun 2021 10:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G75v02LfMz3bv4
	for <lists+openbmc@lfdr.de>; Sun, 20 Jun 2021 18:49:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G75tn0zMsz2yjS
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jun 2021 18:49:18 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=2; SR=0; TI=SMTPD_---0Ud-x2bY_1624178945; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0Ud-x2bY_1624178945) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 20 Jun 2021 16:49:05 +0800
Subject: Re: Does it make sense to create a centralized fan control module?
To: Ed Tanous <edtanous@google.com>
References: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
 <CAH2-KxBJkBA1G6J5iMJ8nPEaX6qbO0qQGQ4ujhZ-TrZPjAS7oQ@mail.gmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <2badabf6-1b45-f32d-856d-fe4023577ca7@linux.alibaba.com>
Date: Sun, 20 Jun 2021 16:48:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH2-KxBJkBA1G6J5iMJ8nPEaX6qbO0qQGQ4ujhZ-TrZPjAS7oQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for your comments; that sounds reasonable.

Heyi

On 2021/6/17 上午12:26, Ed Tanous wrote:
> On Thu, Jun 10, 2021 at 6:19 PM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
>> Hi All,
>>
>> Right now fan related data like tacho and PWM is fetched in
>> dbus-sensors, and published to d-bus as sensor data, while fan control
>> is made in another module like pid-control, which can fetch data and set
>> value via d-bus.
>>
>> In some common sense, we may think about putting all fan related work
>> into one single module (which may be based on pid-control), i.e. it can
>> read tacho and PWM from hardware directly, calculate the required PWM by
>> some algorithm like PID, and then write to PWM hardware directly; the
>> data will also be published to d-bus for other modules to consume, like
>> fansensor from dbus-sensors.
>>
> To some extent, this design revolves around flexibility.  Fans aren't
> necessarily tacho devices, and sensors aren't necessarily hwmon devices, so
> dbus is used as an abstraction to be able to make them all look the same.
> For example, an NCSI NIC might have both a temperature and a fan that
> phosphor-pid-control might want to control, but we don't want
> phosphor-pid-control to take a dependency on NCSI.  While we could put all
> code for all possible sensor types into one daemon, that opens us up to the
> possibility that crashes could take down all of fan and thermal control,
> including the failsafe behavior.  That would be an issue.
>
> It might be possible to handle these issues in a single daemon, but I
> haven't really seen a design that covered all the cases;  Most
> implementations tend to take the simple approach (hwmon sensor + tacho
> device) and ignore the more complex setups.
>
>
>> Does it make sense to do that? Or is there any reason for the current
>> design?
>>
>> I'm new to OpenBMC and some of my understanding may be totally wrong.
>>
>> Looking forward to your expert advice.
>>
>> Thanks,
>>
>> Heyi
>>
>>
