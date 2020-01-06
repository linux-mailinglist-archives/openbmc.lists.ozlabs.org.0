Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B88131914
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 21:11:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s68v04DLzDqDQ
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 07:11:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s68C2tCSzDqB3
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 07:10:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006K34fF046878; Mon, 6 Jan 2020 15:10:42 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb924p39e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 15:10:42 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 006K45lX049796;
 Mon, 6 Jan 2020 15:10:41 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb924p38r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 15:10:41 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006KAM5o024783;
 Mon, 6 Jan 2020 20:10:40 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2xajb6my8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 20:10:40 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006KAdN451904838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 20:10:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB7ED112065;
 Mon,  6 Jan 2020 20:10:39 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AB53112064;
 Mon,  6 Jan 2020 20:10:39 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.85.196.50])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  6 Jan 2020 20:10:39 +0000 (GMT)
Subject: Re: Gerrit review 28207 - Help define OpenBMC's security objectives
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>, 
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 krtaylor <kurt.r.taylor@gmail.com>, Sai Dasari <sdasari@fb.com>,
 "Mihm, James" <james.mihm@intel.com>,
 Sagar Dharia <Sagar.Dharia@microsoft.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <bc04d77e-dcab-e1dc-8579-809616d91ce0@linux.ibm.com>
Message-ID: <d0ceb3fb-72b1-6312-d742-b8238873d811@linux.ibm.com>
Date: Mon, 6 Jan 2020 14:10:38 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bc04d77e-dcab-e1dc-8579-809616d91ce0@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_06:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=758 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060167
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

I meant to copy the OpenBMC email list.

On 1/6/20 11:59 AM, Joseph Reynolds wrote:
> OpenBMC TSC members and information security leads,
>
> A new OpenBMC document identifies information security programs which 
> might be directed at OpenBMC.  These are the highest-level programs 
> such as national standards, industry best practices, and public-facing 
> company-specific practices.  The idea is to document OpenBMC's 
> security objectives and provide references to appropriate actionable 
> advice needed for development work.  As the OpenBMC project reaches 
> out for security standards to follow, and various agencies promote 
> their requirements, we can document our efforts here.  Details are in 
> the document.
>
> The document is a first draft.  I would be happy to add and remove 
> material so it can be merged into the project.  I think this should be 
> merged before attempting to expand on any of the topics.  This topic 
> is on the agenda for this Wednesday's OpenBMC Security Working Group 
> meeting.
>
> Please pass this on to your security leads to help define OpenBMC's 
> security objectives.
>
> - Joseph
>
> The document is available in gerrit review 28207 here:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28207
>
> OpenBMC Security Working Group wiki is here:
> https://github.com/openbmc/openbmc/wiki/Security-working-group

