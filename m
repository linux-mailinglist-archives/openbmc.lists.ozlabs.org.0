Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C01CD1BF1A4
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 09:39:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CS2C0SBSzDqs1
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 17:39:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CS1N3g37zDq9s
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 17:38:44 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U7VicW036475
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 03:38:42 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr91aae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 03:38:42 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03U7ViDO016012
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:38:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 30mcu5affw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:38:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03U7ccTN59637830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:38:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2286F5204F
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:38:38 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.238.62])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A702752052
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:38:37 +0000 (GMT)
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: openbmc@lists.ozlabs.org
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <f197f55c-f7f2-c405-f3c8-bfbd5cd5e3bd@linux.vnet.ibm.com>
Date: Thu, 30 Apr 2020 13:08:36 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_02:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=1 clxscore=1011
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004300057
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

On 30/04/20 4:21 am, Nancy Yuen wrote:
> I've talked with some people a while back (long while back) about 
> multiple BMCs in a system.  Either for redundancy or managing separate 
> parts of a system.   I'm wondering what other people are thinking in 
> this area if at all.
> 
> We are considering similar designs and I'm looking into options for 
> BMC-BMC communications.  Some BMCs may not be externally 
> accessible. Here are some options that we've looked at:
> 
>  1. i2c/IPMB
>  2. usbnet/Redfish
>  3. i2c/MCTP/PLDM or something else?
>  4. internal network via switch chip/Redfish or MCTP
> 
>   I'd like to reduce our use of IPMI so I want to avoid (1).
> 
> ----------
> Nancy

Hi Nancy,

I think it depends on whether the BMCs need to talk to each other for 
platform management, or if they manage their own hosts and we need one 
of the BMCs to broadcast out of band requests and aggregate responses.

For the former I think PLDM over MCTP could be a good fit. This is more 
of an "inband" use-case in my opinion so I'm not sure if Redfish is well 
suited. For the latter, a Redfish based aggregation is a good option.

Regards,
Deepak
