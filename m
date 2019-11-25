Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAD108FBE
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 15:21:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M8Mx4Gh5zDqc8
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 01:21:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M8Ls5MrPzDqZN
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 01:20:04 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPEIn1x070043; Mon, 25 Nov 2019 09:19:55 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wfjyev4je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:19:54 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAPEJHHK073908;
 Mon, 25 Nov 2019 09:19:54 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wfjyev4hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:19:54 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAPEFqMT012348;
 Mon, 25 Nov 2019 14:19:58 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2wevd5tnde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 14:19:58 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAPEJqRN56230322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 14:19:52 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A627136055;
 Mon, 25 Nov 2019 14:19:52 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15645136053;
 Mon, 25 Nov 2019 14:19:51 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Nov 2019 14:19:51 +0000 (GMT)
Subject: Re: consolidation of *-dbus-interfaces
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
 <CAARXrt=UOQiyKdzUHkuLXqh+3oB7c=wq6UtvWaLVmz8v8WAfzg@mail.gmail.com>
 <9bffebe0-601c-1b4e-d40b-4f55fd68ac76@linux.ibm.com>
 <F7A6B208-1675-4529-AD61-5E85CEF61405@fuzziesquirrel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <b1be64f9-c006-8e7f-16e3-a3dad6f3ad3b@linux.ibm.com>
Date: Mon, 25 Nov 2019 08:20:00 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <F7A6B208-1675-4529-AD61-5E85CEF61405@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_03:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911250129
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Yong Li <yong.b.li@linux.intel.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/22/2019 8:42 AM, Brad Bishop wrote:
>
>> On Nov 19, 2019, at 10:33 AM, Matt Spinler <mspinler@linux.ibm.com> wrote:
>>
>> I took a crack at this with https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/27380.
>> Please take a look.
> This looks great to me Matt, thanks for doing this.  Now if someone could just figure out how to move this over to meson...
>
>> Next I will try to build an image that uses meta-openpower using it instead of openpower-dbus-interfaces.
> One concern I have is the dual maint of the interfaces while the transition is in progress.  Should we hold off on merging your first change (the one you linked to above) until you are closer to getting a full image build working with the consolidated repo?
>
> thx - brad

I built an image; the only way I've figured out how to stage it is:
1) Put up a commit to remove all the YAML from openpower-dbus-interfaces.
2) Put up a commit in meta-openpower to add the phospor-dbus-interfaces 
bbappend and bump
the openpower-dbus-interfaces revision.
3) after 2) is merged - remove all the openpower-dbus-dependencies from 
the repos
4) Remove openpower-dbus-interfaces from the image

Though, 1) will never pass CI of course because the other repos won't 
find their server.hpp
header files until 2) is merged.

Ideas on how to proceed?

