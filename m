Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 531082186F7
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 14:11:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1ypf21CRzDqWF
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 22:11:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1ynb1p2rzDqCF
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 22:10:57 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 8 Jul 2020 08:09:47 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Redfish Processor Command
Message-ID: <20200708120947.a64s37tctqxzmhig@thinkpad.dyn.fuzziesquirrel.com>
References: <16576aa9-ae11-82b7-8f31-88f82684d703@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <16576aa9-ae11-82b7-8f31-88f82684d703@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, john.leung@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 06, 2020 at 03:13:30PM -0700, Bills, Jason M wrote:
>Hi All,
>
>Intel processors have an interface called PECI that allows commands to 
>be sent to the processor from the BMC, and we currently provide a 
>Redfish OEM action to send PECI commands to the processor.
>
>We proposed to the DMTF to add a standard command action to the 
>Redfish Processor resource for this purpose, and their suggestion was 
>to just keep it as an OEM action.
>
>We're now trying to figure out the right way to handle this capability 
>in OpenBMC.  Would anyone else have use of a generic processor command 
>action in our OpenBMC Redfish implementation?

I'd be able to make use of a common Redfish interface.  On POWER 
processors there is an embedded ppc405 core called the OCC (on chip 
controller) that provides a similar interface to the BMC.  We 
implemented a dbus pass through interface for it:

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/org/open_power/OCC/PassThrough.interface.yaml

It is implemented by this application:

https://github.com/openbmc/openpower-occ-control
