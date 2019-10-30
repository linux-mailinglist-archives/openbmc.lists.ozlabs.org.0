Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADEEA297
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 18:30:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Fpc6nq6zF4cl
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 04:30:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473FfQ1XNgzF4Y1
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 04:23:24 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 10:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,248,1569308400"; d="scan'208";a="400209221"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2019 10:23:20 -0700
Subject: Re: huntergate not included in intel-ipmi-oem
To: Patrick Venture <venture@google.com>
References: <CAO=notzWsPTty_3imuC2ChNWpEnkfGfpc0jZ_NMoL-sS3LnihQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <11a4d0a2-5306-3fc6-b383-f5a867ef704e@linux.intel.com>
Date: Wed, 30 Oct 2019 10:23:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzWsPTty_3imuC2ChNWpEnkfGfpc0jZ_NMoL-sS3LnihQ@mail.gmail.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/30/19 10:16 AM, Patrick Venture wrote:
> James;
> 
> It looks ilke huntergate has a cmake file in intel-ipmi-oem but it's
> not actually explicitly included.  Is this an oversight?  Or is it
> implicitly included?
> 
> We ran into an issue with non-bitbake dependencies a while back
> (leading to: https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24581)
> and I wondered if this was needed here or if huntergate was just
> present but not actually downloaded/built.
> 
> Cmake is not all magic, but maybe this is magic.

Looks like in some of the reformatting it was removed. Hunter was 
originally used to download dependencies, entity-manager still builds 
completely out of tree and uses it to install GTest (although an 
alternative could probably be used as well, hunter was just easy at the 
time). I know a while back Vernon got tired of maintaining all of the 
dependencies, so intel-ipmi-oem no longer builds without the CI docker 
or Yocto. That file can probably just be deleted now.

-James

> 
> Patrick
> 
