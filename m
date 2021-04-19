Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD74364663
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 16:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP8m43kfsz2y6B
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 00:47:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thHzQJLo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=thHzQJLo; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP8lr16cbz2xZn
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 00:46:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JEXQge143660; Mon, 19 Apr 2021 10:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BvL66hXkMGU5VvwGY87B9OnuXkym3VRFAOic2yEKt5w=;
 b=thHzQJLo4RBCsdeLg1BgPFdKpehhNihbfAMuc7hKxm4Y1UOEXguWzSc/sLhtxA3M3hR7
 ZyzybJsEXVTMF1LJEgOTgzQCiFSDxjDX1m+1XZzcfFQDRAf7Q2ArgUDvmohi6kS0AaCk
 G87FMrn//R+uJ4+aZENNIP6ZfILTk3wPuWs8+wWgy+c0OzsGGdbTWn1jnoAD+WNy4e53
 AtYE9ZIGakKVXJBKJth2hu4BRDGVDBXNcipd6v9f9Ngs6SRJZzsdSROTcuRvg34DC1jF
 wqtd9N9Y8brBpx+RKZkDFcRfECWbpkS5BxxW8MDd8Lu5lFiHsXz+VHL9ZaJGYkKlF2JE Dg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380d88uh42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 10:46:42 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13JEaYNr029288;
 Mon, 19 Apr 2021 14:46:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 37yqa9jnbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 14:46:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13JEkeFC17629446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 14:46:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0B9FC6059;
 Mon, 19 Apr 2021 14:46:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C616C6055;
 Mon, 19 Apr 2021 14:46:40 +0000 (GMT)
Received: from demeter.local (unknown [9.160.2.73])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Apr 2021 14:46:39 +0000 (GMT)
Subject: Re: Need help with service-config-manager and socket activated
 services
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
References: <53032e76-bee4-9f04-231e-762c0c1b8e06@linux.ibm.com>
Message-ID: <015eaa30-1803-20ea-2360-6819bef1221e@linux.ibm.com>
Date: Mon, 19 Apr 2021 09:46:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <53032e76-bee4-9f04-231e-762c0c1b8e06@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pDimn1QYaLEWQpFuss5LVa_b1B_iIdnX
X-Proofpoint-GUID: pDimn1QYaLEWQpFuss5LVa_b1B_iIdnX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_10:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=634
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104190100
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

On 4/7/21 6:04 PM, Joseph Reynolds wrote:
> We are adding a new function to allow the BMC admin to disable the 
> dropbear SSH server [issue 1763][].  This consists of a D-Bus 
> interface controlled by [service-config-manager][] and an enhanced 
> Redfish REST API.

Richard and AppaRao,

We are enhancing service-config-manager so it can control the dropbear 
SSH server.  See [gerrit review 42072][].  The problem with this 
patchset are:
- It always reports dropbear as disabled.
- When we enable dropbear via this service, it reports dropbear as 
enabled for a few seconds, then it reports dropbear as disabled.

I believe the underlying issue is that dropbear is socket activated 
service.  Does service-config-manager understand how to control socket 
activated services like dropbear server?
- If so, can you help us debug what is going wrong?
- If not, can you point us to what code needs to be enhanced to make 
this work?

Thanks,
- Joseph

>
> We need help to understand how to enhance service-config-manager to 
> work with socket activated services such as dropbear.  For example, to 
> disable dropbear, is the correct action to perform something like this?:
>   systemctl stop dropbear.socket
>   systemctl disable dropbear.socket
>
> - Joseph
>
> [issue 1763]: https://github.com/ibm-openbmc/dev/issues/1763
> [service-config-manager]: 
> https://github.com/openbmc/service-config-manager
[gerrit review 42072]: 
https://gerrit.openbmc-project.xyz/c/openbmc/service-config-manager/+/42072

