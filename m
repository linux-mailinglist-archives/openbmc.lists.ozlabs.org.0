Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5A1FBD89
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 20:07:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mbkZ584gzDqvT
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 04:07:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mbjq6c4NzDqVl
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 04:06:17 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GI35tv127096
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 14:06:14 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q315r3fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 14:06:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GI6CKR029462
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 18:06:13 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 31q26f8m3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 18:06:13 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GI5BdI27263282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 18:05:11 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D4B06A057
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 18:05:11 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B1F6A054
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 18:05:11 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.65.239.175])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 18:05:11 +0000 (GMT)
Subject: Re: Patch for telemetry design
To: openbmc@lists.ozlabs.org
References: <8428bc15cb234328a6148d47eb2581c6@intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <db250ff2-db9b-5297-31bd-fcae911aab25@linux.vnet.ibm.com>
Date: Tue, 16 Jun 2020 13:05:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8428bc15cb234328a6148d47eb2581c6@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_11:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 cotscore=-2147483648 impostorscore=0 mlxlogscore=928 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160127
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

Hi Piotr,
	I've taken a read through the design proposal as more of a client of 
the telemetry data. I like this proposal quite a bit as it is pretty 
clear. I had a couple of questions and given the broad level, I wasn't 
sure if gerrit was the right place for them.

On Timestamps, are the timestamps done per metric(sensor reading) or per 
report. This wasn't clear to me from the design proposal, and also it 
was hard to tell where the timestamp was being set.

 From the performance tests section, is there a limit on the number of 
sensors per report, seemingly it is 10, or was this done to simplify the 
performance testing?

The other general question I had was around the amount of data being 
transmitted. For instance, if you're getting reports on every sensor in 
the system (100s) the report(s) could be huge at scale. Would there be 
an option of considering compressed data like BEJSON? Or is this 
feedback that should go to the DMTF?

Thanks,
Justin Thaler
IBM RAS Engineer

On 6/16/20 4:31 AM, Matuszczak, Piotr wrote:
> Hi,
> 
> I've uploaded patch for telemetry service design some time ago. I would like to ask you for review.
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31690
> 
> 
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
> 
