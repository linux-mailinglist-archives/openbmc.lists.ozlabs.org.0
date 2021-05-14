Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5A381004
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 20:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhd0Q58VMz301v
	for <lists+openbmc@lfdr.de>; Sat, 15 May 2021 04:51:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eezl7tDI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eezl7tDI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhd053G3hz2yX0
 for <openbmc@lists.ozlabs.org>; Sat, 15 May 2021 04:51:00 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EIY8f5097759; Fri, 14 May 2021 14:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=oWHW/TeN3V5A8/xrhqMWyyBDIAazO5zZDY1/FI07bIw=;
 b=eezl7tDIhI1bXCdAya/phG/yN4qHdo6q8Q9m2eDx11Y/2sYS2RcMwtzE0ttZgzT7Sl0t
 sJ4uvbxBoaw3IzFXbmyXS0jY42MizlzdbjQGdS2Hhhuuru50s0U5pb61NnZ5Nuw2GGv8
 kJTUKR5uV6VEibbdmWoxkw2ZJlHr/wb3oSe31YTkZSW/fwYDLpogqIMmhHnnuRSHi9SV
 x1WrwanMn2jzOLafZVzScZ0iXwJOVOod2Jdbo4sRbHfbB6x5Id8s5qK8x4YEUKqNn2lc
 765EeP7/dm/MLLsxXna59aP+qYDDIs28bjZRs31ycoW3rUXzV1kU0cYkWBJ7nGgtpbIu UA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38hrp3ssg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 14:50:57 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14EIki9E020593;
 Fri, 14 May 2021 18:50:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 38hc6ffp9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 18:50:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14EIouTD32768264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 18:50:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F53BBE053;
 Fri, 14 May 2021 18:50:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4CFBBE04F;
 Fri, 14 May 2021 18:50:55 +0000 (GMT)
Received: from demeter.local (unknown [9.160.6.19])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 14 May 2021 18:50:55 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday May 12 - results
To: Michael Richardson <mcr@sandelman.ca>, openbmc@lists.ozlabs.org
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
 <4508.1620855321@localhost>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e6484cd8-1962-c45a-a694-6854972b4fc9@linux.ibm.com>
Date: Fri, 14 May 2021 13:50:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <4508.1620855321@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _3JCKf2kBSY2lW7L5nMDCZYXS8r93N_x
X-Proofpoint-ORIG-GUID: _3JCKf2kBSY2lW7L5nMDCZYXS8r93N_x
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-14_08:2021-05-12,
 2021-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105140144
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

On 5/12/21 4:35 PM, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > 1. Security impacts of enabling kexec (load and optionally execute new
>      > kernel) in the BMC's production kernel.  How does this work and play
>      > with secure boot and with IMA?
>
>      > 2. What are the security impacts of having the proc file system file
>      > /proc/sysrq-triggerwhich can cause kernel panics which can cause the
>      > BMC to terminate processing?
>
>      > 3. In general, how can you (an operator or the BMC's host system)
>      > recover a BMC which has become unresponsive, for example, because its
>      > kernel processing has failed.  A design introduces using
>      > /proc/sysrq-triggertogether with a recovery kernel installed by kexec.
>
> This tussle between locking down the system against all intrusions, vs being
> able to fix stuff when in trouble is a serious debate.
>
> (Based upon how easily random alien technology takes over the Enterprise, we
> know which way Starfleet engineers went.)
>
> So I suggest that in most cases, the secure boot process should disable
> kexec (and sysrq-trigger!), but that this should be an tunable attribute
> under control of the secure boot process.
>
> For the majority of data center, business and home users of systems, the risk
> of malware in the bootpath of the BMC exceeds the risk of BMC failures, and
> the cost remediation (taking a machine out of commission when there is a BMC problem).
> Having said that, there is a Right-to-Repair concern, and I really hope that
> manufacturers will provide for a hardware jumper, and for installation of new
> trust anchors.
>
> But, there is a variety of ways to do that from kernel cmdlines, to being able to
> boot alternate kernels, and perhaps this could be punted down the road for
> the operator that needs (#3).  Perhaps, coming back to my (humour) above, it
> will in fact be Mars Rover missions or Starlink satellites that need it, and
> probably, they can afford to do that work.

Michael,

Thanks for the NASA, Elon Musk, and Star Trek references.  (I loved the 
Daleks in Star Wars!)

I believe kexec and sysrq-trigger should remain disabled in the OpenBMC 
project defaults.
And the IBM design cited attempts to balance security and usability.

Although I understand there is work in the OCP security project and 
other places to recover a trust anchor, I don't see anything practical 
for OpenBMC to use.

- Joseph


IBM design: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/42948

>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>

