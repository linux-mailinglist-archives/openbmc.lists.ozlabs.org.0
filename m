Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1944D4658
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 12:57:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDncc3v4Dz30RN
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 22:57:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.90.199.18;
 helo=out199-18.us.a.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Thu, 10 Mar 2022 22:57:20 AEDT
Received: from out199-18.us.a.mail.aliyun.com (out199-18.us.a.mail.aliyun.com
 [47.90.199.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDncJ62bwz301K
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 22:57:20 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R951e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=2; SR=0; TI=SMTPD_---0V6oiX2a_1646913120; 
Received: from 30.225.140.85(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V6oiX2a_1646913120) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 10 Mar 2022 19:52:01 +0800
Message-ID: <8ed55472-6af0-32b6-0d7b-7ab5402830a4@linux.alibaba.com>
Date: Thu, 10 Mar 2022 19:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Does it make sense to change boost::asio::deadline_timer to
 steady_timer?
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>
References: <a3127a6d-ac1d-b730-eb79-9a0342562c98@linux.alibaba.com>
 <CAH2-KxCa5-KYc3RXXqGBDf1mOsZAVeN50Kk6R1PYWu1VXYPR5A@mail.gmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <CAH2-KxCa5-KYc3RXXqGBDf1mOsZAVeN50Kk6R1PYWu1VXYPR5A@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


在 2022/3/10 上午12:22, Ed Tanous 写道:
> On Wed, Mar 9, 2022 at 6:16 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>> Hi all,
>>
>> We can see lots of using boost::asio::deadline_timer in the code, like
>> dbus-sensors. However, this timer is based on UTC clock and might be
>> affected by system time. I tested and found the timer didn't trigger in
>> time if I changed system time to some early time after starting the
>> timer (calling expire_from_now()). And I think this situation might
>> happen if system time of BMC is synchronized with host or NTP.
>>
>> At the other hand, steady_timer is a chrono timer and should not be
>> affected by system time.
>>
>> Is there any reason to use deadline_timer for relative timer trigger?
>> Shall we switch to steady_timer to avoid being affected by system time
>> change?
> Yes, these should be steady_timer.  For some reason I thought we fixed
> this a long time ago in dbus-sensors, but apparently not.  Please send
> the other maintainers and I a patch in gerrit (should be just a sed
> replace of all deadline_timer instances) and I'll review it.

For steady_timer.expire_from_now is deprecated, we need to replace below 
3 pieces, isn't it?

deadline_timer -> steady_timer

expires_from_now -> expires_after

boost::posix_time -> std::chrono


Thanks,

Heyi


>
>> Thanks,
>>
>> Heyi
>>
