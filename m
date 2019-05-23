Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA328C81
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 23:41:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4592xm5l5nzDqbG
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 07:41:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4592x93lmYzDqZF;
 Fri, 24 May 2019 07:40:44 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4NLXlGJ143403; Thu, 23 May 2019 17:40:35 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sp0gwygr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2019 17:40:35 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x4NFcfc1001449;
 Thu, 23 May 2019 15:45:14 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2sn84n295g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2019 15:45:14 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4NLeXUw23200144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 21:40:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 453D0124053;
 Thu, 23 May 2019 21:40:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABDE6124052;
 Thu, 23 May 2019 21:40:32 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 May 2019 21:40:32 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 23 May 2019 16:41:01 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Ed Tanous <ed.tanous@intel.com>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [Design] Kernel-based BMC firewall
In-Reply-To: <8d8c463f-5043-4d95-b907-02cb182dd5da@intel.com>
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
 <8d8c463f-5043-4d95-b907-02cb182dd5da@intel.com>
Message-ID: <6fc6b3b5d3872ad73316b7a82cce498d@linux.vnet.ibm.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-23_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905230138
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
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-03-04 10:14, Ed Tanous wrote:
> On 3/1/19 1:31 PM, Joseph Reynolds wrote:
>> ## Problem Description
>> 
>> OpenBMC needs an integral firewall to monitor and control its IP 
>> traffic.
> 
> Why?  I believe this needs more details here on why the current 
> solution
> is inadequate.  If some document/security policy is driving this, we
> should reference that here as well.  There _must_ be a standard or
> authority for network security that we can reference rather than
> creating our own.
> 
> I would like to see the problem description be a lot longer than 1
> sentence given how long the requirements section is.


Ed and Andrew,

Thanks for your email.  Based partly on your input, I’m dropping 
requirements which can be solved in better ways.  The remaining 
requirement is blocking ICMP packet types 13 and 14 (timestamp 
requests).  If this can be done without using a firewall, then I don’t 
see a need for a firewall at all.

Here are the requirements my previous design attempted to address, with 
updated ideas about what the firewall should do.

  - Block specific ICMP packets: Block ICMP packets of type 13 or 14 
and/or code 0 per https://nvd.nist.gov/vuln/detail/CVE-1999-0524.  Given 
this is rated as LOW severity, I wonder if it is worth pursuing.  
Alternatively, can the Linux kernel be configured to not respond to 
these packets?

  - Block TCP and UDP ports: For incoming traffic; the BMC will open 
exactly the ports it needs.  For outgoing traffic; software running on 
the BMC (which uses the network) ought to be controlled by the 
administrator.  To the extent these are true, there is no need to block 
ports, so I am not going to pursue this.

  - Block malicious packets, such as in IP fragmentation attacks 
https://en.wikipedia.org/wiki/IP_fragmentation_attack : I am not going 
to pursue this.

  - Rate limiting for authentication failures: This protects against an 
accidental denial of service (DOS) from malfunctioning automated tools 
which repeatedly fail to authenticate to the BMC.  Solving this problem 
does not require a firewall.  Instead, we can use “rate limiting in 
the individual network facing daemons” (such as IPMI, BMCWeb, ssh), 
for example, to delay a short time before sending the failure response.

  - Log traffic to diagnose network problems: I am not going to pursue 
this at this time.

  - Logging access to the BMC: Each network service already does this.

  - Limit the maximum number of active connections: Each network service 
can do this.


I am not a networking expert, so I appreciate your advice.  Additional 
comments are below.

- Joseph Reynolds


>> ## Background and References
>> 
>> The Yocto/OpenEmbedded projects offer ready-made Linux kernel-based
>> firewall recipes.  These are based on:
>>  - the Linux `netfilter` kernel modules which provide the basic 
>> capability
>>    to work with IP packets.
>>  - the `iptables` Linux command (and similar commands like ip6tables) 
>> work
>>    with netfilter tables
>>  - the `arno-iptables-firewall` package which provides shell scripts 
>> that
>>    uses iptables to establish a firewall.
>>  - the `ulogd` firewall logger package
>> 
>> References:
>> - The Linux firewall documentation:
>>   http://linuxdocs.org/HOWTOs/Firewall-HOWTO-2.html
>> - Basic concepts from Wikipedia:
>>   - https://en.wikipedia.org/wiki/Netfilter
>>   - https://en.wikipedia.org/wiki/Iptables
>> - The OpenEmbedded recipes for firewalls:
>> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=iptables
>> - Log connections via ulogd.
>> 
>> ## Requirements
>> 
>> The BMC must automatically establish a firewall when the network
>> service is started, and remove it when networking stops.  The firewall
>> rules must have reasonable defaults for a BMC.
> Why is firewall removal required?  If networking is down, that 
> shouldn't
> make any changes to the firewall, correct?
>> 
>> The firewall must have these capabilities:
>>  1. Block unauthorized IP traffic to and from the BMC.
> 
> This needs a much better definition of what "unauthorized" means.
> Technically traffic on ports that are unsupported is already "blocked"
> just based on the bind rules, and the fact that we, as a policy, don't
> run code that wasn't compiled into the image.  Under the strict 
> security
> definition of authorization, a firewall has no ability to "authorize" a
> request, except possibly based on IP.  If your goal is DOS prevention,
> _just_ a firewall is likely not enough.
> 
> I would  like to see lots more detail here.

This was removed.

>>  2. Block malicious packets.
> Like what?  Do you have any references of what kinds of "malicious"
> packets you're hoping to block?  Is there a relevant OWASP page on 
> this?

Explained above.

>>  3. Log network traffic.
> 
> This item feels like it could be a design document on its own.  I would
> hope the firewall isn't logging all network traffic.

This is removed.

>>  4. Rate-limiting to thwart denial of service attacks.
> 
> More details on how this is desired really needs to be attached.  Is
> this a per-ip rate limit?  In background, it would be good if you could
> attach some data around what rate limits a common AST platform would
> need imposed.

This is made more clear and removed above.

>> The firewall must not:
>> - Consume excessive CPU cycles.
>> - Consume excessive space in memory or on disk.
> These two things should have soft targets to define excessive.  is 5%
> overhead excessive?  50%?  2MB on flash worth it?

I was thinking more 5%.

>> The system integrator must be able to:
>> - Establish firewall rules to implement security policy.
>> - Set default IP logging behavior.
> I suspect the word "default" wasn't intended here.  Default implies 
> that
> someone can change the runtime defaults at runtime.  Unless you meant
> compile time...?

I meant the person configuring features at compile-time.
The word "default" means compile-time configuration of the default 
setting, and the setting could be changed by the BMC admin at any time 
the BMC is running.
However, this requirement is removed.

>> - Configure the firewall for IPv4, IPv6, or both.
>> - Remove firewall capabilty from the BMC if desired.
> At runtime?  Is the goal for the defaults to be "firewall on" or
> "firewall off"?

I meant the firewall capability could be compiled out of the BMC image.
That is probably too obvious to include in the design.

>> The admin user must be able to:
>> - Temporarily modify, disable, or re-enable the firewall.
>> - Enable or disable IP logging.
>> - Retrieve the firewall logs, if enabled.
>> 
> 
> Some other background that I think would help here:
> What do other BMC implementations do?
> What do other similar network connected devices (OpenWRT for example) 
> do?

It's hard to get details about what the other BMC firewalls do.
The OpenWRT firewall is for a router, so it has capability OpenBMC does 
not need.


>> ## Proposed Design
>> 
>> This adds a set of BitBake recipes to set up an IP firewall based on
>> Linux kernel netfilter modules, the iptables commands, and the
>> arno-iptables-firewall package.
>> 
>> The firewall gets put up when systemd starts the networking service, 
>> and
>> gets taken down when networking stops.
>> The firewall logging service is also made available, but it is not 
>> started
>> 
>> The firewall rules will default to disallow all IP traffic, then be
>> permissive in allowing all legitimate BMC traffic.  We'll have
>> customized firewall rules specific to a generic BMC environment and
>> document these rules in the docs repository.
> In terms of firewall rules, what is a "generic BMC environment"?  All
> ports/ips accepted?

I meant a BMC that supports all of meta-phosphor functions.  For 
example, ports for HTTPS, SSH and IPMI would be unblocked, and ports 
OpenBMC does not have services listening at would be blocked.
However, this was removed form the design.

>> These rules are intended to be "secure by design" and documented well
>> enough for a system integrator to change them as needed.
> 
> In this section I see nothing about how rate limiting is going to be
> implemented or designed.  Given that has a lot of real-world
> implications, I'd like to see that called out specifically.  For
> example, firmware update is a 64MB payload and can easily run over
> buffer limits quickly.  Is that case called out specifically in the
> firewall rules, or are the limits set so high that a firmware update
> doesn't matter?  Virtual media and KVM are other great examples of
> _very_ high bandwidth applications that would be severely impacted by
> bandwidth limits.  In general, both those applications are capable of
> using 100% of the BMCs effective NIC bandwidth.  I have worked on other
> BMC firmwares in the past where the security tradeoffs of enabling a
> firewall were shadowed by the performance hits to those services.  I
> would feel a lot better if these were called out specifically in the
> requirements.  Something like, "Enabling the firewall should have a 
> <10%
> impact of the performance of KVM/virtual media".

By "rate limiting" I intended to guard against repeated automated 
requests for service.
I think work is needed here, but not in the firewall.
I have dropped this from the design.


>> ## Alternatives Considered
>> 
>> A user interface to indicate the firewall's status was considered.
>> This would invoke iptables and return success only if it showed
>> firewall rules, something like `iptables -L -n -v`.  This is not
>> needed for basic function.
>> 
>> The `ufw` firewall was considered.  It is implemented in Python which
>> is being removed from the OpenBMC image.
>> 
> 
> You missed what we currently do, relying on bind rules to define what
> sockets/ports are accepted.  I suspect it doesn't meet your needs, but
> we should call it out, because it's what's currently implemented.

No, that part is good.  The firewall blocking ports would be a 
defence-in-depth protection.
For example, if someone was to run software on the BMC which the BMC 
admin did not intend,
then blocking ports may make it more difficult for that unintended use.
However, and I've dropped this from the design.

>> ## Impacts
>> 
>> There are three levels of impact:
>> 1. If the firewall recipes are present:
>>  - Uses more flash space for kernel modules and iptables commands.
>> 2. When the firewall is enabled:
>>  - Uses more memory for kernel modules and related tables.
>>  - Uses more CPU cycles for network service.
>> 3. When the firewall IP logging service is enabled:
>>  - Uses more resources for CPU and log file storage.
>> 
>> If the firewall rules are overly restrictive, functions which require
>> IP may not work correctly.  The documentation must show how to
>> identify and fix this problem, specifically:
>>  - How to enable IP logging.
>>  - How to find, read, and interpret the log.
>>  - How to change firewall rules to allow your traffic.
>> 
>> ## Testing
>> 
>> Ensure all functions which use IP continue to work.  Enable firewall
>> IP logging during these tests, and check it for errors.
>> 
>> From the requirement section:
>>  - Test the firewall's capabilities.  For example:
>>     - Send badly formed packets.
>>     - Send traffic to closed ports.
>>  - Test each of the admin user's functions.
>> 
>> Test the procedure to enable logging and detect blocked IP traffic.
>> 
>> Note the recommended dev-environment [1] maps TCP ports 22 and 443 (to
>> ports 2222 and 2443).  This is not an issue for the BMC's firewall
>> because this mapping is done by the simulator, so the BMC sees the
>> original port numbers: 22 and 443.
> 
> I don't see any tests for tests of the performance attributes.

Good catch.  I'll add a performance test.

>> [1]:
> https://github.com/openbmc/docs/blob/master/development/dev-environment.md
>> 
> 
> Overall, I'm skeptical that in real-world BMCs adding a firewall will
> have a measurable impact on DOS attack prevention, or network security,
> given how loose the rules would need to be to enable all the services
> required.  My suspicion was that that rate limiting in the individual
> network facing daemons would be more effective, as they can
> remove/disable the rate limits for authorized users.  With that said,
> I'm cautiously hopeful that I will be proven wrong.

Yes, I agree the daemons are a better place to address some of my 
requirements.
I've noted that above, and I am interested in pursuing that.
I'll add it to the wish list:
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list


> Some initial, far-from-merge-worthy attempts at differentiating between
> pre and post authenticated payloads, and adjusting the limits
> accordingly is staged below:
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/16420/9/crow/include/crow/http_connection.h#133

Interesting...thanks!

> 
> -Ed
