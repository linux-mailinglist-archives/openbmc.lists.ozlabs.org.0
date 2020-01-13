Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB541139584
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 17:12:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xJWj5vq3zDqKw
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 03:12:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xJVk544JzDqKl
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 03:11:22 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DG390i025022
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 11:11:19 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvq5avnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 11:11:19 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00DGAggA029307
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:11:18 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 2xf74nrd31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:11:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00DGBH5935062254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:11:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E75EC6055
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:11:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8732C605B
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:11:16 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.80.202.123])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:11:16 +0000 (GMT)
Subject: Re: Event Service - support for multiple protocols
To: openbmc@lists.ozlabs.org
References: <44773a366aa849ad9ee6c6f6376ad45e@intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <f1d8c2ca-f394-a3ff-f4bd-ffb5bca8ec7c@linux.vnet.ibm.com>
Date: Mon, 13 Jan 2020 10:11:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <44773a366aa849ad9ee6c6f6376ad45e@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_05:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=1 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130134
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

Hey Piotr,

On 1/10/20 3:49 AM, Matuszczak, Piotr wrote:
> Hi,
> 
> I was wondering whether to make it part of design review, but I would like to discuss my thoughts/questions here.
> My focus is mainly on telemetry and crashlog parts, not the events. As for telemetry, we would like to be able to support not only the native Redfish metric report and protocols defined by the DMTF. We do not want to define new Redfish schema for the subscription, but rather reuse EventDestination schema. Is it possible to extend the proposed architecture of Event Service to support Kafka or MQTT telemetry streaming instead only Redfish Metric Report via the SSE or push-style events? I was thinking to use 'Protocol' property in the EventDestiation schema to define the protocol used (like Kafka or MQTT). Did you think about it?

I'm rather interested in this as we have a few of our clients who have 
said the same thing. The support for message brokers also came up during 
the HPC conference in the summer, and I believe, holds a lot of merit.

In regards to telemetry streaming, I think being able to update the 
subscription dynamically without tearing it down, would also be 
beneficial, as more investments in reactive software are being made.

> 
> 
> 
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
> 

Thanks,
Justin Thaler
