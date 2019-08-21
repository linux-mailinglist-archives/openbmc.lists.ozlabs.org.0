Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB596E97
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:57:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cq4l5c84zDqXX
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:57:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=terry.s.duncan@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cq456m63zDr9L
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 10:56:36 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 17:56:33 -0700
X-IronPort-AV: E=Sophos;i="5.64,410,1559545200"; d="scan'208";a="169258830"
Received: from tsduncan-ubuntu.jf.intel.com (HELO [10.7.169.130])
 ([10.7.169.130])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 20 Aug 2019 17:56:33 -0700
Subject: Re: Alternative to the filesystem overlay
To: "Alexander A. Filippov" <a.filippov@yadro.com>, openbmc@lists.ozlabs.org
References: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
 <20190816090955.GA15986@bbwork.lan>
From: Terry Duncan <terry.s.duncan@linux.intel.com>
Message-ID: <791b2ada-c35d-c394-b7f0-fd3f92abeed2@linux.intel.com>
Date: Tue, 20 Aug 2019 17:56:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190816090955.GA15986@bbwork.lan>
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

On 8/16/19 2:09 AM, Alexander A. Filippov wrote:

> Most of these issues can be solved by the simple shell scripts. We could modify
> the initramfs/init scenario to exec these scripts at the moment when ROFS and
> RWFS have mounted but are not combined to OVERLAY yet.
> 
> Of course, this method doesn't prevent an occurrence of any new issues of this
> type but brings an easy way to solve them.
> 
> --
> Regards,
> Alexander
> 

Possibly the overlay FS is not expecting and does not support the ROFS 
to change as it does when a new build adds a file to an existing 
directory. When this occurs an overlayed file in the same directory 
could cause corruption in the directory. Are you suggesting scripts that 
detect a change to the underlying FS and attempt to patch the overlay?

Thanks,
Terry
