Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7441B02B6
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 19:32:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T89D4wZWzF3n1
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 03:32:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T88c49c6zF3nd
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 03:31:43 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 10:31:41 -0700
X-IronPort-AV: E=Sophos;i="5.64,494,1559545200"; d="scan'208";a="185884516"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 10:31:40 -0700
Date: Wed, 11 Sep 2019 10:31:39 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Neeraj Ladkani <neladk@microsoft.com>
Subject: Re: RMCP support
Message-ID: <20190911173139.GE45301@mauery.jf.intel.com>
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
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

On 11-Sep-2019 05:27 AM, Neeraj Ladkani wrote:
> Is there any plan to add RMCP support in IPMI LAN stack ?

There are no plans for adding RMCP support. RMCP is horribly insecure; 
even more insecure than the least secure RMCP+ cipher suites (not 
counting cipher suite 0, which should not even be a thing.)

Not implementing RMCP was an intentional choice. RMCP+ is insecure, 
especially with passwords shorter than 8 (as shown by Rick Altherr's 
OSFC 2019 presentation). It is recommended that RMCP+ is only used with 
cipher suite 17 and maximum length passwords (20 characters). Ideally, 
it would not be used at all, preferring Redfish, which uses modern 
crypto.

Every open source IPMI utility out there supports RMCP+. That should be 
used instead of RMCP.

--Vernon
