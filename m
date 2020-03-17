Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F08188E71
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 20:57:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hkVL4MVvzDqrX
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 06:57:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hkTh1JP9zDqlm
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 06:57:11 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HJo2s9059553; Tue, 17 Mar 2020 15:57:09 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrr5fs40y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 15:57:09 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HJrKMf030877;
 Tue, 17 Mar 2020 19:57:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 2yrpw6awj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 19:57:08 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HJv7RS40239568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 19:57:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0104B2065;
 Tue, 17 Mar 2020 19:57:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98FC5B2064;
 Tue, 17 Mar 2020 19:57:07 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.236.172])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Mar 2020 19:57:07 +0000 (GMT)
Subject: Re: openbmc-specific dynamic security scanner
To: Lee Fisher <lee@preossec.com>, openbmc <openbmc@lists.ozlabs.org>
References: <d2bdd336-88ee-19f7-9215-2c0ede78e3bb@linux.ibm.com>
 <9bb74bdc-bb09-0206-1431-04979e664235@preossec.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <0a426b00-2afa-754e-d3be-bc7b4d44c3d6@linux.ibm.com>
Date: Tue, 17 Mar 2020 14:57:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9bb74bdc-bb09-0206-1431-04979e664235@preossec.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_08:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170073
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

On 3/17/20 1:20 PM, Lee Fisher wrote:
> On 3/17/20 8:01 AM, Joseph Reynolds wrote:
>> [...] And I am looking for your feedback.
> Perhaps, instead of creating a new OpenBMC-centric security tool, add
> OpenBMC-centric tests to an existing firmware security testing tool.
> IMO, there are basically two existing firmware security tools, FWTS and
> CHIPSEC.
>
> FirmWare Test Suite (FWTS) is from Canonical to run diagnostics (not
> necessarily security-centric) to see if a system (HW/FW) is capable of
> running an OS. Runs on multiple ISAs. Has security tests, but not
> security-centric. Probably has the best set of ACPI tests available,
> recommended by UEFI Forum for PC vendors doing ACPI testing. GPL C codebase.
>
> https://launchpad.net/fwts

Lee,

Thanks for responding.

The tests I am proposing are specifically for OpenBMC firmware features, 
not for its hardware or platform features.  So I don't the fwts suite is 
appropriate.

>
> CHIPSEC is a firmware security-centric tool from Intel. It has existing
> security checks that OpenBMC could use. Main downside -- IMO -- is that
> it only works on Intel hardware, no support for
> AMD/ARM/RISC-V/POWER/etc. GPL Python codebase with a bit of asm.
>
> https://github.com/chipsec/chipsec

I've been advised before to use CHIPSEC, but my use case is OpenPOWER, 
and I want this work to be accessible to everyone.
I would be okay if someone else to incorporate the checks I want check 
into CHIPSEC, but I don't think I could use the results.

- Joseph
>
> HTH,
> Lee
> blog: https://firmwaresecurity.com/
>

