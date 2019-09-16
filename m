Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA7B440A
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 00:34:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XLdq1YLHzF3DQ
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 08:34:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XLdF23WkzF27c
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 08:34:06 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 15:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="198492009"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 16 Sep 2019 15:34:02 -0700
Subject: Re: Initial expired passwords - initial commit
To: Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <b15904b6-aeaa-f3b1-1a62-ba7217727b79@linux.ibm.com>
 <38b5f461-98d8-4152-3795-cfa3e975d178@linux.vnet.ibm.com>
 <3a5d8de0-bb39-f2de-ffbc-b1900d864f88@linux.ibm.com>
 <92a01ad9-ee40-1b9e-f516-764013358fe4@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <e1210c14-4341-89d9-3051-6b9223d503df@intel.com>
Date: Mon, 16 Sep 2019 15:34:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92a01ad9-ee40-1b9e-f516-764013358fe4@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 9/15/19 11:12 PM, Joseph Reynolds wrote:
> The first commit for this is available in gerrit review.  It implements 
> most of parts 2 and 2a above.  The BMCWeb issue for discussion is here: 
> https://github.com/openbmc/bmcweb/issues/103#issuecomment-530969632

I was wondering why this wasn't showing on my normal filter list.  It
helps a lot if you get your code building in CI before requesting
reviews.  It helps if maintainers are able to build, test, and review it
in one shot, in that order.
