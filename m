Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 002084C3FC1
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 09:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4j771WNLz3c9c
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 19:07:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4j6p1S5Hz3bPW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 19:07:09 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=4; SR=0; TI=SMTPD_---0V5SE9IM_1645776421; 
Received: from 30.225.140.50(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V5SE9IM_1645776421) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Feb 2022 16:07:01 +0800
Message-ID: <5737da4c-f9ed-9499-121d-8bcbcc1723a1@linux.alibaba.com>
Date: Fri, 25 Feb 2022 16:07:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: [hostlogger] Trailing LF is dropped from host logger to rsyslog
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

Hi all,

We are using hostlogger in stream mode and forwarding the serial port 
data to rsyslog. rsyslog template is as below:

$EscapeControlCharactersOnReceive off

template(name="hostlog" type="string"
     string="%rawmsg%"
)

However it seems the trailing LF "\n" of each socket transfer will be 
dropped when saving the messages to file, causing multiple lines joined 
together and hard to read.

Is there anything wrong in our configuration?

Thanks,

Heyi

