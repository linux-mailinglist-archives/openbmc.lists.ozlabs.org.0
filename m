Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D5B580C
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 00:34:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xyb52ltJzF3LM
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 08:34:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XyZQ4ZCFzF13V
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 08:33:48 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 15:33:46 -0700
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="270672659"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 15:33:45 -0700
Date: Tue, 17 Sep 2019 15:33:44 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: RMCP support
Message-ID: <20190917223344.GH45301@mauery.jf.intel.com>
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <20190911173139.GE45301@mauery.jf.intel.com>
 <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
 <20190913184108.GG45301@mauery.jf.intel.com>
 <2ed2b99b-23c1-88bb-7895-9e58706e6f7e@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ed2b99b-23c1-88bb-7895-9e58706e6f7e@yadro.com>
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

On 17-Sep-2019 12:16 PM, Alexander Amelkin wrote:
> 13.09.2019 21:41, Vernon Mauery wrote:
> >> What about RMCP pings used for device discovery as described in section 13.13 of
> >> IPMI specification?
> > I don't have any problem in particular with RMCP Ping, but it is not 
> > implemented. It is not required by RMCP+ as far as I can tell. The spec 
> > calls out that is *is* required for RMCP, and can be implemented for 
> > RMCP+.
> >
> >> AFAIK, it's not supported in OpenBMC and so `ipmiutil discover` fails to
> >> discover OpenBMC devices.
> > From what I can tell, the spec suggests that you send a Get Channel 
> > Authentication Capabilities request to discover RMCP+ devices.
> 
> True, but you can't send a broadcast GetChAuthCap and just gather all the
> answers like you can do with RMCP ping.
> 
> `idiscover` is much easier and faster to use than `idiscover -g -b 172.16.1.1 -e
> 172.16.1.254`. The latter takes like 15 minutes to complete versus like 2
> seconds for plain `idiscover`.

This seems like it might be a case of poor implementation. Surely it is 
possible to send 254 GetChAuthCap requests in less than 15 minutes. They 
could all be sent in milliseconds, with the responses coming in out of 
order and compete performance-wise with a broadcast.

> Do you think implementing RMCP ping support in OpenBMC is feasible?

I would not block a patch that implemented it, especially if it was a 
configure option that could be enabled at build time.

I don't have any plans of implementing it unless my marketing/management 
teams require it. So far, everyone is fine without it.

--Vernon
