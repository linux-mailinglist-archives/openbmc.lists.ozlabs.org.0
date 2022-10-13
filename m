Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4905FD68B
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 11:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp3Rs4tXDz3bqn
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 20:02:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57; helo=out30-57.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir; Thu, 13 Oct 2022 20:01:44 AEDT
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp3RX0Wbfz2yMk
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 20:01:43 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=guoheyi@linux.alibaba.com;NM=1;PH=DS;RN=1;SR=0;TI=SMTPD_---0VS2xbV0_1665651391;
Received: from 30.233.49.158(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0VS2xbV0_1665651391)
          by smtp.aliyun-inc.com;
          Thu, 13 Oct 2022 16:56:32 +0800
Message-ID: <6bb3a7e1-053c-ffea-503f-a6e3d75d31eb@linux.alibaba.com>
Date: Thu, 13 Oct 2022 16:56:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: systemctl hangs on our BMC based on 2.11.0 release
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

Our BMC is based on OpenBMC 2.11.0 release, and we find systemctl hangs 
nowadays. The phenomenon is just like the below issue:

https://github.com/openbmc/openbmc/issues/1097

systemctl command will always return timeout and dmesg will continue to 
pop up below message:

|systemd-journald[445]: Failed to send WATCHDOG=1 notification message: 
Transport endpoint is not connected|

ssh connection will be refused, and normal reboot will return timeout.

Is there any known issue which will cause this problem? Or do you have 
any suggestion on how to debug?

For the above bug, I don't see any resolution before it was closed.

Thanks,

Heyi


