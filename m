Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD71C6191
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 22:06:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GrMG3LnWzDqSB
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 06:06:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GrLJ1RpxzDqbs
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 06:05:11 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045K2Xhs175151
 for <openbmc@lists.ozlabs.org>; Tue, 5 May 2020 16:05:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4xm0y66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 May 2020 16:05:08 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 045K39s0178779
 for <openbmc@lists.ozlabs.org>; Tue, 5 May 2020 16:05:08 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4xm0y5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 16:05:08 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 045K39ff018506;
 Tue, 5 May 2020 20:05:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 30s0g6ke64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 20:05:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 045K56XK21954952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 20:05:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BCE3BE051;
 Tue,  5 May 2020 20:05:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12361BE056;
 Tue,  5 May 2020 20:05:04 +0000 (GMT)
Received: from [9.102.37.152] (unknown [9.102.37.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 20:05:04 +0000 (GMT)
Subject: Re: Dunfell Update Status
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <41CB9FEC-1892-489A-8CD8-A50F5E744C4D@gmail.com>
 <16620BAA-69AD-491E-A2C3-265C53DC91F9@gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <0938c96f-b3ff-3a16-7ca4-53bf99488009@linux.vnet.ibm.com>
Date: Tue, 5 May 2020 15:05:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <16620BAA-69AD-491E-A2C3-265C53DC91F9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_10:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=905 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050149
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

On 5/5/2020 12:38 PM, Andrew Geissler wrote:
> An update on the email below. Upstream yocto (including the new Dunfell release)
> went into openbmc master this morning with the following commit:
>
> https://github.com/openbmc/openbmc/commit/82c905dc58a36aeae40b1b273a12f63fb1973cf4
>
>
> Now that we’re past the python3 migration issue, we’ll be doing rebases
> on upstream yocto once a week again (which should prevent needing
> big painful updates like this).
Awesome!

>> On Apr 28, 2020, at 2:05 PM, Andrew Geissler <geissonator@gmail.com> wrote:
>>
>> A fairly quick update on where we are with getting back onto upstream yocto.
>>
>> For those that don’t know, dunfell is the name of the next yocto release.
>>
>> The move from python2 to python3 is mostly behind us, thanks everyone,
>> especially Patrick (stwcx) for all the help there.
>>
Thank you Andrew for driving this and to everyone who helped!
