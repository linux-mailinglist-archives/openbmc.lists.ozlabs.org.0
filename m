Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5943C22D18E
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 23:58:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD34Q17GPzDsXK
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 07:58:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD33V4KGlzF1SQ
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 07:57:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OLXGZC037834
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 17:57:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fhu0kvwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 17:57:53 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06OLiWFP069701
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 17:57:52 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fhu0kvw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 17:57:52 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OLtVtl012971;
 Fri, 24 Jul 2020 21:57:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 32brq9fgpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 21:57:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06OLvpv151773766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 21:57:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BCCCB2066;
 Fri, 24 Jul 2020 21:57:51 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A16E3B205F;
 Fri, 24 Jul 2020 21:57:50 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.172.74])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jul 2020 21:57:50 +0000 (GMT)
Subject: Re: Query regarding using the Redfish in OpenBMC
To: Mike <proclivis@gmail.com>,
 khader basha shaik <shaikkhaderbasha601@gmail.com>
References: <CAD+gp9D5RRCy=onUg-PdzD91eCom--4y9QvPjjFiFLRSvTf0jw@mail.gmail.com>
 <7FA6C0BB-1883-40DE-9FD1-9288658C09AA@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <30dabaf6-b18d-a94b-af46-3291233b5ad1@linux.ibm.com>
Date: Fri, 24 Jul 2020 16:57:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7FA6C0BB-1883-40DE-9FD1-9288658C09AA@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_10:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240145
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/24/20 8:40 AM, Mike wrote:
> I’m trying to do the same and struggling to get it up on a Rasp Pi 4.
>
> My first approach was to add layers to meta-raspberrypi, and I got to 
> the point where the web was up, but I could not log in with root. I 
> added a missing layer that adds groups to the accounts and will test 
> later today.
>
> The second approach was to use the evb config files. But it can’t make 
> the image. It seems to be using meta-phosphor image layers instead of 
> meta-raspberrypi layers. I used openbmc tag 2.9. I will try 2.8 later 
> and see if it compiles.

I think your build configuration would include both the meta-raspberrypi 
and meta-phosphor layers.
The meta-phosphor layer brings in the BMCWeb recipe [1] and BMCWeb 
enables Redfish by default [2].
So I think your approach should work, but I do not have experience 
setting up machines.
Andrew added a tutorial for this [3].

[1]: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb
[2]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L37
[3]: https://gist.github.com/geissonator/77d4f6c6ed17bb0693b4251137f77fb4

The root password is configured in the phosphor-defaults.inc [4] (and 
other places such as in various EVB layers) and the root user is 
authorized to use redfish APIs per the bmcweb recipe ([1] again).

[4]: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/distro/include/phosphor-defaults.inc#L229

Note the default port for BMCWeb is 443 (HTTPS).

A few more questions:
1. How are you getting the RPI's IP address?  Are you just looking for 
it, or do you learn it by using the RPI's serial connection and signing in?
2. Are you using the RPI's serial port to debug?  If so, can you sign on 
as root?  If you can, does the systemctl command show the bmcweb service 
is running?  If it is, does bmcweb show any error messages for failed 
attempts to use Redfish APIs?

- Joseph

>
> I will post more details later. I can provide config files etc. I am 
> away from my computer for awhile.
>
> How are you building? Are you using an evb config? What tag are you using?
>
>
>
> Sent from my iPhone
>
>> On Jul 24, 2020, at 6:01 AM, khader basha shaik 
>> <shaikkhaderbasha601@gmail.com> wrote:
>>
>> ﻿
>> Hi Joseph,
>>
>> Thanks for your response.
>>
>> I will be using Raspberrypi3 system.
>>
>> Can you please guide what further steps I should take in order to 
>> view the /redfish/v1 content in the 
>> web(https://xxx.xxx.xxx:8000/redfish/v1).

The default port is 443 (HTTPS) unless you changed it in a recipe. (This 
is not common.)
If you continue to enter "https:" you should not need to specify port.

>>
>> Any pointer on this is really helpful.
>>
>> I have gone through the documents the developer docs but could not 
>> find anything that points to enabling the redfish stuff in the browser.
>> Please correct me if i am wrong
>>
>> Thanks & Regards,
>> Khader B Shaik
>>
>>
>>
>> On Thu, 23 Jul 2020 at 19:25, Joseph Reynolds <jrey@linux.ibm.com 
>> <mailto:jrey@linux.ibm.com>> wrote:
>>
>>     On 7/23/20 5:48 AM, khader basha shaik wrote:
>>     > Hi Team,
>>     >
>>     > I am newbiee to  Openbmc.  I want to view  the redfish/v1
>>     > (https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser
>>     > .Could you please guide me on what changes i need to so
>>     that i view
>>     > the /redfish/v1/ content in the browser .
>>     >
>>     > here are the steps i have followed:
>>     >
>>     >  1. Clone OpenBMC project : git clone
>>     > https://github.com/openbmc/openbmc.git in the server machine .
>>     >  2. Compile using the following command:
>>     >     TEMPLATECONF=meta-phosphor/conf  . openbmc-env
>>     >  3. modify the following files:
>>     >
>>     >   *  #build vi conf/local.conf  (modify the  line
>>     "-MACHINE??=qemuarm"
>>     >     " to "-MACHINE??=raspberrypi3-64" "
>>     >   * #build vi conf/bblayer.conf (add the following line
>>     >  "/home/khader<username>/openbmc/meta-raspberrypi \"  to the line
>>     >     above /home/khader<username>/openbmc/metaphosphor \"
>>     >
>>     >        4. #build  bitbake obmc-phosphor-image
>>     >
>>     > The above steps I have used to build an Openbmc project.
>>     >
>>     >
>>     > Can you help me what further steps should i need to do so that
>>     i can
>>     > view the /redfish/v1/  content in the webbrowser.
>>
>>     What BMC system will you use to upload, boot, and run the BMC
>>     firmware
>>     image?  A QEMU virtual system?
>>     Have you seen the developer docs here?
>>     https://github.com/openbmc/docs/tree/master/development
>>
>>     Good luck,
>>     - Joseph
>>
>>     >
>>     > Note:- I am compiling the openbmc code in the server machine.
>>     >
>>     > Any help /guidelines on this will really help me alot.
>>     > Appreciate all your help.
>>     >
>>     > Thanks & Regards,
>>     > khader B Shaik
>>

