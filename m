Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D8820A3F5
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 19:27:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t6R55cS6zDqwy
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 03:27:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t6QB6LqqzDqb1
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 03:26:57 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <477bd1782b6c5f9cfea6f6340ecd207a9c01fb20.camel@fuzziesquirrel.com>
Subject: Re: Redfish EventService Implementation
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, Patrick Williams
 <patrick@stwcx.xyz>
Date: Thu, 25 Jun 2020 13:26:14 -0400
In-Reply-To: <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
 <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-06-23 at 12:57 +0530, Ratan Gupta wrote:
> 1) Client would subscribe for the Redfish Resource(eg:ManagerAccount)
> to receive events like Account add/delete/modify.  Hence need for
> mapping from (RedfishResource to Dbus Resource)
> 
> 2) Have the mapping info from Redfish resources to DBUS Resources
> (Some JSon file may have this mapping)

It probably doesn't make sense to have any json files.  The application
logic itself does the mapping.

> 3) Have the reverse mapping from DBUS Resources to Redfish Resources
> This is needed to send the Redfish event if there is any changes in
> the corresponding D-bus resources. eg BMC state change/network change
> etc.
> 
> 4) bmcweb would monitor the DBUS events
> 
> 5) Get the Redfish Path from the Mapping(3) and send the Redfish event

Let me try to restate 3-5.  We already have application logic in bmcweb
that maps redfish resources to dbus interfaces, triggered by redfish
client requests (like a GET or PATCH).  The proposal here I think is to
implement the reverse - add application logic in bmcweb that maps dbus
interfaces to redfish resources, triggered by dbus signals.  I think
this is more or less what was suggested by Patrick?

> Don't we, in effect, have the mapping from Redfish to dbus by nature
> of the Redfish providers that create their content from dbus objects?

> James, Apparao: Please let me know if there is any more concern with 
> this approach.

Ratan you had 2x #2s in the flow above, which I fixed.  Please let me
know if I got it wrong.

The main concerns with this approach that I have heard are too many
signal matches and complexity of the logic implementing the reverse map.
I can definitely see how the logic will get complicated given our
current dbus data model.

One idea floating around to address these is inventing a journal
metadata scheme that is management interface agnostic.  I understand the
motivation behind that - it is much simpler for an application to slide
a single journal entry into the journal with all the metadata needed to
generate events, than it is for an application to snoop multiple signals
off dbus and pull events out of that.

But I wonder if inventing a management interface agnostic scheme for
adding events to the journal is really just inventing a new data model
for how we represent things in a server - e.g. are we just working
around our dbus data model?  Maybe we should fix it instead, so that it
isn't so difficult for applications to use it?  With that said I don't
know how to do this and I could use more concrete details on which areas
of the data model make it hard to consume signals.  Does anyone have any
ideas or examples?
