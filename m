Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC5E337B
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 15:09:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zSHd0bhKzDqVv
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 00:09:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zSGF3HwRzDqTM
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 00:07:48 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9OD5pdX001831; Thu, 24 Oct 2019 09:07:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vucfdgg0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 09:07:42 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9OD6KL4004878;
 Thu, 24 Oct 2019 09:07:40 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vucfdgfhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 09:07:40 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9OD50sT003821;
 Thu, 24 Oct 2019 13:07:23 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2vqt47d60y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 13:07:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9OD7L5S34144756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 13:07:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4FC978060;
 Thu, 24 Oct 2019 13:07:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 819DE78068;
 Thu, 24 Oct 2019 13:07:21 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 13:07:21 +0000 (GMT)
Subject: Re: PSU Sensors - Associations
To: Lei YU <mine260309@gmail.com>, Patrick Venture <venture@google.com>
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
 <CAARXrtni+vWJT446z21_waRVC8cZY89x=eGent6aOYX6LCdY-g@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <3f106eff-91a5-de66-1d91-e73d0491d35a@linux.ibm.com>
Date: Thu, 24 Oct 2019 08:07:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtni+vWJT446z21_waRVC8cZY89x=eGent6aOYX6LCdY-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240126
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
Cc: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Peter Lundgren <peterlundgren@google.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/23/2019 9:03 PM, Lei YU wrote:
> On Thu, Oct 24, 2019 at 1:39 AM Patrick Venture <venture@google.com> wrote:
>> So, I flipped the association interface addition and the property
>> initialization to match other sensors, and then it started working.  I
>> was curious if you had any suggestions on how to find the matching
>> sensor given the paths, for instance:
>>
>> busctl get-property xyz.openbmc_project.PSUSensor
>> /xyz/openbmc_project/sensors/temperature/alt2_Temperature
>> xyz.openbmc_project.Association.Definitions Associations
>> a(sss) 1 "chassis" "all_sensors"
>> "/xyz/openbmc_project/inventory/system/board/Altie"
>>
>> busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
>>            |-/xyz/openbmc_project/inventory/system/board/Altie
>>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
>>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
>>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
>>            | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
>>
>> No alt2 -- so how do I know this?  I can walk every subordinate object
>> to find the name match, but I was curious if you had a faster idea?
> It looks like buggy, I think mapper shall make sure the association
> object is created only when the associated object exists.
> @Matt Spinler could you confirm that?

I'm not entirely following  what the problem is here, but I will still 
take a moment
to plug my association (and other mapper functionality) documentation at:
https://github.com/openbmc/docs/blob/master/architecture/object-mapper.md#associations

