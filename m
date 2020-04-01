Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AD19B8AB
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:51:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t1dZ60GYzDqZp
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:51:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t1cm100LzDqYP
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:50:29 +1100 (AEDT)
IronPort-SDR: C4DfaG8YxbH97SJ+O79F8OF+M4EYSdR+0zLGASBiA+DqQHghuzmh5pXRmbj1jAR7MovNAdn0Xw
 0B8HB1XtiMsQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 15:50:25 -0700
IronPort-SDR: zjZ/H7Bc/Fp2/ZOk1YljNpDkBFwPPkV39NJ3GSg02w5OyfhWwBTEiKw2jGeOx7mMueZfzVVLp7
 /WTpMr3E2nMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,333,1580803200"; d="scan'208";a="267822704"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.254.67.154])
 ([10.254.67.154])
 by orsmga002.jf.intel.com with ESMTP; 01 Apr 2020 15:50:24 -0700
Subject: Re: meta-intel MAINTAINERS
To: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <a6b78144-c109-70d8-156b-c28705d5550b@linux.intel.com>
Date: Wed, 1 Apr 2020 15:50:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 4/1/2020 3:26 PM, Patrick Williams wrote:
> Can we get a MAINTAINERS file added for meta-intel?  There isn't one now
> and I'm not sure who should be added by default for any code reviews to
> it.

Pushed one for review.


> 
