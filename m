Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B80CBEC81C
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 18:46:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474V3s5N6wzDqc3
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 04:46:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474V336hgjzF6yq
 for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2019 04:45:35 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA1GquEj018629
 for <openbmc@lists.ozlabs.org>; Fri, 1 Nov 2019 13:45:32 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w0pf46srn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2019 13:45:32 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA1HjScl027309
 for <openbmc@lists.ozlabs.org>; Fri, 1 Nov 2019 17:45:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2vxwh70ub5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2019 17:45:30 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA1HjTjC61931968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 1 Nov 2019 17:45:29 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A4D56E04C
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:45:29 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB666E050
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:45:28 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:45:28 +0000 (GMT)
Subject: Re: Resend : Enable/disable access to BMC through interfaces for
 security
To: openbmc@lists.ozlabs.org
References: <CAMTupoQThp=WRfdH+QHwmqP1ZqbgCKq81rS8Cp+0sYKQfNe4Sg@mail.gmail.com>
 <CAMTupoSxchLJuFUjpmVu=7jS=M1H0OTTnWkUP3SNkvs8=R3uTA@mail.gmail.com>
 <c4ba9973-6a6c-8ce9-f66d-553404b00340@linux.ibm.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <4f21c5af-2697-07ab-b17b-084bcf131a2f@linux.vnet.ibm.com>
Date: Fri, 1 Nov 2019 12:45:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c4ba9973-6a6c-8ce9-f66d-553404b00340@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-01_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911010158
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

Hi Jandra, I'm interested in the subject blow. Joseph, I've added a few 
more options to your list as well.

 > On 11/1/19 11:55 AM, Joseph Reynolds wrote:
> On 11/1/19 9:40 AM, Jandra A wrote:
>> I am resending this message to who has thoughts on which BMC
>> interfaces need to be disabled for security purposes and what the best
>> way to do that would be. I would love to collaborate with all parties
>> interested.
> 
> Thanks Jandra.  I've added this to the OpenBMC Security Working Group 
> agenda.
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 
> 
> 
>> ------- begin message:
>>
>> Hello all,
>>
>> As part of the GUI design team, I am starting to look at requirements
>> for enabling and disabling network interfaces for which the BMC can be
>> accessed. For example, IPMI, SSH, Redfish, HTTP, and USB, to name a
>> few.
>>
>> I know there has been some conversation on the topic before (see email
>> linked below) and want to reach out to see who is interested in this
>> topic. And I would love to get your thoughts on the following topics.
>>
>> Some questions we want to tackle are:
>> 1. Which interfaces need to be enabled/disabled and what is their
>> priority? (See full list in the redfish documentation)
>> 2. What should be the default for the selected above (enabled/disabled)?
>> 3. Do we need a staged plan for it?
>> 4. When can we expect backend availability?
> 
> I am interested in the list of the BMC's external interfaces from a 
> security perspective.  The [network security considerations][] talks 
> about many of the network interfaces.  We should encourage users to 
> disable interfaces they don't need and are not using.  Having such 
> interfaces active opens up the BMC's attack surface and represents 
> security risks.  For example, newly discovered security vulnerabilities 
> might place BMCs at risk, and shutting off the interface will likely 
> make the BMC safe.
> 
> The BMC also has physical interfaces which users may wish to disable 
> (for the same reasons as above).  The BMC's network interface and and 
> USB ports are examples.  Some users may wish to disable the BMC's access 
> to the network and control it solely via its host. However, I am not an 
> exert in this area, so I need help here.  TODO: Get one of the kernel 
> hackers to go over this list.  I understand because OpenBMC is used on 
> different hardware models (such as AST2500's hosted in the AC922 
> "Witherspoon"), it will have different interfaces present.  I think the 
> folks who wirj with the machines, and who bind device drivers can help 
> us if we know what questions to ask them (better questions than: what 
> interfaces does the BMC have)?  <-- Once again, I am no expert here, so 
> we need to work together to understand this.
> 
> Here's my starter kit of BMC's external interfaces:
> network:
>   - SSH to the BMC shell (port 22)
>   - HTTP (for either [BMCWEB_INSECURE_DISABLE_SSL][] users or the 
> nascent [HTTP redirect design][])
>   - HTTPS
     - Secure Websockets
>   - (network, aka out of band) IPMI
     - Extend REST APIs
     - Redfish
>   - KVMIP
>   - Virtual media
>   - SoL (SSH via port 2200) to the host console
>   - mDNS discovery
>   - Avahi discovery service
>   - virtual USB (USB-over-IP)
> physical:
>   - network
     - USB External
     - USB to Host
>   - more? Help needed: would anyone want to give the BMC admin control 
> to shut down pathways between the BMC and host?
> 
> There will be more interfaces as the project goes forward.  For example, 
> the OpenPOWER work is proposing a communication channel between a 
> Hardware Management Console (HMC) and the host's hypervisor (PHYP) which 
> would use the BMC to set up the channel. Users who don't need this a 
> capability might want to have a way to disable it (I don't know) so they 
> can avoid giving unnecessary network access to their hypervisor.  The 
> point is, I think tending this list will be ongoing work.
> 
> The short list of interfaces I personally care about includes:
>    SSH, IPMI, Avahi, and USB (physical and USB-over-IP)
> 
> I hope this partially addresses item 1 above.  :)
> 
> - Joseph
> 
> References:
> [network security considerations]: 
> https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md 
> 
> [BMCWEB_INSECURE_DISABLE_SSL]: 
> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt
> [HTTP redirect design]: 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173
> 
>>
>> Redfish documentation:
>> https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_4_0.json
>>
>> Related email discussion (on staged plans to address IPMI access):
>> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018373.html
>>
>>
>>
>> Regards,
>> Jandra Aranguren
> 
