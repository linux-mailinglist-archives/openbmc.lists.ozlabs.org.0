Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E811008D8
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 17:03:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gtys3HT1zDqdd
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 03:03:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gty61QlpzDqcR
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 03:02:21 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIFvTD1023865
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 11:02:16 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2way8mddpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 11:02:15 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAIFvZWI024751
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 11:02:15 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2way8mddnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2019 11:02:15 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAIFsvTa002898;
 Mon, 18 Nov 2019 16:02:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2wa8r68kev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2019 16:02:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAIG2DeX47448358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Nov 2019 16:02:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B677AC059;
 Mon, 18 Nov 2019 16:02:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59613AC05F;
 Mon, 18 Nov 2019 16:02:13 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 18 Nov 2019 16:02:13 +0000 (GMT)
Subject: Add build date to image (was: error basehash value changed)
To: www <ouyangxuan10@163.com>
References: <275367c1.6307.16e63b2e1cf.Coremail.ouyangxuan10@163.com>
 <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
 <136be35a.269c.16e7c360818.Coremail.ouyangxuan10@163.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <17d14e7a-1dc8-3375-a8a6-ea61c60e3bb7@linux.ibm.com>
Date: Mon, 18 Nov 2019 10:02:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <136be35a.269c.16e7c360818.Coremail.ouyangxuan10@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-18_04:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911180146
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/17/19 7:52 PM, www wrote:
> Dear Joseph，
>
> Thank you for your reference and suggestions. "DATETIME" is not local 
> time，so I need add a new one.
> I added a new variable to get local time without reporting an error.
> The current problem is, how can I make this task compile every time 
> even without modification, and store the latest time?
> Do you have any suggestions?

I re-asked your question on the openembedded-core email list.  See 
replies to 
http://lists.openembedded.org/pipermail/openembedded-core/2019-November/289259.html

There were two answers:

1.
There's an image-buildinfo class that can inject build-specific 
information of your choosing into the image.

2.

I'd write the date into the file at image creation, via
ROOTFS_POSTPROCESS_COMMAND.

Having it in a recipe means that you either force the recipe to not be a
part of sstate cache, always rebuilding it and its dependencies (bad idea),
or accept that the date comes from a previously built cache object, which
means it will mismatch the actual image creation date.

A bit of context would help: why would you want that info in os-release?
Who would use that information and how?



For item 2, I also found:
In the Yocto Project Reference Manual, https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html
, "If you need the build date recorded in|/etc/issue*|  or anywhere else in your image...."

And use a recipe like:
  add_build_time_to_etc() {
         date >> ${IMAGE_ROOTFS}/etc/image-build-date
  }
  ROOTFS_POSTPROCESS_COMMAND += "add_build_time_to_etc; "

However, I have not tested this.


Also I don't fully understand this use case.  Maybe there is a better way to do what you need.  Why do you need the driver build date?  Is it to learn how old your driver is?  Most projects use driver versions for that purpose (which is in the driver's /etc/os-release file), and then your can look up that driver version on a list.  For OpenBMC, we use https://github.com/openbmc/docs/blob/master/release/release-notes.md

Please note that adding the build date to the driver image breaks reproducible builds.  Reproducible builds are desired to support the use case of digitally signing the firmware image.  Can you use an alternative date?  Instead of using your build host's current date, can you use the date of the most recent commit the source was build from?

- Joseph

>
> thanks，
> Byron
>
>
> At 2019-11-17 05:50:38, "Joseph Reynolds" <jrey@linux.ibm.com> wrote:
> >Byron,
> >
> >What modification did you put into the os-release recipe?  It would help 
> >us help you if you put that in your email.
> >
> >
> >Are you adding the build date to the generated os-release file?  If so, 
> >be aware that might cause the issues with the shared state cache you are 
> >experiencing.  Also be aware this practice wrecks reproducible builds.
> >
> >A better way to get the same effect might be to create a git tag with 
> >the information you want to appear in the generated os-release file.  
> >When you buld with this tag is then picked up by the OpenBMC 
> >meta-phosphor os-release.bbappend (via `git describe`) and included in 
> >the genersted os-release file as the BUILD_ID.  See:
> >https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c07af10b18080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbappend
> >(But I have not tried that.)
> >
> >A way to work around the hash change is to add a line to your recipe 
> >like: PR[vardepsxeclude]="DATETIME"
> >As suggested by: 
> >https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhash-mismatch/
> >
> >
> >My apologies for top posting -- my email reader was not quoting the 
> >message properly, so I cut/pasted it below.
> >
> >- Joseph
> >
> >
> >On 11/13/19 1:38 AM, www wrote:
> >
> >When I modify the os-release file in my yocto project, it appear some 
> >error, and how can I solve it ? Who can give me some help or advice? 
> >Thank you！
> >I execute the recommended command on the console and it didn't work.
> >
> >ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch 
> >ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus 
> >7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f 
> >for  /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
> >ERROR: Taskhash mismatch 
> >ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus 
> >7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f 
> >for /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
> >ERROR: When reparsing 
> >/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the 
> >basehash value changed from 
> >99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to 
> >4f3288a8763e2e1af78e4b3cdd9c0c0ccb3b0d5c78a3073c188b22200df2a9b0. The 
> >metadata is not deterministic and this needs to be fixed.
> >ERROR: The following commands may help:
> >ERROR: $ bitbake os-release -cdo_compile -Snone
> >ERROR: Then:
> >ERROR: $ bitbake os-release -cdo_compile -Sprintdiff
> >
> >ERROR: When 
> >reparsing /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the 
> >basehash value changed from 
> >99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to 
> >47c30012daa6aa77be09a93fe21e66995361ef26b4487111005617db8cb4de59. The 
> >metadata is not deterministic and this needs to be fixed.
> >ERROR: The following commands may help:
> >ERROR: $ bitbake os-release -cdo_compile -Snone
> >ERROR: Then:
> >ERROR: $ bitbake os-release -cdo_compile -Sprintdiff
> >
> >thanks,
> >Byron
>
>

