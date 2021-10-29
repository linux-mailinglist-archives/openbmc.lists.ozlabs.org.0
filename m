Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BB43F942
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 10:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgblG2CN8z2xsx
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 19:51:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgbkX4HvHz2yKN
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 19:51:15 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0Uu7vZ4y_1635497457; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0Uu7vZ4y_1635497457) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 29 Oct 2021 16:50:58 +0800
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: ipmitool sdr command prompts "ipmitool: ipmi_sdr_get_record() failed"
 error for phosphor-health-monitor
Message-ID: <c0023864-ec96-4c82-cfce-820918769d0e@linux.alibaba.com>
Date: Fri, 29 Oct 2021 16:50:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
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
Cc: Adriana Kobylak <anoo@us.ibm.com>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>,
 Deepak Kodihalli <deepak.kodihalli.83@gmail.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

We have just upgrading to openbmc 2.10.0 release, and also enabled 
dynamic sensor and hybrid sensor for phosphor-ipmi-host. However 
ipmitool sdr command shows below 3 warnings:

ipmitool: ipmi_sdr_get_record() failed
ipmitool: ipmi_sdr_get_record() failed
ipmitool: ipmi_sdr_get_record() failed

I made some investigation and found it is caused by 3 sensors generated 
by phosphor-health-monitor. I also found the direct cause is that 
getManagedObjects() in ipmi-host fails to run against 
xyz.openbmc_project.HealthMon root "/" object.

Do you have any idea about the root cause and how to fix it?

Thanks,

Heyi

