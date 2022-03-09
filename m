Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A414D30DE
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 15:16:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDDlJ2vGwz3bP0
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 01:16:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDDl00HSLz2yLX
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 01:16:06 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=1; SR=0; TI=SMTPD_---0V6k30an_1646835353; 
Received: from 192.168.3.161(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V6k30an_1646835353) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Mar 2022 22:15:54 +0800
Message-ID: <a3127a6d-ac1d-b730-eb79-9a0342562c98@linux.alibaba.com>
Date: Wed, 9 Mar 2022 22:15:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: Does it make sense to change boost::asio::deadline_timer to
 steady_timer?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi all,

We can see lots of using boost::asio::deadline_timer in the code, like 
dbus-sensors. However, this timer is based on UTC clock and might be 
affected by system time. I tested and found the timer didn't trigger in 
time if I changed system time to some early time after starting the 
timer (calling expire_from_now()). And I think this situation might 
happen if system time of BMC is synchronized with host or NTP.

At the other hand, steady_timer is a chrono timer and should not be 
affected by system time.

Is there any reason to use deadline_timer for relative timer trigger? 
Shall we switch to steady_timer to avoid being affected by system time 
change?

Thanks,

Heyi

