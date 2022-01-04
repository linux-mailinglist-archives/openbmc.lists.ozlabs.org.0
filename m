Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72194484381
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 15:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSwDT6QD6z2yg5
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 01:36:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G0yZ/v3k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G0yZ/v3k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSwD151F2z2x9b
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 01:36:32 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204CPIst009141; 
 Tue, 4 Jan 2022 14:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=sjZCea6+KWNH0O4Bpk6i8BxruXqhdJNvUqjICFS6SAo=;
 b=G0yZ/v3kB08pm4sJMgBFwAt/fe1sm2dvB5cL6nlmRKWQXjmfnqNwk1SXkhjoYjlDKDCz
 rxcGAxXoyy+ksJiodeRS39h4H+gHSKENt8lsdeUJ6e+czcIXM6guVUtc9lvjBUWaEFhM
 5FAdG3M2pVl/7GIKyGTTBpJumc9XD/MizyLO218+NNLXQBjwRppFGUKZR7gJQ13A1C5W
 quZ4h0dFrZhwL2eUUECfwDcjyyRKEZyoGwAQkhVDoWvWKH2fBdCAXEqolfof1Chn2ken
 N8mr/6SMMiD4EvabmqLrHdGh9fP2XKlpd/MIc9y81GSmQAOMsK86ooks/vsjEsnKuUmq 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckgnwhgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:36:25 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204EXXBr016775;
 Tue, 4 Jan 2022 14:36:24 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckgnwhgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:36:24 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204EYYnT009667;
 Tue, 4 Jan 2022 14:36:23 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3daekapts1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:36:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204EZ1mQ6685272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 14:35:01 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E46412405E;
 Tue,  4 Jan 2022 14:35:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47C6D124055;
 Tue,  4 Jan 2022 14:35:00 +0000 (GMT)
Received: from [9.160.61.42] (unknown [9.160.61.42])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jan 2022 14:35:00 +0000 (GMT)
Message-ID: <d83cda1c-0663-7b30-8451-4e914d2fae7f@linux.ibm.com>
Date: Tue, 4 Jan 2022 08:35:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: hwmontempsensor issue in dbus-sensor
Content-Language: en-US
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
 <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
 <CAA7TbcvDyDjLjagn9ePQ3DC4iNUF2jpw=0VecsPpLizJZj2BMw@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
In-Reply-To: <CAA7TbcvDyDjLjagn9ePQ3DC4iNUF2jpw=0VecsPpLizJZj2BMw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -qfLNGg0E5nUkGMfZDBmjtCgxO4GS4pn
X-Proofpoint-ORIG-GUID: ljULvqWzYabGs11JkDm8mUeVemiVdhy6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040098
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jayashree D <jayashree-d@hcl.com>, Ed Tanous <edtanous@google.com>,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/4/2022 1:36 AM, Kumar Thangavel wrote:
> Hi Patrick/Ed, We are already working on this to fix this issue. Since 
> that patch was submitted by Bruce, we posted this in the mailing list 
> to get his opinion. After fixing this issue, we will submit the patch 
> in gerrit. We need help in testing ZjQcmQRYFpfptBannerStart 
> ZjQcmQRYFpfptBannerEnd
> Hi Patrick/Ed,
>
> We are already working on this to fix this issue. Since that patch was 
> submitted by Bruce, we posted this in the mailing list to get his 
> opinion.
> After fixing this issue, we will submit the patch in gerrit. We need 
> help in testing this fix in IBM platforms.
>

I can help test on an IBM system.

> Thanks,
> Kumar.
>
>
>
>
> On Tue, Jan 4, 2022 at 2:39 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
>     Ed,
>
>     I think there are other commits needing the IIO functionality now.
>     There is at least the pending commit for Humidity that we’d like
>     to get merged. I think it is better to move forward with a fix
>     rather than backwards with a revert at this point.
>
>     Kumar/Jayashree,
>
>     Can you dig into this and get to the bottom of it?
>
>     - Patrick
>     Sent from my iPhone
>
>     > On Jan 3, 2022, at 11:21 AM, Ed Tanous <ed@tanous.net> wrote:
>     >
>     > ﻿On Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
>     > <bruce.mitchell@linux.vnet.ibm.com> wrote:
>     >>
>     >>> On 12/20/2021 10:29, Ed Tanous wrote:
>     >>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
>     >>> <kumarthangavel.hcl@gmail.com> wrote:
>     >>>>
>     >>>> Hi All,
>     >>>>
>     >>>> Gentle Reminder on this.
>     >>>>
>     >>>> Thanks,
>     >>>> Kumar.
>     >>>>
>     >>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel
>     <kumarthangavel.hcl@gmail.com> wrote:
>     >>>>>
>     >>>>> Hi All,
>     >>>>>
>     >>>>>
>     >>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon
>     Temp Sensor.
>     >>>>>
>     https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab
>     >>>
>     >>> Bruce, this is your patch.  Could you take a look at the below and
>     >>> provide your input?
>     >>>
>     >>>>>
>     >>>>>
>     >>>>> While testing those changes in my platform, I found that
>     each sensor in hwmon temp has been creating twice.
>     >>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP
>     sensor is created twice.
>     >>>>>
>     >>>>>
>     >>>>> /sys/class/hwmon/hwmon2/temp2_input
>     >>>>> /sys/class/hwmon/hwmon2/temp1_input
>     >>>>>
>     >>>>>
>     >>>>> Before your change, hwmon temp sensor will check whether the
>     path is already exists or not.
>     >>>>> If it exists, it will skip and proceed with next path.
>     >>>>>
>     https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96
>     >>>>>
>     >>>>>
>     >>>>> Could you please explain why it is creating twice in hwmon
>     temp ?
>     >>>>>
>     >>>>>
>     >>>>> Journalctl log before your changes applied :
>     >>>>>
>     >>>>>
>     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
>     "/sys/class/hwmon/hwmon2/temp2_input"
>     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
>     xyz.openbmc_project.Configuration.TMP421
>     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name :
>     SP_OUTLET_TEMP
>     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
>     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
>     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>     >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
>     "/sys/class/hwmon/hwmon2/temp1_input"
>     >>>>>
>     >>>>>
>     >>>>>
>     >>>>> Journalctl log after your changes applied :
>     >>>>>
>     >>>>>
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
>     "/sys/class/hwmon/hwmon2/temp2_input"
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type
>     : xyz.openbmc_project.Configuration.TMP421
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
>     SP_OUTLET_TEMP
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
>     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
>     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>     >>>>>
>     >>>>>
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
>     "/sys/class/hwmon/hwmon2/temp1_input"
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type
>     : xyz.openbmc_project.Configuration.TMP421
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name :
>     SP_OUTLET_TEMP
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
>     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>     >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
>     /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>     >>>>>
>     >>>>>
>     >>>>>
>     >>>>> Thanks,
>     >>>>>
>     >>>>> Kumar.
>     >>
>     >> I will give it quick look today.  Also today is my last day at IBM.
>     >>
>     >
>     > Do you plan on continuing this beyond your tenure at IBM?  If
>     not, is
>     > someone taking this feature over for you?  Given it's been a few
>     weeks
>     > since this regression was reported, and I don't see any fixes in
>     > review, I'm leaning toward reverting it on master for the time being
>     > until someone puts up a patch to fix the issue.
>

