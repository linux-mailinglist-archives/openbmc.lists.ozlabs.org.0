Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA619485F
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 21:07:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pGGz1ZKSzDr1r
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:07:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pGFh32fJzDr09
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 07:05:58 +1100 (AEDT)
IronPort-SDR: Pxon/SNSEIvc7hArNRqPVQ0VU7t5U+ImPpJFLE9NYfZybs5DzwHMDC/Ol1d+zrUxVQe0sFMsD2
 KpG/u9sXYp6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 13:05:54 -0700
IronPort-SDR: PUvV5HTv9nwfPkxQBglhc86tOddpYyrnwNF/trn5T37zCq4Rlsff6UcOMbh7se3qZCpE5gUsp3
 I0CeGNWLD+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,309,1580803200"; d="scan'208";a="271302745"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 26 Mar 2020 13:05:54 -0700
Received: from [10.212.134.252] (jmbills-mobl.amr.corp.intel.com
 [10.212.134.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4EBBE580297;
 Thu, 26 Mar 2020 13:05:54 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 bradleyb@fuzziesquirrel.com
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: New repos request
Message-ID: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
Date: Thu, 26 Mar 2020 13:05:53 -0700
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

Hi Brad,

We're doing some housekeeping and have some code various places that 
we'd like to move into github.com/openbmc repos.

I'd like to request the following four new repos, if possible:
host-error-monitor
libpeci
pfr-manager
service-config-manager

Please let me know if you have any questions.  Thanks!
-Jason
