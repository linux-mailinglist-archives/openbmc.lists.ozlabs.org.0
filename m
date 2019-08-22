Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB89A314
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 00:38:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DzwB6YqpzDrCB
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 08:38:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DzvS1xRgzDr7g
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 08:38:10 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 15:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,418,1559545200"; d="scan'208";a="173288198"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 22 Aug 2019 15:38:07 -0700
Subject: Re: Build break in the latest openbmc tree.
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
Date: Thu, 22 Aug 2019 15:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/22/19 3:35 PM, Jae Hyun Yoo wrote:
> Hi brad,

+ The mailing list

> 
> We met a build break while making Intel platform builds.
> 
> ERROR: No recipes available for:
> 
> /home/yoojae/workspace/openbmc/meta-security/recipes-kernel/linux/linux-stable_5.2.bbappend 
> 
> 
> It was added by the subtree update patch but there is no main recipe for 
> it. Did we miss something?
> 
> Thanks,
> Jae
