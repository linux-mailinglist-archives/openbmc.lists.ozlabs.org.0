Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BADB30297F
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 19:04:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPd7C6FklzDqyd
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 05:04:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dP97gD/N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPd6K3W8mzDqyP
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 05:04:07 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10PI3HKQ128461; Mon, 25 Jan 2021 13:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YFStoQ+ZEBNTr/4lu1rhYWwXDyxPbasmHVRB5kVWZ2A=;
 b=dP97gD/NvvOlsaQFHATCCQl+Bav4xrtIJlwrATqF4NkIwc/Ucmc+qbaqI/fn1vWvwe+O
 HvdtyigsmSGiQrF2JrEiUgfSIprASLf5+fr6C2Wu3bfUdIQN6Y0M5ISiJiIRnbsfw8C7
 IGb13wstd3MMU1XCY723MkGtqYxtdIm9Yao3kY9XJ7OZg3ynsljZ1QiwtWLDX/W0j9rZ
 1akg8/OW4To9SLCEOSBAuw/U0q3drU/d/OcmfWOwRLsfHzvDz5/eaYDZ/a8EiWkR6QsA
 h+RzvRd4aNMsgFUNaH8cjLvXrA0zdmpYHdySY4/omdA/JAe/IWIhNkTeS0oaSzFhFbu3 mQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36a2m7gku4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 13:04:03 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10PHuvjC025160;
 Mon, 25 Jan 2021 18:04:03 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 36a2jtg4fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 18:04:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10PI42DE22479116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 18:04:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53D14C6057;
 Mon, 25 Jan 2021 18:04:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F0E4C6055;
 Mon, 25 Jan 2021 18:04:01 +0000 (GMT)
Received: from [9.85.201.30] (unknown [9.85.201.30])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jan 2021 18:04:01 +0000 (GMT)
Subject: Re: Gerrit owners plugin coming
To: Ed Tanous <ed@tanous.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <ce3304ff-b402-1d82-7ef8-0c0cc8d3b36a@linux.vnet.ibm.com>
Date: Mon, 25 Jan 2021 15:04:00 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_07:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011 adultscore=0
 mlxlogscore=818 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250094
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



On 1/20/2021 4:23 PM, Ed Tanous wrote:
> The final review to add the OWNERS file to the root of the repo is here:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/39379
> And has already had some discussion and looks to be good to go.
> Assuming there's no other objections, I'd like to get this change made
> on this coming Sunday.

Thanks for this!

Is this process live now? I have a few patches that I already moved from
openbmc to meta-*, need to know if I need to revert them back ;-)

Thanks,

  -Klaus


-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
