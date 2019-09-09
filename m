Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC3AD303
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 08:14:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RdDW5qp8zDqQ0
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 16:14:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RdCt54bCzDqMy
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 16:14:17 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8966wEi140190
 for <openbmc@lists.ozlabs.org>; Mon, 9 Sep 2019 02:14:13 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uwghm9ntr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 02:14:13 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 9 Sep 2019 07:14:11 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Sep 2019 07:14:08 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x896E7Im38863342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Sep 2019 06:14:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8A0942041;
 Mon,  9 Sep 2019 06:14:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFF0B42047;
 Mon,  9 Sep 2019 06:14:06 +0000 (GMT)
Received: from [9.122.210.110] (unknown [9.122.210.110])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Sep 2019 06:14:06 +0000 (GMT)
Subject: Re: Expired password + disabled power button design
To: Joseph Reynolds <jrey@linux.ibm.com>, Ed Tanous <ed.tanous@intel.com>,
 openbmc@lists.ozlabs.org, bofferdn@us.ibm.com
References: <af6cb67f-1d0f-1dcf-8b88-5b7950a5bc1b@linux.ibm.com>
 <008a1d47-3012-2007-af87-05f46392759f@intel.com>
 <fc971dc4-3d19-f23a-15b8-3e1438e30c1d@linux.ibm.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 9 Sep 2019 11:44:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fc971dc4-3d19-f23a-15b8-3e1438e30c1d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19090906-0020-0000-0000-00000369A0B5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090906-0021-0000-0000-000021BF1FD5
Message-Id: <1eef108e-d06d-a485-e9c3-f02447aadd00@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909090068
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

Hi Joseph,

Not sure if this info helps much.. But, I know we did provision the FSP 
on the SoftLayer environment which had constraints.
Possibly we can look into how that was done ?

!! Vishwa !!

On 9/8/19 3:46 AM, Joseph Reynolds wrote:
>
> On 9/5/19 4:02 PM, Ed Tanous wrote:
>> On 9/5/19 1:19 PM, Joseph Reynolds wrote:
>>> HOWEVER, there is a hole in this design which extends the time window
>>> indefinitely.  The scenario begins when the installer takes possession
>>> of a new system (BMC + host) and plugs it into power.  At this point,
>>> the BMC starts running and offering its services to network users.
>>> The host remains powered off.  The installer then disregards the BMC
>>> and uses the power button to boot the host system, then continues to
>>> disregard the BMC when provisioning the host, either using physical
>>> access to the host (not via the BMC), or a pre-configured host.  This
>>> results in a fully-functional host and a BMC which still has its
>>> default password.
>>> THEREFORE, I am proposing a new "disabled power button" image
>>> feature.  Normally, pressing the power button tells the BMC to power
>>> on and boot the host.  With this design, if the BMC still has its
>>> default expired password, it will ignore a power button press, and
>>> will instead indicate to the operator to configure the BMC's password,
>>> and try again.  Options for the BMC to indicate this are
>>> machine-specific and include: messages to an operator panel, or LED
>>> blink codes.  The recovery procedure is for the installer to access
>>> the BMC, change its password, and try again to power on the server.
>>>
>> This goes completely against one of the principals that some commercial
>> products hold dear:  The BMC should NEVER be able to brick the host.
>>
>> In a perfect world, the BMC would never crash, get loaded with bad
>> firmware or brick itself.  In practice, this is far from the case.  In
>> general the primary avenue used to resolve these cases is a force
>> firmware update jumper, and a download of a new (fixed) firmware via KCS
>> or block transfer.  For that flow to function, the power button needs to
>> work, and the host needs to boot, otherwise the board is considered
>> bricked, and needs to be returned to the factory to be reflashed.
>>
>> With all of the above said, if it's an option that can be disabled (and
>> hopefully disabled by default) I have no objection to it, but I don't
>> think it's an acceptable solution for most of the BMCs out on the market
>> today.
>>
>>
>> Another option for your scenario would also be to default the BMC to a
>> static IP of 0.0.0.0, and disable the NIC(s) by default.  To set up the
>> network, a user would need to log into the BMC the first time over an
>> in-band channel, set their password, then set up either a valid static
>> IP, or DHCP.  This is how some of the more security conscious BMCs I
>> know of get around this problem today.
>
> Thanks for your reply.  That helps.  We also don't want to brick our 
> systems. :-)
>
> How likely is the scenario described in the HOWEVER clause above? To 
> create this security exposure, the installer would have to connect a 
> network cable to the BMC and then not access the BMC via its network 
> connection.  Is that something that happens in practice?  Could this 
> be mitigated by installation instructions? The installation 
> instructions could state, for example, not to connect a network cable 
> to the BMC unless you then change the BMC's default password.  Then to 
> emphasize the point, the instructions could also state, for example, 
> that you must change the BMC's default password if you connect a 
> network cable to it.
>
> However, this approach doesn't feel secure by default.  I understand 
> the more general problem is how to securely provision your BMC. Does 
> anyone know where these discussions are happening?
>
> - Joseph
>
>

