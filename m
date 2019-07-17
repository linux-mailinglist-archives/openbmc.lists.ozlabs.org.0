Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E96C001
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 19:00:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pk6l3QhSzDqQK
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 03:00:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45pk646fbvzDqNw
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 03:00:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABC7128;
 Wed, 17 Jul 2019 10:00:04 -0700 (PDT)
Received: from supven01-thinkstation-p720.austin.arm.com
 (supven01-thinkstation-p720.austin.arm.com [10.118.30.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A465F3F71F;
 Wed, 17 Jul 2019 10:00:04 -0700 (PDT)
Message-ID: <6c8358ba6edda830110b331be552beedba0a50a2.camel@arm.com>
Subject: Re: Out-of-band NIC management
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Ben Wei <benwei@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
In-Reply-To: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Date: Wed, 17 Jul 2019 16:43:14 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: Jeff.Booher-Kaeding@arm.com, dong.wei@arm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-16 at 16:45 -0500, Ben Wei wrote:
> Hi all, 
Hi Ben,
>  
> Would anyone be interested in collaborating on out-of-band NIC
> management and monitoring?
Yes. If there is an existing implementation that can be
leveraged/extended within OpenBMC, it will be fantastic.

>  
> 
> DMTF has as a NCSI spec (
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.1.0.pdf
> ), that defines a standard interface for BMCs to manage NICs.
I assume that NC-SI over MCTP Binding 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0261_1.2.1.pdf
 will also be targeted. Correct?

Jeremy was working on MCTP, so we should collaborate with Jeremy and
team. 


> And in kernel 5.x , NC-SI driver supports Netlink interface for
> communicating with userspace processes.
>   
> I'm thinking adding the following tools to OpenBMC as a starting
> point and build form there:
>  
>       1. A command line utility (e.g. ncsi-util) to send raw NC-SI
> commands, useful for debugging and initial NIC bring up, 
>       For example:
>           ncsi-util -eth0 -ch 0 <raw NC-SI command>
>  
>       We can further extend this command line tool to support other
> management interfaces, e.g sending MCTP or PLDM commands to NIC.
>  
>       2. A daemon running on OpenBMC (e.g ncsid) monitoring NIC
> status,  for example:
>           a. Query and log NIC capability and current parameter
> setting
>           b. Periodically check NIC link status, re-initialize NC-SI
> link if NIC is unreachable, log the status
>           c. Enable and monitor NIC Asynchronous Event Notifications
> (AENs) 
>                 i. such as  Link Status Change, Configuration
> required, Host driver status change
>                 ii. there are OEM-specific AENs that BMC may also
> enable and monitor
>                 iii. either log these events, and/or performs
> recovery and remediation as needed
>           d. Additional monitoring such as 
>                 i.  temperature (not in standard NC-SI command yet), 
>                 ii. firmware version, update event, network traffic
> statistics
>  
> Both the CLI tool and the monitoring daemon can either communicate to
> kernel driver directly via Netlink independently, or we can have the
> ncsi daemon acting as command serializer to kernel and other user
> space processes.
> These are just some of my initial thoughts and I'd love to hear some
> feedback if these would be useful to OpenBMC. 
> 
> If anyone in interested in collaborate on these we can discuss more
> on features and design details.
I am interested in collaborating on the design details.

>  
> Regards,
> -Ben

Thanks,
Supreeth

