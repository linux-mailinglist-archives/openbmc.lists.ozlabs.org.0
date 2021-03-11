Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D80337E73
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 20:46:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxKFy0Mr2z3cZS
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 06:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LtQQkosi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LtQQkosi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxKFk1mKKz30QY
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 06:46:33 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BJX4q2113125
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 14:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=SGzwlcKGt2VljX54J3lgWHqyCuQyzIHeVOcdftjEwSo=;
 b=LtQQkosizkojsdeHK1KCexXmiLyICDMP4v2UsfMg8CUv0V9KiCq4jbTOc2+5MvvN2C5b
 K+RJXl78Ltl0QyaXlmkJtvgIm+Cv8CaHCKaBEGgoWcU+JJmmaRu5kXvpw/FcHnrczSAf
 Han2LE4ImqosCbiXxUBPm3GvOQGzx9rYDY0ubBo95OFdc7VipQ45/4rdXxjyZaJOZpKt
 TswkdHr0YkkPLoo0g+L6SWbszuFSXpmA6UHN6y4EftJQX4h8H3TENnMHHLuMtHHOeUUp
 +rVqbIhx1TJneAtCX1KVhr9U2ATpcgD+PhzduEqdPnHpgaFsUjVod+bRG7E/bTeNrgrg PA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774mesrd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 14:46:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12BJfgW8030274
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:46:24 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3768rbxrvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:46:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12BJkN9x14483888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:46:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37952136061
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:46:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70BDF13605E
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:46:22 +0000 (GMT)
Received: from [9.81.205.160] (unknown [9.81.205.160])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:46:21 +0000 (GMT)
Subject: Re: Redfish 2020.4 release webinar
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <48a9da2d-d86a-45ee-08ba-86bf1b0065cc@linux.vnet.ibm.com>
Message-ID: <6bec11db-5131-2c32-8653-878e3c86ff18@linux.vnet.ibm.com>
Date: Thu, 11 Mar 2021 12:46:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <48a9da2d-d86a-45ee-08ba-86bf1b0065cc@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_08:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=735
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110100
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

On 2/24/2021 8:14 AM, Gunnar Mills wrote:
> Redfish is hosting a webinar on March 5th. Details below.
> 
> DMTF’s Redfish Forum[1] would like to invite the OpenBMC community to 
> learn about the Redfish 2020.4[2] release via a live webinar hosted on 
> Zoom on March 5 at 11am PT.
> 
> The Forum chairs will present the contents of the release including 
> focusing on: new power and thermal modeling, ‘Conditions’ within the 
> common ‘Status’ property, and additional account types added to manager 
> accounts.
> 

If anyone missed this and would like to watch the reply, it is available 
at https://www.youtube.com/watch?v=QkQAeWd_9UY

> 
> For questions email webinars@dmtf.org.
> 
> [1] https://www.dmtf.org/standards/redfish
> [2] 
> https://www.dmtf.org/sites/default/files/Redfish_Release_2020.4_Overview.pdf 
> 


