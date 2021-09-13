Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8140895D
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 12:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7NXM0tb4z2yXc
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 20:49:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7NX54cVYz2yHb
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 20:49:21 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=4; SR=0; TI=SMTPD_---0UoD6fDJ_1631530142; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0UoD6fDJ_1631530142) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 13 Sep 2021 18:49:03 +0800
To: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: [Question] How can we use underscore "_" in sensor name?
Message-ID: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
Date: Mon, 13 Sep 2021 18:49:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

Can we use underscore "_" in IPMI sensor names? Now we see that "_" in 
sensor names will be replaced with space in the code, even if we really 
use "_" for sensor names in json configuration files.

The background is that we used underscore "_" in sensor names in legacy 
BMC, and all the OOB software uses such names to get sensor data. 
Therefore we want to make it compatible for switching to OpenBMC.

Is there any way to achieve this?

Thanks,

Heyi

