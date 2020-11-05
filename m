Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E82A83EE
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 17:49:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRqH416YTzDqcn
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 03:49:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRqGC6XnBzDr5X
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 03:48:18 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 5 Nov 2020 11:48:12 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
Message-ID: <20201105164812.ylk4wlkjnczykwpy@thinkpad.fuzziesquirrel.com>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
 <08d2b666-91cf-d60a-1f2b-028e6ca6eaa5@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <08d2b666-91cf-d60a-1f2b-028e6ca6eaa5@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 05:38:32PM +0530, Deepak Kodihalli wrote:
>To add to this, from a PLDM perspective, we plan to send up the 
>hypervisor network config properties to the host as BIOS attributes.

Would we need to hide these from a future redfish bios settings schema 
implementation?

>There isn't a PLDM network config schema. The PLDM daemon talks to the 
>new bios-settings-mgr app to find BIOS properties that have been 
>updated out of band. The Redfish schema we plan to use here is 
>EthernetInterface though, and not the Redfish BIOS schema. All this is 
>causing a need for some conversion layers.
>
>My initial thought was bmcweb can update the BIOS backend store that's 
>implemented by the bios-settings-mgr, but it looks like Patrick and Ed 
>have concerns with that approach. I think I agree their reasoning, but 
>at the same time I don't think there should be special code in the 
>PLDM daemon (timers/special knowledge about a set of BIOS 
>attributes/special BIOS attribute which indicates other BIOS 
>attributes have been updated/etc) for this, and this should be 
>processed like any other BIOS attribute that the PLDM daemon deals 
>with. This implies these attributes should also make it to the store 
>that bios-settings-mgr owns (that likely means an additional D-Bus 
>hop). So, another option (proposal 4) could be an intermediate app 
>that accumulates (for eg by means of watching the 'Enabled' property 
>that's in the Object.Enable interface; the hypervisor settings object 
>would have to additionally implement this interface) the hypervisor 
>network config property updates, and then provides these as key-value 
>pairs to the bios-settings-mgr app.

I get the feeling this option 4 might have been overlooked because it 
was buried in this long thread.  Anyone care to weigh in on this as an 
option?
