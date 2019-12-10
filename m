Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BDC118D99
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 17:29:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XQWW30Z0zDqcY
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 03:29:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XQVp2dc3zDqZV
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 03:29:05 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAGNOGj161305
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 11:29:00 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsmfufq3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 11:28:59 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBAGNjDD164847
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 11:28:59 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsmfufq2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 11:28:59 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBAGRmNw027138;
 Tue, 10 Dec 2019 16:28:58 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2wr3q6mrfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 16:28:58 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBAGSvXu50594090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 16:28:57 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC8FAC05B;
 Tue, 10 Dec 2019 16:28:57 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13182AC05E;
 Tue, 10 Dec 2019 16:28:57 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 16:28:56 +0000 (GMT)
Subject: Re: pinctrl in phosphor-hwmon
To: Deng Tyler <tyler.sabdon@gmail.com>
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
 <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
Date: Tue, 10 Dec 2019 10:28:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_04:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912100141
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 12/9/2019 11:08 PM, Deng Tyler wrote:
> Hi Matt:
>     Thank for your response that's really helpful. I check the link 
> and it seems allow a gpio set to high before/after reading a 
> correspond sensor. Is it possible change 2 gpio to high/low for 
> reading a correspond sensor?

That isn't possible in the current code, but I don't see why someone 
couldn't add that feature.

>
> Regards,
> Tyler
>
> Matt Spinler <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>> 
> 於 2019年12月9日 週一 下午10:58寫道：
>
>
>
>     On 12/9/2019 6:15 AM, Deng Tyler wrote:
>     > Hi all:
>     >     Does phosphor-hwmon support changing gpio pin before read
>     > /sys/class/hwmon/hwmon0/fan*_input while monitoring fan sensor?
>     In my
>     > platform, fans gpio are connect to pin-mux and I need control gpio
>     > before get fan tach rpm.
>
>     It does have the ability to modify a GPIO before/after a reading:
>     https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
>
>     configured by some lines in the conf file, like:
>     https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
>
>     >
>     > Regards,
>     > Tyler
>

