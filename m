Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B61D876E
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:28:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tK6C0sFRzDqQm
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 15:28:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tK5c4VnqzDqLj
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 15:27:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9G4RNln027222; Wed, 16 Oct 2019 00:27:28 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vnrysvxr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 00:27:23 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9G4QtZ2012296;
 Wed, 16 Oct 2019 04:26:57 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2vk6f7hn11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 04:26:57 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9G4Qu2j50790790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 04:26:56 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7418112067;
 Wed, 16 Oct 2019 04:26:56 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97494112065;
 Wed, 16 Oct 2019 04:26:56 +0000 (GMT)
Received: from demeter.local (unknown [9.80.231.35])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Oct 2019 04:26:56 +0000 (GMT)
Subject: Re: "No Hardware Required" qemu-system-arm no services running Ports
 80, 443, and 623, why?
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <8b5e67d9cd5d478b9ceb1201c56fc25a@SCL-EXCHMB-13.phoenix.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <0cbedae3-502b-3d7a-7cc5-0b46f0c1a23e@linux.ibm.com>
Date: Tue, 15 Oct 2019 23:26:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8b5e67d9cd5d478b9ceb1201c56fc25a@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160040
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

On 10/15/19 1:49 PM, Bruce Mitchell wrote:
>
> Hello,
>
> In the 11/3/2016 CAusten-OpenBMC.pdf presentation it is stated, on 
> page 12 of 18, "No Hardware Required".
>
> I have obmc-phosphor-image-romulus.static.mtd and 
> obmc-phosphor-image-s2600wf-20191004165402.static.mtd
>
> booting with qemu-system-arm and login in, however neither have any 
> TCP servers running on Ports 80, 443, and 623.
>
> So what am I missing in the process?
>

Just a hunch...  The updated docs are in: 
https://github.com/openbmc/docs/blob/master/development/README.md
Specifically, the "Development Environment Setup" doc walks you through 
how you can run your OpenBMC firmware image on an QEMU virtual BMC, and 
it talks about mapping ports 443 etc. from your test host to your QEMU 
system.

There are customized instructions for developing for BMCWeb here: 
https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md

I was able to follow those instructions to download a QEMU image and 
start it, build a customized version of bmcweb and upload it to the QEMU 
system, and connect to bmcweb via (mapped) port 2443.


If you are looking to build a firmware image from scratch, I assume you 
found: https://github.com/openbmc/openbmc/blob/master/README.md
The "OpenBMC Cheatsheet" link has more details about how to build a QEMU 
system, map portts, etc.

- Joseph

> Thank you.
>
> --
>
> Bruce Mitchell
>
> BMC Engineer
>
> 503-567-3032 direct
>
> bruce_mitchell@phoenix.com
>
> Phoenix Technologies Ltd.
>
> 15266 NW Greenbrier Pkwy
>
> Beaverton, OR 97006 USA
>
> 503-567-3000 main
>
> www.phoenix.com <http://www.phoenix.com>
>

