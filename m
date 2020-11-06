Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505942A9F01
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 22:24:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSYLv73MbzDrQR
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 08:24:55 +1100 (AEDT)
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
 header.s=pp1 header.b=VzNTh6o5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSYL42XmVzDrPR
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2020 08:24:11 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6L376R076417; Fri, 6 Nov 2020 16:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iseWeqqKyaOPCZ+Mfr0u7SGrw0Q1m7LO63LqIvsqPkA=;
 b=VzNTh6o588RZOBx1Kfe9Y5WEKPpYCqRVPSu2KAzHlGC5cAPAXa9uyKG7gFcFZYuXGPn/
 1kpNayUWHgkLVKhvSjWb1v4L/VJJRHBX1ZpULT6QTijhvhGxF2xdKTeH4rkIuo7OoW4e
 5wwbxGwi1AVrDLGxHkHZcLZzFjCtm3bdCpAshxbv3cMZlxon67hVdgoka9931xczv6r0
 2ZGPr/m2vkkHBtG2yWxUuQXl/M78rCfEH5e+VpvWAtQDbhWm0FYVSY1sE5yX1mYpdDAP
 cc049TGdVvlH9Cv+ytDmn9Wyy25GRbJCNSLpo8wLMd1p8SAcp4t7szuEDObMdKvUuvY/ 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34nd6khsrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 16:24:08 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A6LD4fX146001;
 Fri, 6 Nov 2020 16:24:07 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34nd6khsqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 16:24:07 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6LHqJc005334;
 Fri, 6 Nov 2020 21:24:06 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 34h0ejjvqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 21:24:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A6LO5In8126984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 21:24:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC296A04F;
 Fri,  6 Nov 2020 21:24:05 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7631A6A047;
 Fri,  6 Nov 2020 21:24:04 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.194.76])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Nov 2020 21:24:04 +0000 (GMT)
Subject: Re: Secure boot/signed images and GPL code
To: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
 <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
 <20201106171745.GA25199@mauery.jf.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <2fad4703-bb25-c94b-a91a-f618962fe176@linux.ibm.com>
Date: Fri, 6 Nov 2020 15:24:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106171745.GA25199@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060144
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
Cc: cjengel@us.ibm.com, openbmc@lists.ozlabs.org,
 Deepak Kodihalli <deepak.kodihalli.83@gmail.com>, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/6/20 11:19 AM, Vernon Mauery wrote:
> On 03-Nov-2020 02:56 PM, Patrick Williams wrote:
>>
>> In the doc you pointed to, I asked how key transition works, but the
>> doc hasn't been updated to better describe it yet[2].  The initial
>> response makes it seem like the AST2600 OTP doesn't give a whole lot of
>> capabilities here, which is fairly concerning.  I know there are some
>> design proposals that use a secondary device to assist with
>> secureboot[3,4,5] which might better handle key transition.
>
> You are right, the AST2600 OTP leaves something to be desired. If all 
> the key regions are not initially programmed, it is possible to 
> program a new key, deprecate all the old keys, and take control of the 
> system. But programming all the keys prevents transferring the system 
> from one owner to another (where the owner is the one providing 
> firmware).
>
> Storing and provisioning keys is hardest part of any crypto system. If 
> we have ideas on how to make the AST2700 better, Aspeed has engineers 
> on this list and would probably like to hear any great ideas.

The OCP (Open Compute Project) Security Project has ongoing discussions 
on similar topics including secure transfer of ownership, secure boot, 
and secure recovery.

I don't have more details because it's not my technical area.  The wiki 
has links to OCP Security goals, papers, and their meetings.
https://www.opencompute.org/wiki/Security

- Joseph

>
> --Vernon
>

