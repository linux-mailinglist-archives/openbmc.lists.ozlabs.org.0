Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446B1317C6
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 19:52:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s4Q34TcYzDqHS
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 05:52:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s4P922gTzDq9l
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 05:51:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006Id0ho087829; Mon, 6 Jan 2020 13:51:52 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb8ukv2jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 13:51:52 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 006IjsXi122046;
 Mon, 6 Jan 2020 13:51:52 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb8ukv2jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 13:51:51 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006IopSP024229;
 Mon, 6 Jan 2020 18:51:51 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 2xajb71m19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 18:51:51 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006IpoJY24445338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 18:51:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 595D9AC05B;
 Mon,  6 Jan 2020 18:51:50 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F64AC059;
 Mon,  6 Jan 2020 18:51:50 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 18:51:50 +0000 (GMT)
Subject: Re: [External] Re: pinctrl in phosphor-hwmon
To: Derek Lin23 <dlin23@lenovo.com>, Deng Tyler <tyler.sabdon@gmail.com>,
 Kun Yi <kunyi@google.com>
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
 <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
 <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
 <CAO9PYRJGne+VxENsY6r_mGzdAxf-sUgzLu71tnRQipO9hPLV=Q@mail.gmail.com>
 <edbcee28-8f02-77c6-c9e2-8914ee7b25fd@linux.ibm.com>
 <CAGMNF6U18c1H_JONFBLrCCyZtf_10F=nmUyqGYeVt_diec6VcQ@mail.gmail.com>
 <CAO9PYRLQOHLs8UTt=V2tD+H5NhpaTHDhd=fLVd10rh44SDqExw@mail.gmail.com>
 <ee307f6300b74d6e83a41d9380cfadc0@lenovo.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <13671f76-b75f-4e88-b0e9-df5433d6ec59@linux.ibm.com>
Date: Mon, 6 Jan 2020 12:51:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ee307f6300b74d6e83a41d9380cfadc0@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_06:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001060154
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



On 12/19/2019 2:37 AM, Derek Lin23 wrote:
>
> Hi all:
>
>           We’ve met the similar situation, so use this thread to 
> follow-up.
>
>           We have two fan tachs that share the same PWM, and we have a 
> GPIO mux which switches between the two fan tachs.
>
>           We would like to setup two different sensors, e.g. fan_a1 
> and fan_a2, but use the same GPIO mux to identify the fan_input should 
> link to one of the two sensors.
>
>           For example, when the mux is high, then fan_a1 gets RPM 
> readings from fanx_input, and when the mux is low, then fan_a2 gets 
> RPM readings from the same fanx_input.
>
>           Please provide some ideas.
>

Could the driver be updated to handle that, so phosphor-hwmon doesn't 
have to care?


> Thank you,
>
>
> Derek
>
> *From:*openbmc <openbmc-bounces+dlin23=lenovo.com@lists.ozlabs.org> 
> *On Behalf Of *Deng Tyler
> *Sent:* Tuesday, December 17, 2019 8:28 PM
> *To:* Kun Yi <kunyi@google.com>
> *Cc:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Matt Spinler 
> <mspinler@linux.ibm.com>
> *Subject:* [External] Re: pinctrl in phosphor-hwmon
>
> Hi Kun
>
>     Thank for your response and that's highly appreciated.
>
> I patch the async read support but it still not working, following is 
> my configuration. Anything I missing?
>
> LABEL_fan0=fan1A
> LABEL_fan1=fan1B
> LABEL_fan2=fan2A
> LABEL_fan3=fan2B
> LABEL_fan4=fan3A
> LABEL_fan5=fan3B
> LABEL_fan6=fan4A
> LABEL_fan7=fan4B
> LABEL_fan8=fan5A
> LABEL_fan9=fan5B
> LABEL_fan10=fan6A
> LABEL_fan11=fan6B
> ASYNC_READ_TIMEOUT_fan0 = "3000"
> ASYNC_READ_TIMEOUT_fan1 = "3000"
> ASYNC_READ_TIMEOUT_fan2 = "3000"
> ASYNC_READ_TIMEOUT_fan3 = "3000"
> ASYNC_READ_TIMEOUT_fan4 = "3000"
> ASYNC_READ_TIMEOUT_fan5 = "3000"
> ASYNC_READ_TIMEOUT_fan6 = "3000"
> ASYNC_READ_TIMEOUT_fan7 = "3000"
> ASYNC_READ_TIMEOUT_fan8 = "3000"
> ASYNC_READ_TIMEOUT_fan9 = "3000"
> ASYNC_READ_TIMEOUT_fan10 = "3000"
> ASYNC_READ_TIMEOUT_fan11 = "3000"
>
> INTERVAL=10000000
>
> Tyler
>
> Kun Yi <kunyi@google.com <mailto:kunyi@google.com>> 於2019年12月13日 週五 
> 上午5:15寫道：
>
>     On Thu, Dec 12, 2019 at 12:34 PM Matt Spinler
>     <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>> wrote:
>
>
>
>         On 12/11/2019 12:40 AM, Deng Tyler wrote:
>         > I added gpio control in my fan driver but I still met some
>         problem.
>         > While phosphor-hwmon reading fan0_input, the fan tach driver
>         change 2
>         > gpio pin and sleep 2 seconds to return rpm value for stable.
>         There are
>         > 12 fan sensors in my platform so the phosphor-hwmon need
>         wait 24
>         > senconds at least to get rpm. The waiting time cause dbus
>         hang while
>         > issuing ipmi sensor command. Do you have any suggestions?
>
>         I vaguely remember someone else had this problem before, and
>         it turned
>         out to be a device driver
>         problem as the reason it was so slow.
>
>     Yea the best test is to read from the kernel sysfs interface and
>     post how long it takes. If the device is misbehaving or the
>     physical bus (i2c/fantach) is not working properly, the delay
>     could easily be O(seconds)
>
>
>         Otherwise, the reads could probably be changed to be
>         asynchronous, but
>         that could be a pretty big
>         change to the application.
>
>     There is some work-in-progress patch to add async read support.
>     The patch works, although the code change is not clean enough.
>
>     https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337
>
>
>         >
>         > Tyler
>         >
>         > Matt Spinler <mspinler@linux.ibm.com
>         <mailto:mspinler@linux.ibm.com> <mailto:mspinler@linux.ibm.com
>         <mailto:mspinler@linux.ibm.com>>>
>         > 於2019年12月11日 週三 上午12:29寫道：
>         >
>         >
>         >
>         >     On 12/9/2019 11:08 PM, Deng Tyler wrote:
>         >     > Hi Matt:
>         >     >     Thank for your response that's really helpful. I
>         check the link
>         >     > and it seems allow a gpio set to high before/after
>         reading a
>         >     > correspond sensor. Is it possible change 2 gpio to
>         high/low for
>         >     > reading a correspond sensor?
>         >
>         >     That isn't possible in the current code, but I don't see
>         why someone
>         >     couldn't add that feature.
>         >
>         >     >
>         >     > Regards,
>         >     > Tyler
>         >     >
>         >     > Matt Spinler <mspinler@linux.ibm.com
>         <mailto:mspinler@linux.ibm.com>
>         >     <mailto:mspinler@linux.ibm.com
>         <mailto:mspinler@linux.ibm.com>>
>         <mailto:mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>
>         >     <mailto:mspinler@linux.ibm.com
>         <mailto:mspinler@linux.ibm.com>>>>
>         >     > 於2019年12月9日 週一 下午10:58寫道：
>         >     >
>         >     >
>         >     >
>         >     >     On 12/9/2019 6:15 AM, Deng Tyler wrote:
>         >     >     > Hi all:
>         >     >     >     Does phosphor-hwmon support changing gpio
>         pin before read
>         >     >     > /sys/class/hwmon/hwmon0/fan*_input
>         while monitoring fan
>         >     sensor?
>         >     >     In my
>         >     >     > platform, fans gpio are connect to pin-mux and I
>         need
>         >     control gpio
>         >     >     > before get fan tach rpm.
>         >     >
>         >     >     It does have the ability to modify a GPIO
>         before/after a
>         >     reading:
>         >     >
>         >
>         https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
>         >     >
>         >     >     configured by some lines in the conf file, like:
>         >     >
>         >
>         https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
>         >     >
>         >     >     >
>         >     >     > Regards,
>         >     >     > Tyler
>         >     >
>         >
>
>
>     -- 
>
>     Regards,
>
>     Kun
>

