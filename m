Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48C3493BF
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 15:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5n880cpcz3bn4
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 01:11:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCm2OMhN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nCm2OMhN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5n7t4NW1z2yjS
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 01:10:49 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PE7R8w161671; Thu, 25 Mar 2021 10:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Oq/8RZ9BmFOb6dLQn17OAfGz1AYFvg1hHXQiGiJAI58=;
 b=nCm2OMhNmlb2Nw9VH1uymK2suaUbBi5oJIU2YZO81h2XGtFQV4/VwrgVcldW65zqHgk3
 MVfVekbQxpuMxEtOOZOBTPzSqzZfTWmOynfISLx0oVybs5+tzVaFSHxzML/n/Ye1Lo09
 JhPzXFlU05oQkhlSkeMno61sy7okMRthpWdwsaGHgaTMwHRfxPZZGky/NC1wk7/zBMqN
 +lqXR6oIGQRcAAwVfcAT6ln7EM8QuHJkxEXX+tUkcOBdCK15Mno6e/IW66bY0p31Y3cJ
 51OJPJWyGYgYq4tcAh3phvJ9bQUf9sg2p3T9qOx3+xaLNz+9HM0PuewNyvaSSiCYiBIW SQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37gq0b989g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:10:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PE7JKW023611;
 Thu, 25 Mar 2021 14:10:44 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 37d9bpx67r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 14:10:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PEAhBP12190148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 14:10:43 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 547696E059;
 Thu, 25 Mar 2021 14:10:43 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED0126E052;
 Thu, 25 Mar 2021 14:10:42 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.38])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 25 Mar 2021 14:10:42 +0000 (GMT)
Subject: Re: Web Server Code Location
To: m10902803@gapps.ntust.edu.tw, openbmc@lists.ozlabs.org
References: <000a01d72074$d86f0a90$894d1fb0$@gapps.ntust.edu.tw>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <1f52c96e-6e03-c454-250d-672564589991@linux.ibm.com>
Date: Thu, 25 Mar 2021 09:10:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <000a01d72074$d86f0a90$894d1fb0$@gapps.ntust.edu.tw>
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250106
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

On 3/24/21 1:13 AM, m10902803@gapps.ntust.edu.tw wrote:
> Hello, I知 Luthfi, a master student in NTUST, Taiwan. Currently I知 
> working on openBMC and need to fix these problem: Network settings 
> Firmware update I already finished install the Romulus image and QEMU 
> to run it with GUI. I run ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Hello, I知 Luthfi, a master student in NTUST, Taiwan. Currently I知 
> working on openBMC and need to fix these problem:
>
>  1. Network settings
>  2. Firmware update
>
> I already finished install the Romulus image and QEMU to run it with 
> GUI. I run the GUI by use these commands
>
> qemu-system-arm -m 256 -M romulus-bmc -nographic -drive 
> file=./tmp/deploy/images/romulus/obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd 
> -net nic -net 
> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu
>
> How can I check the source code of the web server that running in it?
>

Where did you get your obmc-phosphor-image-romulus.static.mtd image from?
Did you get by following this? 
https://github.com/openbmc/docs/blob/master/development/dev-environment.md
Then that image will have been built by docker. From there, you can 
identify exactly which version (get commit) of BMCWeb you have.

However, if you plan to write code for the web server, you will 
eventually want to follow the steps here: 
https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md

In general, you can learn more about specific OpenBMC features from:
https://github.com/openbmc/docs/blob/master/features.md
For example, this identifies the BMCWeb HTTP/Web server as: 
https://github.com/openbmc/bmcweb/blob/master/README.md

Joseph

> Sincerely,
>
> Muhamad Luthfi Mufadel
>
> National Taiwan University of Science and Technology
>

