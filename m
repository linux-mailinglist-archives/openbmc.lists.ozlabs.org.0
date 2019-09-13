Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A43B254B
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 20:42:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VPdJ01hYzF5q4
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 04:42:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VPbs0vkkzF4ps
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 04:41:12 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 11:41:09 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="269508444"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 11:41:09 -0700
Date: Fri, 13 Sep 2019 11:41:08 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: RMCP support
Message-ID: <20190913184108.GG45301@mauery.jf.intel.com>
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <20190911173139.GE45301@mauery.jf.intel.com>
 <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 13-Sep-2019 10:50 AM, Alexander Amelkin wrote:
> 11.09.2019 20:31, Vernon Mauery wrote:
> > On 11-Sep-2019 05:27 AM, Neeraj Ladkani wrote:
> >> Is there any plan to add RMCP support in IPMI LAN stack ?
> > There are no plans for adding RMCP support. RMCP is horribly insecure; 
> > even more insecure than the least secure RMCP+ cipher suites (not 
> > counting cipher suite 0, which should not even be a thing.)
> >
> > Not implementing RMCP was an intentional choice. RMCP+ is insecure, 
> > especially with passwords shorter than 8 (as shown by Rick Altherr's 
> > OSFC 2019 presentation). It is recommended that RMCP+ is only used with 
> > cipher suite 17 and maximum length passwords (20 characters). Ideally, 
> > it would not be used at all, preferring Redfish, which uses modern 
> > crypto.
> >
> > Every open source IPMI utility out there supports RMCP+. That should be 
> > used instead of RMCP.
> 
> What about RMCP pings used for device discovery as described in section 13.13 of
> IPMI specification?

I don't have any problem in particular with RMCP Ping, but it is not 
implemented. It is not required by RMCP+ as far as I can tell. The spec 
calls out that is *is* required for RMCP, and can be implemented for 
RMCP+.

> AFAIK, it's not supported in OpenBMC and so `ipmiutil discover` fails to
> discover OpenBMC devices.

From what I can tell, the spec suggests that you send a Get Channel 
Authentication Capabilities request to discover RMCP+ devices.

--Vernon
