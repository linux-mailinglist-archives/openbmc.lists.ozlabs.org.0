Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E8311D7E9
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 21:34:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ylrn6L5szDr8V
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 07:34:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ylr50b5ZzDr7d
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 07:33:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCKW8Kn054792
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 15:33:33 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wupysbnsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 15:33:32 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBCKXWkh061698
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 15:33:32 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wupysbnsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 15:33:32 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBCKWJ2s020303;
 Thu, 12 Dec 2019 20:33:31 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 2wr3q7113e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 20:33:31 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBCKXUlc51249462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 20:33:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5612F6A051;
 Thu, 12 Dec 2019 20:33:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 186796A047;
 Thu, 12 Dec 2019 20:33:29 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 20:33:29 +0000 (GMT)
Subject: Re: pinctrl in phosphor-hwmon
To: Deng Tyler <tyler.sabdon@gmail.com>
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
 <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
 <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
 <CAO9PYRJGne+VxENsY6r_mGzdAxf-sUgzLu71tnRQipO9hPLV=Q@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <edbcee28-8f02-77c6-c9e2-8914ee7b25fd@linux.ibm.com>
Date: Thu, 12 Dec 2019 14:33:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9PYRJGne+VxENsY6r_mGzdAxf-sUgzLu71tnRQipO9hPLV=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_07:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120157
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



On 12/11/2019 12:40 AM, Deng Tyler wrote:
> I added gpio control in my fan driver but I still met some problem. 
> While phosphor-hwmon reading fan0_input, the fan tach driver change 2 
> gpio pin and sleep 2 seconds to return rpm value for stable. There are 
> 12 fan sensors in my platform so the phosphor-hwmon need wait 24 
> senconds at least to get rpm. The waiting time cause dbus hang while 
> issuing ipmi sensor command. Do you have any suggestions?

I vaguely remember someone else had this problem before, and it turned 
out to be a device driver
problem as the reason it was so slow.

Otherwise, the reads could probably be changed to be asynchronous, but 
that could be a pretty big
change to the application.

>
> Tyler
>
> Matt Spinler <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>> 
> 於 2019年12月11日 週三 上午12:29寫道：
>
>
>
>     On 12/9/2019 11:08 PM, Deng Tyler wrote:
>     > Hi Matt:
>     >     Thank for your response that's really helpful. I check the link
>     > and it seems allow a gpio set to high before/after reading a
>     > correspond sensor. Is it possible change 2 gpio to high/low for
>     > reading a correspond sensor?
>
>     That isn't possible in the current code, but I don't see why someone
>     couldn't add that feature.
>
>     >
>     > Regards,
>     > Tyler
>     >
>     > Matt Spinler <mspinler@linux.ibm.com
>     <mailto:mspinler@linux.ibm.com> <mailto:mspinler@linux.ibm.com
>     <mailto:mspinler@linux.ibm.com>>>
>     > 於 2019年12月9日 週一 下午10:58寫道：
>     >
>     >
>     >
>     >     On 12/9/2019 6:15 AM, Deng Tyler wrote:
>     >     > Hi all:
>     >     >     Does phosphor-hwmon support changing gpio pin before read
>     >     > /sys/class/hwmon/hwmon0/fan*_input while monitoring fan
>     sensor?
>     >     In my
>     >     > platform, fans gpio are connect to pin-mux and I need
>     control gpio
>     >     > before get fan tach rpm.
>     >
>     >     It does have the ability to modify a GPIO before/after a
>     reading:
>     >
>     https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
>     >
>     >     configured by some lines in the conf file, like:
>     >
>     https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
>     >
>     >     >
>     >     > Regards,
>     >     > Tyler
>     >
>

