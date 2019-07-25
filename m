Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 901EE74CF2
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 13:22:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vVDr4CYkzDqQ3
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 21:22:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vVDF4ZTjzDqPR
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 21:22:04 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PBDCJ8058709
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 07:21:57 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tya8nbbs4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 07:21:57 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 25 Jul 2019 12:21:56 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Jul 2019 12:21:53 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6PBLqBa54001666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2019 11:21:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40D9642045;
 Thu, 25 Jul 2019 11:21:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80FF342041;
 Thu, 25 Jul 2019 11:21:50 +0000 (GMT)
Received: from [9.85.81.253] (unknown [9.85.81.253])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jul 2019 11:21:50 +0000 (GMT)
Subject: Re: How to ideally fix the log function
To: John Wang <wangzhiqiang8906@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Yu Lei <mine260309@gmail.com>, venture@google.com, mspinler@linux.ibm.com
References: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 25 Jul 2019 16:51:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072511-0016-0000-0000-0000029606C7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072511-0017-0000-0000-000032F40121
Message-Id: <46f3ba00-9382-2040-80a7-519457ecd65c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250135
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

Hi John,

Just some background; The goal is not to have func() pass in CODE_LINE 
and CODE_FUNC since it would be a huge change all over in the code. So 
the plan was to see if something can be done under the cover with no 
impacts to current usage of the API.

!! Vishwa !!

On 7/25/19 6:35 AM, John Wang wrote:
> Hi all
>
> I am just curious about how to ideally fix the log function
>
> Currently,error log code location metadata is not useful, link:
> https://github.com/openbmc/openbmc/issues/2297
>
> That issue mentioned several solutions,But I am still confused.
>
> The call stack of phsophor::logging:log<>() is like this:
>
> func() -> log<>() -> helper_log() -> sd_journal_send
>
> We need to pass arguments(CODE_LINE and CODE_FILE) from `func` to
> `sd_journal_send`,right?
>
> Ideally:
>
> template <level L, typename Msg, typename... Entry>
> void log(Msg msg, Entry... e,
>    const source_location& location = source_location::current())
>
> but packs must be last.
>
> is there any suggestions ?
>

