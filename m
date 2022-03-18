Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD44DE3F6
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 23:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKz802JNvz30hl
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 09:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eTTxLf+H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eTTxLf+H; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKz7W4bNbz2xsW
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 09:23:51 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IIXFjo013105; 
 Fri, 18 Mar 2022 22:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=D9P1RnaKkwkFeSEMMIb1Z3RkgcflvT6n+VmMepNjXdY=;
 b=eTTxLf+HhTJO9NsxwEUDahjIGyjHed6RsJqHBcZSbMUqbbzOL114LSbl8u2Zq7/G9hOd
 Zlshpj7Ck2+a50rrFKojc5AU2fbhbAhnMXqg020wxallVnl3ZQ/6RLKvFlEBH7FIMy4c
 HhckrF28aOaxQ60CufRn94ngu+80z2SYs/6NkWq4F5NhQCUq0y5bWkjNq7tw2IsrlnKD
 fi0hDXr/A4+ftvkMh4UIGdwAM54L3lLAfZY8ne7ecaTWzwu8P66d+5st4duN/PrcTmYX
 ZpdSuGLenuN7koRJhTUK6KWU2y2eHuQphbwiP2/+R8ZE2zZ3t/DmCn/LhnEXkD9dxGqU Nw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3evj92te02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:23:48 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IMI9BK011482;
 Fri, 18 Mar 2022 22:23:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3erk5a87r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:23:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IMNkDQ48759292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 22:23:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2430A124053;
 Fri, 18 Mar 2022 22:23:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32C02124052;
 Fri, 18 Mar 2022 22:23:45 +0000 (GMT)
Received: from [9.65.232.98] (unknown [9.65.232.98])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Mar 2022 22:23:45 +0000 (GMT)
Message-ID: <3d0f9c09-e3e0-2a4a-7f48-5f09991fba8a@linux.ibm.com>
Date: Fri, 18 Mar 2022 17:23:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: Security Working Group meeting - Wednesday March 16 - results -
 audit log handling
Content-Language: en-US
To: Michael Richardson <mcr@sandelman.ca>, Patrick Williams <patrick@stwcx.xyz>
References: <bcdc1bcd-857c-9110-2ecc-aa3719ce1d10@linux.ibm.com>
 <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
 <211577.1647459931@dooku>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <211577.1647459931@dooku>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MtyJDKoMdCTzX5IfQ-DxYcypwWTjqnEY
X-Proofpoint-ORIG-GUID: MtyJDKoMdCTzX5IfQ-DxYcypwWTjqnEY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_14,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180119
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

On 3/16/22 2:45 PM, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > We also discussed encrypting data like logs, and storing keys in a
>      > vault / trust zone /  TPM.
>
> Wouldn't it make most sense to encrypt them *to* an asymmetric (public) key that is
> not on the BMC?   Or one can send them over encrypted syslog, or netconf to
> another server for safe keeping.
> Or are you thinking that you need to sign the logs?
>
> If the key is stored locally, even in a TPM, and the point is to be able to
> review logs locally, then the logs need to get decrypted, and that means that
> the key needs to be enabled/opened/activated locally, and which point,
> if there was a compromised system, the bad guy wins.
>
> I guess I wonder what the goals are here.

Goals?  We didn't mention any goals, and the discussion about encryption 
was lighthearted and introductory.
I had not thought past storing the audit log on the BMC, and realizing 
that it should be encrypted or streamed off the BMC.
I agree that using symmetric keys is not a good idea.

I'll ask my requirement providers what their needs are in this space.

- Joseph

>
>      > See also encrypted volume https://github.com/openbmc/estoraged
>      > <https://github.com/openbmc/estoraged>
>
> Same issue: where is the key stored?
same

