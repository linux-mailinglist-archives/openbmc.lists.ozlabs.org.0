Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5201AAD8B
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 23:02:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PY701SFyzDr5d
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 07:02:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PY6L6KkJzDr4g
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 07:02:11 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 14:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,471,1559545200"; d="scan'208";a="195224247"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 05 Sep 2019 14:02:07 -0700
Subject: Re: Expired password + disabled power button design
To: openbmc@lists.ozlabs.org
References: <af6cb67f-1d0f-1dcf-8b88-5b7950a5bc1b@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <008a1d47-3012-2007-af87-05f46392759f@intel.com>
Date: Thu, 5 Sep 2019 14:02:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af6cb67f-1d0f-1dcf-8b88-5b7950a5bc1b@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

On 9/5/19 1:19 PM, Joseph Reynolds wrote:
> HOWEVER, there is a hole in this design which extends the time window
> indefinitely.  The scenario begins when the installer takes possession
> of a new system (BMC + host) and plugs it into power.  At this point,
> the BMC starts running and offering its services to network users. 
> The host remains powered off.  The installer then disregards the BMC
> and uses the power button to boot the host system, then continues to
> disregard the BMC when provisioning the host, either using physical
> access to the host (not via the BMC), or a pre-configured host.  This
> results in a fully-functional host and a BMC which still has its
> default password.
> THEREFORE, I am proposing a new "disabled power button" image
> feature.  Normally, pressing the power button tells the BMC to power
> on and boot the host.  With this design, if the BMC still has its
> default expired password, it will ignore a power button press, and
> will instead indicate to the operator to configure the BMC's password,
> and try again.  Options for the BMC to indicate this are
> machine-specific and include: messages to an operator panel, or LED
> blink codes.  The recovery procedure is for the installer to access
> the BMC, change its password, and try again to power on the server.
>

This goes completely against one of the principals that some commercial
products hold dear:  The BMC should NEVER be able to brick the host.

In a perfect world, the BMC would never crash, get loaded with bad
firmware or brick itself.  In practice, this is far from the case.  In
general the primary avenue used to resolve these cases is a force
firmware update jumper, and a download of a new (fixed) firmware via KCS
or block transfer.  For that flow to function, the power button needs to
work, and the host needs to boot, otherwise the board is considered
bricked, and needs to be returned to the factory to be reflashed.

With all of the above said, if it's an option that can be disabled (and
hopefully disabled by default) I have no objection to it, but I don't
think it's an acceptable solution for most of the BMCs out on the market
today.


Another option for your scenario would also be to default the BMC to a
static IP of 0.0.0.0, and disable the NIC(s) by default.  To set up the
network, a user would need to log into the BMC the first time over an
in-band channel, set their password, then set up either a valid static
IP, or DHCP.  This is how some of the more security conscious BMCs I
know of get around this problem today.

