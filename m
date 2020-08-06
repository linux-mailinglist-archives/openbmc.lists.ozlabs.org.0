Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A277623E34D
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 22:41:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN0kn08JfzDqv3
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 06:41:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN0jl4pPZzDqtj
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 06:40:10 +1000 (AEST)
IronPort-SDR: uk4TT3DbFhPOHc31z56QXVuMtIKEFWjfPbFTliWGha6iUt5EU/ms6XleYnure3cLj/5vRqywFw
 PgI7x+URusqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="140517449"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; d="scan'208";a="140517449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 13:40:06 -0700
IronPort-SDR: eAEwyS/vRtcJfzICjgUgKOibYWuXHIOUb4KxnXV2AFW24vYrPW8aAUAlCmE9p0EskdSxQF9ug8
 dc8L9NePZbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; d="scan'208";a="437675919"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.213.173.20])
 ([10.213.173.20])
 by orsmga004.jf.intel.com with ESMTP; 06 Aug 2020 13:40:06 -0700
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
Date: Thu, 6 Aug 2020 13:40:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
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

On 8/5/2020 4:42 PM, Jason Ling wrote:
> In order to maintain backwards compatibility I am proposing an OmitList 
> attribute that hwmontemp will attempt to retrieve.
> If the "Name"s of any temp sensor appears in the list, it will be skip 
> sensor creation.

Why not just make it so that "Name.*" is required, that way you can skip 
the first one?

Either that, or something like PSU sensor and have a list of what labels 
you want to support?
