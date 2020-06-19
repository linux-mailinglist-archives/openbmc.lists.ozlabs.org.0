Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C12004B5
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 11:11:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pCjG4RVJzDrNt
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 19:11:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pChP1T6VzDrHl
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 19:10:43 +1000 (AEST)
IronPort-SDR: Dh+wWbWbXFhkBDhlit1+A74vtU01zoUGj7LPMuZp9dFD9ZjxWCmORzIuVlsHhPei0xQE6xE75I
 9sYAqQAzz1Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="130262211"
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="130262211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 02:10:39 -0700
IronPort-SDR: KwYX7hvdES8AHzmUQak7KNdBUIIfacQK73JS/w0Q6AaMJ1k9mcYXi7lq5Zo6ZD1ePAJHddObJ/
 TrKgFzofQsGQ==
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="450951254"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.7.170])
 ([10.213.7.170])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 02:10:38 -0700
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: "Initial commit" with entire git history - possible?
Message-ID: <6e3f0ebd-9ca0-c5b6-c49a-a533cea6c9ea@linux.intel.com>
Date: Fri, 19 Jun 2020 11:10:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
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

We're developing solution which will soon end as new openbmc-hosted 
repository.

It would be nice to keep previous commit history intact when moving to 
upstream. Is it possible with our gerrit-based integration?

Regards,
Adrian
