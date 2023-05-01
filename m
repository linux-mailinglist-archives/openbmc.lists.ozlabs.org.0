Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 866196F3B1A
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 01:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9KqR2zQKz3c4w
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 09:56:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k03BlrLm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k03BlrLm;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Kpq6Nw1z3bNj
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 09:55:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682985348; x=1714521348;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=ej1hZHAMbWEBLDqlGsHltEKZlgtocu12d39zVvndRtk=;
  b=k03BlrLmVEcR0Pqfgk+6VPHm9gRgcbpoxS43FTQWpiKJSAVQ3mRiaofn
   8ibLw8aGLhYpsyBfmfCWp09HEo/AZH07/H6DE4LESBFjwvH6zZmr+GI3c
   1j40YwbC2pkR88+5S8db2by9vxFiqAW5VlAiO2ABT2agi0hjdNUHmif/9
   l5+I9echmEAULQntg2GTk/b17W8WxxS8VWK0brXiEJgqw+fiWfNrEWwPY
   9d1WzFq6LrJwR8nOuLhkpbHfAg8NDAC3tIuh1VSzePNdKrtU9UAiNWSK3
   6tzoRhCervv3ga3j92DVmPnRQVJ8VkDMOfCLzw+z8+Qvc/xzQ9rjB06II
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="348314247"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="348314247"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 16:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942220725"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="942220725"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 16:55:40 -0700
Received: from [10.213.179.149] (jmbills-mobl1.amr.corp.intel.com [10.213.179.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B4F5D580692
	for <openbmc@lists.ozlabs.org>; Mon,  1 May 2023 16:55:40 -0700 (PDT)
Message-ID: <8b8a6d99-ae3b-499d-0f77-95bb619b1a0e@linux.intel.com>
Date: Mon, 1 May 2023 17:55:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: libpam 1.5.2 update
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

Hi All,

I have pushed a change to update libpam to 1.5.2: 
https://gerrit.openbmc.org/c/openbmc/openbmc/+/41357.

This update deprecates both pam_tally2 and pam_cracklib and replaces 
them with pam_faillock and pam_pwquality, respectively.

Please review and test if you have any customizations around the 
deprecated modules.

I did my best to convert existing code that I found related to 
pam_cracklib over to pam_pwquality.

If you have any affected code in meta-ampere, meta-google, or 
meta-supermicro, please check it to make sure I have correctly applied 
your changes.

Thanks!
-Jason
