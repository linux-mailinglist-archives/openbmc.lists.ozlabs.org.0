Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B975432712
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 21:06:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY5vd1YQXz2yyh
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 06:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=suiF1Inl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=suiF1Inl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY5v75hTxz2yZv
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 06:06:11 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IHa40E011375; 
 Mon, 18 Oct 2021 15:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B+osyFQtTcEVF4QeTS2j1HyMIdFmrNsNdQYwxDJVPsk=;
 b=suiF1Inlizy5ZMaZWVMC0aPszifjoxreDyL4YXDyFVRGRk8G7AU81sgsfv+Rdk7VmqbZ
 MyNtyKeltn51YY/8KrkKUeoAajZCYHeX8+eiXl6mqThs3abSGK4sQJtWIvjks2gSffpW
 dGjfZ0VgmZ0JwuTky00zLYAhkyaZpADQrF1Yowvh8OLSq/rVpc+t7uoCBwTnxgiZyEmA
 QN/1OUvfqlp6/7y3m2d5Dd9d/CkRj18LJq60KTztIU2x8jXlGvXwY3U1Bwy0fEnHVbrI
 uVUgN+isJc1r49OIh/4p60vk7k1mk3zNaUcj2hgKbNZ5uMrQQrtRFqidVe09WFfmcSip ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bs8bpj9xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 15:06:02 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19IImnPc003101;
 Mon, 18 Oct 2021 15:06:02 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bs8bpj9x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 15:06:02 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IIvMgE023641;
 Mon, 18 Oct 2021 19:06:02 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3bqpcb6g22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 19:06:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IJ615E9044504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 19:06:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3152D112061;
 Mon, 18 Oct 2021 19:06:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFE87112066;
 Mon, 18 Oct 2021 19:06:00 +0000 (GMT)
Received: from [9.163.19.199] (unknown [9.163.19.199])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 19:06:00 +0000 (GMT)
Message-ID: <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
Date: Mon, 18 Oct 2021 12:06:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Start using github security advisories
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
In-Reply-To: <20211018184958.zajwqmloxsyxmxv2@cheese>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7naADmLA5DslhefpwyMiiDwrqe5O4KRK
X-Proofpoint-ORIG-GUID: -1DLFyqEB1-innRKq-Ep82ZVpNHe2e7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=890 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180106
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/18/2021 11:49, Brad Bishop wrote:
> On Thu, Oct 14, 2021 at 02:12:20PM -0500, Andrew Geissler wrote:
>>> Per today's Security working group meeting, we want to start using 
>>> [GitHub security advisories][].  I think we need someone with admin 
>>> permissions to github.com/openbmc/openbmc to create new advisories. 
>>> Then we'll want a group (team? perhaps security-response-team) with 
>>> the current OpenBMC [security response team][] members.  (I have that 
>>> list.)
>>
>> Looks like you’ll need admin authority on openbmc/openbmc in order to 
>> utilize the security advisories feature. I wonder if it’s better to 
>> create a openbmc/security repo and we can give you and the security 
>> team admin of that repo for this work? This would also provide a 
>> potential location to track github issues for the security team.
> 
> This was my thinking as well Andrew.  I'll create 
> openbmc/security-response if I don't see any complaints in the next 
> little while.
> 
> -brad

I believe we want to make sure that none of security advisories
get sent to Discord, wouldn't want to accidentally be going to
something like #gh-issues.

