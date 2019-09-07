Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0DAC9AF
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2019 00:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QpgT0lWTzDqdb
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2019 08:16:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Qpfr3TrGzDqbm
 for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2019 08:16:19 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x87MCDpB115484; Sat, 7 Sep 2019 18:16:14 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uv8mpgyr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Sep 2019 18:16:14 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x87MF4VS022608;
 Sat, 7 Sep 2019 22:16:13 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2uv466e24c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Sep 2019 22:16:13 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x87MGCm458655156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Sep 2019 22:16:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC489C6074;
 Sat,  7 Sep 2019 22:16:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 229C4C6072;
 Sat,  7 Sep 2019 22:16:12 +0000 (GMT)
Received: from demeter.local (unknown [9.85.193.165])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat,  7 Sep 2019 22:16:11 +0000 (GMT)
Subject: Re: Expired password + disabled power button design
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <af6cb67f-1d0f-1dcf-8b88-5b7950a5bc1b@linux.ibm.com>
 <008a1d47-3012-2007-af87-05f46392759f@intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <fc971dc4-3d19-f23a-15b8-3e1438e30c1d@linux.ibm.com>
Date: Sat, 7 Sep 2019 17:16:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <008a1d47-3012-2007-af87-05f46392759f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909070242
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


On 9/5/19 4:02 PM, Ed Tanous wrote:
> On 9/5/19 1:19 PM, Joseph Reynolds wrote:
>> HOWEVER, there is a hole in this design which extends the time window
>> indefinitely.  The scenario begins when the installer takes possession
>> of a new system (BMC + host) and plugs it into power.  At this point,
>> the BMC starts running and offering its services to network users.
>> The host remains powered off.  The installer then disregards the BMC
>> and uses the power button to boot the host system, then continues to
>> disregard the BMC when provisioning the host, either using physical
>> access to the host (not via the BMC), or a pre-configured host.  This
>> results in a fully-functional host and a BMC which still has its
>> default password.
>> THEREFORE, I am proposing a new "disabled power button" image
>> feature.  Normally, pressing the power button tells the BMC to power
>> on and boot the host.  With this design, if the BMC still has its
>> default expired password, it will ignore a power button press, and
>> will instead indicate to the operator to configure the BMC's password,
>> and try again.  Options for the BMC to indicate this are
>> machine-specific and include: messages to an operator panel, or LED
>> blink codes.  The recovery procedure is for the installer to access
>> the BMC, change its password, and try again to power on the server.
>>
> This goes completely against one of the principals that some commercial
> products hold dear:  The BMC should NEVER be able to brick the host.
>
> In a perfect world, the BMC would never crash, get loaded with bad
> firmware or brick itself.  In practice, this is far from the case.  In
> general the primary avenue used to resolve these cases is a force
> firmware update jumper, and a download of a new (fixed) firmware via KCS
> or block transfer.  For that flow to function, the power button needs to
> work, and the host needs to boot, otherwise the board is considered
> bricked, and needs to be returned to the factory to be reflashed.
>
> With all of the above said, if it's an option that can be disabled (and
> hopefully disabled by default) I have no objection to it, but I don't
> think it's an acceptable solution for most of the BMCs out on the market
> today.
>
>
> Another option for your scenario would also be to default the BMC to a
> static IP of 0.0.0.0, and disable the NIC(s) by default.  To set up the
> network, a user would need to log into the BMC the first time over an
> in-band channel, set their password, then set up either a valid static
> IP, or DHCP.  This is how some of the more security conscious BMCs I
> know of get around this problem today.

Thanks for your reply.  That helps.  We also don't want to brick our 
systems. :-)

How likely is the scenario described in the HOWEVER clause above? To 
create this security exposure, the installer would have to connect a 
network cable to the BMC and then not access the BMC via its network 
connection.  Is that something that happens in practice?  Could this be 
mitigated by installation instructions? The installation instructions 
could state, for example, not to connect a network cable to the BMC 
unless you then change the BMC's default password.  Then to emphasize 
the point, the instructions could also state, for example, that you must 
change the BMC's default password if you connect a network cable to it.

However, this approach doesn't feel secure by default.  I understand the 
more general problem is how to securely provision your BMC. Does anyone 
know where these discussions are happening?

- Joseph


