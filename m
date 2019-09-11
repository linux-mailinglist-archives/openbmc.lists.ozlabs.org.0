Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD0B0481
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 21:17:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TBVJ6fcbzF3hD
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 05:17:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TBTf1MtszF3cR
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 05:16:36 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 14A6C5C09F;
 Wed, 11 Sep 2019 15:16:33 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: QEMU native compile issue
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <b0e8e1a5-631e-9b26-1829-1f39ff3393d9@intel.com>
Date: Wed, 11 Sep 2019 15:16:32 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <41BC6E19-E61D-4F70-8E74-0FFE30C36A65@fuzziesquirrel.com>
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
 <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
 <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
 <9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com>
 <b0e8e1a5-631e-9b26-1829-1f39ff3393d9@intel.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 5:45 PM, Johnathan Mantey <johnathanx.mantey@intel.com> wrote:

> Brad,
>
> FYI...
>
> Commit c68388fc.... is part of my latest pull, which is 9d227052b.
>
> The upstream fix for QEMU native is not present in any commit 9d227052b.
> When you are unblocked please collect the QEMU update.

Thanks to Patrick we are unblocked now, and I pulled poky master HEAD  
yesterday.  Everything looks good now?

-brad
