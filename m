Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CA643C1C2
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 06:39:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfGDb3wvyz2yYx
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 15:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfGDL195Zz2xWr
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 15:38:56 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210156068"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="210156068"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 21:37:52 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="465589272"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 21:37:52 -0700
Date: Tue, 26 Oct 2021 21:37:51 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Ed Tanous <edtanous@google.com>,
 Development list for OpenBMC <openbmc@lists.ozlabs.org>
Subject: bmcweb non-standard OEM integration
Message-ID: <20211027043751.GB1786414@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

I can't imagine that Intel is the only company on this project that has 
a set of patches against bmcweb. Some of these are for features that 
have not yet been released. Some of these are for OEM things that don't 
fit any of the Redfish-OEM schemas. Some are for features that are 
long-standing upstream reviews that have not yet been merged for 
whatever reason.

We want to move away from patches. We want to be able to share our 
changes with the community. Right now, there is not a way for this sort 
of OEM changes getting into bmcweb. I know not everyone is a huge fan of 
the way that the ipmi-providers code works, but it does work. Companies 
need to be able to have those changes that allow them to differentiate 
from the common phosphor core. I am proposing that we make changes to 
bmcweb that would allow this sort of OEM customization.

I don't have a full proposal yet. But I wanted to get this concept out 
in the open before diving headlong into a metaphorical brick wall. While 
I compared what I would like to the ipmi-providers mechanism, there are 
other ways to do this that can work around many of the objections that 
have been raised to that architecture.

--Vernon
