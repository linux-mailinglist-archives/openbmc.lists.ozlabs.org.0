Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D7D2FFC
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 20:08:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pzbn1fkVzDqLJ
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:08:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pzXV6gKkzDqRg
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 05:05:44 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 11:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="207240958"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2019 11:05:41 -0700
Subject: Re: Redfish Aggregator
To: openbmc@lists.ozlabs.org
References: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
 <2F98B4CC-2C61-4AF7-B41A-897C9BA4E32F@fuzziesquirrel.com>
 <CADfYTpEut49XPWs+Ahz5dsRgayLkHToRh-6btHeqbaSR3wnK2A@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <0b5a46e8-748b-faa0-59fd-c548810c9b12@intel.com>
Date: Thu, 10 Oct 2019 11:05:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADfYTpEut49XPWs+Ahz5dsRgayLkHToRh-6btHeqbaSR3wnK2A@mail.gmail.com>
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

On 10/10/19 10:09 AM, Nancy Yuen wrote:
> Thanks Brad!  We are envisioning aggregating the separate Redfish stacks
> to present a single unified system view.  There is another slide deck of
> Redfish Aggregator requirement uploaded to DMTF a few days ago with a
> slightly different idea of aggregation (it sounds more like batching,
> the aggregator will send a reboot or a fw update, to a bunch of redfish
> stacks on multiple systems).
> 

You might want to look at this bmcweb fork that Inspur built for exactly
this.
https://github.com/inspur-bmc/rmcweb


It wasn't built the way I would've recommend it be built, and a lot of
it is relying on fake data, but it's a reasonable example of wiping out
all the bmcweb Redfish endpoints and replacing them with aggregator
ones, without having to modify the core.
