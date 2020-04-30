Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E01C07F2
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 22:31:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cn9R1Y4czDrFD
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 06:31:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cn5v6MZszDqlZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 May 2020 06:28:51 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UK5ZQM090834
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 16:28:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30r5dkgm70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 16:28:48 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03UKPTIR147119
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 16:28:48 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30r5dkgm6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 16:28:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03UKMjTL001903;
 Thu, 30 Apr 2020 20:28:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 30mcu7cb70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 20:28:47 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03UKSjEl11272700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 20:28:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 380C76E04C;
 Thu, 30 Apr 2020 20:28:46 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1A356E054;
 Thu, 30 Apr 2020 20:28:45 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.137.230])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Apr 2020 20:28:45 +0000 (GMT)
Subject: Public security scan tools (was: Security Working Group)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>, krtaylor <kurt.r.taylor@gmail.com>
References: <f2354e18-681e-9b66-6515-33a66c81c5bf@linux.ibm.com>
 <e79a11e6-b461-1982-12e4-16c9d5ba6740@linux.ibm.com>
Message-ID: <a66ab604-eed3-159c-3ba4-5cd353662e8f@linux.ibm.com>
Date: Thu, 30 Apr 2020 15:28:44 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e79a11e6-b461-1982-12e4-16c9d5ba6740@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_12:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300150
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

On 4/30/20 3:05 PM, Joseph Reynolds wrote:
> On 4/28/20 11:12 AM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday April 29 at 10:00am PDT.
>
...snip...
>>
> Item 8 added during the meeting:
> 8. How do we run dynamic scan tools that are privately licensed and 
> the output of which is copyrighted which means it cannot be shared 
> with the OpenBMC community?
> We shared our current practices which does allow pushing the fixes 
> back into the project.  TODO: Joseph will document this practice and 
> add it to the security working group wiki.
> The we discussed if we can use tools because we are a Linux function 
> project.   TODO: Joseph to followup with Kurt.
>
> - Joseph

Kurt (as OpenBMC Community Manager),

Does being a Linux Foundation Project help?  Can we get access to 
security scan tools that normally require a license to use?
See 
https://github.com/openbmc/openbmc/wiki/Security-working-group#using-dynamic-security-scan-tools

Is there some way we can open up the process of dynamic scan testing to 
the community?  What are the best practices?

- Joseph

