Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37571DB94C
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 18:28:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ryqn6JdRzDqfK
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 02:28:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rypy33rzzDqXT
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 02:28:08 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <6bd3254af95cbd8ae44151f62114acca9d221962.camel@fuzziesquirrel.com>
Subject: Re: Processing PLDM FRU information with entity manager
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, James Feist
 <james.feist@linux.intel.com>, "Thomaiyar, Richard Marian"
 <richard.marian.thomaiyar@linux.intel.com>, "Bhat, Sumanth"
 <sumanth.bhat@intel.com>
Date: Wed, 20 May 2020 12:28:19 -0400
In-Reply-To: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2020-05-19 at 09:10 +0530, Deepak Kodihalli wrote:

Hi Deepak

> I see there is provision for persistence, but it looks like
> applying the persisted information works only if "D-Bus probes"
> succeed.

This prompted me to take a closer look - as far as I can tell
system.json is for debugging purposes only.  Maybe James could confirm.

Given this we should probably have an application layer other than
entity-manager layer be responsible for maintaining the PLDM FRU
objects on the DBus at the correct time. 

> the BMC will no longer have the raw PLDM FRU information on D-Bus

I think we have to fix this.  It doesn't feel right that the PLDM FRU
DBus objects come and go off the bus as the system is powered on/off.

> How are hierarchical relationships between FRUs supposed to be 
> represented? Is that based on D-Bus pathnames? Or making use of 
> something like the D-Bus Associations interface? Any thoughts on how 
> representing such parent-child relation can be achieved via entity 
> manager configs?

I'm also hoping James or Richard will let us know what their thoughts
are for doing this.

-brad
