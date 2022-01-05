Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3802484C83
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 03:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTD4F3Pflz2yxL
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 13:30:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Wed, 05 Jan 2022 13:30:38 AEDT
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTD3y40m5z2xBJ
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 13:30:37 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V1-t3Y2_1641349504; 
Received: from 30.225.139.226(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V1-t3Y2_1641349504) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 05 Jan 2022 10:25:05 +0800
Message-ID: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
Date: Wed, 5 Jan 2022 10:25:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: netipmid consumes much CPU when obmc-console socket is shutdown
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

We found netipmid will consumes much CPU when SOL is activated but 
obmc-console socket is shutdown by some reason (can simply shutdown 
obmc-console by systemctl stop ....).

After obmc-console socket is closed, the async_wait() in 
startHostConsole() is always triggered, and consoleInputHandler() will 
read empty data (readSize == 0 and readDataLen == 0), but all the ec 
condition check will NOT hit!

 From boost reference, it is said the function read_some() will:

The function call will block until one or more bytes of data has been 
read successfully, or until an error occurs.

Is it a bug of boost? Or is there anything wrong in ipmi-net? And how 
can we make netipmid more robust on obmc-console socket shutdown?

Thanks,

Heyi

