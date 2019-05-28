Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0B2CED1
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2019 20:42:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D2kd41JKzDq8W
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 04:42:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D2k70DRPzDqJ7
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 04:41:34 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 11:40:19 -0700
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 11:40:19 -0700
Date: Tue, 28 May 2019 11:40:18 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@lists.ozlabs.org>
Subject: U-Boot environment management from userspace
Message-ID: <20190528183802.GH15959@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reading U-Boot environment variables from userspace is not difficult, 
but to do it in a standard way, (fw_printenv), it requires a fork and 
exec. We don't have any permissions problems because reading from the 
MTD partition is not restricted. It might be nice, however to have these 
variables exported on D-Bus so that a fork/exec is not necessary, just a 
property fetch.

But writing is a different story. That requires root privileges. To 
architect with a separation of privileges mechanism, this should 
probably be running as a daemon or service that could be spawned via 
D-Bus or something so that ipmid doesn't need root permission to set a 
U-Boot variable.

I see a couple of options:
1) Shoehorn U-Boot variables into the settings daemon so they just show 
up as settings. I am not sure on the details of how this would be done, 
but it might work.

2) Create yet another daemon that would provide a R/W interface 
(probably just using the D-Bus properties interface) that would act as a 
manager of U-Boot environment variables. It might even be able to place 
an inotify watch to get notified when an external process (fw_setenv) 
modifies the environment (like from a script or something) so the D-Bus 
properties could send out a PropertiesChanged notification.

3) Use a one-shot service that parses the 'instance' to extract a 
variable name and variable value. Then the variable could be activated 
by launching ubootenv@foo=bar.service. This would require some fancy 
parameter encoding to make it all work correctly to avoid string 
injections. 

Am I the only one that has a need for this or is there a wider audience 
that would benefit?

Does anyone else already have a solution for this or an opinion on what 
path might be the best?

--Vernon
