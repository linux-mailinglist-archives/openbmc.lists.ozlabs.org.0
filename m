Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F73E07C5
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 20:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg0xj6PBxz3cQm
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 04:43:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tZanyYvn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tZanyYvn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg0xN3gpqz3bY0
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 04:43:19 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174IXfgK026903; Wed, 4 Aug 2021 14:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=d9794hzX4dI1jYtHTFw/tUl6VcwTwbNw+ziH2t0sN98=;
 b=tZanyYvnYv0JntKpf9//e73grIIPbic7guyHJkDBBhAuct12zSoDWKF4xXUI9K3YXDIn
 TFS87yf7p0zMJ9Qo0XwQxX0hUHc8x9Ff7XJkgnrmt18vWfkE4Ms5ZvhU0a/bkrHu8HLf
 t+BjASa/IW9LXqe8t8OtWWgg/D4vSBYrikSC+LI6fBjN8mroMAibxCtPzpHLXLDV6nL4
 IsMHAWzxgXlkefvY0KC7qQ+IBz9fBiRmvBjndrfbmJ8JGnDC4u0cC2l+I10r0cON6ffx
 nYIJzp4jxAd7zDfyv9tLQURu6o5isZVg4mCetSHodYpBaU/OsgvtYbdtpmBHWTCihhLk LA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a733k9753-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 14:43:17 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174IgTCi020009;
 Wed, 4 Aug 2021 18:43:16 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3a6j2gfnc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 18:43:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 174IhF3928836220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Aug 2021 18:43:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8488E124052;
 Wed,  4 Aug 2021 18:43:15 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46141124053;
 Wed,  4 Aug 2021 18:43:15 +0000 (GMT)
Received: from demeter.local (unknown [9.160.63.222])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Aug 2021 18:43:15 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday August 4 - all distro
 owners please review
To: Patrick Williams <patrick@stwcx.xyz>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <YQoJb72EMj1Sk1Lg@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d3c6f2b7-0bc3-154a-dd36-68a4dd697dff@linux.ibm.com>
Date: Wed, 4 Aug 2021 13:43:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <YQoJb72EMj1Sk1Lg@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RDJwr6wj54YnU2FnnTaIL58mFAmLOPav
X-Proofpoint-GUID: RDJwr6wj54YnU2FnnTaIL58mFAmLOPav
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_06:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108040110
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 8/3/21 10:28 PM, Patrick Williams wrote:
> On Tue, Aug 03, 2021 at 05:57:52PM -0500, Joseph Reynolds wrote:
>>   2. (Joseph): Updated password hash algorithm from MD5 to SHA512 (while
>>      keeping the same cleartext password)
>>      https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214
>>      <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214>
> The big hangup on this one right now is that there are tons of overrides of
> EXTRA_USERS_PARAMS in a bunch of `local.conf.sample` files.  Does anyone know
> why these are there rather than relying on the ones we get for free from the
> meta-phosphor layer?  Does anyone have a problem if they are removed?
>
> ```
> $ find -name local.conf.sample | xargs grep usermod -B1
> ./meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample-EXTRA_USERS_PARAMS = " \
> ./meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample:  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
> --
...snip...
> --
> ./meta-asrock/meta-e3c246d4i/conf/local.conf.sample-EXTRA_USERS_PARAMS = " \
> ./meta-asrock/meta-e3c246d4i/conf/local.conf.sample:  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
> ```
>
> My feeling is that the majority of them can be removed and were probably just
> copy/paste jobs from somewhere else.  The only ones that we may need to
> reconsider are the ones in meta-evb because I'm not 100% convinced that those
> machines always use meta-phosphor.
>
> I haven't had time to yet, but I would suggest just making a commit to delete
> all of these and see who is outraged by it.

Although I don't see my role as to cause outrage, I created the commit here:
Please review https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45614

- Joseph

