Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD029D2DD
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 17:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HGKQ0wgBzDqjQ
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 01:35:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGJr38lKzDqQX
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 01:34:34 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 08:34:32 -0700
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="174242438"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 08:34:31 -0700
Date: Mon, 26 Aug 2019 08:34:30 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Harry Sung1 <hsung1@lenovo.com>
Subject: Re: Leverage source code from another repository
Message-ID: <20190826153430.GA45301@mauery.jf.intel.com>
References: <e806efd25d7248d29f411ef4dedfec2f@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e806efd25d7248d29f411ef4dedfec2f@lenovo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 23-Aug-2019 10:27 AM, Harry Sung1 wrote:
> Hi Team,
> 
> Is it ok to leverage source code from another repository?
> For example, if I only want to use the FRU write command from intel-ipmi-oem.
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L316
> 
> Is it allowed to copy it into our ipmi oem library?

The licenses on the repositories allow it. As long as the copyrights are 
kept and the licences don't conflict, it should be fine.

That being said, many of the handlers in intel-ipmi-oem work well 
together and it may be that you just want to include the whole provider 
libarary.

--Vernon
