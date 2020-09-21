Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6403273310
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 21:43:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwFHH6kPlzDql5
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 05:43:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qpwRIFEL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwFGQ3gZWzDqfd;
 Tue, 22 Sep 2020 05:42:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LJgjAg078346; Mon, 21 Sep 2020 15:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=GoX3oh57dzEMI1JnIFPHtbph/2tXJxqK8UDDxOII4Wo=;
 b=qpwRIFELsK4VaqYYtuPjAIeQZngbqU9glV9JXttZfBgcE0Ej2zN2bwRDaI2yBWI2um59
 //RzUbDNO0KDm3UKXuKxIDatmmPqs8Vk7+6FYZUMUZqvlJS99Liks5O4AZPeaIFdOmYu
 p32KgULe9Jo2J9aDkCyxPqqMhOz2HWWLBED0FA5vGvdGQYdMr/Pz1+GpoihHbKHV+gsn
 3w5FzUNCNHmyoQZeIMMtKhrBIGraOfL65DGkV1OuxGYRQpJN7uNS8TXqJvd04Un1xBvX
 V06CZP7m0t54xNUpnWhcMMmQOS0WvlSwMoQ6RcAZpKuEM15hkzBEGVUb9calaNIel7DC Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33q2jt001d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 15:42:51 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08LJgp4U078465;
 Mon, 21 Sep 2020 15:42:51 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33q2jt0019-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 15:42:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08LJbe3R004475;
 Mon, 21 Sep 2020 19:42:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 33n9m8p0vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 19:42:50 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08LJgjQ753281052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 19:42:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B0866E04C;
 Mon, 21 Sep 2020 19:42:49 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E4CF6E050;
 Mon, 21 Sep 2020 19:42:49 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Sep 2020 19:42:49 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Sep 2020 14:42:49 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: Headsup: Alternative to the filesystem overlay
In-Reply-To: <20200921143331.GA20273@bbwork.lan>
References: <CADVsX88ZPmZh+txe1Zis4YfJnXQ4_n-40r6p5Y1hy5_KegUeaQ@mail.gmail.com>
 <20200921143331.GA20273@bbwork.lan>
Message-ID: <3f491d1ca08a5480af9d4555121da090@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_08:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210138
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, Anton Kachalov <rnouse@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-09-21 09:33, Alexander A. Filippov wrote:
> On Mon, Sep 21, 2020 at 11:52:54AM +0200, Anton Kachalov wrote:
>> There was a topic year ago:
>> 
>> https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html
>> 
>> Is anyone currently working in this direction? Any thoughts on 
>> possible
>> approaches?
> 
> As I can see there is no any actions in this direction.

I want to pick up this topic in the next coming months.

> 
> I solved the problem with a difference of the user groups set during 
> firmware
> upgrade by installing a systemd service which starts on the first BMC 
> boot after
> upgrade and merges groups from RWFS and new ROFS.
> 
> This recipe is stored in our internal repo only, but I can share it if 
> it is
> interesting to someone.

I'd be interested, if you would share it. Thanks!

> 
> The problems with other files is not met yet.
> 
>> 
>> We're going to revisit this and discuss possible solutions.

Another alternative I want to explore that is not listed in the original 
email is systemd's stateless implementation, where there's no need to 
have /etc/ populated to boot. The advantage of that approach is that you 
could mount /etc/ to a writable volume like /var/ and have applications 
write data to that directory without it being an overlay.

>> 
>> One point to mention is: introduce an image feature flag that would 
>> enable
>> rootfs overlay, i.e. for development purposes.
> 
> We still use a static flash layout on our hardware which already uses 
> overlayfs.
> It works fine for us.
> 
> --
> Regards,
> Alexander
