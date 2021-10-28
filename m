Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E889C43E3BE
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:30:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7Hp5MzYz2yZ2
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:29:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qHT2T/Qx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qHT2T/Qx; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg77B0Qm2z2ynX
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:22:29 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SEHGXH028620; 
 Thu, 28 Oct 2021 14:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qvPCS62AAQgN2IxJL1wvwXGHeV5b1eJxsKyVIzlTkQU=;
 b=qHT2T/Qx1N4dIqnWxBkD84WP9LSYGV5E32U5PxA9s+UnsC7I2t5XXnfAJ29XVD1kKtlt
 t2O2WYLJ9eKidBse1sm6YU/eQa+pKU1BxCq3J4/Knf6p6xLFFt1rJ+xgC6JxLgOpN6DS
 S0jw8UPP0jRcG+fJ+WVp+gSgBYi4yXLWe+g1dqjlxCdu1xxi+FGGm+fOfmAKxeomKEFT
 /TtubJniu1u3vMQTDCRvYkYsjU8Sln0aSgs37D0GzusFfmffsCC3fPRmB6Gnpkn84epd
 w174MsHVOHp9MSINAFULchxFKhbcOflbN4fOFK85itD8CphC/64AK4k4dCGRFTPJcMmr cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bywg9g2hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:22:23 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19SEHSmP029027;
 Thu, 28 Oct 2021 14:22:23 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bywg9g2h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:22:23 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19SEDO9j021598;
 Thu, 28 Oct 2021 14:22:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3bx4fn78ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:22:22 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19SEMKVL30998986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 14:22:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBF5FB2075;
 Thu, 28 Oct 2021 14:22:20 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 205C7B206B;
 Thu, 28 Oct 2021 14:22:20 +0000 (GMT)
Received: from [9.77.132.135] (unknown [9.77.132.135])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Oct 2021 14:22:19 +0000 (GMT)
Message-ID: <19026e2d-8c61-a82d-77e2-871100daff54@linux.ibm.com>
Date: Thu, 28 Oct 2021 09:22:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Start using github security advisories
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
 <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
 <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
 <79311a65fd6e30f18b0fb038b1906fe5ec015466.camel@fuzziesquirrel.com>
 <f53a303274f21127c3214d9aabfb0793b5a499af.camel@fuzziesquirrel.com>
 <b738b432-8416-d26d-2a89-d61e4187db67@linux.ibm.com>
 <YXqo7KhqQ5y/ZM5p@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YXqo7KhqQ5y/ZM5p@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y6-5-8Q0z_1B6lPMbq7mX3o0G-Do4Svj
X-Proofpoint-ORIG-GUID: IWUP-YPuPkGuLfuy-DXNa0Tde9Od5NXD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280079
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/28/21 8:43 AM, Patrick Williams wrote:
> ...snip...
> I want to reiterate three things:
>
>      1. In Github, security advisories are different from issues.  Security
>         advisories are suppose to be able to be collaborated on in private
>         without the repository itself being private.  Only when you are ready to
>         reveal the security advisory can you switch it to be public.

That matches my understanding.  The entire openbmc/security-response 
repo will be private to the OpenBMC security response team.
In this repo we will:
A. Track reported vulnerabilities under openbmc/security-response/issues.
B. Work on draft security advisories.

We don't have the exact workflow worked out.  I was thinking we could 
publish the security advisories under openbmc/openbmc/security.


Security advisory notes:
- The term "security advisory" as used here means the public 
announcement of a security vulnerability together with a mitigation 
(such as a fix or a workaround).  The OpenBMC security response team 
works on the security advisory in private, and then publishes these 
advisories when ready.  See the [guidelines][].
- IBM X-Force collects "security advisories" from all sources and 
publishes "security advisories" which it calls "security bulletins".  
The main distinction is advisories are input to the process, and 
bulletins are output.


[guidelines]: 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md

>      2. We have two webhooks for Discord now: one for issues and one for code
>         changes.  Security advisories are not currently covered.  If you make an
>         issue in a public repository anyone can see it, even if it isn't covered
>         by a Discord webhook, so "limiting the awareness by avoiding the Discord
>         webhook" isn't really what you want anyhow.  You need to make sure the
>         information you want to be kept private is private (and again security
>         advisories are suppose to be the way to do that).

We plan to test the confidentiality of the openbmc/security-response 
repo with respect to discord.

>      3. Having a private repository means you cannot report any security
>         advisories (or issues) in a public way.  Today if someone goes to
>         https://github.com/openbmc/security-response they get a 404 (unless they
>         have explicit access to the private repository).

I was thinking we could publish the security advisories under 
openbmc/openbmc/security.
We are still trying to figure out the workflow.

