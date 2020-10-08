Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385A287E51
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 23:49:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6lGx2rhVzDqYX
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 08:49:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6lG34y9NzDqWn
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 08:48:59 +1100 (AEDT)
IronPort-SDR: Cc1Xg7raDElvWBWgnajw/KmLQ1eIV01qQBfeV8K06qiB4j0+p3DelI0wg0FwbR4Y6/kC7KCz9m
 s+hong3UfWJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="164620769"
X-IronPort-AV: E=Sophos;i="5.77,352,1596524400"; d="scan'208";a="164620769"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 14:48:56 -0700
IronPort-SDR: dZVZVRPagQSN/V+rPvHnUSlEM8SPK3ZcvWG/cBjr7QgnSvgiF67x1ba9Jsr8bRHDLcQQaltgEf
 TGzRyJ06sjcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,352,1596524400"; d="scan'208";a="343576005"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2020 14:48:56 -0700
Received: from [10.212.197.202] (jmbills-MOBL.amr.corp.intel.com
 [10.212.197.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4D88258066D;
 Thu,  8 Oct 2020 14:48:56 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 geissonator@yahoo.com
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Add peci-pcie repo to CI
Message-ID: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
Date: Thu, 8 Oct 2020 14:48:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Andrew,

Could you please add the openbmc/peci-pcie repo to the CI jobs?

https://gerrit.openbmc-project.xyz/c/openbmc/peci-pcie/+/37239

Thanks!
-Jason
