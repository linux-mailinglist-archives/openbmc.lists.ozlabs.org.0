Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E0344EB3
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 19:41:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F43HP2R91z30DL
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 05:41:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 23 Mar 2021 05:41:12 AEDT
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F43HD3rHMz2xgG
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 05:41:12 +1100 (AEDT)
IronPort-SDR: hExNaXLAC/AX48KNaj+MeRd75Af6AeXaxw6jKnZs/9MBZTF45B7Nq7Kl4sfnG5rI3X6KtCpYGV
 l3lq5i/euWCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="170288580"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="170288580"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 11:40:01 -0700
IronPort-SDR: 86vhUa2WcDqdwzR8QsPKMRLE2Ut8UJVebr+tP3lmB6j2jmokSWD/4lCQE8xYGzPe8qyShFNPu6
 plOb5KPLYUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="381076852"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2021 11:39:59 -0700
Received: from [10.209.38.161] (jmbills-MOBL.amr.corp.intel.com
 [10.209.38.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 30A79580718
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 11:39:59 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Crashdump Redfish Interface
Message-ID: <efe6e09d-642f-8ded-3664-b0820aa92790@linux.intel.com>
Date: Mon, 22 Mar 2021 11:39:57 -0700
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

Hi All,

I have a change in review that impacts the Redfish interface for Intel 
Crashdump. https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41269

The change itself updates the LogService to the latest Redfish schema 
which will make it incompatible with the current schema.

There is also discussion in the review to potentially remove the 
LogService from bmcweb with a goal to eventually make a more generic 
LogService for it.

Is anyone using this LogService that would be impacted by either 
modifying or removing it?

Thanks,
-Jason
