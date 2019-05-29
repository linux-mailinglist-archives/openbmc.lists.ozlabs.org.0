Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 441352E114
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 17:30:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DZR15g1szDqLV
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 01:30:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DZQV2zbxzDqHw
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 01:29:53 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TFM6wf121785
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 11:29:51 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ssv3x9s33-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 11:29:51 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 29 May 2019 16:29:50 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 16:29:47 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TFTkAd19268048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 15:29:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21BFBC6059;
 Wed, 29 May 2019 15:29:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAE8DC6057;
 Wed, 29 May 2019 15:29:45 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 May 2019 15:29:45 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 29 May 2019 10:30:29 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: U-Boot environment management from userspace
In-Reply-To: <20190528183802.GH15959@mauery.jf.intel.com>
References: <20190528183802.GH15959@mauery.jf.intel.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19052915-0004-0000-0000-00001515AAC0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210319; UDB=6.00635876; IPR=6.00991352; 
 MB=3.00027104; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 15:29:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052915-0005-0000-0000-00008BD9E1FF
Message-Id: <e42fb92effbc990f60239377b05e3f4e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290101
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Am I the only one that has a need for this or is there a wider
> audience that would benefit?

The software manager (phosphor-bmc-code-mgmt) relies on U-Boot 
environment
variables for managing the images like for determining which image to 
boot
from.

> 3) Use a one-shot service that parses the 'instance' to extract a
> variable name and variable value. Then the variable could be activated
> by launching ubootenv@foo=bar.service. This would require some fancy
> parameter encoding to make it all work correctly to avoid string
> injections.

Yeah, we went that route with an obmc-flash-bmc-setenv@.service[1], with
like you mentioned uses some 'fancy parameter encoding', ex:
"obmc-flash-bmc-setenv@" + entryId + "\\x3d" + std::to_string(value) + 
".service";

This has worked so far but I'd be open on having a mapping of the env
variables to D-Bus properties.

> Reading U-Boot environment variables from userspace is not difficult,
> but to do it in a standard way, (fw_printenv), it requires a fork and
> exec.

We're actually reading the mtd device to get the values of the variables
to avoid having a 'system' or 'fork/exec' call, then we put those values
in D-Bus properties under the software/ path. Having some other app do 
that
parsing would be nice especially if we're to expand the use of the 
U-Boot
env vars.

---
[1] 
https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/obmc-flash-bmc-setenv%40.service


