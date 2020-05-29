Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5291E81E1
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 17:34:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YTBb3cvRzDqhD
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 01:34:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=apparao.puli@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YT9q217YzDqgw
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 01:33:33 +1000 (AEST)
IronPort-SDR: 6J9kh48+MRA0+cYlq258ZvH22KMDnHjxqB5/bFKAME+2J2fWotbwwzEJDN7lqGt4wtgSlfkVTN
 sbiR9x/NiT+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 08:33:29 -0700
IronPort-SDR: jK8MhsX2hodo/Qf0dKkjIP+F1mcuc01cspyVBTwDie/JGXh6c5n565BGHDrFL+agJa3ayw+sk6
 DjBtiPxOwNBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="415005907"
Received: from apuli-mobl.gar.corp.intel.com (HELO [10.213.118.222])
 ([10.213.118.222])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2020 08:33:27 -0700
To: geissonator@yahoo.com, vikram.bodireddy@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Puli, Apparao" <apparao.puli@linux.intel.com>
Subject: request to add pfr-manager repo to CI
Message-ID: <63ac8cfd-86b9-43fe-91a0-60f60b4469ee@linux.intel.com>
Date: Fri, 29 May 2020 21:03:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
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

Hi Andrew,

    Can you please add "pfr-manager" repo to CI builds?

https://github.com/openbmc/pfr-manager

https://gerrit.openbmc-project.xyz/#/q/project:openbmc/pfr-manager


Thanks,

-Appu

