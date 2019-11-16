Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD1FF5D7
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 22:51:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Fpns373BzF3tF
	for <lists+openbmc@lfdr.de>; Sun, 17 Nov 2019 08:51:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Fpn3009DzF4JP
 for <openbmc@lists.ozlabs.org>; Sun, 17 Nov 2019 08:50:45 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAGLl4Z1042018
 for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2019 16:50:42 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wac4s9xtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2019 16:50:41 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAGLofhb048631
 for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2019 16:50:41 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wac4s9xta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Nov 2019 16:50:41 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAGLjO1F012361;
 Sat, 16 Nov 2019 21:50:41 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 2wa8r5nt19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Nov 2019 21:50:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAGLoeXU48038154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Nov 2019 21:50:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 382187805E;
 Sat, 16 Nov 2019 21:50:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6B9C7805C;
 Sat, 16 Nov 2019 21:50:39 +0000 (GMT)
Received: from demeter.local (unknown [9.80.205.29])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat, 16 Nov 2019 21:50:39 +0000 (GMT)
Subject: Re: how to solve the error that basehash value changed from 'xxx' to
 'aaaa' ?
To: www <ouyangxuan10@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <275367c1.6307.16e63b2e1cf.Coremail.ouyangxuan10@163.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
Date: Sat, 16 Nov 2019 15:50:38 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <275367c1.6307.16e63b2e1cf.Coremail.ouyangxuan10@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-16_07:2019-11-15,2019-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911160203
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

Byron,

What modification did you put into the os-release recipe?  It would help 
us help you if you put that in your email.


Are you adding the build date to the generated os-release file?  If so, 
be aware that might cause the issues with the shared state cache you are 
experiencing.  Also be aware this practice wrecks reproducible builds.

A better way to get the same effect might be to create a git tag with 
the information you want to appear in the generated os-release file.  
When you buld with this tag is then picked up by the OpenBMC 
meta-phosphor os-release.bbappend (via `git describe`) and included in 
the genersted os-release file as the BUILD_ID.  See:
https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c07af10b18080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbappend
(But I have not tried that.)

A way to work around the hash change is to add a line to your recipe 
like: PR[vardepsxeclude]="DATETIME"
As suggested by: 
https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhash-mismatch/


My apologies for top posting -- my email reader was not quoting the 
message properly, so I cut/pasted it below.

- Joseph


On 11/13/19 1:38 AM, www wrote:

When I modify the os-release file in my yocto project, it appear some 
error, and how can I solve it ? Who can give me some help or advice? 
Thank you！
I execute the recommended command on the console and it didn't work.

ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch 
ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus 
7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f 
for  /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
ERROR: Taskhash mismatch 
ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus 
7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f 
for /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
ERROR: When reparsing 
/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the 
basehash value changed from 
99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to 
4f3288a8763e2e1af78e4b3cdd9c0c0ccb3b0d5c78a3073c188b22200df2a9b0. The 
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

ERROR: When 
reparsing /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the 
basehash value changed from 
99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to 
47c30012daa6aa77be09a93fe21e66995361ef26b4487111005617db8cb4de59. The 
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

thanks,
Byron

