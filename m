Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D23E473C
	for <lists+openbmc@lfdr.de>; Mon,  9 Aug 2021 16:10:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GjyfN3HCNz30HV
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 00:10:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nJT6FuUU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nJT6FuUU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjydt4ttkz2ym7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 00:10:10 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179E4Rrn019575; Mon, 9 Aug 2021 10:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YvCSoPpzdvu8+JI8cJEohZflh0HyqdtWftzhnzLqan0=;
 b=nJT6FuUUpat83RpB7zppWz4AenykJTiYz4gNNK/nfCGMPEQxC+xvYlKIDuN/affJjVgd
 OSQnYvbGTY+xwpQHSYbsPJWLT6Xqo9U5HcQeAg7Ylt/CUQkzIOhSgEREUIVp0kQqq/iu
 MrimCTqKb3PfdoAEYRPRF7AkE0aewkSppET+a5gKHXia0VrEnvgFtNQqC6EyqCQHSxIc
 +M5WbGgp+chUw2F8CcHnItE/haU9IPMZhZ7hpIeFbSjriG8xFAvFk2cQNsOlnZ6KTQGe
 1LJTN+0jHucS30txygxbdYiLnBfHFOAdc+2WF+vD5car/FjhlyAcZMzFk99cE8lyYn6a /A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aax6c4c0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 10:10:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179E6DlA001048;
 Mon, 9 Aug 2021 14:10:05 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3a9htashgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 14:10:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179E95v432112924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 14:09:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 547F4112062;
 Mon,  9 Aug 2021 14:09:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13793112063;
 Mon,  9 Aug 2021 14:09:05 +0000 (GMT)
Received: from demeter.local (unknown [9.65.206.251])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Aug 2021 14:09:04 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday August 4 - ibm-acf repo
To: Patrick Williams <patrick@stwcx.xyz>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <YQoIBwTVJZcqTEMU@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <9c7dc355-1926-babc-d329-efdb7ece1a20@linux.ibm.com>
Date: Mon, 9 Aug 2021 09:09:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <YQoIBwTVJZcqTEMU@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 913Llp3kvWYJLWdQuI-0CptKZCemthgY
X-Proofpoint-ORIG-GUID: 913Llp3kvWYJLWdQuI-0CptKZCemthgY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090105
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

On 8/3/21 10:22 PM, Patrick Williams wrote:
> On Tue, Aug 03, 2021 at 05:57:52PM -0500, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting
>> scheduled for this Wednesday August 4 at 10:00am PDT.
>>
>> We'll discuss the following items on the agenda
>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
>> and anything else that comes up:
>>
>>   1. (Joseph): IBM ACF design (2FA authentication for the special IBM
>>      service account) is in review -
>>      https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201
>>      <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201>
> I still feel like the "Alternatives considered" are pretty weak in this
> document.  Rather than paint broad brushes ("Other were considered.  They were
> not suitable.") I think you should enumerate _which_ alternatives were
> considered and _why_ they don't fit the problem at hand.

You're right, I rushed that section.  I will fill in some details. Thanks!

> ```
> - Takes four parameters: machine serial number, expiration date, password, and
>    private key.
> - Algorithm:
>     - Hashes the password.
>     - Creates the ACF from the hashed password, serial number, and expiration date.
>     - Digitally signs the ACF using the private key.
>     - Returns the ACF to the caller.
> ```
>
> This sounds a lot like U2F.  The "4 parameters" are the challenge, IBM's key
> signing server is the U2F device, and PAM is the "Relying Party".  There are
> already PAM modules for some aspects of U2F and the token you need to exchange
> is reasonably short (my Yubikey output is 33 characters).
>
> https://developers.yubico.com/U2F/Protocol_details/Overview.html
>
> The nice aspect if you can reuse portions of the U2F protocol is that you go a
> long way towards enabling others to add more typical 2FA like Yubikeys.

We discussed this an email exchange ending 2021 March 9 "Request new 
repo for IBM-specific code - pam_2fa discussion".  Although I could use 
the U2F module, it is not a good fit because the ACF credential flow 
does not fit well under the U2F protocol.  I'll excerpt that 
conversation and add details to the design.

Joseph

