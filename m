Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A46C422DD9
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 18:23:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP2v50KqNz2yms
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 03:23:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CSe4J6pB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CSe4J6pB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP2tZ1KmJz2yP0
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 03:22:45 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195F1sk7002681; 
 Tue, 5 Oct 2021 12:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OwTQJ0/MLnxj7oHX8l/xS13/k1ejksq17JP7LOsqh90=;
 b=CSe4J6pB63PzSwS03aIT6dYdC7By2EXwzwNJBPfAIxGZSEBugcI8h/Wc/tmb22azLiLB
 27eNg3mZgjIg5ccceCBfZZkpXeTiK/yYyXhwdFGdw4XiTCwE9T468AhkdBUjEbq/SHjr
 DtA3H23F/Tse7gOfvYBR02wuvs/yQJOLxJcVupmn9R7aVnLNTdSGmOz55QU71YIDrZad
 MZLaNlpOwzdHnLKpRqyFWxJ142IZ6hTwNx6V4WrgpxwGu5tKLotA9PIzr+TgbUqZjmvY
 mUK8CvC6UJJUhTrBdjQmuePDpndxI5ZgwH+JwCSFr0tdLUuZkSPjhI710xMPOa37aPqb jQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgs06hynp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 12:22:39 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195GI2u0014640;
 Tue, 5 Oct 2021 16:22:38 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3bef2bnf1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 16:22:38 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 195GMa7639191010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 16:22:36 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8393EB2073;
 Tue,  5 Oct 2021 16:22:36 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0917B2065;
 Tue,  5 Oct 2021 16:22:35 +0000 (GMT)
Received: from demeter.local (unknown [9.65.67.179])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  5 Oct 2021 16:22:35 +0000 (GMT)
Subject: Re: SPAKE, DTLS and passwords
To: Michael Richardson <mcr@sandelman.ca>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17277.1633384075@localhost>
 <edfa6abd-e2a2-00ca-3154-59fee4ae125f@linux.ibm.com>
 <27674.1633446561@localhost>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <92a68c9a-beeb-0b2b-6e91-6700eb91c1b5@linux.ibm.com>
Date: Tue, 5 Oct 2021 11:22:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <27674.1633446561@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: exWFJikOSGbaAWbegN2tOZGA9zK13uf9
X-Proofpoint-GUID: exWFJikOSGbaAWbegN2tOZGA9zK13uf9
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_02,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=869 suspectscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050096
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/5/21 10:09 AM, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > On 10/4/21 4:47 PM, Michael Richardson wrote:
>      >> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      >> > The planned IPMI over DLTS function will have certificate-based
>      >> > authuentication.
>      >>
>      >> Do you mean that the server will be authenticated with a certificate, or that
>      >> it will use mutual authentication?
>
>      > I understand this means mutual-TLS.
>      > Based on the gerrit design:
>      > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548/4/designs/ipmi-over-dtls.md
>
> So, why is a password needed?

Password-based auth of IPMI over DTLS is wanted to satisfy use cases for 
installations who cannot or will not use mTLS.

The OpenBMC security working group notes may not be entirely clear. Here 
is the larger context:
- mTLS based authentication of IPMI over DTLS [1] is being designed.
- We are discussing protocols for an *optional* password-based 
authentication of IPMI over DTLS.
- Password-based auth of IPMI over DTLS is wanted to satisfy use cases 
for users who cannot or will not use mTLS.
- We haven't discussed if password auth will be enabled by default. I 
assume there would be a compile-time configuration and there will be a 
way to compile it out of the server.

[1]: https://gerrit.openbmc-project.xyz/c/openbmc/docs

-Joseph

>
>      > Note that design also says the server will have an identity certificate; same
>      > as the HTTPS certificate described in
>      > https://github.com/openbmc/bmcweb/blob/master/README.md
>

