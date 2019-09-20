Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E486FB96E5
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 20:02:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZhQQ30F6zF3g7
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 04:02:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZhPc69FXzDrF4
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 04:02:11 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KHpuik018338; Fri, 20 Sep 2019 14:02:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v52273v85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 14:02:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KI0XsJ022738;
 Fri, 20 Sep 2019 18:02:04 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2v3vbuuxyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 18:02:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KI233B39125276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 18:02:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26BE6C6055;
 Fri, 20 Sep 2019 18:02:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C38C8C6059;
 Fri, 20 Sep 2019 18:02:02 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Sep 2019 18:02:02 +0000 (GMT)
Subject: Re: Staging plans to remove network IPMI support?
To: Vernon Mauery <vernon.mauery@linux.intel.com>
References: <24ab3a70-2752-e2ba-5a37-41ee35f8aa92@linux.ibm.com>
 <9ad6bc40-8b34-1c54-c1f6-abd5d0ee1672@linux.ibm.com>
 <20190920154835.GJ45301@mauery.jf.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a9b5b58a-d9d4-23e3-8f5a-7f1c3b19f207@linux.ibm.com>
Date: Fri, 20 Sep 2019 13:02:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920154835.GJ45301@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200150
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/20/19 10:48 AM, Vernon Mauery wrote:
> On 18-Sep-2019 04:34 PM, Joseph Reynolds wrote:
>> Re-sending to fix up formatting error:
>>
>> The OpenBMC security working group discussed a desire to remove out-of-band
>> network IPMI support from the OpenBMC firmware stack, here:
>> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018319.html
>>
>> This would affect out-of-band (network IPMI) only, in repository
>> https://github.com/openbmc/phosphor-net-ipmid. The host IPMI support is
>> a separate topic.
>>
>> The *main idea* is a staging plan to remove network IPMI support over a
>> period of years, like in this progression:
> This may be a year 3030 topic; I would not worry too much about it for
> now. By the time RMCP+ is gone, BMCs may not even be a thing anymore :)
>
> But in all seriousness, telnet and rlogin stayed on for YEARS beyond
> their welcome. It will be a difficult task to wean users off RMCP+. It
> is so easy to use and we are all used to it. Redfish is so complicated
> and we don't have the tooling to make it work as smoothly as RMCP+.
>
> Basically what I am saying is that we need buy-in from the end users. So
> far, for all its wonder and glory, Redfish really has been a hard sell.
> For all the warts and flaws of RMCP+ over IPMI, people *need* it. People
> are not rational and do not make security decisions based on logic.

Agreed :)

Do you think it would be helpful to add the staging plan discussed here 
to the "Provide alternatives to network IPMI" wish list item? See 
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list

>
>> 1. Tell everyone the plans at each stage below. For example: emails to the
>> group, mention in the release notes, update
>> https://github.com/openbmc/phosphor-net-ipmid/blob/master/README.md and the
>> ipmitool repo.
> We can certainly add something to the README, but we do need to set some
> expectations on how much people actually read documentation. Adding
> something there will not have nearly as much effect as putting a big red
> banner on the bmcweb console that says "IPMI over RMCP+ is enabled and
> is insecure. You might consider disabling it and using the Redfish
> protocol instead"

Good idea.  Like a security health check for the BMC's interfaces. I'm 
tracking an issue (work item) to disable IPMI via Redfish (here 
https://github.com/ibm-openbmc/dev/issues/612), and I've added this as a 
suggestion.

>
> OpenBMC does not own the ipmitool project (or any of the other
> opensource utilities that speak RMCP+), so we will need to reach out. It
> turns out that the ipmitool maintainer is a member of the OpenBMC
> community, so we can hopefully leverage that relationship.
>
>> 2. Implement the Redfish ManagerNetworkProtocol - defined in the DMTF
>> Redfish Resource and Schema Guide DSP2046 https://www.dmtf.org/dsp/DSP2046.
>> This gives the BMC admin an interface to disable out-of-band network
>> IPMI.That means stopping the IPMI network service and closing its port.
> I keep hearing stories about redfish not being united and common enough
> to be useful. Does the spec need to grow or do we just need to make sure
> that it is always implemented according to the spec?

My reading is that OpenBMC is committed to Redfish and member of the 
OpenBMC community are actively working to enhance Redfish to do what we 
need.

- Joseph
>
>> 3. Change the IPMI ManagerNetworkProtocol setting to be disabled by
>> default.  After this, BMC admins have to take an explicit action to enable
>> IPMI access.
> I would hope that long before we disable netipmid by default, Redfish
> would be the main mechanism for accessing the BMC.
>
>> By this point it should be possible to learn how to migrate from
>> IPMI to Redfish APIs.
> No, people should be learning how to migrate from IPMI to Redfish right
> now, long before we attempt to disable RMCP+/IPMI by default.
>
>> 4. Remove IPMI from the default OpenBMC configuration. This means network
>> IPMI is not built into the BMC firmware image. After this, project who want
>> to use network IPMI will have to explicitly add it to their image. This will
>> hopefully be a wake-up call to anyone who is still using network IPMI.
> I think this step could be moved up. Not every OEM user of OpenBMC wants
> to include netipmid in their builds today. Adding a package to an image
> is just as easy as removing it. We could make it NOT part of the image
> by default and require all OEMs that want it to add it to their image.
>
>> 5. Remove all references to network IPMI from OpenBMC.
> I am not sure this is ever necessary. This is not a nanny state. If
> someone wants openBMC to have insecure packages on their builds, that is
> up to them. We can disable the package by default, but I think that is
> as far as we need to go.
>
> --Vernon

