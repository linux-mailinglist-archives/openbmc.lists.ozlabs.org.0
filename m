Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970323A393A
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 03:24:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1NRC6LHDz3bwC
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 11:24:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.56;
 helo=out30-56.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1NR04fZCz303y
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 11:23:56 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=1; SR=0; TI=SMTPD_---0Uc.gHLz_1623374620; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0Uc.gHLz_1623374620) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 11 Jun 2021 09:23:41 +0800
Subject: Re: Does it make sense to create a centralized fan control module?
To: openbmc@lists.ozlabs.org
References: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <3c72ee05-ec56-96ca-55da-6517307cd6a7@linux.alibaba.com>
Date: Fri, 11 Jun 2021 09:23:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please ignore my early emails; only this one is the final version. I 
must have misused some shortcut key to send the unfinished versions 
while I wanted to save it locally...

Sorry for the noise.

Heyi

On 2021/6/11 上午9:14, Heyi Guo wrote:
> Hi All,
>
> Right now fan related data like tacho and PWM is fetched in 
> dbus-sensors, and published to d-bus as sensor data, while fan control 
> is made in another module like pid-control, which can fetch data and 
> set value via d-bus.
>
> In some common sense, we may think about putting all fan related work 
> into one single module (which may be based on pid-control), i.e. it 
> can read tacho and PWM from hardware directly, calculate the required 
> PWM by some algorithm like PID, and then write to PWM hardware 
> directly; the data will also be published to d-bus for other modules 
> to consume, like fansensor from dbus-sensors.
>
> Does it make sense to do that? Or is there any reason for the current 
> design?
>
> I'm new to OpenBMC and some of my understanding may be totally wrong.
>
> Looking forward to your expert advice.
>
> Thanks,
>
> Heyi
