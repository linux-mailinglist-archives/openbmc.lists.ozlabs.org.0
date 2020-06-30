Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906820FC44
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 20:53:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xD640Tk2zDqkD
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 04:53:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xD594JxzzDqjT
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 04:53:01 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05UIXbo0028562; Tue, 30 Jun 2020 14:52:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31xmxg5ma5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 14:52:56 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05UIYMN2030701;
 Tue, 30 Jun 2020 14:52:56 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31xmxg5ma1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 14:52:56 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05UIiUwW030083;
 Tue, 30 Jun 2020 18:52:55 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 31wwr8j8ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 18:52:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05UIqtrY39125380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 18:52:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46C35AE05F;
 Tue, 30 Jun 2020 18:52:55 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9961AE05C;
 Tue, 30 Jun 2020 18:52:54 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.159.135])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Jun 2020 18:52:54 +0000 (GMT)
Subject: Re: OpenBMC health statistics
To: Vijay Khemka <vijaykhemka@fb.com>,
 "Khetan, Sharad" <sharad.khetan@intel.com>,
 krtaylor <kurt.r.taylor@gmail.com>,
 "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
 <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
 <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <79C50A42-5BBB-40C0-8578-6659CA3DE1E1@fb.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <02d91b6a-c2ba-0239-a62e-a680f97bb009@linux.ibm.com>
Date: Tue, 30 Jun 2020 13:52:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <79C50A42-5BBB-40C0-8578-6659CA3DE1E1@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_06:2020-06-30,
 2020-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006300121
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

On 6/29/20 3:20 PM, Vijay Khemka wrote:
> We can have a folder "how to" under guidelines and this document should fit there.

That makes sense to me.  I want document stuff for both system 
integrators (who put together firmware images) and system administrators 
(who perform BMC initial configurations, oversee BMC operation, etc.).  
We also need a place for documentation for things like how to use 
BMCWeb's mTLS feature which cuts across system integration and 
administration.  Details: https://github.com/ibm-openbmc/dev/issues/1531

- Joseph

>
> Regards
> -Vijay
>
> ﻿On 6/29/20, 11:51 AM, "openbmc on behalf of Khetan, Sharad" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of sharad.khetan@intel.com> wrote:
>
>      I agree. Based on description it appears the best fit is docs/development, as developers will need to provide right hooks.
>
>      If its really end-user focused, then it can perhaps go in userguide - which needs a lot more documentation 😊 for users.
>
>      Thanks,
>      -Sharad
>
>      -----Original Message-----
>      From: openbmc <openbmc-bounces+sharad.khetan=intel.com@lists.ozlabs.org> On Behalf Of krtaylor
>      Sent: Monday, June 29, 2020 10:54 AM
>      To: Matuszczak, Piotr <piotr.matuszczak@intel.com>; openbmc@lists.ozlabs.org
>      Subject: Re: OpenBMC health statistics
>
>      On 6/29/20 10:54 AM, Matuszczak, Piotr wrote:
>      > Hello,
>      >
>      > I would like to upload the OpenBMC health statistics design guide for people that would like to integrate the OpenBMC to their platforms. I would not like to put it into /docs/designs, since this is not exactly design how it will be implemented. This document was meant to guide the OpenBMC users how they can implement BMC health statistics themselves.
>
>      I don't see a problem with a guidelines/best practices type guide living in docs, but prob not in designs. Maybe in architecture or userguide or development? Kind of hard to say without seeing it. You could also always add it to the wiki.
>
>      Kurt Taylor (krtaylor)
>
>      >
>      > The question is, where would be the best place to upload such document?
>      >
>      > Piotr Matuszczak
>      > ---------------------------------------------------------------------
>      > Intel Technology Poland sp. z o.o.
>      > ul. Slowackiego 173, 80-298 Gdansk
>      > KRS 101882
>      > NIP 957-07-52-316
>      >
>
>

