Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241A4CAD77
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 19:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K82Zy0ymrz3bww
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 05:24:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bBf1CLkg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bBf1CLkg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K82ZS2plGz3brJ
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 05:24:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222II1iK029791
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2022 18:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FhR2zYbceqc2LT1ztGYzHUsnV4PciEDPUYyGEamhieI=;
 b=bBf1CLkgifXGUmccROwUm+XIOw2mrsvQqrvRbAVyJE33jJf/OE2wOtxGRrsnVPEKL513
 QFJtiORfsDTu3YflPeQhxPEyZblZJeEPbSiUN44wzTIJSgWKgWrCTdjgnh5UCkZRijBb
 fpb/qOzgWgLoLW7rm9TexcZhy1FmpNaaVFIV8UivdQacoj08KGs2vyHNY40rDfndMSKX
 GaSHWSsYvK1MoqcR519wv+HiDVRT7I8oWZ7/XK+0AIBPZPb0klH+xaQJRzcRrFFkYWIR
 Yipbj4CJSTPDwJdvm7KksPWn0odBPW68G26Exk+TfzYdMS7UoLfM1RGNNDbGCMKCk1pp ew== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejdr5842x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 18:24:13 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222I9Fej017667
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2022 18:24:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3eftrrrgu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 18:24:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222IOC2K22544854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2022 18:24:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC2F3112063
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 18:24:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0292112062
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 18:24:12 +0000 (GMT)
Received: from [9.160.39.227] (unknown [9.160.39.227])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 18:24:12 +0000 (GMT)
Message-ID: <a22c676f-fb37-7886-8231-d1f1d43b4b1d@linux.ibm.com>
Date: Wed, 2 Mar 2022 12:24:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: Security Working Group meeting - Wednesday March 2 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <bae947c9-ef4f-702c-1e9c-4f526681b22f@linux.ibm.com>
In-Reply-To: <bae947c9-ef4f-702c-1e9c-4f526681b22f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NjNCbwfQ3qNHPyUMs59zyDPQiwxkjUH9
X-Proofpoint-ORIG-GUID: NjNCbwfQ3qNHPyUMs59zyDPQiwxkjUH9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=582
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020078
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

On 3/1/22 2:13 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday March 2 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1.

We briefly discussed the NoAccess role.  It may have been conflated with 
the IPMI Callback or NoAccess privileges or with channel access.  Newly 
created IPMI users currently default to NoAccess, and there is a patch 
to make new users have “User” (read only) privilege.  Note that in 
OpenBMC’s IPMI implementation, creating users requires multiple IPMI 
commands, for example: ipmitool user  add, user set password, channel, etc.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/50824

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
>

