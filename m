Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F351290B2F
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 20:13:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCZ5r3wJYzDqtR
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 05:13:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hvOZNUmQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZ4q3LgMzDqlh
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 05:12:43 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GI3HVA046649
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 14:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=WjedDACzlz9ojA9tNGXp41GJxYXh09j504/lB5PXOGo=;
 b=hvOZNUmQRl49+9pykqRjyxATjXl7E6z4F/RZtz695cJHvorQSaBxAr0zhan5r94rQRsj
 akXykR/M7yySnaY9ypqgccgFYw2hMmC9dS6naXW/XWu4AM9dcEpOoUDoZaBxRaFnWnb6
 SztMrroyWutw0MVzwEkM3rtFQN/EKfhhHbrSMpYxZpuw5Rs1Ew1zH16m0PxxLNFq4Za4
 omppaKGDEX9HO8KvEDADQjsCXyVX1K3P+pjQ35IclsMRPQpA69oEzRf38I8jOR6rfcXq
 UC5r9zUMeJ5R/Paa5iQbpk0S6DzdkrHdNmAHTD7OueYbhzSAlcSGrzSrOeN88sK0wGuB DQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 347gdy0fme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 14:12:40 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09GIC28Y021412
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 18:12:39 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3434ka9hmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 18:12:39 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09GICcv253871006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 18:12:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67227124052
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 18:12:38 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E4CB124053
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 18:12:38 +0000 (GMT)
Received: from [9.80.201.12] (unknown [9.80.201.12])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 18:12:38 +0000 (GMT)
Subject: Please contribute to the OpenBMC configuration guide
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <17099a76-a668-1a17-5c15-873d46023589@linux.ibm.com>
Message-ID: <ce11c8d9-a872-ac55-3ff8-aa6d50ec6432@linux.ibm.com>
Date: Fri, 16 Oct 2020 13:12:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <17099a76-a668-1a17-5c15-873d46023589@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_09:2020-10-16,
 2020-10-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160133
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

On 10/7/20 11:27 AM, Joseph Reynolds wrote:
> Dear OpenBMC community,
>
> A new [Configuration Guide wiki page]() is intended to help builders 
> and BMC admins.  You can help by editing the wiki with corrections or 
> additions, even if only to suggest new item.  I plan to move this to 
> the docs repo.
>
> [Configuration Guide wiki page]: 
> https://github.com/openbmc/openbmc/wiki/Configuration-guide

Please contribute to the OpenBMC configuration guide.  This is your 
opportunity to pass along advice to someone building an OpenBMC-based 
firmware image or to a BMC administrator who needs to configure a BMC.

https://github.com/openbmc/openbmc/wiki/Configuration-guide

- Joseph

>
> Please take a look!
>
> - Joseph
>
> I need this for my planned work including:
> - Transition the project from the root user to an admin user.
> - Understand how to disable-by-default services like IPMI and SSH.
>

