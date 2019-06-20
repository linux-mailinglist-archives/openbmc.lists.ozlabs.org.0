Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0544DC7D
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 23:28:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VFLJ2MPbzDqd0
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 07:28:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VFG93CWszDrLj
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 07:25:05 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 14:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,398,1557212400"; d="scan'208";a="168636400"
Received: from unknown (HELO [10.241.241.42]) ([10.241.241.42])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2019 14:23:50 -0700
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Change IPMI chassis status to use xyz.openbmc_project.State.Chassis
 instead of pgood
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <0e3c47fa-206a-0a45-1834-d19a0b9a8556@linux.intel.com>
Date: Thu, 20 Jun 2019 14:23:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
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

Hello,

In this review, I'm proposing that IPMI should not directly read the 
status of pgood for the IPMI Chassis Status and should instead use
xyz.openbmc_project.State.Chassis: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/21787.

The change assumes that anyone using this IPMI command (and the current 
pgood property) also supports the xyz.openbmc_project.State.Chassis 
interface and the change will be seamless.  However, Emily wisely 
suggested in the review that I should double-check that assumption.

If there is anyone who requires the IPMI Chassis Status command to work 
using only pgood and not xyz.openbmc_project.State.Chassis, please 
comment in the review, so we can figure out the right solution.

Thanks!
-Jason
